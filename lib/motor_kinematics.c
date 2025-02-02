#include <string.h>

#include "motor_kinematics.h"
#include "manipulators.h"
#include "peripheral.h"
#include "gpio_map.h"

#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"

#include "math.h"
#include "arm_math.h"

#include "uros_interfaces.h"
#include <geometry_msgs/msg/twist.h>

/*
 * micro-ROS related structures
 */

extern uros_t uros_data;

typedef struct motor_uros {
        rcl_subscription_t subscriber;
        geometry_msgs__msg__Twist target;
        rclc_executor_t executor;
} motor_uros_t;

static motor_uros_t * motor_sub;

/*
 * Main motor kinematics control structure
 */
static motors_ctrl_t *mk_ctrl = NULL;

/*
 * Set of private helper functions
 */
static void mk_speed2pwm(motors_ctrl_t *mk_ctrl)
{
        /*
         * Matrices for calculation of wheel speed
         * 1st - linear components
         * 2nd - rotational components
         */
        static arm_matrix_instance_f32 m_fk_lin;
        static float fk_linear[9] = {MK_LIN_KIN_MATRIX};
        static arm_matrix_instance_f32 m_fk_rot;
        static float fk_rotational[9] = {MK_ROT_KIN_MATRIX};
        /*
         * For calculated rotational speeds (in rad/s)
         * Note: both terms
         */
        static arm_matrix_instance_f32 m_lin_sp;
        static float lin_sp[3] = {0.0f};
        static arm_matrix_instance_f32 m_rot_sp;
        static float rot_sp[3] = {0.0f};
        /*
         * Final speed (casted and normalized)
         */
        static arm_matrix_instance_f32 m_speed;
        static float speed[3] = {0.0f};
        /*
         * Input linear speed in robot's coordinate system
         */
        static arm_matrix_instance_f32 m_input_sp;
        static float input_speed[3] = {0.0f};
        input_speed[0] = mk_ctrl->vel_x;
        input_speed[1] = mk_ctrl->vel_y;
        input_speed[2] = mk_ctrl->wz;
        /*
         * max and min value in resulting matrix
         */
        static float max_sp, min_sp;
        /*
         * Calibration parameters to convert angular speed to pwm
         * values
         */
        static float pwm_cal_a[3] = {MK_SPEED2PWM_A};
        float pwm_cal_b[3] = {MK_SPEED2PWM_B};
        /*
         * Index for calculating PWM for each motor
         */
        int motor_index = 0;

        /*
         * Init arm_math matrice data structures
         */
        arm_mat_init_f32(&m_fk_lin, 3, 3, fk_linear);
        arm_mat_init_f32(&m_fk_rot, 3, 3, fk_rotational);
        arm_mat_init_f32(&m_lin_sp, 3, 1, lin_sp);
        arm_mat_init_f32(&m_rot_sp, 3, 1, rot_sp);
        arm_mat_init_f32(&m_speed, 3, 1, speed);
        arm_mat_init_f32(&m_input_sp, 3, 1, input_speed);
        /*
         * Calculate linear components
         */
        arm_mat_mult_f32(&m_fk_lin, &m_input_sp, &m_lin_sp);
        /*
         * Calculate rotational part
         */
        arm_mat_mult_f32(&m_fk_rot, &m_input_sp, &m_rot_sp);
        /*
         * Sum both components
         */
        arm_mat_add_f32(&m_lin_sp, &m_rot_sp, &m_speed);
        /*
         * Find max and min values and fit speeds to the absolute max one
         */
        arm_max_f32(speed, 3, &max_sp, NULL);
        arm_min_f32(speed, 3, &min_sp, NULL);
        if (max_sp < fabsf(min_sp))
                max_sp = -min_sp;
        if (max_sp > MK_MAX_ROT_SPEED)
                arm_mat_scale_f32(&m_speed, MK_MAX_ROT_SPEED/max_sp, &m_speed);
        /*
         * Convert rot/s to pwm normalized values
         */
        arm_mult_f32(speed, pwm_cal_a, speed, 3);
        for (motor_index = 0 ; motor_index < 3 ; motor_index++) {
            if(speed[motor_index] < 0)
                pwm_cal_b[motor_index] *= -1;
        }
        arm_add_f32(speed, pwm_cal_b, mk_ctrl->pwm_motors, 3);
        return;
}

static void mk_set_pwm(float *pwm_values)
{
        if (pwm_values[0] > 0.0f)
                LL_GPIO_SetOutputPin(MOTOR_CH1_DIR_PORT, MOTOR_CH1_DIR_PIN);
        else
                LL_GPIO_ResetOutputPin(MOTOR_CH1_DIR_PORT, MOTOR_CH1_DIR_PIN);
        LL_TIM_OC_SetCompareCH1(MOTOR_TIM, (uint32_t)(fabsf(pwm_values[0]) *
                                MOTOR_PWM_TIM_ARR));

        if (pwm_values[1] > 0.0f)
                LL_GPIO_SetOutputPin(MOTOR_CH2_DIR_PORT, MOTOR_CH2_DIR_PIN);
        else
                LL_GPIO_ResetOutputPin(MOTOR_CH2_DIR_PORT, MOTOR_CH2_DIR_PIN);
        LL_TIM_OC_SetCompareCH2(MOTOR_TIM, (uint32_t)(fabsf(pwm_values[1]) *
                                MOTOR_PWM_TIM_ARR));

        if (pwm_values[2] > 0.0f)
                LL_GPIO_SetOutputPin(MOTOR_CH3_DIR_PORT, MOTOR_CH3_DIR_PIN);
        else
                LL_GPIO_ResetOutputPin(MOTOR_CH3_DIR_PORT, MOTOR_CH3_DIR_PIN);
        LL_TIM_OC_SetCompareCH3(MOTOR_TIM, (uint32_t)(fabsf(pwm_values[2]) *
                                MOTOR_PWM_TIM_ARR));


        return;
}

static void mk_hw_config()
{
        /* Init motor_kinematics pins */
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOD);
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOA);
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOE);
        LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_TIM4);

        /* Config direction pins */
        LL_GPIO_SetPinMode(MOTOR_CH1_DIR_PORT, MOTOR_CH1_DIR_PIN,
                           LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinOutputType(MOTOR_CH1_DIR_PORT, MOTOR_CH1_DIR_PIN,
                                 LL_GPIO_OUTPUT_PUSHPULL);
        LL_GPIO_SetPinPull(MOTOR_CH1_DIR_PORT, MOTOR_CH1_DIR_PIN,
                           LL_GPIO_PULL_NO);

        LL_GPIO_SetPinMode(MOTOR_CH2_DIR_PORT, MOTOR_CH2_DIR_PIN,
                           LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinOutputType(MOTOR_CH2_DIR_PORT, MOTOR_CH2_DIR_PIN,
                                 LL_GPIO_OUTPUT_PUSHPULL);
        LL_GPIO_SetPinPull(MOTOR_CH2_DIR_PORT, MOTOR_CH2_DIR_PIN,
                           LL_GPIO_PULL_NO);

        LL_GPIO_SetPinMode(MOTOR_CH3_DIR_PORT, MOTOR_CH3_DIR_PIN,
                           LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinOutputType(MOTOR_CH3_DIR_PORT, MOTOR_CH3_DIR_PIN,
                                 LL_GPIO_OUTPUT_PUSHPULL);
        LL_GPIO_SetPinPull(MOTOR_CH3_DIR_PORT, MOTOR_CH3_DIR_PIN,
                           LL_GPIO_PULL_NO);

        /* Config PWM pins */
        LL_GPIO_SetPinMode(MOTOR_CH_PWM_PORT, MOTOR_CH1_PWM_PIN,
                           LL_GPIO_MODE_ALTERNATE);
        LL_GPIO_SetAFPin_8_15(MOTOR_CH_PWM_PORT, MOTOR_CH1_PWM_PIN,
                              MOTOR_CH_PWM_PIN_AF);
        LL_GPIO_SetPinOutputType(MOTOR_CH_PWM_PORT, MOTOR_CH1_PWM_PIN,
                                 LL_GPIO_OUTPUT_PUSHPULL);

        LL_GPIO_SetPinMode(MOTOR_CH_PWM_PORT, MOTOR_CH2_PWM_PIN,
                           LL_GPIO_MODE_ALTERNATE);
        LL_GPIO_SetAFPin_8_15(MOTOR_CH_PWM_PORT, MOTOR_CH2_PWM_PIN,
                              MOTOR_CH_PWM_PIN_AF);
        LL_GPIO_SetPinOutputType(MOTOR_CH_PWM_PORT, MOTOR_CH2_PWM_PIN,
                                 LL_GPIO_OUTPUT_PUSHPULL);

        LL_GPIO_SetPinMode(MOTOR_CH_PWM_PORT, MOTOR_CH3_PWM_PIN,
                           LL_GPIO_MODE_ALTERNATE);
        LL_GPIO_SetAFPin_8_15(MOTOR_CH_PWM_PORT, MOTOR_CH3_PWM_PIN,
                              MOTOR_CH_PWM_PIN_AF);
        LL_GPIO_SetPinOutputType(MOTOR_CH_PWM_PORT, MOTOR_CH3_PWM_PIN,
                                 LL_GPIO_OUTPUT_PUSHPULL);

        /* Init timer in PWM mode */
        LL_TIM_EnableUpdateEvent(MOTOR_TIM);
        LL_TIM_SetClockDivision(MOTOR_TIM, LL_TIM_CLOCKDIVISION_DIV4);
        LL_TIM_SetCounterMode(MOTOR_TIM, LL_TIM_COUNTERMODE_UP);
        LL_TIM_SetAutoReload(MOTOR_TIM, MOTOR_PWM_TIM_ARR);
        LL_TIM_SetUpdateSource(MOTOR_TIM, LL_TIM_UPDATESOURCE_REGULAR);

        /* Enable capture mode */
        LL_TIM_CC_EnableChannel(MOTOR_TIM, LL_TIM_CHANNEL_CH1 |
                                LL_TIM_CHANNEL_CH2 | LL_TIM_CHANNEL_CH3);

        /* Set PWM mode */
        LL_TIM_OC_SetMode(MOTOR_TIM, LL_TIM_CHANNEL_CH1, LL_TIM_OCMODE_PWM1);
        LL_TIM_OC_SetMode(MOTOR_TIM, LL_TIM_CHANNEL_CH2, LL_TIM_OCMODE_PWM1);
        LL_TIM_OC_SetMode(MOTOR_TIM, LL_TIM_CHANNEL_CH3, LL_TIM_OCMODE_PWM1);

        /* Enable fast mode */
        LL_TIM_OC_EnableFast(MOTOR_TIM, LL_TIM_CHANNEL_CH1);
        LL_TIM_OC_EnableFast(MOTOR_TIM, LL_TIM_CHANNEL_CH2);
        LL_TIM_OC_EnableFast(MOTOR_TIM, LL_TIM_CHANNEL_CH3);

        /* Enable preload */
        LL_TIM_OC_EnablePreload(MOTOR_TIM, LL_TIM_CHANNEL_CH1);
        LL_TIM_OC_EnablePreload(MOTOR_TIM, LL_TIM_CHANNEL_CH2);
        LL_TIM_OC_EnablePreload(MOTOR_TIM, LL_TIM_CHANNEL_CH3);
        LL_TIM_EnableARRPreload(MOTOR_TIM);

        /* Set initial value */
        LL_TIM_OC_SetCompareCH1(MOTOR_TIM, MOTOR_PWM_TIM_CCR_INIT);
        LL_TIM_OC_SetCompareCH2(MOTOR_TIM, MOTOR_PWM_TIM_CCR_INIT);
        LL_TIM_OC_SetCompareCH3(MOTOR_TIM, MOTOR_PWM_TIM_CCR_INIT);

        /* Enable timer */
        LL_TIM_GenerateEvent_UPDATE(MOTOR_TIM);
        LL_TIM_EnableCounter(MOTOR_TIM);

        /* Setting cord pin */
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOE);
        LL_GPIO_SetPinMode(MOTOR_CORD_PORT, MOTOR_CORD_PIN, LL_GPIO_MODE_INPUT);
        LL_GPIO_SetPinPull(MOTOR_CORD_PORT, MOTOR_CORD_PIN, LL_GPIO_PULL_NO);

        /* Setting strategy button */   
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOE);
        LL_GPIO_SetPinMode(MOTOR_STRATEGY_PORT, MOTOR_STRATEGY_PIN,
                           LL_GPIO_MODE_INPUT);
        LL_GPIO_SetPinPull(MOTOR_STRATEGY_PORT, MOTOR_STRATEGY_PIN,
                           LL_GPIO_PULL_NO);
        /* Setting up interrupt */
        LL_APB2_GRP1_EnableClock(LL_APB2_GRP1_PERIPH_SYSCFG);
        LL_SYSCFG_SetEXTISource(MOTOR_STRATEGY_SYS_EXTI_PORT,
                                MOTOR_STRATEGY_SYS_EXTI_LINE);
        LL_EXTI_EnableIT_0_31(MOTOR_STRATEGY_EXTI_LINE);
        LL_EXTI_EnableRisingTrig_0_31(MOTOR_STRATEGY_EXTI_LINE);
        LL_EXTI_EnableFallingTrig_0_31(MOTOR_STRATEGY_EXTI_LINE);
        NVIC_SetPriority(MOTOR_STRATEGY_IRQN, MOTOR_STRATEGY_IRQN_PRIORITY);
        NVIC_EnableIRQ(MOTOR_STRATEGY_IRQN);

        /* Setting side switcher pin */
        LL_GPIO_SetPinMode(MOTOR_SIDE_SW_PORT, MOTOR_SIDE_SW_PIN,
                           LL_GPIO_MODE_INPUT);
        LL_GPIO_SetPinPull(MOTOR_SIDE_SW_PORT, MOTOR_SIDE_SW_PIN,
                           LL_GPIO_PULL_NO);

        /* Setting robot operating timer */
        LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_TIM7);
        LL_TIM_SetCounterMode(MOTOR_OPERATING_TIM, LL_TIM_COUNTERMODE_UP);
        LL_TIM_SetAutoReload(MOTOR_OPERATING_TIM, MOTOR_OPERATING_TIM_ARR);
        LL_TIM_SetPrescaler(MOTOR_OPERATING_TIM, MOTOR_OPERATING_TIM_PSC);
        LL_TIM_EnableIT_UPDATE(MOTOR_OPERATING_TIM);

        /* Setting robot operating timer interrupt */
        NVIC_SetPriority(MOTOR_OPERATING_TIM_IRQN,
                         MOTOR_OPERATING_TIM_IRQN_PRIORITY);
        NVIC_EnableIRQ(MOTOR_OPERATING_TIM_IRQN);

        /* Config LED pins */
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOC);
        LL_GPIO_SetPinMode(LED_PORT, LED_RED_PIN,
                           LL_GPIO_MODE_ALTERNATE);
        LL_GPIO_SetAFPin_0_7(LED_PORT, LED_RED_PIN,
                              LED_PIN_AF);
        LL_GPIO_SetPinOutputType(LED_PORT, LED_RED_PIN,
                                 LL_GPIO_OUTPUT_PUSHPULL);
        LL_GPIO_SetPinPull(LED_PORT,LED_RED_PIN,LL_GPIO_PULL_NO);
        LL_GPIO_SetPinSpeed(LED_PORT,LED_RED_PIN,LL_GPIO_SPEED_FREQ_HIGH);

        LL_GPIO_SetPinMode(LED_PORT, LED_GREEN_PIN,
                           LL_GPIO_MODE_ALTERNATE);
        LL_GPIO_SetAFPin_0_7(LED_PORT, LED_GREEN_PIN,
                              LED_PIN_AF);
        LL_GPIO_SetPinOutputType(LED_PORT, LED_GREEN_PIN,
                                 LL_GPIO_OUTPUT_PUSHPULL);
        LL_GPIO_SetPinPull(LED_PORT,LED_GREEN_PIN,LL_GPIO_PULL_NO);
        LL_GPIO_SetPinSpeed(LED_PORT,LED_GREEN_PIN,LL_GPIO_SPEED_FREQ_HIGH);

        LL_GPIO_SetPinMode(LED_PORT, LED_BLUE_PIN,
                           LL_GPIO_MODE_ALTERNATE);
        LL_GPIO_SetAFPin_8_15(LED_PORT, LED_BLUE_PIN,
                              LED_PIN_AF);
        LL_GPIO_SetPinOutputType(LED_PORT, LED_BLUE_PIN,
                                 LL_GPIO_OUTPUT_PUSHPULL);
        LL_GPIO_SetPinPull(LED_PORT,LED_BLUE_PIN,LL_GPIO_PULL_NO);
        LL_GPIO_SetPinSpeed(LED_PORT,LED_BLUE_PIN,LL_GPIO_SPEED_FREQ_HIGH);

        /* Init timer in PWM mode */
        LL_APB2_GRP1_EnableClock(LL_APB2_GRP1_PERIPH_TIM8);
        LL_TIM_EnableUpdateEvent(LED_TIM);
        LL_TIM_SetClockDivision(LED_TIM, LL_TIM_CLOCKDIVISION_DIV4);
        LL_TIM_SetCounterMode(LED_TIM, LL_TIM_COUNTERMODE_UP);
        LL_TIM_SetAutoReload(LED_TIM, LED_TIM_ARR);
        LL_TIM_SetUpdateSource(LED_TIM, LL_TIM_UPDATESOURCE_REGULAR);

        /* Enable capture mode */
        LL_TIM_CC_EnableChannel(LED_TIM, LL_TIM_CHANNEL_CH1 |
                                LL_TIM_CHANNEL_CH2 | LL_TIM_CHANNEL_CH3);

        /* Set PWM mode */
        LL_TIM_OC_SetMode(LED_TIM, LL_TIM_CHANNEL_CH1, LL_TIM_OCMODE_PWM1);
        LL_TIM_OC_SetMode(LED_TIM, LL_TIM_CHANNEL_CH2, LL_TIM_OCMODE_PWM1);
        LL_TIM_OC_SetMode(LED_TIM, LL_TIM_CHANNEL_CH3, LL_TIM_OCMODE_PWM1);

        /* Enable fast mode */
        LL_TIM_OC_EnableFast(LED_TIM, LL_TIM_CHANNEL_CH1);
        LL_TIM_OC_EnableFast(LED_TIM, LL_TIM_CHANNEL_CH2);
        LL_TIM_OC_EnableFast(LED_TIM, LL_TIM_CHANNEL_CH3);

        /* Enable preload */
        LL_TIM_OC_EnablePreload(LED_TIM, LL_TIM_CHANNEL_CH1);
        LL_TIM_OC_EnablePreload(LED_TIM, LL_TIM_CHANNEL_CH2);
        LL_TIM_OC_EnablePreload(LED_TIM, LL_TIM_CHANNEL_CH3);
        LL_TIM_EnableARRPreload(LED_TIM);

        LL_TIM_OC_EnableClear(LED_TIM,LL_TIM_CHANNEL_CH1);
        LL_TIM_OC_EnableClear(LED_TIM,LL_TIM_CHANNEL_CH2);
        LL_TIM_OC_EnableClear(LED_TIM,LL_TIM_CHANNEL_CH3);

        /* Disable advanced fetures of the timer*/
        LL_TIM_DisableMasterSlaveMode(LED_TIM);
        LL_TIM_CC_SetLockLevel(LED_TIM,LL_TIM_LOCKLEVEL_OFF);
        LL_TIM_OC_SetDeadTime(LED_TIM,0);
        LL_TIM_DisableBRK(LED_TIM);
        LL_TIM_ConfigBRK(LED_TIM,LL_TIM_BREAK_POLARITY_HIGH);
        LL_TIM_SetOffStates(LED_TIM,LL_TIM_OSSI_DISABLE,LL_TIM_OSSR_DISABLE);
        LL_TIM_EnableAutomaticOutput(LED_TIM);

        /* Set initial value */
        LL_TIM_OC_SetCompareCH1(LED_TIM, LED_TIM_CCR_INIT);
        LL_TIM_OC_SetCompareCH2(LED_TIM, LED_TIM_CCR_INIT);
        LL_TIM_OC_SetCompareCH3(LED_TIM, LED_TIM_CCR_INIT);

        /* Enable timer */
        LL_TIM_GenerateEvent_UPDATE(LED_TIM);
        LL_TIM_EnableCounter(LED_TIM);
        LL_TIM_EnableAllOutputs(LED_TIM);

        /* Setting robot dynamics timer */
        LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_TIM14);
        LL_TIM_SetCounterMode(MOTOR_TR_TIM, LL_TIM_COUNTERMODE_UP);
        LL_TIM_SetAutoReload(MOTOR_TR_TIM, MOTOR_TR_TIM_ARR);
        LL_TIM_SetPrescaler(MOTOR_TR_TIM, MOTOR_TR_TIM_PSC);
        LL_TIM_EnableIT_UPDATE(MOTOR_TR_TIM);

        /* Setting robot operating timer interrupt */
        NVIC_SetPriority(MOTOR_TR_TIM_IRQN,
                         MOTOR_TR_TIM_IRQN_PRIORITY);
        NVIC_EnableIRQ(MOTOR_TR_TIM_IRQN);

        return;
}

static void mk_set_pwm_ctrl(motors_ctrl_t *mk_ctrl)
{
        mk_ctrl->status |= MK_PWM_CONTROL;
        mk_ctrl->status &= ~MK_SPEED_CONTROL;
        return;
}

static void mk_set_speed_ctrl(motors_ctrl_t *mk_ctrl)
{
        mk_ctrl->status |= MK_SPEED_CONTROL;
        mk_ctrl->status &= ~MK_PWM_CONTROL;
        return;
}

static void mk_set_stop_motors_ctrl(motors_ctrl_t *mk_ctrl)
{
        mk_ctrl->status |= MK_STOP_MOTORS;
        return;
}

static void mk_clr_stop_motors_ctrl(motors_ctrl_t *mk_ctrl)
{
        mk_ctrl->status &= ~(MK_STOP_MOTORS);
        return;
}

static uint8_t read_cord_status(void)
{
        return (uint8_t) LL_GPIO_IsInputPinSet(MOTOR_CORD_PORT, MOTOR_CORD_PIN);
}

static uint8_t read_side_switch(void)
{
        return (uint8_t) LL_GPIO_IsInputPinSet(MOTOR_SIDE_SW_PORT,
                                               MOTOR_SIDE_SW_PIN);
}

static void led_red(void)
{
        LL_TIM_OC_SetCompareCH1(LED_TIM, (uint32_t)( 1));
        LL_TIM_OC_SetCompareCH2(LED_TIM, (uint32_t)( 1 ));
        LL_TIM_OC_SetCompareCH3(LED_TIM, (uint32_t)( 0.98 * LED_TIM_ARR ));
        return;
}

static void led_yellow(void)
{
        LL_TIM_OC_SetCompareCH1(LED_TIM, (uint32_t)( 1 ));
        LL_TIM_OC_SetCompareCH2(LED_TIM, (uint32_t)( 0.98 * LED_TIM_ARR ));
        LL_TIM_OC_SetCompareCH3(LED_TIM, (uint32_t)( 0.98 * LED_TIM_ARR ));
        return;
}
static void led_blue(void)
{
        LL_TIM_OC_SetCompareCH1(LED_TIM, (uint32_t)( 0.98 * LED_TIM_ARR ));
        LL_TIM_OC_SetCompareCH2(LED_TIM, (uint32_t)( 1 ));
        LL_TIM_OC_SetCompareCH3(LED_TIM, (uint32_t)( 1 ));
        return;
}
static void led_cyan(void)
{
        LL_TIM_OC_SetCompareCH1(LED_TIM, (uint32_t)( 0.9 * LED_TIM_ARR ));
        LL_TIM_OC_SetCompareCH2(LED_TIM, (uint32_t)( 0.9 * LED_TIM_ARR ));
        LL_TIM_OC_SetCompareCH3(LED_TIM, (uint32_t)( 1 ));
        return;
}

static void turn_off_all_motors(void)
{
        static float stop_motors[] = {0.0f, 0.0f, 0.0f};

        /*
         * Turn off maxons
         */
        mk_set_stop_motors_ctrl(mk_ctrl);
        mk_set_pwm(stop_motors);
        /*
         * Turn off manipulators
         */
        manipulators_block();
        led_red();
        return;
}

/*
 * End of section with helper functions
 */

/*
 * Srart of micro-ROS section
 */

void subscription_callback(const void * msgin)
{
	const geometry_msgs__msg__Twist * msg = (const geometry_msgs__msg__Twist *)msgin;

        if (!mk_ctrl) 
                return;

        xSemaphoreTake(mk_ctrl->lock, portMAX_DELAY);
        mk_set_speed_ctrl(mk_ctrl);
        mk_ctrl->vel_x = msg->linear.x;
        mk_ctrl->vel_y = msg->linear.y;
        mk_ctrl->wz = msg->angular.z;
        xSemaphoreGive(mk_ctrl->lock);

        xTaskNotifyGive(mk_ctrl->mk_notify);
}

static void uros_motors_init_control(void)
{      
        while (uros_data.ready != 1 && uros_data.connected != 1) {
                vTaskDelay(100 * portTICK_PERIOD_MS);
        }

        motor_sub->target.linear.x = 0.f;
        motor_sub->target.linear.y = 0.f;
        motor_sub->target.angular.z = 0.f;

        RCCHECK(rclc_subscription_init_default(
		&motor_sub->subscriber,
		&uros_data.node,
		ROSIDL_GET_MSG_TYPE_SUPPORT(geometry_msgs, msg, Twist),
		"/cmd_vel"));

        RCCHECK(rclc_executor_init(&motor_sub->executor, &uros_data.support.context, 1, &uros_data.allocator));
	RCCHECK(rclc_executor_add_subscription(
                &motor_sub->executor, 
                &motor_sub->subscriber, 
                &motor_sub->target, 
                &subscription_callback, ON_NEW_DATA));
}

/*
 * End of micro-ROS section
 */

/*
 * Main motor kinematics task running by FreeRTOS
 */
void motor_kinematics(void *arg)
{
        (void) arg;

        /*
         * Proper initialization of main motor
         * control structure
         * All pwm values are set to be 10% of max to avoid reset
         * of Maxon motors (his majesty does not like to reseted
         * as he is pricey)
         */
        motors_ctrl_t mk_ctrl_st = {
                .status = 0x00,
                .session = ROBOT_SESSION_COMPETITION,
                .cord_status = 0,
                .strategy_num = 0,
                .strategy_update_time = 0,
                .side = ROBOT_SIDE_RIGHT,
                .vel_x = 0.0f,
                .vel_y = 0.0f,
                .wz = 0.0f,
                .pwm_motors = {0.1f, 0.1f, 0.1f},
                .prev_pwm_motors = {0.1f, 0.1f, 0.1f},
                .prev_ticks = 0
        };

        mk_hw_config();
        mk_ctrl_st.lock = xSemaphoreCreateMutexStatic(&mutex_buffer);
        mk_ctrl_st.mk_notify = xTaskGetCurrentTaskHandle();
        mk_ctrl = &mk_ctrl_st;

        motor_uros_t uros_motor;
        motor_sub = &uros_motor;
        uros_motors_init_control();

        /*
         * Stop motors and wait for starting cord
         */
        mk_set_pwm(mk_ctrl->pwm_motors);
        while (1) {
                ulTaskNotifyTake(pdTRUE, portMAX_DELAY);
                xSemaphoreTake(mk_ctrl->lock, portMAX_DELAY);
                /*
                 * If one stopped motors immediately reset all pwm values
                 */
                if (mk_ctrl->status & MK_STOP_MOTORS) {
                        mk_ctrl->pwm_motors[0] = 0.0f;
                        mk_ctrl->pwm_motors[1] = 0.0f;
                        mk_ctrl->pwm_motors[2] = 0.0f;
                }
                /*
                 * If motors are allowed to be running and control
                 * was switched to speed mode call mk_speed2pwm to calculate
                 * matrix kinematics
                 */
                if (mk_ctrl->status & MK_SPEED_CONTROL &&
                    !(mk_ctrl->status & MK_STOP_MOTORS)) {
                        mk_speed2pwm(mk_ctrl);
                }
                /*
                 * In the end all pwm values shall be updated and lock
                 * released.
                 */
                LL_TIM_EnableCounter(MOTOR_TR_TIM);
                //mk_set_pwm(mk_ctrl->prev_pwm_motors);
                rclc_executor_spin_some(&uros_motor.executor, RCL_MS_TO_NS(10));
                xSemaphoreGive(mk_ctrl->lock);
        }
        return;
}

/*
 * Set of motor related handlers for terminal
 */

/*
 * Command for setting debug session. In debug session ignore starting cord
 * and robot operating timer
 */
int cmd_set_robot_session(void *args)
{
        /*
         * Check whether kinematics ready or not
         */
        if (!mk_ctrl)
                goto error_set_robot_session;

        mk_ctrl->session = ROBOT_SESSION_DEBUG;
        mk_clr_stop_motors_ctrl(mk_ctrl);
        led_cyan();
        memcpy(args, "OK", 3);
        return 3;
error_set_robot_session:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Command for reading starting cord status. After cord disattached, start robot
 * operating timer.
 */
int cmd_read_cord_status(void *args)
{
        mk_ctrl->cord_status = read_cord_status();
        if (mk_ctrl->cord_status == 1) {
                mk_clr_stop_motors_ctrl(mk_ctrl);
                if (!LL_TIM_IsEnabledCounter(MOTOR_OPERATING_TIM))
                        LL_TIM_EnableCounter(MOTOR_OPERATING_TIM);
                xTaskNotifyGive(mk_ctrl->mk_notify);
        }
        memcpy(args, &mk_ctrl->cord_status, 1);
        return 1;
}

/*
 * Command for reading current side switcher state. 0 - right, 1 - left
 */
int cmd_read_side_switch(void *args)
{
        mk_ctrl->side = read_side_switch();
        if (mk_ctrl->side == 1){
                led_blue();
        } else {
                led_yellow();
        }
        memcpy(args, &mk_ctrl->side, 1);
        return 1;
}
/*
 * Command for readung current strategy determined by external button
 */
int cmd_read_strategy(void *args)
{
        memcpy(args, &mk_ctrl->strategy_num, 1);
        return 1;
}

/*
 * Set motors pwm command
 * Input: values for each pwm channel
 * Output: OK or ERROR status
 */
int cmd_set_pwm(void *args)
{
        cmd_set_pwm_t *cmd_args = (cmd_set_pwm_t *)args;

        /*
         * Check whether kinematics ready or not
         * and check parameters
         */
        if (!mk_ctrl)
                goto error_set_pwm;
        if (SET_PWM_ARGS_ERR(cmd_args))
               goto error_set_pwm;
        /*
         * Update control structure
         */
        xSemaphoreTake(mk_ctrl->lock, portMAX_DELAY);
        mk_set_pwm_ctrl(mk_ctrl);
        mk_ctrl->pwm_motors[cmd_args->channel - 1] = cmd_args->pwm_value;
        xSemaphoreGive(mk_ctrl->lock);
        /*
         * Wake up kinematics task
         */
        xTaskNotifyGive(mk_ctrl->mk_notify);
        memcpy(args, "OK", 3);
        return 3;
error_set_pwm:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Set motors speed command
 * Input: linear and rotational speed
 * Output: OK or ERROR status
 */
int cmd_set_speed(void *args)
{
        cmd_set_speed_t *cmd_args = (cmd_set_speed_t *)args;
        /*
         * Check whether kinematics ready or not
         */
        if (!mk_ctrl)
                goto error_set_speed;
        /*
         * Update control structure
         */
        xSemaphoreTake(mk_ctrl->lock, portMAX_DELAY);
        mk_set_speed_ctrl(mk_ctrl);
        memcpy(&(mk_ctrl->vel_x), &(cmd_args->vx), 12);
        xSemaphoreGive(mk_ctrl->lock);
        /*
         * Wake up kinematics task
         */
        xTaskNotifyGive(mk_ctrl->mk_notify);
        memcpy(args, "OK", 3);
        return 3;
error_set_speed:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Robot operating timer
 */
void TIM7_IRQHandler(void)
{
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;
        static uint32_t seconds_from_start = 0;

        if (LL_TIM_IsActiveFlag_UPDATE(MOTOR_OPERATING_TIM)) {
                LL_TIM_ClearFlag_UPDATE(MOTOR_OPERATING_TIM);
                seconds_from_start++;
                if (seconds_from_start >= MOTOR_OPERATING_TIME &&
                    mk_ctrl->session != ROBOT_SESSION_DEBUG) {
                        turn_off_all_motors();
                }
        }
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}

/*
 * Button interrupt handler
 */
void EXTI9_5_IRQHandler(void)
{
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;
        uint16_t current_tick = xTaskGetTickCountFromISR();
        if (current_tick > mk_ctrl->strategy_update_time + 200) {
                mk_ctrl->strategy_num = (mk_ctrl->strategy_num + 1) % \
                                NUMBER_OF_STRATEGIES;
        }
        mk_ctrl->strategy_update_time = current_tick;
        LL_EXTI_ClearFlag_0_31(MOTOR_STRATEGY_EXTI_LINE);
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}

void TIM8_TRG_COM_TIM14_IRQHandler(void)
{
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;
        if(LL_TIM_IsActiveFlag_UPDATE(MOTOR_TR_TIM)){
                LL_TIM_ClearFlag_UPDATE(MOTOR_TR_TIM);

                /*
                * PD without odometry feedback
                */
                
                //TODO: Global parameters of i_error array => i_error[i] += err[i]*deltaMills
                /*
                #define P 1
                #define I 5
                #define D 1
                //Finding the fastest motor
                int deltaMills = 10;
                float err[3];
                float abs[3];
                for (size_t i = 0; i < 3; i++)
                {
                        err[i] = mk_ctrl->pwm_motors[i] - mk_ctrl->prev_pwm_motors[i];
                        abs[i] = fabs(err[i]);
                }
        
                uint32_t max_id;                               // Index of motor with maximum speed
                arm_max_f32(abs, 3, NULL, &max_id);
                for (size_t i = 0; i < 3; i++)
                {
                        float result = err[i]/deltaMills * D;
                        if(i != max_id) {
                                mk_ctrl->prev_pwm_motors[i] += result * fabs(mk_ctrl->pwm_motors[i] / mk_ctrl->pwm_motors[max_id]);
                        } else {
                                mk_ctrl->prev_pwm_motors[max_id] += result;
                        }

                        if (mk_ctrl->prev_pwm_motors[i] < 0.1 && mk_ctrl->prev_pwm_motors[i] > -0.1 && mk_ctrl->pwm_motors[i] < 0)
                                mk_ctrl->prev_pwm_motors[i] = -0.1;
                        if (mk_ctrl->prev_pwm_motors[i] > -0.1 && mk_ctrl->prev_pwm_motors[i] < 0.1 && mk_ctrl->pwm_motors[i] > 0)
                                mk_ctrl->prev_pwm_motors[i] = 0.1;
                }
                    */

                /*
                * Fixed ramp algorithm
                */

                //Finding the fastest motor
                float err[3];
                //float err_abs[3];
                float abs[3];
                for (size_t i = 0; i < 3; i++)
                {
                        err[i] = mk_ctrl->pwm_motors[i] - mk_ctrl->prev_pwm_motors[i];
                        //err_abs[i] = fabs(mk_ctrl->pwm_motors[i]) - fabs(mk_ctrl->prev_pwm_motors[i]);
                        abs[i] = fabs(err[i]);
                }
        
                uint32_t max_id;                               // Index of motor with maximum speed
                arm_max_f32(abs, 3, NULL, &max_id);
                //Final set
                float step = M_STEP;
                for (size_t i = 0; i < 3; i++)
                {
                        if(i != max_id) {
                                float reference = 0.9 * fabs(mk_ctrl->prev_pwm_motors[i]/mk_ctrl->prev_pwm_motors[max_id]);
                                if (err[i] > 0)
                                        mk_ctrl->prev_pwm_motors[i] += reference * step;
                                if (err[i] < 0)
                                        mk_ctrl->prev_pwm_motors[i] -= reference * step;

                        } else {
                                if (err[max_id] > 0)
                                        mk_ctrl->prev_pwm_motors[max_id] += step;
                                if (err[max_id] < 0)
                                        mk_ctrl->prev_pwm_motors[max_id] -= step;

                        }
                        if (mk_ctrl->prev_pwm_motors[i] < 0.1 && mk_ctrl->prev_pwm_motors[i] > -0.1 && mk_ctrl->pwm_motors[i] < 0)
                                mk_ctrl->prev_pwm_motors[i] = -0.1;
                        if (mk_ctrl->prev_pwm_motors[i] > -0.1 && mk_ctrl->prev_pwm_motors[i] < 0.1 && mk_ctrl->pwm_motors[i] > 0)
                                mk_ctrl->prev_pwm_motors[i] = 0.1;

                }

                if (err[max_id] < 0.006 && err[max_id] > -0.006) {
                        LL_TIM_DisableCounter(MOTOR_TR_TIM);
                        for (size_t i = 0; i < 3; i++)
                        {
                                mk_ctrl->prev_pwm_motors[i] = mk_ctrl->pwm_motors[i];
                        }
                        
                }            
                mk_set_pwm(mk_ctrl->prev_pwm_motors);
        }
        
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}


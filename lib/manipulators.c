#include "manipulators.h"
#include "stm32f407xx.h"
#include "stm32f4xx_ll_usart.h"
#include "peripheral.h"
#include "gpio_map.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

#include "FreeRTOS.h"
#include "task.h"
#include "terminal_cmds.h"
#include "motor_kinematics.h"
#include "stepper.h"

/*
 * Private task notifier
 */
static manip_ctrl_t *manip_ctrl = NULL;

/*
 * Private functions
 */
static void stm_driver_send_msg(uint8_t *buff, int len)
{
        int i = 0;

        LL_USART_ClearFlag_TC(STM_DRIVER_USART);
        while (len--) {
                while (!LL_USART_IsActiveFlag_TXE(STM_DRIVER_USART));
                LL_USART_TransmitData8(STM_DRIVER_USART, buff[i++]);
        }
        while (!LL_USART_IsActiveFlag_TC(STM_DRIVER_USART));
        return;
}

static void manip_dyn_stop(void)
{
        uint8_t tx[] = {0x02, 0x00, 0x00, 0x00, 0x00, 0x00,
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        };
        stm_driver_send_msg(tx, 18);
        return;
}

static void manip_hw_config(void)
{
        /*
         * Servo motors pin configuration
         */
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOB);
        LL_GPIO_SetPinMode(STICK_PORT, STICK_PIN, LL_GPIO_MODE_ALTERNATE);
        LL_GPIO_SetAFPin_8_15(STICK_PORT, STICK_PIN, STICK_PIN_AF);
        /*
         * Servo motors PWM timer configuration
         */
        LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_TIM12);
        LL_TIM_SetCounterMode(STICK_TIM, LL_TIM_COUNTERMODE_UP);
        LL_TIM_SetPrescaler(STICK_TIM, STICK_TIM_PSC);
        LL_TIM_SetAutoReload(STICK_TIM, STICK_TIM_ARR);
        LL_TIM_CC_EnableChannel(STICK_TIM, LL_TIM_CHANNEL_CH1);
        LL_TIM_OC_EnableFast(STICK_TIM, LL_TIM_CHANNEL_CH1);
        LL_TIM_OC_EnablePreload(STICK_TIM, LL_TIM_CHANNEL_CH1);
        LL_TIM_EnableARRPreload(STICK_TIM);
        LL_TIM_OC_SetMode(STICK_TIM, LL_TIM_CHANNEL_CH1, LL_TIM_OCMODE_PWM1);
        LL_TIM_OC_SetCompareCH1(STICK_TIM, STEP_TIM_CCR_INIT);
        LL_TIM_GenerateEvent_UPDATE(STICK_TIM);
        LL_TIM_EnableCounter(STICK_TIM);
        
        /*
         * Dynamixel update timer
         */
        LL_APB2_GRP1_EnableClock(LL_APB2_GRP1_PERIPH_TIM8);
        LL_TIM_SetAutoReload(DYNAMIXEL_TIM, DYNAMIXEL_TIM_ARR);
        LL_TIM_SetPrescaler(DYNAMIXEL_TIM, DYNAMIXEL_TIM_PSC);
        LL_TIM_SetCounterMode(DYNAMIXEL_TIM, LL_TIM_COUNTERMODE_UP);
        LL_TIM_EnableIT_UPDATE(DYNAMIXEL_TIM);
        NVIC_SetPriority(DYNAMIXEL_TIM_IRQN, DYNAMIXEL_TIM_IRQN_PRIORITY);
        NVIC_EnableIRQ(DYNAMIXEL_TIM_IRQN);

        /* Setting gripper status pins */
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOE);
        LL_GPIO_SetPinMode(GRP_PORT, GRP_PIN_1,
                           LL_GPIO_MODE_INPUT);
        LL_GPIO_SetPinPull(GRP_PORT, GRP_PIN_1,
                           LL_GPIO_PULL_NO);
        LL_GPIO_SetPinMode(GRP_PORT, GRP_PIN_2,
                           LL_GPIO_MODE_INPUT);
        LL_GPIO_SetPinPull(GRP_PORT, GRP_PIN_2,
                           LL_GPIO_PULL_NO);
        LL_GPIO_SetPinMode(GRP_PORT, GRP_PIN_3,
                           LL_GPIO_MODE_INPUT);
        LL_GPIO_SetPinPull(GRP_PORT, GRP_PIN_3,
                           LL_GPIO_PULL_NO);
        LL_GPIO_SetPinMode(GRP_PORT, GRP_PIN_4,
                           LL_GPIO_MODE_INPUT);
        LL_GPIO_SetPinPull(GRP_PORT, GRP_PIN_4,
                           LL_GPIO_PULL_NO);
        LL_GPIO_SetPinMode(GRP_PORT, GRP_PIN_5,
                           LL_GPIO_MODE_INPUT);
        LL_GPIO_SetPinPull(GRP_PORT, GRP_PIN_5,
                           LL_GPIO_PULL_NO);                   

        return;
}

static void stick_enable_torque()
{
        LL_TIM_EnableCounter(STICK_TIM);
        return;
}

static void stick_disable_torque()
{
        LL_TIM_DisableCounter(STICK_TIM);
        return;
}

static void stick_set_angle(uint8_t angle)
{
        LL_TIM_OC_SetCompareCH1(STICK_TIM, angle);
        return;
}

static void dyn_set_angle(uint8_t num, uint8_t id, uint16_t angle,
                          uint16_t speed)
{
        dyn_ctrl_t *dyn = &(manip_ctrl->sequence_cmd[num]);
        float delay_ms_f = 0;

        manip_ctrl->total_cmd += 1;
        dyn->id = id;
        dyn->goal_pos = angle;
        dyn->current_pos = manip_ctrl->dyn_pos[id - 1];
        manip_ctrl->dyn_pos[id - 1] = dyn->goal_pos;
        dyn->speed = speed;
        dyn->cmd_started = 0;
        dyn->cmd_completed = 0;
        if (dyn->current_pos == 0) {
                dyn->delay_ms = DEFAULT_DELAY;
        }
        else {
                delay_ms_f = fabs((float)(dyn->goal_pos - dyn->current_pos)) /
                             (float) (dyn->speed)  * CONVERT_COEF_MS
                             + RELAXATION_TIME;
                dyn->delay_ms = (uint32_t) delay_ms_f;
        }
        dyn->cmd_buff[0] = 0x00;
        dyn->cmd_buff[1] = (id);
        dyn->cmd_buff[2] = (uint8_t) (angle & 0xff);
        dyn->cmd_buff[3] = (uint8_t) ((angle >> 8) & 0xff);
        dyn->cmd_buff[4] = (uint8_t) (speed & 0xff);
        dyn->cmd_buff[5] = (uint8_t) ((speed >> 8) & 0xff);
        return;
}

static void dyn_update(void)
{
        int i = 0;
        dyn_ctrl_t *dyn = manip_ctrl->sequence_cmd;

        for (i = manip_ctrl->completed_cmd; i <= manip_ctrl->current_cmd; i++) {
                if ((manip_ctrl->current_time - dyn[i].start_time >= dyn[i].delay_ms) && 
                    (dyn[i].cmd_started)) {
                        dyn[i].current_pos = dyn[i].goal_pos;
                        dyn[i].cmd_completed = 1;
                        dyn_clr_flag(manip_ctrl, dyn[i].id);
                }
        }
}

static void cmd_update(void)
{
        int i = 0;
        dyn_ctrl_t *dyn = manip_ctrl->sequence_cmd;

        for (i = manip_ctrl->completed_cmd; i <= manip_ctrl->current_cmd; i++) {
                if (dyn[i].cmd_completed == 1) 
                        manip_ctrl->completed_cmd++;
                else
                        break;
        }
}


static void dyn_time_slice_operator(manip_ctrl_t *manip_ctrl)
{
        dyn_ctrl_t *dyn = manip_ctrl->sequence_cmd;

        dyn_update();
        if (!(dyn[manip_ctrl->current_cmd].cmd_started) &&
            !(is_dyn_flag_set(manip_ctrl, dyn[manip_ctrl->current_cmd].id))) {
                dyn[manip_ctrl->current_cmd].cmd_started = 1;
                stm_driver_send_msg(dyn[manip_ctrl->current_cmd].cmd_buff, 18);
                dyn[manip_ctrl->current_cmd].start_time = manip_ctrl->current_time;
                dyn_set_flag(manip_ctrl, dyn[manip_ctrl->current_cmd].id);
                if (manip_ctrl->current_cmd != manip_ctrl->total_cmd - 1) {
                        manip_ctrl->current_cmd++;
                        vTaskDelay(120);
                }

        }
        cmd_update();
        return;
}

/*
 * Set initial speeds
 */
static void dyn_set_speeds(void)
{
        uint8_t tx[18];
        int i = 0;
        int j = 0;

        memset(tx, 0x00, 18);
        tx[0] = 0x01;
        for (i = 0, j = 1; i < NUMBER_OF_DYNAMIXELS; i++, j = j + 2) {
                tx[j] = (uint8_t) ((manip_ctrl->dyn_speeds[i] >> 8) & 0xff);
                tx[j+1] = (uint8_t) (manip_ctrl->dyn_speeds[i] & 0xff);
        }
        stm_driver_send_msg(tx, 18);
        return;
}

static void dyn_set_init_pos(void)
{
        uint8_t tx[18];
        int i = 0;
        int j = 0;

        memset(tx, 0x00, 18);
        tx[0] = 0x03;
        for (i = 0, j = 1; i < NUMBER_OF_DYNAMIXELS; i++, j = j + 2) {
                tx[j] = (uint8_t) ((manip_ctrl->dyn_pos[i] >> 8) & 0xff);
                tx[j+1] = (uint8_t) (manip_ctrl->dyn_pos[i] & 0xff);
        }
        stm_driver_send_msg(tx, 18);
        return;
}

/*
 * Public functions
 */
void manipulators_block(void)
{
        /*
         * Stop and block dynamixels
         */
        manip_dyn_stop();
        manip_set_flag(manip_ctrl, BLOCK_DYN);
        /*
         * Stop and block stepper
         */
        step_stop_motors();
        manip_set_flag(manip_ctrl, BLOCK_STEPPER);
        /*
         * Turn off servos
         */
        stick_disable_torque();
        return;
}

void manipulators_rise_flag(void)
{
        stick_set_angle(1);
        stick_enable_torque();
}

void manipulators_manager(void *arg)
{
       (void) arg;
        manip_ctrl_t manip_ctrl_st;
        int i = 0;
        uint16_t dyn_speeds[] = {DYN_SPEEDS};
        uint16_t dyn_init_pos[] = {DYN_INIT_POS};

        manip_ctrl_st.manip_notify = xTaskGetCurrentTaskHandle();
        manip_ctrl_st.dyn_status = 0x00;
        manip_ctrl_st.flags = 0x00;
        manip_ctrl_st.current_time = 0;
        manip_ctrl_st.total_cmd = 0;
        manip_ctrl_st.current_cmd = 0;
        manip_ctrl_st.completed_cmd = 0;
        for (i = 0; i < NUMBER_OF_DYNAMIXELS; i++) {
                manip_ctrl_st.dyn_pos[i] = 0x0000;
                manip_ctrl_st.dyn_speeds[i] = dyn_speeds[i];
                manip_ctrl_st.dyn_pos[i] = dyn_init_pos[i];
        }
        for (i = 0; i < MAX_DYN_COMMANDS; i++) {
                memset(manip_ctrl_st.sequence_cmd[i].cmd_buff, 0, 18);
                manip_ctrl_st.sequence_cmd[i].goal_pos = 0x0000;
                manip_ctrl_st.sequence_cmd[i].current_pos = 0x0000;
                manip_ctrl_st.sequence_cmd[i].start_time = 0;
                manip_ctrl_st.sequence_cmd[i].cmd_started = 0;
                manip_ctrl_st.sequence_cmd[i].cmd_completed = 0;
        }
        manip_ctrl = &manip_ctrl_st;
        manip_hw_config();
        /*
         * Init all speeds and wait
         */
        dyn_set_speeds();
        vTaskDelay(60);

        uint32_t cur_step = 0;
        uint32_t goal_step = 0;
        /*
         * Start step motor calibration
         */
        step_start_calibration(0);
        /*
         * Set all manipulators to default position
         */
        dyn_set_init_pos();

        while (step_is_running(0))
                taskYIELD();
        cur_step = step_get_current_step(0);
        goal_step = cur_step + TOP_STEPS;
        step_set_step_goal(0, goal_step);

        stick_disable_torque();

        vTaskDelay(60);

        while (1) {
                ulTaskNotifyTake(pdTRUE, portMAX_DELAY);
                LL_TIM_EnableCounter(DYNAMIXEL_TIM);
                manip_ctrl->current_cmd = 0;
                manip_ctrl->completed_cmd = 0;
                while (manip_ctrl->completed_cmd < manip_ctrl->total_cmd) {
                        dyn_time_slice_operator(manip_ctrl);
                        taskYIELD();
                }
                manip_ctrl->total_cmd = 0;
                manip_ctrl->current_cmd = 0;
                manip_ctrl->completed_cmd = 0;
                dyn_clr_flag(manip_ctrl, DYN_BUSY_POS);
                LL_TIM_DisableCounter(DYNAMIXEL_TIM);
                manip_clr_flag(manip_ctrl, DYN_BUSY);
        }
        return;
}

/*
 * Set of motor related handlers for terminal
 */

/*
 * Start step motor calibration
 */
int cmd_step_calibrate(char *args)
{
        if (is_manip_flag_set(manip_ctrl, BLOCK_STEPPER))
                goto error_step_calibrate;
        step_start_calibration(0);
        memcpy(args, "OK", 3);
        return 3;
error_step_calibrate:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Set desired step for step motor
 */
int cmd_step_set_step(char *args)
{
        uint32_t *step_goal = (uint32_t *) args;

        if (!step_is_calibrated(0) ||
            is_manip_flag_set(manip_ctrl, BLOCK_STEPPER))
                goto error_step_set_step;
        if (step_set_step_goal(0, *step_goal))
                goto error_step_set_step;
        memcpy(args, "OK", 3);
        return 3;
error_step_set_step:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Retern running state
 */
int cmd_step_is_running(char *args)
{
        if (step_is_running(0))
                goto error_step_is_running;
        memcpy(args, "OK", 3);
        return 3;
error_step_is_running:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Set arm down
 */
int cmd_arm_down(char *args)
{

        if (!step_is_calibrated(0) ||
            is_manip_flag_set(manip_ctrl, BLOCK_STEPPER))
                goto error_arm_down;

        if (step_set_step_goal(0, SHELF_STEPS))
                goto error_arm_down;
                
        memcpy(args, "OK", 3);
        return 3;

error_arm_down:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Set arm up
 */
int cmd_arm_up(char *args)
{

        if (!step_is_calibrated(0) ||
            is_manip_flag_set(manip_ctrl, BLOCK_STEPPER))
                goto error_arm_up;

        if (step_set_step_goal(0, TOP_STEPS))
                goto error_arm_up;
                
        memcpy(args, "OK", 3);
        return 3;
error_arm_up:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Set arm floor
 */
int cmd_arm_floor(char *args)
{

        if (!step_is_calibrated(0) ||
            is_manip_flag_set(manip_ctrl, BLOCK_STEPPER))
                goto error_arm_floor;

        if (step_set_step_goal(0, FLOOR_STEPS))
                goto error_arm_floor;
                
        memcpy(args, "OK", 3);
        return 3;
error_arm_floor:
        memcpy(args, "ER", 3);
        return 3;
}

int cmd_paws_open(char *args)
{       
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_dyn_flag_set(manip_ctrl, DYN_BUSY_POS)
            || is_manip_flag_set(manip_ctrl, BLOCK_DYN))
                goto error_paws_open;
        /*
         * Set dynamixel angles
         */
        uint8_t sequence = (uint8_t)*args;
        uint8_t q = 0;

        for (int i = 0; i < 5; i++)
        {
                if ((sequence >> i)  & 0x01) {
                        dyn_set_angle(q, (i+1), 0x0310, manip_ctrl->dyn_speeds[i]);
                        q += 1;
                }
        }

        manip_ctrl->sequence_cmd[manip_ctrl->total_cmd - 1].delay_ms +=
                                                        GRABBER_DELAY * q;


        dyn_set_flag(manip_ctrl, DYN_BUSY_POS);
        manip_set_flag(manip_ctrl, DYN_BUSY);
        xTaskNotifyGive(manip_ctrl->manip_notify);

        memcpy(args, "OK", 3);
        return 3;

error_paws_open:
        memcpy(args, "ER", 3);
        return 3;
}

int cmd_paws_close(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_dyn_flag_set(manip_ctrl, DYN_BUSY_POS)
            || is_manip_flag_set(manip_ctrl, BLOCK_DYN))
                goto error_paws_close;
        /*
         * Set dynamixel angles
         */
        uint8_t sequence = (uint8_t)*args;
        uint8_t q = 0;
        for (int i = 0; i < 5; i++)
        {
                if ((sequence >> i)  & 0x01) {
                        dyn_set_angle(q, (i+1), 0x01FA, manip_ctrl->dyn_speeds[i]);
                        q += 1;
                }
        }

        manip_ctrl->sequence_cmd[manip_ctrl->total_cmd - 1].delay_ms +=
                                                        GRABBER_DELAY * q;

        /*
         * Notify manipulators manager
         */
        dyn_set_flag(manip_ctrl, DYN_BUSY_POS);
        manip_set_flag(manip_ctrl, DYN_BUSY);
        xTaskNotifyGive(manip_ctrl->manip_notify);

        memcpy(args, "OK", 3);
        return 3;

error_paws_close:
        memcpy(args, "ER", 3);
        return 3;
}

int cmd_r_door_open_y(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_dyn_flag_set(manip_ctrl, DYN_BUSY_POS)
            || is_manip_flag_set(manip_ctrl, BLOCK_DYN))
                goto error_l_door_open;
        /*
         * Set dynamixel angles
         */
        dyn_set_angle(0, 0x07, 0x0333, manip_ctrl->dyn_speeds[6]);
        /*
         * Notify manipulators manager
         */
        dyn_set_flag(manip_ctrl, DYN_BUSY_POS);
        manip_set_flag(manip_ctrl, DYN_BUSY);
        xTaskNotifyGive(manip_ctrl->manip_notify);
        /*
         * Sent command to stm
         */
        memcpy(args, "OK", 3);
        return 3;

error_l_door_open:
        memcpy(args, "ER", 3);
        return 3;
}

int cmd_r_door_open_x(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_dyn_flag_set(manip_ctrl, DYN_BUSY_POS)
            || is_manip_flag_set(manip_ctrl, BLOCK_DYN))
                goto error_l_door_open;
        /*
         * Set dynamixel angles
         */
        dyn_set_angle(0, 0x07, 0x01E9, manip_ctrl->dyn_speeds[6]);
        /*
         * Notify manipulators manager
         */
        dyn_set_flag(manip_ctrl, DYN_BUSY_POS);
        manip_set_flag(manip_ctrl, DYN_BUSY);
        xTaskNotifyGive(manip_ctrl->manip_notify);
        /*
         * Sent command to stm
         */
        memcpy(args, "OK", 3);
        return 3;

error_l_door_open:
        memcpy(args, "ER", 3);
        return 3;
}

int cmd_r_door_close(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_dyn_flag_set(manip_ctrl, DYN_BUSY_POS)
            || is_manip_flag_set(manip_ctrl, BLOCK_DYN))
                goto error_l_door_close;
        /*
         * Set dynamixel angles
         */
        dyn_set_angle(0, 0x07, 0x001F, manip_ctrl->dyn_speeds[6]);
        /*
         * Notify manipulators manager
         */
        dyn_set_flag(manip_ctrl, DYN_BUSY_POS);
        manip_set_flag(manip_ctrl, DYN_BUSY);
        xTaskNotifyGive(manip_ctrl->manip_notify);
        /*
         * Sent command to stm
         */
        memcpy(args, "OK", 3);
        return 3;

error_l_door_close:
        memcpy(args, "ER", 3);
        return 3;
}

int cmd_l_door_open_y(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_dyn_flag_set(manip_ctrl, DYN_BUSY_POS)
            || is_manip_flag_set(manip_ctrl, BLOCK_DYN))
                goto error_r_door_open;
        /*
         * Set dynamixel angles
         */
        dyn_set_angle(0, 0x08, 0x00CC, manip_ctrl->dyn_speeds[7]);
        /*
         * Notify manipulators manager
         */
        dyn_set_flag(manip_ctrl, DYN_BUSY_POS);
        manip_set_flag(manip_ctrl, DYN_BUSY);
        xTaskNotifyGive(manip_ctrl->manip_notify);
        /*
         * Sent command to stm
         */
        memcpy(args, "OK", 3);
        return 3;

error_r_door_open:
        memcpy(args, "ER", 3);
        return 3;
}

int cmd_l_door_open_x(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_dyn_flag_set(manip_ctrl, DYN_BUSY_POS)
            || is_manip_flag_set(manip_ctrl, BLOCK_DYN))
                goto error_r_door_open;
        /*
         * Set dynamixel angles
         */
        dyn_set_angle(0, 0x08, 0x01DC, manip_ctrl->dyn_speeds[7]);
        /*
         * Notify manipulators manager
         */
        dyn_set_flag(manip_ctrl, DYN_BUSY_POS);
        manip_set_flag(manip_ctrl, DYN_BUSY);
        xTaskNotifyGive(manip_ctrl->manip_notify);
        /*
         * Sent command to stm
         */
        memcpy(args, "OK", 3);
        return 3;

error_r_door_open:
        memcpy(args, "ER", 3);
        return 3;
}

int cmd_l_door_close(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_dyn_flag_set(manip_ctrl, DYN_BUSY_POS)
            || is_manip_flag_set(manip_ctrl, BLOCK_DYN))
                goto error_r_door_close;
        /*
         * Set dynamixel angles
         */
        dyn_set_angle(0, 0x08, 0x038A, manip_ctrl->dyn_speeds[7]);
        /*
         * Notify manipulators manager
         */
        dyn_set_flag(manip_ctrl, DYN_BUSY_POS);
        manip_set_flag(manip_ctrl, DYN_BUSY);
        xTaskNotifyGive(manip_ctrl->manip_notify);
        /*
         * Sent command to stm
         */
        memcpy(args, "OK", 3);
        return 3;

error_r_door_close:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Hardware interrupts
 */
void TIM8_UP_TIM13_IRQHandler(void)
{
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;

        if (LL_TIM_IsActiveFlag_UPDATE(DYNAMIXEL_TIM)) {
                LL_TIM_ClearFlag_UPDATE(DYNAMIXEL_TIM);
                /*
                 * Increment time in milliseconds
                 */
                manip_ctrl->current_time += 1;
                /*
                 * Notify task
                 */
                vTaskNotifyGiveFromISR(manip_ctrl->manip_notify,
                                       &xHigherPriorityTaskWoken);
        }
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}

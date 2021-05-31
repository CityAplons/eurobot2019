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
        uint8_t tx[] = {0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
        stm_driver_send_msg(tx, 10);
        return;
}

static void manip_hw_config(void)
{
        /*
         * Pumps pin configuration
         */
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOD);

        LL_GPIO_SetPinMode(MANIP_PUMP_1_PORT, MANIP_PUMP_1_PIN,
                           LL_GPIO_MODE_OUTPUT);

        LL_GPIO_SetPinMode(MANIP_PUMP_2_PORT, MANIP_PUMP_2_PIN,
                           LL_GPIO_MODE_OUTPUT);
        
        LL_GPIO_SetPinMode(MANIP_PUMP_3_PORT, MANIP_PUMP_3_PIN,
                           LL_GPIO_MODE_OUTPUT);

        /*
         * Valves configuration
         */
        LL_GPIO_SetPinMode(MANIP_VALVE_LEFT_1_PORT, MANIP_VALVE_LEFT_1_PIN, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(MANIP_VALVE_RIGHT_1_PORT, MANIP_VALVE_RIGHT_1_PIN, LL_GPIO_MODE_OUTPUT);
        //LL_GPIO_SetPinMode(MANIP_VALVE_CENTER_1_PORT, MANIP_VALVE_CENTER_1_PIN, LL_GPIO_MODE_OUTPUT);

        LL_GPIO_SetPinMode(MANIP_VALVE_LEFT_2_PORT, MANIP_VALVE_LEFT_2_PIN, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(MANIP_VALVE_RIGHT_2_PORT, MANIP_VALVE_RIGHT_2_PIN, LL_GPIO_MODE_OUTPUT);
        //LL_GPIO_SetPinMode(MANIP_VALVE_CENTER_2_PORT, MANIP_VALVE_CENTER_2_PIN, LL_GPIO_MODE_OUTPUT);

        LL_GPIO_SetPinMode(MANIP_VALVE_LEFT_3_PORT, MANIP_VALVE_LEFT_3_PIN, LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetPinMode(MANIP_VALVE_RIGHT_3_PORT, MANIP_VALVE_RIGHT_3_PIN, LL_GPIO_MODE_OUTPUT);
        //LL_GPIO_SetPinMode(MANIP_VALVE_CENTER_3_PORT, MANIP_VALVE_CENTER_3_PIN, LL_GPIO_MODE_OUTPUT);

        /* 
         * Dynamixel power control
         */
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOD);
        LL_GPIO_SetPinMode(DYNAMIXEL_PWR, DYNAMIXEL_PWR_PIN,
                           LL_GPIO_MODE_OUTPUT);
        LL_GPIO_SetOutputPin(DYNAMIXEL_PWR, DYNAMIXEL_PWR_PIN);
        /*
         * Dynamixel update timer
         */
        LL_APB2_GRP1_EnableClock(LL_APB2_GRP1_PERIPH_TIM10);
        LL_TIM_SetAutoReload(DYNAMIXEL_TIM, DYNAMIXEL_TIM_ARR);
        LL_TIM_SetPrescaler(DYNAMIXEL_TIM, DYNAMIXEL_TIM_PSC);
        LL_TIM_SetCounterMode(DYNAMIXEL_TIM, LL_TIM_COUNTERMODE_UP);
        LL_TIM_EnableIT_UPDATE(DYNAMIXEL_TIM);
        NVIC_SetPriority(DYNAMIXEL_TIM_IRQN, DYNAMIXEL_TIM_IRQN_PRIORITY);
        NVIC_EnableIRQ(DYNAMIXEL_TIM_IRQN);

        /*
         * Barometer configuration
         * Timer configuration for external ADC trigger
         */
        LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_TIM5);
        LL_TIM_SetCounterMode(BAR_TIM, LL_TIM_COUNTERMODE_UP);
        LL_TIM_SetPrescaler(BAR_TIM, BAR_PWM_TIM_PSC);
        LL_TIM_SetAutoReload(BAR_TIM, BAR_PWM_TIM_ARR);
        LL_TIM_CC_EnableChannel(BAR_TIM, BAR_TIM_OC_CHANNEL);
        LL_TIM_OC_SetMode(BAR_TIM, BAR_TIM_OC_CHANNEL, LL_TIM_OCMODE_PWM1);
        LL_TIM_OC_EnablePreload(BAR_TIM, BAR_TIM_OC_CHANNEL);
        LL_TIM_OC_SetCompareCH1(BAR_TIM, BAR_PWM_TIM_CCR_INIT);
        LL_TIM_SetUpdateSource(BAR_TIM, LL_TIM_UPDATESOURCE_REGULAR);
        LL_TIM_GenerateEvent_UPDATE(BAR_TIM);
        LL_TIM_EnableIT_UPDATE(BAR_TIM);
        NVIC_SetPriority(BAR_IRQN, BAR_IRQN_PRIORITY);
        NVIC_EnableIRQ(BAR_IRQN);

        /*
         * ADC pin configuration
         */
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOB);
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOC);
        LL_GPIO_SetPinMode(BAR_1_PORT, BAR_1_PIN, LL_GPIO_MODE_ANALOG);
        LL_GPIO_SetPinMode(BAR_2_PORT, BAR_2_PIN, LL_GPIO_MODE_ANALOG);
        LL_GPIO_SetPinMode(BAR_3_PORT, BAR_3_PIN, LL_GPIO_MODE_ANALOG);
        /*
         * ADC configuration
         */
        LL_APB2_GRP1_EnableClock(LL_APB2_GRP1_PERIPH_ADC1);
        LL_ADC_SetCommonClock(BAR_ADC_CMN_INST, LL_ADC_CLOCK_SYNC_PCLK_DIV2);
        LL_ADC_REG_SetSequencerLength(BAR_ADC, LL_ADC_REG_SEQ_SCAN_ENABLE_3RANKS);
        LL_ADC_REG_SetSequencerRanks(BAR_ADC, LL_ADC_REG_RANK_1,
                                     BAR_ADC_1_CHANNEL);
        LL_ADC_REG_SetSequencerRanks(BAR_ADC, LL_ADC_REG_RANK_2,
                                     BAR_ADC_2_CHANNEL);
        LL_ADC_REG_SetSequencerRanks(BAR_ADC, LL_ADC_REG_RANK_3,
                                     BAR_ADC_3_CHANNEL);
        LL_ADC_SetResolution(BAR_ADC, BAR_ADC_RESOLUTION);
        LL_ADC_SetDataAlignment(BAR_ADC, BAR_ADC_ALIGN);
        LL_ADC_SetSequencersScanMode(BAR_ADC, BAR_ADC_SEQ_SCAN);
        LL_ADC_REG_SetTriggerSource(BAR_ADC, BAR_ADC_TRIG);
        LL_ADC_REG_SetContinuousMode(BAR_ADC, BAR_ADC_SINGLE_MODE);
        LL_ADC_REG_SetDMATransfer(BAR_ADC, BAR_ADC_DMA_MODE);
        LL_ADC_REG_SetFlagEndOfConversion(BAR_ADC, BAR_ADC_EOC_MODE);
        LL_ADC_SetChannelSamplingTime(BAR_ADC, BAR_ADC_1_CHANNEL,
                                      BAR_ADC_SAMPL_TIME);
        LL_ADC_SetChannelSamplingTime(BAR_ADC, BAR_ADC_2_CHANNEL,
                                      BAR_ADC_SAMPL_TIME);
        LL_ADC_SetChannelSamplingTime(BAR_ADC, BAR_ADC_3_CHANNEL,
                                      BAR_ADC_SAMPL_TIME);
        LL_ADC_Enable(BAR_ADC);
        LL_ADC_REG_StartConversionExtTrig(BAR_ADC, BAR_ADC_TRIG_POLARITY);
        LL_TIM_EnableCounter(BAR_TIM);

        /*
         *  LL_ADC_EnableIT_OVR
         */
        /*
         * DMA configuration
         */
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_DMA2);
        LL_DMA_SetChannelSelection(BAR_DMA, BAR_DMA_STREAM, BAR_DMA_CHANNEL);
        LL_DMA_ConfigAddresses(BAR_DMA, BAR_DMA_STREAM, BAR_DMA_SRC_ADDR,
                               (uint32_t)manip_ctrl->bar_adc_channels,
                               BAR_DMA_DIRECTION);
        LL_DMA_SetDataLength(BAR_DMA, BAR_DMA_STREAM, BAR_ADC_CHANNELS);
        LL_DMA_SetPeriphSize(BAR_DMA, BAR_DMA_STREAM, LL_DMA_PDATAALIGN_BYTE);
        LL_DMA_SetMemorySize(BAR_DMA, BAR_DMA_STREAM, LL_DMA_MDATAALIGN_BYTE);
        LL_DMA_SetMode(BAR_DMA, BAR_DMA_STREAM, BAR_DMA_MODE);
        LL_DMA_SetMemoryIncMode(BAR_DMA, BAR_DMA_STREAM,
                                BAR_DMA_MEM_INC_MODE);
        LL_DMA_SetPeriphIncMode(BAR_DMA, BAR_DMA_STREAM,
                                BAR_DMA_PERIPH_INC_MODE);
        LL_DMA_SetStreamPriorityLevel(BAR_DMA, BAR_DMA_STREAM,
                                      LL_DMA_PRIORITY_VERYHIGH);
        LL_DMA_EnableStream(BAR_DMA, BAR_DMA_STREAM);

        return;
}

static void manip_pump_start(uint8_t id)
{
        switch (id)
        {
        case 1:
                LL_GPIO_SetOutputPin(MANIP_PUMP_1_PORT, MANIP_PUMP_1_PIN);
                break;
        case 2:
                LL_GPIO_SetOutputPin(MANIP_PUMP_2_PORT, MANIP_PUMP_2_PIN);
                break;
        case 3:
                LL_GPIO_SetOutputPin(MANIP_PUMP_3_PORT, MANIP_PUMP_3_PIN);
                break;
        default:
                break;
        }
        return;
}

static void manip_pump_stop(uint8_t id)
{
        switch (id)
        {
        case 1:
                LL_GPIO_ResetOutputPin(MANIP_PUMP_1_PORT, MANIP_PUMP_1_PIN);
                break;
        case 2:
                LL_GPIO_ResetOutputPin(MANIP_PUMP_2_PORT, MANIP_PUMP_2_PIN);
                break;
        case 3:
                LL_GPIO_ResetOutputPin(MANIP_PUMP_3_PORT, MANIP_PUMP_3_PIN);
                break;
        default:
                break;
        }     
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
                stm_driver_send_msg(dyn[manip_ctrl->current_cmd].cmd_buff, 10);
                dyn[manip_ctrl->current_cmd].start_time = manip_ctrl->current_time;
                dyn_set_flag(manip_ctrl, dyn[manip_ctrl->current_cmd].id);
                if (manip_ctrl->current_cmd != manip_ctrl->total_cmd - 1) {
                        manip_ctrl->current_cmd++;
                        vTaskDelay(10);
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
        uint8_t tx[10];
        int i = 0;
        int j = 0;

        memset(tx, 0x00, 10);
        tx[0] = 0x01;
        for (i = 0, j = 1; i < NUMBER_OF_DYNAMIXELS; i++, j = j + 2) {
                tx[j] = (uint8_t) ((manip_ctrl->dyn_speeds[i] >> 8) & 0xff);
                tx[j+1] = (uint8_t) (manip_ctrl->dyn_speeds[i] & 0xff);
        }
        stm_driver_send_msg(tx, 10);
        return;
}

static void dyn_set_init_pos(void)
{
        uint8_t tx[10];
        int i = 0;
        int j = 0;

        memset(tx, 0x00, 10);
        tx[0] = 0x03;
        for (i = 0, j = 1; i < NUMBER_OF_DYNAMIXELS; i++, j = j + 2) {
                tx[j] = (uint8_t) ((manip_ctrl->dyn_pos[i] >> 8) & 0xff);
                tx[j+1] = (uint8_t) (manip_ctrl->dyn_pos[i] & 0xff);
        }
        stm_driver_send_msg(tx, 10);
        return;
}

/*
 * Set all manipulators to default position
 */
static void manip_default_pos(void)
{
        /*
         * Set grabber and manipulator to default states
         */
        dyn_set_init_pos();

        LL_GPIO_ResetOutputPin(MANIP_VALVE_LEFT_1_PORT, MANIP_VALVE_LEFT_1_PIN);
        LL_GPIO_ResetOutputPin(MANIP_VALVE_RIGHT_1_PORT, MANIP_VALVE_RIGHT_1_PIN);
        LL_GPIO_ResetOutputPin(MANIP_VALVE_LEFT_2_PORT, MANIP_VALVE_LEFT_2_PIN);
        LL_GPIO_ResetOutputPin(MANIP_VALVE_RIGHT_2_PORT, MANIP_VALVE_RIGHT_2_PIN);
        LL_GPIO_ResetOutputPin(MANIP_VALVE_LEFT_3_PORT, MANIP_VALVE_LEFT_3_PIN);
        LL_GPIO_ResetOutputPin(MANIP_VALVE_RIGHT_3_PORT, MANIP_VALVE_RIGHT_3_PIN);
        return;
}

/*
 * Public functions
 */
void manipulators_block(void)
{
        /*
         * Stop and block pump
         */
        manip_pump_stop(1);
        manip_pump_stop(2);
        manip_pump_stop(3);
        manip_set_flag(manip_ctrl, BLOCK_PUMP);
        /*
         * Stop and block dynamixels
         */
        manip_dyn_stop();
        LL_GPIO_ResetOutputPin(DYNAMIXEL_PWR, DYNAMIXEL_PWR_PIN);
        manip_set_flag(manip_ctrl, BLOCK_DYN);
        /*
         * Disable all valves
         */
        LL_GPIO_ResetOutputPin(MANIP_VALVE_LEFT_1_PORT, MANIP_VALVE_LEFT_1_PIN);
        LL_GPIO_ResetOutputPin(MANIP_VALVE_RIGHT_1_PORT, MANIP_VALVE_RIGHT_1_PIN);
        LL_GPIO_ResetOutputPin(MANIP_VALVE_LEFT_2_PORT, MANIP_VALVE_LEFT_2_PIN);
        LL_GPIO_ResetOutputPin(MANIP_VALVE_RIGHT_2_PORT, MANIP_VALVE_RIGHT_2_PIN);
        LL_GPIO_ResetOutputPin(MANIP_VALVE_LEFT_3_PORT, MANIP_VALVE_LEFT_3_PIN);
        LL_GPIO_ResetOutputPin(MANIP_VALVE_RIGHT_3_PORT, MANIP_VALVE_RIGHT_3_PIN);

        return;
}

void manipulators_manager(void *arg)
{
        (void) arg;
        manip_ctrl_t manip_ctrl_st;
        int i = 0;
        uint16_t dyn_speeds[] = {DYN_SPEEDS};
        uint16_t dyn_init_pos[] = {DYN_INIT_POS};

        manip_ctrl_st.bar_adc_channels = malloc(BAR_ADC_CHANNELS);
        memset(manip_ctrl_st.bar_adc_channels,0x00,3);
        manip_ctrl_st.manip_notify = xTaskGetCurrentTaskHandle();
        manip_ctrl_st.dyn_status = 0x00;
        manip_ctrl_st.flags = 0x00;
        manip_ctrl_st.current_time = 0;
        manip_ctrl_st.total_cmd = 0;
        manip_ctrl_st.current_cmd = 0;
        manip_ctrl_st.completed_cmd = 0;
        manip_ctrl_st.bar_adc_sample_count = 0;
        for (i = 0; i < NUMBER_OF_DYNAMIXELS; i++) {
                manip_ctrl_st.dyn_pos[i] = 0x0000;
                manip_ctrl_st.dyn_speeds[i] = dyn_speeds[i];
                manip_ctrl_st.dyn_pos[i] = dyn_init_pos[i];
        }
        for (i = 0; i < MAX_DYN_COMMANDS; i++) {
                memset(manip_ctrl_st.sequence_cmd[i].cmd_buff, 0, 10);
                manip_ctrl_st.sequence_cmd[i].goal_pos = 0x0000;
                manip_ctrl_st.sequence_cmd[i].current_pos = 0x0000;
                manip_ctrl_st.sequence_cmd[i].start_time = 0;
                manip_ctrl_st.sequence_cmd[i].cmd_started = 0;
                manip_ctrl_st.sequence_cmd[i].cmd_completed = 0;
        }
        manip_ctrl = &manip_ctrl_st;
        manip_hw_config();
        vTaskDelay(200);
        /*
         * Init all speeds and wait
         */
        dyn_set_speeds();
        vTaskDelay(30);
        /*
         * Set all manipulators to default position
         */
        manip_default_pos();
        while (1) {
                ulTaskNotifyTake(pdTRUE, portMAX_DELAY);
                if (manip_ctrl->sequence_cmd[manip_ctrl->total_cmd - 1].id == 0x01 ||
                    manip_ctrl->sequence_cmd[manip_ctrl->total_cmd - 1].id == 0x02)
                        manip_ctrl->sequence_cmd[manip_ctrl->total_cmd - 1].delay_ms +=
                                                        LAST_CMD_DELAY;
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
 * Set grippers down
 */
int cmd_gripper_down(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_dyn_flag_set(manip_ctrl, DYN_BUSY_POS)
            || is_manip_flag_set(manip_ctrl, BLOCK_DYN))
                goto error_gripper_down;
        
        
        /*
         * Set dynamixel angles
         */
        uint8_t sequence = (uint8_t)*args;
        uint8_t q = 0;
        uint8_t i;
        for (i = 0; i < 3; i++)
        {
                if ((sequence >> i)  & 0x01) {
                        switch (i)
                        {
                        case 0:
                                dyn_set_angle(q, (i+1), 0x01C2, manip_ctrl->dyn_speeds[i]);
                                break;
                        case 1:
                                dyn_set_angle(q, (i+1), 0x01C2, manip_ctrl->dyn_speeds[i]);
                                break;
                        case 2:
                                dyn_set_angle(q, (i+1), 0x01C2, manip_ctrl->dyn_speeds[i]);
                                break;
                        default:
                                break;
                        }
                        q += 1;
                }
        }

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

error_gripper_down:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Set grippers up (low) 1 cm
 */
int cmd_gripper_up_low(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_dyn_flag_set(manip_ctrl, DYN_BUSY_POS)
            || is_manip_flag_set(manip_ctrl, BLOCK_DYN))
                goto error_gripper_up_low;
        /*
         * Set dynamixel angles
         */
        uint8_t sequence = (uint8_t)*args;
        uint8_t q = 0;
        uint8_t i;
        for (i = 0; i < 3; i++)
        {
                if ((sequence >> i)  & 0x01) {
                        switch (i)
                        {
                        case 0:
                                dyn_set_angle(q, (i+1), 0x0111, manip_ctrl->dyn_speeds[i]);
                                break;
                        case 1:
                                dyn_set_angle(q, (i+1), 0x0111, manip_ctrl->dyn_speeds[i]);
                                break;
                        case 2:
                                dyn_set_angle(q, (i+1), 0x0111, manip_ctrl->dyn_speeds[i]);
                                break;
                        default:
                                break;
                        }
                        q += 1;
                }
        }
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

error_gripper_up_low:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Set grippers up (high) 3 cm
 */
int cmd_gripper_up_high(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_dyn_flag_set(manip_ctrl, DYN_BUSY_POS)
            || is_manip_flag_set(manip_ctrl, BLOCK_DYN))
                goto error_gripper_up_high;
        /*
         * Set dynamixel angles
         */
        uint8_t sequence = (uint8_t)*args;
        uint8_t q = 0;
        uint8_t i;
        for (i = 0; i < 3; i++)
        {
                if ((sequence >> i)  & 0x01) {
                        switch (i)
                        {
                        case 0:
                                dyn_set_angle(q, (i+1), 0x0005, manip_ctrl->dyn_speeds[i]);
                                break;
                        case 1:
                                dyn_set_angle(q, (i+1), 0x0005, manip_ctrl->dyn_speeds[i]);
                                break;
                        case 2:
                                dyn_set_angle(q, (i+1), 0x0005, manip_ctrl->dyn_speeds[i]);
                                break;
                        default:
                                break;
                        }
                        q += 1;
                }
        }
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

error_gripper_up_high:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Set 1 gripper to rise windsocks
 */
int cmd_windsocks(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_dyn_flag_set(manip_ctrl, DYN_BUSY_POS)
            || is_manip_flag_set(manip_ctrl, BLOCK_DYN))
                goto error_windsocks;
        /*
         * Set dynamixel angles
         */
        dyn_set_angle(0, 0x01, 0x0258, manip_ctrl->dyn_speeds[0]);
        manip_ctrl->sequence_cmd[manip_ctrl->total_cmd - 1].delay_ms +=
                                                        SET_PUMP_GROUND_DELAY;
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

error_windsocks:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Barometer check cup status
 */
int cmd_check_bar(char *args)
{
        uint8_t i;
        for (i = 0; i < BAR_ADC_CHANNELS; i++)
        {       
                // Calculating average
                uint32_t buffer = 0;
                uint8_t j;
                for (j = 0; j < BAR_ADC_WINDOW_SIZE; j++)
                {
                        buffer += manip_ctrl->bar_adc_samples[i][j];
                }
                buffer /= BAR_ADC_WINDOW_SIZE;

                //Checking pressure
                if ( buffer > BAR_PACK_CHECK_TRESHOLD)
                        *(args + i) = 0;
                else
                        *(args + i) = 1;
        }
        return 3;
}

/*
 * Start pumping 1
 */
int cmd_start_pump_1(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_manip_flag_set(manip_ctrl, BLOCK_PUMP))
                goto error_start_pump_1;

        /*
         * Start pumping
         */
        manip_pump_start(1);

        memcpy(args, "OK", 3);
        return 3;

error_start_pump_1:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Stop pumping 1
 */
int cmd_stop_pump_1(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_manip_flag_set(manip_ctrl, BLOCK_PUMP))
                goto error_stop_pump_1;

        /*
         * Stop pumping
         */
        manip_pump_stop(1);

        memcpy(args, "OK", 3);
        return 3;

error_stop_pump_1:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Start pumping 2
 */
int cmd_start_pump_2(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_manip_flag_set(manip_ctrl, BLOCK_PUMP))
                goto error_start_pump_2;

        /*
         * Start pumping
         */
        manip_pump_start(2);

        memcpy(args, "OK", 3);
        return 3;

error_start_pump_2:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Stop pumping 2
 */
int cmd_stop_pump_2(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_manip_flag_set(manip_ctrl, BLOCK_PUMP))
                goto error_stop_pump_2;

        /*
         * Stop pumping
         */
        manip_pump_stop(2);

        memcpy(args, "OK", 3);
        return 3;

error_stop_pump_2:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Start pumping 3
 */
int cmd_start_pump_3(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_manip_flag_set(manip_ctrl, BLOCK_PUMP))
                goto error_start_pump_3;

        /*
         * Start pumping
         */
        manip_pump_start(3);

        memcpy(args, "OK", 3);
        return 3;

error_start_pump_3:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Stop pumping 3
 */
int cmd_stop_pump_3(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_manip_flag_set(manip_ctrl, BLOCK_PUMP))
                goto error_stop_pump_3;

        /*
         * Stop pumping
         */
        manip_pump_stop(3);

        memcpy(args, "OK", 3);
        return 3;

error_stop_pump_3:
        memcpy(args, "ER", 3);
        return 3;
}

int cmd_valve_left_1_open(char *args)
{
        LL_GPIO_SetOutputPin(MANIP_VALVE_LEFT_1_PORT, MANIP_VALVE_LEFT_1_PIN);
        memcpy(args, "OK", 3);
        return 3;
}

int cmd_valve_left_1_close(char *args)
{
        LL_GPIO_ResetOutputPin(MANIP_VALVE_LEFT_1_PORT, MANIP_VALVE_LEFT_1_PIN);
        memcpy(args, "OK", 3);
        return 3;
}

int cmd_valve_right_1_open(char *args)
{
        LL_GPIO_SetOutputPin(MANIP_VALVE_RIGHT_1_PORT, MANIP_VALVE_RIGHT_1_PIN);
        memcpy(args, "OK", 3);
        return 3;
}

int cmd_valve_right_1_close(char *args)
{
        LL_GPIO_ResetOutputPin(MANIP_VALVE_RIGHT_1_PORT, MANIP_VALVE_RIGHT_1_PIN);
        memcpy(args, "OK", 3);
        return 3;
}

int cmd_valve_left_2_open(char *args)
{
        LL_GPIO_SetOutputPin(MANIP_VALVE_LEFT_2_PORT, MANIP_VALVE_LEFT_2_PIN);
        memcpy(args, "OK", 3);
        return 3;
}

int cmd_valve_left_2_close(char *args)
{
        LL_GPIO_ResetOutputPin(MANIP_VALVE_LEFT_2_PORT, MANIP_VALVE_LEFT_2_PIN);
        memcpy(args, "OK", 3);
        return 3;
}

int cmd_valve_right_2_open(char *args)
{
        LL_GPIO_SetOutputPin(MANIP_VALVE_RIGHT_2_PORT, MANIP_VALVE_RIGHT_2_PIN);
        memcpy(args, "OK", 3);
        return 3;
}

int cmd_valve_right_2_close(char *args)
{
        LL_GPIO_ResetOutputPin(MANIP_VALVE_RIGHT_2_PORT, MANIP_VALVE_RIGHT_2_PIN);
        memcpy(args, "OK", 3);
        return 3;
}

int cmd_valve_left_3_open(char *args)
{
        LL_GPIO_SetOutputPin(MANIP_VALVE_LEFT_3_PORT, MANIP_VALVE_LEFT_3_PIN);
        memcpy(args, "OK", 3);
        return 3;
}

int cmd_valve_left_3_close(char *args)
{
        LL_GPIO_ResetOutputPin(MANIP_VALVE_LEFT_3_PORT, MANIP_VALVE_LEFT_3_PIN);
        memcpy(args, "OK", 3);
        return 3;
}

int cmd_valve_right_3_open(char *args)
{
        LL_GPIO_SetOutputPin(MANIP_VALVE_RIGHT_3_PORT, MANIP_VALVE_RIGHT_3_PIN);
        memcpy(args, "OK", 3);
        return 3;
}

int cmd_valve_right_3_close(char *args)
{
        LL_GPIO_ResetOutputPin(MANIP_VALVE_RIGHT_3_PORT, MANIP_VALVE_RIGHT_3_PIN);
        memcpy(args, "OK", 3);
        return 3;
}


/*
 * Hardware interrupts
 */
void TIM1_UP_TIM10_IRQHandler(void)
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

void TIM5_IRQHandler(void)
{
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;
        
        if (LL_TIM_IsActiveFlag_UPDATE(BAR_TIM)) {
                LL_TIM_ClearFlag_UPDATE(BAR_TIM);
                
                uint8_t* j = &manip_ctrl->bar_adc_sample_count;
                uint8_t i;
                for (i = 0; i < BAR_ADC_CHANNELS; i++)
                {
                        manip_ctrl->bar_adc_samples[i][*j] = manip_ctrl->bar_adc_channels[i];
                }
                if (*j < BAR_ADC_WINDOW_SIZE)
                        *j += 1;
                else
                        *j = 0;
        }
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}
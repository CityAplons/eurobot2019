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
         * Dynamixel update timer
         */
        LL_APB2_GRP1_EnableClock(LL_APB2_GRP1_PERIPH_TIM8);
        LL_TIM_SetAutoReload(DYNAMIXEL_TIM, DYNAMIXEL_TIM_ARR);
        LL_TIM_SetPrescaler(DYNAMIXEL_TIM, DYNAMIXEL_TIM_PSC);
        LL_TIM_SetCounterMode(DYNAMIXEL_TIM, LL_TIM_COUNTERMODE_UP);
        LL_TIM_EnableIT_UPDATE(DYNAMIXEL_TIM);
        NVIC_SetPriority(DYNAMIXEL_TIM_IRQN, DYNAMIXEL_TIM_IRQN_PRIORITY);
        NVIC_EnableIRQ(DYNAMIXEL_TIM_IRQN);

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
        uint8_t tx[19];
        int i = 0;
        int j = 0;

        memset(tx, 0x00, 19);
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
        uint8_t tx[19];
        int i = 0;
        int j = 0;

        memset(tx, 0x00, 19);
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
        return;
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
                memset(manip_ctrl_st.sequence_cmd[i].cmd_buff, 0, 10);
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
        vTaskDelay(30);
        /*
         * Set all manipulators to default position
         */
        dyn_set_init_pos();
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
 * Set arm down (512 -> 712)
 */
int cmd_arm_down(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_dyn_flag_set(manip_ctrl, DYN_BUSY_POS)
            || is_manip_flag_set(manip_ctrl, BLOCK_DYN))
                goto error_arm_down;
        /*
         * Set dynamixel angles
         */
        dyn_set_angle(0, 0x06, 0x020F, manip_ctrl->dyn_speeds[5]);
        manip_ctrl->sequence_cmd[manip_ctrl->total_cmd - 1].delay_ms +=
                                                                RELEASER_DELAY;
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

error_arm_down:
        memcpy(args, "ER", 3);
        return 3;
}

/*
 * Set arm up (712->512)
 */
int cmd_arm_up(char *args)
{
        /*
         * Check whether manipulators is ready or not
         */
        if (!manip_ctrl || is_dyn_flag_set(manip_ctrl, DYN_BUSY_POS)
            || is_manip_flag_set(manip_ctrl, BLOCK_DYN))
                goto error_arm_up;
        /*
         * Set dynamixel angles
         */
        dyn_set_angle(0, 0x06, 0x0300, manip_ctrl->dyn_speeds[5]);
        manip_ctrl->sequence_cmd[manip_ctrl->total_cmd - 1].delay_ms +=
                                                                RELEASER_DELAY;
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

error_arm_up:
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

        for (size_t i = 0; i < 5; i++)
        {
                if ((sequence >> i)  & 0x01) {
                        dyn_set_angle(i, (i+1), 0x0316, manip_ctrl->dyn_speeds[i]);
                }
        }
        manip_ctrl->sequence_cmd[manip_ctrl->total_cmd - 1].delay_ms +=
                                                                        RELEASER_DELAY;

        /*
         * Notify manipulators manager
         */
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
        uint8_t seq = (uint8_t)*args;

        for (size_t i = 0; i < 5; i++)
        {
                if ((seq >> i)  & 0x01) {
                        dyn_set_angle(i, (i+1), 0x01EA, manip_ctrl->dyn_speeds[i]);
                }
        }

        manip_ctrl->sequence_cmd[manip_ctrl->total_cmd - 1].delay_ms +=
                                                                       RELEASER_DELAY;

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

int cmd_l_door_open(char *args)
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
        dyn_set_angle(0, 0x07, 0x0200, manip_ctrl->dyn_speeds[6]);
        manip_ctrl->sequence_cmd[manip_ctrl->total_cmd - 1].delay_ms +=
                                                       RELEASER_DELAY;
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

int cmd_l_door_close(char *args)
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
        dyn_set_angle(0, 0x07, 0x03FF, manip_ctrl->dyn_speeds[6]);
        manip_ctrl->sequence_cmd[manip_ctrl->total_cmd - 1].delay_ms +=
                                                                        RELEASER_DELAY;
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

int cmd_r_door_open(char *args)
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
        dyn_set_angle(0, 0x08, 0x0200, manip_ctrl->dyn_speeds[7]);
        manip_ctrl->sequence_cmd[manip_ctrl->total_cmd - 1].delay_ms +=
                                                        RELEASER_DELAY;
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

int cmd_r_door_close(char *args)
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
        dyn_set_angle(0, 0x08, 0x03FF, manip_ctrl->dyn_speeds[7]);
        manip_ctrl->sequence_cmd[manip_ctrl->total_cmd - 1].delay_ms +=
                                                       RELEASER_DELAY;
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
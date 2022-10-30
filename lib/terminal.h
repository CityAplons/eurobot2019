#ifndef _H_TERMINAL_
#define _H_TERMINAL_

#include "stm32f4xx_ll_usart.h"

#include "FreeRTOS.h"
#include "task.h"
#include "terminal_cmds.h"
#include "uros_interfaces.h"

typedef struct {
        USART_TypeDef *dev;
        char *buffer;
        char *com_args;
        uint8_t *stm_dr_buff;
        TaskHandle_t xTaskToNotify;
} terminal_task_t;

#define TERM_UROS_MSG_CAP       16
#define TERM_CH_BUF_SIZE        512
#define TERM_ARGS_BUF_SIZE      128
#define TERM_STM_DR_BUF_SIZE    10
#define TERM_MAN_STACK_DEPTH    4096
#define IS_COMMAND_VALID(com) (((com) > LOWER_BOUND_CMD) && \
                               ((com) < UPPER_BOUND_CMD))

/*
 * Memory for terminal task
 */
StackType_t terminal_manager_ts[TERM_MAN_STACK_DEPTH];
StaticTask_t terminal_manager_tb;

/*
 * Main manager for processing incoming commands
 */
void terminal_manager(void *arg);

extern uros_t uros_data;

#endif

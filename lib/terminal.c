#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "stm32f407xx.h"
#include "stm32f4xx_ll_usart.h"
#include "peripheral.h"
#include "gpio_map.h"
#include "terminal.h"
#include "dev_map.h"

#include "FreeRTOS.h"
#include "task.h"
#include "terminal_cmds.h"

#include <transports.h> 
#include <allocators.h>
#include <uxr/client/client.h>
#include <ucdr/microcdr.h>
#include <rmw_microros/rmw_microros.h> 

uros_t uros_data = {
        .ready = 0,
        .connected = 0,
        .prefix = "racer"
};

typedef struct terminal_uros {
        rcl_publisher_t publisher;
        rcl_subscription_t subscriber;
        std_msgs__msg__String rx_msg;
        std_msgs__msg__String tx_msg;
        rclc_executor_t executor;
} terminal_uros_t;

/*
 * Private task notifier
 */
static terminal_task_t * term_ctrl;
static terminal_uros_t * term_pubsub;

static void terminal_hw_config()
{
         /* Init terminal pins */
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOC);

        LL_GPIO_SetAFPin_8_15(TERM_USART_TX_PORT, TERM_USART_TX_PIN,
                             TERM_USART_PIN_AF);
        LL_GPIO_SetPinMode(TERM_USART_TX_PORT, TERM_USART_TX_PIN,
                           LL_GPIO_MODE_ALTERNATE);
        LL_GPIO_SetPinOutputType(TERM_USART_TX_PORT, TERM_USART_TX_PIN,
                                 TERM_USART_OUTPUT_TYPE);
        LL_GPIO_SetPinPull(TERM_USART_TX_PORT, TERM_USART_TX_PIN,
                           LL_GPIO_PULL_NO);
        LL_GPIO_SetPinSpeed(TERM_USART_TX_PORT, TERM_USART_TX_PIN,
                            LL_GPIO_SPEED_FREQ_HIGH);

        LL_GPIO_SetAFPin_8_15(TERM_USART_RX_PORT, TERM_USART_RX_PIN,
                             TERM_USART_PIN_AF);
        LL_GPIO_SetPinMode(TERM_USART_RX_PORT, TERM_USART_RX_PIN,
                           LL_GPIO_MODE_ALTERNATE);
        LL_GPIO_SetPinOutputType(TERM_USART_RX_PORT, TERM_USART_RX_PIN,
                                 TERM_USART_OUTPUT_TYPE);
        LL_GPIO_SetPinPull(TERM_USART_RX_PORT, TERM_USART_RX_PIN,
                           LL_GPIO_PULL_NO);
        LL_GPIO_SetPinSpeed(TERM_USART_RX_PORT, TERM_USART_RX_PIN,
                            LL_GPIO_SPEED_FREQ_HIGH);

        /* Enable clocking on USART and DMA */
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_DMA1);
        LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_USART3);

        /* UART configuration */
        LL_USART_SetTransferDirection(TERM_USART,
                                      TERM_USART_TRANSFER_DIRECTION);
        LL_USART_SetParity(TERM_USART, TERM_USART_PARITY);
        LL_USART_SetDataWidth(TERM_USART, TERM_USART_DATA_WIDTH);
        LL_USART_SetStopBitsLength(TERM_USART, TERM_USART_STOPBITS);
        LL_USART_SetHWFlowCtrl(TERM_USART, TERM_USART_HAWDWARE_FLOAT_CNTRL);
        LL_USART_SetBaudRate(TERM_USART,
                             SystemCoreClock/TERM_USART_PERIPH_PRESCALER,
                             TERM_USART_OVERSAMPL, TERM_USART_BAUDRATE);
        LL_USART_EnableDirectionRx(TERM_USART);
        LL_USART_EnableDirectionTx(TERM_USART);
        LL_USART_EnableDMAReq_RX(TERM_USART);
        LL_USART_EnableIT_IDLE(TERM_USART);
        LL_USART_Enable(TERM_USART);

        NVIC_SetPriority(TERM_USART_IRQN, TERM_USART_IRQN_PRIORITY);
        NVIC_EnableIRQ(TERM_USART_IRQN);

        /* DMA configuration */
        LL_DMA_SetChannelSelection(TERM_DMA, TERM_DMA_STREAM,
                                   TERM_DMA_CHANNEL);
        LL_DMA_ConfigAddresses(TERM_DMA, TERM_DMA_STREAM, TERM_DMA_SRC_ADDR,
                               (uint32_t)term_ctrl->buffer, TERM_DMA_DIRECTION);
        LL_DMA_SetDataLength(TERM_DMA, TERM_DMA_STREAM, TERM_CH_BUF_SIZE);
        LL_DMA_SetMemoryIncMode(TERM_DMA, TERM_DMA_STREAM,
                                TERM_DMA_MEM_INC_MODE);

        LL_DMA_EnableStream(TERM_DMA, TERM_DMA_STREAM);
        LL_DMA_EnableIT_TC(TERM_DMA, TERM_DMA_STREAM);

        /* Enable global DMA stream interrupts */
        NVIC_SetPriority(TERM_DMA_STREAM_IRQN, TERM_DMA_STREAM_IRQN_PRIORITY);
        NVIC_EnableIRQ(TERM_DMA_STREAM_IRQN);

        /* Enable clocking on USART and DMA */
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_DMA2);
        LL_APB2_GRP1_EnableClock(LL_APB2_GRP1_PERIPH_USART1);

         /* Init stm32f0 communication pins */
        LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOB);

        LL_GPIO_SetPinMode(STM_DRIVER_USART_TX_PORT, STM_DRIVER_USART_TX_PIN,
                           LL_GPIO_MODE_ALTERNATE);
        LL_GPIO_SetAFPin_0_7(STM_DRIVER_USART_TX_PORT, STM_DRIVER_USART_TX_PIN,
                             STM_DRIVER_USART_PIN_AF);
        LL_GPIO_SetPinOutputType(STM_DRIVER_USART_TX_PORT,
                                 STM_DRIVER_USART_TX_PIN,
                                 LL_GPIO_OUTPUT_PUSHPULL);
        LL_GPIO_SetPinPull(STM_DRIVER_USART_TX_PORT, STM_DRIVER_USART_TX_PIN,
                           LL_GPIO_PULL_UP);
        LL_GPIO_SetPinSpeed(STM_DRIVER_USART_TX_PORT, STM_DRIVER_USART_TX_PIN,
                            LL_GPIO_SPEED_FREQ_HIGH);

        LL_GPIO_SetPinMode(STM_DRIVER_USART_RX_PORT, STM_DRIVER_USART_RX_PIN,
                           LL_GPIO_MODE_ALTERNATE);
        LL_GPIO_SetAFPin_0_7(STM_DRIVER_USART_RX_PORT, STM_DRIVER_USART_RX_PIN,
                             STM_DRIVER_USART_PIN_AF);
        LL_GPIO_SetPinOutputType(STM_DRIVER_USART_RX_PORT,
                                 STM_DRIVER_USART_RX_PIN,
                                 LL_GPIO_OUTPUT_PUSHPULL);
        LL_GPIO_SetPinPull(STM_DRIVER_USART_RX_PORT, STM_DRIVER_USART_RX_PIN,
                           LL_GPIO_PULL_UP);
        LL_GPIO_SetPinSpeed(STM_DRIVER_USART_RX_PORT, STM_DRIVER_USART_RX_PIN,
                            LL_GPIO_SPEED_FREQ_HIGH);

        /* UART configuration for stm32f0 communication */
        LL_USART_SetTransferDirection(STM_DRIVER_USART,
                                      LL_USART_DIRECTION_TX_RX);
        LL_USART_SetParity(STM_DRIVER_USART, LL_USART_PARITY_NONE);
        LL_USART_SetDataWidth(STM_DRIVER_USART, LL_USART_DATAWIDTH_8B);
        LL_USART_SetStopBitsLength(STM_DRIVER_USART, LL_USART_STOPBITS_1);
        LL_USART_SetHWFlowCtrl(STM_DRIVER_USART, LL_USART_HWCONTROL_NONE);
        LL_USART_SetBaudRate(STM_DRIVER_USART,
                             SystemCoreClock/STM_DRIVER_USART_PERIPH_PRESCALER,
                             LL_USART_OVERSAMPLING_16,
                             STM_DRIVER_USART_BAUDRATE);
        LL_USART_EnableDirectionRx(STM_DRIVER_USART);
        LL_USART_EnableDirectionTx(STM_DRIVER_USART);
        LL_USART_EnableDMAReq_RX(STM_DRIVER_USART);
        LL_USART_EnableIT_IDLE(STM_DRIVER_USART);
        LL_USART_Enable(STM_DRIVER_USART);

        NVIC_SetPriority(STM_DRIVER_USART_IRQN, STM_DRIVER_USART_IRQN_PRIORITY);
        NVIC_EnableIRQ(STM_DRIVER_USART_IRQN);

        /* DMA configuration for stm32f0 communication */
        LL_DMA_SetChannelSelection(STM_DRIVER_DMA, STM_DRIVER_DMA_STREAM,
                                   STM_DRIVER_DMA_CHANNEL);
        LL_DMA_ConfigAddresses(STM_DRIVER_DMA, STM_DRIVER_DMA_STREAM,
                               STM_DRIVER_DMA_SRC_ADDR,
                               (uint32_t)term_ctrl->stm_dr_buff,
                               STM_DRIVER_DMA_DIRECTION);
        LL_DMA_SetDataLength(STM_DRIVER_DMA, STM_DRIVER_DMA_STREAM,
                             STM_DRIVER_DMA_BUFFER_SIZE);
        LL_DMA_SetMemoryIncMode(STM_DRIVER_DMA, STM_DRIVER_DMA_STREAM,
                                STM_DRIVER_DMA_MEM_INC_MODE);

        LL_DMA_EnableStream(STM_DRIVER_DMA, STM_DRIVER_DMA_STREAM);
        LL_DMA_EnableIT_TC(STM_DRIVER_DMA, STM_DRIVER_DMA_STREAM);

        /* Enable global stm32f0 communication DMA stream interrupts */
        NVIC_SetPriority(STM_DRIVER_DMA_STREAM_IRQN,
                         STM_DRIVER_DMA_STREAM_IRQN_PRIORITY);
        NVIC_EnableIRQ(STM_DRIVER_DMA_STREAM_IRQN);
        return;
}

static void term_request(const void * msgin)
{
        const std_msgs__msg__String * msg = (const std_msgs__msg__String *)msgin;

        int command_code = msg->data.data[0];
        if (!IS_COMMAND_VALID(command_code) ||
            !commands_handlers[command_code])
                return;
        
        memcpy(term_ctrl->com_args, msg->data.data + 1, msg->data.size - 1);
        int resp_len = commands_handlers[command_code](term_ctrl->com_args);

        term_pubsub->tx_msg.data.size = resp_len;
        RCCHECK(rcl_publish(&term_pubsub->publisher, (const void*)&term_pubsub->tx_msg, NULL));
}

void terminal_manager(void *arg)
{
        (void) arg;
        terminal_task_t term_t;

        term_t.dev = TERM_USART;
        term_t.buffer = malloc(TERM_CH_BUF_SIZE);
        term_t.com_args = malloc(TERM_ARGS_BUF_SIZE);
        term_t.stm_dr_buff = malloc(TERM_STM_DR_BUF_SIZE);
        term_t.xTaskToNotify = xTaskGetCurrentTaskHandle();
        term_ctrl = &term_t;
        terminal_hw_config();

        // iosysc_setdev(term_t.dev);

        rmw_uros_set_custom_transport( 
                1, 
                &term_t, 
                freertos_serial_open, 
                freertos_serial_close, 
                freertos_serial_write, 
                freertos_serial_read); 

        uros_data.allocator = rcutils_get_zero_initialized_allocator();
        uros_data.allocator.allocate = __freertos_allocate;
        uros_data.allocator.deallocate = __freertos_deallocate;
        uros_data.allocator.reallocate = __freertos_reallocate;
        uros_data.allocator.zero_allocate = __freertos_zero_allocate;

        if (!rcutils_set_default_allocator(&uros_data.allocator)) {
                printf("Error on default allocators (line %d)\n",__LINE__); 
        }
        uros_data.ready = 1;

        RCCHECK(rclc_support_init(&uros_data.support, 0, NULL, &uros_data.allocator));
        RCCHECK(rclc_node_init_default(&uros_data.node, "stm32_node", uros_data.prefix, &uros_data.support));
        uros_data.connected = 1;

        terminal_uros_t terminal_nodelet;

        // create terminal comaptibility publisher
	RCCHECK(rclc_publisher_init_best_effort(
		&terminal_nodelet.publisher,
		&uros_data.node,
		ROSIDL_GET_MSG_TYPE_SUPPORT(std_msgs, msg, String),
		"compat/rx"));
        
        // create terminal comaptibility subscriber
	RCCHECK(rclc_subscription_init_default(
		&terminal_nodelet.subscriber,
		&uros_data.node,
		ROSIDL_GET_MSG_TYPE_SUPPORT(std_msgs, msg, String),
		"compat/tx"));

	terminal_nodelet.tx_msg.data.data = term_t.com_args;
	terminal_nodelet.tx_msg.data.capacity = TERM_CH_BUF_SIZE;

	char incoming_buffer[TERM_UROS_MSG_CAP];
	terminal_nodelet.rx_msg.data.data = incoming_buffer;
	terminal_nodelet.rx_msg.data.capacity = TERM_UROS_MSG_CAP;

	RCCHECK(rclc_executor_init(&terminal_nodelet.executor, &uros_data.support.context, 3, &uros_data.allocator));
	RCCHECK(rclc_executor_add_subscription(&terminal_nodelet.executor, &terminal_nodelet.subscriber, &terminal_nodelet.rx_msg,
		&term_request, ON_NEW_DATA));

        term_pubsub = &terminal_nodelet;

        while (1) {
                rclc_executor_spin_some(&terminal_nodelet.executor, RCL_MS_TO_NS(10));
                vTaskDelay(10 * portTICK_PERIOD_MS);
        }
        return;
}

/*
 * Terminal commands implementation
 */
int cmd_get_col_av_data(char *args)
{
        memcpy(args, term_ctrl->stm_dr_buff, NUMBER_OF_PROX_SENSORS);
        return NUMBER_OF_PROX_SENSORS;
}

/*
 * Hardware interrupts
 */
void USART3_IRQHandler(void)
{
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;

        LL_USART_ClearFlag_IDLE(TERM_USART);
        LL_DMA_DisableStream(TERM_DMA, TERM_DMA_STREAM);
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}

void DMA1_Stream1_IRQHandler(void)
{
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;

        if (LL_DMA_IsActiveFlag_TC1(TERM_DMA)) {
                LL_DMA_ClearFlag_TC1(TERM_DMA);
                LL_DMA_ClearFlag_HT1(TERM_DMA);
                LL_DMA_EnableStream(TERM_DMA, TERM_DMA_STREAM);
                vTaskNotifyGiveFromISR(term_ctrl->xTaskToNotify,
                                       &xHigherPriorityTaskWoken);
        }
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}

void USART1_IRQHandler(void)
{
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;

        LL_USART_ClearFlag_IDLE(STM_DRIVER_USART);
        LL_DMA_DisableStream(STM_DRIVER_DMA, STM_DRIVER_DMA_STREAM);
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}

void DMA2_Stream2_IRQHandler(void)
{
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;

        if (LL_DMA_IsActiveFlag_TC2(STM_DRIVER_DMA)) {
                LL_DMA_ClearFlag_TC2(STM_DRIVER_DMA);
                LL_DMA_ClearFlag_HT2(STM_DRIVER_DMA);
                LL_DMA_EnableStream(STM_DRIVER_DMA, STM_DRIVER_DMA_STREAM);
        }
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}

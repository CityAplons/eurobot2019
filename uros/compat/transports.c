#include "transports.h"
#include "terminal.h"
#include "peripheral.h"

#include "stm32f407xx.h"
#include "stm32f4xx_ll_usart.h"

#include "FreeRTOS.h"
#include "task.h"

#include <rcl/time.h>

#include <unistd.h>
#include <stdio.h>
#include <string.h>

static size_t dma_head = 0, dma_tail = 0;

bool freertos_serial_open(__unused uxrCustomTransport * transport){
    NVIC_EnableIRQ(TERM_USART_IRQN);
    NVIC_EnableIRQ(TERM_DMA_STREAM_IRQN);

    return true;
}

bool freertos_serial_close(__unused uxrCustomTransport * transport){
    NVIC_DisableIRQ(TERM_USART_IRQN);
    NVIC_DisableIRQ(TERM_DMA_STREAM_IRQN);

    return true;
}

size_t freertos_serial_write(uxrCustomTransport* transport, const uint8_t * buf, size_t len, __unused uint8_t * err){
    int i = 0;
    size_t resp_len = len;
    terminal_task_t* term = (terminal_task_t*) transport->args;

    LL_USART_ClearFlag_TC(term->dev);
    while (resp_len--) {
            while (!LL_USART_IsActiveFlag_TXE(term->dev))
                    taskYIELD();
            LL_USART_TransmitData8(term->dev, buf[i++]);
    }
    while (!LL_USART_IsActiveFlag_TC(term->dev))
            taskYIELD();

    return i;
}

size_t freertos_serial_read(uxrCustomTransport* transport, uint8_t* buf, size_t len, int timeout, __unused uint8_t* err){
    terminal_task_t* term = (terminal_task_t*) transport->args;
    if (!ulTaskNotifyTake(pdTRUE, RCUTILS_NS_TO_S(timeout) * configTICK_RATE_HZ)) {
        return 0;
    }

    __disable_irq();
    dma_tail = TERM_CH_BUF_SIZE - LL_DMA_GetDataLength(TERM_DMA, TERM_DMA_STREAM);
    __enable_irq();

    size_t wrote = 0;
    while ((dma_head != dma_tail) && (wrote < len)){
        buf[wrote] = term->buffer[dma_head];
        dma_head = (dma_head + 1) % TERM_CH_BUF_SIZE;
        wrote++;
    }
    
    return wrote;
}

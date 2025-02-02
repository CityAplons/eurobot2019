#ifndef _H_PERIPHERAL_
#define _H_PERIPHERAL_

#include "stm32f407xx.h"
#include "stm32f4xx_ll_rcc.h"
#include "stm32f4xx_ll_bus.h"
#include "stm32f4xx_ll_usart.h"
#include "stm32f4xx_ll_dma.h"
#include "stm32f4xx_ll_tim.h"
#include "stm32f4xx_ll_system.h"
#include "stm32f4xx_ll_exti.h"
#include "stm32f4xx_ll_adc.h"

/*
 * Clock configuration parameters
 */
#define RCC_SOURCE                              LL_RCC_PLLSOURCE_HSE
#define RCC_PLLM                                LL_RCC_PLLM_DIV_8
#define RCC_PLLN                                336
#define RCC_PLLR                                LL_RCC_PLLP_DIV_2
#define RCC_SYS_SOURCE                          LL_RCC_SYS_CLKSOURCE_PLL
#define RCC_AHB_PRESCALER                       LL_RCC_SYSCLK_DIV_1
#define RCC_APB1_PRESCALER                      LL_RCC_APB1_DIV_4
#define RCC_APB2_PRESCALER                      LL_RCC_APB2_DIV_2
#define RCC_SYSTEM_CLK                          168000000
#define RCC_AHB_CLK                             RCC_SYSTEM_CLK/1
#define RCC_APB1_CLK                            RCC_SYSTEM_CLK/4
#define RCC_APB2_CLK                            RCC_SYSTEM_CLK/2

/*
 * Terminal configuration
 * UART configuration
 */
#define TERM_USART                              USART3
#define TERM_USART_IRQN                         USART3_IRQn
#define TERM_USART_IRQN_PRIORITY                1
#define TERM_USART_PERIPH_PRESCALER             4
#define TERM_USART_BAUDRATE                     115200
#define TERM_USART_DATA_WIDTH                   LL_USART_DATAWIDTH_8B
#define TERM_USART_HAWDWARE_FLOAT_CNTRL         LL_USART_HWCONTROL_NONE
#define TERM_USART_OVERSAMPL                    LL_USART_OVERSAMPLING_16
#define TERM_USART_PARITY                       LL_USART_PARITY_NONE
#define TERM_USART_STOPBITS                     LL_USART_STOPBITS_1
#define TERM_USART_TRANSFER_DIRECTION           LL_USART_DIRECTION_TX_RX

/*
 * Terminal configuration
 * DMA configuration
 */
#define TERM_DMA                                DMA1
#define TERM_DMA_CHANNEL                        LL_DMA_CHANNEL_4
#define TERM_DMA_STREAM                         LL_DMA_STREAM_1
#define TERM_DMA_STREAM_IRQN                    DMA1_Stream1_IRQn
#define TERM_DMA_STREAM_IRQN_PRIORITY           (configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY + 1)
#define TERM_DMA_DIRECTION                      LL_DMA_DIRECTION_PERIPH_TO_MEMORY
#define TERM_DMA_BUFFER_SIZE                    256
#define TERM_DMA_MEM_INC_MODE                   LL_DMA_MEMORY_INCREMENT
#define TERM_DMA_SRC_ADDR                       (uint32_t)&(TERM_USART)->DR

/*
 * STM32F0 driver configuration
 * UART configuration
 */
#define STM_DRIVER_USART                        USART1
#define STM_DRIVER_USART_IRQN                   USART1_IRQn
#define STM_DRIVER_USART_IRQN_PRIORITY          1
#define STM_DRIVER_USART_PERIPH_PRESCALER       2
#define STM_DRIVER_USART_BAUDRATE               115200

/*
 * STM32F0 driver configuration
 * DMA configuration
 */
#define STM_DRIVER_DMA                          DMA2
#define STM_DRIVER_DMA_CHANNEL                  LL_DMA_CHANNEL_4
#define STM_DRIVER_DMA_STREAM                   LL_DMA_STREAM_2
#define STM_DRIVER_DMA_STREAM_IRQN              DMA2_Stream2_IRQn
#define STM_DRIVER_DMA_STREAM_IRQN_PRIORITY     (configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY + 1)
#define STM_DRIVER_DMA_DIRECTION                LL_DMA_DIRECTION_PERIPH_TO_MEMORY
#define STM_DRIVER_DMA_BUFFER_SIZE              256
#define STM_DRIVER_DMA_MEM_INC_MODE             LL_DMA_MEMORY_INCREMENT
#define STM_DRIVER_DMA_SRC_ADDR                 (uint32_t)&(STM_DRIVER_USART)->DR

/*
 * Motor kinematics timer configuration
 * APB1_CLK = 42000000, TIM_ARR = 42000, freq_pwm = 1KHz
 */
#define MOTOR_TIM                               TIM4
#define MOTOR_TIM_PERIPH_PRESCALER              4
#define MOTOR_PWM_TIM_ARR                       42000
#define MOTOR_PWM_TIM_CCR_INIT                  4200
#define MOTOR_PWM_TIM_PSC                       1

/*
 * Odometry configuration
 * Encoder times configuration
 */
#define ENCODER_TIM_CNT_INITIAL_VALUE           (uint16_t) 0x7530
#define ENCODER_TIM_ARR                         0xffff

#define ENCODER_1_TIM_MODULE                    TIM2
#define ENCODER_1_CNT                           ((uint16_t *)&(ENCODER_1_TIM_MODULE->CNT))
#define ENCODER_2_TIM_MODULE                    TIM3
#define ENCODER_2_CNT                           ((uint16_t *)&(ENCODER_2_TIM_MODULE->CNT))
#define ENCODER_3_TIM_MODULE                    TIM1
#define ENCODER_3_CNT                           ((uint16_t *)&(ENCODER_3_TIM_MODULE->CNT))

/*
 * Time calculation timer configuration
 * APB1_CLK = 42000000, TIM_ARR = 42000, freq = 50Hz
 */
#define ODOMETRY_TIM_MODULE                     TIM6
#define ODOMETRY_IRQN                           TIM6_DAC_IRQn
#define ODOMETRY_IRQN_PRIORITY                  (configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY + 2)
#define ODOMETRY_TIM_ARR                        41999
#define ODOMETRY_TIM_PSC                        19

/*
 * Dynamixel update status timer configuration
 * APB2_CLK = 84000000, TIM_MULL x2, freq = 1000Hz
 */
#define DYNAMIXEL_TIM                           TIM10
#define DYNAMIXEL_TIM_IRQN                      TIM1_UP_TIM10_IRQn
#define DYNAMIXEL_TIM_IRQN_PRIORITY             (configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY + 2)
#define DYNAMIXEL_TIM_ARR                       999
#define DYNAMIXEL_TIM_PSC                       167

#define LED_TIM                                 TIM8
#define LED_TIM_MODE                            LL_TIM_COUNTERMODE_UP
#define LED_TIM_CCR_INIT                        83000
#define LED_TIM_ARR                             84000

/*
 * Robot operating timer
 * APB1_CLK*2 = 84000000, TIM_PCS = 41999, TIM_ARR = 1999, freq = 1Hz
 */
#define MOTOR_OPERATING_TIM                     TIM7
#define MOTOR_OPERATING_TIM_PSC                 41999
#define MOTOR_OPERATING_TIM_ARR                 1999
#define MOTOR_OPERATING_TIM_IRQN                TIM7_IRQn
#define MOTOR_OPERATING_TIM_IRQN_PRIORITY       (configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY + 1)

/*
 * Exti setup for strategy choose
 */
#define MOTOR_STRATEGY_SYS_EXTI_PORT            LL_SYSCFG_EXTI_PORTE
#define MOTOR_STRATEGY_SYS_EXTI_LINE            LL_SYSCFG_EXTI_LINE6
#define MOTOR_STRATEGY_EXTI_LINE                LL_EXTI_LINE_6
#define MOTOR_STRATEGY_IRQN                     EXTI9_5_IRQn
#define MOTOR_STRATEGY_IRQN_PRIORITY            (configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY + 1)

/*
 * Timer for dynamics calculations
 * timer_tick_frequency = Timer_default_frequency / [(PSC + 1)  (ARR + 1)]
 * CLK = 84000000, freq = 100 Hz,
 */
#define MOTOR_TR_TIM                                TIM14
#define MOTOR_TR_TIM_MODE                           LL_TIM_COUNTERMODE_UP
#define MOTOR_TR_TIM_ARR                            199
#define MOTOR_TR_TIM_PSC                            4199
#define MOTOR_TR_TIM_IRQN                           TIM8_TRG_COM_TIM14_IRQn
#define MOTOR_TR_TIM_IRQN_PRIORITY                  (configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY + 1)

/*
 * Barometer timer for ADC configuration
 * APB1_CLK*2 = 84000000, PSC = 4200, ARR = 400, CCR = ARR/2 (50% duticycle) 20 Hz
 */
#define BAR_TIM                                 TIM5
#define BAR_TIM_OC_CHANNEL                      LL_TIM_CHANNEL_CH1
#define BAR_IRQN                                TIM5_IRQn
#define BAR_IRQN_PRIORITY                       (configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY + 2)
#define BAR_PWM_TIM_PSC                         4199
#define BAR_PWM_TIM_ARR                         199
#define BAR_PWM_TIM_CCR_INIT                    100

/*
 * ADC configuration
 */
#define BAR_ADC                                 ADC1
#define BAR_ADC_CMN_INST                        ADC123_COMMON
#define BAR_ADC_1_CHANNEL                       LL_ADC_CHANNEL_9
#define BAR_ADC_2_CHANNEL                       LL_ADC_CHANNEL_8
#define BAR_ADC_3_CHANNEL                       LL_ADC_CHANNEL_15
#define BAR_ADC_RESOLUTION                      LL_ADC_RESOLUTION_8B
#define BAR_ADC_ALIGN                           LL_ADC_DATA_ALIGN_RIGHT
#define BAR_ADC_SEQ_SCAN                        LL_ADC_SEQ_SCAN_ENABLE
#define BAR_ADC_TRIG                            LL_ADC_REG_TRIG_EXT_TIM5_CH1
#define BAR_ADC_SINGLE_MODE                     LL_ADC_REG_CONV_SINGLE
#define BAR_ADC_DMA_MODE                        LL_ADC_REG_DMA_TRANSFER_UNLIMITED
#define BAR_ADC_EOC_MODE                        LL_ADC_REG_FLAG_EOC_SEQUENCE_CONV
#define BAR_ADC_SAMPL_TIME                      LL_ADC_SAMPLINGTIME_15CYCLES
#define BAR_ADC_TRIG_POLARITY                   LL_ADC_REG_TRIG_EXT_RISING

/*
 * DMA for barometer ADC configuration
 */
#define BAR_DMA                                 DMA2
#define BAR_DMA_CHANNEL                         LL_DMA_CHANNEL_0
#define BAR_DMA_STREAM                          LL_DMA_STREAM_0
#define BAR_DMA_DIRECTION                       LL_DMA_DIRECTION_PERIPH_TO_MEMORY
#define BAR_DMA_BUFFER_SIZE                     3
#define BAR_DMA_MEM_INC_MODE                    LL_DMA_MEMORY_INCREMENT
#define BAR_DMA_PERIPH_INC_MODE                 LL_DMA_PERIPH_NOINCREMENT
#define BAR_DMA_MODE                            LL_DMA_MODE_CIRCULAR
#define BAR_DMA_SRC_ADDR                        (uint32_t)&(ADC1)->DR

#endif

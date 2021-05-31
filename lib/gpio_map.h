#ifndef _H_GPIO_MAP_
#define _H_GPIO_MAP_

#include "stm32f407xx.h"
#include "stm32f4xx_ll_gpio.h"

/*
 * Terminal UART pinout
 */
#define TERM_USART_TX_PORT                  GPIOC
#define TERM_USART_TX_PIN                   LL_GPIO_PIN_10
#define TERM_USART_RX_PORT                  GPIOC
#define TERM_USART_RX_PIN                   LL_GPIO_PIN_11
#define TERM_USART_PIN_AF                   LL_GPIO_AF_7
#define TERM_USART_OUTPUT_TYPE              LL_GPIO_OUTPUT_PUSHPULL

/*
 * STMF0 driver UART pinout
 */
#define STM_DRIVER_USART_TX_PORT            GPIOB
#define STM_DRIVER_USART_TX_PIN             LL_GPIO_PIN_6
#define STM_DRIVER_USART_RX_PORT            GPIOB
#define STM_DRIVER_USART_RX_PIN             LL_GPIO_PIN_7
#define STM_DRIVER_USART_PIN_AF             LL_GPIO_AF_7

/*
 * Dynamixel power control
 */
#define DYNAMIXEL_PWR                       GPIOD
#define DYNAMIXEL_PWR_PIN                   LL_GPIO_PIN_11
#define DYNAMIXEL_PWR_OUTPUT_TYPE           LL_GPIO_OUTPUT_PUSHPULL

/*
 * LED control
 */
#define LED_PORT                            GPIOC
#define LED_RED_PIN                         LL_GPIO_PIN_6
#define LED_GREEN_PIN                       LL_GPIO_PIN_7
#define LED_BLUE_PIN                        LL_GPIO_PIN_8
#define LED_PIN_AF                          LL_GPIO_AF_3

/*
 * GPIOs for start/stop pumps
 */
#define MANIP_PUMP_1_PORT                     GPIOD
#define MANIP_PUMP_1_PIN                      LL_GPIO_PIN_0
#define MANIP_PUMP_1_OUTPUT_TYPE              LL_GPIO_OUTPUT_PUSHPULL
#define MANIP_PUMP_2_PORT                     GPIOD
#define MANIP_PUMP_2_PIN                      LL_GPIO_PIN_4
#define MANIP_PUMP_2_OUTPUT_TYPE              LL_GPIO_OUTPUT_PUSHPULL
#define MANIP_PUMP_3_PORT                     GPIOD
#define MANIP_PUMP_3_PIN                      LL_GPIO_PIN_8
#define MANIP_PUMP_3_OUTPUT_TYPE              LL_GPIO_OUTPUT_PUSHPULL

/*
 * GPIO left valves
 */
#define MANIP_VALVE_LEFT_1_PORT                    GPIOD
#define MANIP_VALVE_LEFT_1_PIN                     LL_GPIO_PIN_2
#define MANIP_VALVE_LEFT_2_PORT                    GPIOD
#define MANIP_VALVE_LEFT_2_PIN                     LL_GPIO_PIN_5
#define MANIP_VALVE_LEFT_3_PORT                    GPIOD
#define MANIP_VALVE_LEFT_3_PIN                     LL_GPIO_PIN_10

/*
 * GPIO right valves
 */
#define MANIP_VALVE_RIGHT_1_PORT                    GPIOD
#define MANIP_VALVE_RIGHT_1_PIN                     LL_GPIO_PIN_1
#define MANIP_VALVE_RIGHT_2_PORT                    GPIOD
#define MANIP_VALVE_RIGHT_2_PIN                     LL_GPIO_PIN_6
#define MANIP_VALVE_RIGHT_3_PORT                    GPIOD
#define MANIP_VALVE_RIGHT_3_PIN                     LL_GPIO_PIN_9

/*
 * GPIO center valves
 
#define MANIP_VALVE_CENTER_1_PORT                    GPIOD
#define MANIP_VALVE_CENTER_1_PIN                     LL_GPIO_PIN_7
#define MANIP_VALVE_CENTER_2_PORT                    GPIOD
#define MANIP_VALVE_CENTER_2_PIN                     LL_GPIO_PIN_11
#define MANIP_VALVE_CENTER_3_PORT                    GPIOD
#define MANIP_VALVE_CENTER_3_PIN                     LL_GPIO_PIN_3
*/

/*
 * Motor kinematics pinout
 * PWM pins
 */
#define MOTOR_CH_PWM_PORT                   GPIOD
#define MOTOR_CH1_PWM_PIN                   LL_GPIO_PIN_12
#define MOTOR_CH2_PWM_PIN                   LL_GPIO_PIN_13
#define MOTOR_CH3_PWM_PIN                   LL_GPIO_PIN_14
#define MOTOR_CH4_PWM_PIN                   LL_GPIO_PIN_15
#define MOTOR_CH_PWM_PIN_AF                 LL_GPIO_AF_2

/* Motor direction pins */
#define MOTOR_CH1_DIR_PORT                  GPIOA
#define MOTOR_CH1_DIR_PIN                   LL_GPIO_PIN_4
#define MOTOR_CH2_DIR_PORT                  GPIOA
#define MOTOR_CH2_DIR_PIN                   LL_GPIO_PIN_5
#define MOTOR_CH3_DIR_PORT                  GPIOA
#define MOTOR_CH3_DIR_PIN                   LL_GPIO_PIN_10
#define MOTOR_CH4_DIR_PORT                  GPIOA
#define MOTOR_CH4_DIR_PIN                   LL_GPIO_PIN_11

/*
 * Odometry pinout
 * Encoder pins
 */
#define ENCODER_1_CHA_PORT                  GPIOA
#define ENCODER_1_CHA_PIN                   LL_GPIO_PIN_1
#define ENCODER_1_CHB_PORT                  GPIOA
#define ENCODER_1_CHB_PIN                   LL_GPIO_PIN_0
#define ENCODER_1_PIN_AF                    LL_GPIO_AF_1

#define ENCODER_2_CHA_PORT                  GPIOA
#define ENCODER_2_CHA_PIN                   LL_GPIO_PIN_7
#define ENCODER_2_CHB_PORT                  GPIOA
#define ENCODER_2_CHB_PIN                   LL_GPIO_PIN_6
#define ENCODER_2_PIN_AF                    LL_GPIO_AF_2

#define ENCODER_3_CHA_PORT                  GPIOA
#define ENCODER_3_CHA_PIN                   LL_GPIO_PIN_9
#define ENCODER_3_CHB_PORT                  GPIOA
#define ENCODER_3_CHB_PIN                   LL_GPIO_PIN_8
#define ENCODER_3_PIN_AF                    LL_GPIO_AF_1

/*
 * Starting cord pinout
 */
#define MOTOR_CORD_PORT                     GPIOE
#define MOTOR_CORD_PIN                      LL_GPIO_PIN_0

/*
 * Strategy choose button pinout
 */
#define MOTOR_STRATEGY_PORT                 GPIOE
#define MOTOR_STRATEGY_PIN                  LL_GPIO_PIN_6

/*
 * Side switcher
 */
#define MOTOR_SIDE_SW_PORT                  GPIOE
#define MOTOR_SIDE_SW_PIN                   LL_GPIO_PIN_2

/*
 * Barometer ADC 1 pinout
 */
#define BAR_1_PORT                            GPIOB
#define BAR_1_PIN                             LL_GPIO_PIN_1

/*
 * Barometer ADC 2 pinout
 */
#define BAR_2_PORT                            GPIOB
#define BAR_2_PIN                             LL_GPIO_PIN_0

/*
 * Barometer ADC 3 pinout
 */
#define BAR_3_PORT                            GPIOC
#define BAR_3_PIN                             LL_GPIO_PIN_5

#endif

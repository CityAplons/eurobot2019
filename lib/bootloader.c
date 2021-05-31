#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "bootloader.h"

#include "stm32f407xx.h"
#include "stm32f4xx_ll_rcc.h"

static void DeInit()
{
        /*
         * Internal clock attaching
         */
        LL_RCC_PLL_Disable();
        LL_RCC_HSE_Disable();

        /* Enable HSE oscillator */
        LL_RCC_HSI_Enable();
        while(LL_RCC_HSI_IsReady() != 1);

        /* Sysclk activation on the main PLL */
        LL_RCC_SetAHBPrescaler(LL_RCC_SYSCLK_DIV_1);

        /* Set APB1 & APB2 prescaler */
        LL_RCC_SetAPB1Prescaler(LL_RCC_APB1_DIV_1);
        LL_RCC_SetAPB2Prescaler(LL_RCC_APB2_DIV_1);

        /*
         * Step: Disable systick timer and reset it to default values
         */
        SysTick->CTRL = 0;
        SysTick->LOAD = 0;
        SysTick->VAL = 0;
        
        /*
        * Step: Disable all interrupts
        */
        __disable_irq();
                
        /*
        * Step: Remap system memory to address 0x0000 0000 in address space
        *       For each family registers may be different. 
        *       Check reference manual for each family.
        *
        *       For STM32F4xx, MEMRMP register in SYSCFG is used (bits[1:0])
        *       For STM32F0xx, CFGR1 register in SYSCFG is used (bits[1:0])
        *       For others, check family reference manual
        */
        #if defined(STM32F4)
                SYSCFG->MEMRMP = 0x01;
        #endif
        #if defined(STM32F0)
                SYSCFG->CFGR1 = 0x01;
        #endif

        return;
}

/*
 * Private function to perform jump to system memory boot
 */
static void init_bootloader(void) 
{
        void (*SysMemBootJump)(void);
        
        /*
        * Step: Set system memory address. 
        *       For STM32F407, system memory is on 0 x 1FFF 0000
        *       For other families, check AN2606 document table 51 with descriptions of memory addresses 
        */
        
        #if defined(STM32F4)
                volatile uint32_t addr = 0x1FFF0000;
        #endif
        #if defined(STM32F0)
                volatile uint32_t addr = 0x1FFFEC00;
        #endif
        
        /*
        * The default reset state of the clock configuration is given
        * below: HSI ON and used as system clock source HSE and
        * PLL OFF AHB, APB1 and APB2 prescaler set to 1. CSS, MCO
        * OFF
        */
        DeInit();
                
        /*
        * Step: Set jump memory location for system memory
        *       Use address with 4 bytes offset which specifies jump location where program starts
        */
        SysMemBootJump = (void (*)(void)) (*((uint32_t *)(addr + 4)));
                
        /*
        * Step: Set main stack pointer.
        *       This step must be done last otherwise local variables in this function
        *       don't have proper value since stack pointer is located on different position
        *
        *       Set direct address location which specifies stack pointer in SRAM location
        */
        __set_MSP(*(uint32_t *)addr);
                
        SysMemBootJump();
}

int cmd_bootloader(char *args)
{
        (void) args;

        init_bootloader();
        
        /*
         * If the MCU executes this command, it does not reset to bootloader!
         */
        memcpy(args, "ER", 3);
        return 3;
}

#######################################################################
# Makefile for STM32F4 Discovery board projects

OUTPATH = build
PROJECT = $(OUTPATH)/robotflesh
OPENOCD_SCRIPT_DIR ?= /usr/share/openocd/scripts
HEAP_SIZE = 0x500

################
# Sources

SOURCES_S = core/startup_stm32f407xx.s

SOURCES_RTOS = $(wildcard freertos/*.c freertos/portable/GCC/ARM_CM4F/*.c)
SOURCES_POSIX = $(wildcard freertos/posix/FreeRTOS-Plus-POSIX/source/*.c)
SOURCES_RTOS += $(wildcard freertos/portable/MemMang/*.c)
SOURCES_CORE = $(wildcard core/*.c)
SOURCES_PERIPH = $(wildcard plib/*.c)
SOURCES_ARM_MATH = $(wildcard math/*.c)

SOURCES_C = $(wildcard *.c old/*.c lib/*.c)
SOURCES_C += $(SOURCES_RTOS)
SOURCES_C += $(SOURCES_CORE)
SOURCES_C += $(SOURCES_PERIPH)
SOURCES_C += $(SOURCES_ARM_MATH)

SOURCES = $(SOURCES_S) $(SOURCES_C)
OBJS = $(SOURCES_S:.s=.o) $(SOURCES_C:.c=.o)

# Includes and Defines

INC_RTOS = -Ifreertos -Ifreertos/include -Ifreertos/portable/GCC/ARM_CM4F
INC_CORE = -Icore
INC_PERIPH = -Iplib
INC_ARM_MATH = -Imath
INC_DEBUG = -Idebug
INC_POSIX = -Ifreertos/posix/FreeRTOS-Plus-POSIX/include \
			-Ifreertos/posix/FreeRTOS-Plus-POSIX/include/portable/empty_portable \
			-Ifreertos/posix/FreeRTOS-Plus-POSIX/include/portable
INC_UROS += $(shell find uros/include -name 'include' | sed -E "s/(.*)/-I\1/")
INCLUDES = -Iold -Ilib
INCLUDES += $(INC_RTOS)
INCLUDES += $(INC_CORE)
INCLUDES += $(INC_PERIPH)
INCLUDES += $(INC_ARM_MATH)
INCLUDES += $(INC_UROS)

DEFINES = -DSTM32 -DSTM32F4 -DSTM32F407xx -DHEAP_SIZE=$(HEAP_SIZE) -DUSE_FULL_LL_DRIVER
DEFINES += -DARM_MATH_CM4

# Compiler/Assembler/Linker/etc

PREFIX = arm-none-eabi

CC = $(PREFIX)-gcc
AS = $(PREFIX)-as
AR = $(PREFIX)-ar
LD = $(PREFIX)-gcc
NM = $(PREFIX)-nm
OBJCOPY = $(PREFIX)-objcopy
OBJDUMP = $(PREFIX)-objdump
READELF = $(PREFIX)-readelf
SIZE = $(PREFIX)-size
GDB = $(PREFIX)-gdb
RM = rm -f
OPENOCD=openocd

# Compiler options

MCUFLAGS = -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 \
	   -mthumb -fsingle-precision-constant -mno-unaligned-access -fcommon

DEBUG_OPTIMIZE_FLAGS = -O2 -ggdb -gdwarf-2

CFLAGS = -Wall -Wextra
CFLAGS_EXTRA = -nostartfiles -nodefaultlibs -nostdlib \
	       -fdata-sections -ffunction-sections

CFLAGS += $(DEFINES) $(MCUFLAGS) $(DEBUG_OPTIMIZE_FLAGS) $(CFLAGS_EXTRA) $(INCLUDES)

LDFLAGS = -static $(MCUFLAGS) -Wl,--start-group uros/libmicroros.a -lnosys -lgcc -lc -lg -Wl,--end-group \
	  -Wl,--gc-sections -T STM32F407VGTx_FLASH.ld -specs=nano.specs \
	  -u _printf_float -Wl,-Map=$(PROJECT).map,--cref
	  #-u _scanf_float
	  
.PHONY: dirs all clean flash erase

all: dirs $(PROJECT).bin $(PROJECT).asm

dirs: ${OUTPATH}

${OUTPATH}:
	mkdir -p ${OUTPATH}

clean:
	$(RM) $(OBJS) $(PROJECT).elf $(PROJECT).bin $(PROJECT).asm

# Hardware specific

flash: $(PROJECT).bin
	st-flash write $(PROJECT).bin 0x08000000

erase:
	st-flash erase

gdb-server-ocd:
	$(OPENOCD) -f $(OPENOCD_SCRIPT_DIR)/interface/stlink-v2.cfg \
		   -f $(OPENOCD_SCRIPT_DIR)/board/stm32f4discovery.cfg

gdb-server-st:
	st-util

OPENOCD_P=3333
gdb-openocd: $(PROJECT).elf
	$(GDB) --eval-command="target extended-remote localhost:$(OPENOCD_P)"\
	       --eval-command="monitor halt" $(PROJECT).elf

GDB_P=4242
gdb-st-util: $(PROJECT).elf
	$(GDB) --eval-command="target extended-remote localhost:$(GDB_P)"\
	       --eval-command="monitor halt" $(PROJECT).elf

$(PROJECT).elf: $(OBJS)

%.elf:
	$(LD) $(OBJS) $(LDFLAGS) -o $@
	$(SIZE) -A $@

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

%.asm: %.elf
	$(OBJDUMP) -dwh $< > $@

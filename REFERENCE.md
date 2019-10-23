RobotFlesh: STM32F4
=======

# Configuration info
  + System Clock Configuration
  + The system Clock is configured as follow :
  + System Clock source            = PLL (HSE) external clock
  + SYSCLK(Hz)                     = 168000000
  + HCLK(Hz)                       = 168000000
  + AHB Prescaler                  = 1
  + APB1 Prescaler                 = 4
  + APB2 Prescaler                 = 2
  + HSE Frequency(Hz)              = 8000000
  + PLL_M                          = 8
  + PLL_N                          = 336
  + PLL_P                          = 2
  + VDD(V)                         = 3.3
  + Main regulator output voltage  = Scale1 mode
  + Flash Latency(WS)              = 5

## Make commands:
```shell
  $ make clean            #Delete compiled project folder (.bin, .asm, .elf files)
  $ make                  #Compile project: output firmware file "robotflesh.bin"
  $ make flash            #Flash STM32F4 micro-controller with current .bin build file
  $ make erase            #Erase current firmware from MCU
  $ make gdb-server-ocd   #Run OpenOCD debugger server
  $ make gdb-server-st    #Run ST debugger server
  $ make gdb-openocd      #Open OpenOCD client (OCD server must be running)
  $ make gdb-st-util      #Open ST debugger client (ST server must be running)
```

---

## main.c

### GPIO pinout
  Enable AHB1 peripherals clock on port D.
  GPIO Port D -> Pin 13 -> Output

### Priority Group
  Default (0) - Without any grouping

### RTOS Tasks
  1. Terminal manager: terminal_manager
  2. Kinematics: motor_kinematics
  3. Odometry: odometry
  4. Manipulators manager: manipulators_manager

---

## Terminal
### Terminal commands (terminal_cmds.h,terminal_cmds.c,terminal_cmds_defs.h)
All commands start with 'CMD_' prefix

```c
  TERM_CMD_DEF(
      cmd_num, //Identifier of command (int)
      cmd_aliase, //Name of command
      cmd_handler //Handler function in terminal.c
    )
```

To add new command and corresponding handler just
add new entry to terminal_cmds_defs.h and implementation in `terminal_cmds.c`.

---

## Development mapping
```c
#define NUMBER_OF_DYNAMIXELS            4
#define NUMBER_OF_PROX_SENSORS          5
#define NUMBER_OF_STEP_MOTORS           1

```

---

## GPIO mapping (gpio_map.h)
### Terminal UART
  RX: Port B pin 7<br />
  TX: Port B pin 6<br />
  AF 7: USART1<br />
  Type: push-pull

### STM32F0 UART
  RX: Port C pin 10<br />
  TX: Port C pin 11<br />
  AF 7: USART3<br />
  Type: default (open-drain)

### Motor
#### PWM pins
Port D<br /> Alternate function 2: Timer 4 (PWM).<br />
Pins: 12,13,14,15.

#### Direction
  + Channel 1: Port C, Pin 14
  + Channel 2: Port C, Pin 15
  + Channel 3: Port E, Pin 10
  + Channel 4: Port E, Pin 14

#### Starting cord
  Port D, Pin 2

### Servo
Port B

  + Right: Pin 14
  + Left: Pin 15

Alternate function 9: Timer 8 CH2N,3N

### Stepper motor
Port E

  + P1: pin 8
  + P2: pin 6
  + P3: pin 12
  + P4: pin 5

### Barometer ADC
Port C<br />
Pin 2

### Encoder (Odometry)
1. Port E, CH A pin - 11, CH B pin - 9<br /> Alternate function 1: Timer 1 Ch 1,2
2. Port A, CH A pin - 6, CH B pin - 7<br /> Alternate function 2: Timer 3 Ch 1,2
3. CH A Port B pin - 3, CH B Port A pin - 15<br /> Alternate function 1: Timer 2 Ch 1,2

### Limit switch pin for step motor calibration
Port D<br />
Pin 0

### Strategy choose button
  Port D, Pin 6

### Side switcher
  Port D, Pin 8

### Pack checking
  Port E, Pin 4

---

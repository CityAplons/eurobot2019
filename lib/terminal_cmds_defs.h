TERM_CMD_DEF(0x01, ECHO,                        echo_handler)
TERM_CMD_DEF(0x02, SET_ROBOT_SESSION,           set_robot_session)
TERM_CMD_DEF(0x03, READ_CORD_STATUS,            read_cord_status)
TERM_CMD_DEF(0x04, READ_SIDE_SWITCH,            read_side_switch)
TERM_CMD_DEF(0x05, READ_STRATEGY,               read_strategy)
TERM_CMD_DEF(0x06, SET_PWM,                     set_pwm)
TERM_CMD_DEF(0x07, GET_WHEEL_SPEED,             get_wheel_speed)
TERM_CMD_DEF(0x08, SET_SPEED,                   set_speed)
TERM_CMD_DEF(0x09, GET_SPEED,                   get_speed)
TERM_CMD_DEF(0x0E, SET_GLOBAL_COORD,            set_coord)
TERM_CMD_DEF(0x0F, GET_GLOBAL_COORD,            get_coord)
TERM_CMD_DEF(0x10, GRIPPER_DOWN,                gripper_down)
TERM_CMD_DEF(0x11, GRIPPER_UP_HIGH,             gripper_up_high)
TERM_CMD_DEF(0x12, GRIPPER_UP_LOW,              gripper_up_low)
TERM_CMD_DEF(0x15, CHECK_BAR,                   check_bar)
TERM_CMD_DEF(0x16, START_PUMP_1,                start_pump_1)
TERM_CMD_DEF(0x17, STOP_PUMP_1,                 stop_pump_1)
TERM_CMD_DEF(0x18, START_PUMP_2,                start_pump_2)
TERM_CMD_DEF(0x19, STOP_PUMP_2,                 stop_pump_2)
TERM_CMD_DEF(0x1A, START_PUMP_3,                start_pump_3)
TERM_CMD_DEF(0x1B, STOP_PUMP_3,                 stop_pump_3)
TERM_CMD_DEF(0x20, VALVE_1_L_OPEN,              valve_left_1_open)
TERM_CMD_DEF(0x21, VALVE_1_L_CLOSE,             valve_left_1_close)
TERM_CMD_DEF(0x22, VALVE_1_R_OPEN,              valve_right_1_open)
TERM_CMD_DEF(0x23, VALVE_1_R_CLOSE,             valve_right_1_close)
TERM_CMD_DEF(0x26, VALVE_2_L_OPEN,              valve_left_2_open)
TERM_CMD_DEF(0x27, VALVE_2_L_CLOSE,             valve_left_2_close)
TERM_CMD_DEF(0x28, VALVE_2_R_OPEN,              valve_right_2_open)
TERM_CMD_DEF(0x29, VALVE_2_R_CLOSE,             valve_right_2_close)
TERM_CMD_DEF(0x2C, VALVE_3_L_OPEN,              valve_left_3_open)
TERM_CMD_DEF(0x2D, VALVE_3_L_CLOSE,             valve_left_3_close)
TERM_CMD_DEF(0x2E, VALVE_3_R_OPEN,              valve_right_3_open)
TERM_CMD_DEF(0x2F, VALVE_3_R_CLOSE,             valve_right_3_close)
TERM_CMD_DEF(0x32, WINDSOCKS,                   windsocks)
TERM_CMD_DEF(0x70, GET_COL_AV_DATA,             get_col_av_data)
TERM_CMD_DEF(0x80, FLASH,                       bootloader)
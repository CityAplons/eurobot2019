#ifndef _H_UROS_INTERFACES_
#define _H_UROS_INTERFACES_

#include <rcl/rcl.h>
#include <rclc/rclc.h>
#include <rclc/executor.h>


#define RCCHECK(fn) { rcl_ret_t temp_rc = fn; if((temp_rc != RCL_RET_OK)){printf("Failed status on line %d: %d. Continuing.\n",__LINE__,(int)temp_rc);}}

typedef struct {
        uint8_t ready;
        uint8_t connected;
        rcl_allocator_t allocator;
        rclc_support_t support;
        rcl_node_t node;
        char prefix[];
} uros_t;

extern uros_t uros_data;

#endif
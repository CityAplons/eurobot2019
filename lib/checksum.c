#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "checksum.h"

/*
 * Checksum calculations
 */
static uint8_t sum_get(char *args, uint8_t len)
{
        uint8_t sum = 0;

        while (len--) {
                sum += (uint8_t)*args++;
        }
        return sum;
}

/*
 * Check function
 */
uint8_t sum_check(char *args, uint8_t value, int len)
{
        uint8_t sum = sum_get(args, len);
        if (sum == value)
                return 1;
        else
                return 0;
}

/*
 * Injection to the sending messages
 */
uint8_t sum_inject(char *args, uint8_t len)
{
        uint8_t sum_check = sum_get(args, len);
        char *message = malloc(len + 2 + 1);

        memcpy(message, &len, 1);
        memcpy(message + 1, &sum_check, 1);
        memcpy(message + 2, args, len);
        memcpy(args, message, len+2);

        free(message);
        
        return len+2;
}

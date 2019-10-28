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
uint8_t sum_check(char *args, int len)
{
        uint8_t sum = sum_get(args, len);
        if (sum == args[len])
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
        char string[] = { sum_check, 0x04};

        memcpy(args+len, string, 2);

        return len+2;
}

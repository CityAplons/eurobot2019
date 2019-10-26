#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "checksum.h"

static uint8_t sum_get(char *args, uint8_t len)
{
        uint8_t sum = 0;

        while (len--) {
                sum += (uint8_t)*args++;
        }
        return sum;
}

uint8_t sum_check(char *args, uint8_t ver, int len)
{
        uint8_t sum = sum_get(args, len);
        if (sum == ver)
                return 1;
        else
                return 0;
}

uint8_t sum_inject(char *args, uint8_t len)
{
        uint8_t sum_check = sum_get(args, len);
        uint8_t resp_len = len + 2;
        char *string = malloc(resp_len);
        memcpy(string, args, len);
        string[len] = sum_check;
        string[++len] = 0x04;

        memcpy(args, string, resp_len);

        return resp_len;
}

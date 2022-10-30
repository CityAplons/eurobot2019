#ifndef _MICROROS_CLIENT_FREERTOS_SERIAL_TRANSPORT_H_
#define _MICROROS_CLIENT_FREERTOS_SERIAL_TRANSPORT_H_

#include <stdio.h>
#include <stdbool.h>
#include <uxr/client/transport.h>

bool freertos_serial_open(uxrCustomTransport * transport);
bool freertos_serial_close(uxrCustomTransport * transport);
size_t freertos_serial_write(uxrCustomTransport* transport, const uint8_t * buf, size_t len, uint8_t * err);
size_t freertos_serial_read(uxrCustomTransport* transport, uint8_t* buf, size_t len, int timeout, uint8_t* err);

#endif //_MICROROS_CLIENT_FREERTOS_SERIAL_TRANSPORT_H_

#ifndef __mpu6x_h
#define __mpu6x_h

#include "swi2c.h"
#define AccAdd 0x68

unsigned char AccWrite(unsigned char rAdd,unsigned char *dat, unsigned char len);
unsigned char AccRead(unsigned char rAdd,unsigned char *dat, unsigned char len);
#endif
#ifndef __i2cSW_H
#define __i2cSW_H

#include "main.h"

#define swSDA_O RA1
#define swSDA_I RA1

#define swSDA_DDRO  TRISA &=0xfD;
#define swSDA_DDRI   TRISA |=0x02;

#define swSCL_DDRO TRISA &=0xfe;

#define swSCL RA0

#define swFre 400000

#define swI2C_ACK 0
#define swI2C_NACK 1
#define swI2C_Read 1
#define swI2C_Write 0

#define I2C_delay __delay_us(8);// 1*NOP =  2.5us (HSI =16MHz) (time =16b)~400kHz

void swI2C_Init(void);
void swI2C_Start(void);
void swI2C_Stop(void);
unsigned char swI2C_WriteByte(unsigned char dat);
unsigned char swI2C_ReadByte(unsigned char Ack);

#endif
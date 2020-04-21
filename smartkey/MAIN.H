#ifndef main_h
#define main_h

#include	"SYSCFG.h";
#include 	"MS86Fxx02.h";
#include	"SWUART.h";
#include	"SWI2C.h";
#include	"MPU6X.h";


#ifndef _XTAL_FREQ
 // Unless already defined assume 4MHz system frequency
 // This definition is required to calibrate __delay_us() and __delay_ms()
 #define _XTAL_FREQ 4000000
#endif

// Fosc
//#define TSEL 2
//#define Fosc		4000	//4MHz

// Timestamp
#define sysTime		100

// GPIO
#define swMainOut		RC0
#define swMainOut2		RC1

#define swPwOn		RA2

#define buzzer			RA3
#define keyDetect		RA5

// Status
#define _Open	1
#define tOut_Open	3500 //1->33=>35

#define _Ide		0
#define tOut_Ide	0

#define _rCheck	2
#define tOut_rCheck 300 //150

#define _Alert		3
#define tOut_Alert  1800
#define add_Alert 0x08

#define _rAlert		4
#define tOut_rAlert	6000

#define _Set		5 // number of time on/off

#define _sAcc		3
#define _sAtn		10
#define _sAll			20

#define _adCt 0x3F
#define _adMd 0x40

#define _adsSk 0x41
#define _adsX 0x10
#define _adsY 0x11

#define SkipAll  2
#define SkipAtena 1

#define True		!False
#define False		0

// bit mark status

#define bitSwMain	0x01
#define bitSwStand	0x04

#define swStart	0x02

// save serial numbers
#define serEE	0x10

#define _Timer1			-5000	//*2us = 10ms
#define _TimeOutKey		60	//ms
#define TimeOutChek	3200	//*10ms = 32s
#define TimeOutWait 	900	//*10ms = 32s


#define md_ckStart	1
#define md_ckIDE	0

typedef union {
   	unsigned char byte;
   	struct{
   	   	unsigned char b0 : 1;
   	   	unsigned char b1 : 1;
   	   	unsigned char b2 : 1;
   	   	unsigned char b3 : 1;
   	   	unsigned char b4 : 1;
   	   	unsigned char b5 : 1;
   	   	unsigned char b6 : 1;
   	   	unsigned char b7 : 1;
   	} bits;
}regType;

#endif
#ifndef main_h
#define main_h

#include	"SYSCFG.h";
#include 	"MS82Fxx02.h";
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
#define swMainOut		RC4
#define swMainIn		RC3
#define swMainOut2		RC2

#define swStand		RC1 //RC2

//#define swStartIn		RC1
#define swStartOut		RC0

#define buzzer			RA4
#define keyDetect		RA6
#define enaDetect		RA7

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


#define _Norl		6
#define tOut_Norl	0

#define _Set		7
/**
---------------
Menu Set (7)
---------------
1| ---...-------
---------------
2| ---...-------
---------------
...
---------------
6| Setup ACC
---------------
8| Skip All feature
---------------
*/
#define _sAcc		8
#define _isAcc		6 //id in menu set

#define _sSkp		9
#define _isSkp		8 //id in menu set

#define True		!False
#define False		0

// bit mark status
#define bitIDE		0x10
#define bitPwOn	0x20
#define bitSwMain	0x01
#define bitSwStand	0x04
#define keyfob		0x40
#define keyUpd		0x80

#define swStart	0x02

// save serial numbers
#define serEE	0x10

#define _Timer1			-5000	//*2us = 10ms
#define _TimeOutKey		60	//ms
#define TimeOutChek	3200	//*10ms = 32s
#define TimeOutWait 	900	//*10ms = 32s


#define md_ckStart	1
#define md_ckBusy	2
#define md_ckIDE	0

	
#endif
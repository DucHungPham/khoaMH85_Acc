opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F685
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_sys_init
	FNCALL	_main,_gpio_init
	FNCALL	_main,_timer_init
	FNCALL	_main,_int_init
	FNCALL	_main,_swI2C_Init
	FNCALL	_main,_setState
	FNCALL	_main,_WRITE_EEPROM
	FNCALL	_main,_READ_EEPROM
	FNCALL	_main,_beepOn
	FNCALL	_main,_AccWrite
	FNCALL	_main,_beep
	FNCALL	_main,_AccRead
	FNCALL	_main,___awdiv
	FNCALL	_main,_beepOff
	FNCALL	_main,_delay_x10ms
	FNCALL	_main,_compe
	FNCALL	_AccRead,_swI2C_Start
	FNCALL	_AccRead,_swI2C_WriteByte
	FNCALL	_AccRead,_swI2C_ReadByte
	FNCALL	_AccRead,_swI2C_Stop
	FNCALL	_AccWrite,_swI2C_Start
	FNCALL	_AccWrite,_swI2C_WriteByte
	FNCALL	_AccWrite,_swI2C_Stop
	FNCALL	_beep,_delay_x10ms
	FNROOT	_main
	FNCALL	_ISR,i1_READ_EEPROM
	FNCALL	_ISR,i1_WRITE_EEPROM
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_cntTmp
	global	_timeOut
	global	_cntOff
	global	_mtOldState
	global	_timeTick
	global	_RegStatus
	global	_cntCyc
	global	_mtState
	global	_ANSEL
psect	text876,local,class=CODE,delta=2
global __ptext876
__ptext876:
_ANSEL	set	286
	DABS	1,286,1	;_ANSEL

	global	_ANSELH
_ANSELH	set	287
	DABS	1,287,1	;_ANSELH

	global	_CM1CON0
_CM1CON0	set	281
	DABS	1,281,1	;_CM1CON0

	global	_CM2CON0
_CM2CON0	set	282
	DABS	1,282,1	;_CM2CON0

	global	_CM2CON1
_CM2CON1	set	283
	DABS	1,283,1	;_CM2CON1

	global	_EEADRH
_EEADRH	set	271
	DABS	1,271,1	;_EEADRH

	global	_EEDATH
_EEDATH	set	270
	DABS	1,270,1	;_EEDATH

	global	_IOCB
_IOCB	set	278
	DABS	1,278,1	;_IOCB

	global	_PSTRCON
_PSTRCON	set	413
	DABS	1,413,1	;_PSTRCON

	global	_SRCON
_SRCON	set	414
	DABS	1,414,1	;_SRCON

	global	_VRCON
_VRCON	set	280
	DABS	1,280,1	;_VRCON

	global	_WPUB
_WPUB	set	277
	DABS	1,277,1	;_WPUB

	global	_ANS0
_ANS0	set	2288
	DABS	1,286,1	;_ANS0

	global	_ANS1
_ANS1	set	2289
	DABS	1,286,1	;_ANS1

	global	_ANS10
_ANS10	set	2298
	DABS	1,287,1	;_ANS10

	global	_ANS11
_ANS11	set	2299
	DABS	1,287,1	;_ANS11

	global	_ANS2
_ANS2	set	2290
	DABS	1,286,1	;_ANS2

	global	_ANS3
_ANS3	set	2291
	DABS	1,286,1	;_ANS3

	global	_ANS4
_ANS4	set	2292
	DABS	1,286,1	;_ANS4

	global	_ANS5
_ANS5	set	2293
	DABS	1,286,1	;_ANS5

	global	_ANS6
_ANS6	set	2294
	DABS	1,286,1	;_ANS6

	global	_ANS7
_ANS7	set	2295
	DABS	1,286,1	;_ANS7

	global	_ANS8
_ANS8	set	2296
	DABS	1,287,1	;_ANS8

	global	_ANS9
_ANS9	set	2297
	DABS	1,287,1	;_ANS9

	global	_C1CH0
_C1CH0	set	2248
	DABS	1,281,1	;_C1CH0

	global	_C1CH1
_C1CH1	set	2249
	DABS	1,281,1	;_C1CH1

	global	_C1OE
_C1OE	set	2253
	DABS	1,281,1	;_C1OE

	global	_C1ON
_C1ON	set	2255
	DABS	1,281,1	;_C1ON

	global	_C1OUT
_C1OUT	set	2254
	DABS	1,281,1	;_C1OUT

	global	_C1POL
_C1POL	set	2252
	DABS	1,281,1	;_C1POL

	global	_C1R
_C1R	set	2250
	DABS	1,281,1	;_C1R

	global	_C1SEN
_C1SEN	set	3317
	DABS	1,414,1	;_C1SEN

	global	_C1VREN
_C1VREN	set	2247
	DABS	1,280,1	;_C1VREN

	global	_C2CH0
_C2CH0	set	2256
	DABS	1,282,1	;_C2CH0

	global	_C2CH1
_C2CH1	set	2257
	DABS	1,282,1	;_C2CH1

	global	_C2OE
_C2OE	set	2261
	DABS	1,282,1	;_C2OE

	global	_C2ON
_C2ON	set	2263
	DABS	1,282,1	;_C2ON

	global	_C2OUT
_C2OUT	set	2262
	DABS	1,282,1	;_C2OUT

	global	_C2POL
_C2POL	set	2260
	DABS	1,282,1	;_C2POL

	global	_C2R
_C2R	set	2258
	DABS	1,282,1	;_C2R

	global	_C2REN
_C2REN	set	3316
	DABS	1,414,1	;_C2REN

	global	_C2SYNC
_C2SYNC	set	2264
	DABS	1,283,1	;_C2SYNC

	global	_C2VREN
_C2VREN	set	2246
	DABS	1,280,1	;_C2VREN

	global	_EEPGD
_EEPGD	set	3175
	DABS	1,396,1	;_EEPGD

	global	_IOCB4
_IOCB4	set	2228
	DABS	1,278,1	;_IOCB4

	global	_IOCB5
_IOCB5	set	2229
	DABS	1,278,1	;_IOCB5

	global	_IOCB6
_IOCB6	set	2230
	DABS	1,278,1	;_IOCB6

	global	_IOCB7
_IOCB7	set	2231
	DABS	1,278,1	;_IOCB7

	global	_MC1OUT
_MC1OUT	set	2271
	DABS	1,283,1	;_MC1OUT

	global	_MC2OUT
_MC2OUT	set	2270
	DABS	1,283,1	;_MC2OUT

	global	_PULSR
_PULSR	set	3314
	DABS	1,414,1	;_PULSR

	global	_PULSS
_PULSS	set	3315
	DABS	1,414,1	;_PULSS

	global	_SR0
_SR0	set	3318
	DABS	1,414,1	;_SR0

	global	_SR1
_SR1	set	3319
	DABS	1,414,1	;_SR1

	global	_STRA
_STRA	set	3304
	DABS	1,413,1	;_STRA

	global	_STRB
_STRB	set	3305
	DABS	1,413,1	;_STRB

	global	_STRC
_STRC	set	3306
	DABS	1,413,1	;_STRC

	global	_STRD
_STRD	set	3307
	DABS	1,413,1	;_STRD

	global	_STRSYNC
_STRSYNC	set	3308
	DABS	1,413,1	;_STRSYNC

	global	_T1GSS
_T1GSS	set	2265
	DABS	1,283,1	;_T1GSS

	global	_VP6EN
_VP6EN	set	2244
	DABS	1,280,1	;_VP6EN

	global	_VR0
_VR0	set	2240
	DABS	1,280,1	;_VR0

	global	_VR1
_VR1	set	2241
	DABS	1,280,1	;_VR1

	global	_VR2
_VR2	set	2242
	DABS	1,280,1	;_VR2

	global	_VR3
_VR3	set	2243
	DABS	1,280,1	;_VR3

	global	_VRR
_VRR	set	2245
	DABS	1,280,1	;_VRR

	global	_WPUB4
_WPUB4	set	2220
	DABS	1,277,1	;_WPUB4

	global	_WPUB5
_WPUB5	set	2221
	DABS	1,277,1	;_WPUB5

	global	_WPUB6
_WPUB6	set	2222
	DABS	1,277,1	;_WPUB6

	global	_WPUB7
_WPUB7	set	2223
	DABS	1,277,1	;_WPUB7

	global	_WREN
_WREN	set	3170
	DABS	1,396,1	;_WREN

	global	_INTCON
_INTCON	set	11
	global	_MSCON
_MSCON	set	27
	global	_PIR1
_PIR1	set	12
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_T0CON0
_T0CON0	set	31
	global	_T2CON0
_T2CON0	set	18
	global	_TMR0
_TMR0	set	1
	global	_TMR2H
_TMR2H	set	19
	global	_TMR2L
_TMR2L	set	17
	global	_EEIF
_EEIF	set	103
	global	_GIE
_GIE	set	95
	global	_INTE
_INTE	set	92
	global	_INTF
_INTF	set	89
	global	_PAIE
_PAIE	set	91
	global	_PAIF
_PAIF	set	88
	global	_PEIE
_PEIE	set	94
	global	_RA2
_RA2	set	42
	global	_RA3
_RA3	set	43
	global	_RA5
_RA5	set	45
	global	_RA6
_RA6	set	46
	global	_RA7
_RA7	set	47
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_T0ON
_T0ON	set	251
	global	_TMR2IF
_TMR2IF	set	97
	global	_TMR2ON
_TMR2ON	set	146
	global	_EEADR
_EEADR	set	155
	global	_EECON1
_EECON1	set	156
	global	_EEDAT
_EEDAT	set	154
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_PIE1
_PIE1	set	140
	global	_PR2H
_PR2H	set	146
	global	_PR2L
_PR2L	set	145
	global	_PSINKA
_PSINKA	set	151
	global	_PSINKC
_PSINKC	set	159
	global	_PSRCA
_PSRCA	set	136
	global	_PSRCC
_PSRCC	set	148
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WPUA
_WPUA	set	149
	global	_WPUC
_WPUC	set	147
	global	_HTS
_HTS	set	1146
	global	_INTEDG
_INTEDG	set	1038
	global	_IOCA5
_IOCA5	set	1205
	global	_RD
_RD	set	1248
	global	_TMR2IE
_TMR2IE	set	1121
	global	_WR
_WR	set	1256
	file	"smartkey.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_timeTick:
       ds      2

_RegStatus:
       ds      1

_cntCyc:
       ds      1

_mtState:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_cntTmp:
       ds      2

_timeOut:
       ds      2

_cntOff:
       ds      1

_mtOldState:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_sys_init
?_sys_init:	; 0 bytes @ 0x0
	global	?_gpio_init
?_gpio_init:	; 0 bytes @ 0x0
	global	?_timer_init
?_timer_init:	; 0 bytes @ 0x0
	global	?_int_init
?_int_init:	; 0 bytes @ 0x0
	global	?_swI2C_Init
?_swI2C_Init:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	?_beepOff
?_beepOff:	; 0 bytes @ 0x0
	global	?_beepOn
?_beepOn:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_swI2C_Start
?_swI2C_Start:	; 0 bytes @ 0x0
	global	?_swI2C_Stop
?_swI2C_Stop:	; 0 bytes @ 0x0
	global	??i1_READ_EEPROM
??i1_READ_EEPROM:	; 0 bytes @ 0x0
	global	?i1_WRITE_EEPROM
?i1_WRITE_EEPROM:	; 0 bytes @ 0x0
	global	?_READ_EEPROM
?_READ_EEPROM:	; 1 bytes @ 0x0
	global	?_swI2C_WriteByte
?_swI2C_WriteByte:	; 1 bytes @ 0x0
	global	?_swI2C_ReadByte
?_swI2C_ReadByte:	; 1 bytes @ 0x0
	global	?i1_READ_EEPROM
?i1_READ_EEPROM:	; 1 bytes @ 0x0
	global	i1READ_EEPROM@EEAddr
i1READ_EEPROM@EEAddr:	; 1 bytes @ 0x0
	global	i1WRITE_EEPROM@EEData
i1WRITE_EEPROM@EEData:	; 1 bytes @ 0x0
	ds	1
	global	??i1_WRITE_EEPROM
??i1_WRITE_EEPROM:	; 0 bytes @ 0x1
	global	i1READ_EEPROM@ReEepromData
i1READ_EEPROM@ReEepromData:	; 1 bytes @ 0x1
	global	i1WRITE_EEPROM@EEAddr
i1WRITE_EEPROM@EEAddr:	; 1 bytes @ 0x1
	ds	1
	global	??_ISR
??_ISR:	; 0 bytes @ 0x2
	ds	2
	global	ISR@tmp
ISR@tmp:	; 1 bytes @ 0x4
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_READ_EEPROM
??_READ_EEPROM:	; 0 bytes @ 0x0
	global	?_WRITE_EEPROM
?_WRITE_EEPROM:	; 0 bytes @ 0x0
	global	??_sys_init
??_sys_init:	; 0 bytes @ 0x0
	global	??_gpio_init
??_gpio_init:	; 0 bytes @ 0x0
	global	??_timer_init
??_timer_init:	; 0 bytes @ 0x0
	global	??_int_init
??_int_init:	; 0 bytes @ 0x0
	global	??_swI2C_Init
??_swI2C_Init:	; 0 bytes @ 0x0
	global	?_delay_x10ms
?_delay_x10ms:	; 0 bytes @ 0x0
	global	??_beepOff
??_beepOff:	; 0 bytes @ 0x0
	global	??_beepOn
??_beepOn:	; 0 bytes @ 0x0
	global	?_setState
?_setState:	; 0 bytes @ 0x0
	global	??_swI2C_Start
??_swI2C_Start:	; 0 bytes @ 0x0
	global	??_swI2C_Stop
??_swI2C_Stop:	; 0 bytes @ 0x0
	global	??_swI2C_WriteByte
??_swI2C_WriteByte:	; 0 bytes @ 0x0
	global	??_swI2C_ReadByte
??_swI2C_ReadByte:	; 0 bytes @ 0x0
	global	?_compe
?_compe:	; 1 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	READ_EEPROM@EEAddr
READ_EEPROM@EEAddr:	; 1 bytes @ 0x0
	global	WRITE_EEPROM@EEData
WRITE_EEPROM@EEData:	; 1 bytes @ 0x0
	global	compe@b
compe@b:	; 1 bytes @ 0x0
	global	delay_x10ms@t
delay_x10ms@t:	; 2 bytes @ 0x0
	global	setState@_tOut
setState@_tOut:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	ds	1
	global	??_WRITE_EEPROM
??_WRITE_EEPROM:	; 0 bytes @ 0x1
	global	READ_EEPROM@ReEepromData
READ_EEPROM@ReEepromData:	; 1 bytes @ 0x1
	global	WRITE_EEPROM@EEAddr
WRITE_EEPROM@EEAddr:	; 1 bytes @ 0x1
	global	compe@dt
compe@dt:	; 1 bytes @ 0x1
	global	swI2C_WriteByte@dat
swI2C_WriteByte@dat:	; 1 bytes @ 0x1
	global	swI2C_ReadByte@Ack
swI2C_ReadByte@Ack:	; 1 bytes @ 0x1
	ds	1
	global	??_delay_x10ms
??_delay_x10ms:	; 0 bytes @ 0x2
	global	??_setState
??_setState:	; 0 bytes @ 0x2
	global	??_compe
??_compe:	; 0 bytes @ 0x2
	global	setState@stt
setState@stt:	; 1 bytes @ 0x2
	global	swI2C_WriteByte@i
swI2C_WriteByte@i:	; 1 bytes @ 0x2
	global	swI2C_ReadByte@dat
swI2C_ReadByte@dat:	; 1 bytes @ 0x2
	global	delay_x10ms@set
delay_x10ms@set:	; 2 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	ds	1
	global	?_AccWrite
?_AccWrite:	; 1 bytes @ 0x3
	global	swI2C_ReadByte@i
swI2C_ReadByte@i:	; 1 bytes @ 0x3
	global	AccWrite@dat
AccWrite@dat:	; 1 bytes @ 0x3
	ds	1
	global	?_beep
?_beep:	; 0 bytes @ 0x4
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	?_AccRead
?_AccRead:	; 1 bytes @ 0x4
	global	beep@rep
beep@rep:	; 1 bytes @ 0x4
	global	compe@a
compe@a:	; 1 bytes @ 0x4
	global	AccWrite@len
AccWrite@len:	; 1 bytes @ 0x4
	global	AccRead@dat
AccRead@dat:	; 1 bytes @ 0x4
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x4
	ds	1
	global	??_AccWrite
??_AccWrite:	; 0 bytes @ 0x5
	global	??_beep
??_beep:	; 0 bytes @ 0x5
	global	beep@delay
beep@delay:	; 1 bytes @ 0x5
	global	AccRead@len
AccRead@len:	; 1 bytes @ 0x5
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x5
	ds	1
	global	??_AccRead
??_AccRead:	; 0 bytes @ 0x6
	global	AccWrite@rAdd
AccWrite@rAdd:	; 1 bytes @ 0x6
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x6
	ds	1
	global	AccWrite@i
AccWrite@i:	; 1 bytes @ 0x7
	ds	1
	global	AccRead@rAdd
AccRead@rAdd:	; 1 bytes @ 0x8
	ds	1
	global	AccRead@i
AccRead@i:	; 1 bytes @ 0x9
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xA
	ds	3
	global	main@isWait
main@isWait:	; 2 bytes @ 0xD
	ds	2
	global	main@isFall
main@isFall:	; 1 bytes @ 0xF
	ds	1
	global	main@lostDetect
main@lostDetect:	; 1 bytes @ 0x10
	ds	1
	global	main@acYOld
main@acYOld:	; 1 bytes @ 0x11
	ds	1
	global	main@acXOld
main@acXOld:	; 1 bytes @ 0x12
	ds	1
	global	main@buf
main@buf:	; 6 bytes @ 0x13
	ds	6
	global	main@acYsum
main@acYsum:	; 2 bytes @ 0x19
	ds	2
	global	main@acXsum
main@acXsum:	; 2 bytes @ 0x1B
	ds	2
	global	main@isSw
main@isSw:	; 1 bytes @ 0x1D
	ds	1
	global	main@tmp16
main@tmp16:	; 2 bytes @ 0x1E
	ds	2
	global	main@tmp8
main@tmp8:	; 1 bytes @ 0x20
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 11, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5      10
;; BANK0           80     33      39
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; ?___awdiv	int  size(1) Largest target is 0
;;
;; AccRead@dat	PTR unsigned char  size(1) Largest target is 6
;;		 -> main@buf(BANK0[6]), 
;;
;; AccWrite@dat	PTR unsigned char  size(1) Largest target is 6
;;		 -> main@buf(BANK0[6]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _ISR in COMMON
;;
;;   _ISR->i1_READ_EEPROM
;;   _ISR->i1_WRITE_EEPROM
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_AccRead
;;   _AccRead->_swI2C_ReadByte
;;   _AccWrite->_swI2C_WriteByte
;;   _beep->_delay_x10ms
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                23    23      0    3897
;;                                             10 BANK0     23    23      0
;;                           _sys_init
;;                          _gpio_init
;;                         _timer_init
;;                           _int_init
;;                         _swI2C_Init
;;                           _setState
;;                       _WRITE_EEPROM
;;                        _READ_EEPROM
;;                             _beepOn
;;                           _AccWrite
;;                               _beep
;;                            _AccRead
;;                            ___awdiv
;;                            _beepOff
;;                        _delay_x10ms
;;                              _compe
;; ---------------------------------------------------------------------------------
;; (1) _AccRead                                              6     4      2     532
;;                                              4 BANK0      6     4      2
;;                        _swI2C_Start
;;                    _swI2C_WriteByte
;;                     _swI2C_ReadByte
;;                         _swI2C_Stop
;; ---------------------------------------------------------------------------------
;; (1) _AccWrite                                             5     3      2     300
;;                                              3 BANK0      5     3      2
;;                        _swI2C_Start
;;                    _swI2C_WriteByte
;;                         _swI2C_Stop
;; ---------------------------------------------------------------------------------
;; (2) _swI2C_ReadByte                                       4     4      0     170
;;                                              0 BANK0      4     4      0
;; ---------------------------------------------------------------------------------
;; (2) _swI2C_WriteByte                                      3     3      0     139
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _swI2C_Stop                                           1     1      0       0
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _swI2C_Start                                          1     1      0       0
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _swI2C_Init                                           1     1      0       0
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _sys_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _beep                                                 2     1      1     130
;;                                              4 BANK0      2     1      1
;;                        _delay_x10ms
;; ---------------------------------------------------------------------------------
;; (1) ___awdiv                                              8     4      4     445
;;                                              0 BANK0      8     4      4
;; ---------------------------------------------------------------------------------
;; (1) _int_init                                             1     1      0       0
;; ---------------------------------------------------------------------------------
;; (1) _timer_init                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _gpio_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _compe                                                5     3      2     372
;;                                              0 BANK0      5     3      2
;; ---------------------------------------------------------------------------------
;; (1) _setState                                             3     1      2      62
;;                                              0 BANK0      3     1      2
;; ---------------------------------------------------------------------------------
;; (1) _beepOn                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _beepOff                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _delay_x10ms                                          4     2      2      68
;;                                              0 BANK0      4     2      2
;; ---------------------------------------------------------------------------------
;; (1) _WRITE_EEPROM                                         2     1      1      62
;;                                              0 BANK0      2     1      1
;; ---------------------------------------------------------------------------------
;; (1) _READ_EEPROM                                          2     2      0      65
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _ISR                                                  3     3      0     319
;;                                              2 COMMON     3     3      0
;;                      i1_READ_EEPROM
;;                     i1_WRITE_EEPROM
;; ---------------------------------------------------------------------------------
;; (4) i1_WRITE_EEPROM                                       2     1      1     146
;;                                              0 COMMON     2     1      1
;; ---------------------------------------------------------------------------------
;; (4) i1_READ_EEPROM                                        2     2      0     148
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _sys_init
;;   _gpio_init
;;   _timer_init
;;   _int_init
;;   _swI2C_Init
;;   _setState
;;   _WRITE_EEPROM
;;   _READ_EEPROM
;;   _beepOn
;;   _AccWrite
;;     _swI2C_Start
;;     _swI2C_WriteByte
;;     _swI2C_Stop
;;   _beep
;;     _delay_x10ms
;;   _AccRead
;;     _swI2C_Start
;;     _swI2C_WriteByte
;;     _swI2C_ReadByte
;;     _swI2C_Stop
;;   ___awdiv
;;   _beepOff
;;   _delay_x10ms
;;   _compe
;;
;; _ISR (ROOT)
;;   i1_READ_EEPROM
;;   i1_WRITE_EEPROM
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      5       A       1       71.4%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       6       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50     21      27       4       48.8%
;;BANK1               20      0       0       5        0.0%
;;ABS                  0      0      31       6        0.0%
;;BITBANK1            20      0       0       7        0.0%
;;DATA                 0      0      37       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 206 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf             6   19[BANK0 ] unsigned char [6]
;;  tmp16           2   30[BANK0 ] unsigned int 
;;  acXsum          2   27[BANK0 ] int 
;;  acYsum          2   25[BANK0 ] int 
;;  isWait          2   13[BANK0 ] unsigned int 
;;  tmp8            1   32[BANK0 ] unsigned char 
;;  isSw            1   29[BANK0 ] unsigned char 
;;  acXOld          1   18[BANK0 ] char 
;;  acYOld          1   17[BANK0 ] char 
;;  lostDetect      1   16[BANK0 ] unsigned char 
;;  isFall          1   15[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 20/20
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0      20       0
;;      Temps:          0       3       0
;;      Totals:         0      23       0
;;Total ram usage:       23 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_sys_init
;;		_gpio_init
;;		_timer_init
;;		_int_init
;;		_swI2C_Init
;;		_setState
;;		_WRITE_EEPROM
;;		_READ_EEPROM
;;		_beepOn
;;		_AccWrite
;;		_beep
;;		_AccRead
;;		___awdiv
;;		_beepOff
;;		_delay_x10ms
;;		_compe
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"smartkey.C"
	line	206
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	208
	
l6780:	
;smartkey.C: 208: unsigned char tmp8, isSw = 0, isFall = 0, lostDetect = 0;
	clrf	(main@isSw)
	clrf	(main@isFall)
	clrf	(main@lostDetect)
	line	209
;smartkey.C: 209: unsigned int isWait = 0;
	clrf	(main@isWait)
	clrf	(main@isWait+1)
	line	210
;smartkey.C: 210: signed int acYsum = 0, acXsum = 0;
	clrf	(main@acYsum)
	clrf	(main@acYsum+1)
	clrf	(main@acXsum)
	clrf	(main@acXsum+1)
	line	211
;smartkey.C: 211: unsigned int tmp16 = 0;
	clrf	(main@tmp16)
	clrf	(main@tmp16+1)
	line	215
;smartkey.C: 212: signed char acYOld, acXOld;
;smartkey.C: 213: unsigned char buf[6];
;smartkey.C: 215: RegStatus.byte =0x00;
	clrf	(_RegStatus)	;volatile
	line	216
	
l6782:	
;smartkey.C: 216: RegStatus.bits.b6 = 1;
	bsf	(_RegStatus),6	;volatile
	line	218
	
l6784:	
# 218 "smartkey.C"
clrwdt ;#
psect	maintext
	line	220
	
l6786:	
;smartkey.C: 220: sys_init();
	fcall	_sys_init
	line	221
	
l6788:	
;smartkey.C: 221: gpio_init();
	fcall	_gpio_init
	line	222
	
l6790:	
;smartkey.C: 222: timer_init();
	fcall	_timer_init
	line	223
	
l6792:	
;smartkey.C: 223: int_init();
	fcall	_int_init
	line	226
	
l6794:	
;smartkey.C: 226: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3657:
	decfsz	((??_main+0)+0),f
	goto	u3657
	decfsz	((??_main+0)+0+1),f
	goto	u3657
	nop2
opt asmopt_on

	line	228
	
l6796:	
;smartkey.C: 228: PAIE = 1;
	bsf	(91/8),(91)&7
	line	230
	
l6798:	
;smartkey.C: 230: swI2C_Init();
	fcall	_swI2C_Init
	line	232
	
l6800:	
;smartkey.C: 232: setState(0, 0);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	234
	
l6802:	
;smartkey.C: 234: WRITE_EEPROM(0xFF, 0xAA);
	movlw	(0AAh)
	movwf	(?_WRITE_EEPROM)
	movlw	(0FFh)
	fcall	_WRITE_EEPROM
	line	235
	
l6804:	
;smartkey.C: 235: WRITE_EEPROM(0xFF, 0xAA);
	movlw	(0AAh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_WRITE_EEPROM)
	movlw	(0FFh)
	fcall	_WRITE_EEPROM
	line	237
	
l6806:	
;smartkey.C: 237: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3667:
	decfsz	((??_main+0)+0),f
	goto	u3667
	decfsz	((??_main+0)+0+1),f
	goto	u3667
	nop2
opt asmopt_on

	line	240
	
l6808:	
;smartkey.C: 240: tmp8 = READ_EEPROM(0x41);
	movlw	(041h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	241
	
l6810:	
;smartkey.C: 241: if (tmp8 > 3) {WRITE_EEPROM(0x41, 0); _delay((unsigned long)((2)*(4000000/4000.0)));}
	movlw	(04h)
	subwf	(main@tmp8),w
	skipc
	goto	u2941
	goto	u2940
u2941:
	goto	l6816
u2940:
	
l6812:	
	clrf	(?_WRITE_EEPROM)
	movlw	(041h)
	fcall	_WRITE_EEPROM
	
l6814:	
	opt asmopt_off
movlw	3
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u3677:
	decfsz	((??_main+0)+0),f
	goto	u3677
	decfsz	((??_main+0)+0+1),f
	goto	u3677
	nop2
opt asmopt_on

	line	245
	
l6816:	
;smartkey.C: 245: tmp8 = READ_EEPROM(0x08);
	movlw	(08h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	246
	
l6818:	
;smartkey.C: 246: if (tmp8 == 0xff) {WRITE_EEPROM(0x08, 0); _delay((unsigned long)((2)*(4000000/4000.0)));}
	movf	(main@tmp8),w
	xorlw	0FFh
	skipz
	goto	u2951
	goto	u2950
u2951:
	goto	l6824
u2950:
	
l6820:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	
l6822:	
	opt asmopt_off
movlw	3
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u3687:
	decfsz	((??_main+0)+0),f
	goto	u3687
	decfsz	((??_main+0)+0+1),f
	goto	u3687
	nop2
opt asmopt_on

	line	247
	
l6824:	
;smartkey.C: 247: if (tmp8 == 0xcc) {
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@tmp8),w
	xorlw	0CCh
	skipz
	goto	u2961
	goto	u2960
u2961:
	goto	l6838
u2960:
	line	248
	
l6826:	
;smartkey.C: 248: RegStatus.bits.b0 = 0;
	bcf	(_RegStatus),0	;volatile
	line	249
	
l6828:	
;smartkey.C: 249: setState(3, 1800);
	movlw	low(0708h)
	movwf	(?_setState)
	movlw	high(0708h)
	movwf	((?_setState))+1
	movlw	(03h)
	fcall	_setState
	line	250
	
l6830:	
;smartkey.C: 250: mtOldState = 1;
	clrf	(_mtOldState)
	incf	(_mtOldState),f
	line	251
	
l6832:	
;smartkey.C: 251: cntTmp = timeTick + 50;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l6834:	
	movlw	032h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	252
	
l6836:	
;smartkey.C: 252: PR2L = 12;
	movlw	(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	253
;smartkey.C: 253: beepOn();
	fcall	_beepOn
	line	254
;smartkey.C: 254: } else {
	goto	l6842
	line	255
	
l6838:	
;smartkey.C: 255: setState(2, 400);
	movlw	low(0190h)
	movwf	(?_setState)
	movlw	high(0190h)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	256
	
l6840:	
;smartkey.C: 256: mtOldState = 0;
	clrf	(_mtOldState)
	line	262
	
l6842:	
;smartkey.C: 257: }
;smartkey.C: 262: buf[0] = 0x03;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@buf)
	line	263
	
l6844:	
;smartkey.C: 263: if ((AccWrite(0x0f, buf, 1) == 0)) {
	movlw	(main@buf)&0ffh
	movwf	(?_AccWrite)
	clrf	0+(?_AccWrite)+01h
	incf	0+(?_AccWrite)+01h,f
	movlw	(0Fh)
	fcall	_AccWrite
	iorlw	0
	skipz
	goto	u2971
	goto	u2970
u2971:
	goto	l6848
u2970:
	goto	l6850
	line	268
	
l6848:	
;smartkey.C: 266: else {
;smartkey.C: 268: beep(10, 2);
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	271
	
l6850:	
;smartkey.C: 269: }
;smartkey.C: 271: buf[0] = 0x08;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@buf)
	line	272
	
l6852:	
;smartkey.C: 272: if ((AccWrite(0x10,buf, 1) == 0)) {
	movlw	(main@buf)&0ffh
	movwf	(?_AccWrite)
	clrf	0+(?_AccWrite)+01h
	incf	0+(?_AccWrite)+01h,f
	movlw	(010h)
	fcall	_AccWrite
	iorlw	0
	skipz
	goto	u2981
	goto	u2980
u2981:
	goto	l6856
u2980:
	goto	l6858
	line	277
	
l6856:	
;smartkey.C: 275: else {
;smartkey.C: 277: beep(10, 2);
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	282
	
l6858:	
;smartkey.C: 278: }
;smartkey.C: 282: tmp8 = READ_EEPROM(0x3F);
	movlw	(03Fh)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	283
	
l6860:	
;smartkey.C: 283: if (tmp8 == 5) {
	movf	(main@tmp8),w
	xorlw	05h
	skipz
	goto	u2991
	goto	u2990
u2991:
	goto	l6880
u2990:
	line	284
	
l6862:	
;smartkey.C: 284: tmp8 = 0;
	clrf	(main@tmp8)
	line	285
	
l6864:	
;smartkey.C: 285: WRITE_EEPROM(0x3F, 0);
	clrf	(?_WRITE_EEPROM)
	movlw	(03Fh)
	fcall	_WRITE_EEPROM
	line	286
;smartkey.C: 286: while ( RA2) {
	goto	l6878
	line	287
	
l6866:	
;smartkey.C: 287: _delay((unsigned long)((1500)*(4000000/4000.0)));
	opt asmopt_off
movlw  8
movwf	((??_main+0)+0+2),f
movlw	157
movwf	((??_main+0)+0+1),f
	movlw	11
movwf	((??_main+0)+0),f
u3697:
	decfsz	((??_main+0)+0),f
	goto	u3697
	decfsz	((??_main+0)+0+1),f
	goto	u3697
	decfsz	((??_main+0)+0+2),f
	goto	u3697
	nop2
opt asmopt_on

	line	288
	
l6868:	
;smartkey.C: 288: tmp8++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@tmp8),f
	line	289
	
l6870:	
;smartkey.C: 289: if (tmp8 > 20) {
	movlw	(015h)
	subwf	(main@tmp8),w
	skipc
	goto	u3001
	goto	u3000
u3001:
	goto	l905
u3000:
	line	290
	
l6872:	
;smartkey.C: 290: _delay((unsigned long)((10000)*(4000000/4000.0)));
	opt asmopt_off
movlw  51
movwf	((??_main+0)+0+2),f
movlw	188
movwf	((??_main+0)+0+1),f
	movlw	16
movwf	((??_main+0)+0),f
u3707:
	decfsz	((??_main+0)+0),f
	goto	u3707
	decfsz	((??_main+0)+0+1),f
	goto	u3707
	decfsz	((??_main+0)+0+2),f
	goto	u3707
opt asmopt_on

	line	291
	
l6874:	
;smartkey.C: 291: WRITE_EEPROM(0x40, 0);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	line	292
;smartkey.C: 292: }
	goto	l6878
	line	293
	
l905:	
;smartkey.C: 293: else if ( RA2) {
	btfss	(42/8),(42)&7
	goto	u3011
	goto	u3010
u3011:
	goto	l6878
u3010:
	line	294
	
l6876:	
;smartkey.C: 294: WRITE_EEPROM(0x40, tmp8);
	movf	(main@tmp8),w
	movwf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	line	295
;smartkey.C: 295: beep(10, 1);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	286
	
l6878:	
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(42/8),(42)&7
	goto	u3021
	goto	u3020
u3021:
	goto	l6866
u3020:
	line	298
	
l909:	
	btfss	(42/8),(42)&7
	goto	u3031
	goto	u3030
u3031:
	goto	l909
u3030:
	line	302
	
l6880:	
;smartkey.C: 299: }
;smartkey.C: 302: tmp8 = READ_EEPROM(0x40);
	movlw	(040h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	303
;smartkey.C: 303: switch (tmp8) {
	goto	l6922
	line	306
	
l6882:	
;smartkey.C: 306: tmp8 = 0; beep(10, 3);
	clrf	(main@tmp8)
	
l6884:	
	movlw	(03h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	307
;smartkey.C: 307: while ((tmp8 < 11)) {
	goto	l914
	line	308
	
l6886:	
;smartkey.C: 308: if (AccRead(0x02, buf, 6) == 0) {
	movlw	(main@buf)&0ffh
	movwf	(?_AccRead)
	movlw	(06h)
	movwf	0+(?_AccRead)+01h
	movlw	(02h)
	fcall	_AccRead
	iorlw	0
	skipz
	goto	u3041
	goto	u3040
u3041:
	goto	l6898
u3040:
	line	309
	
l6888:	
;smartkey.C: 309: acXsum += (signed char)buf[1];
	bcf	status, 5	;RP0=0, select bank0
	movf	0+(main@buf)+01h,w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	btfsc	(??_main+0)+0,7
	decf	(??_main+0)+0+1,f
	movf	0+(??_main+0)+0,w
	addwf	(main@acXsum),f
	skipnc
	incf	(main@acXsum+1),f
	movf	1+(??_main+0)+0,w
	addwf	(main@acXsum+1),f
	line	310
;smartkey.C: 310: acYsum += (signed char)buf[3];
	movf	0+(main@buf)+03h,w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	btfsc	(??_main+0)+0,7
	decf	(??_main+0)+0+1,f
	movf	0+(??_main+0)+0,w
	addwf	(main@acYsum),f
	skipnc
	incf	(main@acYsum+1),f
	movf	1+(??_main+0)+0,w
	addwf	(main@acYsum+1),f
	line	311
;smartkey.C: 311: if ( ((signed char)buf[5] > -15) && ((signed char)buf[5] <15)) break;
	movf	0+(main@buf)+05h,w
	xorlw	80h
	addlw	-((-14)^80h)
	skipc
	goto	u3051
	goto	u3050
u3051:
	goto	l6894
u3050:
	
l6890:	
	movf	0+(main@buf)+05h,w
	xorlw	80h
	addlw	-((0Fh)^80h)
	skipnc
	goto	u3061
	goto	u3060
u3061:
	goto	l6894
u3060:
	goto	l6898
	line	312
	
l6894:	
;smartkey.C: 312: tmp8++;
	incf	(main@tmp8),f
	line	315
;smartkey.C: 313: } else
	
l6896:	
;smartkey.C: 315: _delay((unsigned long)((500)*(4000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u3717:
	decfsz	((??_main+0)+0),f
	goto	u3717
	decfsz	((??_main+0)+0+1),f
	goto	u3717
	decfsz	((??_main+0)+0+2),f
	goto	u3717
	nop2
opt asmopt_on

	line	316
	
l914:	
	line	307
	movlw	(0Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@tmp8),w
	skipc
	goto	u3071
	goto	u3070
u3071:
	goto	l6886
u3070:
	line	318
	
l6898:	
;smartkey.C: 316: }
;smartkey.C: 318: if (tmp8 == 11) {
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@tmp8),w
	xorlw	0Bh
	skipz
	goto	u3081
	goto	u3080
u3081:
	goto	l6902
u3080:
	line	319
	
l6900:	
;smartkey.C: 319: acXsum = acXsum / 10;
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(main@acXsum+1),w
	movwf	1+(?___awdiv)+02h
	movf	(main@acXsum),w
	movwf	0+(?___awdiv)+02h
	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	movwf	(main@acXsum+1)
	movf	(0+(?___awdiv)),w
	movwf	(main@acXsum)
	line	320
;smartkey.C: 320: acYsum = acYsum / 10;
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(main@acYsum+1),w
	movwf	1+(?___awdiv)+02h
	movf	(main@acYsum),w
	movwf	0+(?___awdiv)+02h
	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	movwf	(main@acYsum+1)
	movf	(0+(?___awdiv)),w
	movwf	(main@acYsum)
	line	322
;smartkey.C: 322: WRITE_EEPROM(0x10, acXsum);
	movf	(main@acXsum),w
	movwf	(?_WRITE_EEPROM)
	movlw	(010h)
	fcall	_WRITE_EEPROM
	line	323
;smartkey.C: 323: WRITE_EEPROM(0x11, acYsum);
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acYsum),w
	movwf	(?_WRITE_EEPROM)
	movlw	(011h)
	fcall	_WRITE_EEPROM
	line	324
;smartkey.C: 324: beep(10, 3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	326
;smartkey.C: 326: } else {
	goto	l6924
	line	327
	
l6902:	
;smartkey.C: 327: beep(10, 2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	goto	l6924
	line	334
	
l6904:	
;smartkey.C: 334: tmp8 = READ_EEPROM(0x41);
	movlw	(041h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	335
	
l6906:	
;smartkey.C: 335: if (tmp8 & 2) {
	btfss	(main@tmp8),(1)&7
	goto	u3091
	goto	u3090
u3091:
	goto	l924
u3090:
	line	336
	
l6908:	
;smartkey.C: 336: tmp8 &= ~2;
	bcf	(main@tmp8)+(1/8),(1)&7
	line	337
;smartkey.C: 337: }
	goto	l6910
	line	338
	
l924:	
	line	339
;smartkey.C: 338: else {
;smartkey.C: 339: tmp8 |= 2;
	bsf	(main@tmp8)+(1/8),(1)&7
	line	341
	
l6910:	
;smartkey.C: 340: }
;smartkey.C: 341: WRITE_EEPROM(0x41, tmp8);
	movf	(main@tmp8),w
	movwf	(?_WRITE_EEPROM)
	movlw	(041h)
	fcall	_WRITE_EEPROM
	line	342
;smartkey.C: 342: beep(50, 1);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(032h)
	fcall	_beep
	line	343
;smartkey.C: 343: break;
	goto	l6924
	line	347
	
l6912:	
;smartkey.C: 347: tmp8 = READ_EEPROM(0x41);
	movlw	(041h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	348
	
l6914:	
;smartkey.C: 348: if (tmp8 & 1) {
	btfss	(main@tmp8),(0)&7
	goto	u3101
	goto	u3100
u3101:
	goto	l927
u3100:
	line	349
	
l6916:	
;smartkey.C: 349: tmp8 &= ~1;
	bcf	(main@tmp8)+(0/8),(0)&7
	line	350
;smartkey.C: 350: }
	goto	l6918
	line	351
	
l927:	
	line	352
;smartkey.C: 351: else {
;smartkey.C: 352: tmp8 |= 1;
	bsf	(main@tmp8)+(0/8),(0)&7
	line	354
	
l6918:	
;smartkey.C: 353: }
;smartkey.C: 354: WRITE_EEPROM(0x41, tmp8);
	movf	(main@tmp8),w
	movwf	(?_WRITE_EEPROM)
	movlw	(041h)
	fcall	_WRITE_EEPROM
	line	355
;smartkey.C: 355: beep(10, 1);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	356
;smartkey.C: 356: break;
	goto	l6924
	line	303
	
l6922:	
	movf	(main@tmp8),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 3 to 20
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           27     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	3^0	; case 3
	skipnz
	goto	l6882
	xorlw	10^3	; case 10
	skipnz
	goto	l6912
	xorlw	20^10	; case 20
	skipnz
	goto	l6904
	goto	l6924
	opt asmopt_on

	line	360
	
l6924:	
;smartkey.C: 360: tmp8 = READ_EEPROM(0x41);
	movlw	(041h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	361
	
l6926:	
;smartkey.C: 361: if (tmp8 >0 && tmp8<4 ) {
	movf	(main@tmp8),w
	skipz
	goto	u3110
	goto	l6944
u3110:
	
l6928:	
	movlw	(04h)
	subwf	(main@tmp8),w
	skipnc
	goto	u3121
	goto	u3120
u3121:
	goto	l6944
u3120:
	line	362
	
l6930:	
;smartkey.C: 362: RegStatus.bits.b0 = 1;
	bsf	(_RegStatus),0	;volatile
	line	363
	
l6932:	
;smartkey.C: 363: setState(1, 3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	364
	
l6934:	
;smartkey.C: 364: RegStatus.bits.b4 = 1;
	bsf	(_RegStatus),4	;volatile
	line	366
	
l6936:	
;smartkey.C: 366: if (tmp8 & 2) {
	btfss	(main@tmp8),(1)&7
	goto	u3131
	goto	u3130
u3131:
	goto	l930
u3130:
	line	367
	
l6938:	
;smartkey.C: 367: RegStatus.bits.b6 = 0;
	bcf	(_RegStatus),6	;volatile
	line	368
;smartkey.C: 368: }
	goto	l6944
	line	369
	
l930:	
;smartkey.C: 369: else if (tmp8 & 1) {
	btfss	(main@tmp8),(0)&7
	goto	u3141
	goto	u3140
u3141:
	goto	l6944
u3140:
	line	370
	
l6940:	
;smartkey.C: 370: tmp16 = timeTick + 40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	371
	
l6942:	
;smartkey.C: 371: beep(10, 1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	376
	
l6944:	
;smartkey.C: 372: }
;smartkey.C: 373: }
;smartkey.C: 376: acXsum = (signed int)READ_EEPROM(0x10);
	movlw	(010h)
	fcall	_READ_EEPROM
	movwf	(main@acXsum)
	clrf	(main@acXsum+1)
	line	377
	
l6946:	
;smartkey.C: 377: acYsum = (signed int)READ_EEPROM(0x11);
	movlw	(011h)
	fcall	_READ_EEPROM
	movwf	(main@acYsum)
	clrf	(main@acYsum+1)
	line	379
	
l6948:	
;smartkey.C: 379: timeTick = 0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	385
	
l6950:	
;smartkey.C: 385: if ( RegStatus.bits.b4 == 0) {
	btfsc	(_RegStatus),4	;volatile
	goto	u3151
	goto	u3150
u3151:
	goto	l7064
u3150:
	line	386
	
l6952:	
;smartkey.C: 386: if (RegStatus.bits.b3 == 0) {
	btfsc	(_RegStatus),3	;volatile
	goto	u3161
	goto	u3160
u3161:
	goto	l7064
u3160:
	line	387
	
l6954:	
;smartkey.C: 387: if (RegStatus.bits.b1) {
	btfss	(_RegStatus),1	;volatile
	goto	u3171
	goto	u3170
u3171:
	goto	l7064
u3170:
	line	389
	
l6956:	
;smartkey.C: 389: PAIE = 0;
	bcf	(91/8),(91)&7
	line	391
;smartkey.C: 391: RegStatus.bits.b1 = 0;
	bcf	(_RegStatus),1	;volatile
	line	395
;smartkey.C: 395: if (RegStatus.bits.b2) {
	btfss	(_RegStatus),2	;volatile
	goto	u3181
	goto	u3180
u3181:
	goto	l7062
u3180:
	goto	l7024
	line	399
	
l6960:	
;smartkey.C: 399: lostDetect = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@lostDetect)
	line	400
;smartkey.C: 400: timeTick = 0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	401
	
l6962:	
;smartkey.C: 401: tmp16 = 40;
	movlw	028h
	movwf	(main@tmp16)
	clrf	(main@tmp16+1)
	line	402
;smartkey.C: 402: break;
	goto	l959
	line	405
	
l6964:	
;smartkey.C: 405: if (timeTick > 30) {
	movlw	high(01Fh)
	subwf	(_timeTick+1),w
	movlw	low(01Fh)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3191
	goto	u3190
u3191:
	goto	l959
u3190:
	line	406
	
l6966:	
;smartkey.C: 406: timeTick = 0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	408
	
l6968:	
;smartkey.C: 408: if (READ_EEPROM(0x08) == 0xcc) WRITE_EEPROM(0x08, 0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u3201
	goto	u3200
u3201:
	goto	l6972
u3200:
	
l6970:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	410
	
l6972:	
;smartkey.C: 410: if ((mtOldState == 3)) {
	bcf	status, 5	;RP0=0, select bank0
	movf	(_mtOldState),w
	xorlw	03h
	skipz
	goto	u3211
	goto	u3210
u3211:
	goto	l6984
u3210:
	line	411
	
l6974:	
;smartkey.C: 411: beepOn(); TMR2ON = 0; beep(10, 1);
	fcall	_beepOn
	
l6976:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l6978:	
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	412
	
l6980:	
;smartkey.C: 412: if (RegStatus.bits.b7)RegStatus.bits.b7 = 0;
	btfss	(_RegStatus),7	;volatile
	goto	u3221
	goto	u3220
u3221:
	goto	l959
u3220:
	
l6982:	
	bcf	(_RegStatus),7	;volatile
	goto	l959
	line	414
	
l6984:	
;smartkey.C: 414: else if ((mtOldState == 0) || (mtOldState == 4)) {
	movf	(_mtOldState),w
	skipz
	goto	u3230
	goto	l949
u3230:
	
l6986:	
	movf	(_mtOldState),w
	xorlw	04h
	skipz
	goto	u3241
	goto	u3240
u3241:
	goto	l6998
u3240:
	
l949:	
	line	415
;smartkey.C: 415: RegStatus.bits.b0 = 1;
	bsf	(_RegStatus),0	;volatile
	line	416
	
l6988:	
;smartkey.C: 416: setState(1, 3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	417
	
l6990:	
;smartkey.C: 417: if (READ_EEPROM(0x40))WRITE_EEPROM(0x40, 0);
	movlw	(040h)
	fcall	_READ_EEPROM
	xorlw	0
	skipnz
	goto	u3251
	goto	u3250
u3251:
	goto	l6994
u3250:
	
l6992:	
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	line	418
	
l6994:	
;smartkey.C: 418: tmp16 = timeTick + 40;
	movf	(_timeTick+1),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l6996:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	419
;smartkey.C: 419: beep(10, 1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	420
;smartkey.C: 420: }
	goto	l959
	line	421
	
l6998:	
;smartkey.C: 421: else if ((mtOldState == 1)) {
	decf	(_mtOldState),w
	skipz
	goto	u3261
	goto	u3260
u3261:
	goto	l959
u3260:
	line	423
	
l7000:	
;smartkey.C: 423: if (RegStatus.bits.b7)RegStatus.bits.b7 = 0;
	btfss	(_RegStatus),7	;volatile
	goto	u3271
	goto	u3270
u3271:
	goto	l942
u3270:
	goto	l6982
	line	425
	
l942:	
	line	426
;smartkey.C: 424: }
;smartkey.C: 425: }
;smartkey.C: 426: break;
	goto	l959
	line	429
	
l7004:	
;smartkey.C: 429: if (timeTick > 200) {
	movlw	high(0C9h)
	subwf	(_timeTick+1),w
	movlw	low(0C9h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3281
	goto	u3280
u3281:
	goto	l959
u3280:
	line	431
	
l7006:	
;smartkey.C: 431: beepOff();
	fcall	_beepOff
	line	432
	
l7008:	
;smartkey.C: 432: if (READ_EEPROM(0x08) == 0xcc) WRITE_EEPROM(0x08, 0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u3291
	goto	u3290
u3291:
	goto	l7012
u3290:
	
l7010:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	433
	
l7012:	
;smartkey.C: 433: RegStatus.bits.b0 = 1;
	bsf	(_RegStatus),0	;volatile
	line	434
;smartkey.C: 434: setState(1, 3500);
	movlw	low(0DACh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	436
	
l7014:	
;smartkey.C: 436: tmp16 = timeTick + 40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l7016:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	goto	l959
	line	442
	
l7018:	
;smartkey.C: 442: beepOff();
	fcall	_beepOff
	line	443
	
l7020:	
;smartkey.C: 443: setState(2, 300);
	movlw	low(012Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	444
;smartkey.C: 444: break;
	goto	l959
	line	397
	
l7024:	
	movf	(_mtState),w
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           11     6 (fixed)
; simple_byte           16     9 (average)
; jumptable            260     6 (fixed)
; rangetable             9     6 (fixed)
; spacedrange           16     9 (fixed)
; locatedrange           5     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	5
	subwf	fsr,w
skipnc
goto l959
movlw high(S7310)
movwf pclath
	movlw low(S7310)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S7310:
	ljmp	l959
	ljmp	l6960
	ljmp	l6964
	ljmp	l7004
	ljmp	l7018
psect	maintext

	line	459
	
l7026:	
;smartkey.C: 459: if ((lostDetect == 1) && (timeTick < 1500) && (timeTick > 700))
	bcf	status, 5	;RP0=0, select bank0
	decf	(main@lostDetect),w
	skipz
	goto	u3301
	goto	u3300
u3301:
	goto	l962
u3300:
	
l7028:	
	movlw	high(05DCh)
	subwf	(_timeTick+1),w
	movlw	low(05DCh)
	skipnz
	subwf	(_timeTick),w
	skipnc
	goto	u3311
	goto	u3310
u3311:
	goto	l962
u3310:
	
l7030:	
	movlw	high(02BDh)
	subwf	(_timeTick+1),w
	movlw	low(02BDh)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3321
	goto	u3320
u3321:
	goto	l962
u3320:
	line	461
	
l7032:	
;smartkey.C: 460: {
;smartkey.C: 461: if (READ_EEPROM(0x08) == 0x00) WRITE_EEPROM(0x08, 0xcc);
	movlw	(08h)
	fcall	_READ_EEPROM
	iorlw	0
	skipz
	goto	u3331
	goto	u3330
u3331:
	goto	l963
u3330:
	
l7034:	
	movlw	(0CCh)
	movwf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	
l963:	
	line	463
;smartkey.C: 463: setState(3, 1800);
	movlw	low(0708h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(0708h)
	movwf	((?_setState))+1
	movlw	(03h)
	fcall	_setState
	line	464
	
l7036:	
;smartkey.C: 464: cntTmp = timeTick + 40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l7038:	
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	465
	
l7040:	
;smartkey.C: 465: PR2L = 20;
	movlw	(014h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	466
;smartkey.C: 466: beepOn();
	fcall	_beepOn
	line	467
	
l7042:	
;smartkey.C: 467: lostDetect = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@lostDetect)
	line	468
;smartkey.C: 468: }
	goto	l7044
	line	469
	
l962:	
	line	470
;smartkey.C: 469: else {
;smartkey.C: 470: lostDetect = 1;
	clrf	(main@lostDetect)
	incf	(main@lostDetect),f
	line	474
	
l7044:	
;smartkey.C: 473: }
;smartkey.C: 474: timeTick = 0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	goto	l6962
	line	479
	
l7048:	
;smartkey.C: 479: timeTick = 0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	480
	
l7050:	
;smartkey.C: 480: beepOn(); TMR2ON = 0;
	fcall	_beepOn
	
l7052:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	481
	
l7054:	
;smartkey.C: 481: beep(10, 2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	482
	
l7056:	
;smartkey.C: 482: if (mtOldState == 3) {RegStatus.bits.b7 = 1;}
	movf	(_mtOldState),w
	xorlw	03h
	skipz
	goto	u3341
	goto	u3340
u3341:
	goto	l959
u3340:
	
l7058:	
	bsf	(_RegStatus),7	;volatile
	goto	l959
	line	454
	
l7062:	
	movf	(_mtState),w
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 1 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; direct_byte           11     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l7026
	xorlw	2^1	; case 2
	skipnz
	goto	l7048
	goto	l959
	opt asmopt_on

	line	485
	
l959:	
	line	486
;smartkey.C: 485: }
;smartkey.C: 486: PAIE = 1;
	bsf	(91/8),(91)&7
	line	492
	
l7064:	
;smartkey.C: 487: }
;smartkey.C: 488: }
;smartkey.C: 489: }
;smartkey.C: 492: if ((timeOut != 0) && ( timeTick > timeOut)) {
	bcf	status, 5	;RP0=0, select bank0
	movf	(_timeOut+1),w
	iorwf	(_timeOut),w
	skipnz
	goto	u3351
	goto	u3350
u3351:
	goto	l7140
u3350:
	
l7066:	
	movf	(_timeTick+1),w
	subwf	(_timeOut+1),w
	skipz
	goto	u3365
	movf	(_timeTick),w
	subwf	(_timeOut),w
u3365:
	skipnc
	goto	u3361
	goto	u3360
u3361:
	goto	l7140
u3360:
	goto	l7138
	line	500
	
l7070:	
;smartkey.C: 500: beepOff();
	fcall	_beepOff
	line	501
	
l7072:	
;smartkey.C: 501: RegStatus.bits.b0 = 0;
	bcf	(_RegStatus),0	;volatile
	line	502
	
l7074:	
;smartkey.C: 502: setState(2, 300);
	movlw	low(012Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	503
;smartkey.C: 503: break;
	goto	l7140
	line	505
	
l7076:	
;smartkey.C: 505: beepOff();
	fcall	_beepOff
	line	506
	
l7078:	
;smartkey.C: 506: delay_x10ms(20);
	movlw	014h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	507
	
l7080:	
;smartkey.C: 507: beepOn(); TMR2ON = 0; RegStatus.bits.b7 = 0;
	fcall	_beepOn
	
l7082:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l7084:	
	bcf	(_RegStatus),7	;volatile
	line	508
;smartkey.C: 508: beep(30, 1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(01Eh)
	fcall	_beep
	line	509
	
l7086:	
;smartkey.C: 509: RegStatus.bits.b5 = 1;
	bsf	(_RegStatus),5	;volatile
	line	510
;smartkey.C: 510: setState(0, 0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	512
	
l7088:	
;smartkey.C: 512: tmp16 = timeTick + 40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l7090:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	513
;smartkey.C: 513: break;
	goto	l7140
	line	516
	
l7092:	
;smartkey.C: 516: if (READ_EEPROM(0x08) == 0xcc) WRITE_EEPROM(0x08, 0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u3371
	goto	u3370
u3371:
	goto	l7096
u3370:
	
l7094:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	517
	
l7096:	
;smartkey.C: 517: if (RegStatus.bits.b7) {
	btfss	(_RegStatus),7	;volatile
	goto	u3381
	goto	u3380
u3381:
	goto	l7106
u3380:
	line	518
	
l7098:	
;smartkey.C: 518: setState(4, 6000);
	movlw	low(01770h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(01770h)
	movwf	((?_setState))+1
	movlw	(04h)
	fcall	_setState
	line	519
	
l7100:	
;smartkey.C: 519: cntTmp = timeTick + 40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l7102:	
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	520
	
l7104:	
;smartkey.C: 520: PR2L = 20;
	movlw	(014h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	521
;smartkey.C: 521: beepOn();
	fcall	_beepOn
	line	523
;smartkey.C: 523: } else if (mtOldState == 0) {
	goto	l7140
	
l7106:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_mtOldState),f
	skipz
	goto	u3391
	goto	u3390
u3391:
	goto	l7120
u3390:
	line	525
	
l7108:	
;smartkey.C: 525: beep(10, 5);
	movlw	(05h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	526
	
l7110:	
;smartkey.C: 526: RegStatus.bits.b0 = 1;
	bsf	(_RegStatus),0	;volatile
	line	527
	
l7112:	
;smartkey.C: 527: if (READ_EEPROM(0x40))WRITE_EEPROM(0x40, 0);
	movlw	(040h)
	fcall	_READ_EEPROM
	xorlw	0
	skipnz
	goto	u3401
	goto	u3400
u3401:
	goto	l979
u3400:
	
l7114:	
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	
l979:	
	line	528
;smartkey.C: 528: setState(1, 3500);
	movlw	low(0DACh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	goto	l7088
	line	532
	
l7120:	
;smartkey.C: 532: beepOn(); TMR2ON = 0;
	fcall	_beepOn
	
l7122:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	533
	
l7124:	
;smartkey.C: 533: RegStatus.bits.b7 = 0;
	bcf	(_RegStatus),7	;volatile
	line	534
	
l7126:	
;smartkey.C: 534: beep(30, 1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(01Eh)
	fcall	_beep
	line	535
	
l7128:	
;smartkey.C: 535: setState(0, 0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	537
	
l7130:	
;smartkey.C: 537: RegStatus.bits.b5 = 1;
	bsf	(_RegStatus),5	;volatile
	goto	l7088
	line	494
	
l7138:	
	movf	(_mtState),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 1 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           13     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l7140
	xorlw	2^1	; case 2
	skipnz
	goto	l7092
	xorlw	3^2	; case 3
	skipnz
	goto	l7070
	xorlw	4^3	; case 4
	skipnz
	goto	l7076
	goto	l7140
	opt asmopt_on

	line	544
	
l7140:	
;smartkey.C: 542: }
;smartkey.C: 544: if ((timeTick > tmp16) && (RegStatus.bits.b6 == 1)) {
	movf	(_timeTick+1),w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@tmp16+1),w
	skipz
	goto	u3415
	movf	(_timeTick),w
	subwf	(main@tmp16),w
u3415:
	skipnc
	goto	u3411
	goto	u3410
u3411:
	goto	l7248
u3410:
	
l7142:	
	btfss	(_RegStatus),6	;volatile
	goto	u3421
	goto	u3420
u3421:
	goto	l7248
u3420:
	line	545
	
l7144:	
;smartkey.C: 545: if (timeTick > 65000) timeTick = 0;
	movlw	high(0FDE9h)
	subwf	(_timeTick+1),w
	movlw	low(0FDE9h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3431
	goto	u3430
u3431:
	goto	l7148
u3430:
	
l7146:	
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	546
	
l7148:	
;smartkey.C: 546: tmp16 = timeTick + 40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l7150:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	548
	
l7152:	
;smartkey.C: 548: if (AccRead(0x02,buf, 6) == 0) {
	movlw	(main@buf)&0ffh
	movwf	(?_AccRead)
	movlw	(06h)
	movwf	0+(?_AccRead)+01h
	movlw	(02h)
	fcall	_AccRead
	iorlw	0
	skipz
	goto	u3441
	goto	u3440
u3441:
	goto	l7248
u3440:
	line	550
	
l7154:	
;smartkey.C: 550: if((mtState == 1) ){
	decf	(_mtState),w
	skipz
	goto	u3451
	goto	u3450
u3451:
	goto	l7230
u3450:
	line	553
	
l7156:	
;smartkey.C: 553: if (compe((signed char)buf[1], (signed char)acXsum, 4) && compe((signed char)buf[3], (signed char)acYsum, 4)) {
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acXsum),w
	movwf	(?_compe)
	movlw	(04h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+01h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3461
	goto	u3460
u3461:
	goto	l7186
u3460:
	
l7158:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acYsum),w
	movwf	(?_compe)
	movlw	(04h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+03h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3471
	goto	u3470
u3471:
	goto	l7186
u3470:
	line	555
	
l7160:	
;smartkey.C: 555: isSw++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@isSw),f
	line	556
	
l7162:	
;smartkey.C: 556: if (isSw > 44) {
	movlw	(02Dh)
	subwf	(main@isSw),w
	skipc
	goto	u3481
	goto	u3480
u3481:
	goto	l7176
u3480:
	line	557
	
l7164:	
;smartkey.C: 557: isSw = 0;
	clrf	(main@isSw)
	line	558
	
l7166:	
;smartkey.C: 558: RegStatus.bits.b5 = 1;
	bsf	(_RegStatus),5	;volatile
	line	561
	
l7168:	
;smartkey.C: 561: RegStatus.bits.b0 = 0;
	bcf	(_RegStatus),0	;volatile
	line	562
	
l7170:	
;smartkey.C: 562: setState(2, 300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	563
	
l7172:	
;smartkey.C: 563: tmp16 = timeTick + 40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l7174:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	564
;smartkey.C: 564: }
	goto	l7208
	line	565
	
l7176:	
;smartkey.C: 565: else if (isSw > 25) {
	movlw	(01Ah)
	subwf	(main@isSw),w
	skipc
	goto	u3491
	goto	u3490
u3491:
	goto	l7208
u3490:
	line	566
	
l7178:	
;smartkey.C: 566: if (isSw % 2 == 0) {
	btfsc	(main@isSw),(0)&7
	goto	u3501
	goto	u3500
u3501:
	goto	l987
u3500:
	line	567
	
l7180:	
;smartkey.C: 567: beepOn(); TMR2ON = 0; beep(7, 1);
	fcall	_beepOn
	
l7182:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l7184:	
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(07h)
	fcall	_beep
	goto	l7208
	line	570
	
l987:	
;smartkey.C: 568: }
;smartkey.C: 569: }
;smartkey.C: 570: }
	goto	l7208
	line	575
	
l7186:	
;smartkey.C: 572: else
;smartkey.C: 574: {
;smartkey.C: 575: isSw = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@isSw)
	line	578
	
l7188:	
;smartkey.C: 578: if (compe((signed char)buf[1],acXOld,1 ) && compe((signed char)buf[3],acYOld,1)) {
	movf	(main@acXOld),w
	movwf	(?_compe)
	clrf	0+(?_compe)+01h
	incf	0+(?_compe)+01h,f
	movf	0+(main@buf)+01h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3511
	goto	u3510
u3511:
	goto	l7206
u3510:
	
l7190:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acYOld),w
	movwf	(?_compe)
	clrf	0+(?_compe)+01h
	incf	0+(?_compe)+01h,f
	movf	0+(main@buf)+03h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3521
	goto	u3520
u3521:
	goto	l7206
u3520:
	line	579
	
l7192:	
;smartkey.C: 579: isWait++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@isWait),f
	skipnz
	incf	(main@isWait+1),f
	line	580
	
l7194:	
;smartkey.C: 580: if (isWait == 450) {
	decf	(main@isWait+1),w
	movlw	194
	skipnz
	xorwf	(main@isWait),w

	skipz
	goto	u3531
	goto	u3530
u3531:
	goto	l7208
u3530:
	line	581
	
l7196:	
;smartkey.C: 581: isWait = 0;
	clrf	(main@isWait)
	clrf	(main@isWait+1)
	line	582
	
l7198:	
;smartkey.C: 582: beep(7, 2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	line	583
	
l7200:	
;smartkey.C: 583: RegStatus.bits.b5 = 1;
	bsf	(_RegStatus),5	;volatile
	line	584
	
l7202:	
;smartkey.C: 584: RegStatus.bits.b0 = 0;
	bcf	(_RegStatus),0	;volatile
	line	585
	
l7204:	
;smartkey.C: 585: setState(2, 300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	goto	l7208
	line	589
	
l7206:	
;smartkey.C: 588: else
;smartkey.C: 589: {isWait = 0;}
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@isWait)
	clrf	(main@isWait+1)
	line	593
	
l7208:	
;smartkey.C: 590: }
;smartkey.C: 593: if ( ((signed char)buf[5] > -15) && ((signed char)buf[5] < 15)) {
	movf	0+(main@buf)+05h,w
	xorlw	80h
	addlw	-((-14)^80h)
	skipc
	goto	u3541
	goto	u3540
u3541:
	goto	l7224
u3540:
	
l7210:	
	movf	0+(main@buf)+05h,w
	xorlw	80h
	addlw	-((0Fh)^80h)
	skipnc
	goto	u3551
	goto	u3550
u3551:
	goto	l7224
u3550:
	line	594
	
l7212:	
;smartkey.C: 594: isFall++;
	incf	(main@isFall),f
	line	595
	
l7214:	
;smartkey.C: 595: if (isFall > 4) {
	movlw	(05h)
	subwf	(main@isFall),w
	skipc
	goto	u3561
	goto	u3560
u3561:
	goto	l7226
u3560:
	line	596
	
l7216:	
;smartkey.C: 596: isFall = 0;
	clrf	(main@isFall)
	line	597
	
l7218:	
;smartkey.C: 597: beep(7, 2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	line	598
	
l7220:	
;smartkey.C: 598: RegStatus.bits.b0 = 0;
	bcf	(_RegStatus),0	;volatile
	line	599
	
l7222:	
;smartkey.C: 599: setState(2, 300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	goto	l7226
	line	603
	
l7224:	
;smartkey.C: 602: else {
;smartkey.C: 603: isFall = 0;
	clrf	(main@isFall)
	line	607
	
l7226:	
;smartkey.C: 604: }
;smartkey.C: 607: acYOld =(signed char)buf[3]; acXOld = (signed char)buf[1];
	movf	0+(main@buf)+03h,w
	movwf	(main@acYOld)
	
l7228:	
	movf	0+(main@buf)+01h,w
	movwf	(main@acXOld)
	line	610
;smartkey.C: 610: }
	goto	l7248
	line	611
	
l7230:	
;smartkey.C: 611: else if(mtState== 0){
	movf	(_mtState),f
	skipz
	goto	u3571
	goto	u3570
u3571:
	goto	l7248
u3570:
	line	613
	
l7232:	
;smartkey.C: 613: if (RegStatus.bits.b5) {
	btfss	(_RegStatus),5	;volatile
	goto	u3581
	goto	u3580
u3581:
	goto	l7248
u3580:
	line	614
	
l7234:	
;smartkey.C: 614: if (compe((signed char)buf[1],acXOld , 3) && compe((signed char)buf[3],acYOld , 3)) {
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acXOld),w
	movwf	(?_compe)
	movlw	(03h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+01h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3591
	goto	u3590
u3591:
	goto	l7240
u3590:
	
l7236:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acYOld),w
	movwf	(?_compe)
	movlw	(03h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+03h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3601
	goto	u3600
u3601:
	goto	l7240
u3600:
	line	616
	
l7238:	
;smartkey.C: 616: isSw = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@isSw)
	line	617
;smartkey.C: 617: }
	goto	l7248
	line	619
	
l7240:	
;smartkey.C: 618: else {
;smartkey.C: 619: isSw++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@isSw),f
	line	620
	
l7242:	
;smartkey.C: 620: beepOn(); TMR2ON = 0; beep(7, 3);
	fcall	_beepOn
	
l7244:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l7246:	
	movlw	(03h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	line	629
	
l7248:	
;smartkey.C: 621: }
;smartkey.C: 622: }
;smartkey.C: 623: }
;smartkey.C: 626: }
;smartkey.C: 627: }
;smartkey.C: 629: if (RegStatus.bits.b0) {RC0 = 1; RC1 = 1;}
	btfss	(_RegStatus),0	;volatile
	goto	u3611
	goto	u3610
u3611:
	goto	l1002
u3610:
	
l7250:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	goto	l7252
	line	630
	
l1002:	
;smartkey.C: 630: else {RC0 = 0; RC1 = 0;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	bcf	(57/8),(57)&7
	line	633
	
l7252:	
;smartkey.C: 633: if (timeTick > 500){
	movlw	high(01F5h)
	subwf	(_timeTick+1),w
	movlw	low(01F5h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3621
	goto	u3620
u3621:
	goto	l6950
u3620:
	line	634
	
l7254:	
;smartkey.C: 634: if (READ_EEPROM(0x3F)) WRITE_EEPROM(0x3F, 0);
	movlw	(03Fh)
	fcall	_READ_EEPROM
	xorlw	0
	skipnz
	goto	u3631
	goto	u3630
u3631:
	goto	l7258
u3630:
	
l7256:	
	clrf	(?_WRITE_EEPROM)
	movlw	(03Fh)
	fcall	_WRITE_EEPROM
	line	635
	
l7258:	
;smartkey.C: 635: if (READ_EEPROM(0x40)) WRITE_EEPROM(0x40, 0);
	movlw	(040h)
	fcall	_READ_EEPROM
	xorlw	0
	skipnz
	goto	u3641
	goto	u3640
u3641:
	goto	l6950
u3640:
	
l7260:	
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	goto	l6950
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	638
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_AccRead
psect	text877,local,class=CODE,delta=2
global __ptext877
__ptext877:

;; *************** function _AccRead *****************
;; Defined at:
;;		line 34 in file "mpu6x.c"
;; Parameters:    Size  Location     Type
;;  rAdd            1    wreg     unsigned char 
;;  dat             1    4[BANK0 ] PTR unsigned char 
;;		 -> main@buf(6), 
;;  len             1    5[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  rAdd            1    8[BANK0 ] unsigned char 
;;  i               1    9[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       2       0
;;      Temps:          0       2       0
;;      Totals:         0       6       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_swI2C_Start
;;		_swI2C_WriteByte
;;		_swI2C_ReadByte
;;		_swI2C_Stop
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text877
	file	"mpu6x.c"
	line	34
	global	__size_of_AccRead
	__size_of_AccRead	equ	__end_of_AccRead-_AccRead
	
_AccRead:	
	opt	stack 4
; Regs used in _AccRead: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;AccRead@rAdd stored from wreg
	line	37
	movwf	(AccRead@rAdd)
	
l6744:	
;mpu6x.c: 35: unsigned char i;
;mpu6x.c: 37: swI2C_Start();
	fcall	_swI2C_Start
	line	38
;mpu6x.c: 38: if(swI2C_WriteByte(0x18<<1)== 0 )
	movlw	(030h)
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2901
	goto	u2900
u2901:
	goto	l6768
u2900:
	line	40
	
l6746:	
;mpu6x.c: 39: {
;mpu6x.c: 40: if(swI2C_WriteByte(rAdd)==0 )
	movf	(AccRead@rAdd),w
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2911
	goto	u2910
u2911:
	goto	l6772
u2910:
	line	42
	
l6748:	
;mpu6x.c: 41: {
;mpu6x.c: 42: swI2C_Start();
	fcall	_swI2C_Start
	line	43
;mpu6x.c: 43: if(swI2C_WriteByte((0x18<<1)|1)== 0 ){
	movlw	(031h)
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2921
	goto	u2920
u2921:
	goto	l6768
u2920:
	line	45
	
l6750:	
;mpu6x.c: 45: for(i=0; i<(len-1);i++){
	clrf	(AccRead@i)
	goto	l6756
	line	46
	
l6752:	
;mpu6x.c: 46: dat[i]=swI2C_ReadByte(0);
	bcf	status, 5	;RP0=0, select bank0
	movf	(AccRead@i),w
	addwf	(AccRead@dat),w
	movwf	(??_AccRead+0)+0
	movf	0+(??_AccRead+0)+0,w
	movwf	fsr0
	movlw	(0)
	fcall	_swI2C_ReadByte
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	45
	
l6754:	
	incf	(AccRead@i),f
	
l6756:	
	movf	(AccRead@len),w
	addlw	low(-1)
	movwf	(??_AccRead+0)+0
	movlw	high(-1)
	skipnc
	movlw	(high(-1)+1)&0ffh
	movwf	((??_AccRead+0)+0)+1
	movf	1+(??_AccRead+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u2935
	movf	0+(??_AccRead+0)+0,w
	subwf	(AccRead@i),w
u2935:

	skipc
	goto	u2931
	goto	u2930
u2931:
	goto	l6752
u2930:
	line	48
	
l6758:	
;mpu6x.c: 47: }
;mpu6x.c: 48: dat[i]=swI2C_ReadByte(1);
	bcf	status, 5	;RP0=0, select bank0
	movf	(AccRead@i),w
	addwf	(AccRead@dat),w
	movwf	(??_AccRead+0)+0
	movf	0+(??_AccRead+0)+0,w
	movwf	fsr0
	movlw	(01h)
	fcall	_swI2C_ReadByte
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	49
	
l6760:	
;mpu6x.c: 49: swI2C_Stop();
	fcall	_swI2C_Stop
	line	50
	
l6762:	
;mpu6x.c: 50: return 0;
	movlw	(0)
	goto	l3424
	line	54
	
l6768:	
;mpu6x.c: 53: else
;mpu6x.c: 54: return 1;
	movlw	(01h)
	goto	l3424
	line	57
	
l6772:	
;mpu6x.c: 56: else
;mpu6x.c: 57: return 2;
	movlw	(02h)
	line	61
	
l3424:	
	return
	opt stack 0
GLOBAL	__end_of_AccRead
	__end_of_AccRead:
;; =============== function _AccRead ends ============

	signat	_AccRead,12409
	global	_AccWrite
psect	text878,local,class=CODE,delta=2
global __ptext878
__ptext878:

;; *************** function _AccWrite *****************
;; Defined at:
;;		line 4 in file "mpu6x.c"
;; Parameters:    Size  Location     Type
;;  rAdd            1    wreg     unsigned char 
;;  dat             1    3[BANK0 ] PTR unsigned char 
;;		 -> main@buf(6), 
;;  len             1    4[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  rAdd            1    6[BANK0 ] unsigned char 
;;  i               1    7[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       2       0
;;      Temps:          0       1       0
;;      Totals:         0       5       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_swI2C_Start
;;		_swI2C_WriteByte
;;		_swI2C_Stop
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text878
	file	"mpu6x.c"
	line	4
	global	__size_of_AccWrite
	__size_of_AccWrite	equ	__end_of_AccWrite-_AccWrite
	
_AccWrite:	
	opt	stack 4
; Regs used in _AccWrite: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;AccWrite@rAdd stored from wreg
	line	7
	movwf	(AccWrite@rAdd)
	
l6712:	
;mpu6x.c: 5: unsigned char i;
;mpu6x.c: 7: for(i=0; i<len;i++){
	clrf	(AccWrite@i)
	goto	l6738
	line	8
	
l6714:	
;mpu6x.c: 8: swI2C_Start();
	fcall	_swI2C_Start
	line	10
;mpu6x.c: 10: if(swI2C_WriteByte(0x18<<1)== 0 )
	movlw	(030h)
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2861
	goto	u2860
u2861:
	goto	l6732
u2860:
	line	12
	
l6716:	
;mpu6x.c: 11: {
;mpu6x.c: 12: if(swI2C_WriteByte(rAdd)==0 )
	movf	(AccWrite@rAdd),w
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2871
	goto	u2870
u2871:
	goto	l6728
u2870:
	line	16
	
l6718:	
;mpu6x.c: 13: {
;mpu6x.c: 15: {
;mpu6x.c: 16: if(swI2C_WriteByte(dat[i])==1 ){
	movf	(AccWrite@i),w
	addwf	(AccWrite@dat),w
	movwf	(??_AccWrite+0)+0
	movf	0+(??_AccWrite+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_swI2C_WriteByte
	xorlw	01h
	skipz
	goto	u2881
	goto	u2880
u2881:
	goto	l6726
u2880:
	line	17
	
l6720:	
;mpu6x.c: 17: swI2C_Stop();
	fcall	_swI2C_Stop
	line	18
	
l6722:	
;mpu6x.c: 18: return 3;
	movlw	(03h)
	goto	l3412
	line	21
	
l6726:	
;mpu6x.c: 19: }
;mpu6x.c: 20: }
;mpu6x.c: 21: swI2C_Stop();
	fcall	_swI2C_Stop
	line	22
;mpu6x.c: 22: }
	goto	l6736
	line	24
	
l6728:	
;mpu6x.c: 23: else
;mpu6x.c: 24: return 2;
	movlw	(02h)
	goto	l3412
	line	27
	
l6732:	
;mpu6x.c: 26: else
;mpu6x.c: 27: return 1;
	movlw	(01h)
	goto	l3412
	line	7
	
l6736:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(AccWrite@i),f
	
l6738:	
	movf	(AccWrite@len),w
	subwf	(AccWrite@i),w
	skipc
	goto	u2891
	goto	u2890
u2891:
	goto	l6714
u2890:
	line	29
	
l6740:	
;mpu6x.c: 28: }
;mpu6x.c: 29: return 0;
	movlw	(0)
	line	30
	
l3412:	
	return
	opt stack 0
GLOBAL	__end_of_AccWrite
	__end_of_AccWrite:
;; =============== function _AccWrite ends ============

	signat	_AccWrite,12409
	global	_swI2C_ReadByte
psect	text879,local,class=CODE,delta=2
global __ptext879
__ptext879:

;; *************** function _swI2C_ReadByte *****************
;; Defined at:
;;		line 112 in file "SWI2C.C"
;; Parameters:    Size  Location     Type
;;  Ack             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Ack             1    1[BANK0 ] unsigned char 
;;  i               1    3[BANK0 ] unsigned char 
;;  dat             1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       3       0
;;      Temps:          0       1       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AccRead
;; This function uses a non-reentrant model
;;
psect	text879
	file	"SWI2C.C"
	line	112
	global	__size_of_swI2C_ReadByte
	__size_of_swI2C_ReadByte	equ	__end_of_swI2C_ReadByte-_swI2C_ReadByte
	
_swI2C_ReadByte:	
	opt	stack 4
; Regs used in _swI2C_ReadByte: [wreg+status,2+status,0]
;swI2C_ReadByte@Ack stored from wreg
	line	114
	movwf	(swI2C_ReadByte@Ack)
	
l6676:	
	clrf	(swI2C_ReadByte@dat)
	line	115
	
l6678:	
;SWI2C.C: 115: RA7 = 0;
	bcf	(47/8),(47)&7
	line	116
	
l6680:	
;SWI2C.C: 116: TRISA |=0x40;;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(6/8),(6)&7	;volatile
	line	117
	
l6682:	
;SWI2C.C: 117: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_ReadByte+0)+0,f
u3727:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3727
opt asmopt_on

	line	118
	
l6684:	
;SWI2C.C: 118: for(i=0;i<8;i++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(swI2C_ReadByte@i)
	line	119
	
l2612:	
	line	120
;SWI2C.C: 119: {
;SWI2C.C: 120: RA7 = 1;
	bsf	(47/8),(47)&7
	line	121
	
l6688:	
;SWI2C.C: 121: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_ReadByte+0)+0,f
u3737:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3737
opt asmopt_on

	line	122
	
l6690:	
;SWI2C.C: 122: dat = dat<<1 |(RA6 & 1 );
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(46/8),(46)&7
	movlw	1
	andlw	01h
	movwf	(??_swI2C_ReadByte+0)+0
	clrc
	rlf	(swI2C_ReadByte@dat),w
	iorwf	(??_swI2C_ReadByte+0)+0,w
	movwf	(swI2C_ReadByte@dat)
	line	125
	
l6692:	
;SWI2C.C: 125: RA7 = 0;
	bcf	(47/8),(47)&7
	line	126
	
l6694:	
;SWI2C.C: 126: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_ReadByte+0)+0,f
u3747:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3747
opt asmopt_on

	line	118
	
l6696:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(swI2C_ReadByte@i),f
	movlw	(08h)
	subwf	(swI2C_ReadByte@i),w
	skipc
	goto	u2831
	goto	u2830
u2831:
	goto	l2612
u2830:
	
l2613:	
	line	129
;SWI2C.C: 127: }
;SWI2C.C: 129: TRISA &=0xbf;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(6/8),(6)&7	;volatile
	line	131
	
l6698:	
;SWI2C.C: 131: RA6 = (Ack) ? 1 : 0;
	bcf	status, 5	;RP0=0, select bank0
	movf	(swI2C_ReadByte@Ack),f
	skipz
	goto	u2841
	goto	u2840
	
u2841:
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	goto	u2854
u2840:
	bcf	status, 5	;RP0=0, select bank0
	bcf	(46/8),(46)&7
u2854:
	line	132
	
l6700:	
;SWI2C.C: 132: RA7 = 1;
	bsf	(47/8),(47)&7
	line	133
	
l6702:	
;SWI2C.C: 133: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_ReadByte+0)+0,f
u3757:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3757
opt asmopt_on

	line	134
	
l6704:	
;SWI2C.C: 134: RA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(47/8),(47)&7
	line	135
	
l6706:	
;SWI2C.C: 135: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_ReadByte+0)+0,f
u3767:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3767
opt asmopt_on

	line	136
	
l6708:	
;SWI2C.C: 136: return dat;
	bcf	status, 5	;RP0=0, select bank0
	movf	(swI2C_ReadByte@dat),w
	line	137
	
l2614:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_ReadByte
	__end_of_swI2C_ReadByte:
;; =============== function _swI2C_ReadByte ends ============

	signat	_swI2C_ReadByte,4217
	global	_swI2C_WriteByte
psect	text880,local,class=CODE,delta=2
global __ptext880
__ptext880:

;; *************** function _swI2C_WriteByte *****************
;; Defined at:
;;		line 86 in file "SWI2C.C"
;; Parameters:    Size  Location     Type
;;  dat             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  dat             1    1[BANK0 ] unsigned char 
;;  i               1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 20/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       1       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AccWrite
;;		_AccRead
;; This function uses a non-reentrant model
;;
psect	text880
	file	"SWI2C.C"
	line	86
	global	__size_of_swI2C_WriteByte
	__size_of_swI2C_WriteByte	equ	__end_of_swI2C_WriteByte-_swI2C_WriteByte
	
_swI2C_WriteByte:	
	opt	stack 4
; Regs used in _swI2C_WriteByte: [wreg+status,2+status,0]
;swI2C_WriteByte@dat stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(swI2C_WriteByte@dat)
	line	87
	
l6648:	
	line	89
	
l6650:	
;SWI2C.C: 89: TRISA &=0xbf;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(6/8),(6)&7	;volatile
	line	90
	
l6652:	
;SWI2C.C: 90: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_WriteByte+0)+0,f
u3777:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u3777
opt asmopt_on

	line	91
	
l6654:	
;SWI2C.C: 91: for(i=0;i<8;i++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(swI2C_WriteByte@i)
	line	92
	
l2607:	
	line	93
;SWI2C.C: 92: {
;SWI2C.C: 93: RA6 = (dat&0x80) ? 1:0;
	btfsc	(swI2C_WriteByte@dat),(7)&7
	goto	u2801
	goto	u2800
	
u2801:
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	goto	u2814
u2800:
	bcf	status, 5	;RP0=0, select bank0
	bcf	(46/8),(46)&7
u2814:
	line	94
;SWI2C.C: 94: dat<<=1;
	clrc
	rlf	(swI2C_WriteByte@dat),f
	line	95
;SWI2C.C: 95: RA7 = 1;
	bsf	(47/8),(47)&7
	line	96
	
l6658:	
;SWI2C.C: 96: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_WriteByte+0)+0,f
u3787:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u3787
opt asmopt_on

	line	97
	
l6660:	
;SWI2C.C: 97: RA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(47/8),(47)&7
	line	98
;SWI2C.C: 98: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_WriteByte+0)+0,f
u3797:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u3797
opt asmopt_on

	line	91
	
l6662:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(swI2C_WriteByte@i),f
	
l6664:	
	movlw	(08h)
	subwf	(swI2C_WriteByte@i),w
	skipc
	goto	u2821
	goto	u2820
u2821:
	goto	l2607
u2820:
	
l2608:	
	line	101
;SWI2C.C: 99: }
;SWI2C.C: 101: TRISA |=0x40;;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(6/8),(6)&7	;volatile
	line	102
	
l6666:	
;SWI2C.C: 102: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_WriteByte+0)+0,f
u3807:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u3807
opt asmopt_on

	line	103
	
l6668:	
;SWI2C.C: 103: RA7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(47/8),(47)&7
	line	104
;SWI2C.C: 104: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_WriteByte+0)+0,f
u3817:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u3817
opt asmopt_on

	line	105
;SWI2C.C: 105: i= RA6;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(46/8),(46)&7
	movlw	1
	movwf	(swI2C_WriteByte@i)
	line	106
	
l6670:	
;SWI2C.C: 106: RA7 = 0;
	bcf	(47/8),(47)&7
	line	107
	
l6672:	
;SWI2C.C: 107: TRISA &=0xbf;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(6/8),(6)&7	;volatile
	line	108
;SWI2C.C: 108: return i;
	bcf	status, 5	;RP0=0, select bank0
	movf	(swI2C_WriteByte@i),w
	line	109
	
l2609:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_WriteByte
	__end_of_swI2C_WriteByte:
;; =============== function _swI2C_WriteByte ends ============

	signat	_swI2C_WriteByte,4217
	global	_swI2C_Stop
psect	text881,local,class=CODE,delta=2
global __ptext881
__ptext881:

;; *************** function _swI2C_Stop *****************
;; Defined at:
;;		line 35 in file "SWI2C.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       1       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AccWrite
;;		_AccRead
;; This function uses a non-reentrant model
;;
psect	text881
	file	"SWI2C.C"
	line	35
	global	__size_of_swI2C_Stop
	__size_of_swI2C_Stop	equ	__end_of_swI2C_Stop-_swI2C_Stop
	
_swI2C_Stop:	
	opt	stack 4
; Regs used in _swI2C_Stop: [wreg]
	line	37
	
l6642:	
;SWI2C.C: 37: RA6 = 0;
	bcf	(46/8),(46)&7
	line	38
;SWI2C.C: 38: RA7 = 1;
	bsf	(47/8),(47)&7
	line	39
	
l6644:	
;SWI2C.C: 39: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Stop+0)+0,f
u3827:
decfsz	(??_swI2C_Stop+0)+0,f
	goto	u3827
opt asmopt_on

	line	40
	
l6646:	
;SWI2C.C: 40: RA6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	line	41
;SWI2C.C: 41: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Stop+0)+0,f
u3837:
decfsz	(??_swI2C_Stop+0)+0,f
	goto	u3837
opt asmopt_on

	line	42
	
l2601:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_Stop
	__end_of_swI2C_Stop:
;; =============== function _swI2C_Stop ends ============

	signat	_swI2C_Stop,88
	global	_swI2C_Start
psect	text882,local,class=CODE,delta=2
global __ptext882
__ptext882:

;; *************** function _swI2C_Start *****************
;; Defined at:
;;		line 22 in file "SWI2C.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       1       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AccWrite
;;		_AccRead
;; This function uses a non-reentrant model
;;
psect	text882
	file	"SWI2C.C"
	line	22
	global	__size_of_swI2C_Start
	__size_of_swI2C_Start	equ	__end_of_swI2C_Start-_swI2C_Start
	
_swI2C_Start:	
	opt	stack 4
; Regs used in _swI2C_Start: [wreg]
	line	24
	
l6634:	
;SWI2C.C: 24: RA7 = 1;
	bsf	(47/8),(47)&7
	line	26
;SWI2C.C: 26: RA6 = 1;
	bsf	(46/8),(46)&7
	line	27
	
l6636:	
;SWI2C.C: 27: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Start+0)+0,f
u3847:
decfsz	(??_swI2C_Start+0)+0,f
	goto	u3847
opt asmopt_on

	line	28
	
l6638:	
;SWI2C.C: 28: RA6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(46/8),(46)&7
	line	29
;SWI2C.C: 29: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Start+0)+0,f
u3857:
decfsz	(??_swI2C_Start+0)+0,f
	goto	u3857
opt asmopt_on

	line	30
	
l6640:	
;SWI2C.C: 30: RA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(47/8),(47)&7
	line	31
;SWI2C.C: 31: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Start+0)+0,f
u3867:
decfsz	(??_swI2C_Start+0)+0,f
	goto	u3867
opt asmopt_on

	line	32
	
l2598:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_Start
	__end_of_swI2C_Start:
;; =============== function _swI2C_Start ends ============

	signat	_swI2C_Start,88
	global	_swI2C_Init
psect	text883,local,class=CODE,delta=2
global __ptext883
__ptext883:

;; *************** function _swI2C_Init *****************
;; Defined at:
;;		line 8 in file "SWI2C.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       1       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text883
	file	"SWI2C.C"
	line	8
	global	__size_of_swI2C_Init
	__size_of_swI2C_Init	equ	__end_of_swI2C_Init-_swI2C_Init
	
_swI2C_Init:	
	opt	stack 5
; Regs used in _swI2C_Init: [wreg]
	line	10
	
l6626:	
;SWI2C.C: 10: TRISA &=0xbf;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(6/8),(6)&7	;volatile
	line	11
;SWI2C.C: 11: TRISA &=0x7f;;
	bcf	(133)^080h+(7/8),(7)&7	;volatile
	line	12
	
l6628:	
;SWI2C.C: 12: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_Init+0)+0,f
u3877:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u3877
opt asmopt_on

	line	13
	
l6630:	
;SWI2C.C: 13: RA7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(47/8),(47)&7
	line	14
	
l6632:	
;SWI2C.C: 14: RA6 = 1;
	bsf	(46/8),(46)&7
	line	15
;SWI2C.C: 15: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Init+0)+0,f
u3887:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u3887
opt asmopt_on

	line	16
;SWI2C.C: 16: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_Init+0)+0,f
u3897:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u3897
opt asmopt_on

	line	17
;SWI2C.C: 17: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_Init+0)+0,f
u3907:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u3907
opt asmopt_on

	line	18
;SWI2C.C: 18: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_Init+0)+0,f
u3917:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u3917
opt asmopt_on

	line	19
	
l2595:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_Init
	__end_of_swI2C_Init:
;; =============== function _swI2C_Init ends ============

	signat	_swI2C_Init,88
	global	_sys_init
psect	text884,local,class=CODE,delta=2
global __ptext884
__ptext884:

;; *************** function _sys_init *****************
;; Defined at:
;;		line 3 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 20/20
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text884
	file	"sysinit.c"
	line	3
	global	__size_of_sys_init
	__size_of_sys_init	equ	__end_of_sys_init-_sys_init
	
_sys_init:	
	opt	stack 5
; Regs used in _sys_init: [wreg]
	line	21
	
l6622:	
;sysinit.c: 21: OSCCON = 0B01010001;
	movlw	(051h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	22
	
l6624:	
;sysinit.c: 22: _nop();
	nop
	line	28
;sysinit.c: 28: while(HTS==0);
	
l1796:	
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1146/8)^080h,(1146)&7
	goto	u2791
	goto	u2790
u2791:
	goto	l1796
u2790:
	line	30
	
l1799:	
	return
	opt stack 0
GLOBAL	__end_of_sys_init
	__end_of_sys_init:
;; =============== function _sys_init ends ============

	signat	_sys_init,88
	global	_beep
psect	text885,local,class=CODE,delta=2
global __ptext885
__ptext885:

;; *************** function _beep *****************
;; Defined at:
;;		line 146 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  delay           1    wreg     unsigned char 
;;  rep             1    4[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  delay           1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       1       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_delay_x10ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text885
	file	"smartkey.C"
	line	146
	global	__size_of_beep
	__size_of_beep	equ	__end_of_beep-_beep
	
_beep:	
	opt	stack 4
; Regs used in _beep: [wreg+status,2+status,0+pclath+cstack]
;beep@delay stored from wreg
	movwf	(beep@delay)
	line	148
	
l6608:	
;smartkey.C: 147: {
;smartkey.C: 148: while (rep--) {
	goto	l6620
	
l862:	
	line	149
;smartkey.C: 149: TMR2ON = 1;
	bsf	(146/8),(146)&7
	line	150
	
l6610:	
;smartkey.C: 150: PR2L = 12;
	movlw	(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	151
	
l6612:	
;smartkey.C: 151: delay_x10ms(delay);
	bcf	status, 5	;RP0=0, select bank0
	movf	(beep@delay),w
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	153
	
l6614:	
;smartkey.C: 153: TMR2ON = 0; RA3 = 0;
	bcf	(146/8),(146)&7
	
l6616:	
	bcf	(43/8),(43)&7
	line	154
	
l6618:	
;smartkey.C: 154: delay_x10ms(20);
	movlw	014h
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	148
	
l6620:	
	decf	(beep@rep),f
	movf	((beep@rep)),w
	xorlw	0FFh
	skipz
	goto	u2781
	goto	u2780
u2781:
	goto	l862
u2780:
	line	159
	
l864:	
	return
	opt stack 0
GLOBAL	__end_of_beep
	__end_of_beep:
;; =============== function _beep ends ============

	signat	_beep,8312
	global	___awdiv
psect	text886,local,class=CODE,delta=2
global __ptext886
__ptext886:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] int 
;;  dividend        2    2[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    6[BANK0 ] int 
;;  sign            1    5[BANK0 ] unsigned char 
;;  counter         1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       4       0
;;      Locals:         0       4       0
;;      Temps:          0       0       0
;;      Totals:         0       8       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text886
	file	"D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 5
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l6564:	
	clrf	(___awdiv@sign)
	line	10
	
l6566:	
	btfss	(___awdiv@divisor+1),7
	goto	u2711
	goto	u2710
u2711:
	goto	l6572
u2710:
	line	11
	
l6568:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	
l6570:	
	clrf	(___awdiv@sign)
	incf	(___awdiv@sign),f
	line	14
	
l6572:	
	btfss	(___awdiv@dividend+1),7
	goto	u2721
	goto	u2720
u2721:
	goto	l6578
u2720:
	line	15
	
l6574:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l6576:	
	movlw	(01h)
	xorwf	(___awdiv@sign),f
	line	18
	
l6578:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l6580:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2731
	goto	u2730
u2731:
	goto	l6600
u2730:
	line	20
	
l6582:	
	clrf	(___awdiv@counter)
	incf	(___awdiv@counter),f
	line	21
	goto	l6586
	line	22
	
l6584:	
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	line	23
	incf	(___awdiv@counter),f
	line	21
	
l6586:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2741
	goto	u2740
u2741:
	goto	l6584
u2740:
	line	26
	
l6588:	
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	line	27
	
l6590:	
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2755
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2755:
	skipc
	goto	u2751
	goto	u2750
u2751:
	goto	l6596
u2750:
	line	28
	
l6592:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l6594:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	line	31
	
l6596:	
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	line	32
	
l6598:	
	decfsz	(___awdiv@counter),f
	goto	u2761
	goto	u2760
u2761:
	goto	l6588
u2760:
	line	34
	
l6600:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2770
	goto	l6604
u2770:
	line	35
	
l6602:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	line	36
	
l6604:	
	movf	(___awdiv@quotient+1),w
	movwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	movwf	(?___awdiv)
	line	37
	
l4246:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	_int_init
psect	text887,local,class=CODE,delta=2
global __ptext887
__ptext887:

;; *************** function _int_init *****************
;; Defined at:
;;		line 83 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tmp             1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text887
	file	"sysinit.c"
	line	83
	global	__size_of_int_init
	__size_of_int_init	equ	__end_of_int_init-_int_init
	
_int_init:	
	opt	stack 5
; Regs used in _int_init: [wreg+status,2]
	line	88
	
l6532:	
;sysinit.c: 88: INTCON = 0B00000000;
	clrf	(11)	;volatile
	line	89
;sysinit.c: 89: PIE1 = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(140)^080h	;volatile
	line	90
;sysinit.c: 90: PIR1 = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(12)	;volatile
	line	92
	
l6534:	
;sysinit.c: 92: IOCA5 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1205/8)^080h,(1205)&7
	line	93
	
l6536:	
;sysinit.c: 93: tmp = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	94
	
l6538:	
;sysinit.c: 94: PAIF = 0;
	bcf	(88/8),(88)&7
	line	95
	
l6540:	
;sysinit.c: 95: PAIE = 0;
	bcf	(91/8),(91)&7
	line	98
	
l6542:	
;sysinit.c: 98: INTEDG = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1038/8)^080h,(1038)&7
	line	99
	
l6544:	
;sysinit.c: 99: INTF = 0;
	bcf	(89/8),(89)&7
	line	100
	
l6546:	
;sysinit.c: 100: INTE = 1;
	bsf	(92/8),(92)&7
	line	102
	
l6548:	
;sysinit.c: 102: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(97/8),(97)&7
	line	103
	
l6550:	
;sysinit.c: 103: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	104
	
l6552:	
;sysinit.c: 104: TMR2ON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	110
	
l6554:	
;sysinit.c: 110: T0IF = 0;
	bcf	(90/8),(90)&7
	line	111
	
l6556:	
;sysinit.c: 111: T0IE = 1;
	bsf	(93/8),(93)&7
	line	112
	
l6558:	
;sysinit.c: 112: T0ON = 1;
	bsf	(251/8),(251)&7
	line	114
	
l6560:	
;sysinit.c: 114: PEIE = 1;
	bsf	(94/8),(94)&7
	line	116
	
l6562:	
;sysinit.c: 116: GIE = 1;
	bsf	(95/8),(95)&7
	line	117
	
l1808:	
	return
	opt stack 0
GLOBAL	__end_of_int_init
	__end_of_int_init:
;; =============== function _int_init ends ============

	signat	_int_init,88
	global	_timer_init
psect	text888,local,class=CODE,delta=2
global __ptext888
__ptext888:

;; *************** function _timer_init *****************
;; Defined at:
;;		line 51 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text888
	file	"sysinit.c"
	line	51
	global	__size_of_timer_init
	__size_of_timer_init	equ	__end_of_timer_init-_timer_init
	
_timer_init:	
	opt	stack 5
; Regs used in _timer_init: [wreg+status,2]
	line	60
	
l6524:	
;sysinit.c: 60: T0CON0 = 0B00000000;
	clrf	(31)	;volatile
	line	61
	
l6526:	
;sysinit.c: 61: OPTION = 0B00000111;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(129)^080h	;volatile
	line	62
	
l6528:	
;sysinit.c: 62: TMR0 = 179;
	movlw	(0B3h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	64
;sysinit.c: 64: TMR2H = 0;
	clrf	(19)	;volatile
	line	65
;sysinit.c: 65: TMR2L = 0;
	clrf	(17)	;volatile
	line	66
;sysinit.c: 66: PR2H = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(146)^080h	;volatile
	line	67
;sysinit.c: 67: PR2L =0;
	clrf	(145)^080h	;volatile
	line	68
	
l6530:	
;sysinit.c: 68: T2CON0 = 0B00101001;
	movlw	(029h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	80
	
l1805:	
	return
	opt stack 0
GLOBAL	__end_of_timer_init
	__end_of_timer_init:
;; =============== function _timer_init ends ============

	signat	_timer_init,88
	global	_gpio_init
psect	text889,local,class=CODE,delta=2
global __ptext889
__ptext889:

;; *************** function _gpio_init *****************
;; Defined at:
;;		line 32 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 20/20
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text889
	file	"sysinit.c"
	line	32
	global	__size_of_gpio_init
	__size_of_gpio_init	equ	__end_of_gpio_init-_gpio_init
	
_gpio_init:	
	opt	stack 5
; Regs used in _gpio_init: [wreg+status,2]
	line	34
	
l6514:	
;sysinit.c: 34: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	35
	
l6516:	
;sysinit.c: 35: TRISA = 0B00110111;
	movlw	(037h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	36
	
l6518:	
;sysinit.c: 36: WPUA = 0B11000000;
	movlw	(0C0h)
	movwf	(149)^080h	;volatile
	line	38
;sysinit.c: 38: PORTC = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	39
	
l6520:	
;sysinit.c: 39: TRISC = 0B11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	40
	
l6522:	
;sysinit.c: 40: WPUC = 0B00000000;
	clrf	(147)^080h	;volatile
	line	42
;sysinit.c: 42: PSRCA = 0B11111111;
	movlw	(0FFh)
	movwf	(136)^080h	;volatile
	line	43
;sysinit.c: 43: PSRCC = 0B11111111;
	movlw	(0FFh)
	movwf	(148)^080h	;volatile
	line	44
;sysinit.c: 44: PSINKA = 0B11111111;
	movlw	(0FFh)
	movwf	(151)^080h	;volatile
	line	45
;sysinit.c: 45: PSINKC = 0B11111111;
	movlw	(0FFh)
	movwf	(159)^080h	;volatile
	line	47
;sysinit.c: 47: MSCON = 0B00110000;
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(27)	;volatile
	line	48
	
l1802:	
	return
	opt stack 0
GLOBAL	__end_of_gpio_init
	__end_of_gpio_init:
;; =============== function _gpio_init ends ============

	signat	_gpio_init,88
	global	_compe
psect	text890,local,class=CODE,delta=2
global __ptext890
__ptext890:

;; *************** function _compe *****************
;; Defined at:
;;		line 190 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  a               1    wreg     char 
;;  b               1    0[BANK0 ] char 
;;  dt              1    1[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  a               1    4[BANK0 ] char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       1       0
;;      Temps:          0       2       0
;;      Totals:         0       5       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text890
	file	"smartkey.C"
	line	190
	global	__size_of_compe
	__size_of_compe	equ	__end_of_compe-_compe
	
_compe:	
	opt	stack 5
; Regs used in _compe: [wreg]
;compe@a stored from wreg
	line	192
	movwf	(compe@a)
	
l6476:	
;smartkey.C: 192: if (a > b) {
	movf	(compe@b),w
	xorlw	80h
	movwf	(??_compe+0)+0
	movf	(compe@a),w
	xorlw	80h
	subwf	(??_compe+0)+0
	skipnc
	goto	u2641
	goto	u2640
u2641:
	goto	l6490
u2640:
	line	193
	
l6478:	
;smartkey.C: 193: if ((a - b) <= dt) return 1;
	movf	(compe@b),w
	subwf	(compe@a),w
	movwf	(??_compe+0)+0
	clrf	(??_compe+0)+0+1
	skipc
	decf	1+(??_compe+0)+0,f
	btfsc	(compe@a),7
	decf	((??_compe+0)+0)+1,f
	btfss	(compe@b),7
	goto	u2655o
	incf	((??_compe+0)+0)+1,f
	
u2655o:
	
	bcf	status, 5	;RP0=0, select bank0
	movf	1+(??_compe+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u2665
	movf	0+(??_compe+0)+0,w
	subwf	(compe@dt),w
u2665:

	skipc
	goto	u2661
	goto	u2660
u2661:
	goto	l6486
u2660:
	
l6480:	
	movlw	(01h)
	goto	l884
	line	194
	
l6486:	
;smartkey.C: 194: else return 0;
	movlw	(0)
	goto	l884
	line	196
	
l6490:	
;smartkey.C: 196: else if (a < b) {
	movf	(compe@a),w
	xorlw	80h
	movwf	(??_compe+0)+0
	movf	(compe@b),w
	xorlw	80h
	subwf	(??_compe+0)+0
	skipnc
	goto	u2671
	goto	u2670
u2671:
	goto	l6504
u2670:
	line	197
	
l6492:	
;smartkey.C: 197: if ((b - a) <= dt) return 1;
	movf	(compe@a),w
	subwf	(compe@b),w
	movwf	(??_compe+0)+0
	clrf	(??_compe+0)+0+1
	skipc
	decf	1+(??_compe+0)+0,f
	btfsc	(compe@b),7
	decf	((??_compe+0)+0)+1,f
	btfss	(compe@a),7
	goto	u2685o
	incf	((??_compe+0)+0)+1,f
	
u2685o:
	
	bcf	status, 5	;RP0=0, select bank0
	movf	1+(??_compe+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u2695
	movf	0+(??_compe+0)+0,w
	subwf	(compe@dt),w
u2695:

	skipc
	goto	u2691
	goto	u2690
u2691:
	goto	l6486
u2690:
	goto	l6480
	line	200
	
l6504:	
;smartkey.C: 200: else if (a == b) {
	movf	(compe@a),w
	xorwf	(compe@b),w
	skipz
	goto	u2701
	goto	u2700
u2701:
	goto	l6486
u2700:
	goto	l6480
	line	204
	
l884:	
	return
	opt stack 0
GLOBAL	__end_of_compe
	__end_of_compe:
;; =============== function _compe ends ============

	signat	_compe,12409
	global	_setState
psect	text891,local,class=CODE,delta=2
global __ptext891
__ptext891:

;; *************** function _setState *****************
;; Defined at:
;;		line 184 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  stt             1    wreg     unsigned char 
;;  _tOut           2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  stt             1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text891
	file	"smartkey.C"
	line	184
	global	__size_of_setState
	__size_of_setState	equ	__end_of_setState-_setState
	
_setState:	
	opt	stack 5
; Regs used in _setState: [wreg+status,2]
;setState@stt stored from wreg
	movwf	(setState@stt)
	line	185
	
l6470:	
;smartkey.C: 185: mtOldState = mtState;
	movf	(_mtState),w
	movwf	(_mtOldState)
	line	186
;smartkey.C: 186: mtState = stt;
	movf	(setState@stt),w
	movwf	(_mtState)
	line	187
	
l6472:	
;smartkey.C: 187: timeTick = 0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	188
	
l6474:	
;smartkey.C: 188: timeOut = _tOut;
	movf	(setState@_tOut+1),w
	movwf	(_timeOut+1)
	movf	(setState@_tOut),w
	movwf	(_timeOut)
	line	189
	
l879:	
	return
	opt stack 0
GLOBAL	__end_of_setState
	__end_of_setState:
;; =============== function _setState ends ============

	signat	_setState,8312
	global	_beepOn
psect	text892,local,class=CODE,delta=2
global __ptext892
__ptext892:

;; *************** function _beepOn *****************
;; Defined at:
;;		line 142 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 20/20
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text892
	file	"smartkey.C"
	line	142
	global	__size_of_beepOn
	__size_of_beepOn	equ	__end_of_beepOn-_beepOn
	
_beepOn:	
	opt	stack 5
; Regs used in _beepOn: []
	line	143
	
l6468:	
;smartkey.C: 143: TMR2ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(146/8),(146)&7
	line	144
;smartkey.C: 144: TRISA &= 0xf7;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(3/8),(3)&7	;volatile
	line	145
	
l858:	
	return
	opt stack 0
GLOBAL	__end_of_beepOn
	__end_of_beepOn:
;; =============== function _beepOn ends ============

	signat	_beepOn,88
	global	_beepOff
psect	text893,local,class=CODE,delta=2
global __ptext893
__ptext893:

;; *************** function _beepOff *****************
;; Defined at:
;;		line 139 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 20/20
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text893
	file	"smartkey.C"
	line	139
	global	__size_of_beepOff
	__size_of_beepOff	equ	__end_of_beepOff-_beepOff
	
_beepOff:	
	opt	stack 5
; Regs used in _beepOff: []
	line	140
	
l6466:	
;smartkey.C: 140: TMR2ON = 0; RA3 = 0; TRISA |= 0x08;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	bcf	(43/8),(43)&7
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(3/8),(3)&7	;volatile
	line	141
	
l855:	
	return
	opt stack 0
GLOBAL	__end_of_beepOff
	__end_of_beepOff:
;; =============== function _beepOff ends ============

	signat	_beepOff,88
	global	_delay_x10ms
psect	text894,local,class=CODE,delta=2
global __ptext894
__ptext894:

;; *************** function _delay_x10ms *****************
;; Defined at:
;;		line 134 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  t               2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  set             2    2[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_beep
;;		_main
;; This function uses a non-reentrant model
;;
psect	text894
	file	"smartkey.C"
	line	134
	global	__size_of_delay_x10ms
	__size_of_delay_x10ms	equ	__end_of_delay_x10ms-_delay_x10ms
	
_delay_x10ms:	
	opt	stack 5
; Regs used in _delay_x10ms: [wreg]
	line	135
	
l6462:	
;smartkey.C: 135: unsigned int set = t + timeTick;
	movf	(delay_x10ms@t+1),w
	movwf	(delay_x10ms@set+1)
	movf	(delay_x10ms@t),w
	movwf	(delay_x10ms@set)
	movf	(_timeTick),w
	addwf	(delay_x10ms@set),f
	skipnc
	incf	(delay_x10ms@set+1),f
	movf	(_timeTick+1),w
	addwf	(delay_x10ms@set+1),f
	line	136
;smartkey.C: 136: while (timeTick < set);
	
l6464:	
	movf	(delay_x10ms@set+1),w
	subwf	(_timeTick+1),w
	skipz
	goto	u2635
	movf	(delay_x10ms@set),w
	subwf	(_timeTick),w
u2635:
	skipc
	goto	u2631
	goto	u2630
u2631:
	goto	l6464
u2630:
	line	137
	
l852:	
	return
	opt stack 0
GLOBAL	__end_of_delay_x10ms
	__end_of_delay_x10ms:
;; =============== function _delay_x10ms ends ============

	signat	_delay_x10ms,4216
	global	_WRITE_EEPROM
psect	text895,local,class=CODE,delta=2
global __ptext895
__ptext895:

;; *************** function _WRITE_EEPROM *****************
;; Defined at:
;;		line 172 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  EEAddr          1    wreg     unsigned char 
;;  EEData          1    0[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  EEAddr          1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       1       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text895
	file	"smartkey.C"
	line	172
	global	__size_of_WRITE_EEPROM
	__size_of_WRITE_EEPROM	equ	__end_of_WRITE_EEPROM-_WRITE_EEPROM
	
_WRITE_EEPROM:	
	opt	stack 5
; Regs used in _WRITE_EEPROM: [wreg]
;WRITE_EEPROM@EEAddr stored from wreg
	movwf	(WRITE_EEPROM@EEAddr)
	line	173
	
l6454:	
;smartkey.C: 173: GIE = 0;
	bcf	(95/8),(95)&7
	line	174
;smartkey.C: 174: while (GIE) asm("clrwdt");
	goto	l870
	
l871:	
# 174 "smartkey.C"
clrwdt ;#
psect	text895
	
l870:	
	btfsc	(95/8),(95)&7
	goto	u2611
	goto	u2610
u2611:
	goto	l871
u2610:
	line	175
	
l6456:	
;smartkey.C: 175: EEADR = EEAddr;
	bcf	status, 5	;RP0=0, select bank0
	movf	(WRITE_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	176
;smartkey.C: 176: EEDAT = EEData;
	bcf	status, 5	;RP0=0, select bank0
	movf	(WRITE_EEPROM@EEData),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(154)^080h	;volatile
	line	177
	
l6458:	
;smartkey.C: 177: EEIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(103/8),(103)&7
	line	178
;smartkey.C: 178: EECON1 = 0x34;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(156)^080h	;volatile
	line	179
	
l6460:	
;smartkey.C: 179: WR = 1;
	bsf	(1256/8)^080h,(1256)&7
	line	180
;smartkey.C: 180: while (WR) asm("clrwdt");
	goto	l873
	
l874:	
# 180 "smartkey.C"
clrwdt ;#
psect	text895
	
l873:	
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1256/8)^080h,(1256)&7
	goto	u2621
	goto	u2620
u2621:
	goto	l874
u2620:
	
l875:	
	line	181
;smartkey.C: 181: GIE = 1;
	bsf	(95/8),(95)&7
	line	182
	
l876:	
	return
	opt stack 0
GLOBAL	__end_of_WRITE_EEPROM
	__end_of_WRITE_EEPROM:
;; =============== function _WRITE_EEPROM ends ============

	signat	_WRITE_EEPROM,8312
	global	_READ_EEPROM
psect	text896,local,class=CODE,delta=2
global __ptext896
__ptext896:

;; *************** function _READ_EEPROM *****************
;; Defined at:
;;		line 162 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  EEAddr          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  EEAddr          1    0[BANK0 ] unsigned char 
;;  ReEepromData    1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text896
	file	"smartkey.C"
	line	162
	global	__size_of_READ_EEPROM
	__size_of_READ_EEPROM	equ	__end_of_READ_EEPROM-_READ_EEPROM
	
_READ_EEPROM:	
	opt	stack 5
; Regs used in _READ_EEPROM: [wreg]
;READ_EEPROM@EEAddr stored from wreg
	line	164
	bcf	status, 5	;RP0=0, select bank0
	movwf	(READ_EEPROM@EEAddr)
	
l6446:	
;smartkey.C: 163: unsigned char ReEepromData;
;smartkey.C: 164: EEADR = EEAddr;
	movf	(READ_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	165
	
l6448:	
;smartkey.C: 165: RD = 1;
	bsf	(1248/8)^080h,(1248)&7
	line	166
;smartkey.C: 166: ReEepromData = EEDAT;
	movf	(154)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	(READ_EEPROM@ReEepromData)
	line	167
	
l6450:	
;smartkey.C: 167: RD = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1248/8)^080h,(1248)&7
	line	168
;smartkey.C: 168: return ReEepromData;
	bcf	status, 5	;RP0=0, select bank0
	movf	(READ_EEPROM@ReEepromData),w
	line	169
	
l867:	
	return
	opt stack 0
GLOBAL	__end_of_READ_EEPROM
	__end_of_READ_EEPROM:
;; =============== function _READ_EEPROM ends ============

	signat	_READ_EEPROM,4217
	global	_ISR
psect	text897,local,class=CODE,delta=2
global __ptext897
__ptext897:

;; *************** function _ISR *****************
;; Defined at:
;;		line 46 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tmp             1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          2       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1_READ_EEPROM
;;		i1_WRITE_EEPROM
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text897
	file	"smartkey.C"
	line	46
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 4
; Regs used in _ISR: [wreg+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text897
	line	47
	
i1l5474:	
	line	50
	
i1l5476:	
;smartkey.C: 50: if (PAIE && PAIF) {
	btfss	(91/8),(91)&7
	goto	u132_21
	goto	u132_20
u132_21:
	goto	i1l5494
u132_20:
	
i1l5478:	
	btfss	(88/8),(88)&7
	goto	u133_21
	goto	u133_20
u133_21:
	goto	i1l5494
u133_20:
	line	51
	
i1l5480:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	52
	
i1l5482:	
;smartkey.C: 52: PAIF = 0;
	bcf	(88/8),(88)&7
	line	54
	
i1l5484:	
;smartkey.C: 54: if (RA5) {
	btfss	(45/8),(45)&7
	goto	u134_21
	goto	u134_20
u134_21:
	goto	i1l5492
u134_20:
	line	55
	
i1l5486:	
;smartkey.C: 55: if (RegStatus.bits.b3 == 0) {
	btfsc	(_RegStatus),3	;volatile
	goto	u135_21
	goto	u135_20
u135_21:
	goto	i1l5494
u135_20:
	line	56
	
i1l5488:	
;smartkey.C: 56: cntCyc = 0;
	clrf	(_cntCyc)
	line	57
;smartkey.C: 57: cntOff = 0;
	clrf	(_cntOff)
	line	59
	
i1l5490:	
;smartkey.C: 59: RegStatus.bits.b3 = 1;
	bsf	(_RegStatus),3	;volatile
	goto	i1l5494
	line	63
	
i1l5492:	
;smartkey.C: 62: else {
;smartkey.C: 63: cntOff = 0;
	clrf	(_cntOff)
	line	67
	
i1l5494:	
;smartkey.C: 64: }
;smartkey.C: 65: }
;smartkey.C: 67: if (INTE && INTF) {
	btfss	(92/8),(92)&7
	goto	u136_21
	goto	u136_20
u136_21:
	goto	i1l825
u136_20:
	
i1l5496:	
	btfss	(89/8),(89)&7
	goto	u137_21
	goto	u137_20
u137_21:
	goto	i1l825
u137_20:
	line	68
	
i1l5498:	
;smartkey.C: 68: INTF = 0;
	bcf	(89/8),(89)&7
	line	69
;smartkey.C: 69: if ( RA2 == 0) {
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(42/8),(42)&7
	goto	u138_21
	goto	u138_20
u138_21:
	goto	i1l825
u138_20:
	line	70
	
i1l5500:	
;smartkey.C: 70: if (timeTick < 32) {
	movlw	high(020h)
	subwf	(_timeTick+1),w
	movlw	low(020h)
	skipnz
	subwf	(_timeTick),w
	skipnc
	goto	u139_21
	goto	u139_20
u139_21:
	goto	i1l827
u139_20:
	line	71
	
i1l5502:	
;smartkey.C: 71: tmp = READ_EEPROM(0x3F);
	movlw	(03Fh)
	fcall	i1_READ_EEPROM
	movwf	(ISR@tmp)
	line	72
	
i1l5504:	
;smartkey.C: 72: WRITE_EEPROM(0x3F, tmp + 1);
	incf	(ISR@tmp),w
	movwf	(?i1_WRITE_EEPROM)
	movlw	(03Fh)
	fcall	i1_WRITE_EEPROM
	line	73
	
i1l827:	
	goto	i1l827
	line	76
	
i1l825:	
	line	79
;smartkey.C: 75: }
;smartkey.C: 76: }
;smartkey.C: 79: if (T0IE && T0IF) {
	btfss	(93/8),(93)&7
	goto	u140_21
	goto	u140_20
u140_21:
	goto	i1l5554
u140_20:
	
i1l5506:	
	btfss	(90/8),(90)&7
	goto	u141_21
	goto	u141_20
u141_21:
	goto	i1l5554
u141_20:
	line	80
	
i1l5508:	
;smartkey.C: 80: T0IF = 0;
	bcf	(90/8),(90)&7
	line	81
	
i1l5510:	
;smartkey.C: 81: TMR0 = 179;
	movlw	(0B3h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	87
	
i1l5512:	
;smartkey.C: 87: if ( RegStatus.bits.b3 == 1) {
	btfss	(_RegStatus),3	;volatile
	goto	u142_21
	goto	u142_20
u142_21:
	goto	i1l5534
u142_20:
	line	89
	
i1l5514:	
;smartkey.C: 89: cntCyc++;
	incf	(_cntCyc),f
	line	90
	
i1l5516:	
;smartkey.C: 90: if (RA5 == 0) {
	btfsc	(45/8),(45)&7
	goto	u143_21
	goto	u143_20
u143_21:
	goto	i1l5534
u143_20:
	line	92
	
i1l5518:	
;smartkey.C: 92: cntOff++;
	incf	(_cntOff),f
	line	94
	
i1l5520:	
;smartkey.C: 94: if (cntOff > 15) {
	movlw	(010h)
	subwf	(_cntOff),w
	skipc
	goto	u144_21
	goto	u144_20
u144_21:
	goto	i1l5534
u144_20:
	line	96
	
i1l5522:	
;smartkey.C: 96: RegStatus.bits.b3 = 0;
	bcf	(_RegStatus),3	;volatile
	line	98
	
i1l5524:	
;smartkey.C: 98: if ((cntCyc > 15) && (cntCyc < 50)) {
	movlw	(010h)
	subwf	(_cntCyc),w
	skipc
	goto	u145_21
	goto	u145_20
u145_21:
	goto	i1l5530
u145_20:
	
i1l5526:	
	movlw	(032h)
	subwf	(_cntCyc),w
	skipnc
	goto	u146_21
	goto	u146_20
u146_21:
	goto	i1l5530
u146_20:
	line	99
	
i1l5528:	
;smartkey.C: 99: RegStatus.bits.b2 =1;
	bsf	(_RegStatus),2	;volatile
	line	100
;smartkey.C: 100: } else if (cntCyc >= 50) {
	goto	i1l836
	
i1l5530:	
	movlw	(032h)
	subwf	(_cntCyc),w
	skipc
	goto	u147_21
	goto	u147_20
u147_21:
	goto	i1l836
u147_20:
	line	101
	
i1l5532:	
;smartkey.C: 101: RegStatus.bits.b2 =0;
	bcf	(_RegStatus),2	;volatile
	line	103
	
i1l836:	
;smartkey.C: 102: }
;smartkey.C: 103: RegStatus.bits.b1 = 1;
	bsf	(_RegStatus),1	;volatile
	line	108
	
i1l5534:	
;smartkey.C: 104: }
;smartkey.C: 105: }
;smartkey.C: 106: }
;smartkey.C: 108: timeTick++;
	incf	(_timeTick),f
	skipnz
	incf	(_timeTick+1),f
	line	110
	
i1l5536:	
;smartkey.C: 110: if ((mtState == 4) || (mtState == 3)) {
	movf	(_mtState),w
	xorlw	04h
	skipnz
	goto	u148_21
	goto	u148_20
u148_21:
	goto	i1l5540
u148_20:
	
i1l5538:	
	movf	(_mtState),w
	xorlw	03h
	skipz
	goto	u149_21
	goto	u149_20
u149_21:
	goto	i1l5554
u149_20:
	line	111
	
i1l5540:	
;smartkey.C: 111: if (timeTick > cntTmp) {
	movf	(_timeTick+1),w
	subwf	(_cntTmp+1),w
	skipz
	goto	u150_25
	movf	(_timeTick),w
	subwf	(_cntTmp),w
u150_25:
	skipnc
	goto	u150_21
	goto	u150_20
u150_21:
	goto	i1l5554
u150_20:
	line	112
	
i1l5542:	
;smartkey.C: 112: cntTmp = timeTick + 38;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	movlw	026h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	113
;smartkey.C: 113: if (cntTmp <= timeOut)
	movf	(_cntTmp+1),w
	subwf	(_timeOut+1),w
	skipz
	goto	u151_25
	movf	(_cntTmp),w
	subwf	(_timeOut),w
u151_25:
	skipc
	goto	u151_21
	goto	u151_20
u151_21:
	goto	i1l838
u151_20:
	line	115
	
i1l5544:	
;smartkey.C: 114: {
;smartkey.C: 115: TMR2IE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1121/8)^080h,(1121)&7
	line	116
	
i1l5546:	
;smartkey.C: 116: if (PR2L == 20)
	movf	(145)^080h,w	;volatile
	xorlw	014h
	skipz
	goto	u152_21
	goto	u152_20
u152_21:
	goto	i1l5550
u152_20:
	line	117
	
i1l5548:	
;smartkey.C: 117: PR2L = 25;
	movlw	(019h)
	movwf	(145)^080h	;volatile
	goto	i1l5552
	line	119
	
i1l5550:	
;smartkey.C: 118: else
;smartkey.C: 119: PR2L = 20;
	movlw	(014h)
	movwf	(145)^080h	;volatile
	line	120
	
i1l5552:	
;smartkey.C: 120: TMR2IE = 1;
	bsf	(1121/8)^080h,(1121)&7
	goto	i1l5554
	line	123
	
i1l838:	
	line	127
	
i1l5554:	
;smartkey.C: 121: }
;smartkey.C: 122: }
;smartkey.C: 123: }
;smartkey.C: 124: }
;smartkey.C: 127: if (TMR2IE && TMR2IF)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1121/8)^080h,(1121)&7
	goto	u153_21
	goto	u153_20
u153_21:
	goto	i1l846
u153_20:
	
i1l5556:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u154_21
	goto	u154_20
u154_21:
	goto	i1l846
u154_20:
	line	129
	
i1l5558:	
;smartkey.C: 128: {
;smartkey.C: 129: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	130
	
i1l5560:	
;smartkey.C: 130: RA3 = ~ RA3;
	movlw	1<<((43)&7)
	xorwf	((43)/8),f
	line	132
	
i1l846:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
	global	i1_WRITE_EEPROM
psect	text898,local,class=CODE,delta=2
global __ptext898
__ptext898:

;; *************** function i1_WRITE_EEPROM *****************
;; Defined at:
;;		line 172 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  WRITE_EEPROM    1    wreg     unsigned char 
;;  WRITE_EEPROM    1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  WRITE_EEPROM    1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 20/20
;;		On exit  : 20/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text898
	file	"smartkey.C"
	line	172
	global	__size_ofi1_WRITE_EEPROM
	__size_ofi1_WRITE_EEPROM	equ	__end_ofi1_WRITE_EEPROM-i1_WRITE_EEPROM
	
i1_WRITE_EEPROM:	
	opt	stack 4
; Regs used in i1_WRITE_EEPROM: [wreg]
;i1WRITE_EEPROM@EEAddr stored from wreg
	movwf	(i1WRITE_EEPROM@EEAddr)
	line	173
	
i1l5732:	
;smartkey.C: 173: GIE = 0;
	bcf	(95/8),(95)&7
	line	174
;smartkey.C: 174: while (GIE) asm("clrwdt");
	goto	i1l870
	
i1l871:	
# 174 "smartkey.C"
clrwdt ;#
psect	text898
	
i1l870:	
	btfsc	(95/8),(95)&7
	goto	u172_21
	goto	u172_20
u172_21:
	goto	i1l871
u172_20:
	line	175
	
i1l5734:	
;smartkey.C: 175: EEADR = EEAddr;
	movf	(i1WRITE_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	176
;smartkey.C: 176: EEDAT = EEData;
	movf	(i1WRITE_EEPROM@EEData),w
	movwf	(154)^080h	;volatile
	line	177
	
i1l5736:	
;smartkey.C: 177: EEIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(103/8),(103)&7
	line	178
;smartkey.C: 178: EECON1 = 0x34;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(156)^080h	;volatile
	line	179
	
i1l5738:	
;smartkey.C: 179: WR = 1;
	bsf	(1256/8)^080h,(1256)&7
	line	180
;smartkey.C: 180: while (WR) asm("clrwdt");
	goto	i1l873
	
i1l874:	
# 180 "smartkey.C"
clrwdt ;#
psect	text898
	
i1l873:	
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1256/8)^080h,(1256)&7
	goto	u173_21
	goto	u173_20
u173_21:
	goto	i1l874
u173_20:
	
i1l875:	
	line	181
;smartkey.C: 181: GIE = 1;
	bsf	(95/8),(95)&7
	line	182
	
i1l876:	
	return
	opt stack 0
GLOBAL	__end_ofi1_WRITE_EEPROM
	__end_ofi1_WRITE_EEPROM:
;; =============== function i1_WRITE_EEPROM ends ============

	signat	i1_WRITE_EEPROM,88
	global	i1_READ_EEPROM
psect	text899,local,class=CODE,delta=2
global __ptext899
__ptext899:

;; *************** function i1_READ_EEPROM *****************
;; Defined at:
;;		line 162 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  READ_EEPROM     1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  READ_EEPROM     1    0[COMMON] unsigned char 
;;  READ_EEPROM     1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/20
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text899
	file	"smartkey.C"
	line	162
	global	__size_ofi1_READ_EEPROM
	__size_ofi1_READ_EEPROM	equ	__end_ofi1_READ_EEPROM-i1_READ_EEPROM
	
i1_READ_EEPROM:	
	opt	stack 4
; Regs used in i1_READ_EEPROM: [wreg]
;i1READ_EEPROM@EEAddr stored from wreg
	line	164
	movwf	(i1READ_EEPROM@EEAddr)
	
i1l5724:	
;smartkey.C: 163: unsigned char ReEepromData;
;smartkey.C: 164: EEADR = EEAddr;
	movf	(i1READ_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	165
	
i1l5726:	
;smartkey.C: 165: RD = 1;
	bsf	(1248/8)^080h,(1248)&7
	line	166
;smartkey.C: 166: ReEepromData = EEDAT;
	movf	(154)^080h,w	;volatile
	movwf	(i1READ_EEPROM@ReEepromData)
	line	167
	
i1l5728:	
;smartkey.C: 167: RD = 0;
	bcf	(1248/8)^080h,(1248)&7
	line	168
;smartkey.C: 168: return ReEepromData;
	movf	(i1READ_EEPROM@ReEepromData),w
	line	169
	
i1l867:	
	return
	opt stack 0
GLOBAL	__end_ofi1_READ_EEPROM
	__end_ofi1_READ_EEPROM:
;; =============== function i1_READ_EEPROM ends ============

	signat	i1_READ_EEPROM,89
psect	text900,local,class=CODE,delta=2
global __ptext900
__ptext900:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end

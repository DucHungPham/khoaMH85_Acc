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
	FNCALL	_main,_beep
	FNCALL	_main,_AccWrite
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
	global	_RegStatus
	global	_cntOff
	global	_lostDetect
	global	_mtOldState
	global	_timeTick
	global	_cntCyc
	global	_mode_chek
	global	_mtState
	global	_ANSEL
psect	text859,local,class=CODE,delta=2
global __ptext859
__ptext859:
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

_cntCyc:
       ds      1

_mode_chek:
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

_RegStatus:
       ds      1

_cntOff:
       ds      1

_lostDetect:
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
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
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
	global	ISR@tmp_1138
ISR@tmp_1138:	; 1 bytes @ 0x4
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
AccWrite@dat:	; 2 bytes @ 0x3
	ds	1
	global	?_beep
?_beep:	; 0 bytes @ 0x4
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	?_AccRead
?_AccRead:	; 1 bytes @ 0x4
	global	beep@rep
beep@rep:	; 1 bytes @ 0x4
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x4
	global	AccRead@dat
AccRead@dat:	; 2 bytes @ 0x4
	ds	1
	global	??_beep
??_beep:	; 0 bytes @ 0x5
	global	beep@delay
beep@delay:	; 1 bytes @ 0x5
	global	AccWrite@len
AccWrite@len:	; 1 bytes @ 0x5
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x5
	ds	1
	global	??_AccWrite
??_AccWrite:	; 0 bytes @ 0x6
	global	AccRead@len
AccRead@len:	; 1 bytes @ 0x6
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x6
	ds	1
	global	??_AccRead
??_AccRead:	; 0 bytes @ 0x7
	global	compe@a
compe@a:	; 1 bytes @ 0x7
	ds	1
	global	AccWrite@rAdd
AccWrite@rAdd:	; 1 bytes @ 0x8
	ds	1
	global	AccWrite@i
AccWrite@i:	; 1 bytes @ 0x9
	ds	1
	global	AccRead@rAdd
AccRead@rAdd:	; 1 bytes @ 0xA
	ds	1
	global	AccRead@i
AccRead@i:	; 1 bytes @ 0xB
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xC
	ds	3
	global	main@isWait
main@isWait:	; 2 bytes @ 0xF
	ds	2
	global	main@isFall
main@isFall:	; 1 bytes @ 0x11
	ds	1
	global	main@vibrateOn
main@vibrateOn:	; 1 bytes @ 0x12
	ds	1
	global	main@antenSkip
main@antenSkip:	; 1 bytes @ 0x13
	ds	1
	global	main@acYOld
main@acYOld:	; 1 bytes @ 0x14
	ds	1
	global	main@acXOld
main@acXOld:	; 1 bytes @ 0x15
	ds	1
	global	main@accEna
main@accEna:	; 1 bytes @ 0x16
	ds	1
	global	main@acYsum
main@acYsum:	; 2 bytes @ 0x17
	ds	2
	global	main@acXsum
main@acXsum:	; 2 bytes @ 0x19
	ds	2
	global	main@buf
main@buf:	; 6 bytes @ 0x1B
	ds	6
	global	main@reAlertOn
main@reAlertOn:	; 1 bytes @ 0x21
	ds	1
	global	main@isSw
main@isSw:	; 1 bytes @ 0x22
	ds	1
	global	main@tmp16
main@tmp16:	; 2 bytes @ 0x23
	ds	2
	global	main@tmp8
main@tmp8:	; 1 bytes @ 0x25
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 13, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5      10
;; BANK0           80     38      46
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; ?___awdiv	int  size(1) Largest target is 0
;;
;; AccRead@dat	PTR unsigned char  size(2) Largest target is 256
;;		 -> RAM(DATA[256]), main@buf(BANK0[6]), 
;;
;; AccWrite@dat	PTR unsigned char  size(2) Largest target is 256
;;		 -> RAM(DATA[256]), 
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
;; (0) _main                                                27    27      0    4339
;;                                             12 BANK0     26    26      0
;;                           _sys_init
;;                          _gpio_init
;;                         _timer_init
;;                           _int_init
;;                         _swI2C_Init
;;                           _setState
;;                       _WRITE_EEPROM
;;                        _READ_EEPROM
;;                             _beepOn
;;                               _beep
;;                           _AccWrite
;;                            _AccRead
;;                            ___awdiv
;;                            _beepOff
;;                        _delay_x10ms
;;                              _compe
;; ---------------------------------------------------------------------------------
;; (1) _AccRead                                              8     5      3     532
;;                                              4 BANK0      8     5      3
;;                        _swI2C_Start
;;                    _swI2C_WriteByte
;;                     _swI2C_ReadByte
;;                         _swI2C_Stop
;; ---------------------------------------------------------------------------------
;; (1) _AccWrite                                             7     4      3     300
;;                                              3 BANK0      7     4      3
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
;; (1) _compe                                                8     6      2     372
;;                                              0 BANK0      8     6      2
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
;; (3) _ISR                                                  4     4      0     317
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
;;   _beep
;;     _delay_x10ms
;;   _AccWrite
;;     _swI2C_Start
;;     _swI2C_WriteByte
;;     _swI2C_Stop
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
;;BANK0               50     26      2E       4       57.5%
;;BANK1               20      0       0       5        0.0%
;;ABS                  0      0      38       6        0.0%
;;BITBANK1            20      0       0       7        0.0%
;;DATA                 0      0      3E       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 224 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf             6   27[BANK0 ] char [6]
;;  tmp16           2   35[BANK0 ] unsigned int 
;;  acXsum          2   25[BANK0 ] int 
;;  acYsum          2   23[BANK0 ] int 
;;  isWait          2   15[BANK0 ] unsigned int 
;;  tmp8            1   37[BANK0 ] unsigned char 
;;  isSw            1   34[BANK0 ] unsigned char 
;;  reAlertOn       1   33[BANK0 ] unsigned char 
;;  accEna          1   22[BANK0 ] unsigned char 
;;  acXOld          1   21[BANK0 ] char 
;;  acYOld          1   20[BANK0 ] char 
;;  antenSkip       1   19[BANK0 ] unsigned char 
;;  vibrateOn       1   18[BANK0 ] unsigned char 
;;  isFall          1   17[BANK0 ] unsigned char 
;;  accSet          1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 20/20
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0      23       0
;;      Temps:          0       3       0
;;      Totals:         0      26       0
;;Total ram usage:       26 bytes
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
;;		_beep
;;		_AccWrite
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
	line	224
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	232
	
l6844:	
;smartkey.C: 232: unsigned char reAlertOn=0,tmp8,isSw=0,isFall=0,accEna=1,vibrateOn=0,accSet=0,antenSkip=0;
	clrf	(main@reAlertOn)
	clrf	(main@isSw)
	clrf	(main@isFall)
	
l6846:	
	clrf	(main@accEna)
	incf	(main@accEna),f
	clrf	(main@vibrateOn)
	clrf	(main@antenSkip)
	line	233
;smartkey.C: 233: unsigned int isWait =0;
	clrf	(main@isWait)
	clrf	(main@isWait+1)
	line	234
;smartkey.C: 234: signed int acYsum=0,acXsum=0;
	clrf	(main@acYsum)
	clrf	(main@acYsum+1)
	clrf	(main@acXsum)
	clrf	(main@acXsum+1)
	line	235
;smartkey.C: 235: unsigned int tmp16=0;
	clrf	(main@tmp16)
	clrf	(main@tmp16+1)
	line	239
	
l6848:	
# 239 "smartkey.C"
clrwdt ;#
psect	maintext
	line	241
	
l6850:	
;smartkey.C: 241: sys_init();
	fcall	_sys_init
	line	242
	
l6852:	
;smartkey.C: 242: gpio_init();
	fcall	_gpio_init
	line	243
	
l6854:	
;smartkey.C: 243: timer_init();
	fcall	_timer_init
	line	244
	
l6856:	
;smartkey.C: 244: int_init();
	fcall	_int_init
	line	247
	
l6858:	
;smartkey.C: 247: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3837:
	decfsz	((??_main+0)+0),f
	goto	u3837
	decfsz	((??_main+0)+0+1),f
	goto	u3837
	nop2
opt asmopt_on

	line	251
	
l6860:	
;smartkey.C: 251: PAIE = 1;
	bsf	(91/8),(91)&7
	line	253
	
l6862:	
;smartkey.C: 253: RegStatus = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_RegStatus)
	line	255
	
l6864:	
;smartkey.C: 255: swI2C_Init();
	fcall	_swI2C_Init
	line	258
	
l6866:	
;smartkey.C: 258: setState(0,0);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	260
	
l6868:	
;smartkey.C: 260: WRITE_EEPROM(0xFF,0xAA);
	movlw	(0AAh)
	movwf	(?_WRITE_EEPROM)
	movlw	(0FFh)
	fcall	_WRITE_EEPROM
	line	261
	
l6870:	
;smartkey.C: 261: WRITE_EEPROM(0xFF,0xAA);
	movlw	(0AAh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_WRITE_EEPROM)
	movlw	(0FFh)
	fcall	_WRITE_EEPROM
	line	264
;smartkey.C: 264: _delay((unsigned long)((200)*(4000000/4000.0)));
	opt asmopt_off
movlw  2
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	4
movwf	((??_main+0)+0+1),f
	movlw	186
movwf	((??_main+0)+0),f
u3847:
	decfsz	((??_main+0)+0),f
	goto	u3847
	decfsz	((??_main+0)+0+1),f
	goto	u3847
	decfsz	((??_main+0)+0+2),f
	goto	u3847
	clrwdt
opt asmopt_on

	line	267
	
l6872:	
;smartkey.C: 267: tmp8 = READ_EEPROM(0x08);
	movlw	(08h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	268
	
l6874:	
;smartkey.C: 268: if(tmp8==0xff) {WRITE_EEPROM(0x08,0);_delay((unsigned long)((2)*(4000000/4000.0)));}
	movf	(main@tmp8),w
	xorlw	0FFh
	skipz
	goto	u3061
	goto	u3060
u3061:
	goto	l6880
u3060:
	
l6876:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	
l6878:	
	opt asmopt_off
movlw	3
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u3857:
	decfsz	((??_main+0)+0),f
	goto	u3857
	decfsz	((??_main+0)+0+1),f
	goto	u3857
	nop2
opt asmopt_on

	line	269
	
l6880:	
;smartkey.C: 269: if(tmp8==0xcc){
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@tmp8),w
	xorlw	0CCh
	skipz
	goto	u3071
	goto	u3070
u3071:
	goto	l6894
u3070:
	line	270
	
l6882:	
;smartkey.C: 270: RegStatus &=~(0x20);
	bcf	(_RegStatus)+(5/8),(5)&7
	line	271
	
l6884:	
;smartkey.C: 271: setState(3,1800);
	movlw	low(0708h)
	movwf	(?_setState)
	movlw	high(0708h)
	movwf	((?_setState))+1
	movlw	(03h)
	fcall	_setState
	line	272
	
l6886:	
;smartkey.C: 272: mtOldState = 1;
	clrf	(_mtOldState)
	incf	(_mtOldState),f
	line	273
	
l6888:	
;smartkey.C: 273: cntTmp = timeTick+50;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l6890:	
	movlw	032h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	274
	
l6892:	
;smartkey.C: 274: PR2L =12;
	movlw	(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	275
;smartkey.C: 275: beepOn();
	fcall	_beepOn
	line	276
;smartkey.C: 276: } else {
	goto	l6898
	line	277
	
l6894:	
;smartkey.C: 277: setState(2,400);
	movlw	low(0190h)
	movwf	(?_setState)
	movlw	high(0190h)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	278
	
l6896:	
;smartkey.C: 278: mtOldState = 0;
	clrf	(_mtOldState)
	line	281
	
l6898:	
;smartkey.C: 279: }
;smartkey.C: 281: tmp8 = READ_EEPROM(0x3F);
	movlw	(03Fh)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	282
	
l6900:	
;smartkey.C: 282: if(tmp8==6){
	movf	(main@tmp8),w
	xorlw	06h
	skipz
	goto	u3081
	goto	u3080
u3081:
	goto	l6918
u3080:
	line	283
	
l6902:	
;smartkey.C: 283: tmp8 = READ_EEPROM(0x40);
	movlw	(040h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	284
	
l6904:	
;smartkey.C: 284: WRITE_EEPROM(0x3F,0);
	clrf	(?_WRITE_EEPROM)
	movlw	(03Fh)
	fcall	_WRITE_EEPROM
	line	285
;smartkey.C: 285: while( RA2){
	goto	l6914
	line	286
	
l6906:	
;smartkey.C: 286: _delay((unsigned long)((1000)*(4000000/4000.0)));
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	19
movwf	((??_main+0)+0+1),f
	movlw	177
movwf	((??_main+0)+0),f
u3867:
	decfsz	((??_main+0)+0),f
	goto	u3867
	decfsz	((??_main+0)+0+1),f
	goto	u3867
	decfsz	((??_main+0)+0+2),f
	goto	u3867
	nop2
opt asmopt_on

	line	287
	
l6908:	
;smartkey.C: 287: tmp8++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@tmp8),f
	line	288
	
l6910:	
;smartkey.C: 288: if( RA2){
	btfss	(42/8),(42)&7
	goto	u3091
	goto	u3090
u3091:
	goto	l6914
u3090:
	line	289
	
l6912:	
;smartkey.C: 289: WRITE_EEPROM(0x40,tmp8);
	movf	(main@tmp8),w
	movwf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	line	290
;smartkey.C: 290: beep(10,1);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	285
	
l6914:	
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(42/8),(42)&7
	goto	u3101
	goto	u3100
u3101:
	goto	l6906
u3100:
	line	293
	
l6916:	
;smartkey.C: 291: }
;smartkey.C: 292: }
;smartkey.C: 293: _delay((unsigned long)((1000)*(4000000/4000.0)));
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	19
movwf	((??_main+0)+0+1),f
	movlw	177
movwf	((??_main+0)+0),f
u3877:
	decfsz	((??_main+0)+0),f
	goto	u3877
	decfsz	((??_main+0)+0+1),f
	goto	u3877
	decfsz	((??_main+0)+0+2),f
	goto	u3877
	nop2
opt asmopt_on

	line	296
	
l6918:	
;smartkey.C: 294: }
;smartkey.C: 296: tmp8 = READ_EEPROM(0x40);
	movlw	(040h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	298
	
l6920:	
;smartkey.C: 298: if(tmp8==8){
	movf	(main@tmp8),w
	xorlw	08h
	skipz
	goto	u3111
	goto	u3110
u3111:
	goto	l6938
u3110:
	line	299
	
l6922:	
;smartkey.C: 299: tmp8= READ_EEPROM(0x41);
	movlw	(041h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	300
	
l6924:	
;smartkey.C: 300: beep(50,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(032h)
	fcall	_beep
	line	301
	
l6926:	
;smartkey.C: 301: if((tmp8==1)||(tmp8==0xff))
	decf	(main@tmp8),w
	skipnz
	goto	u3121
	goto	u3120
u3121:
	goto	l6930
u3120:
	
l6928:	
	movf	(main@tmp8),w
	xorlw	0FFh
	skipz
	goto	u3131
	goto	u3130
u3131:
	goto	l6932
u3130:
	line	302
	
l6930:	
;smartkey.C: 302: WRITE_EEPROM(0x41,0);
	clrf	(?_WRITE_EEPROM)
	movlw	(041h)
	fcall	_WRITE_EEPROM
	goto	l910
	line	304
	
l6932:	
;smartkey.C: 303: else
;smartkey.C: 304: WRITE_EEPROM(0x41,0x1);
	clrf	(?_WRITE_EEPROM)
	incf	(?_WRITE_EEPROM),f
	movlw	(041h)
	fcall	_WRITE_EEPROM
	
l910:	
	line	305
;smartkey.C: 305: WRITE_EEPROM(0x40,0);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	line	306
	
l6934:	
	line	307
	
l6936:	
;smartkey.C: 307: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3887:
	decfsz	((??_main+0)+0),f
	goto	u3887
	decfsz	((??_main+0)+0+1),f
	goto	u3887
	nop2
opt asmopt_on

	line	308
;smartkey.C: 308: } else if(tmp8==0xff) WRITE_EEPROM(0x40,0);
	goto	l6942
	
l6938:	
	movf	(main@tmp8),w
	xorlw	0FFh
	skipz
	goto	u3141
	goto	u3140
u3141:
	goto	l6942
u3140:
	
l6940:	
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	line	311
	
l6942:	
;smartkey.C: 311: tmp8 = READ_EEPROM(0x41);
	movlw	(041h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	312
	
l6944:	
;smartkey.C: 312: if(tmp8==1){
	decf	(main@tmp8),w
	skipz
	goto	u3151
	goto	u3150
u3151:
	goto	l6956
u3150:
	line	313
	
l6946:	
;smartkey.C: 313: RegStatus |=(0x20);
	bsf	(_RegStatus)+(5/8),(5)&7
	line	314
	
l6948:	
;smartkey.C: 314: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	315
	
l6950:	
;smartkey.C: 315: mtOldState = 2;
	movlw	(02h)
	movwf	(_mtOldState)
	line	317
	
l6952:	
;smartkey.C: 317: accEna =0;antenSkip =1;
	clrf	(main@accEna)
	
l6954:	
	clrf	(main@antenSkip)
	incf	(main@antenSkip),f
	line	322
	
l6956:	
;smartkey.C: 319: }
;smartkey.C: 322: tmp8 = READ_EEPROM(0x40);
	movlw	(040h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	324
	
l6958:	
;smartkey.C: 324: if(tmp8==5){
	movf	(main@tmp8),w
	xorlw	05h
	skipz
	goto	u3161
	goto	u3160
u3161:
	goto	l6980
u3160:
	line	325
	
l6960:	
;smartkey.C: 325: tmp8= READ_EEPROM(0x42);
	movlw	(042h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	326
	
l6962:	
;smartkey.C: 326: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	327
	
l6964:	
;smartkey.C: 327: if((tmp8==1)||(tmp8==0xff)){
	decf	(main@tmp8),w
	skipnz
	goto	u3171
	goto	u3170
u3171:
	goto	l6968
u3170:
	
l6966:	
	movf	(main@tmp8),w
	xorlw	0FFh
	skipz
	goto	u3181
	goto	u3180
u3181:
	goto	l6972
u3180:
	line	328
	
l6968:	
;smartkey.C: 328: WRITE_EEPROM(0x42,0);
	clrf	(?_WRITE_EEPROM)
	movlw	(042h)
	fcall	_WRITE_EEPROM
	line	329
	
l6970:	
;smartkey.C: 329: antenSkip =0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@antenSkip)
	line	330
;smartkey.C: 330: }
	goto	l918
	line	332
	
l6972:	
;smartkey.C: 331: else{
;smartkey.C: 332: WRITE_EEPROM(0x42,0x1);
	clrf	(?_WRITE_EEPROM)
	incf	(?_WRITE_EEPROM),f
	movlw	(042h)
	fcall	_WRITE_EEPROM
	line	333
	
l6974:	
;smartkey.C: 333: antenSkip =1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@antenSkip)
	incf	(main@antenSkip),f
	line	334
	
l918:	
	line	335
;smartkey.C: 334: }
;smartkey.C: 335: WRITE_EEPROM(0x40,0);
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	line	336
	
l6976:	
	line	337
	
l6978:	
;smartkey.C: 337: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3897:
	decfsz	((??_main+0)+0),f
	goto	u3897
	decfsz	((??_main+0)+0+1),f
	goto	u3897
	nop2
opt asmopt_on

	line	341
	
l6980:	
;smartkey.C: 338: }
;smartkey.C: 341: tmp8 = READ_EEPROM(0x42);
	movlw	(042h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	342
	
l6982:	
;smartkey.C: 342: if(tmp8==1){
	decf	(main@tmp8),w
	skipz
	goto	u3191
	goto	u3190
u3191:
	goto	l919
u3190:
	line	343
	
l6984:	
;smartkey.C: 343: antenSkip =1;
	clrf	(main@antenSkip)
	incf	(main@antenSkip),f
	line	344
;smartkey.C: 344: RegStatus |=(0x20);
	bsf	(_RegStatus)+(5/8),(5)&7
	line	345
	
l6986:	
;smartkey.C: 345: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	346
	
l6988:	
;smartkey.C: 346: mtOldState = 2;
	movlw	(02h)
	movwf	(_mtOldState)
	line	347
	
l6990:	
;smartkey.C: 347: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l6992:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	348
	
l6994:	
;smartkey.C: 348: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	349
	
l919:	
	line	352
;smartkey.C: 349: }
;smartkey.C: 352: buf[0] = 0x08;
	movlw	(08h)
	movwf	(main@buf)
	line	353
;smartkey.C: 353: buf[1] = 0x4d;
	movlw	(04Dh)
	movwf	0+(main@buf)+01h
	line	354
	
l6996:	
;smartkey.C: 354: if((AccWrite(0x10,(unsigned char)buf,2)==0)) {
	movlw	(main@buf)&0ffh
	movwf	(??_main+0)+0
	movlw	((0x0/2))
	movwf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	(?_AccWrite)
	movf	1+(??_main+0)+0,w
	movwf	(?_AccWrite+1)
	movlw	(02h)
	movwf	0+(?_AccWrite)+02h
	movlw	(010h)
	fcall	_AccWrite
	iorlw	0
	skipz
	goto	u3201
	goto	u3200
u3201:
	goto	l7000
u3200:
	goto	l7004
	line	358
	
l7000:	
;smartkey.C: 357: else {
;smartkey.C: 358: accEna =0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@accEna)
	line	359
	
l7002:	
;smartkey.C: 359: beep(10,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	365
	
l7004:	
;smartkey.C: 360: }
;smartkey.C: 365: tmp8= READ_EEPROM(0x40);
	movlw	(040h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	367
	
l7006:	
;smartkey.C: 367: if(tmp8==6){
	movf	(main@tmp8),w
	xorlw	06h
	skipz
	goto	u3211
	goto	u3210
u3211:
	goto	l7044
u3210:
	line	368
	
l7008:	
;smartkey.C: 368: if(accEna ==1){
	decf	(main@accEna),w
	skipz
	goto	u3221
	goto	u3220
u3221:
	goto	l923
u3220:
	line	369
	
l7010:	
;smartkey.C: 369: tmp8=0; beep(10,3);
	clrf	(main@tmp8)
	
l7012:	
	movlw	(03h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	370
;smartkey.C: 370: while((RA2)&&(tmp8<11)){
	goto	l7022
	line	371
	
l7014:	
;smartkey.C: 371: if(AccRead(0x02,(unsigned char)buf,6)==0){
	movlw	(main@buf)&0ffh
	movwf	(??_main+0)+0
	movlw	((0x0/2))
	movwf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	(?_AccRead)
	movf	1+(??_main+0)+0,w
	movwf	(?_AccRead+1)
	movlw	(06h)
	movwf	0+(?_AccRead)+02h
	movlw	(02h)
	fcall	_AccRead
	iorlw	0
	skipz
	goto	u3231
	goto	u3230
u3231:
	goto	l7020
u3230:
	line	372
	
l7016:	
;smartkey.C: 372: acXsum += buf[1];
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
	line	373
;smartkey.C: 373: acYsum += buf[3];
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
	line	374
;smartkey.C: 374: tmp16 = (signed int)tmp16 + buf[5];
	movf	0+(main@buf)+05h,w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	btfsc	(??_main+0)+0,7
	decf	(??_main+0)+0+1,f
	movf	0+(??_main+0)+0,w
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	movf	1+(??_main+0)+0,w
	addwf	(main@tmp16+1),f
	line	375
	
l7018:	
;smartkey.C: 375: tmp8++;
	incf	(main@tmp8),f
	line	377
	
l7020:	
;smartkey.C: 376: }
;smartkey.C: 377: _delay((unsigned long)((500)*(4000000/4000.0)));
	opt asmopt_off
movlw  3
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u3907:
	decfsz	((??_main+0)+0),f
	goto	u3907
	decfsz	((??_main+0)+0+1),f
	goto	u3907
	decfsz	((??_main+0)+0+2),f
	goto	u3907
	nop2
opt asmopt_on

	line	370
	
l7022:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(42/8),(42)&7
	goto	u3241
	goto	u3240
u3241:
	goto	l7026
u3240:
	
l7024:	
	movlw	(0Bh)
	subwf	(main@tmp8),w
	skipc
	goto	u3251
	goto	u3250
u3251:
	goto	l7014
u3250:
	line	380
	
l7026:	
;smartkey.C: 378: }
;smartkey.C: 380: if(tmp8==11){
	movf	(main@tmp8),w
	xorlw	0Bh
	skipz
	goto	u3261
	goto	u3260
u3261:
	goto	l7040
u3260:
	line	381
	
l7028:	
;smartkey.C: 381: acXsum =acXsum/10;
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
	line	382
;smartkey.C: 382: acYsum = acYsum/10;
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
	line	383
;smartkey.C: 383: tmp16 = (signed int)tmp16/10;
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(main@tmp16+1),w
	movwf	1+(?___awdiv)+02h
	movf	(main@tmp16),w
	movwf	0+(?___awdiv)+02h
	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	movwf	(main@tmp16+1)
	movf	(0+(?___awdiv)),w
	movwf	(main@tmp16)
	line	385
	
l7030:	
;smartkey.C: 385: if(((signed int)tmp16 > (-31)) && ((signed int)tmp16 < 31)){
	movf	(main@tmp16+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(-30))^80h
	subwf	btemp+1,w
	skipz
	goto	u3275
	movlw	low(-30)
	subwf	(main@tmp16),w
u3275:

	skipc
	goto	u3271
	goto	u3270
u3271:
	goto	l7036
u3270:
	
l7032:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@tmp16+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01Fh))^80h
	subwf	btemp+1,w
	skipz
	goto	u3285
	movlw	low(01Fh)
	subwf	(main@tmp16),w
u3285:

	skipnc
	goto	u3281
	goto	u3280
u3281:
	goto	l7036
u3280:
	line	386
	
l7034:	
;smartkey.C: 386: beep(10,2);
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	387
;smartkey.C: 387: }else{
	goto	l923
	line	388
	
l7036:	
;smartkey.C: 388: beep(10,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	390
;smartkey.C: 390: WRITE_EEPROM(0x10,(unsigned char)acXsum);
	movf	(main@acXsum),w
	movwf	(?_WRITE_EEPROM)
	movlw	(010h)
	fcall	_WRITE_EEPROM
	line	391
;smartkey.C: 391: WRITE_EEPROM(0x11,(unsigned char)acYsum);
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acYsum),w
	movwf	(?_WRITE_EEPROM)
	movlw	(011h)
	fcall	_WRITE_EEPROM
	line	392
	
l7038:	
;smartkey.C: 392: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3917:
	decfsz	((??_main+0)+0),f
	goto	u3917
	decfsz	((??_main+0)+0+1),f
	goto	u3917
	nop2
opt asmopt_on

	goto	l923
	line	395
	
l7040:	
;smartkey.C: 395: beep(10,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	397
	
l923:	
	line	398
;smartkey.C: 396: }
;smartkey.C: 397: }
;smartkey.C: 398: WRITE_EEPROM(0x40,0);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	line	399
	
l7042:	
	line	403
	
l7044:	
;smartkey.C: 400: }
;smartkey.C: 403: acXsum = (signed char)READ_EEPROM(0x10);
	movlw	(010h)
	fcall	_READ_EEPROM
	movwf	(main@acXsum)
	clrf	(main@acXsum+1)
	btfsc	(main@acXsum),7
	decf	(main@acXsum+1),f
	line	404
	
l7046:	
;smartkey.C: 404: acYsum = (signed char)READ_EEPROM(0x11);
	movlw	(011h)
	fcall	_READ_EEPROM
	movwf	(main@acYsum)
	clrf	(main@acYsum+1)
	btfsc	(main@acYsum),7
	decf	(main@acYsum+1),f
	line	406
	
l7048:	
;smartkey.C: 406: timeTick = 0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	412
	
l7050:	
;smartkey.C: 412: if((mode_chek == 0) && (antenSkip ==0)){
	movf	(_mode_chek),f
	skipz
	goto	u3291
	goto	u3290
u3291:
	goto	l7162
u3290:
	
l7052:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@antenSkip),f
	skipz
	goto	u3301
	goto	u3300
u3301:
	goto	l7162
u3300:
	line	413
	
l7054:	
;smartkey.C: 413: if(RegStatus & 0x80){
	btfss	(_RegStatus),(7)&7
	goto	u3311
	goto	u3310
u3311:
	goto	l7162
u3310:
	line	415
	
l7056:	
;smartkey.C: 415: PAIE = 0;
	bcf	(91/8),(91)&7
	line	417
;smartkey.C: 417: RegStatus &= (~0x80);
	bcf	(_RegStatus)+(7/8),(7)&7
	line	421
;smartkey.C: 421: if ((RegStatus & 0x40) !=0){
	btfss	(_RegStatus),(6)&7
	goto	u3321
	goto	u3320
u3321:
	goto	l7160
u3320:
	goto	l7122
	line	425
	
l7060:	
;smartkey.C: 425: lostDetect =0;
	clrf	(_lostDetect)
	line	426
;smartkey.C: 426: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	427
	
l7062:	
;smartkey.C: 427: tmp16 = 40;
	movlw	028h
	movwf	(main@tmp16)
	clrf	(main@tmp16+1)
	line	428
;smartkey.C: 428: break;
	goto	l959
	line	431
	
l7064:	
;smartkey.C: 431: if(timeTick >30){
	movlw	high(01Fh)
	subwf	(_timeTick+1),w
	movlw	low(01Fh)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3331
	goto	u3330
u3331:
	goto	l959
u3330:
	line	432
	
l7066:	
;smartkey.C: 432: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	434
	
l7068:	
;smartkey.C: 434: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u3341
	goto	u3340
u3341:
	goto	l7072
u3340:
	
l7070:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	436
	
l7072:	
;smartkey.C: 436: if((mtOldState == 3)){
	bcf	status, 5	;RP0=0, select bank0
	movf	(_mtOldState),w
	xorlw	03h
	skipz
	goto	u3351
	goto	u3350
u3351:
	goto	l7082
u3350:
	line	437
	
l7074:	
;smartkey.C: 437: beepOn();TMR2ON = 0; beep(10,1);
	fcall	_beepOn
	
l7076:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l7078:	
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	438
;smartkey.C: 438: if(reAlertOn)reAlertOn =0;
	movf	(main@reAlertOn),w
	skipz
	goto	u3360
	goto	l959
u3360:
	
l7080:	
	clrf	(main@reAlertOn)
	goto	l959
	line	440
	
l7082:	
;smartkey.C: 440: else if((mtOldState == 0)||(mtOldState == 4)){
	movf	(_mtOldState),w
	skipz
	goto	u3370
	goto	l949
u3370:
	
l7084:	
	movf	(_mtOldState),w
	xorlw	04h
	skipz
	goto	u3381
	goto	u3380
u3381:
	goto	l7096
u3380:
	
l949:	
	line	441
;smartkey.C: 441: RegStatus |=(0x20);
	bsf	(_RegStatus)+(5/8),(5)&7
	line	442
	
l7086:	
;smartkey.C: 442: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	443
	
l7088:	
;smartkey.C: 443: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
	movlw	(040h)
	fcall	_READ_EEPROM
	xorlw	0
	skipnz
	goto	u3391
	goto	u3390
u3391:
	goto	l7092
u3390:
	
l7090:	
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	line	444
	
l7092:	
;smartkey.C: 444: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l7094:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	445
;smartkey.C: 445: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	446
;smartkey.C: 446: }
	goto	l959
	line	447
	
l7096:	
;smartkey.C: 447: else if((mtOldState == 1)){
	decf	(_mtOldState),w
	skipz
	goto	u3401
	goto	u3400
u3401:
	goto	l959
u3400:
	line	449
	
l7098:	
;smartkey.C: 449: if(reAlertOn)reAlertOn =0;
	movf	(main@reAlertOn),w
	skipz
	goto	u3410
	goto	l942
u3410:
	goto	l7080
	line	451
	
l942:	
	line	452
;smartkey.C: 450: }
;smartkey.C: 451: }
;smartkey.C: 452: break;
	goto	l959
	line	455
	
l7102:	
;smartkey.C: 455: if(timeTick > 200){
	movlw	high(0C9h)
	subwf	(_timeTick+1),w
	movlw	low(0C9h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3421
	goto	u3420
u3421:
	goto	l959
u3420:
	line	457
	
l7104:	
;smartkey.C: 457: beepOff();
	fcall	_beepOff
	line	458
	
l7106:	
;smartkey.C: 458: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u3431
	goto	u3430
u3431:
	goto	l7110
u3430:
	
l7108:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	459
	
l7110:	
;smartkey.C: 459: RegStatus |=(0x20);
	bcf	status, 5	;RP0=0, select bank0
	bsf	(_RegStatus)+(5/8),(5)&7
	line	460
;smartkey.C: 460: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	462
	
l7112:	
;smartkey.C: 462: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l7114:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	goto	l959
	line	468
	
l7116:	
;smartkey.C: 468: beepOff();
	fcall	_beepOff
	line	469
	
l7118:	
;smartkey.C: 469: setState(2,300);
	movlw	low(012Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	470
;smartkey.C: 470: break;
	goto	l959
	line	423
	
l7122:	
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
movlw high(S7410)
movwf pclath
	movlw low(S7410)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S7410:
	ljmp	l959
	ljmp	l7060
	ljmp	l7064
	ljmp	l7102
	ljmp	l7116
psect	maintext

	line	485
	
l7124:	
;smartkey.C: 485: if((lostDetect==1) && (timeTick< 1500) &&(timeTick >700))
	decf	(_lostDetect),w
	skipz
	goto	u3441
	goto	u3440
u3441:
	goto	l962
u3440:
	
l7126:	
	movlw	high(05DCh)
	subwf	(_timeTick+1),w
	movlw	low(05DCh)
	skipnz
	subwf	(_timeTick),w
	skipnc
	goto	u3451
	goto	u3450
u3451:
	goto	l962
u3450:
	
l7128:	
	movlw	high(02BDh)
	subwf	(_timeTick+1),w
	movlw	low(02BDh)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3461
	goto	u3460
u3461:
	goto	l962
u3460:
	line	487
	
l7130:	
;smartkey.C: 486: {
;smartkey.C: 487: if(READ_EEPROM(0x08)==0x00) WRITE_EEPROM(0x08,0xcc);
	movlw	(08h)
	fcall	_READ_EEPROM
	iorlw	0
	skipz
	goto	u3471
	goto	u3470
u3471:
	goto	l963
u3470:
	
l7132:	
	movlw	(0CCh)
	movwf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	
l963:	
	line	489
;smartkey.C: 489: setState(3,1800);
	movlw	low(0708h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(0708h)
	movwf	((?_setState))+1
	movlw	(03h)
	fcall	_setState
	line	490
	
l7134:	
;smartkey.C: 490: cntTmp = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l7136:	
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	491
	
l7138:	
;smartkey.C: 491: PR2L =20;
	movlw	(014h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	492
;smartkey.C: 492: beepOn();
	fcall	_beepOn
	line	493
	
l7140:	
;smartkey.C: 493: lostDetect =0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_lostDetect)
	line	494
;smartkey.C: 494: }
	goto	l7142
	line	495
	
l962:	
	line	496
;smartkey.C: 495: else {
;smartkey.C: 496: lostDetect =1;
	clrf	(_lostDetect)
	incf	(_lostDetect),f
	line	500
	
l7142:	
;smartkey.C: 499: }
;smartkey.C: 500: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	goto	l7062
	line	505
	
l7146:	
;smartkey.C: 505: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	506
	
l7148:	
;smartkey.C: 506: beepOn();TMR2ON = 0;
	fcall	_beepOn
	
l7150:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	507
	
l7152:	
;smartkey.C: 507: beep(10,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	508
	
l7154:	
;smartkey.C: 508: if(mtOldState == 3){reAlertOn =1;}
	movf	(_mtOldState),w
	xorlw	03h
	skipz
	goto	u3481
	goto	u3480
u3481:
	goto	l959
u3480:
	
l7156:	
	clrf	(main@reAlertOn)
	incf	(main@reAlertOn),f
	goto	l959
	line	480
	
l7160:	
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
	goto	l7124
	xorlw	2^1	; case 2
	skipnz
	goto	l7146
	goto	l959
	opt asmopt_on

	line	511
	
l959:	
	line	512
;smartkey.C: 511: }
;smartkey.C: 512: PAIE = 1;
	bsf	(91/8),(91)&7
	line	519
	
l7162:	
;smartkey.C: 513: }
;smartkey.C: 515: }
;smartkey.C: 519: if((timeOut!=0)&&( timeTick >timeOut)){
	bcf	status, 5	;RP0=0, select bank0
	movf	(_timeOut+1),w
	iorwf	(_timeOut),w
	skipnz
	goto	u3491
	goto	u3490
u3491:
	goto	l7242
u3490:
	
l7164:	
	movf	(_timeTick+1),w
	subwf	(_timeOut+1),w
	skipz
	goto	u3505
	movf	(_timeTick),w
	subwf	(_timeOut),w
u3505:
	skipnc
	goto	u3501
	goto	u3500
u3501:
	goto	l7242
u3500:
	goto	l7240
	line	530
	
l7168:	
;smartkey.C: 530: beepOff();
	fcall	_beepOff
	line	531
	
l7170:	
;smartkey.C: 531: RegStatus &=(~0x20);
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_RegStatus)+(5/8),(5)&7
	line	532
	
l7172:	
;smartkey.C: 532: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	533
;smartkey.C: 533: break;
	goto	l7242
	line	535
	
l7174:	
;smartkey.C: 535: beepOff();
	fcall	_beepOff
	line	536
	
l7176:	
;smartkey.C: 536: delay_x10ms(20);
	movlw	014h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	537
	
l7178:	
;smartkey.C: 537: beepOn();TMR2ON = 0;reAlertOn =0;
	fcall	_beepOn
	
l7180:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l7182:	
	clrf	(main@reAlertOn)
	line	538
	
l7184:	
;smartkey.C: 538: beep(30,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(01Eh)
	fcall	_beep
	line	539
	
l7186:	
;smartkey.C: 539: vibrateOn=1;
	clrf	(main@vibrateOn)
	incf	(main@vibrateOn),f
	line	540
	
l7188:	
;smartkey.C: 540: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	542
	
l7190:	
;smartkey.C: 542: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l7192:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	543
;smartkey.C: 543: break;
	goto	l7242
	line	546
	
l7194:	
;smartkey.C: 546: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u3511
	goto	u3510
u3511:
	goto	l7198
u3510:
	
l7196:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	548
	
l7198:	
;smartkey.C: 548: if(reAlertOn){
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@reAlertOn),w
	skipz
	goto	u3520
	goto	l7208
u3520:
	line	549
	
l7200:	
;smartkey.C: 549: setState(4,6000);
	movlw	low(01770h)
	movwf	(?_setState)
	movlw	high(01770h)
	movwf	((?_setState))+1
	movlw	(04h)
	fcall	_setState
	line	550
	
l7202:	
;smartkey.C: 550: cntTmp = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l7204:	
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	551
	
l7206:	
;smartkey.C: 551: PR2L =20;
	movlw	(014h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	552
;smartkey.C: 552: beepOn();
	fcall	_beepOn
	line	554
;smartkey.C: 554: }else if(mtOldState == 0){
	goto	l7242
	
l7208:	
	movf	(_mtOldState),f
	skipz
	goto	u3531
	goto	u3530
u3531:
	goto	l7222
u3530:
	line	556
	
l7210:	
;smartkey.C: 556: beep(10,5);
	movlw	(05h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	557
	
l7212:	
;smartkey.C: 557: RegStatus |=(0x20);
	bsf	(_RegStatus)+(5/8),(5)&7
	line	560
	
l7214:	
;smartkey.C: 560: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
	movlw	(040h)
	fcall	_READ_EEPROM
	xorlw	0
	skipnz
	goto	u3541
	goto	u3540
u3541:
	goto	l979
u3540:
	
l7216:	
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	
l979:	
	line	562
;smartkey.C: 562: setState(1,3500);
	movlw	low(0DACh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	goto	l7190
	line	566
	
l7222:	
;smartkey.C: 566: beepOn();TMR2ON = 0;
	fcall	_beepOn
	
l7224:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	567
	
l7226:	
;smartkey.C: 567: reAlertOn =0;
	clrf	(main@reAlertOn)
	line	568
	
l7228:	
;smartkey.C: 568: beep(30,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(01Eh)
	fcall	_beep
	line	569
	
l7230:	
;smartkey.C: 569: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	571
	
l7232:	
;smartkey.C: 571: vibrateOn=1;
	clrf	(main@vibrateOn)
	incf	(main@vibrateOn),f
	goto	l7190
	line	521
	
l7240:	
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
	goto	l7242
	xorlw	2^1	; case 2
	skipnz
	goto	l7194
	xorlw	3^2	; case 3
	skipnz
	goto	l7168
	xorlw	4^3	; case 4
	skipnz
	goto	l7174
	goto	l7242
	opt asmopt_on

	line	579
	
l7242:	
;smartkey.C: 576: }
;smartkey.C: 579: if((timeTick>tmp16) && (mtState == 1) && (accEna ==1)){
	movf	(_timeTick+1),w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@tmp16+1),w
	skipz
	goto	u3555
	movf	(_timeTick),w
	subwf	(main@tmp16),w
u3555:
	skipnc
	goto	u3551
	goto	u3550
u3551:
	goto	l7326
u3550:
	
l7244:	
	decf	(_mtState),w
	skipz
	goto	u3561
	goto	u3560
u3561:
	goto	l7326
u3560:
	
l7246:	
	decf	(main@accEna),w
	skipz
	goto	u3571
	goto	u3570
u3571:
	goto	l7326
u3570:
	line	580
	
l7248:	
;smartkey.C: 580: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	581
	
l7250:	
;smartkey.C: 581: if(AccRead(0x02,buf,6)==0){
	movlw	(main@buf&0ffh)
	movwf	(?_AccRead)
	movlw	(0x0/2)
	movwf	(?_AccRead+1)
	movlw	(06h)
	movwf	0+(?_AccRead)+02h
	movlw	(02h)
	fcall	_AccRead
	iorlw	0
	skipz
	goto	u3581
	goto	u3580
u3581:
	goto	l7326
u3580:
	line	583
	
l7252:	
;smartkey.C: 583: if(compe(buf[1], (signed char)acXsum,5) && compe(buf[3], (signed char)acYsum,5)){
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acXsum),w
	movwf	(?_compe)
	movlw	(05h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+01h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3591
	goto	u3590
u3591:
	goto	l7282
u3590:
	
l7254:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acYsum),w
	movwf	(?_compe)
	movlw	(05h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+03h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3601
	goto	u3600
u3601:
	goto	l7282
u3600:
	line	585
	
l7256:	
;smartkey.C: 585: isSw++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@isSw),f
	line	586
	
l7258:	
;smartkey.C: 586: if(isSw >44){
	movlw	(02Dh)
	subwf	(main@isSw),w
	skipc
	goto	u3611
	goto	u3610
u3611:
	goto	l7272
u3610:
	line	587
	
l7260:	
;smartkey.C: 587: isSw =0;
	clrf	(main@isSw)
	line	588
	
l7262:	
;smartkey.C: 588: vibrateOn=1;
	clrf	(main@vibrateOn)
	incf	(main@vibrateOn),f
	line	590
	
l7264:	
	
l7266:	
	line	591
	
l7268:	
;smartkey.C: 591: RegStatus &=(~0x20);
	bcf	(_RegStatus)+(5/8),(5)&7
	line	592
	
l7270:	
;smartkey.C: 592: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	594
;smartkey.C: 594: }
	goto	l7304
	line	595
	
l7272:	
;smartkey.C: 595: else if(isSw > 25){
	movlw	(01Ah)
	subwf	(main@isSw),w
	skipc
	goto	u3621
	goto	u3620
u3621:
	goto	l7304
u3620:
	line	596
	
l7274:	
;smartkey.C: 596: if(isSw%2==0){
	btfsc	(main@isSw),(0)&7
	goto	u3631
	goto	u3630
u3631:
	goto	l985
u3630:
	line	597
	
l7276:	
;smartkey.C: 597: beepOn();TMR2ON = 0; beep(7,1);
	fcall	_beepOn
	
l7278:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l7280:	
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(07h)
	fcall	_beep
	goto	l7304
	line	601
	
l985:	
;smartkey.C: 598: }
;smartkey.C: 599: }
;smartkey.C: 601: }
	goto	l7304
	line	604
	
l7282:	
;smartkey.C: 603: else{
;smartkey.C: 604: isSw =0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@isSw)
	line	607
	
l7284:	
;smartkey.C: 607: if(compe(buf[1], acXOld,1) && compe(buf[3], acYOld,1)){
	movf	(main@acXOld),w
	movwf	(?_compe)
	clrf	0+(?_compe)+01h
	incf	0+(?_compe)+01h,f
	movf	0+(main@buf)+01h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3641
	goto	u3640
u3641:
	goto	l7302
u3640:
	
l7286:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acYOld),w
	movwf	(?_compe)
	clrf	0+(?_compe)+01h
	incf	0+(?_compe)+01h,f
	movf	0+(main@buf)+03h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3651
	goto	u3650
u3651:
	goto	l7302
u3650:
	line	608
	
l7288:	
;smartkey.C: 608: isWait++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@isWait),f
	skipnz
	incf	(main@isWait+1),f
	line	609
	
l7290:	
;smartkey.C: 609: if(isWait==450){
	decf	(main@isWait+1),w
	movlw	194
	skipnz
	xorwf	(main@isWait),w

	skipz
	goto	u3661
	goto	u3660
u3661:
	goto	l7304
u3660:
	line	610
	
l7292:	
;smartkey.C: 610: isWait = 0;
	clrf	(main@isWait)
	clrf	(main@isWait+1)
	line	611
	
l7294:	
;smartkey.C: 611: beep(7,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	line	612
	
l7296:	
;smartkey.C: 612: vibrateOn=1;
	clrf	(main@vibrateOn)
	incf	(main@vibrateOn),f
	line	613
	
l7298:	
;smartkey.C: 613: RegStatus &=(~0x20);
	bcf	(_RegStatus)+(5/8),(5)&7
	line	614
	
l7300:	
;smartkey.C: 614: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	goto	l7304
	line	618
	
l7302:	
;smartkey.C: 617: else
;smartkey.C: 618: isWait=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@isWait)
	clrf	(main@isWait+1)
	line	621
	
l7304:	
;smartkey.C: 619: }
;smartkey.C: 621: if( (buf[5] > -31) && (buf[5] < 31)) {
	movf	0+(main@buf)+05h,w
	xorlw	80h
	addlw	-((-30)^80h)
	skipc
	goto	u3671
	goto	u3670
u3671:
	goto	l7320
u3670:
	
l7306:	
	movf	0+(main@buf)+05h,w
	xorlw	80h
	addlw	-((01Fh)^80h)
	skipnc
	goto	u3681
	goto	u3680
u3681:
	goto	l7320
u3680:
	line	622
	
l7308:	
;smartkey.C: 622: isFall++;
	incf	(main@isFall),f
	line	623
	
l7310:	
;smartkey.C: 623: if(isFall >4){
	movlw	(05h)
	subwf	(main@isFall),w
	skipc
	goto	u3691
	goto	u3690
u3691:
	goto	l7322
u3690:
	line	624
	
l7312:	
;smartkey.C: 624: isFall =0;
	clrf	(main@isFall)
	line	625
	
l7314:	
;smartkey.C: 625: beep(7,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	line	626
	
l7316:	
;smartkey.C: 626: RegStatus &=(~0x20);
	bcf	(_RegStatus)+(5/8),(5)&7
	line	627
	
l7318:	
;smartkey.C: 627: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	goto	l7322
	line	631
	
l7320:	
;smartkey.C: 630: else{
;smartkey.C: 631: isFall=0;
	clrf	(main@isFall)
	line	634
	
l7322:	
;smartkey.C: 632: }
;smartkey.C: 634: acYOld = buf[3];acXOld = buf[1];
	movf	0+(main@buf)+03h,w
	movwf	(main@acYOld)
	
l7324:	
	movf	0+(main@buf)+01h,w
	movwf	(main@acXOld)
	line	639
	
l7326:	
;smartkey.C: 635: }
;smartkey.C: 636: }
;smartkey.C: 639: if((timeTick>tmp16) && (mtState == 0 ) && (accEna ==1)){
	movf	(_timeTick+1),w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@tmp16+1),w
	skipz
	goto	u3705
	movf	(_timeTick),w
	subwf	(main@tmp16),w
u3705:
	skipnc
	goto	u3701
	goto	u3700
u3701:
	goto	l7358
u3700:
	
l7328:	
	movf	(_mtState),f
	skipz
	goto	u3711
	goto	u3710
u3711:
	goto	l7358
u3710:
	
l7330:	
	decf	(main@accEna),w
	skipz
	goto	u3721
	goto	u3720
u3721:
	goto	l7358
u3720:
	line	641
	
l7332:	
;smartkey.C: 641: if(timeTick >65000) timeTick =0;
	movlw	high(0FDE9h)
	subwf	(_timeTick+1),w
	movlw	low(0FDE9h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3731
	goto	u3730
u3731:
	goto	l7336
u3730:
	
l7334:	
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	642
	
l7336:	
;smartkey.C: 642: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l7338:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	644
	
l7340:	
;smartkey.C: 644: if(AccRead(0x02,buf,6)==0){
	movlw	(main@buf&0ffh)
	movwf	(?_AccRead)
	movlw	(0x0/2)
	movwf	(?_AccRead+1)
	movlw	(06h)
	movwf	0+(?_AccRead)+02h
	movlw	(02h)
	fcall	_AccRead
	iorlw	0
	skipz
	goto	u3741
	goto	u3740
u3741:
	goto	l7358
u3740:
	line	646
	
l7342:	
;smartkey.C: 646: if(vibrateOn==1){
	bcf	status, 5	;RP0=0, select bank0
	decf	(main@vibrateOn),w
	skipz
	goto	u3751
	goto	u3750
u3751:
	goto	l7358
u3750:
	line	647
	
l7344:	
;smartkey.C: 647: if(compe(buf[1],acXOld ,3) && compe(buf[3],acYOld ,3)){
	movf	(main@acXOld),w
	movwf	(?_compe)
	movlw	(03h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+01h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3761
	goto	u3760
u3761:
	goto	l7350
u3760:
	
l7346:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acYOld),w
	movwf	(?_compe)
	movlw	(03h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+03h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3771
	goto	u3770
u3771:
	goto	l7350
u3770:
	line	649
	
l7348:	
;smartkey.C: 649: isSw=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@isSw)
	line	650
;smartkey.C: 650: }
	goto	l7358
	line	652
	
l7350:	
;smartkey.C: 651: else{
;smartkey.C: 652: isSw++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@isSw),f
	line	655
	
l7352:	
;smartkey.C: 654: {
;smartkey.C: 655: beepOn();TMR2ON = 0; beep(7,3);
	fcall	_beepOn
	
l7354:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l7356:	
	movlw	(03h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	line	662
	
l7358:	
;smartkey.C: 656: }
;smartkey.C: 657: }
;smartkey.C: 658: }
;smartkey.C: 659: }
;smartkey.C: 660: }
;smartkey.C: 662: if(RegStatus & 0x20) {RC0 =1;RC1 =1;}
	bcf	status, 5	;RP0=0, select bank0
	btfss	(_RegStatus),(5)&7
	goto	u3781
	goto	u3780
u3781:
	goto	l1001
u3780:
	
l7360:	
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	goto	l7362
	line	663
	
l1001:	
;smartkey.C: 663: else {RC0 =0;RC1 =0;}
	bcf	(56/8),(56)&7
	bcf	(57/8),(57)&7
	line	666
	
l7362:	
;smartkey.C: 666: if((timeTick >500)&&(READ_EEPROM(0x3F))) WRITE_EEPROM(0x3F,0);
	movlw	high(01F5h)
	subwf	(_timeTick+1),w
	movlw	low(01F5h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3791
	goto	u3790
u3791:
	goto	l7368
u3790:
	
l7364:	
	movlw	(03Fh)
	fcall	_READ_EEPROM
	xorlw	0
	skipnz
	goto	u3801
	goto	u3800
u3801:
	goto	l7368
u3800:
	
l7366:	
	clrf	(?_WRITE_EEPROM)
	movlw	(03Fh)
	fcall	_WRITE_EEPROM
	line	667
	
l7368:	
;smartkey.C: 667: if((timeTick >500)&&(READ_EEPROM(0x40))) WRITE_EEPROM(0x40,0);
	movlw	high(01F5h)
	subwf	(_timeTick+1),w
	movlw	low(01F5h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3811
	goto	u3810
u3811:
	goto	l7050
u3810:
	
l7370:	
	movlw	(040h)
	fcall	_READ_EEPROM
	xorlw	0
	skipnz
	goto	u3821
	goto	u3820
u3821:
	goto	l7050
u3820:
	
l7372:	
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	goto	l7050
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	669
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_AccRead
psect	text860,local,class=CODE,delta=2
global __ptext860
__ptext860:

;; *************** function _AccRead *****************
;; Defined at:
;;		line 31 in file "mpu6x.c"
;; Parameters:    Size  Location     Type
;;  rAdd            1    wreg     unsigned char 
;;  dat             2    4[BANK0 ] PTR unsigned char 
;;		 -> RAM(256), main@buf(6), 
;;  len             1    6[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  rAdd            1   10[BANK0 ] unsigned char 
;;  i               1   11[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       3       0
;;      Locals:         0       2       0
;;      Temps:          0       3       0
;;      Totals:         0       8       0
;;Total ram usage:        8 bytes
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
psect	text860
	file	"mpu6x.c"
	line	31
	global	__size_of_AccRead
	__size_of_AccRead	equ	__end_of_AccRead-_AccRead
	
_AccRead:	
	opt	stack 4
; Regs used in _AccRead: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;AccRead@rAdd stored from wreg
	line	34
	movwf	(AccRead@rAdd)
	
l6808:	
;mpu6x.c: 32: unsigned char i;
;mpu6x.c: 34: swI2C_Start();
	fcall	_swI2C_Start
	line	36
;mpu6x.c: 36: if(swI2C_WriteByte(0x18<<1)== 0 )
	movlw	(030h)
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u3021
	goto	u3020
u3021:
	goto	l6832
u3020:
	line	38
	
l6810:	
;mpu6x.c: 37: {
;mpu6x.c: 38: if(swI2C_WriteByte(rAdd)==0 )
	movf	(AccRead@rAdd),w
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u3031
	goto	u3030
u3031:
	goto	l6836
u3030:
	line	40
	
l6812:	
;mpu6x.c: 39: {
;mpu6x.c: 40: swI2C_Start();
	fcall	_swI2C_Start
	line	41
;mpu6x.c: 41: if(swI2C_WriteByte((0x18<<1)|1)== 0 ){
	movlw	(031h)
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u3041
	goto	u3040
u3041:
	goto	l6832
u3040:
	line	43
	
l6814:	
;mpu6x.c: 43: for(i=0; i<(len-1);i++){
	clrf	(AccRead@i)
	goto	l6820
	line	44
	
l6816:	
;mpu6x.c: 44: dat[i]=swI2C_ReadByte(1);
	movlw	(01h)
	fcall	_swI2C_ReadByte
	movwf	(??_AccRead+0)+0
	movf	(AccRead@i),w
	addwf	(AccRead@dat),w
	movwf	(??_AccRead+1)+0
	movf	(AccRead@dat+1),w
	skipnc
	addlw	1
	movwf	1+((??_AccRead+1)+0)
	movf	0+(??_AccRead+1)+0,w
	movwf	fsr0
	bcf	status,7
	btfsc	1+(??_AccRead+1)+0,0
	bsf	status,7
	
	movf	(??_AccRead+0)+0,w
	movwf	indf
	line	43
	
l6818:	
	incf	(AccRead@i),f
	
l6820:	
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
	goto	u3055
	movf	0+(??_AccRead+0)+0,w
	subwf	(AccRead@i),w
u3055:

	skipc
	goto	u3051
	goto	u3050
u3051:
	goto	l6816
u3050:
	line	46
	
l6822:	
;mpu6x.c: 45: }
;mpu6x.c: 46: dat[i]=swI2C_ReadByte(1);
	movlw	(01h)
	fcall	_swI2C_ReadByte
	movwf	(??_AccRead+0)+0
	movf	(AccRead@i),w
	addwf	(AccRead@dat),w
	movwf	(??_AccRead+1)+0
	movf	(AccRead@dat+1),w
	skipnc
	addlw	1
	movwf	1+((??_AccRead+1)+0)
	movf	0+(??_AccRead+1)+0,w
	movwf	fsr0
	bcf	status,7
	btfsc	1+(??_AccRead+1)+0,0
	bsf	status,7
	
	movf	(??_AccRead+0)+0,w
	movwf	indf
	line	47
	
l6824:	
;mpu6x.c: 47: swI2C_Stop();
	fcall	_swI2C_Stop
	line	48
	
l6826:	
;mpu6x.c: 48: return 0;
	movlw	(0)
	goto	l3422
	line	52
	
l6832:	
;mpu6x.c: 51: else
;mpu6x.c: 52: return 1;
	movlw	(01h)
	goto	l3422
	line	55
	
l6836:	
;mpu6x.c: 54: else
;mpu6x.c: 55: return 2;
	movlw	(02h)
	line	59
	
l3422:	
	return
	opt stack 0
GLOBAL	__end_of_AccRead
	__end_of_AccRead:
;; =============== function _AccRead ends ============

	signat	_AccRead,12409
	global	_AccWrite
psect	text861,local,class=CODE,delta=2
global __ptext861
__ptext861:

;; *************** function _AccWrite *****************
;; Defined at:
;;		line 4 in file "mpu6x.c"
;; Parameters:    Size  Location     Type
;;  rAdd            1    wreg     unsigned char 
;;  dat             2    3[BANK0 ] PTR unsigned char 
;;		 -> RAM(256), 
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
;;      Params:         0       3       0
;;      Locals:         0       2       0
;;      Temps:          0       2       0
;;      Totals:         0       7       0
;;Total ram usage:        7 bytes
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
psect	text861
	file	"mpu6x.c"
	line	4
	global	__size_of_AccWrite
	__size_of_AccWrite	equ	__end_of_AccWrite-_AccWrite
	
_AccWrite:	
	opt	stack 4
; Regs used in _AccWrite: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;AccWrite@rAdd stored from wreg
	line	6
	movwf	(AccWrite@rAdd)
	
l6774:	
;mpu6x.c: 5: unsigned char i;
;mpu6x.c: 6: swI2C_Start();
	fcall	_swI2C_Start
	line	8
;mpu6x.c: 8: if(swI2C_WriteByte(0x18<<1)== 0 )
	movlw	(030h)
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2981
	goto	u2980
u2981:
	goto	l6804
u2980:
	line	10
	
l6776:	
;mpu6x.c: 9: {
;mpu6x.c: 10: if(swI2C_WriteByte(rAdd)==0 )
	movf	(AccWrite@rAdd),w
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2991
	goto	u2990
u2991:
	goto	l6800
u2990:
	line	12
	
l6778:	
;mpu6x.c: 11: {
;mpu6x.c: 12: for(i=0; i<len;i++){
	clrf	(AccWrite@i)
	goto	l6790
	line	13
	
l6780:	
;mpu6x.c: 13: if(swI2C_WriteByte(dat[i])==1 ){
	movf	(AccWrite@i),w
	addwf	(AccWrite@dat),w
	movwf	(??_AccWrite+0)+0
	movf	(AccWrite@dat+1),w
	skipnc
	addlw	1
	movwf	1+((??_AccWrite+0)+0)
	movf	0+(??_AccWrite+0)+0,w
	movwf	fsr0
	bsf	status,7
	btfss	1+(??_AccWrite+0)+0,0
	bcf	status,7
	movf	indf,w
	fcall	_swI2C_WriteByte
	xorlw	01h
	skipz
	goto	u3001
	goto	u3000
u3001:
	goto	l6788
u3000:
	line	14
	
l6782:	
;mpu6x.c: 14: swI2C_Stop();
	fcall	_swI2C_Stop
	line	15
	
l6784:	
;mpu6x.c: 15: return 3;
	movlw	(03h)
	goto	l3410
	line	12
	
l6788:	
	incf	(AccWrite@i),f
	
l6790:	
	movf	(AccWrite@len),w
	subwf	(AccWrite@i),w
	skipc
	goto	u3011
	goto	u3010
u3011:
	goto	l6780
u3010:
	line	18
	
l6792:	
;mpu6x.c: 16: }
;mpu6x.c: 17: }
;mpu6x.c: 18: swI2C_Stop();
	fcall	_swI2C_Stop
	line	19
	
l6794:	
;mpu6x.c: 19: return 0;
	movlw	(0)
	goto	l3410
	line	22
	
l6800:	
;mpu6x.c: 21: else
;mpu6x.c: 22: return 2;
	movlw	(02h)
	goto	l3410
	line	25
	
l6804:	
;mpu6x.c: 24: else
;mpu6x.c: 25: return 1;
	movlw	(01h)
	line	27
	
l3410:	
	return
	opt stack 0
GLOBAL	__end_of_AccWrite
	__end_of_AccWrite:
;; =============== function _AccWrite ends ============

	signat	_AccWrite,12409
	global	_swI2C_ReadByte
psect	text862,local,class=CODE,delta=2
global __ptext862
__ptext862:

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
;;		On entry : 0/0
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
psect	text862
	file	"SWI2C.C"
	line	112
	global	__size_of_swI2C_ReadByte
	__size_of_swI2C_ReadByte	equ	__end_of_swI2C_ReadByte-_swI2C_ReadByte
	
_swI2C_ReadByte:	
	opt	stack 4
; Regs used in _swI2C_ReadByte: [wreg+status,2+status,0]
;swI2C_ReadByte@Ack stored from wreg
	line	114
	bcf	status, 5	;RP0=0, select bank0
	movwf	(swI2C_ReadByte@Ack)
	
l6746:	
	clrf	(swI2C_ReadByte@dat)
	line	115
	
l6748:	
;SWI2C.C: 115: RA7 = 0;
	bcf	(47/8),(47)&7
	line	116
	
l6750:	
;SWI2C.C: 116: TRISA |=0x40;;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(6/8),(6)&7	;volatile
	line	117
	
l6752:	
;SWI2C.C: 117: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_ReadByte+0)+0,f
u3927:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3927
opt asmopt_on

	line	118
	
l6754:	
;SWI2C.C: 118: for(i=0;i<8;i++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(swI2C_ReadByte@i)
	line	119
	
l2610:	
	line	120
;SWI2C.C: 119: {
;SWI2C.C: 120: RA7 = 1;
	bsf	(47/8),(47)&7
	line	121
	
l6758:	
;SWI2C.C: 121: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_ReadByte+0)+0,f
u3937:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3937
opt asmopt_on

	line	122
	
l6760:	
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
	
l6762:	
;SWI2C.C: 125: RA7 = 0;
	bcf	(47/8),(47)&7
	line	126
	
l6764:	
;SWI2C.C: 126: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_ReadByte+0)+0,f
u3947:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3947
opt asmopt_on

	line	118
	
l6766:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(swI2C_ReadByte@i),f
	movlw	(08h)
	subwf	(swI2C_ReadByte@i),w
	skipc
	goto	u2951
	goto	u2950
u2951:
	goto	l2610
u2950:
	
l2611:	
	line	129
;SWI2C.C: 127: }
;SWI2C.C: 129: TRISA &=0xbf;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(6/8),(6)&7	;volatile
	line	131
;SWI2C.C: 131: RA6 = (Ack) ? 0 : 1;
	bcf	status, 5	;RP0=0, select bank0
	movf	(swI2C_ReadByte@Ack)
	skipnz
	goto	u2961
	goto	u2960
	
u2961:
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	goto	u2974
u2960:
	bcf	status, 5	;RP0=0, select bank0
	bcf	(46/8),(46)&7
u2974:
	line	132
;SWI2C.C: 132: RA7 = 1;
	bsf	(47/8),(47)&7
	line	133
	
l6768:	
;SWI2C.C: 133: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_ReadByte+0)+0,f
u3957:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3957
opt asmopt_on

	line	134
	
l6770:	
;SWI2C.C: 134: RA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(47/8),(47)&7
	line	135
;SWI2C.C: 135: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_ReadByte+0)+0,f
u3967:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3967
opt asmopt_on

	line	136
;SWI2C.C: 136: return dat;
	bcf	status, 5	;RP0=0, select bank0
	movf	(swI2C_ReadByte@dat),w
	line	137
	
l2612:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_ReadByte
	__end_of_swI2C_ReadByte:
;; =============== function _swI2C_ReadByte ends ============

	signat	_swI2C_ReadByte,4217
	global	_swI2C_WriteByte
psect	text863,local,class=CODE,delta=2
global __ptext863
__ptext863:

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
psect	text863
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
	
l6718:	
	line	89
	
l6720:	
;SWI2C.C: 89: TRISA &=0xbf;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(6/8),(6)&7	;volatile
	line	90
	
l6722:	
;SWI2C.C: 90: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_WriteByte+0)+0,f
u3977:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u3977
opt asmopt_on

	line	91
	
l6724:	
;SWI2C.C: 91: for(i=0;i<8;i++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(swI2C_WriteByte@i)
	line	92
	
l2605:	
	line	93
;SWI2C.C: 92: {
;SWI2C.C: 93: RA6 = (dat&0x80) ? 1:0;
	btfsc	(swI2C_WriteByte@dat),(7)&7
	goto	u2921
	goto	u2920
	
u2921:
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	goto	u2934
u2920:
	bcf	status, 5	;RP0=0, select bank0
	bcf	(46/8),(46)&7
u2934:
	line	94
;SWI2C.C: 94: dat<<=1;
	clrc
	rlf	(swI2C_WriteByte@dat),f
	line	95
;SWI2C.C: 95: RA7 = 1;
	bsf	(47/8),(47)&7
	line	96
	
l6728:	
;SWI2C.C: 96: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_WriteByte+0)+0,f
u3987:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u3987
opt asmopt_on

	line	97
	
l6730:	
;SWI2C.C: 97: RA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(47/8),(47)&7
	line	98
;SWI2C.C: 98: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_WriteByte+0)+0,f
u3997:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u3997
opt asmopt_on

	line	91
	
l6732:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(swI2C_WriteByte@i),f
	
l6734:	
	movlw	(08h)
	subwf	(swI2C_WriteByte@i),w
	skipc
	goto	u2941
	goto	u2940
u2941:
	goto	l2605
u2940:
	
l2606:	
	line	101
;SWI2C.C: 99: }
;SWI2C.C: 101: TRISA |=0x40;;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(6/8),(6)&7	;volatile
	line	102
	
l6736:	
;SWI2C.C: 102: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_WriteByte+0)+0,f
u4007:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u4007
opt asmopt_on

	line	103
	
l6738:	
;SWI2C.C: 103: RA7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(47/8),(47)&7
	line	104
;SWI2C.C: 104: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_WriteByte+0)+0,f
u4017:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u4017
opt asmopt_on

	line	105
;SWI2C.C: 105: i= RA6;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(46/8),(46)&7
	movlw	1
	movwf	(swI2C_WriteByte@i)
	line	106
	
l6740:	
;SWI2C.C: 106: RA7 = 0;
	bcf	(47/8),(47)&7
	line	107
	
l6742:	
;SWI2C.C: 107: TRISA &=0xbf;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(6/8),(6)&7	;volatile
	line	108
;SWI2C.C: 108: return i;
	bcf	status, 5	;RP0=0, select bank0
	movf	(swI2C_WriteByte@i),w
	line	109
	
l2607:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_WriteByte
	__end_of_swI2C_WriteByte:
;; =============== function _swI2C_WriteByte ends ============

	signat	_swI2C_WriteByte,4217
	global	_swI2C_Stop
psect	text864,local,class=CODE,delta=2
global __ptext864
__ptext864:

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
psect	text864
	file	"SWI2C.C"
	line	35
	global	__size_of_swI2C_Stop
	__size_of_swI2C_Stop	equ	__end_of_swI2C_Stop-_swI2C_Stop
	
_swI2C_Stop:	
	opt	stack 4
; Regs used in _swI2C_Stop: [wreg]
	line	37
	
l6712:	
;SWI2C.C: 37: RA6 = 0;
	bcf	(46/8),(46)&7
	line	38
;SWI2C.C: 38: RA7 = 1;
	bsf	(47/8),(47)&7
	line	39
	
l6714:	
;SWI2C.C: 39: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Stop+0)+0,f
u4027:
decfsz	(??_swI2C_Stop+0)+0,f
	goto	u4027
opt asmopt_on

	line	40
	
l6716:	
;SWI2C.C: 40: RA6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	line	41
;SWI2C.C: 41: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Stop+0)+0,f
u4037:
decfsz	(??_swI2C_Stop+0)+0,f
	goto	u4037
opt asmopt_on

	line	42
	
l2599:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_Stop
	__end_of_swI2C_Stop:
;; =============== function _swI2C_Stop ends ============

	signat	_swI2C_Stop,88
	global	_swI2C_Start
psect	text865,local,class=CODE,delta=2
global __ptext865
__ptext865:

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
psect	text865
	file	"SWI2C.C"
	line	22
	global	__size_of_swI2C_Start
	__size_of_swI2C_Start	equ	__end_of_swI2C_Start-_swI2C_Start
	
_swI2C_Start:	
	opt	stack 4
; Regs used in _swI2C_Start: [wreg]
	line	24
	
l6704:	
;SWI2C.C: 24: RA7 = 1;
	bsf	(47/8),(47)&7
	line	26
;SWI2C.C: 26: RA6 = 1;
	bsf	(46/8),(46)&7
	line	27
	
l6706:	
;SWI2C.C: 27: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Start+0)+0,f
u4047:
decfsz	(??_swI2C_Start+0)+0,f
	goto	u4047
opt asmopt_on

	line	28
	
l6708:	
;SWI2C.C: 28: RA6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(46/8),(46)&7
	line	29
;SWI2C.C: 29: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Start+0)+0,f
u4057:
decfsz	(??_swI2C_Start+0)+0,f
	goto	u4057
opt asmopt_on

	line	30
	
l6710:	
;SWI2C.C: 30: RA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(47/8),(47)&7
	line	31
;SWI2C.C: 31: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Start+0)+0,f
u4067:
decfsz	(??_swI2C_Start+0)+0,f
	goto	u4067
opt asmopt_on

	line	32
	
l2596:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_Start
	__end_of_swI2C_Start:
;; =============== function _swI2C_Start ends ============

	signat	_swI2C_Start,88
	global	_swI2C_Init
psect	text866,local,class=CODE,delta=2
global __ptext866
__ptext866:

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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text866
	file	"SWI2C.C"
	line	8
	global	__size_of_swI2C_Init
	__size_of_swI2C_Init	equ	__end_of_swI2C_Init-_swI2C_Init
	
_swI2C_Init:	
	opt	stack 5
; Regs used in _swI2C_Init: [wreg]
	line	10
	
l6696:	
;SWI2C.C: 10: TRISA &=0xbf;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(6/8),(6)&7	;volatile
	line	11
;SWI2C.C: 11: TRISA &=0x7f;;
	bcf	(133)^080h+(7/8),(7)&7	;volatile
	line	12
	
l6698:	
;SWI2C.C: 12: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_Init+0)+0,f
u4077:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u4077
opt asmopt_on

	line	13
	
l6700:	
;SWI2C.C: 13: RA7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(47/8),(47)&7
	line	14
	
l6702:	
;SWI2C.C: 14: RA6 = 1;
	bsf	(46/8),(46)&7
	line	15
;SWI2C.C: 15: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Init+0)+0,f
u4087:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u4087
opt asmopt_on

	line	16
;SWI2C.C: 16: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_Init+0)+0,f
u4097:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u4097
opt asmopt_on

	line	17
;SWI2C.C: 17: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_Init+0)+0,f
u4107:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u4107
opt asmopt_on

	line	18
;SWI2C.C: 18: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_Init+0)+0,f
u4117:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u4117
opt asmopt_on

	line	19
	
l2593:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_Init
	__end_of_swI2C_Init:
;; =============== function _swI2C_Init ends ============

	signat	_swI2C_Init,88
	global	_sys_init
psect	text867,local,class=CODE,delta=2
global __ptext867
__ptext867:

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
psect	text867
	file	"sysinit.c"
	line	3
	global	__size_of_sys_init
	__size_of_sys_init	equ	__end_of_sys_init-_sys_init
	
_sys_init:	
	opt	stack 5
; Regs used in _sys_init: [wreg]
	line	21
	
l6692:	
;sysinit.c: 21: OSCCON = 0B01010001;
	movlw	(051h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	22
	
l6694:	
;sysinit.c: 22: _nop();
	nop
	line	28
;sysinit.c: 28: while(HTS==0);
	
l1794:	
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1146/8)^080h,(1146)&7
	goto	u2911
	goto	u2910
u2911:
	goto	l1794
u2910:
	line	30
	
l1797:	
	return
	opt stack 0
GLOBAL	__end_of_sys_init
	__end_of_sys_init:
;; =============== function _sys_init ends ============

	signat	_sys_init,88
	global	_beep
psect	text868,local,class=CODE,delta=2
global __ptext868
__ptext868:

;; *************** function _beep *****************
;; Defined at:
;;		line 162 in file "smartkey.C"
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
psect	text868
	file	"smartkey.C"
	line	162
	global	__size_of_beep
	__size_of_beep	equ	__end_of_beep-_beep
	
_beep:	
	opt	stack 4
; Regs used in _beep: [wreg+status,2+status,0+pclath+cstack]
;beep@delay stored from wreg
	movwf	(beep@delay)
	line	164
	
l6678:	
;smartkey.C: 163: {
;smartkey.C: 164: while(rep--){
	goto	l6690
	
l866:	
	line	165
;smartkey.C: 165: TMR2ON = 1;
	bsf	(146/8),(146)&7
	line	166
	
l6680:	
;smartkey.C: 166: PR2L = 12;
	movlw	(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	167
	
l6682:	
;smartkey.C: 167: delay_x10ms(delay);
	bcf	status, 5	;RP0=0, select bank0
	movf	(beep@delay),w
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	169
	
l6684:	
;smartkey.C: 169: TMR2ON = 0;RA3 =0;
	bcf	(146/8),(146)&7
	
l6686:	
	bcf	(43/8),(43)&7
	line	170
	
l6688:	
;smartkey.C: 170: delay_x10ms(20);
	movlw	014h
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	164
	
l6690:	
	decf	(beep@rep),f
	movf	((beep@rep)),w
	xorlw	0FFh
	skipz
	goto	u2901
	goto	u2900
u2901:
	goto	l866
u2900:
	line	175
	
l868:	
	return
	opt stack 0
GLOBAL	__end_of_beep
	__end_of_beep:
;; =============== function _beep ends ============

	signat	_beep,8312
	global	___awdiv
psect	text869,local,class=CODE,delta=2
global __ptext869
__ptext869:

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
psect	text869
	file	"D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 5
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l6634:	
	clrf	(___awdiv@sign)
	line	10
	
l6636:	
	btfss	(___awdiv@divisor+1),7
	goto	u2831
	goto	u2830
u2831:
	goto	l6642
u2830:
	line	11
	
l6638:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	
l6640:	
	clrf	(___awdiv@sign)
	incf	(___awdiv@sign),f
	line	14
	
l6642:	
	btfss	(___awdiv@dividend+1),7
	goto	u2841
	goto	u2840
u2841:
	goto	l6648
u2840:
	line	15
	
l6644:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l6646:	
	movlw	(01h)
	xorwf	(___awdiv@sign),f
	line	18
	
l6648:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l6650:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2851
	goto	u2850
u2851:
	goto	l6670
u2850:
	line	20
	
l6652:	
	clrf	(___awdiv@counter)
	incf	(___awdiv@counter),f
	line	21
	goto	l6656
	line	22
	
l6654:	
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	line	23
	incf	(___awdiv@counter),f
	line	21
	
l6656:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2861
	goto	u2860
u2861:
	goto	l6654
u2860:
	line	26
	
l6658:	
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	line	27
	
l6660:	
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2875
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2875:
	skipc
	goto	u2871
	goto	u2870
u2871:
	goto	l6666
u2870:
	line	28
	
l6662:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l6664:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	line	31
	
l6666:	
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	line	32
	
l6668:	
	decfsz	(___awdiv@counter),f
	goto	u2881
	goto	u2880
u2881:
	goto	l6658
u2880:
	line	34
	
l6670:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2890
	goto	l6674
u2890:
	line	35
	
l6672:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	line	36
	
l6674:	
	movf	(___awdiv@quotient+1),w
	movwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	movwf	(?___awdiv)
	line	37
	
l4244:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	_int_init
psect	text870,local,class=CODE,delta=2
global __ptext870
__ptext870:

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
psect	text870
	file	"sysinit.c"
	line	83
	global	__size_of_int_init
	__size_of_int_init	equ	__end_of_int_init-_int_init
	
_int_init:	
	opt	stack 5
; Regs used in _int_init: [wreg+status,2]
	line	88
	
l6602:	
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
	
l6604:	
;sysinit.c: 92: IOCA5 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1205/8)^080h,(1205)&7
	line	93
	
l6606:	
;sysinit.c: 93: tmp = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	94
	
l6608:	
;sysinit.c: 94: PAIF = 0;
	bcf	(88/8),(88)&7
	line	95
	
l6610:	
;sysinit.c: 95: PAIE = 0;
	bcf	(91/8),(91)&7
	line	98
	
l6612:	
;sysinit.c: 98: INTEDG = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1038/8)^080h,(1038)&7
	line	99
	
l6614:	
;sysinit.c: 99: INTF = 0;
	bcf	(89/8),(89)&7
	line	100
	
l6616:	
;sysinit.c: 100: INTE = 1;
	bsf	(92/8),(92)&7
	line	102
	
l6618:	
;sysinit.c: 102: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(97/8),(97)&7
	line	103
	
l6620:	
;sysinit.c: 103: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	104
	
l6622:	
;sysinit.c: 104: TMR2ON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	110
	
l6624:	
;sysinit.c: 110: T0IF = 0;
	bcf	(90/8),(90)&7
	line	111
	
l6626:	
;sysinit.c: 111: T0IE = 1;
	bsf	(93/8),(93)&7
	line	112
	
l6628:	
;sysinit.c: 112: T0ON = 1;
	bsf	(251/8),(251)&7
	line	114
	
l6630:	
;sysinit.c: 114: PEIE = 1;
	bsf	(94/8),(94)&7
	line	116
	
l6632:	
;sysinit.c: 116: GIE = 1;
	bsf	(95/8),(95)&7
	line	117
	
l1806:	
	return
	opt stack 0
GLOBAL	__end_of_int_init
	__end_of_int_init:
;; =============== function _int_init ends ============

	signat	_int_init,88
	global	_timer_init
psect	text871,local,class=CODE,delta=2
global __ptext871
__ptext871:

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
psect	text871
	file	"sysinit.c"
	line	51
	global	__size_of_timer_init
	__size_of_timer_init	equ	__end_of_timer_init-_timer_init
	
_timer_init:	
	opt	stack 5
; Regs used in _timer_init: [wreg+status,2]
	line	60
	
l6594:	
;sysinit.c: 60: T0CON0 = 0B00000000;
	clrf	(31)	;volatile
	line	61
	
l6596:	
;sysinit.c: 61: OPTION = 0B00000111;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(129)^080h	;volatile
	line	62
	
l6598:	
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
	
l6600:	
;sysinit.c: 68: T2CON0 = 0B00101001;
	movlw	(029h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	80
	
l1803:	
	return
	opt stack 0
GLOBAL	__end_of_timer_init
	__end_of_timer_init:
;; =============== function _timer_init ends ============

	signat	_timer_init,88
	global	_gpio_init
psect	text872,local,class=CODE,delta=2
global __ptext872
__ptext872:

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
psect	text872
	file	"sysinit.c"
	line	32
	global	__size_of_gpio_init
	__size_of_gpio_init	equ	__end_of_gpio_init-_gpio_init
	
_gpio_init:	
	opt	stack 5
; Regs used in _gpio_init: [wreg+status,2]
	line	34
	
l6584:	
;sysinit.c: 34: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	35
	
l6586:	
;sysinit.c: 35: TRISA = 0B00110111;
	movlw	(037h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	36
	
l6588:	
;sysinit.c: 36: WPUA = 0B11000000;
	movlw	(0C0h)
	movwf	(149)^080h	;volatile
	line	38
;sysinit.c: 38: PORTC = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	39
	
l6590:	
;sysinit.c: 39: TRISC = 0B11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	40
	
l6592:	
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
	
l1800:	
	return
	opt stack 0
GLOBAL	__end_of_gpio_init
	__end_of_gpio_init:
;; =============== function _gpio_init ends ============

	signat	_gpio_init,88
	global	_compe
psect	text873,local,class=CODE,delta=2
global __ptext873
__ptext873:

;; *************** function _compe *****************
;; Defined at:
;;		line 208 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  a               1    wreg     char 
;;  b               1    0[BANK0 ] char 
;;  dt              1    1[BANK0 ] char 
;; Auto vars:     Size  Location     Type
;;  a               1    7[BANK0 ] char 
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
;;      Temps:          0       5       0
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
psect	text873
	file	"smartkey.C"
	line	208
	global	__size_of_compe
	__size_of_compe	equ	__end_of_compe-_compe
	
_compe:	
	opt	stack 5
; Regs used in _compe: [wreg]
;compe@a stored from wreg
	line	210
	movwf	(compe@a)
	
l6546:	
;smartkey.C: 210: if(a>b){
	movf	(compe@b),w
	xorlw	80h
	movwf	(??_compe+0)+0
	movf	(compe@a),w
	xorlw	80h
	subwf	(??_compe+0)+0
	skipnc
	goto	u2761
	goto	u2760
u2761:
	goto	l6560
u2760:
	line	211
	
l6548:	
;smartkey.C: 211: if((a-b)<=dt) return 1;
	movf	(compe@b),w
	subwf	(compe@a),w
	movwf	(??_compe+0)+0
	clrf	(??_compe+0)+0+1
	skipc
	decf	1+(??_compe+0)+0,f
	btfsc	(compe@a),7
	decf	((??_compe+0)+0)+1,f
	btfss	(compe@b),7
	goto	u2775o
	incf	((??_compe+0)+0)+1,f
	
u2775o:
	
	bcf	status, 5	;RP0=0, select bank0
	movf	(compe@dt),w
	movwf	(??_compe+2)+0
	clrf	(??_compe+2)+0+1
	btfsc	(??_compe+2)+0,7
	decf	(??_compe+2)+0+1,f
	movf	1+(??_compe+2)+0,w
	xorlw	80h
	movwf	(??_compe+4)+0
	movf	1+(??_compe+0)+0,w
	xorlw	80h
	subwf	(??_compe+4)+0,w
	skipz
	goto	u2785
	movf	0+(??_compe+0)+0,w
	subwf	0+(??_compe+2)+0,w
u2785:

	skipc
	goto	u2781
	goto	u2780
u2781:
	goto	l6556
u2780:
	
l6550:	
	movlw	(01h)
	goto	l888
	line	212
	
l6556:	
;smartkey.C: 212: else return 0;
	movlw	(0)
	goto	l888
	line	214
	
l6560:	
;smartkey.C: 214: else if(a<b){
	movf	(compe@a),w
	xorlw	80h
	movwf	(??_compe+0)+0
	movf	(compe@b),w
	xorlw	80h
	subwf	(??_compe+0)+0
	skipnc
	goto	u2791
	goto	u2790
u2791:
	goto	l6574
u2790:
	line	215
	
l6562:	
;smartkey.C: 215: if((b-a)<=dt) return 1;
	movf	(compe@a),w
	subwf	(compe@b),w
	movwf	(??_compe+0)+0
	clrf	(??_compe+0)+0+1
	skipc
	decf	1+(??_compe+0)+0,f
	btfsc	(compe@b),7
	decf	((??_compe+0)+0)+1,f
	btfss	(compe@a),7
	goto	u2805o
	incf	((??_compe+0)+0)+1,f
	
u2805o:
	
	bcf	status, 5	;RP0=0, select bank0
	movf	(compe@dt),w
	movwf	(??_compe+2)+0
	clrf	(??_compe+2)+0+1
	btfsc	(??_compe+2)+0,7
	decf	(??_compe+2)+0+1,f
	movf	1+(??_compe+2)+0,w
	xorlw	80h
	movwf	(??_compe+4)+0
	movf	1+(??_compe+0)+0,w
	xorlw	80h
	subwf	(??_compe+4)+0,w
	skipz
	goto	u2815
	movf	0+(??_compe+0)+0,w
	subwf	0+(??_compe+2)+0,w
u2815:

	skipc
	goto	u2811
	goto	u2810
u2811:
	goto	l6556
u2810:
	goto	l6550
	line	218
	
l6574:	
;smartkey.C: 218: else if(a==b){
	movf	(compe@a),w
	xorwf	(compe@b),w
	skipz
	goto	u2821
	goto	u2820
u2821:
	goto	l6556
u2820:
	goto	l6550
	line	222
	
l888:	
	return
	opt stack 0
GLOBAL	__end_of_compe
	__end_of_compe:
;; =============== function _compe ends ============

	signat	_compe,12409
	global	_setState
psect	text874,local,class=CODE,delta=2
global __ptext874
__ptext874:

;; *************** function _setState *****************
;; Defined at:
;;		line 202 in file "smartkey.C"
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
psect	text874
	file	"smartkey.C"
	line	202
	global	__size_of_setState
	__size_of_setState	equ	__end_of_setState-_setState
	
_setState:	
	opt	stack 5
; Regs used in _setState: [wreg+status,2]
;setState@stt stored from wreg
	movwf	(setState@stt)
	line	203
	
l6540:	
;smartkey.C: 203: mtOldState = mtState;
	movf	(_mtState),w
	movwf	(_mtOldState)
	line	204
;smartkey.C: 204: mtState = stt;
	movf	(setState@stt),w
	movwf	(_mtState)
	line	205
	
l6542:	
;smartkey.C: 205: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	206
	
l6544:	
;smartkey.C: 206: timeOut = _tOut;
	movf	(setState@_tOut+1),w
	movwf	(_timeOut+1)
	movf	(setState@_tOut),w
	movwf	(_timeOut)
	line	207
	
l883:	
	return
	opt stack 0
GLOBAL	__end_of_setState
	__end_of_setState:
;; =============== function _setState ends ============

	signat	_setState,8312
	global	_beepOn
psect	text875,local,class=CODE,delta=2
global __ptext875
__ptext875:

;; *************** function _beepOn *****************
;; Defined at:
;;		line 158 in file "smartkey.C"
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
psect	text875
	file	"smartkey.C"
	line	158
	global	__size_of_beepOn
	__size_of_beepOn	equ	__end_of_beepOn-_beepOn
	
_beepOn:	
	opt	stack 5
; Regs used in _beepOn: []
	line	159
	
l6538:	
;smartkey.C: 159: TMR2ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(146/8),(146)&7
	line	160
;smartkey.C: 160: TRISA &= 0xf7;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(3/8),(3)&7	;volatile
	line	161
	
l862:	
	return
	opt stack 0
GLOBAL	__end_of_beepOn
	__end_of_beepOn:
;; =============== function _beepOn ends ============

	signat	_beepOn,88
	global	_beepOff
psect	text876,local,class=CODE,delta=2
global __ptext876
__ptext876:

;; *************** function _beepOff *****************
;; Defined at:
;;		line 155 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 20/0
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
psect	text876
	file	"smartkey.C"
	line	155
	global	__size_of_beepOff
	__size_of_beepOff	equ	__end_of_beepOff-_beepOff
	
_beepOff:	
	opt	stack 5
; Regs used in _beepOff: []
	line	156
	
l6536:	
;smartkey.C: 156: TMR2ON = 0;RA3 =0;TRISA |= 0x08;
	bcf	(146/8),(146)&7
	bcf	(43/8),(43)&7
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(3/8),(3)&7	;volatile
	line	157
	
l859:	
	return
	opt stack 0
GLOBAL	__end_of_beepOff
	__end_of_beepOff:
;; =============== function _beepOff ends ============

	signat	_beepOff,88
	global	_delay_x10ms
psect	text877,local,class=CODE,delta=2
global __ptext877
__ptext877:

;; *************** function _delay_x10ms *****************
;; Defined at:
;;		line 150 in file "smartkey.C"
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
psect	text877
	file	"smartkey.C"
	line	150
	global	__size_of_delay_x10ms
	__size_of_delay_x10ms	equ	__end_of_delay_x10ms-_delay_x10ms
	
_delay_x10ms:	
	opt	stack 5
; Regs used in _delay_x10ms: [wreg]
	line	151
	
l6532:	
;smartkey.C: 151: unsigned int set = t + timeTick;
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
	line	152
;smartkey.C: 152: while(timeTick < set);
	
l6534:	
	movf	(delay_x10ms@set+1),w
	subwf	(_timeTick+1),w
	skipz
	goto	u2755
	movf	(delay_x10ms@set),w
	subwf	(_timeTick),w
u2755:
	skipc
	goto	u2751
	goto	u2750
u2751:
	goto	l6534
u2750:
	line	153
	
l856:	
	return
	opt stack 0
GLOBAL	__end_of_delay_x10ms
	__end_of_delay_x10ms:
;; =============== function _delay_x10ms ends ============

	signat	_delay_x10ms,4216
	global	_WRITE_EEPROM
psect	text878,local,class=CODE,delta=2
global __ptext878
__ptext878:

;; *************** function _WRITE_EEPROM *****************
;; Defined at:
;;		line 189 in file "smartkey.C"
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
psect	text878
	file	"smartkey.C"
	line	189
	global	__size_of_WRITE_EEPROM
	__size_of_WRITE_EEPROM	equ	__end_of_WRITE_EEPROM-_WRITE_EEPROM
	
_WRITE_EEPROM:	
	opt	stack 5
; Regs used in _WRITE_EEPROM: [wreg]
;WRITE_EEPROM@EEAddr stored from wreg
	movwf	(WRITE_EEPROM@EEAddr)
	line	190
	
l6524:	
;smartkey.C: 190: GIE = 0;
	bcf	(95/8),(95)&7
	line	191
;smartkey.C: 191: while(GIE) asm("clrwdt");
	goto	l874
	
l875:	
# 191 "smartkey.C"
clrwdt ;#
psect	text878
	
l874:	
	btfsc	(95/8),(95)&7
	goto	u2731
	goto	u2730
u2731:
	goto	l875
u2730:
	line	192
	
l6526:	
;smartkey.C: 192: EEADR = EEAddr;
	bcf	status, 5	;RP0=0, select bank0
	movf	(WRITE_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	193
;smartkey.C: 193: EEDAT = EEData;
	bcf	status, 5	;RP0=0, select bank0
	movf	(WRITE_EEPROM@EEData),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(154)^080h	;volatile
	line	194
	
l6528:	
;smartkey.C: 194: EEIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(103/8),(103)&7
	line	195
;smartkey.C: 195: EECON1 = 0x34;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(156)^080h	;volatile
	line	196
	
l6530:	
;smartkey.C: 196: WR = 1;
	bsf	(1256/8)^080h,(1256)&7
	line	197
;smartkey.C: 197: while(WR) asm("clrwdt");
	goto	l877
	
l878:	
# 197 "smartkey.C"
clrwdt ;#
psect	text878
	
l877:	
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1256/8)^080h,(1256)&7
	goto	u2741
	goto	u2740
u2741:
	goto	l878
u2740:
	
l879:	
	line	199
;smartkey.C: 199: GIE = 1;
	bsf	(95/8),(95)&7
	line	200
	
l880:	
	return
	opt stack 0
GLOBAL	__end_of_WRITE_EEPROM
	__end_of_WRITE_EEPROM:
;; =============== function _WRITE_EEPROM ends ============

	signat	_WRITE_EEPROM,8312
	global	_READ_EEPROM
psect	text879,local,class=CODE,delta=2
global __ptext879
__ptext879:

;; *************** function _READ_EEPROM *****************
;; Defined at:
;;		line 178 in file "smartkey.C"
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
psect	text879
	file	"smartkey.C"
	line	178
	global	__size_of_READ_EEPROM
	__size_of_READ_EEPROM	equ	__end_of_READ_EEPROM-_READ_EEPROM
	
_READ_EEPROM:	
	opt	stack 5
; Regs used in _READ_EEPROM: [wreg]
;READ_EEPROM@EEAddr stored from wreg
	line	181
	bcf	status, 5	;RP0=0, select bank0
	movwf	(READ_EEPROM@EEAddr)
	
l6516:	
;smartkey.C: 179: unsigned char ReEepromData;
;smartkey.C: 181: EEADR = EEAddr;
	movf	(READ_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	182
	
l6518:	
;smartkey.C: 182: RD = 1;
	bsf	(1248/8)^080h,(1248)&7
	line	183
;smartkey.C: 183: ReEepromData = EEDAT;
	movf	(154)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	(READ_EEPROM@ReEepromData)
	line	184
	
l6520:	
;smartkey.C: 184: RD = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1248/8)^080h,(1248)&7
	line	185
;smartkey.C: 185: return ReEepromData;
	bcf	status, 5	;RP0=0, select bank0
	movf	(READ_EEPROM@ReEepromData),w
	line	186
	
l871:	
	return
	opt stack 0
GLOBAL	__end_of_READ_EEPROM
	__end_of_READ_EEPROM:
;; =============== function _READ_EEPROM ends ============

	signat	_READ_EEPROM,4217
	global	_ISR
psect	text880,local,class=CODE,delta=2
global __ptext880
__ptext880:

;; *************** function _ISR *****************
;; Defined at:
;;		line 37 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tmp             1    4[COMMON] unsigned char 
;;  tmp             1    0        unsigned char 
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
psect	text880
	file	"smartkey.C"
	line	37
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
psect	text880
	line	41
	
i1l5516:	
;smartkey.C: 41: if(PAIE&&PAIF){
	btfss	(91/8),(91)&7
	goto	u138_21
	goto	u138_20
u138_21:
	goto	i1l5534
u138_20:
	
i1l5518:	
	btfss	(88/8),(88)&7
	goto	u139_21
	goto	u139_20
u139_21:
	goto	i1l5534
u139_20:
	line	42
	
i1l5520:	
;smartkey.C: 42: tmp = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	43
	
i1l5522:	
;smartkey.C: 43: PAIF = 0;
	bcf	(88/8),(88)&7
	line	45
	
i1l5524:	
;smartkey.C: 45: if(RA5){
	btfss	(45/8),(45)&7
	goto	u140_21
	goto	u140_20
u140_21:
	goto	i1l5532
u140_20:
	line	47
	
i1l5526:	
;smartkey.C: 47: if(mode_chek == 0){
	movf	(_mode_chek),f
	skipz
	goto	u141_21
	goto	u141_20
u141_21:
	goto	i1l5534
u141_20:
	line	48
	
i1l5528:	
;smartkey.C: 48: cntCyc = 0;
	clrf	(_cntCyc)
	line	49
;smartkey.C: 49: cntOff = 0;
	clrf	(_cntOff)
	line	51
	
i1l5530:	
;smartkey.C: 51: mode_chek = 1;
	clrf	(_mode_chek)
	incf	(_mode_chek),f
	goto	i1l5534
	line	57
	
i1l5532:	
;smartkey.C: 56: else{
;smartkey.C: 57: cntOff = 0;
	clrf	(_cntOff)
	line	62
	
i1l5534:	
;smartkey.C: 59: }
;smartkey.C: 60: }
;smartkey.C: 62: if(INTE&&INTF){
	btfss	(92/8),(92)&7
	goto	u142_21
	goto	u142_20
u142_21:
	goto	i1l829
u142_20:
	
i1l5536:	
	btfss	(89/8),(89)&7
	goto	u143_21
	goto	u143_20
u143_21:
	goto	i1l829
u143_20:
	line	64
	
i1l5538:	
;smartkey.C: 63: unsigned char tmp;
;smartkey.C: 64: INTF = 0;
	bcf	(89/8),(89)&7
	line	66
;smartkey.C: 66: if( RA2==0){
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(42/8),(42)&7
	goto	u144_21
	goto	u144_20
u144_21:
	goto	i1l829
u144_20:
	line	68
	
i1l5540:	
;smartkey.C: 68: if(timeTick <0x20){
	movlw	high(020h)
	subwf	(_timeTick+1),w
	movlw	low(020h)
	skipnz
	subwf	(_timeTick),w
	skipnc
	goto	u145_21
	goto	u145_20
u145_21:
	goto	i1l831
u145_20:
	line	69
	
i1l5542:	
;smartkey.C: 69: tmp = READ_EEPROM(0x3F);
	movlw	(03Fh)
	fcall	i1_READ_EEPROM
	movwf	(ISR@tmp_1138)
	line	70
	
i1l5544:	
;smartkey.C: 70: WRITE_EEPROM(0x3F,tmp+1);
	incf	(ISR@tmp_1138),w
	movwf	(?i1_WRITE_EEPROM)
	movlw	(03Fh)
	fcall	i1_WRITE_EEPROM
	line	73
	
i1l831:	
	goto	i1l831
	line	81
	
i1l829:	
	line	84
;smartkey.C: 79: }
;smartkey.C: 81: }
;smartkey.C: 84: if (T0IE && T0IF) {
	btfss	(93/8),(93)&7
	goto	u146_21
	goto	u146_20
u146_21:
	goto	i1l5592
u146_20:
	
i1l5546:	
	btfss	(90/8),(90)&7
	goto	u147_21
	goto	u147_20
u147_21:
	goto	i1l5592
u147_20:
	line	85
	
i1l5548:	
;smartkey.C: 85: T0IF = 0;
	bcf	(90/8),(90)&7
	line	86
	
i1l5550:	
;smartkey.C: 86: TMR0 = 179;
	movlw	(0B3h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	92
;smartkey.C: 92: if( mode_chek == 1){
	decf	(_mode_chek),w
	skipz
	goto	u148_21
	goto	u148_20
u148_21:
	goto	i1l5572
u148_20:
	line	94
	
i1l5552:	
;smartkey.C: 94: cntCyc++;
	incf	(_cntCyc),f
	line	96
	
i1l5554:	
;smartkey.C: 96: if(RA5==0){
	btfsc	(45/8),(45)&7
	goto	u149_21
	goto	u149_20
u149_21:
	goto	i1l5572
u149_20:
	line	98
	
i1l5556:	
;smartkey.C: 98: cntOff++;
	incf	(_cntOff),f
	line	100
	
i1l5558:	
;smartkey.C: 100: if(cntOff > 15){
	movlw	(010h)
	subwf	(_cntOff),w
	skipc
	goto	u150_21
	goto	u150_20
u150_21:
	goto	i1l5572
u150_20:
	line	102
	
i1l5560:	
;smartkey.C: 102: mode_chek = 0;
	clrf	(_mode_chek)
	line	104
	
i1l5562:	
;smartkey.C: 104: if((cntCyc>15) &&(cntCyc<50)) {
	movlw	(010h)
	subwf	(_cntCyc),w
	skipc
	goto	u151_21
	goto	u151_20
u151_21:
	goto	i1l5568
u151_20:
	
i1l5564:	
	movlw	(032h)
	subwf	(_cntCyc),w
	skipnc
	goto	u152_21
	goto	u152_20
u152_21:
	goto	i1l5568
u152_20:
	line	105
	
i1l5566:	
;smartkey.C: 105: RegStatus |= (0x40);
	bsf	(_RegStatus)+(6/8),(6)&7
	line	106
;smartkey.C: 106: } else if (cntCyc>=50){
	goto	i1l840
	
i1l5568:	
	movlw	(032h)
	subwf	(_cntCyc),w
	skipc
	goto	u153_21
	goto	u153_20
u153_21:
	goto	i1l840
u153_20:
	line	107
	
i1l5570:	
;smartkey.C: 107: RegStatus &= ~(0x40);
	bcf	(_RegStatus)+(6/8),(6)&7
	line	110
	
i1l840:	
;smartkey.C: 108: }
;smartkey.C: 110: RegStatus |= 0x80;
	bsf	(_RegStatus)+(7/8),(7)&7
	line	123
	
i1l5572:	
;smartkey.C: 111: }
;smartkey.C: 112: }
;smartkey.C: 121: }
;smartkey.C: 123: timeTick++;
	incf	(_timeTick),f
	skipnz
	incf	(_timeTick+1),f
	line	125
	
i1l5574:	
;smartkey.C: 125: if((mtState == 4)||(mtState == 3)){
	movf	(_mtState),w
	xorlw	04h
	skipnz
	goto	u154_21
	goto	u154_20
u154_21:
	goto	i1l5578
u154_20:
	
i1l5576:	
	movf	(_mtState),w
	xorlw	03h
	skipz
	goto	u155_21
	goto	u155_20
u155_21:
	goto	i1l5592
u155_20:
	line	126
	
i1l5578:	
;smartkey.C: 126: if(timeTick > cntTmp){
	movf	(_timeTick+1),w
	subwf	(_cntTmp+1),w
	skipz
	goto	u156_25
	movf	(_timeTick),w
	subwf	(_cntTmp),w
u156_25:
	skipnc
	goto	u156_21
	goto	u156_20
u156_21:
	goto	i1l5592
u156_20:
	line	127
	
i1l5580:	
;smartkey.C: 127: cntTmp = timeTick+38;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	movlw	026h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	128
;smartkey.C: 128: if(cntTmp<=timeOut)
	movf	(_cntTmp+1),w
	subwf	(_timeOut+1),w
	skipz
	goto	u157_25
	movf	(_cntTmp),w
	subwf	(_timeOut),w
u157_25:
	skipc
	goto	u157_21
	goto	u157_20
u157_21:
	goto	i1l842
u157_20:
	line	130
	
i1l5582:	
;smartkey.C: 129: {
;smartkey.C: 130: TMR2IE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1121/8)^080h,(1121)&7
	line	132
	
i1l5584:	
;smartkey.C: 132: if (PR2L == 20)
	movf	(145)^080h,w	;volatile
	xorlw	014h
	skipz
	goto	u158_21
	goto	u158_20
u158_21:
	goto	i1l5588
u158_20:
	line	133
	
i1l5586:	
;smartkey.C: 133: PR2L = 25;
	movlw	(019h)
	movwf	(145)^080h	;volatile
	goto	i1l5590
	line	135
	
i1l5588:	
;smartkey.C: 134: else
;smartkey.C: 135: PR2L = 20;
	movlw	(014h)
	movwf	(145)^080h	;volatile
	line	136
	
i1l5590:	
;smartkey.C: 136: TMR2IE = 1;
	bsf	(1121/8)^080h,(1121)&7
	goto	i1l5592
	line	139
	
i1l842:	
	line	143
	
i1l5592:	
;smartkey.C: 137: }
;smartkey.C: 138: }
;smartkey.C: 139: }
;smartkey.C: 140: }
;smartkey.C: 143: if(TMR2IE&&TMR2IF)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1121/8)^080h,(1121)&7
	goto	u159_21
	goto	u159_20
u159_21:
	goto	i1l850
u159_20:
	
i1l5594:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u160_21
	goto	u160_20
u160_21:
	goto	i1l850
u160_20:
	line	145
	
i1l5596:	
;smartkey.C: 144: {
;smartkey.C: 145: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	146
	
i1l5598:	
;smartkey.C: 146: RA3 =~ RA3;
	movlw	1<<((43)&7)
	xorwf	((43)/8),f
	line	148
	
i1l850:	
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
psect	text881,local,class=CODE,delta=2
global __ptext881
__ptext881:

;; *************** function i1_WRITE_EEPROM *****************
;; Defined at:
;;		line 189 in file "smartkey.C"
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
psect	text881
	file	"smartkey.C"
	line	189
	global	__size_ofi1_WRITE_EEPROM
	__size_ofi1_WRITE_EEPROM	equ	__end_ofi1_WRITE_EEPROM-i1_WRITE_EEPROM
	
i1_WRITE_EEPROM:	
	opt	stack 4
; Regs used in i1_WRITE_EEPROM: [wreg]
;i1WRITE_EEPROM@EEAddr stored from wreg
	movwf	(i1WRITE_EEPROM@EEAddr)
	line	190
	
i1l5770:	
;smartkey.C: 190: GIE = 0;
	bcf	(95/8),(95)&7
	line	191
;smartkey.C: 191: while(GIE) asm("clrwdt");
	goto	i1l874
	
i1l875:	
# 191 "smartkey.C"
clrwdt ;#
psect	text881
	
i1l874:	
	btfsc	(95/8),(95)&7
	goto	u178_21
	goto	u178_20
u178_21:
	goto	i1l875
u178_20:
	line	192
	
i1l5772:	
;smartkey.C: 192: EEADR = EEAddr;
	movf	(i1WRITE_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	193
;smartkey.C: 193: EEDAT = EEData;
	movf	(i1WRITE_EEPROM@EEData),w
	movwf	(154)^080h	;volatile
	line	194
	
i1l5774:	
;smartkey.C: 194: EEIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(103/8),(103)&7
	line	195
;smartkey.C: 195: EECON1 = 0x34;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(156)^080h	;volatile
	line	196
	
i1l5776:	
;smartkey.C: 196: WR = 1;
	bsf	(1256/8)^080h,(1256)&7
	line	197
;smartkey.C: 197: while(WR) asm("clrwdt");
	goto	i1l877
	
i1l878:	
# 197 "smartkey.C"
clrwdt ;#
psect	text881
	
i1l877:	
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1256/8)^080h,(1256)&7
	goto	u179_21
	goto	u179_20
u179_21:
	goto	i1l878
u179_20:
	
i1l879:	
	line	199
;smartkey.C: 199: GIE = 1;
	bsf	(95/8),(95)&7
	line	200
	
i1l880:	
	return
	opt stack 0
GLOBAL	__end_ofi1_WRITE_EEPROM
	__end_ofi1_WRITE_EEPROM:
;; =============== function i1_WRITE_EEPROM ends ============

	signat	i1_WRITE_EEPROM,88
	global	i1_READ_EEPROM
psect	text882,local,class=CODE,delta=2
global __ptext882
__ptext882:

;; *************** function i1_READ_EEPROM *****************
;; Defined at:
;;		line 178 in file "smartkey.C"
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
psect	text882
	file	"smartkey.C"
	line	178
	global	__size_ofi1_READ_EEPROM
	__size_ofi1_READ_EEPROM	equ	__end_ofi1_READ_EEPROM-i1_READ_EEPROM
	
i1_READ_EEPROM:	
	opt	stack 4
; Regs used in i1_READ_EEPROM: [wreg]
;i1READ_EEPROM@EEAddr stored from wreg
	line	181
	movwf	(i1READ_EEPROM@EEAddr)
	
i1l5762:	
;smartkey.C: 179: unsigned char ReEepromData;
;smartkey.C: 181: EEADR = EEAddr;
	movf	(i1READ_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	182
	
i1l5764:	
;smartkey.C: 182: RD = 1;
	bsf	(1248/8)^080h,(1248)&7
	line	183
;smartkey.C: 183: ReEepromData = EEDAT;
	movf	(154)^080h,w	;volatile
	movwf	(i1READ_EEPROM@ReEepromData)
	line	184
	
i1l5766:	
;smartkey.C: 184: RD = 0;
	bcf	(1248/8)^080h,(1248)&7
	line	185
;smartkey.C: 185: return ReEepromData;
	movf	(i1READ_EEPROM@ReEepromData),w
	line	186
	
i1l871:	
	return
	opt stack 0
GLOBAL	__end_ofi1_READ_EEPROM
	__end_ofi1_READ_EEPROM:
;; =============== function i1_READ_EEPROM ends ============

	signat	i1_READ_EEPROM,89
psect	text883,local,class=CODE,delta=2
global __ptext883
__ptext883:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end

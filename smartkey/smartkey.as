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
	FNCALL	_main,_AccWrite
	FNCALL	_main,_beep
	FNCALL	_main,_READ_EEPROM
	FNCALL	_main,_beepOn
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
	global	main@accEna
main@accEna:	; 1 bytes @ 0xF
	ds	1
	global	main@isWait
main@isWait:	; 2 bytes @ 0x10
	ds	2
	global	main@isFall
main@isFall:	; 1 bytes @ 0x12
	ds	1
	global	main@vibrateOn
main@vibrateOn:	; 1 bytes @ 0x13
	ds	1
	global	main@acYOld
main@acYOld:	; 1 bytes @ 0x14
	ds	1
	global	main@acXOld
main@acXOld:	; 1 bytes @ 0x15
	ds	1
	global	main@antenSkip
main@antenSkip:	; 1 bytes @ 0x16
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
;; (0) _main                                                26    26      0    4290
;;                                             12 BANK0     26    26      0
;;                           _sys_init
;;                          _gpio_init
;;                         _timer_init
;;                           _int_init
;;                         _swI2C_Init
;;                           _setState
;;                       _WRITE_EEPROM
;;                           _AccWrite
;;                               _beep
;;                        _READ_EEPROM
;;                             _beepOn
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
;;   _AccWrite
;;     _swI2C_Start
;;     _swI2C_WriteByte
;;     _swI2C_Stop
;;   _beep
;;     _delay_x10ms
;;   _READ_EEPROM
;;   _beepOn
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
;;  isWait          2   16[BANK0 ] unsigned int 
;;  tmp8            1   37[BANK0 ] unsigned char 
;;  isSw            1   34[BANK0 ] unsigned char 
;;  reAlertOn       1   33[BANK0 ] unsigned char 
;;  antenSkip       1   22[BANK0 ] unsigned char 
;;  acXOld          1   21[BANK0 ] char 
;;  acYOld          1   20[BANK0 ] char 
;;  vibrateOn       1   19[BANK0 ] unsigned char 
;;  isFall          1   18[BANK0 ] unsigned char 
;;  accEna          1   15[BANK0 ] unsigned char 
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
;;		_AccWrite
;;		_beep
;;		_READ_EEPROM
;;		_beepOn
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
	
l6793:	
;smartkey.C: 232: unsigned char reAlertOn=0,tmp8,isSw=0,isFall=0,accEna=1,vibrateOn=0,antenSkip=0;
	clrf	(main@reAlertOn)
	clrf	(main@isSw)
	clrf	(main@isFall)
	
l6795:	
	clrf	(main@accEna)
	incf	(main@accEna),f
	clrf	(main@vibrateOn)
	clrf	(main@antenSkip)
	line	233
;smartkey.C: 233: unsigned int isWait =0;
	clrf	(main@isWait)
	clrf	(main@isWait+1)
	line	234
	clrf	(main@acXsum)
	clrf	(main@acXsum+1)
	line	235
;smartkey.C: 235: unsigned int tmp16=0;
	clrf	(main@tmp16)
	clrf	(main@tmp16+1)
	line	239
	
l6797:	
# 239 "smartkey.C"
clrwdt ;#
psect	maintext
	line	241
	
l6799:	
;smartkey.C: 241: sys_init();
	fcall	_sys_init
	line	242
	
l6801:	
;smartkey.C: 242: gpio_init();
	fcall	_gpio_init
	line	243
	
l6803:	
;smartkey.C: 243: timer_init();
	fcall	_timer_init
	line	244
	
l6805:	
;smartkey.C: 244: int_init();
	fcall	_int_init
	line	247
	
l6807:	
;smartkey.C: 247: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3777:
	decfsz	((??_main+0)+0),f
	goto	u3777
	decfsz	((??_main+0)+0+1),f
	goto	u3777
	nop2
opt asmopt_on

	line	249
	
l6809:	
;smartkey.C: 249: PAIE = 1;
	bsf	(91/8),(91)&7
	line	251
	
l6811:	
;smartkey.C: 251: RegStatus = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_RegStatus)
	line	253
	
l6813:	
;smartkey.C: 253: swI2C_Init();
	fcall	_swI2C_Init
	line	256
	
l6815:	
;smartkey.C: 256: setState(0,0);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	258
	
l6817:	
;smartkey.C: 258: WRITE_EEPROM(0xFF,0xAA);
	movlw	(0AAh)
	movwf	(?_WRITE_EEPROM)
	movlw	(0FFh)
	fcall	_WRITE_EEPROM
	line	259
	
l6819:	
;smartkey.C: 259: WRITE_EEPROM(0xFF,0xAA);
	movlw	(0AAh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_WRITE_EEPROM)
	movlw	(0FFh)
	fcall	_WRITE_EEPROM
	line	261
;smartkey.C: 261: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3787:
	decfsz	((??_main+0)+0),f
	goto	u3787
	decfsz	((??_main+0)+0+1),f
	goto	u3787
	nop2
opt asmopt_on

	line	263
;smartkey.C: 263: buf[0] = 0x08;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@buf)
	line	264
;smartkey.C: 264: buf[1] = 0x4d;
	movlw	(04Dh)
	movwf	0+(main@buf)+01h
	line	265
	
l6821:	
;smartkey.C: 265: if((AccWrite(0x10,(unsigned char)buf,2)==0)) {
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
	goto	u3021
	goto	u3020
u3021:
	goto	l6825
u3020:
	goto	l899
	line	270
	
l6825:	
;smartkey.C: 268: else {
;smartkey.C: 270: beep(10,2);
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	271
	
l899:	
	line	274
;smartkey.C: 271: }
;smartkey.C: 274: acXsum = (signed char)READ_EEPROM(0x10);
	movlw	(010h)
	fcall	_READ_EEPROM
	movwf	(main@acXsum)
	clrf	(main@acXsum+1)
	btfsc	(main@acXsum),7
	decf	(main@acXsum+1),f
	line	275
;smartkey.C: 275: acYsum = (signed char)READ_EEPROM(0x11);
	movlw	(011h)
	fcall	_READ_EEPROM
	movwf	(main@acYsum)
	clrf	(main@acYsum+1)
	btfsc	(main@acYsum),7
	decf	(main@acYsum+1),f
	line	277
	
l6827:	
;smartkey.C: 277: tmp8= READ_EEPROM(0x42);
	movlw	(042h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	278
	
l6829:	
;smartkey.C: 278: if(tmp8>1) {WRITE_EEPROM(0x42,0);_delay((unsigned long)((2)*(4000000/4000.0)));}
	movlw	(02h)
	subwf	(main@tmp8),w
	skipc
	goto	u3031
	goto	u3030
u3031:
	goto	l6835
u3030:
	
l6831:	
	clrf	(?_WRITE_EEPROM)
	movlw	(042h)
	fcall	_WRITE_EEPROM
	
l6833:	
	opt asmopt_off
movlw	3
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u3797:
	decfsz	((??_main+0)+0),f
	goto	u3797
	decfsz	((??_main+0)+0+1),f
	goto	u3797
	nop2
opt asmopt_on

	line	279
	
l6835:	
;smartkey.C: 279: tmp8= READ_EEPROM(0x41);
	movlw	(041h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	280
	
l6837:	
;smartkey.C: 280: if(tmp8>1) {WRITE_EEPROM(0x41,0);_delay((unsigned long)((2)*(4000000/4000.0)));}
	movlw	(02h)
	subwf	(main@tmp8),w
	skipc
	goto	u3041
	goto	u3040
u3041:
	goto	l6843
u3040:
	
l6839:	
	clrf	(?_WRITE_EEPROM)
	movlw	(041h)
	fcall	_WRITE_EEPROM
	
l6841:	
	opt asmopt_off
movlw	3
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u3807:
	decfsz	((??_main+0)+0),f
	goto	u3807
	decfsz	((??_main+0)+0+1),f
	goto	u3807
	nop2
opt asmopt_on

	line	284
	
l6843:	
;smartkey.C: 284: tmp8 = READ_EEPROM(0x08);
	movlw	(08h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	285
	
l6845:	
;smartkey.C: 285: if(tmp8==0xff) {WRITE_EEPROM(0x08,0);_delay((unsigned long)((2)*(4000000/4000.0)));}
	movf	(main@tmp8),w
	xorlw	0FFh
	skipz
	goto	u3051
	goto	u3050
u3051:
	goto	l6851
u3050:
	
l6847:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	
l6849:	
	opt asmopt_off
movlw	3
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u3817:
	decfsz	((??_main+0)+0),f
	goto	u3817
	decfsz	((??_main+0)+0+1),f
	goto	u3817
	nop2
opt asmopt_on

	line	286
	
l6851:	
;smartkey.C: 286: if(tmp8==0xcc){
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@tmp8),w
	xorlw	0CCh
	skipz
	goto	u3061
	goto	u3060
u3061:
	goto	l6865
u3060:
	line	287
	
l6853:	
;smartkey.C: 287: RegStatus &=~(0x20);
	bcf	(_RegStatus)+(5/8),(5)&7
	line	288
	
l6855:	
;smartkey.C: 288: setState(3,1800);
	movlw	low(0708h)
	movwf	(?_setState)
	movlw	high(0708h)
	movwf	((?_setState))+1
	movlw	(03h)
	fcall	_setState
	line	289
	
l6857:	
;smartkey.C: 289: mtOldState = 1;
	clrf	(_mtOldState)
	incf	(_mtOldState),f
	line	290
	
l6859:	
;smartkey.C: 290: cntTmp = timeTick+50;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l6861:	
	movlw	032h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	291
	
l6863:	
;smartkey.C: 291: PR2L =12;
	movlw	(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	292
;smartkey.C: 292: beepOn();
	fcall	_beepOn
	line	293
;smartkey.C: 293: } else {
	goto	l6869
	line	294
	
l6865:	
;smartkey.C: 294: setState(2,400);
	movlw	low(0190h)
	movwf	(?_setState)
	movlw	high(0190h)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	295
	
l6867:	
;smartkey.C: 295: mtOldState = 0;
	clrf	(_mtOldState)
	line	298
	
l6869:	
;smartkey.C: 296: }
;smartkey.C: 298: tmp8 = READ_EEPROM(0x3F);
	movlw	(03Fh)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	299
	
l6871:	
;smartkey.C: 299: if(tmp8==5){
	movf	(main@tmp8),w
	xorlw	05h
	skipz
	goto	u3071
	goto	u3070
u3071:
	goto	l6891
u3070:
	line	300
	
l6873:	
;smartkey.C: 300: tmp8 = 0;
	clrf	(main@tmp8)
	line	301
	
l6875:	
;smartkey.C: 301: WRITE_EEPROM(0x3F,0);
	clrf	(?_WRITE_EEPROM)
	movlw	(03Fh)
	fcall	_WRITE_EEPROM
	line	302
;smartkey.C: 302: while( RA2){
	goto	l6889
	line	303
	
l6877:	
;smartkey.C: 303: _delay((unsigned long)((1500)*(4000000/4000.0)));
	opt asmopt_off
movlw  8
movwf	((??_main+0)+0+2),f
movlw	157
movwf	((??_main+0)+0+1),f
	movlw	11
movwf	((??_main+0)+0),f
u3827:
	decfsz	((??_main+0)+0),f
	goto	u3827
	decfsz	((??_main+0)+0+1),f
	goto	u3827
	decfsz	((??_main+0)+0+2),f
	goto	u3827
	nop2
opt asmopt_on

	line	304
	
l6879:	
;smartkey.C: 304: tmp8++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@tmp8),f
	line	305
	
l6881:	
;smartkey.C: 305: if(tmp8 >20){
	movlw	(015h)
	subwf	(main@tmp8),w
	skipc
	goto	u3081
	goto	u3080
u3081:
	goto	l908
u3080:
	line	306
	
l6883:	
;smartkey.C: 306: _delay((unsigned long)((10000)*(4000000/4000.0)));
	opt asmopt_off
movlw  51
movwf	((??_main+0)+0+2),f
movlw	188
movwf	((??_main+0)+0+1),f
	movlw	16
movwf	((??_main+0)+0),f
u3837:
	decfsz	((??_main+0)+0),f
	goto	u3837
	decfsz	((??_main+0)+0+1),f
	goto	u3837
	decfsz	((??_main+0)+0+2),f
	goto	u3837
opt asmopt_on

	line	307
	
l6885:	
;smartkey.C: 307: WRITE_EEPROM(0x40,0);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	line	308
;smartkey.C: 308: }
	goto	l6889
	line	309
	
l908:	
;smartkey.C: 309: else if( RA2){
	btfss	(42/8),(42)&7
	goto	u3091
	goto	u3090
u3091:
	goto	l6889
u3090:
	line	310
	
l6887:	
;smartkey.C: 310: WRITE_EEPROM(0x40,tmp8);
	movf	(main@tmp8),w
	movwf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	line	311
;smartkey.C: 311: beep(10,1);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	302
	
l6889:	
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(42/8),(42)&7
	goto	u3101
	goto	u3100
u3101:
	goto	l6877
u3100:
	line	314
	
l912:	
	btfss	(42/8),(42)&7
	goto	u3111
	goto	u3110
u3111:
	goto	l912
u3110:
	line	319
	
l6891:	
;smartkey.C: 316: }
;smartkey.C: 319: tmp8 = READ_EEPROM(0x40);
	movlw	(040h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	320
;smartkey.C: 320: switch(tmp8){
	goto	l6939
	line	323
	
l6893:	
;smartkey.C: 323: tmp8=0; beep(10,3);
	clrf	(main@tmp8)
	
l6895:	
	movlw	(03h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	324
;smartkey.C: 324: while((tmp8<11)){
	goto	l917
	line	325
	
l6897:	
;smartkey.C: 325: if(AccRead(0x02,(unsigned char)buf,6)==0){
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
	goto	u3121
	goto	u3120
u3121:
	goto	l6905
u3120:
	line	326
	
l6899:	
;smartkey.C: 326: acXsum += buf[1];
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
	line	327
;smartkey.C: 327: acYsum += buf[3];
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
	line	328
;smartkey.C: 328: tmp16 = (signed int)tmp16 + buf[5];
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
	line	329
	
l6901:	
;smartkey.C: 329: tmp8++;
	incf	(main@tmp8),f
	line	332
;smartkey.C: 330: } else
	
l6903:	
;smartkey.C: 332: _delay((unsigned long)((500)*(4000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u3847:
	decfsz	((??_main+0)+0),f
	goto	u3847
	decfsz	((??_main+0)+0+1),f
	goto	u3847
	decfsz	((??_main+0)+0+2),f
	goto	u3847
	nop2
opt asmopt_on

	line	333
	
l917:	
	line	324
	movlw	(0Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@tmp8),w
	skipc
	goto	u3131
	goto	u3130
u3131:
	goto	l6897
u3130:
	line	335
	
l6905:	
;smartkey.C: 333: }
;smartkey.C: 335: if(tmp8==11){
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@tmp8),w
	xorlw	0Bh
	skipz
	goto	u3141
	goto	u3140
u3141:
	goto	l6917
u3140:
	line	336
	
l6907:	
;smartkey.C: 336: acXsum =acXsum/10;
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
	line	337
;smartkey.C: 337: acYsum = acYsum/10;
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
	line	338
;smartkey.C: 338: tmp16 = (signed int)tmp16/10;
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
	line	340
	
l6909:	
;smartkey.C: 340: if(((signed int)tmp16 > (-31)) && ((signed int)tmp16 < 31)){
	movf	(main@tmp16+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(-30))^80h
	subwf	btemp+1,w
	skipz
	goto	u3155
	movlw	low(-30)
	subwf	(main@tmp16),w
u3155:

	skipc
	goto	u3151
	goto	u3150
u3151:
	goto	l6915
u3150:
	
l6911:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@tmp16+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01Fh))^80h
	subwf	btemp+1,w
	skipz
	goto	u3165
	movlw	low(01Fh)
	subwf	(main@tmp16),w
u3165:

	skipnc
	goto	u3161
	goto	u3160
u3161:
	goto	l6915
u3160:
	line	341
	
l6913:	
;smartkey.C: 341: beep(10,4);
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	342
;smartkey.C: 342: }else{
	goto	l6941
	line	344
	
l6915:	
;smartkey.C: 344: WRITE_EEPROM(0x10,(unsigned char)acXsum);
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acXsum),w
	movwf	(?_WRITE_EEPROM)
	movlw	(010h)
	fcall	_WRITE_EEPROM
	line	345
;smartkey.C: 345: WRITE_EEPROM(0x11,(unsigned char)acYsum);
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acYsum),w
	movwf	(?_WRITE_EEPROM)
	movlw	(011h)
	fcall	_WRITE_EEPROM
	line	346
;smartkey.C: 346: beep(10,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	goto	l6941
	line	349
	
l6917:	
;smartkey.C: 349: beep(10,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	goto	l6941
	line	356
	
l6919:	
;smartkey.C: 356: tmp8= READ_EEPROM(0x42);
	movlw	(042h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	357
	
l6921:	
;smartkey.C: 357: if((tmp8==1)||(tmp8==0xff)){
	decf	(main@tmp8),w
	skipnz
	goto	u3171
	goto	u3170
u3171:
	goto	l6925
u3170:
	
l6923:	
	movf	(main@tmp8),w
	xorlw	0FFh
	skipz
	goto	u3181
	goto	u3180
u3181:
	goto	l6927
u3180:
	line	358
	
l6925:	
;smartkey.C: 358: WRITE_EEPROM(0x42,0);
	clrf	(?_WRITE_EEPROM)
	movlw	(042h)
	fcall	_WRITE_EEPROM
	line	359
;smartkey.C: 359: }
	goto	l931
	line	361
	
l6927:	
;smartkey.C: 360: else{
;smartkey.C: 361: WRITE_EEPROM(0x42,0x1);
	clrf	(?_WRITE_EEPROM)
	incf	(?_WRITE_EEPROM),f
	movlw	(042h)
	fcall	_WRITE_EEPROM
	line	362
	
l931:	
	line	363
;smartkey.C: 362: }
;smartkey.C: 363: beep(10,1);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	364
;smartkey.C: 364: break;
	goto	l6941
	line	368
	
l6929:	
;smartkey.C: 368: tmp8= READ_EEPROM(0x41);
	movlw	(041h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	369
	
l6931:	
;smartkey.C: 369: if(tmp8){
	movf	(main@tmp8),w
	skipz
	goto	u3190
	goto	l6935
u3190:
	line	370
	
l6933:	
;smartkey.C: 370: WRITE_EEPROM(0x41,0);
	clrf	(?_WRITE_EEPROM)
	movlw	(041h)
	fcall	_WRITE_EEPROM
	line	371
;smartkey.C: 371: }
	goto	l934
	line	373
	
l6935:	
;smartkey.C: 372: else {
;smartkey.C: 373: WRITE_EEPROM(0x41,0x1);
	clrf	(?_WRITE_EEPROM)
	incf	(?_WRITE_EEPROM),f
	movlw	(041h)
	fcall	_WRITE_EEPROM
	line	374
	
l934:	
	line	375
;smartkey.C: 374: }
;smartkey.C: 375: beep(50,1);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(032h)
	fcall	_beep
	line	376
;smartkey.C: 376: break;
	goto	l6941
	line	320
	
l6939:	
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
	goto	l6893
	xorlw	10^3	; case 10
	skipnz
	goto	l6919
	xorlw	20^10	; case 20
	skipnz
	goto	l6929
	goto	l6941
	opt asmopt_on

	line	380
	
l6941:	
;smartkey.C: 380: tmp8 = READ_EEPROM(0x41);
	movlw	(041h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	381
	
l6943:	
;smartkey.C: 381: if(tmp8==1){
	decf	(main@tmp8),w
	skipz
	goto	u3201
	goto	u3200
u3201:
	goto	l6953
u3200:
	line	382
	
l6945:	
;smartkey.C: 382: RegStatus |=(0x20);
	bsf	(_RegStatus)+(5/8),(5)&7
	line	383
	
l6947:	
;smartkey.C: 383: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	385
	
l6949:	
;smartkey.C: 385: antenSkip =1;
	clrf	(main@antenSkip)
	incf	(main@antenSkip),f
	line	386
	
l6951:	
;smartkey.C: 386: accEna =0;
	clrf	(main@accEna)
	line	390
	
l6953:	
;smartkey.C: 387: }
;smartkey.C: 390: tmp8 = READ_EEPROM(0x42);
	movlw	(042h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	391
	
l6955:	
;smartkey.C: 391: if((tmp8==1)&&(antenSkip ==0)){
	decf	(main@tmp8),w
	skipz
	goto	u3211
	goto	u3210
u3211:
	goto	l6969
u3210:
	
l6957:	
	movf	(main@antenSkip),f
	skipz
	goto	u3221
	goto	u3220
u3221:
	goto	l6969
u3220:
	line	392
	
l6959:	
;smartkey.C: 392: RegStatus |=(0x20);
	bsf	(_RegStatus)+(5/8),(5)&7
	line	393
	
l6961:	
;smartkey.C: 393: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	395
	
l6963:	
;smartkey.C: 395: antenSkip =1;
	clrf	(main@antenSkip)
	incf	(main@antenSkip),f
	line	396
	
l6965:	
;smartkey.C: 396: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l6967:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	397
;smartkey.C: 397: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	400
	
l6969:	
;smartkey.C: 398: }
;smartkey.C: 400: timeTick = 0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	406
	
l6971:	
;smartkey.C: 406: if( antenSkip ==0){
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@antenSkip),f
	skipz
	goto	u3231
	goto	u3230
u3231:
	goto	l7085
u3230:
	line	407
	
l6973:	
;smartkey.C: 407: if((mode_chek == 0) && (antenSkip ==0)){
	movf	(_mode_chek),f
	skipz
	goto	u3241
	goto	u3240
u3241:
	goto	l7085
u3240:
	
l6975:	
	movf	(main@antenSkip),f
	skipz
	goto	u3251
	goto	u3250
u3251:
	goto	l7085
u3250:
	line	408
	
l6977:	
;smartkey.C: 408: if(RegStatus & 0x80){
	btfss	(_RegStatus),(7)&7
	goto	u3261
	goto	u3260
u3261:
	goto	l7085
u3260:
	line	410
	
l6979:	
;smartkey.C: 410: PAIE = 0;
	bcf	(91/8),(91)&7
	line	412
;smartkey.C: 412: RegStatus &= (~0x80);
	bcf	(_RegStatus)+(7/8),(7)&7
	line	416
;smartkey.C: 416: if ((RegStatus & 0x40) !=0){
	btfss	(_RegStatus),(6)&7
	goto	u3271
	goto	u3270
u3271:
	goto	l7083
u3270:
	goto	l7045
	line	420
	
l6983:	
;smartkey.C: 420: lostDetect =0;
	clrf	(_lostDetect)
	line	421
;smartkey.C: 421: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	422
	
l6985:	
;smartkey.C: 422: tmp16 = 40;
	movlw	028h
	movwf	(main@tmp16)
	clrf	(main@tmp16+1)
	line	423
;smartkey.C: 423: break;
	goto	l963
	line	426
	
l6987:	
;smartkey.C: 426: if(timeTick >30){
	movlw	high(01Fh)
	subwf	(_timeTick+1),w
	movlw	low(01Fh)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3281
	goto	u3280
u3281:
	goto	l963
u3280:
	line	427
	
l6989:	
;smartkey.C: 427: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	429
	
l6991:	
;smartkey.C: 429: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u3291
	goto	u3290
u3291:
	goto	l6995
u3290:
	
l6993:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	431
	
l6995:	
;smartkey.C: 431: if((mtOldState == 3)){
	bcf	status, 5	;RP0=0, select bank0
	movf	(_mtOldState),w
	xorlw	03h
	skipz
	goto	u3301
	goto	u3300
u3301:
	goto	l7005
u3300:
	line	432
	
l6997:	
;smartkey.C: 432: beepOn();TMR2ON = 0; beep(10,1);
	fcall	_beepOn
	
l6999:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l7001:	
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	433
;smartkey.C: 433: if(reAlertOn)reAlertOn =0;
	movf	(main@reAlertOn),w
	skipz
	goto	u3310
	goto	l963
u3310:
	
l7003:	
	clrf	(main@reAlertOn)
	goto	l963
	line	435
	
l7005:	
;smartkey.C: 435: else if((mtOldState == 0)||(mtOldState == 4)){
	movf	(_mtOldState),w
	skipz
	goto	u3320
	goto	l953
u3320:
	
l7007:	
	movf	(_mtOldState),w
	xorlw	04h
	skipz
	goto	u3331
	goto	u3330
u3331:
	goto	l7019
u3330:
	
l953:	
	line	436
;smartkey.C: 436: RegStatus |=(0x20);
	bsf	(_RegStatus)+(5/8),(5)&7
	line	437
	
l7009:	
;smartkey.C: 437: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	438
	
l7011:	
;smartkey.C: 438: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
	movlw	(040h)
	fcall	_READ_EEPROM
	xorlw	0
	skipnz
	goto	u3341
	goto	u3340
u3341:
	goto	l7015
u3340:
	
l7013:	
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	line	439
	
l7015:	
;smartkey.C: 439: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l7017:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	440
;smartkey.C: 440: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	441
;smartkey.C: 441: }
	goto	l963
	line	442
	
l7019:	
;smartkey.C: 442: else if((mtOldState == 1)){
	decf	(_mtOldState),w
	skipz
	goto	u3351
	goto	u3350
u3351:
	goto	l963
u3350:
	line	444
	
l7021:	
;smartkey.C: 444: if(reAlertOn)reAlertOn =0;
	movf	(main@reAlertOn),w
	skipz
	goto	u3360
	goto	l946
u3360:
	goto	l7003
	line	446
	
l946:	
	line	447
;smartkey.C: 445: }
;smartkey.C: 446: }
;smartkey.C: 447: break;
	goto	l963
	line	450
	
l7025:	
;smartkey.C: 450: if(timeTick > 200){
	movlw	high(0C9h)
	subwf	(_timeTick+1),w
	movlw	low(0C9h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3371
	goto	u3370
u3371:
	goto	l963
u3370:
	line	452
	
l7027:	
;smartkey.C: 452: beepOff();
	fcall	_beepOff
	line	453
	
l7029:	
;smartkey.C: 453: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u3381
	goto	u3380
u3381:
	goto	l7033
u3380:
	
l7031:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	454
	
l7033:	
;smartkey.C: 454: RegStatus |=(0x20);
	bcf	status, 5	;RP0=0, select bank0
	bsf	(_RegStatus)+(5/8),(5)&7
	line	455
;smartkey.C: 455: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	457
	
l7035:	
;smartkey.C: 457: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l7037:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	goto	l963
	line	463
	
l7039:	
;smartkey.C: 463: beepOff();
	fcall	_beepOff
	line	464
	
l7041:	
;smartkey.C: 464: setState(2,300);
	movlw	low(012Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	465
;smartkey.C: 465: break;
	goto	l963
	line	418
	
l7045:	
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
goto l963
movlw high(S7331)
movwf pclath
	movlw low(S7331)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S7331:
	ljmp	l963
	ljmp	l6983
	ljmp	l6987
	ljmp	l7025
	ljmp	l7039
psect	maintext

	line	480
	
l7047:	
;smartkey.C: 480: if((lostDetect==1) && (timeTick< 1500) &&(timeTick >700))
	decf	(_lostDetect),w
	skipz
	goto	u3391
	goto	u3390
u3391:
	goto	l966
u3390:
	
l7049:	
	movlw	high(05DCh)
	subwf	(_timeTick+1),w
	movlw	low(05DCh)
	skipnz
	subwf	(_timeTick),w
	skipnc
	goto	u3401
	goto	u3400
u3401:
	goto	l966
u3400:
	
l7051:	
	movlw	high(02BDh)
	subwf	(_timeTick+1),w
	movlw	low(02BDh)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3411
	goto	u3410
u3411:
	goto	l966
u3410:
	line	482
	
l7053:	
;smartkey.C: 481: {
;smartkey.C: 482: if(READ_EEPROM(0x08)==0x00) WRITE_EEPROM(0x08,0xcc);
	movlw	(08h)
	fcall	_READ_EEPROM
	iorlw	0
	skipz
	goto	u3421
	goto	u3420
u3421:
	goto	l967
u3420:
	
l7055:	
	movlw	(0CCh)
	movwf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	
l967:	
	line	484
;smartkey.C: 484: setState(3,1800);
	movlw	low(0708h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(0708h)
	movwf	((?_setState))+1
	movlw	(03h)
	fcall	_setState
	line	485
	
l7057:	
;smartkey.C: 485: cntTmp = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l7059:	
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	486
	
l7061:	
;smartkey.C: 486: PR2L =20;
	movlw	(014h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	487
;smartkey.C: 487: beepOn();
	fcall	_beepOn
	line	488
	
l7063:	
;smartkey.C: 488: lostDetect =0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_lostDetect)
	line	489
;smartkey.C: 489: }
	goto	l7065
	line	490
	
l966:	
	line	491
;smartkey.C: 490: else {
;smartkey.C: 491: lostDetect =1;
	clrf	(_lostDetect)
	incf	(_lostDetect),f
	line	495
	
l7065:	
;smartkey.C: 494: }
;smartkey.C: 495: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	goto	l6985
	line	500
	
l7069:	
;smartkey.C: 500: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	501
	
l7071:	
;smartkey.C: 501: beepOn();TMR2ON = 0;
	fcall	_beepOn
	
l7073:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	502
	
l7075:	
;smartkey.C: 502: beep(10,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	503
	
l7077:	
;smartkey.C: 503: if(mtOldState == 3){reAlertOn =1;}
	movf	(_mtOldState),w
	xorlw	03h
	skipz
	goto	u3431
	goto	u3430
u3431:
	goto	l963
u3430:
	
l7079:	
	clrf	(main@reAlertOn)
	incf	(main@reAlertOn),f
	goto	l963
	line	475
	
l7083:	
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
	goto	l7047
	xorlw	2^1	; case 2
	skipnz
	goto	l7069
	goto	l963
	opt asmopt_on

	line	506
	
l963:	
	line	507
;smartkey.C: 506: }
;smartkey.C: 507: PAIE = 1;
	bsf	(91/8),(91)&7
	line	514
	
l7085:	
;smartkey.C: 508: }
;smartkey.C: 510: }
;smartkey.C: 511: }
;smartkey.C: 514: if((timeOut!=0)&&( timeTick >timeOut)){
	movf	(_timeOut+1),w
	iorwf	(_timeOut),w
	skipnz
	goto	u3441
	goto	u3440
u3441:
	goto	l7165
u3440:
	
l7087:	
	movf	(_timeTick+1),w
	subwf	(_timeOut+1),w
	skipz
	goto	u3455
	movf	(_timeTick),w
	subwf	(_timeOut),w
u3455:
	skipnc
	goto	u3451
	goto	u3450
u3451:
	goto	l7165
u3450:
	goto	l7163
	line	525
	
l7091:	
;smartkey.C: 525: beepOff();
	fcall	_beepOff
	line	526
	
l7093:	
;smartkey.C: 526: RegStatus &=(~0x20);
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_RegStatus)+(5/8),(5)&7
	line	527
	
l7095:	
;smartkey.C: 527: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	528
;smartkey.C: 528: break;
	goto	l7165
	line	530
	
l7097:	
;smartkey.C: 530: beepOff();
	fcall	_beepOff
	line	531
	
l7099:	
;smartkey.C: 531: delay_x10ms(20);
	movlw	014h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	532
	
l7101:	
;smartkey.C: 532: beepOn();TMR2ON = 0;reAlertOn =0;
	fcall	_beepOn
	
l7103:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l7105:	
	clrf	(main@reAlertOn)
	line	533
	
l7107:	
;smartkey.C: 533: beep(30,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(01Eh)
	fcall	_beep
	line	534
	
l7109:	
;smartkey.C: 534: vibrateOn=1;
	clrf	(main@vibrateOn)
	incf	(main@vibrateOn),f
	line	535
	
l7111:	
;smartkey.C: 535: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	537
	
l7113:	
;smartkey.C: 537: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l7115:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	538
;smartkey.C: 538: break;
	goto	l7165
	line	541
	
l7117:	
;smartkey.C: 541: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u3461
	goto	u3460
u3461:
	goto	l7121
u3460:
	
l7119:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	543
	
l7121:	
;smartkey.C: 543: if(reAlertOn){
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@reAlertOn),w
	skipz
	goto	u3470
	goto	l7131
u3470:
	line	544
	
l7123:	
;smartkey.C: 544: setState(4,6000);
	movlw	low(01770h)
	movwf	(?_setState)
	movlw	high(01770h)
	movwf	((?_setState))+1
	movlw	(04h)
	fcall	_setState
	line	545
	
l7125:	
;smartkey.C: 545: cntTmp = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l7127:	
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	546
	
l7129:	
;smartkey.C: 546: PR2L =20;
	movlw	(014h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	547
;smartkey.C: 547: beepOn();
	fcall	_beepOn
	line	549
;smartkey.C: 549: }else if(mtOldState == 0){
	goto	l7165
	
l7131:	
	movf	(_mtOldState),f
	skipz
	goto	u3481
	goto	u3480
u3481:
	goto	l7145
u3480:
	line	551
	
l7133:	
;smartkey.C: 551: beep(10,5);
	movlw	(05h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	552
	
l7135:	
;smartkey.C: 552: RegStatus |=(0x20);
	bsf	(_RegStatus)+(5/8),(5)&7
	line	555
	
l7137:	
;smartkey.C: 555: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
	movlw	(040h)
	fcall	_READ_EEPROM
	xorlw	0
	skipnz
	goto	u3491
	goto	u3490
u3491:
	goto	l983
u3490:
	
l7139:	
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	
l983:	
	line	557
;smartkey.C: 557: setState(1,3500);
	movlw	low(0DACh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	goto	l7113
	line	561
	
l7145:	
;smartkey.C: 561: beepOn();TMR2ON = 0;
	fcall	_beepOn
	
l7147:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	562
	
l7149:	
;smartkey.C: 562: reAlertOn =0;
	clrf	(main@reAlertOn)
	line	563
	
l7151:	
;smartkey.C: 563: beep(30,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(01Eh)
	fcall	_beep
	line	564
	
l7153:	
;smartkey.C: 564: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	566
	
l7155:	
;smartkey.C: 566: vibrateOn=1;
	clrf	(main@vibrateOn)
	incf	(main@vibrateOn),f
	goto	l7113
	line	516
	
l7163:	
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
	goto	l7165
	xorlw	2^1	; case 2
	skipnz
	goto	l7117
	xorlw	3^2	; case 3
	skipnz
	goto	l7091
	xorlw	4^3	; case 4
	skipnz
	goto	l7097
	goto	l7165
	opt asmopt_on

	line	573
	
l7165:	
;smartkey.C: 571: }
;smartkey.C: 573: if(accEna ==1){
	bcf	status, 5	;RP0=0, select bank0
	decf	(main@accEna),w
	skipz
	goto	u3501
	goto	u3500
u3501:
	goto	l7279
u3500:
	line	574
	
l7167:	
;smartkey.C: 574: if((timeTick>tmp16) && (mtState == 1) ){
	movf	(_timeTick+1),w
	subwf	(main@tmp16+1),w
	skipz
	goto	u3515
	movf	(_timeTick),w
	subwf	(main@tmp16),w
u3515:
	skipnc
	goto	u3511
	goto	u3510
u3511:
	goto	l7249
u3510:
	
l7169:	
	decf	(_mtState),w
	skipz
	goto	u3521
	goto	u3520
u3521:
	goto	l7249
u3520:
	line	575
	
l7171:	
;smartkey.C: 575: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	576
	
l7173:	
;smartkey.C: 576: if(AccRead(0x02,buf,6)==0){
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
	goto	u3531
	goto	u3530
u3531:
	goto	l7249
u3530:
	line	578
	
l7175:	
;smartkey.C: 578: if(compe(buf[1], (signed char)acXsum,5) && compe(buf[3], (signed char)acYsum,5)){
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acXsum),w
	movwf	(?_compe)
	movlw	(05h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+01h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3541
	goto	u3540
u3541:
	goto	l7205
u3540:
	
l7177:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acYsum),w
	movwf	(?_compe)
	movlw	(05h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+03h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3551
	goto	u3550
u3551:
	goto	l7205
u3550:
	line	580
	
l7179:	
;smartkey.C: 580: isSw++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@isSw),f
	line	581
	
l7181:	
;smartkey.C: 581: if(isSw >44){
	movlw	(02Dh)
	subwf	(main@isSw),w
	skipc
	goto	u3561
	goto	u3560
u3561:
	goto	l7195
u3560:
	line	582
	
l7183:	
;smartkey.C: 582: isSw =0;
	clrf	(main@isSw)
	line	583
	
l7185:	
;smartkey.C: 583: vibrateOn=1;
	clrf	(main@vibrateOn)
	incf	(main@vibrateOn),f
	line	585
	
l7187:	
	
l7189:	
	line	586
	
l7191:	
;smartkey.C: 586: RegStatus &=(~0x20);
	bcf	(_RegStatus)+(5/8),(5)&7
	line	587
	
l7193:	
;smartkey.C: 587: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	589
;smartkey.C: 589: }
	goto	l7227
	line	590
	
l7195:	
;smartkey.C: 590: else if(isSw > 25){
	movlw	(01Ah)
	subwf	(main@isSw),w
	skipc
	goto	u3571
	goto	u3570
u3571:
	goto	l7227
u3570:
	line	591
	
l7197:	
;smartkey.C: 591: if(isSw%2==0){
	btfsc	(main@isSw),(0)&7
	goto	u3581
	goto	u3580
u3581:
	goto	l990
u3580:
	line	592
	
l7199:	
;smartkey.C: 592: beepOn();TMR2ON = 0; beep(7,1);
	fcall	_beepOn
	
l7201:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l7203:	
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(07h)
	fcall	_beep
	goto	l7227
	line	596
	
l990:	
;smartkey.C: 593: }
;smartkey.C: 594: }
;smartkey.C: 596: }
	goto	l7227
	line	599
	
l7205:	
;smartkey.C: 598: else{
;smartkey.C: 599: isSw =0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@isSw)
	line	602
	
l7207:	
;smartkey.C: 602: if(compe(buf[1], acXOld,1) && compe(buf[3], acYOld,1)){
	movf	(main@acXOld),w
	movwf	(?_compe)
	clrf	0+(?_compe)+01h
	incf	0+(?_compe)+01h,f
	movf	0+(main@buf)+01h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3591
	goto	u3590
u3591:
	goto	l7225
u3590:
	
l7209:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acYOld),w
	movwf	(?_compe)
	clrf	0+(?_compe)+01h
	incf	0+(?_compe)+01h,f
	movf	0+(main@buf)+03h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3601
	goto	u3600
u3601:
	goto	l7225
u3600:
	line	603
	
l7211:	
;smartkey.C: 603: isWait++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@isWait),f
	skipnz
	incf	(main@isWait+1),f
	line	604
	
l7213:	
;smartkey.C: 604: if(isWait==450){
	decf	(main@isWait+1),w
	movlw	194
	skipnz
	xorwf	(main@isWait),w

	skipz
	goto	u3611
	goto	u3610
u3611:
	goto	l7227
u3610:
	line	605
	
l7215:	
;smartkey.C: 605: isWait = 0;
	clrf	(main@isWait)
	clrf	(main@isWait+1)
	line	606
	
l7217:	
;smartkey.C: 606: beep(7,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	line	607
	
l7219:	
;smartkey.C: 607: vibrateOn=1;
	clrf	(main@vibrateOn)
	incf	(main@vibrateOn),f
	line	608
	
l7221:	
;smartkey.C: 608: RegStatus &=(~0x20);
	bcf	(_RegStatus)+(5/8),(5)&7
	line	609
	
l7223:	
;smartkey.C: 609: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	goto	l7227
	line	613
	
l7225:	
;smartkey.C: 612: else
;smartkey.C: 613: isWait=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@isWait)
	clrf	(main@isWait+1)
	line	616
	
l7227:	
;smartkey.C: 614: }
;smartkey.C: 616: if( (buf[5] > -31) && (buf[5] < 31)) {
	movf	0+(main@buf)+05h,w
	xorlw	80h
	addlw	-((-30)^80h)
	skipc
	goto	u3621
	goto	u3620
u3621:
	goto	l7243
u3620:
	
l7229:	
	movf	0+(main@buf)+05h,w
	xorlw	80h
	addlw	-((01Fh)^80h)
	skipnc
	goto	u3631
	goto	u3630
u3631:
	goto	l7243
u3630:
	line	617
	
l7231:	
;smartkey.C: 617: isFall++;
	incf	(main@isFall),f
	line	618
	
l7233:	
;smartkey.C: 618: if(isFall >4){
	movlw	(05h)
	subwf	(main@isFall),w
	skipc
	goto	u3641
	goto	u3640
u3641:
	goto	l7245
u3640:
	line	619
	
l7235:	
;smartkey.C: 619: isFall =0;
	clrf	(main@isFall)
	line	620
	
l7237:	
;smartkey.C: 620: beep(7,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	line	621
	
l7239:	
;smartkey.C: 621: RegStatus &=(~0x20);
	bcf	(_RegStatus)+(5/8),(5)&7
	line	622
	
l7241:	
;smartkey.C: 622: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	goto	l7245
	line	626
	
l7243:	
;smartkey.C: 625: else{
;smartkey.C: 626: isFall=0;
	clrf	(main@isFall)
	line	629
	
l7245:	
;smartkey.C: 627: }
;smartkey.C: 629: acYOld = buf[3];acXOld = buf[1];
	movf	0+(main@buf)+03h,w
	movwf	(main@acYOld)
	
l7247:	
	movf	0+(main@buf)+01h,w
	movwf	(main@acXOld)
	line	634
	
l7249:	
;smartkey.C: 630: }
;smartkey.C: 631: }
;smartkey.C: 634: if((timeTick>tmp16) && (mtState == 0 ) ){
	movf	(_timeTick+1),w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@tmp16+1),w
	skipz
	goto	u3655
	movf	(_timeTick),w
	subwf	(main@tmp16),w
u3655:
	skipnc
	goto	u3651
	goto	u3650
u3651:
	goto	l7279
u3650:
	
l7251:	
	movf	(_mtState),f
	skipz
	goto	u3661
	goto	u3660
u3661:
	goto	l7279
u3660:
	line	636
	
l7253:	
;smartkey.C: 636: if(timeTick >65000) timeTick =0;
	movlw	high(0FDE9h)
	subwf	(_timeTick+1),w
	movlw	low(0FDE9h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3671
	goto	u3670
u3671:
	goto	l7257
u3670:
	
l7255:	
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	637
	
l7257:	
;smartkey.C: 637: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l7259:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	639
	
l7261:	
;smartkey.C: 639: if(AccRead(0x02,buf,6)==0){
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
	goto	u3681
	goto	u3680
u3681:
	goto	l7279
u3680:
	line	641
	
l7263:	
;smartkey.C: 641: if(vibrateOn==1){
	bcf	status, 5	;RP0=0, select bank0
	decf	(main@vibrateOn),w
	skipz
	goto	u3691
	goto	u3690
u3691:
	goto	l7279
u3690:
	line	642
	
l7265:	
;smartkey.C: 642: if(compe(buf[1],acXOld ,3) && compe(buf[3],acYOld ,3)){
	movf	(main@acXOld),w
	movwf	(?_compe)
	movlw	(03h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+01h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3701
	goto	u3700
u3701:
	goto	l7271
u3700:
	
l7267:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acYOld),w
	movwf	(?_compe)
	movlw	(03h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+03h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3711
	goto	u3710
u3711:
	goto	l7271
u3710:
	line	644
	
l7269:	
;smartkey.C: 644: isSw=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@isSw)
	line	645
;smartkey.C: 645: }
	goto	l7279
	line	647
	
l7271:	
;smartkey.C: 646: else{
;smartkey.C: 647: isSw++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@isSw),f
	line	650
	
l7273:	
;smartkey.C: 649: {
;smartkey.C: 650: beepOn();TMR2ON = 0; beep(7,3);
	fcall	_beepOn
	
l7275:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l7277:	
	movlw	(03h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	line	659
	
l7279:	
;smartkey.C: 651: }
;smartkey.C: 652: }
;smartkey.C: 653: }
;smartkey.C: 654: }
;smartkey.C: 655: }
;smartkey.C: 657: }
;smartkey.C: 659: if(RegStatus & 0x20) {RC0 =1;RC1 =1;}
	bcf	status, 5	;RP0=0, select bank0
	btfss	(_RegStatus),(5)&7
	goto	u3721
	goto	u3720
u3721:
	goto	l1006
u3720:
	
l7281:	
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	goto	l7283
	line	660
	
l1006:	
;smartkey.C: 660: else {RC0 =0;RC1 =0;}
	bcf	(56/8),(56)&7
	bcf	(57/8),(57)&7
	line	663
	
l7283:	
;smartkey.C: 663: if((timeTick >500)&&(READ_EEPROM(0x3F))) WRITE_EEPROM(0x3F,0);
	movlw	high(01F5h)
	subwf	(_timeTick+1),w
	movlw	low(01F5h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3731
	goto	u3730
u3731:
	goto	l7289
u3730:
	
l7285:	
	movlw	(03Fh)
	fcall	_READ_EEPROM
	xorlw	0
	skipnz
	goto	u3741
	goto	u3740
u3741:
	goto	l7289
u3740:
	
l7287:	
	clrf	(?_WRITE_EEPROM)
	movlw	(03Fh)
	fcall	_WRITE_EEPROM
	line	664
	
l7289:	
;smartkey.C: 664: if((timeTick >500)&&(READ_EEPROM(0x40))) WRITE_EEPROM(0x40,0);
	movlw	high(01F5h)
	subwf	(_timeTick+1),w
	movlw	low(01F5h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3751
	goto	u3750
u3751:
	goto	l6971
u3750:
	
l7291:	
	movlw	(040h)
	fcall	_READ_EEPROM
	xorlw	0
	skipnz
	goto	u3761
	goto	u3760
u3761:
	goto	l6971
u3760:
	
l7293:	
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	goto	l6971
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	666
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
	
l6757:	
;mpu6x.c: 32: unsigned char i;
;mpu6x.c: 34: swI2C_Start();
	fcall	_swI2C_Start
	line	36
;mpu6x.c: 36: if(swI2C_WriteByte(0x18<<1)== 0 )
	movlw	(030h)
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2981
	goto	u2980
u2981:
	goto	l6781
u2980:
	line	38
	
l6759:	
;mpu6x.c: 37: {
;mpu6x.c: 38: if(swI2C_WriteByte(rAdd)==0 )
	movf	(AccRead@rAdd),w
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2991
	goto	u2990
u2991:
	goto	l6785
u2990:
	line	40
	
l6761:	
;mpu6x.c: 39: {
;mpu6x.c: 40: swI2C_Start();
	fcall	_swI2C_Start
	line	41
;mpu6x.c: 41: if(swI2C_WriteByte((0x18<<1)|1)== 0 ){
	movlw	(031h)
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u3001
	goto	u3000
u3001:
	goto	l6781
u3000:
	line	43
	
l6763:	
;mpu6x.c: 43: for(i=0; i<(len-1);i++){
	clrf	(AccRead@i)
	goto	l6769
	line	44
	
l6765:	
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
	
l6767:	
	incf	(AccRead@i),f
	
l6769:	
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
	goto	u3015
	movf	0+(??_AccRead+0)+0,w
	subwf	(AccRead@i),w
u3015:

	skipc
	goto	u3011
	goto	u3010
u3011:
	goto	l6765
u3010:
	line	46
	
l6771:	
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
	
l6773:	
;mpu6x.c: 47: swI2C_Stop();
	fcall	_swI2C_Stop
	line	48
	
l6775:	
;mpu6x.c: 48: return 0;
	movlw	(0)
	goto	l3427
	line	52
	
l6781:	
;mpu6x.c: 51: else
;mpu6x.c: 52: return 1;
	movlw	(01h)
	goto	l3427
	line	55
	
l6785:	
;mpu6x.c: 54: else
;mpu6x.c: 55: return 2;
	movlw	(02h)
	line	59
	
l3427:	
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
	
l6723:	
;mpu6x.c: 5: unsigned char i;
;mpu6x.c: 6: swI2C_Start();
	fcall	_swI2C_Start
	line	8
;mpu6x.c: 8: if(swI2C_WriteByte(0x18<<1)== 0 )
	movlw	(030h)
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2941
	goto	u2940
u2941:
	goto	l6753
u2940:
	line	10
	
l6725:	
;mpu6x.c: 9: {
;mpu6x.c: 10: if(swI2C_WriteByte(rAdd)==0 )
	movf	(AccWrite@rAdd),w
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2951
	goto	u2950
u2951:
	goto	l6749
u2950:
	line	12
	
l6727:	
;mpu6x.c: 11: {
;mpu6x.c: 12: for(i=0; i<len;i++){
	clrf	(AccWrite@i)
	goto	l6739
	line	13
	
l6729:	
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
	goto	u2961
	goto	u2960
u2961:
	goto	l6737
u2960:
	line	14
	
l6731:	
;mpu6x.c: 14: swI2C_Stop();
	fcall	_swI2C_Stop
	line	15
	
l6733:	
;mpu6x.c: 15: return 3;
	movlw	(03h)
	goto	l3415
	line	12
	
l6737:	
	incf	(AccWrite@i),f
	
l6739:	
	movf	(AccWrite@len),w
	subwf	(AccWrite@i),w
	skipc
	goto	u2971
	goto	u2970
u2971:
	goto	l6729
u2970:
	line	18
	
l6741:	
;mpu6x.c: 16: }
;mpu6x.c: 17: }
;mpu6x.c: 18: swI2C_Stop();
	fcall	_swI2C_Stop
	line	19
	
l6743:	
;mpu6x.c: 19: return 0;
	movlw	(0)
	goto	l3415
	line	22
	
l6749:	
;mpu6x.c: 21: else
;mpu6x.c: 22: return 2;
	movlw	(02h)
	goto	l3415
	line	25
	
l6753:	
;mpu6x.c: 24: else
;mpu6x.c: 25: return 1;
	movlw	(01h)
	line	27
	
l3415:	
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
	
l6695:	
	clrf	(swI2C_ReadByte@dat)
	line	115
	
l6697:	
;SWI2C.C: 115: RA7 = 0;
	bcf	(47/8),(47)&7
	line	116
	
l6699:	
;SWI2C.C: 116: TRISA |=0x40;;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(6/8),(6)&7	;volatile
	line	117
	
l6701:	
;SWI2C.C: 117: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_ReadByte+0)+0,f
u3857:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3857
opt asmopt_on

	line	118
	
l6703:	
;SWI2C.C: 118: for(i=0;i<8;i++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(swI2C_ReadByte@i)
	line	119
	
l2615:	
	line	120
;SWI2C.C: 119: {
;SWI2C.C: 120: RA7 = 1;
	bsf	(47/8),(47)&7
	line	121
	
l6707:	
;SWI2C.C: 121: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_ReadByte+0)+0,f
u3867:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3867
opt asmopt_on

	line	122
	
l6709:	
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
	
l6711:	
;SWI2C.C: 125: RA7 = 0;
	bcf	(47/8),(47)&7
	line	126
	
l6713:	
;SWI2C.C: 126: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_ReadByte+0)+0,f
u3877:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3877
opt asmopt_on

	line	118
	
l6715:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(swI2C_ReadByte@i),f
	movlw	(08h)
	subwf	(swI2C_ReadByte@i),w
	skipc
	goto	u2911
	goto	u2910
u2911:
	goto	l2615
u2910:
	
l2616:	
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
	line	132
;SWI2C.C: 132: RA7 = 1;
	bsf	(47/8),(47)&7
	line	133
	
l6717:	
;SWI2C.C: 133: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_ReadByte+0)+0,f
u3887:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3887
opt asmopt_on

	line	134
	
l6719:	
;SWI2C.C: 134: RA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(47/8),(47)&7
	line	135
;SWI2C.C: 135: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_ReadByte+0)+0,f
u3897:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3897
opt asmopt_on

	line	136
;SWI2C.C: 136: return dat;
	bcf	status, 5	;RP0=0, select bank0
	movf	(swI2C_ReadByte@dat),w
	line	137
	
l2617:	
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
	
l6667:	
	line	89
	
l6669:	
;SWI2C.C: 89: TRISA &=0xbf;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(6/8),(6)&7	;volatile
	line	90
	
l6671:	
;SWI2C.C: 90: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_WriteByte+0)+0,f
u3907:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u3907
opt asmopt_on

	line	91
	
l6673:	
;SWI2C.C: 91: for(i=0;i<8;i++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(swI2C_WriteByte@i)
	line	92
	
l2610:	
	line	93
;SWI2C.C: 92: {
;SWI2C.C: 93: RA6 = (dat&0x80) ? 1:0;
	btfsc	(swI2C_WriteByte@dat),(7)&7
	goto	u2881
	goto	u2880
	
u2881:
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	goto	u2894
u2880:
	bcf	status, 5	;RP0=0, select bank0
	bcf	(46/8),(46)&7
u2894:
	line	94
;SWI2C.C: 94: dat<<=1;
	clrc
	rlf	(swI2C_WriteByte@dat),f
	line	95
;SWI2C.C: 95: RA7 = 1;
	bsf	(47/8),(47)&7
	line	96
	
l6677:	
;SWI2C.C: 96: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_WriteByte+0)+0,f
u3917:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u3917
opt asmopt_on

	line	97
	
l6679:	
;SWI2C.C: 97: RA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(47/8),(47)&7
	line	98
;SWI2C.C: 98: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_WriteByte+0)+0,f
u3927:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u3927
opt asmopt_on

	line	91
	
l6681:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(swI2C_WriteByte@i),f
	
l6683:	
	movlw	(08h)
	subwf	(swI2C_WriteByte@i),w
	skipc
	goto	u2901
	goto	u2900
u2901:
	goto	l2610
u2900:
	
l2611:	
	line	101
;SWI2C.C: 99: }
;SWI2C.C: 101: TRISA |=0x40;;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(6/8),(6)&7	;volatile
	line	102
	
l6685:	
;SWI2C.C: 102: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_WriteByte+0)+0,f
u3937:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u3937
opt asmopt_on

	line	103
	
l6687:	
;SWI2C.C: 103: RA7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(47/8),(47)&7
	line	104
;SWI2C.C: 104: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_WriteByte+0)+0,f
u3947:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u3947
opt asmopt_on

	line	105
;SWI2C.C: 105: i= RA6;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(46/8),(46)&7
	movlw	1
	movwf	(swI2C_WriteByte@i)
	line	106
	
l6689:	
;SWI2C.C: 106: RA7 = 0;
	bcf	(47/8),(47)&7
	line	107
	
l6691:	
;SWI2C.C: 107: TRISA &=0xbf;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(6/8),(6)&7	;volatile
	line	108
;SWI2C.C: 108: return i;
	bcf	status, 5	;RP0=0, select bank0
	movf	(swI2C_WriteByte@i),w
	line	109
	
l2612:	
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
	
l6661:	
;SWI2C.C: 37: RA6 = 0;
	bcf	(46/8),(46)&7
	line	38
;SWI2C.C: 38: RA7 = 1;
	bsf	(47/8),(47)&7
	line	39
	
l6663:	
;SWI2C.C: 39: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Stop+0)+0,f
u3957:
decfsz	(??_swI2C_Stop+0)+0,f
	goto	u3957
opt asmopt_on

	line	40
	
l6665:	
;SWI2C.C: 40: RA6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	line	41
;SWI2C.C: 41: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Stop+0)+0,f
u3967:
decfsz	(??_swI2C_Stop+0)+0,f
	goto	u3967
opt asmopt_on

	line	42
	
l2604:	
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
	
l6653:	
;SWI2C.C: 24: RA7 = 1;
	bsf	(47/8),(47)&7
	line	26
;SWI2C.C: 26: RA6 = 1;
	bsf	(46/8),(46)&7
	line	27
	
l6655:	
;SWI2C.C: 27: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Start+0)+0,f
u3977:
decfsz	(??_swI2C_Start+0)+0,f
	goto	u3977
opt asmopt_on

	line	28
	
l6657:	
;SWI2C.C: 28: RA6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(46/8),(46)&7
	line	29
;SWI2C.C: 29: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Start+0)+0,f
u3987:
decfsz	(??_swI2C_Start+0)+0,f
	goto	u3987
opt asmopt_on

	line	30
	
l6659:	
;SWI2C.C: 30: RA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(47/8),(47)&7
	line	31
;SWI2C.C: 31: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Start+0)+0,f
u3997:
decfsz	(??_swI2C_Start+0)+0,f
	goto	u3997
opt asmopt_on

	line	32
	
l2601:	
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
	
l6645:	
;SWI2C.C: 10: TRISA &=0xbf;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(6/8),(6)&7	;volatile
	line	11
;SWI2C.C: 11: TRISA &=0x7f;;
	bcf	(133)^080h+(7/8),(7)&7	;volatile
	line	12
	
l6647:	
;SWI2C.C: 12: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_Init+0)+0,f
u4007:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u4007
opt asmopt_on

	line	13
	
l6649:	
;SWI2C.C: 13: RA7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(47/8),(47)&7
	line	14
	
l6651:	
;SWI2C.C: 14: RA6 = 1;
	bsf	(46/8),(46)&7
	line	15
;SWI2C.C: 15: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Init+0)+0,f
u4017:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u4017
opt asmopt_on

	line	16
;SWI2C.C: 16: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_Init+0)+0,f
u4027:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u4027
opt asmopt_on

	line	17
;SWI2C.C: 17: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_Init+0)+0,f
u4037:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u4037
opt asmopt_on

	line	18
;SWI2C.C: 18: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_Init+0)+0,f
u4047:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u4047
opt asmopt_on

	line	19
	
l2598:	
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
	
l6641:	
;sysinit.c: 21: OSCCON = 0B01010001;
	movlw	(051h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	22
	
l6643:	
;sysinit.c: 22: _nop();
	nop
	line	28
;sysinit.c: 28: while(HTS==0);
	
l1799:	
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1146/8)^080h,(1146)&7
	goto	u2871
	goto	u2870
u2871:
	goto	l1799
u2870:
	line	30
	
l1802:	
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
	
l6627:	
;smartkey.C: 163: {
;smartkey.C: 164: while(rep--){
	goto	l6639
	
l866:	
	line	165
;smartkey.C: 165: TMR2ON = 1;
	bsf	(146/8),(146)&7
	line	166
	
l6629:	
;smartkey.C: 166: PR2L = 12;
	movlw	(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	167
	
l6631:	
;smartkey.C: 167: delay_x10ms(delay);
	bcf	status, 5	;RP0=0, select bank0
	movf	(beep@delay),w
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	169
	
l6633:	
;smartkey.C: 169: TMR2ON = 0;RA3 =0;
	bcf	(146/8),(146)&7
	
l6635:	
	bcf	(43/8),(43)&7
	line	170
	
l6637:	
;smartkey.C: 170: delay_x10ms(20);
	movlw	014h
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	164
	
l6639:	
	decf	(beep@rep),f
	movf	((beep@rep)),w
	xorlw	0FFh
	skipz
	goto	u2861
	goto	u2860
u2861:
	goto	l866
u2860:
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
	
l6583:	
	clrf	(___awdiv@sign)
	line	10
	
l6585:	
	btfss	(___awdiv@divisor+1),7
	goto	u2791
	goto	u2790
u2791:
	goto	l6591
u2790:
	line	11
	
l6587:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	
l6589:	
	clrf	(___awdiv@sign)
	incf	(___awdiv@sign),f
	line	14
	
l6591:	
	btfss	(___awdiv@dividend+1),7
	goto	u2801
	goto	u2800
u2801:
	goto	l6597
u2800:
	line	15
	
l6593:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l6595:	
	movlw	(01h)
	xorwf	(___awdiv@sign),f
	line	18
	
l6597:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l6599:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2811
	goto	u2810
u2811:
	goto	l6619
u2810:
	line	20
	
l6601:	
	clrf	(___awdiv@counter)
	incf	(___awdiv@counter),f
	line	21
	goto	l6605
	line	22
	
l6603:	
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	line	23
	incf	(___awdiv@counter),f
	line	21
	
l6605:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2821
	goto	u2820
u2821:
	goto	l6603
u2820:
	line	26
	
l6607:	
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	line	27
	
l6609:	
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2835
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2835:
	skipc
	goto	u2831
	goto	u2830
u2831:
	goto	l6615
u2830:
	line	28
	
l6611:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l6613:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	line	31
	
l6615:	
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	line	32
	
l6617:	
	decfsz	(___awdiv@counter),f
	goto	u2841
	goto	u2840
u2841:
	goto	l6607
u2840:
	line	34
	
l6619:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2850
	goto	l6623
u2850:
	line	35
	
l6621:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	line	36
	
l6623:	
	movf	(___awdiv@quotient+1),w
	movwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	movwf	(?___awdiv)
	line	37
	
l4249:	
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
	
l6551:	
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
	
l6553:	
;sysinit.c: 92: IOCA5 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1205/8)^080h,(1205)&7
	line	93
	
l6555:	
;sysinit.c: 93: tmp = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	94
	
l6557:	
;sysinit.c: 94: PAIF = 0;
	bcf	(88/8),(88)&7
	line	95
	
l6559:	
;sysinit.c: 95: PAIE = 0;
	bcf	(91/8),(91)&7
	line	98
	
l6561:	
;sysinit.c: 98: INTEDG = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1038/8)^080h,(1038)&7
	line	99
	
l6563:	
;sysinit.c: 99: INTF = 0;
	bcf	(89/8),(89)&7
	line	100
	
l6565:	
;sysinit.c: 100: INTE = 1;
	bsf	(92/8),(92)&7
	line	102
	
l6567:	
;sysinit.c: 102: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(97/8),(97)&7
	line	103
	
l6569:	
;sysinit.c: 103: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	104
	
l6571:	
;sysinit.c: 104: TMR2ON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	110
	
l6573:	
;sysinit.c: 110: T0IF = 0;
	bcf	(90/8),(90)&7
	line	111
	
l6575:	
;sysinit.c: 111: T0IE = 1;
	bsf	(93/8),(93)&7
	line	112
	
l6577:	
;sysinit.c: 112: T0ON = 1;
	bsf	(251/8),(251)&7
	line	114
	
l6579:	
;sysinit.c: 114: PEIE = 1;
	bsf	(94/8),(94)&7
	line	116
	
l6581:	
;sysinit.c: 116: GIE = 1;
	bsf	(95/8),(95)&7
	line	117
	
l1811:	
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
	
l6543:	
;sysinit.c: 60: T0CON0 = 0B00000000;
	clrf	(31)	;volatile
	line	61
	
l6545:	
;sysinit.c: 61: OPTION = 0B00000111;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(129)^080h	;volatile
	line	62
	
l6547:	
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
	
l6549:	
;sysinit.c: 68: T2CON0 = 0B00101001;
	movlw	(029h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	80
	
l1808:	
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
	
l6533:	
;sysinit.c: 34: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	35
	
l6535:	
;sysinit.c: 35: TRISA = 0B00110111;
	movlw	(037h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	36
	
l6537:	
;sysinit.c: 36: WPUA = 0B11000000;
	movlw	(0C0h)
	movwf	(149)^080h	;volatile
	line	38
;sysinit.c: 38: PORTC = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	39
	
l6539:	
;sysinit.c: 39: TRISC = 0B11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	40
	
l6541:	
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
	
l1805:	
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
	
l6495:	
;smartkey.C: 210: if(a>b){
	movf	(compe@b),w
	xorlw	80h
	movwf	(??_compe+0)+0
	movf	(compe@a),w
	xorlw	80h
	subwf	(??_compe+0)+0
	skipnc
	goto	u2721
	goto	u2720
u2721:
	goto	l6509
u2720:
	line	211
	
l6497:	
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
	goto	u2735o
	incf	((??_compe+0)+0)+1,f
	
u2735o:
	
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
	goto	u2745
	movf	0+(??_compe+0)+0,w
	subwf	0+(??_compe+2)+0,w
u2745:

	skipc
	goto	u2741
	goto	u2740
u2741:
	goto	l6505
u2740:
	
l6499:	
	movlw	(01h)
	goto	l888
	line	212
	
l6505:	
;smartkey.C: 212: else return 0;
	movlw	(0)
	goto	l888
	line	214
	
l6509:	
;smartkey.C: 214: else if(a<b){
	movf	(compe@a),w
	xorlw	80h
	movwf	(??_compe+0)+0
	movf	(compe@b),w
	xorlw	80h
	subwf	(??_compe+0)+0
	skipnc
	goto	u2751
	goto	u2750
u2751:
	goto	l6523
u2750:
	line	215
	
l6511:	
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
	goto	u2765o
	incf	((??_compe+0)+0)+1,f
	
u2765o:
	
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
	goto	u2775
	movf	0+(??_compe+0)+0,w
	subwf	0+(??_compe+2)+0,w
u2775:

	skipc
	goto	u2771
	goto	u2770
u2771:
	goto	l6505
u2770:
	goto	l6499
	line	218
	
l6523:	
;smartkey.C: 218: else if(a==b){
	movf	(compe@a),w
	xorwf	(compe@b),w
	skipz
	goto	u2781
	goto	u2780
u2781:
	goto	l6505
u2780:
	goto	l6499
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
	
l6489:	
;smartkey.C: 203: mtOldState = mtState;
	movf	(_mtState),w
	movwf	(_mtOldState)
	line	204
;smartkey.C: 204: mtState = stt;
	movf	(setState@stt),w
	movwf	(_mtState)
	line	205
	
l6491:	
;smartkey.C: 205: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	206
	
l6493:	
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
	
l6487:	
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
	
l6485:	
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
	
l6481:	
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
	
l6483:	
	movf	(delay_x10ms@set+1),w
	subwf	(_timeTick+1),w
	skipz
	goto	u2715
	movf	(delay_x10ms@set),w
	subwf	(_timeTick),w
u2715:
	skipc
	goto	u2711
	goto	u2710
u2711:
	goto	l6483
u2710:
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
	
l6473:	
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
	goto	u2691
	goto	u2690
u2691:
	goto	l875
u2690:
	line	192
	
l6475:	
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
	
l6477:	
;smartkey.C: 194: EEIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(103/8),(103)&7
	line	195
;smartkey.C: 195: EECON1 = 0x34;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(156)^080h	;volatile
	line	196
	
l6479:	
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
	goto	u2701
	goto	u2700
u2701:
	goto	l878
u2700:
	
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
;;		On entry : 0/0
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
	
l6465:	
;smartkey.C: 179: unsigned char ReEepromData;
;smartkey.C: 181: EEADR = EEAddr;
	movf	(READ_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	182
	
l6467:	
;smartkey.C: 182: RD = 1;
	bsf	(1248/8)^080h,(1248)&7
	line	183
;smartkey.C: 183: ReEepromData = EEDAT;
	movf	(154)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	(READ_EEPROM@ReEepromData)
	line	184
	
l6469:	
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
	
i1l5493:	
;smartkey.C: 41: if(PAIE&&PAIF){
	btfss	(91/8),(91)&7
	goto	u136_21
	goto	u136_20
u136_21:
	goto	i1l5511
u136_20:
	
i1l5495:	
	btfss	(88/8),(88)&7
	goto	u137_21
	goto	u137_20
u137_21:
	goto	i1l5511
u137_20:
	line	42
	
i1l5497:	
;smartkey.C: 42: tmp = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	43
	
i1l5499:	
;smartkey.C: 43: PAIF = 0;
	bcf	(88/8),(88)&7
	line	45
	
i1l5501:	
;smartkey.C: 45: if(RA5){
	btfss	(45/8),(45)&7
	goto	u138_21
	goto	u138_20
u138_21:
	goto	i1l5509
u138_20:
	line	47
	
i1l5503:	
;smartkey.C: 47: if(mode_chek == 0){
	movf	(_mode_chek),f
	skipz
	goto	u139_21
	goto	u139_20
u139_21:
	goto	i1l5511
u139_20:
	line	48
	
i1l5505:	
;smartkey.C: 48: cntCyc = 0;
	clrf	(_cntCyc)
	line	49
;smartkey.C: 49: cntOff = 0;
	clrf	(_cntOff)
	line	51
	
i1l5507:	
;smartkey.C: 51: mode_chek = 1;
	clrf	(_mode_chek)
	incf	(_mode_chek),f
	goto	i1l5511
	line	57
	
i1l5509:	
;smartkey.C: 56: else{
;smartkey.C: 57: cntOff = 0;
	clrf	(_cntOff)
	line	62
	
i1l5511:	
;smartkey.C: 59: }
;smartkey.C: 60: }
;smartkey.C: 62: if(INTE&&INTF){
	btfss	(92/8),(92)&7
	goto	u140_21
	goto	u140_20
u140_21:
	goto	i1l829
u140_20:
	
i1l5513:	
	btfss	(89/8),(89)&7
	goto	u141_21
	goto	u141_20
u141_21:
	goto	i1l829
u141_20:
	line	64
	
i1l5515:	
;smartkey.C: 63: unsigned char tmp;
;smartkey.C: 64: INTF = 0;
	bcf	(89/8),(89)&7
	line	66
;smartkey.C: 66: if( RA2==0){
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(42/8),(42)&7
	goto	u142_21
	goto	u142_20
u142_21:
	goto	i1l829
u142_20:
	line	68
	
i1l5517:	
;smartkey.C: 68: if(timeTick <0x20){
	movlw	high(020h)
	subwf	(_timeTick+1),w
	movlw	low(020h)
	skipnz
	subwf	(_timeTick),w
	skipnc
	goto	u143_21
	goto	u143_20
u143_21:
	goto	i1l831
u143_20:
	line	69
	
i1l5519:	
;smartkey.C: 69: tmp = READ_EEPROM(0x3F);
	movlw	(03Fh)
	fcall	i1_READ_EEPROM
	movwf	(ISR@tmp_1138)
	line	70
	
i1l5521:	
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
	goto	u144_21
	goto	u144_20
u144_21:
	goto	i1l5569
u144_20:
	
i1l5523:	
	btfss	(90/8),(90)&7
	goto	u145_21
	goto	u145_20
u145_21:
	goto	i1l5569
u145_20:
	line	85
	
i1l5525:	
;smartkey.C: 85: T0IF = 0;
	bcf	(90/8),(90)&7
	line	86
	
i1l5527:	
;smartkey.C: 86: TMR0 = 179;
	movlw	(0B3h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	92
;smartkey.C: 92: if( mode_chek == 1){
	decf	(_mode_chek),w
	skipz
	goto	u146_21
	goto	u146_20
u146_21:
	goto	i1l5549
u146_20:
	line	94
	
i1l5529:	
;smartkey.C: 94: cntCyc++;
	incf	(_cntCyc),f
	line	96
	
i1l5531:	
;smartkey.C: 96: if(RA5==0){
	btfsc	(45/8),(45)&7
	goto	u147_21
	goto	u147_20
u147_21:
	goto	i1l5549
u147_20:
	line	98
	
i1l5533:	
;smartkey.C: 98: cntOff++;
	incf	(_cntOff),f
	line	100
	
i1l5535:	
;smartkey.C: 100: if(cntOff > 15){
	movlw	(010h)
	subwf	(_cntOff),w
	skipc
	goto	u148_21
	goto	u148_20
u148_21:
	goto	i1l5549
u148_20:
	line	102
	
i1l5537:	
;smartkey.C: 102: mode_chek = 0;
	clrf	(_mode_chek)
	line	104
	
i1l5539:	
;smartkey.C: 104: if((cntCyc>15) &&(cntCyc<50)) {
	movlw	(010h)
	subwf	(_cntCyc),w
	skipc
	goto	u149_21
	goto	u149_20
u149_21:
	goto	i1l5545
u149_20:
	
i1l5541:	
	movlw	(032h)
	subwf	(_cntCyc),w
	skipnc
	goto	u150_21
	goto	u150_20
u150_21:
	goto	i1l5545
u150_20:
	line	105
	
i1l5543:	
;smartkey.C: 105: RegStatus |= (0x40);
	bsf	(_RegStatus)+(6/8),(6)&7
	line	106
;smartkey.C: 106: } else if (cntCyc>=50){
	goto	i1l840
	
i1l5545:	
	movlw	(032h)
	subwf	(_cntCyc),w
	skipc
	goto	u151_21
	goto	u151_20
u151_21:
	goto	i1l840
u151_20:
	line	107
	
i1l5547:	
;smartkey.C: 107: RegStatus &= ~(0x40);
	bcf	(_RegStatus)+(6/8),(6)&7
	line	110
	
i1l840:	
;smartkey.C: 108: }
;smartkey.C: 110: RegStatus |= 0x80;
	bsf	(_RegStatus)+(7/8),(7)&7
	line	123
	
i1l5549:	
;smartkey.C: 111: }
;smartkey.C: 112: }
;smartkey.C: 121: }
;smartkey.C: 123: timeTick++;
	incf	(_timeTick),f
	skipnz
	incf	(_timeTick+1),f
	line	125
	
i1l5551:	
;smartkey.C: 125: if((mtState == 4)||(mtState == 3)){
	movf	(_mtState),w
	xorlw	04h
	skipnz
	goto	u152_21
	goto	u152_20
u152_21:
	goto	i1l5555
u152_20:
	
i1l5553:	
	movf	(_mtState),w
	xorlw	03h
	skipz
	goto	u153_21
	goto	u153_20
u153_21:
	goto	i1l5569
u153_20:
	line	126
	
i1l5555:	
;smartkey.C: 126: if(timeTick > cntTmp){
	movf	(_timeTick+1),w
	subwf	(_cntTmp+1),w
	skipz
	goto	u154_25
	movf	(_timeTick),w
	subwf	(_cntTmp),w
u154_25:
	skipnc
	goto	u154_21
	goto	u154_20
u154_21:
	goto	i1l5569
u154_20:
	line	127
	
i1l5557:	
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
	goto	u155_25
	movf	(_cntTmp),w
	subwf	(_timeOut),w
u155_25:
	skipc
	goto	u155_21
	goto	u155_20
u155_21:
	goto	i1l842
u155_20:
	line	130
	
i1l5559:	
;smartkey.C: 129: {
;smartkey.C: 130: TMR2IE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1121/8)^080h,(1121)&7
	line	132
	
i1l5561:	
;smartkey.C: 132: if (PR2L == 20)
	movf	(145)^080h,w	;volatile
	xorlw	014h
	skipz
	goto	u156_21
	goto	u156_20
u156_21:
	goto	i1l5565
u156_20:
	line	133
	
i1l5563:	
;smartkey.C: 133: PR2L = 25;
	movlw	(019h)
	movwf	(145)^080h	;volatile
	goto	i1l5567
	line	135
	
i1l5565:	
;smartkey.C: 134: else
;smartkey.C: 135: PR2L = 20;
	movlw	(014h)
	movwf	(145)^080h	;volatile
	line	136
	
i1l5567:	
;smartkey.C: 136: TMR2IE = 1;
	bsf	(1121/8)^080h,(1121)&7
	goto	i1l5569
	line	139
	
i1l842:	
	line	143
	
i1l5569:	
;smartkey.C: 137: }
;smartkey.C: 138: }
;smartkey.C: 139: }
;smartkey.C: 140: }
;smartkey.C: 143: if(TMR2IE&&TMR2IF)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1121/8)^080h,(1121)&7
	goto	u157_21
	goto	u157_20
u157_21:
	goto	i1l850
u157_20:
	
i1l5571:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u158_21
	goto	u158_20
u158_21:
	goto	i1l850
u158_20:
	line	145
	
i1l5573:	
;smartkey.C: 144: {
;smartkey.C: 145: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	146
	
i1l5575:	
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
	
i1l5747:	
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
	goto	u176_21
	goto	u176_20
u176_21:
	goto	i1l875
u176_20:
	line	192
	
i1l5749:	
;smartkey.C: 192: EEADR = EEAddr;
	movf	(i1WRITE_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	193
;smartkey.C: 193: EEDAT = EEData;
	movf	(i1WRITE_EEPROM@EEData),w
	movwf	(154)^080h	;volatile
	line	194
	
i1l5751:	
;smartkey.C: 194: EEIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(103/8),(103)&7
	line	195
;smartkey.C: 195: EECON1 = 0x34;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(156)^080h	;volatile
	line	196
	
i1l5753:	
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
	goto	u177_21
	goto	u177_20
u177_21:
	goto	i1l878
u177_20:
	
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
	
i1l5739:	
;smartkey.C: 179: unsigned char ReEepromData;
;smartkey.C: 181: EEADR = EEAddr;
	movf	(i1READ_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	182
	
i1l5741:	
;smartkey.C: 182: RD = 1;
	bsf	(1248/8)^080h,(1248)&7
	line	183
;smartkey.C: 183: ReEepromData = EEDAT;
	movf	(154)^080h,w	;volatile
	movwf	(i1READ_EEPROM@ReEepromData)
	line	184
	
i1l5743:	
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

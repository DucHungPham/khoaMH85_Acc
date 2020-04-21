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
	global	_cntOff
	global	_mtOldState
	global	_timeTick
	global	_RegStatus
	global	_cntCyc
	global	_mtState
	global	_ANSEL
psect	text871,local,class=CODE,delta=2
global __ptext871
__ptext871:
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
	global	main@lostDetect
main@lostDetect:	; 1 bytes @ 0x12
	ds	1
	global	main@acYOld
main@acYOld:	; 1 bytes @ 0x13
	ds	1
	global	main@acXOld
main@acXOld:	; 1 bytes @ 0x14
	ds	1
	global	main@acYsum
main@acYsum:	; 2 bytes @ 0x15
	ds	2
	global	main@acXsum
main@acXsum:	; 2 bytes @ 0x17
	ds	2
	global	main@buf
main@buf:	; 6 bytes @ 0x19
	ds	6
	global	main@isSw
main@isSw:	; 1 bytes @ 0x1F
	ds	1
	global	main@tmp16
main@tmp16:	; 2 bytes @ 0x20
	ds	2
	global	main@tmp8
main@tmp8:	; 1 bytes @ 0x22
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 11, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5      10
;; BANK0           80     35      41
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
;; (0) _main                                                23    23      0    4105
;;                                             12 BANK0     23    23      0
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
;;BANK0               50     23      29       4       51.3%
;;BANK1               20      0       0       5        0.0%
;;ABS                  0      0      33       6        0.0%
;;BITBANK1            20      0       0       7        0.0%
;;DATA                 0      0      39       8        0.0%

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
;;  buf             6   25[BANK0 ] char [6]
;;  tmp16           2   32[BANK0 ] unsigned int 
;;  acXsum          2   23[BANK0 ] int 
;;  acYsum          2   21[BANK0 ] int 
;;  isWait          2   15[BANK0 ] unsigned int 
;;  tmp8            1   34[BANK0 ] unsigned char 
;;  isSw            1   31[BANK0 ] unsigned char 
;;  acXOld          1   20[BANK0 ] char 
;;  acYOld          1   19[BANK0 ] char 
;;  lostDetect      1   18[BANK0 ] unsigned char 
;;  isFall          1   17[BANK0 ] unsigned char 
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
	line	206
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	208
	
l6765:	
;smartkey.C: 208: unsigned char tmp8, isSw = 0, isFall = 0, lostDetect = 0;
	clrf	(main@isSw)
	clrf	(main@isFall)
	clrf	(main@lostDetect)
	line	209
;smartkey.C: 209: unsigned int isWait = 0;
	clrf	(main@isWait)
	clrf	(main@isWait+1)
	line	210
	clrf	(main@acXsum)
	clrf	(main@acXsum+1)
	line	211
;smartkey.C: 211: unsigned int tmp16 = 0;
	clrf	(main@tmp16)
	clrf	(main@tmp16+1)
	line	215
;smartkey.C: 212: signed char acYOld, acXOld;
;smartkey.C: 213: signed char buf[6];
;smartkey.C: 215: RegStatus.byte =0;
	clrf	(_RegStatus)
	line	216
	
l6767:	
;smartkey.C: 216: RegStatus.bits.b6 = 1;
	bsf	(_RegStatus),6
	line	218
	
l6769:	
# 218 "smartkey.C"
clrwdt ;#
psect	maintext
	line	220
	
l6771:	
;smartkey.C: 220: sys_init();
	fcall	_sys_init
	line	221
	
l6773:	
;smartkey.C: 221: gpio_init();
	fcall	_gpio_init
	line	222
	
l6775:	
;smartkey.C: 222: timer_init();
	fcall	_timer_init
	line	223
	
l6777:	
;smartkey.C: 223: int_init();
	fcall	_int_init
	line	226
	
l6779:	
;smartkey.C: 226: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3687:
	decfsz	((??_main+0)+0),f
	goto	u3687
	decfsz	((??_main+0)+0+1),f
	goto	u3687
	nop2
opt asmopt_on

	line	228
	
l6781:	
;smartkey.C: 228: PAIE = 1;
	bsf	(91/8),(91)&7
	line	230
	
l6783:	
;smartkey.C: 230: swI2C_Init();
	fcall	_swI2C_Init
	line	232
	
l6785:	
;smartkey.C: 232: setState(0, 0);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	234
	
l6787:	
;smartkey.C: 234: WRITE_EEPROM(0xFF, 0xAA);
	movlw	(0AAh)
	movwf	(?_WRITE_EEPROM)
	movlw	(0FFh)
	fcall	_WRITE_EEPROM
	line	235
	
l6789:	
;smartkey.C: 235: WRITE_EEPROM(0xFF, 0xAA);
	movlw	(0AAh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_WRITE_EEPROM)
	movlw	(0FFh)
	fcall	_WRITE_EEPROM
	line	237
	
l6791:	
;smartkey.C: 237: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3697:
	decfsz	((??_main+0)+0),f
	goto	u3697
	decfsz	((??_main+0)+0+1),f
	goto	u3697
	nop2
opt asmopt_on

	line	239
	
l6793:	
;smartkey.C: 239: buf[0] = 0x08;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@buf)
	line	240
	
l6795:	
;smartkey.C: 240: buf[1] = 0x4d;
	movlw	(04Dh)
	movwf	0+(main@buf)+01h
	line	241
	
l6797:	
;smartkey.C: 241: if ((AccWrite(0x10, (unsigned char)buf, 2) == 0)) {
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
	goto	u2961
	goto	u2960
u2961:
	goto	l6801
u2960:
	goto	l895
	line	246
	
l6801:	
;smartkey.C: 244: else {
;smartkey.C: 246: beep(10, 2);
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	247
	
l895:	
	line	250
;smartkey.C: 247: }
;smartkey.C: 250: acXsum = (signed char)READ_EEPROM(0x10);
	movlw	(010h)
	fcall	_READ_EEPROM
	movwf	(main@acXsum)
	clrf	(main@acXsum+1)
	btfsc	(main@acXsum),7
	decf	(main@acXsum+1),f
	line	251
;smartkey.C: 251: acYsum = (signed char)READ_EEPROM(0x11);
	movlw	(011h)
	fcall	_READ_EEPROM
	movwf	(main@acYsum)
	clrf	(main@acYsum+1)
	btfsc	(main@acYsum),7
	decf	(main@acYsum+1),f
	line	253
	
l6803:	
;smartkey.C: 253: tmp8 = READ_EEPROM(0x41);
	movlw	(041h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	254
	
l6805:	
;smartkey.C: 254: if (tmp8 > 3) {WRITE_EEPROM(0x41, 0); _delay((unsigned long)((2)*(4000000/4000.0)));}
	movlw	(04h)
	subwf	(main@tmp8),w
	skipc
	goto	u2971
	goto	u2970
u2971:
	goto	l6811
u2970:
	
l6807:	
	clrf	(?_WRITE_EEPROM)
	movlw	(041h)
	fcall	_WRITE_EEPROM
	
l6809:	
	opt asmopt_off
movlw	3
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u3707:
	decfsz	((??_main+0)+0),f
	goto	u3707
	decfsz	((??_main+0)+0+1),f
	goto	u3707
	nop2
opt asmopt_on

	line	258
	
l6811:	
;smartkey.C: 258: tmp8 = READ_EEPROM(0x08);
	movlw	(08h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	259
	
l6813:	
;smartkey.C: 259: if (tmp8 == 0xff) {WRITE_EEPROM(0x08, 0); _delay((unsigned long)((2)*(4000000/4000.0)));}
	movf	(main@tmp8),w
	xorlw	0FFh
	skipz
	goto	u2981
	goto	u2980
u2981:
	goto	l6819
u2980:
	
l6815:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	
l6817:	
	opt asmopt_off
movlw	3
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u3717:
	decfsz	((??_main+0)+0),f
	goto	u3717
	decfsz	((??_main+0)+0+1),f
	goto	u3717
	nop2
opt asmopt_on

	line	260
	
l6819:	
;smartkey.C: 260: if (tmp8 == 0xcc) {
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@tmp8),w
	xorlw	0CCh
	skipz
	goto	u2991
	goto	u2990
u2991:
	goto	l6833
u2990:
	line	261
	
l6821:	
;smartkey.C: 261: RegStatus.bits.b0 = 0;
	bcf	(_RegStatus),0
	line	262
	
l6823:	
;smartkey.C: 262: setState(3, 1800);
	movlw	low(0708h)
	movwf	(?_setState)
	movlw	high(0708h)
	movwf	((?_setState))+1
	movlw	(03h)
	fcall	_setState
	line	263
	
l6825:	
;smartkey.C: 263: mtOldState = 1;
	clrf	(_mtOldState)
	incf	(_mtOldState),f
	line	264
	
l6827:	
;smartkey.C: 264: cntTmp = timeTick + 50;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l6829:	
	movlw	032h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	265
	
l6831:	
;smartkey.C: 265: PR2L = 12;
	movlw	(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	266
;smartkey.C: 266: beepOn();
	fcall	_beepOn
	line	267
;smartkey.C: 267: } else {
	goto	l6837
	line	268
	
l6833:	
;smartkey.C: 268: setState(2, 400);
	movlw	low(0190h)
	movwf	(?_setState)
	movlw	high(0190h)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	269
	
l6835:	
;smartkey.C: 269: mtOldState = 0;
	clrf	(_mtOldState)
	line	272
	
l6837:	
;smartkey.C: 270: }
;smartkey.C: 272: tmp8 = READ_EEPROM(0x3F);
	movlw	(03Fh)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	273
	
l6839:	
;smartkey.C: 273: if (tmp8 == 5) {
	movf	(main@tmp8),w
	xorlw	05h
	skipz
	goto	u3001
	goto	u3000
u3001:
	goto	l6859
u3000:
	line	274
	
l6841:	
;smartkey.C: 274: tmp8 = 0;
	clrf	(main@tmp8)
	line	275
	
l6843:	
;smartkey.C: 275: WRITE_EEPROM(0x3F, 0);
	clrf	(?_WRITE_EEPROM)
	movlw	(03Fh)
	fcall	_WRITE_EEPROM
	line	276
;smartkey.C: 276: while ( RA2) {
	goto	l6857
	line	277
	
l6845:	
;smartkey.C: 277: _delay((unsigned long)((1500)*(4000000/4000.0)));
	opt asmopt_off
movlw  8
movwf	((??_main+0)+0+2),f
movlw	157
movwf	((??_main+0)+0+1),f
	movlw	11
movwf	((??_main+0)+0),f
u3727:
	decfsz	((??_main+0)+0),f
	goto	u3727
	decfsz	((??_main+0)+0+1),f
	goto	u3727
	decfsz	((??_main+0)+0+2),f
	goto	u3727
	nop2
opt asmopt_on

	line	278
	
l6847:	
;smartkey.C: 278: tmp8++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@tmp8),f
	line	279
	
l6849:	
;smartkey.C: 279: if (tmp8 > 20) {
	movlw	(015h)
	subwf	(main@tmp8),w
	skipc
	goto	u3011
	goto	u3010
u3011:
	goto	l903
u3010:
	line	280
	
l6851:	
;smartkey.C: 280: _delay((unsigned long)((10000)*(4000000/4000.0)));
	opt asmopt_off
movlw  51
movwf	((??_main+0)+0+2),f
movlw	188
movwf	((??_main+0)+0+1),f
	movlw	16
movwf	((??_main+0)+0),f
u3737:
	decfsz	((??_main+0)+0),f
	goto	u3737
	decfsz	((??_main+0)+0+1),f
	goto	u3737
	decfsz	((??_main+0)+0+2),f
	goto	u3737
opt asmopt_on

	line	281
	
l6853:	
;smartkey.C: 281: WRITE_EEPROM(0x40, 0);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	line	282
;smartkey.C: 282: }
	goto	l6857
	line	283
	
l903:	
;smartkey.C: 283: else if ( RA2) {
	btfss	(42/8),(42)&7
	goto	u3021
	goto	u3020
u3021:
	goto	l6857
u3020:
	line	284
	
l6855:	
;smartkey.C: 284: WRITE_EEPROM(0x40, tmp8);
	movf	(main@tmp8),w
	movwf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	line	285
;smartkey.C: 285: beep(10, 1);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	276
	
l6857:	
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(42/8),(42)&7
	goto	u3031
	goto	u3030
u3031:
	goto	l6845
u3030:
	line	288
	
l907:	
	btfss	(42/8),(42)&7
	goto	u3041
	goto	u3040
u3041:
	goto	l907
u3040:
	line	292
	
l6859:	
;smartkey.C: 289: }
;smartkey.C: 292: tmp8 = READ_EEPROM(0x40);
	movlw	(040h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	293
;smartkey.C: 293: switch (tmp8) {
	goto	l6905
	line	296
	
l6861:	
;smartkey.C: 296: tmp8 = 0; beep(10, 3);
	clrf	(main@tmp8)
	
l6863:	
	movlw	(03h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	297
;smartkey.C: 297: while ((tmp8 < 11)) {
	goto	l912
	line	298
	
l6865:	
;smartkey.C: 298: if (AccRead(0x02, (unsigned char)buf, 6) == 0) {
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
	goto	u3051
	goto	u3050
u3051:
	goto	l6873
u3050:
	line	299
	
l6867:	
;smartkey.C: 299: acXsum += buf[1];
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
	line	300
;smartkey.C: 300: acYsum += buf[3];
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
	line	301
;smartkey.C: 301: tmp16 = (signed int)tmp16 + buf[5];
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
	line	302
	
l6869:	
;smartkey.C: 302: tmp8++;
	incf	(main@tmp8),f
	line	305
;smartkey.C: 303: } else
	
l6871:	
;smartkey.C: 305: _delay((unsigned long)((500)*(4000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u3747:
	decfsz	((??_main+0)+0),f
	goto	u3747
	decfsz	((??_main+0)+0+1),f
	goto	u3747
	decfsz	((??_main+0)+0+2),f
	goto	u3747
	nop2
opt asmopt_on

	line	306
	
l912:	
	line	297
	movlw	(0Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@tmp8),w
	skipc
	goto	u3061
	goto	u3060
u3061:
	goto	l6865
u3060:
	line	308
	
l6873:	
;smartkey.C: 306: }
;smartkey.C: 308: if (tmp8 == 11) {
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@tmp8),w
	xorlw	0Bh
	skipz
	goto	u3071
	goto	u3070
u3071:
	goto	l6885
u3070:
	line	309
	
l6875:	
;smartkey.C: 309: acXsum = acXsum / 10;
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
	line	310
;smartkey.C: 310: acYsum = acYsum / 10;
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
	line	311
;smartkey.C: 311: tmp16 = (signed int)tmp16 / 10;
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
	line	313
	
l6877:	
;smartkey.C: 313: if (((signed char)tmp16 > (-31)) && ((signed char)tmp16 < 31)) {
	movf	(main@tmp16),w
	xorlw	80h
	addlw	-((-30)^80h)
	skipc
	goto	u3081
	goto	u3080
u3081:
	goto	l6883
u3080:
	
l6879:	
	movf	(main@tmp16),w
	xorlw	80h
	addlw	-((01Fh)^80h)
	skipnc
	goto	u3091
	goto	u3090
u3091:
	goto	l6883
u3090:
	line	314
	
l6881:	
;smartkey.C: 314: beep(10, 4);
	movlw	(04h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	315
;smartkey.C: 315: } else {
	goto	l6907
	line	317
	
l6883:	
;smartkey.C: 317: WRITE_EEPROM(0x10, (unsigned char)acXsum);
	movf	(main@acXsum),w
	movwf	(?_WRITE_EEPROM)
	movlw	(010h)
	fcall	_WRITE_EEPROM
	line	318
;smartkey.C: 318: WRITE_EEPROM(0x11, (unsigned char)acYsum);
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acYsum),w
	movwf	(?_WRITE_EEPROM)
	movlw	(011h)
	fcall	_WRITE_EEPROM
	line	319
;smartkey.C: 319: beep(10, 3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	goto	l6907
	line	322
	
l6885:	
;smartkey.C: 322: beep(10, 2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	goto	l6907
	line	329
	
l6887:	
;smartkey.C: 329: tmp8 = READ_EEPROM(0x41);
	movlw	(041h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	330
	
l6889:	
;smartkey.C: 330: if (tmp8 & 2) {
	btfss	(main@tmp8),(1)&7
	goto	u3101
	goto	u3100
u3101:
	goto	l923
u3100:
	line	331
	
l6891:	
;smartkey.C: 331: tmp8 &= ~2;
	bcf	(main@tmp8)+(1/8),(1)&7
	line	332
;smartkey.C: 332: }
	goto	l6893
	line	333
	
l923:	
	line	334
;smartkey.C: 333: else {
;smartkey.C: 334: tmp8 |= 2;
	bsf	(main@tmp8)+(1/8),(1)&7
	line	336
	
l6893:	
;smartkey.C: 335: }
;smartkey.C: 336: WRITE_EEPROM(0x41, tmp8);
	movf	(main@tmp8),w
	movwf	(?_WRITE_EEPROM)
	movlw	(041h)
	fcall	_WRITE_EEPROM
	line	337
;smartkey.C: 337: beep(50, 1);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(032h)
	fcall	_beep
	line	338
;smartkey.C: 338: break;
	goto	l6907
	line	342
	
l6895:	
;smartkey.C: 342: tmp8 = READ_EEPROM(0x41);
	movlw	(041h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	343
	
l6897:	
;smartkey.C: 343: if (tmp8 & 1) {
	btfss	(main@tmp8),(0)&7
	goto	u3111
	goto	u3110
u3111:
	goto	l926
u3110:
	line	344
	
l6899:	
;smartkey.C: 344: tmp8 &= ~1;
	bcf	(main@tmp8)+(0/8),(0)&7
	line	345
;smartkey.C: 345: }
	goto	l6901
	line	346
	
l926:	
	line	347
;smartkey.C: 346: else {
;smartkey.C: 347: tmp8 |= 1;
	bsf	(main@tmp8)+(0/8),(0)&7
	line	349
	
l6901:	
;smartkey.C: 348: }
;smartkey.C: 349: WRITE_EEPROM(0x41, tmp8);
	movf	(main@tmp8),w
	movwf	(?_WRITE_EEPROM)
	movlw	(041h)
	fcall	_WRITE_EEPROM
	line	350
;smartkey.C: 350: beep(10, 2);
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	351
;smartkey.C: 351: break;
	goto	l6907
	line	293
	
l6905:	
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
	goto	l6861
	xorlw	10^3	; case 10
	skipnz
	goto	l6895
	xorlw	20^10	; case 20
	skipnz
	goto	l6887
	goto	l6907
	opt asmopt_on

	line	355
	
l6907:	
;smartkey.C: 355: tmp8 = READ_EEPROM(0x41);
	movlw	(041h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	356
	
l6909:	
;smartkey.C: 356: if (tmp8 >0 && tmp8<4 ) {
	movf	(main@tmp8),w
	skipz
	goto	u3120
	goto	l6927
u3120:
	
l6911:	
	movlw	(04h)
	subwf	(main@tmp8),w
	skipnc
	goto	u3131
	goto	u3130
u3131:
	goto	l6927
u3130:
	line	357
	
l6913:	
;smartkey.C: 357: RegStatus.bits.b0 = 1;
	bsf	(_RegStatus),0
	line	358
	
l6915:	
;smartkey.C: 358: setState(1, 3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	359
	
l6917:	
;smartkey.C: 359: RegStatus.bits.b4 = 1;
	bsf	(_RegStatus),4
	line	361
	
l6919:	
;smartkey.C: 361: if (tmp8 & 2) {
	btfss	(main@tmp8),(1)&7
	goto	u3141
	goto	u3140
u3141:
	goto	l929
u3140:
	line	362
	
l6921:	
;smartkey.C: 362: RegStatus.bits.b6 = 0;
	bcf	(_RegStatus),6
	line	363
;smartkey.C: 363: }
	goto	l6927
	line	364
	
l929:	
;smartkey.C: 364: else if (tmp8 & 1) {
	btfss	(main@tmp8),(0)&7
	goto	u3151
	goto	u3150
u3151:
	goto	l6927
u3150:
	line	365
	
l6923:	
;smartkey.C: 365: tmp16 = timeTick + 40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	366
	
l6925:	
;smartkey.C: 366: beep(10, 1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	370
	
l6927:	
;smartkey.C: 367: }
;smartkey.C: 368: }
;smartkey.C: 370: timeTick = 0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	376
	
l6929:	
;smartkey.C: 376: if ( RegStatus.bits.b4 == 0) {
	btfsc	(_RegStatus),4
	goto	u3161
	goto	u3160
u3161:
	goto	l7043
u3160:
	line	377
	
l6931:	
;smartkey.C: 377: if (RegStatus.bits.b3 == 0) {
	btfsc	(_RegStatus),3
	goto	u3171
	goto	u3170
u3171:
	goto	l7043
u3170:
	line	378
	
l6933:	
;smartkey.C: 378: if (RegStatus.bits.b1) {
	btfss	(_RegStatus),1
	goto	u3181
	goto	u3180
u3181:
	goto	l7043
u3180:
	line	380
	
l6935:	
;smartkey.C: 380: PAIE = 0;
	bcf	(91/8),(91)&7
	line	382
;smartkey.C: 382: RegStatus.bits.b1 = 0;
	bcf	(_RegStatus),1
	line	386
;smartkey.C: 386: if (RegStatus.bits.b2) {
	btfss	(_RegStatus),2
	goto	u3191
	goto	u3190
u3191:
	goto	l7041
u3190:
	goto	l7003
	line	390
	
l6939:	
;smartkey.C: 390: lostDetect = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@lostDetect)
	line	391
;smartkey.C: 391: timeTick = 0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	392
	
l6941:	
;smartkey.C: 392: tmp16 = 40;
	movlw	028h
	movwf	(main@tmp16)
	clrf	(main@tmp16+1)
	line	393
;smartkey.C: 393: break;
	goto	l958
	line	396
	
l6943:	
;smartkey.C: 396: if (timeTick > 30) {
	movlw	high(01Fh)
	subwf	(_timeTick+1),w
	movlw	low(01Fh)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3201
	goto	u3200
u3201:
	goto	l958
u3200:
	line	397
	
l6945:	
;smartkey.C: 397: timeTick = 0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	399
	
l6947:	
;smartkey.C: 399: if (READ_EEPROM(0x08) == 0xcc) WRITE_EEPROM(0x08, 0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u3211
	goto	u3210
u3211:
	goto	l6951
u3210:
	
l6949:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	401
	
l6951:	
;smartkey.C: 401: if ((mtOldState == 3)) {
	bcf	status, 5	;RP0=0, select bank0
	movf	(_mtOldState),w
	xorlw	03h
	skipz
	goto	u3221
	goto	u3220
u3221:
	goto	l6963
u3220:
	line	402
	
l6953:	
;smartkey.C: 402: beepOn(); TMR2ON = 0; beep(10, 1);
	fcall	_beepOn
	
l6955:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l6957:	
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	403
	
l6959:	
;smartkey.C: 403: if (RegStatus.bits.b7)RegStatus.bits.b7 = 0;
	btfss	(_RegStatus),7
	goto	u3231
	goto	u3230
u3231:
	goto	l958
u3230:
	
l6961:	
	bcf	(_RegStatus),7
	goto	l958
	line	405
	
l6963:	
;smartkey.C: 405: else if ((mtOldState == 0) || (mtOldState == 4)) {
	movf	(_mtOldState),w
	skipz
	goto	u3240
	goto	l948
u3240:
	
l6965:	
	movf	(_mtOldState),w
	xorlw	04h
	skipz
	goto	u3251
	goto	u3250
u3251:
	goto	l6977
u3250:
	
l948:	
	line	406
;smartkey.C: 406: RegStatus.bits.b0 = 1;
	bsf	(_RegStatus),0
	line	407
	
l6967:	
;smartkey.C: 407: setState(1, 3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	408
	
l6969:	
;smartkey.C: 408: if (READ_EEPROM(0x40))WRITE_EEPROM(0x40, 0);
	movlw	(040h)
	fcall	_READ_EEPROM
	xorlw	0
	skipnz
	goto	u3261
	goto	u3260
u3261:
	goto	l6973
u3260:
	
l6971:	
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	line	409
	
l6973:	
;smartkey.C: 409: tmp16 = timeTick + 40;
	movf	(_timeTick+1),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l6975:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	410
;smartkey.C: 410: beep(10, 1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	411
;smartkey.C: 411: }
	goto	l958
	line	412
	
l6977:	
;smartkey.C: 412: else if ((mtOldState == 1)) {
	decf	(_mtOldState),w
	skipz
	goto	u3271
	goto	u3270
u3271:
	goto	l958
u3270:
	line	414
	
l6979:	
;smartkey.C: 414: if (RegStatus.bits.b7)RegStatus.bits.b7 = 0;
	btfss	(_RegStatus),7
	goto	u3281
	goto	u3280
u3281:
	goto	l941
u3280:
	goto	l6961
	line	416
	
l941:	
	line	417
;smartkey.C: 415: }
;smartkey.C: 416: }
;smartkey.C: 417: break;
	goto	l958
	line	420
	
l6983:	
;smartkey.C: 420: if (timeTick > 200) {
	movlw	high(0C9h)
	subwf	(_timeTick+1),w
	movlw	low(0C9h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3291
	goto	u3290
u3291:
	goto	l958
u3290:
	line	422
	
l6985:	
;smartkey.C: 422: beepOff();
	fcall	_beepOff
	line	423
	
l6987:	
;smartkey.C: 423: if (READ_EEPROM(0x08) == 0xcc) WRITE_EEPROM(0x08, 0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u3301
	goto	u3300
u3301:
	goto	l6991
u3300:
	
l6989:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	424
	
l6991:	
;smartkey.C: 424: RegStatus.bits.b0 = 1;
	bsf	(_RegStatus),0
	line	425
;smartkey.C: 425: setState(1, 3500);
	movlw	low(0DACh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	427
	
l6993:	
;smartkey.C: 427: tmp16 = timeTick + 40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l6995:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	goto	l958
	line	433
	
l6997:	
;smartkey.C: 433: beepOff();
	fcall	_beepOff
	line	434
	
l6999:	
;smartkey.C: 434: setState(2, 300);
	movlw	low(012Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	435
;smartkey.C: 435: break;
	goto	l958
	line	388
	
l7003:	
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
goto l958
movlw high(S7293)
movwf pclath
	movlw low(S7293)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S7293:
	ljmp	l958
	ljmp	l6939
	ljmp	l6943
	ljmp	l6983
	ljmp	l6997
psect	maintext

	line	450
	
l7005:	
;smartkey.C: 450: if ((lostDetect == 1) && (timeTick < 1500) && (timeTick > 700))
	bcf	status, 5	;RP0=0, select bank0
	decf	(main@lostDetect),w
	skipz
	goto	u3311
	goto	u3310
u3311:
	goto	l961
u3310:
	
l7007:	
	movlw	high(05DCh)
	subwf	(_timeTick+1),w
	movlw	low(05DCh)
	skipnz
	subwf	(_timeTick),w
	skipnc
	goto	u3321
	goto	u3320
u3321:
	goto	l961
u3320:
	
l7009:	
	movlw	high(02BDh)
	subwf	(_timeTick+1),w
	movlw	low(02BDh)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3331
	goto	u3330
u3331:
	goto	l961
u3330:
	line	452
	
l7011:	
;smartkey.C: 451: {
;smartkey.C: 452: if (READ_EEPROM(0x08) == 0x00) WRITE_EEPROM(0x08, 0xcc);
	movlw	(08h)
	fcall	_READ_EEPROM
	iorlw	0
	skipz
	goto	u3341
	goto	u3340
u3341:
	goto	l962
u3340:
	
l7013:	
	movlw	(0CCh)
	movwf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	
l962:	
	line	454
;smartkey.C: 454: setState(3, 1800);
	movlw	low(0708h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(0708h)
	movwf	((?_setState))+1
	movlw	(03h)
	fcall	_setState
	line	455
	
l7015:	
;smartkey.C: 455: cntTmp = timeTick + 40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l7017:	
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	456
	
l7019:	
;smartkey.C: 456: PR2L = 20;
	movlw	(014h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	457
;smartkey.C: 457: beepOn();
	fcall	_beepOn
	line	458
	
l7021:	
;smartkey.C: 458: lostDetect = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@lostDetect)
	line	459
;smartkey.C: 459: }
	goto	l7023
	line	460
	
l961:	
	line	461
;smartkey.C: 460: else {
;smartkey.C: 461: lostDetect = 1;
	clrf	(main@lostDetect)
	incf	(main@lostDetect),f
	line	465
	
l7023:	
;smartkey.C: 464: }
;smartkey.C: 465: timeTick = 0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	goto	l6941
	line	470
	
l7027:	
;smartkey.C: 470: timeTick = 0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	471
	
l7029:	
;smartkey.C: 471: beepOn(); TMR2ON = 0;
	fcall	_beepOn
	
l7031:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	472
	
l7033:	
;smartkey.C: 472: beep(10, 2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	473
	
l7035:	
;smartkey.C: 473: if (mtOldState == 3) {RegStatus.bits.b7 = 1;}
	movf	(_mtOldState),w
	xorlw	03h
	skipz
	goto	u3351
	goto	u3350
u3351:
	goto	l958
u3350:
	
l7037:	
	bsf	(_RegStatus),7
	goto	l958
	line	445
	
l7041:	
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
	goto	l7005
	xorlw	2^1	; case 2
	skipnz
	goto	l7027
	goto	l958
	opt asmopt_on

	line	476
	
l958:	
	line	477
;smartkey.C: 476: }
;smartkey.C: 477: PAIE = 1;
	bsf	(91/8),(91)&7
	line	483
	
l7043:	
;smartkey.C: 478: }
;smartkey.C: 479: }
;smartkey.C: 480: }
;smartkey.C: 483: if ((timeOut != 0) && ( timeTick > timeOut)) {
	bcf	status, 5	;RP0=0, select bank0
	movf	(_timeOut+1),w
	iorwf	(_timeOut),w
	skipnz
	goto	u3361
	goto	u3360
u3361:
	goto	l967
u3360:
	
l7045:	
	movf	(_timeTick+1),w
	subwf	(_timeOut+1),w
	skipz
	goto	u3375
	movf	(_timeTick),w
	subwf	(_timeOut),w
u3375:
	skipnc
	goto	u3371
	goto	u3370
u3371:
	goto	l967
u3370:
	goto	l7117
	line	489
	
l7049:	
;smartkey.C: 489: beepOff();
	fcall	_beepOff
	line	490
	
l7051:	
;smartkey.C: 490: RegStatus.bits.b0 = 0;
	bcf	(_RegStatus),0
	line	491
	
l7053:	
;smartkey.C: 491: setState(2, 300);
	movlw	low(012Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	492
;smartkey.C: 492: break;
	goto	l967
	line	494
	
l7055:	
;smartkey.C: 494: beepOff();
	fcall	_beepOff
	line	495
	
l7057:	
;smartkey.C: 495: delay_x10ms(20);
	movlw	014h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	496
	
l7059:	
;smartkey.C: 496: beepOn(); TMR2ON = 0; RegStatus.bits.b7 = 0;
	fcall	_beepOn
	
l7061:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l7063:	
	bcf	(_RegStatus),7
	line	497
;smartkey.C: 497: beep(30, 1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(01Eh)
	fcall	_beep
	line	498
	
l7065:	
;smartkey.C: 498: RegStatus.bits.b5 = 1;
	bsf	(_RegStatus),5
	line	499
;smartkey.C: 499: setState(0, 0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	501
	
l7067:	
;smartkey.C: 501: tmp16 = timeTick + 40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l7069:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	502
;smartkey.C: 502: break;
	goto	l967
	line	505
	
l7071:	
;smartkey.C: 505: if (READ_EEPROM(0x08) == 0xcc) WRITE_EEPROM(0x08, 0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u3381
	goto	u3380
u3381:
	goto	l7075
u3380:
	
l7073:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	506
	
l7075:	
;smartkey.C: 506: if (RegStatus.bits.b7) {
	btfss	(_RegStatus),7
	goto	u3391
	goto	u3390
u3391:
	goto	l7085
u3390:
	line	507
	
l7077:	
;smartkey.C: 507: setState(4, 6000);
	movlw	low(01770h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(01770h)
	movwf	((?_setState))+1
	movlw	(04h)
	fcall	_setState
	line	508
	
l7079:	
;smartkey.C: 508: cntTmp = timeTick + 40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l7081:	
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	509
	
l7083:	
;smartkey.C: 509: PR2L = 20;
	movlw	(014h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	510
;smartkey.C: 510: beepOn();
	fcall	_beepOn
	line	512
;smartkey.C: 512: } else if (mtOldState == 0) {
	goto	l967
	
l7085:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_mtOldState),f
	skipz
	goto	u3401
	goto	u3400
u3401:
	goto	l7099
u3400:
	line	514
	
l7087:	
;smartkey.C: 514: beep(10, 5);
	movlw	(05h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	515
	
l7089:	
;smartkey.C: 515: RegStatus.bits.b0 = 1;
	bsf	(_RegStatus),0
	line	516
	
l7091:	
;smartkey.C: 516: if (READ_EEPROM(0x40))WRITE_EEPROM(0x40, 0);
	movlw	(040h)
	fcall	_READ_EEPROM
	xorlw	0
	skipnz
	goto	u3411
	goto	u3410
u3411:
	goto	l978
u3410:
	
l7093:	
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	
l978:	
	line	517
;smartkey.C: 517: setState(1, 3500);
	movlw	low(0DACh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	goto	l7067
	line	521
	
l7099:	
;smartkey.C: 521: beepOn(); TMR2ON = 0;
	fcall	_beepOn
	
l7101:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	522
	
l7103:	
;smartkey.C: 522: RegStatus.bits.b7 = 0;
	bcf	(_RegStatus),7
	line	523
	
l7105:	
;smartkey.C: 523: beep(30, 1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(01Eh)
	fcall	_beep
	line	524
	
l7107:	
;smartkey.C: 524: setState(0, 0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	526
	
l7109:	
;smartkey.C: 526: RegStatus.bits.b5 = 1;
	bsf	(_RegStatus),5
	goto	l7067
	line	485
	
l7117:	
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
	goto	l967
	xorlw	2^1	; case 2
	skipnz
	goto	l7071
	xorlw	3^2	; case 3
	skipnz
	goto	l7049
	xorlw	4^3	; case 4
	skipnz
	goto	l7055
	goto	l967
	opt asmopt_on

	line	531
	
l967:	
	line	533
;smartkey.C: 531: }
;smartkey.C: 533: if (RegStatus.bits.b6 == 1) {
	btfss	(_RegStatus),6
	goto	u3421
	goto	u3420
u3421:
	goto	l7231
u3420:
	line	534
	
l7119:	
;smartkey.C: 534: if ((timeTick > tmp16) && (mtState == 1) ) {
	movf	(_timeTick+1),w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@tmp16+1),w
	skipz
	goto	u3435
	movf	(_timeTick),w
	subwf	(main@tmp16),w
u3435:
	skipnc
	goto	u3431
	goto	u3430
u3431:
	goto	l7201
u3430:
	
l7121:	
	decf	(_mtState),w
	skipz
	goto	u3441
	goto	u3440
u3441:
	goto	l7201
u3440:
	line	535
	
l7123:	
;smartkey.C: 535: tmp16 = timeTick + 40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	536
	
l7125:	
;smartkey.C: 536: if (AccRead(0x02, buf, 6) == 0) {
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
	goto	u3451
	goto	u3450
u3451:
	goto	l7201
u3450:
	line	538
	
l7127:	
;smartkey.C: 538: if (compe(buf[1], (signed char)acXsum, 5) && compe(buf[3], (signed char)acYsum, 5)) {
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acXsum),w
	movwf	(?_compe)
	movlw	(05h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+01h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3461
	goto	u3460
u3461:
	goto	l7157
u3460:
	
l7129:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acYsum),w
	movwf	(?_compe)
	movlw	(05h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+03h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3471
	goto	u3470
u3471:
	goto	l7157
u3470:
	line	540
	
l7131:	
;smartkey.C: 540: isSw++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@isSw),f
	line	541
	
l7133:	
;smartkey.C: 541: if (isSw > 44) {
	movlw	(02Dh)
	subwf	(main@isSw),w
	skipc
	goto	u3481
	goto	u3480
u3481:
	goto	l7147
u3480:
	line	542
	
l7135:	
;smartkey.C: 542: isSw = 0;
	clrf	(main@isSw)
	line	543
	
l7137:	
;smartkey.C: 543: RegStatus.bits.b5 = 1;
	bsf	(_RegStatus),5
	line	545
	
l7139:	
	
l7141:	
	line	546
	
l7143:	
;smartkey.C: 546: RegStatus.bits.b0 = 0;
	bcf	(_RegStatus),0
	line	547
	
l7145:	
;smartkey.C: 547: setState(2, 300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	548
;smartkey.C: 548: }
	goto	l7179
	line	549
	
l7147:	
;smartkey.C: 549: else if (isSw > 25) {
	movlw	(01Ah)
	subwf	(main@isSw),w
	skipc
	goto	u3491
	goto	u3490
u3491:
	goto	l7179
u3490:
	line	550
	
l7149:	
;smartkey.C: 550: if (isSw % 2 == 0) {
	btfsc	(main@isSw),(0)&7
	goto	u3501
	goto	u3500
u3501:
	goto	l985
u3500:
	line	551
	
l7151:	
;smartkey.C: 551: beepOn(); TMR2ON = 0; beep(7, 1);
	fcall	_beepOn
	
l7153:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l7155:	
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(07h)
	fcall	_beep
	goto	l7179
	line	554
	
l985:	
;smartkey.C: 552: }
;smartkey.C: 553: }
;smartkey.C: 554: }
	goto	l7179
	line	557
	
l7157:	
;smartkey.C: 556: else {
;smartkey.C: 557: isSw = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@isSw)
	line	560
	
l7159:	
;smartkey.C: 560: if (compe(buf[1], acXOld, 1) && compe(buf[3], acYOld, 1)) {
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
	goto	l7177
u3510:
	
l7161:	
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
	goto	l7177
u3520:
	line	561
	
l7163:	
;smartkey.C: 561: isWait++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@isWait),f
	skipnz
	incf	(main@isWait+1),f
	line	562
	
l7165:	
;smartkey.C: 562: if (isWait == 450) {
	decf	(main@isWait+1),w
	movlw	194
	skipnz
	xorwf	(main@isWait),w

	skipz
	goto	u3531
	goto	u3530
u3531:
	goto	l7179
u3530:
	line	563
	
l7167:	
;smartkey.C: 563: isWait = 0;
	clrf	(main@isWait)
	clrf	(main@isWait+1)
	line	564
	
l7169:	
;smartkey.C: 564: beep(7, 2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	line	565
	
l7171:	
;smartkey.C: 565: RegStatus.bits.b5 = 1;
	bsf	(_RegStatus),5
	line	566
	
l7173:	
;smartkey.C: 566: RegStatus.bits.b0 = 0;
	bcf	(_RegStatus),0
	line	567
	
l7175:	
;smartkey.C: 567: setState(2, 300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	goto	l7179
	line	571
	
l7177:	
;smartkey.C: 570: else
;smartkey.C: 571: isWait = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@isWait)
	clrf	(main@isWait+1)
	line	574
	
l7179:	
;smartkey.C: 572: }
;smartkey.C: 574: if ( (buf[5] > -31) && (buf[5] < 31)) {
	movf	0+(main@buf)+05h,w
	xorlw	80h
	addlw	-((-30)^80h)
	skipc
	goto	u3541
	goto	u3540
u3541:
	goto	l7195
u3540:
	
l7181:	
	movf	0+(main@buf)+05h,w
	xorlw	80h
	addlw	-((01Fh)^80h)
	skipnc
	goto	u3551
	goto	u3550
u3551:
	goto	l7195
u3550:
	line	575
	
l7183:	
;smartkey.C: 575: isFall++;
	incf	(main@isFall),f
	line	576
	
l7185:	
;smartkey.C: 576: if (isFall > 4) {
	movlw	(05h)
	subwf	(main@isFall),w
	skipc
	goto	u3561
	goto	u3560
u3561:
	goto	l7197
u3560:
	line	577
	
l7187:	
;smartkey.C: 577: isFall = 0;
	clrf	(main@isFall)
	line	578
	
l7189:	
;smartkey.C: 578: beep(7, 2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	line	579
	
l7191:	
;smartkey.C: 579: RegStatus.bits.b0 = 0;
	bcf	(_RegStatus),0
	line	580
	
l7193:	
;smartkey.C: 580: setState(2, 300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	goto	l7197
	line	584
	
l7195:	
;smartkey.C: 583: else {
;smartkey.C: 584: isFall = 0;
	clrf	(main@isFall)
	line	587
	
l7197:	
;smartkey.C: 585: }
;smartkey.C: 587: acYOld = buf[3]; acXOld = buf[1];
	movf	0+(main@buf)+03h,w
	movwf	(main@acYOld)
	
l7199:	
	movf	0+(main@buf)+01h,w
	movwf	(main@acXOld)
	line	592
	
l7201:	
;smartkey.C: 588: }
;smartkey.C: 589: }
;smartkey.C: 592: if ((timeTick > tmp16) && (mtState == 0 ) ) {
	movf	(_timeTick+1),w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@tmp16+1),w
	skipz
	goto	u3575
	movf	(_timeTick),w
	subwf	(main@tmp16),w
u3575:
	skipnc
	goto	u3571
	goto	u3570
u3571:
	goto	l7231
u3570:
	
l7203:	
	movf	(_mtState),f
	skipz
	goto	u3581
	goto	u3580
u3581:
	goto	l7231
u3580:
	line	594
	
l7205:	
;smartkey.C: 594: if (timeTick > 65000) timeTick = 0;
	movlw	high(0FDE9h)
	subwf	(_timeTick+1),w
	movlw	low(0FDE9h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3591
	goto	u3590
u3591:
	goto	l7209
u3590:
	
l7207:	
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	595
	
l7209:	
;smartkey.C: 595: tmp16 = timeTick + 40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l7211:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	597
	
l7213:	
;smartkey.C: 597: if (AccRead(0x02, buf, 6) == 0) {
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
	goto	u3601
	goto	u3600
u3601:
	goto	l7231
u3600:
	line	598
	
l7215:	
;smartkey.C: 598: if (RegStatus.bits.b5) {
	btfss	(_RegStatus),5
	goto	u3611
	goto	u3610
u3611:
	goto	l7231
u3610:
	line	599
	
l7217:	
;smartkey.C: 599: if (compe(buf[1], acXOld , 3) && compe(buf[3], acYOld , 3)) {
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acXOld),w
	movwf	(?_compe)
	movlw	(03h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+01h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3621
	goto	u3620
u3621:
	goto	l7223
u3620:
	
l7219:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acYOld),w
	movwf	(?_compe)
	movlw	(03h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+03h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3631
	goto	u3630
u3631:
	goto	l7223
u3630:
	line	601
	
l7221:	
;smartkey.C: 601: isSw = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@isSw)
	line	602
;smartkey.C: 602: }
	goto	l7231
	line	604
	
l7223:	
;smartkey.C: 603: else {
;smartkey.C: 604: isSw++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@isSw),f
	line	605
	
l7225:	
;smartkey.C: 605: beepOn(); TMR2ON = 0; beep(7, 3);
	fcall	_beepOn
	
l7227:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l7229:	
	movlw	(03h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	line	612
	
l7231:	
;smartkey.C: 606: }
;smartkey.C: 607: }
;smartkey.C: 608: }
;smartkey.C: 609: }
;smartkey.C: 610: }
;smartkey.C: 612: if (RegStatus.bits.b0) {RC0 = 1; RC1 = 1;}
	btfss	(_RegStatus),0
	goto	u3641
	goto	u3640
u3641:
	goto	l1001
u3640:
	
l7233:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	goto	l7235
	line	613
	
l1001:	
;smartkey.C: 613: else {RC0 = 0; RC1 = 0;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	bcf	(57/8),(57)&7
	line	616
	
l7235:	
;smartkey.C: 616: if (timeTick > 500){
	movlw	high(01F5h)
	subwf	(_timeTick+1),w
	movlw	low(01F5h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3651
	goto	u3650
u3651:
	goto	l6929
u3650:
	line	617
	
l7237:	
;smartkey.C: 617: if (READ_EEPROM(0x3F)) WRITE_EEPROM(0x3F, 0);
	movlw	(03Fh)
	fcall	_READ_EEPROM
	xorlw	0
	skipnz
	goto	u3661
	goto	u3660
u3661:
	goto	l7241
u3660:
	
l7239:	
	clrf	(?_WRITE_EEPROM)
	movlw	(03Fh)
	fcall	_WRITE_EEPROM
	line	618
	
l7241:	
;smartkey.C: 618: if (READ_EEPROM(0x40)) WRITE_EEPROM(0x40, 0);
	movlw	(040h)
	fcall	_READ_EEPROM
	xorlw	0
	skipnz
	goto	u3671
	goto	u3670
u3671:
	goto	l6929
u3670:
	
l7243:	
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	goto	l6929
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	621
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_AccRead
psect	text872,local,class=CODE,delta=2
global __ptext872
__ptext872:

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
psect	text872
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
	
l6729:	
;mpu6x.c: 32: unsigned char i;
;mpu6x.c: 34: swI2C_Start();
	fcall	_swI2C_Start
	line	36
;mpu6x.c: 36: if(swI2C_WriteByte(0x18<<1)== 0 )
	movlw	(030h)
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2921
	goto	u2920
u2921:
	goto	l6753
u2920:
	line	38
	
l6731:	
;mpu6x.c: 37: {
;mpu6x.c: 38: if(swI2C_WriteByte(rAdd)==0 )
	movf	(AccRead@rAdd),w
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2931
	goto	u2930
u2931:
	goto	l6757
u2930:
	line	40
	
l6733:	
;mpu6x.c: 39: {
;mpu6x.c: 40: swI2C_Start();
	fcall	_swI2C_Start
	line	41
;mpu6x.c: 41: if(swI2C_WriteByte((0x18<<1)|1)== 0 ){
	movlw	(031h)
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2941
	goto	u2940
u2941:
	goto	l6753
u2940:
	line	43
	
l6735:	
;mpu6x.c: 43: for(i=0; i<(len-1);i++){
	clrf	(AccRead@i)
	goto	l6741
	line	44
	
l6737:	
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
	
l6739:	
	incf	(AccRead@i),f
	
l6741:	
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
	goto	u2955
	movf	0+(??_AccRead+0)+0,w
	subwf	(AccRead@i),w
u2955:

	skipc
	goto	u2951
	goto	u2950
u2951:
	goto	l6737
u2950:
	line	46
	
l6743:	
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
	
l6745:	
;mpu6x.c: 47: swI2C_Stop();
	fcall	_swI2C_Stop
	line	48
	
l6747:	
;mpu6x.c: 48: return 0;
	movlw	(0)
	goto	l3423
	line	52
	
l6753:	
;mpu6x.c: 51: else
;mpu6x.c: 52: return 1;
	movlw	(01h)
	goto	l3423
	line	55
	
l6757:	
;mpu6x.c: 54: else
;mpu6x.c: 55: return 2;
	movlw	(02h)
	line	59
	
l3423:	
	return
	opt stack 0
GLOBAL	__end_of_AccRead
	__end_of_AccRead:
;; =============== function _AccRead ends ============

	signat	_AccRead,12409
	global	_AccWrite
psect	text873,local,class=CODE,delta=2
global __ptext873
__ptext873:

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
psect	text873
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
	
l6695:	
;mpu6x.c: 5: unsigned char i;
;mpu6x.c: 6: swI2C_Start();
	fcall	_swI2C_Start
	line	8
;mpu6x.c: 8: if(swI2C_WriteByte(0x18<<1)== 0 )
	movlw	(030h)
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2881
	goto	u2880
u2881:
	goto	l6725
u2880:
	line	10
	
l6697:	
;mpu6x.c: 9: {
;mpu6x.c: 10: if(swI2C_WriteByte(rAdd)==0 )
	movf	(AccWrite@rAdd),w
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2891
	goto	u2890
u2891:
	goto	l6721
u2890:
	line	12
	
l6699:	
;mpu6x.c: 11: {
;mpu6x.c: 12: for(i=0; i<len;i++){
	clrf	(AccWrite@i)
	goto	l6711
	line	13
	
l6701:	
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
	goto	u2901
	goto	u2900
u2901:
	goto	l6709
u2900:
	line	14
	
l6703:	
;mpu6x.c: 14: swI2C_Stop();
	fcall	_swI2C_Stop
	line	15
	
l6705:	
;mpu6x.c: 15: return 3;
	movlw	(03h)
	goto	l3411
	line	12
	
l6709:	
	incf	(AccWrite@i),f
	
l6711:	
	movf	(AccWrite@len),w
	subwf	(AccWrite@i),w
	skipc
	goto	u2911
	goto	u2910
u2911:
	goto	l6701
u2910:
	line	18
	
l6713:	
;mpu6x.c: 16: }
;mpu6x.c: 17: }
;mpu6x.c: 18: swI2C_Stop();
	fcall	_swI2C_Stop
	line	19
	
l6715:	
;mpu6x.c: 19: return 0;
	movlw	(0)
	goto	l3411
	line	22
	
l6721:	
;mpu6x.c: 21: else
;mpu6x.c: 22: return 2;
	movlw	(02h)
	goto	l3411
	line	25
	
l6725:	
;mpu6x.c: 24: else
;mpu6x.c: 25: return 1;
	movlw	(01h)
	line	27
	
l3411:	
	return
	opt stack 0
GLOBAL	__end_of_AccWrite
	__end_of_AccWrite:
;; =============== function _AccWrite ends ============

	signat	_AccWrite,12409
	global	_swI2C_ReadByte
psect	text874,local,class=CODE,delta=2
global __ptext874
__ptext874:

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
psect	text874
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
	
l6667:	
	clrf	(swI2C_ReadByte@dat)
	line	115
	
l6669:	
;SWI2C.C: 115: RA7 = 0;
	bcf	(47/8),(47)&7
	line	116
	
l6671:	
;SWI2C.C: 116: TRISA |=0x40;;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(6/8),(6)&7	;volatile
	line	117
	
l6673:	
;SWI2C.C: 117: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_ReadByte+0)+0,f
u3757:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3757
opt asmopt_on

	line	118
	
l6675:	
;SWI2C.C: 118: for(i=0;i<8;i++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(swI2C_ReadByte@i)
	line	119
	
l2611:	
	line	120
;SWI2C.C: 119: {
;SWI2C.C: 120: RA7 = 1;
	bsf	(47/8),(47)&7
	line	121
	
l6679:	
;SWI2C.C: 121: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_ReadByte+0)+0,f
u3767:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3767
opt asmopt_on

	line	122
	
l6681:	
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
	
l6683:	
;SWI2C.C: 125: RA7 = 0;
	bcf	(47/8),(47)&7
	line	126
	
l6685:	
;SWI2C.C: 126: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_ReadByte+0)+0,f
u3777:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3777
opt asmopt_on

	line	118
	
l6687:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(swI2C_ReadByte@i),f
	movlw	(08h)
	subwf	(swI2C_ReadByte@i),w
	skipc
	goto	u2851
	goto	u2850
u2851:
	goto	l2611
u2850:
	
l2612:	
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
	goto	u2861
	goto	u2860
	
u2861:
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	goto	u2874
u2860:
	bcf	status, 5	;RP0=0, select bank0
	bcf	(46/8),(46)&7
u2874:
	line	132
;SWI2C.C: 132: RA7 = 1;
	bsf	(47/8),(47)&7
	line	133
	
l6689:	
;SWI2C.C: 133: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_ReadByte+0)+0,f
u3787:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3787
opt asmopt_on

	line	134
	
l6691:	
;SWI2C.C: 134: RA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(47/8),(47)&7
	line	135
;SWI2C.C: 135: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_ReadByte+0)+0,f
u3797:
decfsz	(??_swI2C_ReadByte+0)+0,f
	goto	u3797
opt asmopt_on

	line	136
;SWI2C.C: 136: return dat;
	bcf	status, 5	;RP0=0, select bank0
	movf	(swI2C_ReadByte@dat),w
	line	137
	
l2613:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_ReadByte
	__end_of_swI2C_ReadByte:
;; =============== function _swI2C_ReadByte ends ============

	signat	_swI2C_ReadByte,4217
	global	_swI2C_WriteByte
psect	text875,local,class=CODE,delta=2
global __ptext875
__ptext875:

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
psect	text875
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
	
l6639:	
	line	89
	
l6641:	
;SWI2C.C: 89: TRISA &=0xbf;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(6/8),(6)&7	;volatile
	line	90
	
l6643:	
;SWI2C.C: 90: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_WriteByte+0)+0,f
u3807:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u3807
opt asmopt_on

	line	91
	
l6645:	
;SWI2C.C: 91: for(i=0;i<8;i++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(swI2C_WriteByte@i)
	line	92
	
l2606:	
	line	93
;SWI2C.C: 92: {
;SWI2C.C: 93: RA6 = (dat&0x80) ? 1:0;
	btfsc	(swI2C_WriteByte@dat),(7)&7
	goto	u2821
	goto	u2820
	
u2821:
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	goto	u2834
u2820:
	bcf	status, 5	;RP0=0, select bank0
	bcf	(46/8),(46)&7
u2834:
	line	94
;SWI2C.C: 94: dat<<=1;
	clrc
	rlf	(swI2C_WriteByte@dat),f
	line	95
;SWI2C.C: 95: RA7 = 1;
	bsf	(47/8),(47)&7
	line	96
	
l6649:	
;SWI2C.C: 96: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_WriteByte+0)+0,f
u3817:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u3817
opt asmopt_on

	line	97
	
l6651:	
;SWI2C.C: 97: RA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(47/8),(47)&7
	line	98
;SWI2C.C: 98: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_WriteByte+0)+0,f
u3827:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u3827
opt asmopt_on

	line	91
	
l6653:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(swI2C_WriteByte@i),f
	
l6655:	
	movlw	(08h)
	subwf	(swI2C_WriteByte@i),w
	skipc
	goto	u2841
	goto	u2840
u2841:
	goto	l2606
u2840:
	
l2607:	
	line	101
;SWI2C.C: 99: }
;SWI2C.C: 101: TRISA |=0x40;;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(6/8),(6)&7	;volatile
	line	102
	
l6657:	
;SWI2C.C: 102: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_WriteByte+0)+0,f
u3837:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u3837
opt asmopt_on

	line	103
	
l6659:	
;SWI2C.C: 103: RA7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(47/8),(47)&7
	line	104
;SWI2C.C: 104: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_WriteByte+0)+0,f
u3847:
decfsz	(??_swI2C_WriteByte+0)+0,f
	goto	u3847
opt asmopt_on

	line	105
;SWI2C.C: 105: i= RA6;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(46/8),(46)&7
	movlw	1
	movwf	(swI2C_WriteByte@i)
	line	106
	
l6661:	
;SWI2C.C: 106: RA7 = 0;
	bcf	(47/8),(47)&7
	line	107
	
l6663:	
;SWI2C.C: 107: TRISA &=0xbf;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(6/8),(6)&7	;volatile
	line	108
;SWI2C.C: 108: return i;
	bcf	status, 5	;RP0=0, select bank0
	movf	(swI2C_WriteByte@i),w
	line	109
	
l2608:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_WriteByte
	__end_of_swI2C_WriteByte:
;; =============== function _swI2C_WriteByte ends ============

	signat	_swI2C_WriteByte,4217
	global	_swI2C_Stop
psect	text876,local,class=CODE,delta=2
global __ptext876
__ptext876:

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
psect	text876
	file	"SWI2C.C"
	line	35
	global	__size_of_swI2C_Stop
	__size_of_swI2C_Stop	equ	__end_of_swI2C_Stop-_swI2C_Stop
	
_swI2C_Stop:	
	opt	stack 4
; Regs used in _swI2C_Stop: [wreg]
	line	37
	
l6633:	
;SWI2C.C: 37: RA6 = 0;
	bcf	(46/8),(46)&7
	line	38
;SWI2C.C: 38: RA7 = 1;
	bsf	(47/8),(47)&7
	line	39
	
l6635:	
;SWI2C.C: 39: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Stop+0)+0,f
u3857:
decfsz	(??_swI2C_Stop+0)+0,f
	goto	u3857
opt asmopt_on

	line	40
	
l6637:	
;SWI2C.C: 40: RA6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	line	41
;SWI2C.C: 41: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Stop+0)+0,f
u3867:
decfsz	(??_swI2C_Stop+0)+0,f
	goto	u3867
opt asmopt_on

	line	42
	
l2600:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_Stop
	__end_of_swI2C_Stop:
;; =============== function _swI2C_Stop ends ============

	signat	_swI2C_Stop,88
	global	_swI2C_Start
psect	text877,local,class=CODE,delta=2
global __ptext877
__ptext877:

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
psect	text877
	file	"SWI2C.C"
	line	22
	global	__size_of_swI2C_Start
	__size_of_swI2C_Start	equ	__end_of_swI2C_Start-_swI2C_Start
	
_swI2C_Start:	
	opt	stack 4
; Regs used in _swI2C_Start: [wreg]
	line	24
	
l6625:	
;SWI2C.C: 24: RA7 = 1;
	bsf	(47/8),(47)&7
	line	26
;SWI2C.C: 26: RA6 = 1;
	bsf	(46/8),(46)&7
	line	27
	
l6627:	
;SWI2C.C: 27: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Start+0)+0,f
u3877:
decfsz	(??_swI2C_Start+0)+0,f
	goto	u3877
opt asmopt_on

	line	28
	
l6629:	
;SWI2C.C: 28: RA6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(46/8),(46)&7
	line	29
;SWI2C.C: 29: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Start+0)+0,f
u3887:
decfsz	(??_swI2C_Start+0)+0,f
	goto	u3887
opt asmopt_on

	line	30
	
l6631:	
;SWI2C.C: 30: RA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(47/8),(47)&7
	line	31
;SWI2C.C: 31: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Start+0)+0,f
u3897:
decfsz	(??_swI2C_Start+0)+0,f
	goto	u3897
opt asmopt_on

	line	32
	
l2597:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_Start
	__end_of_swI2C_Start:
;; =============== function _swI2C_Start ends ============

	signat	_swI2C_Start,88
	global	_swI2C_Init
psect	text878,local,class=CODE,delta=2
global __ptext878
__ptext878:

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
psect	text878
	file	"SWI2C.C"
	line	8
	global	__size_of_swI2C_Init
	__size_of_swI2C_Init	equ	__end_of_swI2C_Init-_swI2C_Init
	
_swI2C_Init:	
	opt	stack 5
; Regs used in _swI2C_Init: [wreg]
	line	10
	
l6617:	
;SWI2C.C: 10: TRISA &=0xbf;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(6/8),(6)&7	;volatile
	line	11
;SWI2C.C: 11: TRISA &=0x7f;;
	bcf	(133)^080h+(7/8),(7)&7	;volatile
	line	12
	
l6619:	
;SWI2C.C: 12: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_Init+0)+0,f
u3907:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u3907
opt asmopt_on

	line	13
	
l6621:	
;SWI2C.C: 13: RA7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(47/8),(47)&7
	line	14
	
l6623:	
;SWI2C.C: 14: RA6 = 1;
	bsf	(46/8),(46)&7
	line	15
;SWI2C.C: 15: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
movwf	(??_swI2C_Init+0)+0,f
u3917:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u3917
opt asmopt_on

	line	16
;SWI2C.C: 16: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_Init+0)+0,f
u3927:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u3927
opt asmopt_on

	line	17
;SWI2C.C: 17: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_Init+0)+0,f
u3937:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u3937
opt asmopt_on

	line	18
;SWI2C.C: 18: _delay((unsigned long)((16)*(4000000/4000000.0)));;
	opt asmopt_off
movlw	5
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_swI2C_Init+0)+0,f
u3947:
decfsz	(??_swI2C_Init+0)+0,f
	goto	u3947
opt asmopt_on

	line	19
	
l2594:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_Init
	__end_of_swI2C_Init:
;; =============== function _swI2C_Init ends ============

	signat	_swI2C_Init,88
	global	_sys_init
psect	text879,local,class=CODE,delta=2
global __ptext879
__ptext879:

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
psect	text879
	file	"sysinit.c"
	line	3
	global	__size_of_sys_init
	__size_of_sys_init	equ	__end_of_sys_init-_sys_init
	
_sys_init:	
	opt	stack 5
; Regs used in _sys_init: [wreg]
	line	21
	
l6613:	
;sysinit.c: 21: OSCCON = 0B01010001;
	movlw	(051h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	22
	
l6615:	
;sysinit.c: 22: _nop();
	nop
	line	28
;sysinit.c: 28: while(HTS==0);
	
l1795:	
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1146/8)^080h,(1146)&7
	goto	u2811
	goto	u2810
u2811:
	goto	l1795
u2810:
	line	30
	
l1798:	
	return
	opt stack 0
GLOBAL	__end_of_sys_init
	__end_of_sys_init:
;; =============== function _sys_init ends ============

	signat	_sys_init,88
	global	_beep
psect	text880,local,class=CODE,delta=2
global __ptext880
__ptext880:

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
psect	text880
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
	
l6599:	
;smartkey.C: 147: {
;smartkey.C: 148: while (rep--) {
	goto	l6611
	
l862:	
	line	149
;smartkey.C: 149: TMR2ON = 1;
	bsf	(146/8),(146)&7
	line	150
	
l6601:	
;smartkey.C: 150: PR2L = 12;
	movlw	(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	151
	
l6603:	
;smartkey.C: 151: delay_x10ms(delay);
	bcf	status, 5	;RP0=0, select bank0
	movf	(beep@delay),w
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	153
	
l6605:	
;smartkey.C: 153: TMR2ON = 0; RA3 = 0;
	bcf	(146/8),(146)&7
	
l6607:	
	bcf	(43/8),(43)&7
	line	154
	
l6609:	
;smartkey.C: 154: delay_x10ms(20);
	movlw	014h
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	148
	
l6611:	
	decf	(beep@rep),f
	movf	((beep@rep)),w
	xorlw	0FFh
	skipz
	goto	u2801
	goto	u2800
u2801:
	goto	l862
u2800:
	line	159
	
l864:	
	return
	opt stack 0
GLOBAL	__end_of_beep
	__end_of_beep:
;; =============== function _beep ends ============

	signat	_beep,8312
	global	___awdiv
psect	text881,local,class=CODE,delta=2
global __ptext881
__ptext881:

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
psect	text881
	file	"D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 5
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l6555:	
	clrf	(___awdiv@sign)
	line	10
	
l6557:	
	btfss	(___awdiv@divisor+1),7
	goto	u2731
	goto	u2730
u2731:
	goto	l6563
u2730:
	line	11
	
l6559:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	
l6561:	
	clrf	(___awdiv@sign)
	incf	(___awdiv@sign),f
	line	14
	
l6563:	
	btfss	(___awdiv@dividend+1),7
	goto	u2741
	goto	u2740
u2741:
	goto	l6569
u2740:
	line	15
	
l6565:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l6567:	
	movlw	(01h)
	xorwf	(___awdiv@sign),f
	line	18
	
l6569:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l6571:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2751
	goto	u2750
u2751:
	goto	l6591
u2750:
	line	20
	
l6573:	
	clrf	(___awdiv@counter)
	incf	(___awdiv@counter),f
	line	21
	goto	l6577
	line	22
	
l6575:	
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	line	23
	incf	(___awdiv@counter),f
	line	21
	
l6577:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2761
	goto	u2760
u2761:
	goto	l6575
u2760:
	line	26
	
l6579:	
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	line	27
	
l6581:	
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2775
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2775:
	skipc
	goto	u2771
	goto	u2770
u2771:
	goto	l6587
u2770:
	line	28
	
l6583:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l6585:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	line	31
	
l6587:	
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	line	32
	
l6589:	
	decfsz	(___awdiv@counter),f
	goto	u2781
	goto	u2780
u2781:
	goto	l6579
u2780:
	line	34
	
l6591:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2790
	goto	l6595
u2790:
	line	35
	
l6593:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	line	36
	
l6595:	
	movf	(___awdiv@quotient+1),w
	movwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	movwf	(?___awdiv)
	line	37
	
l4245:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	_int_init
psect	text882,local,class=CODE,delta=2
global __ptext882
__ptext882:

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
psect	text882
	file	"sysinit.c"
	line	83
	global	__size_of_int_init
	__size_of_int_init	equ	__end_of_int_init-_int_init
	
_int_init:	
	opt	stack 5
; Regs used in _int_init: [wreg+status,2]
	line	88
	
l6523:	
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
	
l6525:	
;sysinit.c: 92: IOCA5 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1205/8)^080h,(1205)&7
	line	93
	
l6527:	
;sysinit.c: 93: tmp = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	94
	
l6529:	
;sysinit.c: 94: PAIF = 0;
	bcf	(88/8),(88)&7
	line	95
	
l6531:	
;sysinit.c: 95: PAIE = 0;
	bcf	(91/8),(91)&7
	line	98
	
l6533:	
;sysinit.c: 98: INTEDG = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1038/8)^080h,(1038)&7
	line	99
	
l6535:	
;sysinit.c: 99: INTF = 0;
	bcf	(89/8),(89)&7
	line	100
	
l6537:	
;sysinit.c: 100: INTE = 1;
	bsf	(92/8),(92)&7
	line	102
	
l6539:	
;sysinit.c: 102: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(97/8),(97)&7
	line	103
	
l6541:	
;sysinit.c: 103: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	104
	
l6543:	
;sysinit.c: 104: TMR2ON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	110
	
l6545:	
;sysinit.c: 110: T0IF = 0;
	bcf	(90/8),(90)&7
	line	111
	
l6547:	
;sysinit.c: 111: T0IE = 1;
	bsf	(93/8),(93)&7
	line	112
	
l6549:	
;sysinit.c: 112: T0ON = 1;
	bsf	(251/8),(251)&7
	line	114
	
l6551:	
;sysinit.c: 114: PEIE = 1;
	bsf	(94/8),(94)&7
	line	116
	
l6553:	
;sysinit.c: 116: GIE = 1;
	bsf	(95/8),(95)&7
	line	117
	
l1807:	
	return
	opt stack 0
GLOBAL	__end_of_int_init
	__end_of_int_init:
;; =============== function _int_init ends ============

	signat	_int_init,88
	global	_timer_init
psect	text883,local,class=CODE,delta=2
global __ptext883
__ptext883:

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
psect	text883
	file	"sysinit.c"
	line	51
	global	__size_of_timer_init
	__size_of_timer_init	equ	__end_of_timer_init-_timer_init
	
_timer_init:	
	opt	stack 5
; Regs used in _timer_init: [wreg+status,2]
	line	60
	
l6515:	
;sysinit.c: 60: T0CON0 = 0B00000000;
	clrf	(31)	;volatile
	line	61
	
l6517:	
;sysinit.c: 61: OPTION = 0B00000111;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(129)^080h	;volatile
	line	62
	
l6519:	
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
	
l6521:	
;sysinit.c: 68: T2CON0 = 0B00101001;
	movlw	(029h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	80
	
l1804:	
	return
	opt stack 0
GLOBAL	__end_of_timer_init
	__end_of_timer_init:
;; =============== function _timer_init ends ============

	signat	_timer_init,88
	global	_gpio_init
psect	text884,local,class=CODE,delta=2
global __ptext884
__ptext884:

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
psect	text884
	file	"sysinit.c"
	line	32
	global	__size_of_gpio_init
	__size_of_gpio_init	equ	__end_of_gpio_init-_gpio_init
	
_gpio_init:	
	opt	stack 5
; Regs used in _gpio_init: [wreg+status,2]
	line	34
	
l6505:	
;sysinit.c: 34: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	35
	
l6507:	
;sysinit.c: 35: TRISA = 0B00110111;
	movlw	(037h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	36
	
l6509:	
;sysinit.c: 36: WPUA = 0B11000000;
	movlw	(0C0h)
	movwf	(149)^080h	;volatile
	line	38
;sysinit.c: 38: PORTC = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	39
	
l6511:	
;sysinit.c: 39: TRISC = 0B11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	40
	
l6513:	
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
	
l1801:	
	return
	opt stack 0
GLOBAL	__end_of_gpio_init
	__end_of_gpio_init:
;; =============== function _gpio_init ends ============

	signat	_gpio_init,88
	global	_compe
psect	text885,local,class=CODE,delta=2
global __ptext885
__ptext885:

;; *************** function _compe *****************
;; Defined at:
;;		line 190 in file "smartkey.C"
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
psect	text885
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
	
l6467:	
;smartkey.C: 192: if (a > b) {
	movf	(compe@b),w
	xorlw	80h
	movwf	(??_compe+0)+0
	movf	(compe@a),w
	xorlw	80h
	subwf	(??_compe+0)+0
	skipnc
	goto	u2661
	goto	u2660
u2661:
	goto	l6481
u2660:
	line	193
	
l6469:	
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
	goto	u2675o
	incf	((??_compe+0)+0)+1,f
	
u2675o:
	
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
	goto	u2685
	movf	0+(??_compe+0)+0,w
	subwf	0+(??_compe+2)+0,w
u2685:

	skipc
	goto	u2681
	goto	u2680
u2681:
	goto	l6477
u2680:
	
l6471:	
	movlw	(01h)
	goto	l884
	line	194
	
l6477:	
;smartkey.C: 194: else return 0;
	movlw	(0)
	goto	l884
	line	196
	
l6481:	
;smartkey.C: 196: else if (a < b) {
	movf	(compe@a),w
	xorlw	80h
	movwf	(??_compe+0)+0
	movf	(compe@b),w
	xorlw	80h
	subwf	(??_compe+0)+0
	skipnc
	goto	u2691
	goto	u2690
u2691:
	goto	l6495
u2690:
	line	197
	
l6483:	
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
	goto	u2705o
	incf	((??_compe+0)+0)+1,f
	
u2705o:
	
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
	goto	u2715
	movf	0+(??_compe+0)+0,w
	subwf	0+(??_compe+2)+0,w
u2715:

	skipc
	goto	u2711
	goto	u2710
u2711:
	goto	l6477
u2710:
	goto	l6471
	line	200
	
l6495:	
;smartkey.C: 200: else if (a == b) {
	movf	(compe@a),w
	xorwf	(compe@b),w
	skipz
	goto	u2721
	goto	u2720
u2721:
	goto	l6477
u2720:
	goto	l6471
	line	204
	
l884:	
	return
	opt stack 0
GLOBAL	__end_of_compe
	__end_of_compe:
;; =============== function _compe ends ============

	signat	_compe,12409
	global	_setState
psect	text886,local,class=CODE,delta=2
global __ptext886
__ptext886:

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
psect	text886
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
	
l6461:	
;smartkey.C: 185: mtOldState = mtState;
	movf	(_mtState),w
	movwf	(_mtOldState)
	line	186
;smartkey.C: 186: mtState = stt;
	movf	(setState@stt),w
	movwf	(_mtState)
	line	187
	
l6463:	
;smartkey.C: 187: timeTick = 0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	188
	
l6465:	
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
psect	text887,local,class=CODE,delta=2
global __ptext887
__ptext887:

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
psect	text887
	file	"smartkey.C"
	line	142
	global	__size_of_beepOn
	__size_of_beepOn	equ	__end_of_beepOn-_beepOn
	
_beepOn:	
	opt	stack 5
; Regs used in _beepOn: []
	line	143
	
l6459:	
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
psect	text888,local,class=CODE,delta=2
global __ptext888
__ptext888:

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
psect	text888
	file	"smartkey.C"
	line	139
	global	__size_of_beepOff
	__size_of_beepOff	equ	__end_of_beepOff-_beepOff
	
_beepOff:	
	opt	stack 5
; Regs used in _beepOff: []
	line	140
	
l6457:	
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
psect	text889,local,class=CODE,delta=2
global __ptext889
__ptext889:

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
psect	text889
	file	"smartkey.C"
	line	134
	global	__size_of_delay_x10ms
	__size_of_delay_x10ms	equ	__end_of_delay_x10ms-_delay_x10ms
	
_delay_x10ms:	
	opt	stack 5
; Regs used in _delay_x10ms: [wreg]
	line	135
	
l6453:	
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
	
l6455:	
	movf	(delay_x10ms@set+1),w
	subwf	(_timeTick+1),w
	skipz
	goto	u2655
	movf	(delay_x10ms@set),w
	subwf	(_timeTick),w
u2655:
	skipc
	goto	u2651
	goto	u2650
u2651:
	goto	l6455
u2650:
	line	137
	
l852:	
	return
	opt stack 0
GLOBAL	__end_of_delay_x10ms
	__end_of_delay_x10ms:
;; =============== function _delay_x10ms ends ============

	signat	_delay_x10ms,4216
	global	_WRITE_EEPROM
psect	text890,local,class=CODE,delta=2
global __ptext890
__ptext890:

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
psect	text890
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
	
l6445:	
;smartkey.C: 173: GIE = 0;
	bcf	(95/8),(95)&7
	line	174
;smartkey.C: 174: while (GIE) asm("clrwdt");
	goto	l870
	
l871:	
# 174 "smartkey.C"
clrwdt ;#
psect	text890
	
l870:	
	btfsc	(95/8),(95)&7
	goto	u2631
	goto	u2630
u2631:
	goto	l871
u2630:
	line	175
	
l6447:	
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
	
l6449:	
;smartkey.C: 177: EEIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(103/8),(103)&7
	line	178
;smartkey.C: 178: EECON1 = 0x34;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(156)^080h	;volatile
	line	179
	
l6451:	
;smartkey.C: 179: WR = 1;
	bsf	(1256/8)^080h,(1256)&7
	line	180
;smartkey.C: 180: while (WR) asm("clrwdt");
	goto	l873
	
l874:	
# 180 "smartkey.C"
clrwdt ;#
psect	text890
	
l873:	
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1256/8)^080h,(1256)&7
	goto	u2641
	goto	u2640
u2641:
	goto	l874
u2640:
	
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
psect	text891,local,class=CODE,delta=2
global __ptext891
__ptext891:

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
psect	text891
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
	
l6437:	
;smartkey.C: 163: unsigned char ReEepromData;
;smartkey.C: 164: EEADR = EEAddr;
	movf	(READ_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	165
	
l6439:	
;smartkey.C: 165: RD = 1;
	bsf	(1248/8)^080h,(1248)&7
	line	166
;smartkey.C: 166: ReEepromData = EEDAT;
	movf	(154)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	(READ_EEPROM@ReEepromData)
	line	167
	
l6441:	
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
psect	text892,local,class=CODE,delta=2
global __ptext892
__ptext892:

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
psect	text892
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
psect	text892
	line	47
	
i1l5471:	
	line	50
	
i1l5473:	
;smartkey.C: 50: if (PAIE && PAIF) {
	btfss	(91/8),(91)&7
	goto	u133_21
	goto	u133_20
u133_21:
	goto	i1l5491
u133_20:
	
i1l5475:	
	btfss	(88/8),(88)&7
	goto	u134_21
	goto	u134_20
u134_21:
	goto	i1l5491
u134_20:
	line	51
	
i1l5477:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	52
	
i1l5479:	
;smartkey.C: 52: PAIF = 0;
	bcf	(88/8),(88)&7
	line	54
	
i1l5481:	
;smartkey.C: 54: if (RA5) {
	btfss	(45/8),(45)&7
	goto	u135_21
	goto	u135_20
u135_21:
	goto	i1l5489
u135_20:
	line	55
	
i1l5483:	
;smartkey.C: 55: if (RegStatus.bits.b3 == 0) {
	btfsc	(_RegStatus),3
	goto	u136_21
	goto	u136_20
u136_21:
	goto	i1l5491
u136_20:
	line	56
	
i1l5485:	
;smartkey.C: 56: cntCyc = 0;
	clrf	(_cntCyc)
	line	57
;smartkey.C: 57: cntOff = 0;
	clrf	(_cntOff)
	line	59
	
i1l5487:	
;smartkey.C: 59: RegStatus.bits.b3 = 1;
	bsf	(_RegStatus),3
	goto	i1l5491
	line	63
	
i1l5489:	
;smartkey.C: 62: else {
;smartkey.C: 63: cntOff = 0;
	clrf	(_cntOff)
	line	67
	
i1l5491:	
;smartkey.C: 64: }
;smartkey.C: 65: }
;smartkey.C: 67: if (INTE && INTF) {
	btfss	(92/8),(92)&7
	goto	u137_21
	goto	u137_20
u137_21:
	goto	i1l825
u137_20:
	
i1l5493:	
	btfss	(89/8),(89)&7
	goto	u138_21
	goto	u138_20
u138_21:
	goto	i1l825
u138_20:
	line	68
	
i1l5495:	
;smartkey.C: 68: INTF = 0;
	bcf	(89/8),(89)&7
	line	69
;smartkey.C: 69: if ( RA2 == 0) {
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(42/8),(42)&7
	goto	u139_21
	goto	u139_20
u139_21:
	goto	i1l825
u139_20:
	line	70
	
i1l5497:	
;smartkey.C: 70: if (timeTick < 32) {
	movlw	high(020h)
	subwf	(_timeTick+1),w
	movlw	low(020h)
	skipnz
	subwf	(_timeTick),w
	skipnc
	goto	u140_21
	goto	u140_20
u140_21:
	goto	i1l827
u140_20:
	line	71
	
i1l5499:	
;smartkey.C: 71: tmp = READ_EEPROM(0x3F);
	movlw	(03Fh)
	fcall	i1_READ_EEPROM
	movwf	(ISR@tmp)
	line	72
	
i1l5501:	
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
	goto	u141_21
	goto	u141_20
u141_21:
	goto	i1l5551
u141_20:
	
i1l5503:	
	btfss	(90/8),(90)&7
	goto	u142_21
	goto	u142_20
u142_21:
	goto	i1l5551
u142_20:
	line	80
	
i1l5505:	
;smartkey.C: 80: T0IF = 0;
	bcf	(90/8),(90)&7
	line	81
	
i1l5507:	
;smartkey.C: 81: TMR0 = 179;
	movlw	(0B3h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	87
	
i1l5509:	
;smartkey.C: 87: if ( RegStatus.bits.b3 == 1) {
	btfss	(_RegStatus),3
	goto	u143_21
	goto	u143_20
u143_21:
	goto	i1l5531
u143_20:
	line	89
	
i1l5511:	
;smartkey.C: 89: cntCyc++;
	incf	(_cntCyc),f
	line	90
	
i1l5513:	
;smartkey.C: 90: if (RA5 == 0) {
	btfsc	(45/8),(45)&7
	goto	u144_21
	goto	u144_20
u144_21:
	goto	i1l5531
u144_20:
	line	92
	
i1l5515:	
;smartkey.C: 92: cntOff++;
	incf	(_cntOff),f
	line	94
	
i1l5517:	
;smartkey.C: 94: if (cntOff > 15) {
	movlw	(010h)
	subwf	(_cntOff),w
	skipc
	goto	u145_21
	goto	u145_20
u145_21:
	goto	i1l5531
u145_20:
	line	96
	
i1l5519:	
;smartkey.C: 96: RegStatus.bits.b3 = 0;
	bcf	(_RegStatus),3
	line	98
	
i1l5521:	
;smartkey.C: 98: if ((cntCyc > 15) && (cntCyc < 50)) {
	movlw	(010h)
	subwf	(_cntCyc),w
	skipc
	goto	u146_21
	goto	u146_20
u146_21:
	goto	i1l5527
u146_20:
	
i1l5523:	
	movlw	(032h)
	subwf	(_cntCyc),w
	skipnc
	goto	u147_21
	goto	u147_20
u147_21:
	goto	i1l5527
u147_20:
	line	99
	
i1l5525:	
;smartkey.C: 99: RegStatus.bits.b2 =1;
	bsf	(_RegStatus),2
	line	100
;smartkey.C: 100: } else if (cntCyc >= 50) {
	goto	i1l836
	
i1l5527:	
	movlw	(032h)
	subwf	(_cntCyc),w
	skipc
	goto	u148_21
	goto	u148_20
u148_21:
	goto	i1l836
u148_20:
	line	101
	
i1l5529:	
;smartkey.C: 101: RegStatus.bits.b2 =0;
	bcf	(_RegStatus),2
	line	103
	
i1l836:	
;smartkey.C: 102: }
;smartkey.C: 103: RegStatus.bits.b1 = 1;
	bsf	(_RegStatus),1
	line	108
	
i1l5531:	
;smartkey.C: 104: }
;smartkey.C: 105: }
;smartkey.C: 106: }
;smartkey.C: 108: timeTick++;
	incf	(_timeTick),f
	skipnz
	incf	(_timeTick+1),f
	line	110
	
i1l5533:	
;smartkey.C: 110: if ((mtState == 4) || (mtState == 3)) {
	movf	(_mtState),w
	xorlw	04h
	skipnz
	goto	u149_21
	goto	u149_20
u149_21:
	goto	i1l5537
u149_20:
	
i1l5535:	
	movf	(_mtState),w
	xorlw	03h
	skipz
	goto	u150_21
	goto	u150_20
u150_21:
	goto	i1l5551
u150_20:
	line	111
	
i1l5537:	
;smartkey.C: 111: if (timeTick > cntTmp) {
	movf	(_timeTick+1),w
	subwf	(_cntTmp+1),w
	skipz
	goto	u151_25
	movf	(_timeTick),w
	subwf	(_cntTmp),w
u151_25:
	skipnc
	goto	u151_21
	goto	u151_20
u151_21:
	goto	i1l5551
u151_20:
	line	112
	
i1l5539:	
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
	goto	u152_25
	movf	(_cntTmp),w
	subwf	(_timeOut),w
u152_25:
	skipc
	goto	u152_21
	goto	u152_20
u152_21:
	goto	i1l838
u152_20:
	line	115
	
i1l5541:	
;smartkey.C: 114: {
;smartkey.C: 115: TMR2IE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1121/8)^080h,(1121)&7
	line	116
	
i1l5543:	
;smartkey.C: 116: if (PR2L == 20)
	movf	(145)^080h,w	;volatile
	xorlw	014h
	skipz
	goto	u153_21
	goto	u153_20
u153_21:
	goto	i1l5547
u153_20:
	line	117
	
i1l5545:	
;smartkey.C: 117: PR2L = 25;
	movlw	(019h)
	movwf	(145)^080h	;volatile
	goto	i1l5549
	line	119
	
i1l5547:	
;smartkey.C: 118: else
;smartkey.C: 119: PR2L = 20;
	movlw	(014h)
	movwf	(145)^080h	;volatile
	line	120
	
i1l5549:	
;smartkey.C: 120: TMR2IE = 1;
	bsf	(1121/8)^080h,(1121)&7
	goto	i1l5551
	line	123
	
i1l838:	
	line	127
	
i1l5551:	
;smartkey.C: 121: }
;smartkey.C: 122: }
;smartkey.C: 123: }
;smartkey.C: 124: }
;smartkey.C: 127: if (TMR2IE && TMR2IF)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1121/8)^080h,(1121)&7
	goto	u154_21
	goto	u154_20
u154_21:
	goto	i1l846
u154_20:
	
i1l5553:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u155_21
	goto	u155_20
u155_21:
	goto	i1l846
u155_20:
	line	129
	
i1l5555:	
;smartkey.C: 128: {
;smartkey.C: 129: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	130
	
i1l5557:	
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
psect	text893,local,class=CODE,delta=2
global __ptext893
__ptext893:

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
psect	text893
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
	
i1l5729:	
;smartkey.C: 173: GIE = 0;
	bcf	(95/8),(95)&7
	line	174
;smartkey.C: 174: while (GIE) asm("clrwdt");
	goto	i1l870
	
i1l871:	
# 174 "smartkey.C"
clrwdt ;#
psect	text893
	
i1l870:	
	btfsc	(95/8),(95)&7
	goto	u173_21
	goto	u173_20
u173_21:
	goto	i1l871
u173_20:
	line	175
	
i1l5731:	
;smartkey.C: 175: EEADR = EEAddr;
	movf	(i1WRITE_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	176
;smartkey.C: 176: EEDAT = EEData;
	movf	(i1WRITE_EEPROM@EEData),w
	movwf	(154)^080h	;volatile
	line	177
	
i1l5733:	
;smartkey.C: 177: EEIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(103/8),(103)&7
	line	178
;smartkey.C: 178: EECON1 = 0x34;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(156)^080h	;volatile
	line	179
	
i1l5735:	
;smartkey.C: 179: WR = 1;
	bsf	(1256/8)^080h,(1256)&7
	line	180
;smartkey.C: 180: while (WR) asm("clrwdt");
	goto	i1l873
	
i1l874:	
# 180 "smartkey.C"
clrwdt ;#
psect	text893
	
i1l873:	
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1256/8)^080h,(1256)&7
	goto	u174_21
	goto	u174_20
u174_21:
	goto	i1l874
u174_20:
	
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
psect	text894,local,class=CODE,delta=2
global __ptext894
__ptext894:

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
psect	text894
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
	
i1l5721:	
;smartkey.C: 163: unsigned char ReEepromData;
;smartkey.C: 164: EEADR = EEAddr;
	movf	(i1READ_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	165
	
i1l5723:	
;smartkey.C: 165: RD = 1;
	bsf	(1248/8)^080h,(1248)&7
	line	166
;smartkey.C: 166: ReEepromData = EEDAT;
	movf	(154)^080h,w	;volatile
	movwf	(i1READ_EEPROM@ReEepromData)
	line	167
	
i1l5725:	
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
psect	text895,local,class=CODE,delta=2
global __ptext895
__ptext895:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end

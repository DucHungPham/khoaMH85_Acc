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
	FNCALL	_main,_int_init
	FNCALL	_main,_timer_init
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
	global	_PSTRCON
psect	text860,local,class=CODE,delta=2
global __ptext860
__ptext860:
_PSTRCON	set	413
	DABS	1,413,1	;_PSTRCON

	global	_SRCON
_SRCON	set	414
	DABS	1,414,1	;_SRCON

	global	_C1SEN
_C1SEN	set	3317
	DABS	1,414,1	;_C1SEN

	global	_C2REN
_C2REN	set	3316
	DABS	1,414,1	;_C2REN

	global	_EEPGD
_EEPGD	set	3175
	DABS	1,396,1	;_EEPGD

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

	global	_WREN
_WREN	set	3170
	DABS	1,396,1	;_WREN

	global	_INTCON
_INTCON	set	11
	global	_PIR1
_PIR1	set	12
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_T1CON
_T1CON	set	16
	global	_T2CON
_T2CON	set	18
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_TMR2
_TMR2	set	17
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
	global	_RA0
_RA0	set	40
	global	_RA1
_RA1	set	41
	global	_RA4
_RA4	set	44
	global	_RA6
_RA6	set	46
	global	_RA7
_RA7	set	47
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC4
_RC4	set	60
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR1ON
_TMR1ON	set	128
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
	global	_OSCCON
_OSCCON	set	143
	global	_PIE1
_PIE1	set	140
	global	_PR2
_PR2	set	146
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WPUA
_WPUA	set	149
	global	_WPUC
_WPUC	set	136
	global	_HTS
_HTS	set	1146
	global	_INTEDG
_INTEDG	set	1038
	global	_IOCA6
_IOCA6	set	1206
	global	_RD
_RD	set	1248
	global	_TMR1IE
_TMR1IE	set	1120
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
	global	?_int_init
?_int_init:	; 0 bytes @ 0x0
	global	?_timer_init
?_timer_init:	; 0 bytes @ 0x0
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
	global	ISR@tmp_1057
ISR@tmp_1057:	; 1 bytes @ 0x4
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
	global	??_int_init
??_int_init:	; 0 bytes @ 0x0
	global	??_timer_init
??_timer_init:	; 0 bytes @ 0x0
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
	global	main@acYOld
main@acYOld:	; 1 bytes @ 0x12
	ds	1
	global	main@acXOld
main@acXOld:	; 1 bytes @ 0x13
	ds	1
	global	main@vibrateOn
main@vibrateOn:	; 1 bytes @ 0x14
	ds	1
	global	main@buf
main@buf:	; 6 bytes @ 0x15
	ds	6
	global	main@reAlertOn
main@reAlertOn:	; 1 bytes @ 0x1B
	ds	1
	global	main@mpuOk
main@mpuOk:	; 1 bytes @ 0x1C
	ds	1
	global	main@acYsum
main@acYsum:	; 2 bytes @ 0x1D
	ds	2
	global	main@acXsum
main@acXsum:	; 2 bytes @ 0x1F
	ds	2
	global	main@isSw
main@isSw:	; 1 bytes @ 0x21
	ds	1
	global	main@tmp16
main@tmp16:	; 2 bytes @ 0x22
	ds	2
	global	main@tmp8
main@tmp8:	; 1 bytes @ 0x24
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 13, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5      10
;; BANK0           80     37      45
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
;; (0) _main                                                26    26      0    4115
;;                                             12 BANK0     25    25      0
;;                           _sys_init
;;                          _gpio_init
;;                           _int_init
;;                         _timer_init
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
;; (1) _timer_init                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _int_init                                             1     1      0       0
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
;;   _int_init
;;   _timer_init
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
;;EEDATA              80      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      5       A       1       71.4%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       6       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50     25      2D       4       56.3%
;;BITBANK1            20      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BANK1               20      0       0       6        0.0%
;;ABS                  0      0      37       7        0.0%
;;DATA                 0      0      3D       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 249 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf             6   21[BANK0 ] char [6]
;;  tmp16           2   34[BANK0 ] unsigned int 
;;  acXsum          2   31[BANK0 ] int 
;;  acYsum          2   29[BANK0 ] int 
;;  isWait          2   15[BANK0 ] unsigned int 
;;  tmp8            1   36[BANK0 ] unsigned char 
;;  isSw            1   33[BANK0 ] unsigned char 
;;  mpuOk           1   28[BANK0 ] unsigned char 
;;  reAlertOn       1   27[BANK0 ] unsigned char 
;;  vibrateOn       1   20[BANK0 ] unsigned char 
;;  acXOld          1   19[BANK0 ] char 
;;  acYOld          1   18[BANK0 ] char 
;;  isFall          1   17[BANK0 ] unsigned char 
;;  accSet          1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0      22       0
;;      Temps:          0       3       0
;;      Totals:         0      25       0
;;Total ram usage:       25 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_sys_init
;;		_gpio_init
;;		_int_init
;;		_timer_init
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
	line	249
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	252
	
l6158:	
# 252 "smartkey.C"
 MOVLW 0x07 ;#
	line	253
# 253 "smartkey.C"
 MOVWF 0x19 ;#
psect	maintext
	line	256
	
l6160:	
;smartkey.C: 256: unsigned char reAlertOn=0,tmp8,isSw=0,isFall=0,mpuOk=0,vibrateOn=0,accSet=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@reAlertOn)
	clrf	(main@isSw)
	clrf	(main@isFall)
	clrf	(main@vibrateOn)
	line	257
;smartkey.C: 257: unsigned int isWait =0;
	clrf	(main@isWait)
	clrf	(main@isWait+1)
	line	258
;smartkey.C: 258: signed int acYsum=0,acXsum=0;
	clrf	(main@acYsum)
	clrf	(main@acYsum+1)
	clrf	(main@acXsum)
	clrf	(main@acXsum+1)
	line	259
;smartkey.C: 259: unsigned int tmp16=0;
	clrf	(main@tmp16)
	clrf	(main@tmp16+1)
	line	263
	
l6162:	
# 263 "smartkey.C"
clrwdt ;#
psect	maintext
	line	265
	
l6164:	
;smartkey.C: 265: sys_init();
	fcall	_sys_init
	line	266
	
l6166:	
;smartkey.C: 266: gpio_init();
	fcall	_gpio_init
	line	267
	
l6168:	
;smartkey.C: 267: int_init();
	fcall	_int_init
	line	268
	
l6170:	
;smartkey.C: 268: timer_init();
	fcall	_timer_init
	line	270
	
l6172:	
;smartkey.C: 270: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3537:
	decfsz	((??_main+0)+0),f
	goto	u3537
	decfsz	((??_main+0)+0+1),f
	goto	u3537
	nop2
opt asmopt_on

	line	271
	
l6174:	
;smartkey.C: 271: RA7 =1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(47/8),(47)&7
	line	272
	
l6176:	
;smartkey.C: 272: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3547:
	decfsz	((??_main+0)+0),f
	goto	u3547
	decfsz	((??_main+0)+0+1),f
	goto	u3547
	nop2
opt asmopt_on

	line	274
	
l6178:	
;smartkey.C: 274: PAIE = 1;
	bsf	(91/8),(91)&7
	line	276
;smartkey.C: 276: RegStatus = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_RegStatus)
	line	278
	
l6180:	
;smartkey.C: 278: swI2C_Init();
	fcall	_swI2C_Init
	line	281
	
l6182:	
;smartkey.C: 281: setState(0,0);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	283
	
l6184:	
;smartkey.C: 283: WRITE_EEPROM(0x7F,0xAA);
	movlw	(0AAh)
	movwf	(?_WRITE_EEPROM)
	movlw	(07Fh)
	fcall	_WRITE_EEPROM
	line	284
	
l6186:	
;smartkey.C: 284: WRITE_EEPROM(0x7F,0xAA);
	movlw	(0AAh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_WRITE_EEPROM)
	movlw	(07Fh)
	fcall	_WRITE_EEPROM
	line	288
	
l6188:	
;smartkey.C: 288: _delay((unsigned long)((200)*(4000000/4000.0)));
	opt asmopt_off
movlw  2
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	4
movwf	((??_main+0)+0+1),f
	movlw	186
movwf	((??_main+0)+0),f
u3557:
	decfsz	((??_main+0)+0),f
	goto	u3557
	decfsz	((??_main+0)+0+1),f
	goto	u3557
	decfsz	((??_main+0)+0+2),f
	goto	u3557
	clrwdt
opt asmopt_on

	line	290
	
l6190:	
;smartkey.C: 290: tmp8= READ_EEPROM(0x08);
	movlw	(08h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	291
	
l6192:	
;smartkey.C: 291: if(tmp8==0xff) {WRITE_EEPROM(0x08,0);_delay((unsigned long)((2)*(4000000/4000.0)));}
	movf	(main@tmp8),w
	xorlw	0FFh
	skipz
	goto	u2861
	goto	u2860
u2861:
	goto	l6198
u2860:
	
l6194:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	
l6196:	
	opt asmopt_off
movlw	3
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u3567:
	decfsz	((??_main+0)+0),f
	goto	u3567
	decfsz	((??_main+0)+0+1),f
	goto	u3567
	nop2
opt asmopt_on

	line	293
	
l6198:	
;smartkey.C: 293: if(tmp8==0xcc){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@tmp8),w
	xorlw	0CCh
	skipz
	goto	u2871
	goto	u2870
u2871:
	goto	l6212
u2870:
	line	294
	
l6200:	
;smartkey.C: 294: RegStatus &=~(0x20);
	bcf	(_RegStatus)+(5/8),(5)&7
	line	295
	
l6202:	
;smartkey.C: 295: setState(3,1800);
	movlw	low(0708h)
	movwf	(?_setState)
	movlw	high(0708h)
	movwf	((?_setState))+1
	movlw	(03h)
	fcall	_setState
	line	296
	
l6204:	
;smartkey.C: 296: mtOldState = 1;
	clrf	(_mtOldState)
	incf	(_mtOldState),f
	line	297
	
l6206:	
;smartkey.C: 297: cntTmp = timeTick+50;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l6208:	
	movlw	032h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	298
	
l6210:	
;smartkey.C: 298: PR2 =12;
	movlw	(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	299
;smartkey.C: 299: beepOn();
	fcall	_beepOn
	line	300
;smartkey.C: 300: } else {
	goto	l6216
	line	301
	
l6212:	
;smartkey.C: 301: setState(2,400);
	movlw	low(0190h)
	movwf	(?_setState)
	movlw	high(0190h)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	303
	
l6214:	
;smartkey.C: 303: mtOldState = 0;
	clrf	(_mtOldState)
	line	310
	
l6216:	
;smartkey.C: 307: }
;smartkey.C: 310: tmp8 = READ_EEPROM(0x40);
	movlw	(040h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	311
	
l6218:	
;smartkey.C: 311: if(tmp8==8){
	movf	(main@tmp8),w
	xorlw	08h
	skipz
	goto	u2881
	goto	u2880
u2881:
	goto	l6234
u2880:
	line	312
	
l6220:	
;smartkey.C: 312: tmp8= READ_EEPROM(0x41);
	movlw	(041h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	313
	
l6222:	
;smartkey.C: 313: beep(25,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(019h)
	fcall	_beep
	line	314
	
l6224:	
;smartkey.C: 314: if(tmp8){
	movf	(main@tmp8),w
	skipz
	goto	u2890
	goto	l6228
u2890:
	line	315
	
l6226:	
;smartkey.C: 315: WRITE_EEPROM(0x41,0);
	clrf	(?_WRITE_EEPROM)
	movlw	(041h)
	fcall	_WRITE_EEPROM
	line	316
;smartkey.C: 316: }
	goto	l767
	line	318
	
l6228:	
;smartkey.C: 317: else {
;smartkey.C: 318: WRITE_EEPROM(0x41,0x1);
	clrf	(?_WRITE_EEPROM)
	incf	(?_WRITE_EEPROM),f
	movlw	(041h)
	fcall	_WRITE_EEPROM
	line	320
	
l767:	
	line	321
;smartkey.C: 320: }
;smartkey.C: 321: WRITE_EEPROM(0x40,0);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	line	322
	
l6230:	
	line	323
	
l6232:	
;smartkey.C: 323: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3577:
	decfsz	((??_main+0)+0),f
	goto	u3577
	decfsz	((??_main+0)+0+1),f
	goto	u3577
	nop2
opt asmopt_on

	line	330
	
l6234:	
;smartkey.C: 324: }
;smartkey.C: 330: tmp8 = READ_EEPROM(0x41);
	movlw	(041h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	331
	
l6236:	
;smartkey.C: 331: if(tmp8){
	movf	(main@tmp8),w
	skipz
	goto	u2900
	goto	l6244
u2900:
	line	332
	
l6238:	
;smartkey.C: 332: RC4 =1;RC2 =1;
	bsf	(60/8),(60)&7
	bsf	(58/8),(58)&7
	line	334
	
l6240:	
;smartkey.C: 334: _delay((unsigned long)((1000)*(4000000/4000.0)));
	opt asmopt_off
movlw  6
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	19
movwf	((??_main+0)+0+1),f
	movlw	177
movwf	((??_main+0)+0),f
u3587:
	decfsz	((??_main+0)+0),f
	goto	u3587
	decfsz	((??_main+0)+0+1),f
	goto	u3587
	decfsz	((??_main+0)+0+2),f
	goto	u3587
	nop2
opt asmopt_on

	line	335
;smartkey.C: 335: if(timeTick >300) WRITE_EEPROM(0x40,0);
	movlw	high(012Dh)
	subwf	(_timeTick+1),w
	movlw	low(012Dh)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u2911
	goto	u2910
u2911:
	goto	l6240
u2910:
	
l6242:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	goto	l6240
	line	358
	
l6244:	
;smartkey.C: 336: }
;smartkey.C: 337: }
;smartkey.C: 357: {
;smartkey.C: 358: buf[0] = 0x28;
	movlw	(028h)
	movwf	(main@buf)
	line	359
;smartkey.C: 359: buf[1] = 0x87;
	movlw	(-121)
	movwf	0+(main@buf)+01h
	line	360
	
l6246:	
;smartkey.C: 360: if(AccWrite(0x6b,(unsigned char)buf,2)==0) mpuOk =1;
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
	movlw	(06Bh)
	fcall	_AccWrite
	iorlw	0
	skipz
	goto	u2921
	goto	u2920
u2921:
	goto	l6250
u2920:
	
l6248:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@mpuOk)
	incf	(main@mpuOk),f
	goto	l6252
	line	361
	
l6250:	
;smartkey.C: 361: else mpuOk =0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@mpuOk)
	line	363
	
l6252:	
;smartkey.C: 363: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3597:
	decfsz	((??_main+0)+0),f
	goto	u3597
	decfsz	((??_main+0)+0+1),f
	goto	u3597
	nop2
opt asmopt_on

	line	365
	
l6254:	
;smartkey.C: 364: }
;smartkey.C: 365: if(mpuOk ==0){beep(10,2);}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@mpuOk),f
	skipz
	goto	u2931
	goto	u2930
u2931:
	goto	l6258
u2930:
	
l6256:	
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	370
	
l6258:	
;smartkey.C: 370: tmp8= READ_EEPROM(0x40);
	movlw	(040h)
	fcall	_READ_EEPROM
	movwf	(main@tmp8)
	line	371
	
l6260:	
;smartkey.C: 371: if(tmp8==6 && mpuOk ==1)
	movf	(main@tmp8),w
	xorlw	06h
	skipz
	goto	u2941
	goto	u2940
u2941:
	goto	l6298
u2940:
	
l6262:	
	decf	(main@mpuOk),w
	skipz
	goto	u2951
	goto	u2950
u2951:
	goto	l6298
u2950:
	line	373
	
l6264:	
;smartkey.C: 372: {
;smartkey.C: 373: tmp8=0; beep(10,3);
	clrf	(main@tmp8)
	
l6266:	
	movlw	(03h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	374
;smartkey.C: 374: while((RC1 )&&(tmp8<11))
	goto	l6276
	line	376
	
l6268:	
;smartkey.C: 375: {
;smartkey.C: 376: if(AccRead(0x3b,(unsigned char)buf,6)==0){
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
	movlw	(03Bh)
	fcall	_AccRead
	iorlw	0
	skipz
	goto	u2961
	goto	u2960
u2961:
	goto	l6274
u2960:
	line	378
	
l6270:	
;smartkey.C: 378: acXsum += buf[0];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@buf),w
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
	line	379
;smartkey.C: 379: acYsum += buf[2];
	movf	0+(main@buf)+02h,w
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
	line	380
;smartkey.C: 380: tmp16 = (signed int)tmp16 + buf[4];
	movf	0+(main@buf)+04h,w
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
	line	381
	
l6272:	
;smartkey.C: 381: tmp8++;
	incf	(main@tmp8),f
	line	383
	
l6274:	
;smartkey.C: 382: }
;smartkey.C: 383: _delay((unsigned long)((500)*(4000000/4000.0)));
	opt asmopt_off
movlw  3
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u3607:
	decfsz	((??_main+0)+0),f
	goto	u3607
	decfsz	((??_main+0)+0+1),f
	goto	u3607
	decfsz	((??_main+0)+0+2),f
	goto	u3607
	nop2
opt asmopt_on

	line	374
	
l6276:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(57/8),(57)&7
	goto	u2971
	goto	u2970
u2971:
	goto	l6280
u2970:
	
l6278:	
	movlw	(0Bh)
	subwf	(main@tmp8),w
	skipc
	goto	u2981
	goto	u2980
u2981:
	goto	l6268
u2980:
	line	387
	
l6280:	
;smartkey.C: 385: }
;smartkey.C: 387: if(tmp8==11){
	movf	(main@tmp8),w
	xorlw	0Bh
	skipz
	goto	u2991
	goto	u2990
u2991:
	goto	l6294
u2990:
	line	388
	
l6282:	
;smartkey.C: 388: acXsum =acXsum/10;
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
	line	389
;smartkey.C: 389: acYsum = acYsum/10;
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
	line	390
;smartkey.C: 390: tmp16 = (signed int)tmp16/10;
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
	line	392
	
l6284:	
;smartkey.C: 392: if(((signed int)tmp16 > (-31)) && ((signed int)tmp16 < 31)){
	movf	(main@tmp16+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(-30))^80h
	subwf	btemp+1,w
	skipz
	goto	u3005
	movlw	low(-30)
	subwf	(main@tmp16),w
u3005:

	skipc
	goto	u3001
	goto	u3000
u3001:
	goto	l6290
u3000:
	
l6286:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@tmp16+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01Fh))^80h
	subwf	btemp+1,w
	skipz
	goto	u3015
	movlw	low(01Fh)
	subwf	(main@tmp16),w
u3015:

	skipnc
	goto	u3011
	goto	u3010
u3011:
	goto	l6290
u3010:
	line	393
	
l6288:	
;smartkey.C: 393: beep(10,2);
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	394
;smartkey.C: 394: }
	goto	l786
	line	398
	
l6290:	
;smartkey.C: 395: else
;smartkey.C: 397: {
;smartkey.C: 398: beep(10,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	399
;smartkey.C: 399: WRITE_EEPROM(0x10,(unsigned char)acXsum);
	movf	(main@acXsum),w
	movwf	(?_WRITE_EEPROM)
	movlw	(010h)
	fcall	_WRITE_EEPROM
	line	400
;smartkey.C: 400: WRITE_EEPROM(0x11,(unsigned char)acYsum);
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acYsum),w
	movwf	(?_WRITE_EEPROM)
	movlw	(011h)
	fcall	_WRITE_EEPROM
	line	401
	
l6292:	
;smartkey.C: 401: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3617:
	decfsz	((??_main+0)+0),f
	goto	u3617
	decfsz	((??_main+0)+0+1),f
	goto	u3617
	nop2
opt asmopt_on

	goto	l786
	line	405
	
l6294:	
;smartkey.C: 405: beep(10,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	406
	
l786:	
	line	407
;smartkey.C: 406: }
;smartkey.C: 407: WRITE_EEPROM(0x40,0);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	line	408
	
l6296:	
	line	411
	
l6298:	
;smartkey.C: 409: }
;smartkey.C: 411: acXsum = (signed char)READ_EEPROM(0x10);
	movlw	(010h)
	fcall	_READ_EEPROM
	movwf	(main@acXsum)
	clrf	(main@acXsum+1)
	btfsc	(main@acXsum),7
	decf	(main@acXsum+1),f
	line	412
	
l6300:	
;smartkey.C: 412: acYsum = (signed char)READ_EEPROM(0x11);
	movlw	(011h)
	fcall	_READ_EEPROM
	movwf	(main@acYsum)
	clrf	(main@acYsum+1)
	btfsc	(main@acYsum),7
	decf	(main@acYsum+1),f
	line	414
	
l6302:	
;smartkey.C: 414: timeTick = 0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	423
	
l6304:	
;smartkey.C: 423: if(mode_chek == 0)
	movf	(_mode_chek),f
	skipz
	goto	u3021
	goto	u3020
u3021:
	goto	l6412
u3020:
	line	426
	
l6306:	
;smartkey.C: 424: {
;smartkey.C: 426: if(RegStatus & 0x80)
	btfss	(_RegStatus),(7)&7
	goto	u3031
	goto	u3030
u3031:
	goto	l6412
u3030:
	line	428
	
l6308:	
;smartkey.C: 427: {
;smartkey.C: 428: PAIE = 0;
	bcf	(91/8),(91)&7
	line	431
;smartkey.C: 431: RegStatus &= (~0x80);
	bcf	(_RegStatus)+(7/8),(7)&7
	line	445
;smartkey.C: 443: {
;smartkey.C: 445: if ((RegStatus & 0x40) !=0){
	btfss	(_RegStatus),(6)&7
	goto	u3041
	goto	u3040
u3041:
	goto	l6410
u3040:
	goto	l6374
	line	451
	
l6312:	
;smartkey.C: 451: lostDetect =0;
	clrf	(_lostDetect)
	line	452
;smartkey.C: 452: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	453
	
l6314:	
;smartkey.C: 453: tmp16 = 40;
	movlw	028h
	movwf	(main@tmp16)
	clrf	(main@tmp16+1)
	line	454
;smartkey.C: 454: break;
	goto	l812
	line	457
	
l6316:	
;smartkey.C: 457: if(timeTick >30){
	movlw	high(01Fh)
	subwf	(_timeTick+1),w
	movlw	low(01Fh)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3051
	goto	u3050
u3051:
	goto	l812
u3050:
	line	458
	
l6318:	
;smartkey.C: 458: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	460
	
l6320:	
;smartkey.C: 460: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u3061
	goto	u3060
u3061:
	goto	l6324
u3060:
	
l6322:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	462
	
l6324:	
;smartkey.C: 462: if((mtOldState == 3)){
	bcf	status, 5	;RP0=0, select bank0
	movf	(_mtOldState),w
	xorlw	03h
	skipz
	goto	u3071
	goto	u3070
u3071:
	goto	l6334
u3070:
	line	463
	
l6326:	
;smartkey.C: 463: beepOn();TMR2ON = 0; beep(10,1);
	fcall	_beepOn
	
l6328:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l6330:	
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	464
;smartkey.C: 464: if(reAlertOn)reAlertOn =0;
	movf	(main@reAlertOn),w
	skipz
	goto	u3080
	goto	l812
u3080:
	
l6332:	
	clrf	(main@reAlertOn)
	goto	l812
	line	466
	
l6334:	
;smartkey.C: 466: else if((mtOldState == 0)||(mtOldState == 4)){
	movf	(_mtOldState),w
	skipz
	goto	u3090
	goto	l802
u3090:
	
l6336:	
	movf	(_mtOldState),w
	xorlw	04h
	skipz
	goto	u3101
	goto	u3100
u3101:
	goto	l6348
u3100:
	
l802:	
	line	467
;smartkey.C: 467: RegStatus |=(0x20);
	bsf	(_RegStatus)+(5/8),(5)&7
	line	468
	
l6338:	
;smartkey.C: 468: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	469
	
l6340:	
;smartkey.C: 469: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
	movlw	(040h)
	fcall	_READ_EEPROM
	xorlw	0
	skipnz
	goto	u3111
	goto	u3110
u3111:
	goto	l6344
u3110:
	
l6342:	
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	line	470
	
l6344:	
;smartkey.C: 470: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l6346:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	471
;smartkey.C: 471: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	472
;smartkey.C: 472: }
	goto	l812
	line	473
	
l6348:	
;smartkey.C: 473: else if((mtOldState == 1)){
	decf	(_mtOldState),w
	skipz
	goto	u3121
	goto	u3120
u3121:
	goto	l812
u3120:
	line	475
	
l6350:	
;smartkey.C: 475: if(reAlertOn)reAlertOn =0;
	movf	(main@reAlertOn),w
	skipz
	goto	u3130
	goto	l795
u3130:
	goto	l6332
	line	477
	
l795:	
	line	478
;smartkey.C: 476: }
;smartkey.C: 477: }
;smartkey.C: 478: break;
	goto	l812
	line	481
	
l6354:	
;smartkey.C: 481: if(timeTick > 200)
	movlw	high(0C9h)
	subwf	(_timeTick+1),w
	movlw	low(0C9h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3141
	goto	u3140
u3141:
	goto	l812
u3140:
	line	483
	
l6356:	
;smartkey.C: 482: {
;smartkey.C: 483: beepOff();
	fcall	_beepOff
	line	484
	
l6358:	
;smartkey.C: 484: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u3151
	goto	u3150
u3151:
	goto	l6362
u3150:
	
l6360:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	485
	
l6362:	
;smartkey.C: 485: RegStatus |=(0x20);
	bcf	status, 5	;RP0=0, select bank0
	bsf	(_RegStatus)+(5/8),(5)&7
	line	486
;smartkey.C: 486: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	488
	
l6364:	
;smartkey.C: 488: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l6366:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	goto	l812
	line	494
	
l6368:	
;smartkey.C: 494: beepOff();
	fcall	_beepOff
	line	495
	
l6370:	
;smartkey.C: 495: setState(2,300);
	movlw	low(012Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	496
;smartkey.C: 496: break;
	goto	l812
	line	448
	
l6374:	
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
goto l812
movlw high(S6658)
movwf pclath
	movlw low(S6658)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S6658:
	ljmp	l812
	ljmp	l6312
	ljmp	l6316
	ljmp	l6354
	ljmp	l6368
psect	maintext

	line	515
	
l6376:	
;smartkey.C: 513: {
;smartkey.C: 515: if(lostDetect==1 && timeTick< 1500)
	decf	(_lostDetect),w
	skipz
	goto	u3161
	goto	u3160
u3161:
	goto	l815
u3160:
	
l6378:	
	movlw	high(05DCh)
	subwf	(_timeTick+1),w
	movlw	low(05DCh)
	skipnz
	subwf	(_timeTick),w
	skipnc
	goto	u3171
	goto	u3170
u3171:
	goto	l815
u3170:
	line	517
	
l6380:	
;smartkey.C: 516: {
;smartkey.C: 517: if(READ_EEPROM(0x08)==0x00) WRITE_EEPROM(0x08,0xcc);
	movlw	(08h)
	fcall	_READ_EEPROM
	iorlw	0
	skipz
	goto	u3181
	goto	u3180
u3181:
	goto	l816
u3180:
	
l6382:	
	movlw	(0CCh)
	movwf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	
l816:	
	line	519
;smartkey.C: 519: setState(3,1800);
	movlw	low(0708h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(0708h)
	movwf	((?_setState))+1
	movlw	(03h)
	fcall	_setState
	line	520
	
l6384:	
;smartkey.C: 520: cntTmp = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l6386:	
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	521
	
l6388:	
;smartkey.C: 521: PR2 =11;
	movlw	(0Bh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	522
;smartkey.C: 522: beepOn();
	fcall	_beepOn
	line	523
	
l6390:	
;smartkey.C: 523: lostDetect =0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_lostDetect)
	line	524
;smartkey.C: 524: }
	goto	l6392
	line	525
	
l815:	
	line	526
;smartkey.C: 525: else {
;smartkey.C: 526: lostDetect =1;
	clrf	(_lostDetect)
	incf	(_lostDetect),f
	line	530
	
l6392:	
;smartkey.C: 529: }
;smartkey.C: 530: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	goto	l6314
	line	537
	
l6396:	
;smartkey.C: 536: {
;smartkey.C: 537: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	538
	
l6398:	
;smartkey.C: 538: beepOn();TMR2ON = 0;
	fcall	_beepOn
	
l6400:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	539
	
l6402:	
;smartkey.C: 539: beep(10,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	540
	
l6404:	
;smartkey.C: 540: if(mtOldState == 3){reAlertOn =1;}
	movf	(_mtOldState),w
	xorlw	03h
	skipz
	goto	u3191
	goto	u3190
u3191:
	goto	l812
u3190:
	
l6406:	
	clrf	(main@reAlertOn)
	incf	(main@reAlertOn),f
	goto	l812
	line	508
	
l6410:	
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
	goto	l6376
	xorlw	2^1	; case 2
	skipnz
	goto	l6396
	goto	l812
	opt asmopt_on

	line	544
	
l812:	
	line	548
;smartkey.C: 544: }
;smartkey.C: 546: }
;smartkey.C: 548: PAIE = 1;
	bsf	(91/8),(91)&7
	line	556
	
l6412:	
;smartkey.C: 549: }
;smartkey.C: 551: }
;smartkey.C: 555: {
;smartkey.C: 556: if((timeOut!=0)&&( timeTick >timeOut)){
	movf	(_timeOut+1),w
	iorwf	(_timeOut),w
	skipnz
	goto	u3201
	goto	u3200
u3201:
	goto	l6492
u3200:
	
l6414:	
	movf	(_timeTick+1),w
	subwf	(_timeOut+1),w
	skipz
	goto	u3215
	movf	(_timeTick),w
	subwf	(_timeOut),w
u3215:
	skipnc
	goto	u3211
	goto	u3210
u3211:
	goto	l6492
u3210:
	goto	l6490
	line	567
	
l6418:	
;smartkey.C: 567: beepOff();
	fcall	_beepOff
	line	568
	
l6420:	
;smartkey.C: 568: RegStatus &=(~0x20);
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_RegStatus)+(5/8),(5)&7
	line	569
	
l6422:	
;smartkey.C: 569: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	570
;smartkey.C: 570: break;
	goto	l6492
	line	572
	
l6424:	
;smartkey.C: 572: beepOff();
	fcall	_beepOff
	line	573
	
l6426:	
;smartkey.C: 573: delay_x10ms(20);
	movlw	014h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	574
	
l6428:	
;smartkey.C: 574: beepOn();TMR2ON = 0;reAlertOn =0;
	fcall	_beepOn
	
l6430:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l6432:	
	clrf	(main@reAlertOn)
	line	575
	
l6434:	
;smartkey.C: 575: beep(30,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(01Eh)
	fcall	_beep
	line	576
	
l6436:	
;smartkey.C: 576: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	577
	
l6438:	
;smartkey.C: 577: RA7 =0;
	bcf	(47/8),(47)&7
	line	578
	
l6440:	
;smartkey.C: 578: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l6442:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	579
;smartkey.C: 579: break;
	goto	l6492
	line	582
	
l6444:	
;smartkey.C: 582: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u3221
	goto	u3220
u3221:
	goto	l6448
u3220:
	
l6446:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	584
	
l6448:	
;smartkey.C: 584: if(reAlertOn){
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@reAlertOn),w
	skipz
	goto	u3230
	goto	l6458
u3230:
	line	585
	
l6450:	
;smartkey.C: 585: setState(4,6000);
	movlw	low(01770h)
	movwf	(?_setState)
	movlw	high(01770h)
	movwf	((?_setState))+1
	movlw	(04h)
	fcall	_setState
	line	586
	
l6452:	
;smartkey.C: 586: cntTmp = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l6454:	
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	587
	
l6456:	
;smartkey.C: 587: PR2 =11;
	movlw	(0Bh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	588
;smartkey.C: 588: beepOn();
	fcall	_beepOn
	line	590
;smartkey.C: 590: }else if(mtOldState == 0){
	goto	l6492
	
l6458:	
	movf	(_mtOldState),f
	skipz
	goto	u3241
	goto	u3240
u3241:
	goto	l6472
u3240:
	line	592
	
l6460:	
;smartkey.C: 592: beep(10,5);
	movlw	(05h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	593
	
l6462:	
;smartkey.C: 593: RegStatus |=(0x20);
	bsf	(_RegStatus)+(5/8),(5)&7
	line	596
	
l6464:	
;smartkey.C: 596: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
	movlw	(040h)
	fcall	_READ_EEPROM
	xorlw	0
	skipnz
	goto	u3251
	goto	u3250
u3251:
	goto	l832
u3250:
	
l6466:	
	clrf	(?_WRITE_EEPROM)
	movlw	(040h)
	fcall	_WRITE_EEPROM
	
l832:	
	line	598
;smartkey.C: 598: setState(1,3500);
	movlw	low(0DACh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	goto	l6440
	line	602
	
l6472:	
;smartkey.C: 602: beepOn();TMR2ON = 0;
	fcall	_beepOn
	
l6474:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	603
	
l6476:	
;smartkey.C: 603: reAlertOn =0;
	clrf	(main@reAlertOn)
	line	604
	
l6478:	
;smartkey.C: 604: beep(30,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(01Eh)
	fcall	_beep
	line	605
	
l6480:	
;smartkey.C: 605: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	goto	l6438
	line	558
	
l6490:	
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
	goto	l6492
	xorlw	2^1	; case 2
	skipnz
	goto	l6444
	xorlw	3^2	; case 3
	skipnz
	goto	l6418
	xorlw	4^3	; case 4
	skipnz
	goto	l6424
	goto	l6492
	opt asmopt_on

	line	615
	
l6492:	
;smartkey.C: 611: }
;smartkey.C: 613: }
;smartkey.C: 615: if((timeTick>tmp16) && (mtState == 1) && mpuOk ==1){
	movf	(_timeTick+1),w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@tmp16+1),w
	skipz
	goto	u3265
	movf	(_timeTick),w
	subwf	(main@tmp16),w
u3265:
	skipnc
	goto	u3261
	goto	u3260
u3261:
	goto	l6570
u3260:
	
l6494:	
	decf	(_mtState),w
	skipz
	goto	u3271
	goto	u3270
u3271:
	goto	l6570
u3270:
	
l6496:	
	decf	(main@mpuOk),w
	skipz
	goto	u3281
	goto	u3280
u3281:
	goto	l6570
u3280:
	line	616
	
l6498:	
;smartkey.C: 616: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	617
	
l6500:	
;smartkey.C: 617: if(AccRead(0x3b,buf,6)==0){
	movlw	(main@buf&0ffh)
	movwf	(?_AccRead)
	movlw	(0x0/2)
	movwf	(?_AccRead+1)
	movlw	(06h)
	movwf	0+(?_AccRead)+02h
	movlw	(03Bh)
	fcall	_AccRead
	iorlw	0
	skipz
	goto	u3291
	goto	u3290
u3291:
	goto	l6570
u3290:
	line	619
	
l6502:	
;smartkey.C: 619: if(compe(buf[0], (signed char)acXsum,5) && compe(buf[2], (signed char)acYsum,5)){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@acXsum),w
	movwf	(?_compe)
	movlw	(05h)
	movwf	0+(?_compe)+01h
	movf	(main@buf),w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3301
	goto	u3300
u3301:
	goto	l6528
u3300:
	
l6504:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@acYsum),w
	movwf	(?_compe)
	movlw	(05h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+02h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3311
	goto	u3310
u3311:
	goto	l6528
u3310:
	line	621
	
l6506:	
;smartkey.C: 621: isSw++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(main@isSw),f
	line	622
	
l6508:	
;smartkey.C: 622: if(isSw >44){
	movlw	(02Dh)
	subwf	(main@isSw),w
	skipc
	goto	u3321
	goto	u3320
u3321:
	goto	l6518
u3320:
	line	623
	
l6510:	
;smartkey.C: 623: isSw =0;
	clrf	(main@isSw)
	line	624
	
l6512:	
;smartkey.C: 624: vibrateOn=2;
	movlw	(02h)
	movwf	(main@vibrateOn)
	line	625
	
l6514:	
;smartkey.C: 625: RegStatus &=(~0x20);
	bcf	(_RegStatus)+(5/8),(5)&7
	line	626
	
l6516:	
;smartkey.C: 626: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	627
;smartkey.C: 627: }
	goto	l6548
	line	628
	
l6518:	
;smartkey.C: 628: else if(isSw > 25){
	movlw	(01Ah)
	subwf	(main@isSw),w
	skipc
	goto	u3331
	goto	u3330
u3331:
	goto	l6548
u3330:
	line	629
	
l6520:	
;smartkey.C: 629: if(isSw%2==0){
	btfsc	(main@isSw),(0)&7
	goto	u3341
	goto	u3340
u3341:
	goto	l838
u3340:
	line	630
	
l6522:	
;smartkey.C: 630: beepOn();TMR2ON = 0; beep(7,1);
	fcall	_beepOn
	
l6524:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l6526:	
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(07h)
	fcall	_beep
	goto	l6548
	line	634
	
l838:	
;smartkey.C: 631: }
;smartkey.C: 632: }
;smartkey.C: 634: }
	goto	l6548
	line	636
	
l6528:	
;smartkey.C: 635: else{
;smartkey.C: 636: isSw =0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@isSw)
	line	639
	
l6530:	
;smartkey.C: 639: if(compe(buf[0], acXOld,2) && compe(buf[2], acYOld,2)){
	movf	(main@acXOld),w
	movwf	(?_compe)
	movlw	(02h)
	movwf	0+(?_compe)+01h
	movf	(main@buf),w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3351
	goto	u3350
u3351:
	goto	l6548
u3350:
	
l6532:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@acYOld),w
	movwf	(?_compe)
	movlw	(02h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+02h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3361
	goto	u3360
u3361:
	goto	l6548
u3360:
	line	640
	
l6534:	
;smartkey.C: 640: isWait++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(main@isWait),f
	skipnz
	incf	(main@isWait+1),f
	line	641
	
l6536:	
;smartkey.C: 641: if(isWait==450){
	decf	(main@isWait+1),w
	movlw	194
	skipnz
	xorwf	(main@isWait),w

	skipz
	goto	u3371
	goto	u3370
u3371:
	goto	l6548
u3370:
	line	642
	
l6538:	
;smartkey.C: 642: isWait = 0;
	clrf	(main@isWait)
	clrf	(main@isWait+1)
	line	643
	
l6540:	
;smartkey.C: 643: beep(7,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	line	644
	
l6542:	
;smartkey.C: 644: vibrateOn=1;
	clrf	(main@vibrateOn)
	incf	(main@vibrateOn),f
	line	645
	
l6544:	
;smartkey.C: 645: RegStatus &=(~0x20);
	bcf	(_RegStatus)+(5/8),(5)&7
	line	646
	
l6546:	
;smartkey.C: 646: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	652
	
l6548:	
;smartkey.C: 647: }
;smartkey.C: 648: }
;smartkey.C: 650: }
;smartkey.C: 652: if( (buf[4] > -31) && (buf[4] < 31)) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(main@buf)+04h,w
	xorlw	80h
	addlw	-((-30)^80h)
	skipc
	goto	u3381
	goto	u3380
u3381:
	goto	l6564
u3380:
	
l6550:	
	movf	0+(main@buf)+04h,w
	xorlw	80h
	addlw	-((01Fh)^80h)
	skipnc
	goto	u3391
	goto	u3390
u3391:
	goto	l6564
u3390:
	line	653
	
l6552:	
;smartkey.C: 653: isFall++;
	incf	(main@isFall),f
	line	654
	
l6554:	
;smartkey.C: 654: if(isFall >4){
	movlw	(05h)
	subwf	(main@isFall),w
	skipc
	goto	u3401
	goto	u3400
u3401:
	goto	l6566
u3400:
	line	655
	
l6556:	
;smartkey.C: 655: isFall =0;
	clrf	(main@isFall)
	line	656
	
l6558:	
;smartkey.C: 656: beep(7,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	line	657
	
l6560:	
;smartkey.C: 657: RegStatus &=(~0x20);
	bcf	(_RegStatus)+(5/8),(5)&7
	line	658
	
l6562:	
;smartkey.C: 658: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	goto	l6566
	line	662
	
l6564:	
;smartkey.C: 661: else{
;smartkey.C: 662: isFall=0;
	clrf	(main@isFall)
	line	665
	
l6566:	
;smartkey.C: 663: }
;smartkey.C: 665: acYOld = buf[2];acXOld = buf[0];
	movf	0+(main@buf)+02h,w
	movwf	(main@acYOld)
	
l6568:	
	movf	(main@buf),w
	movwf	(main@acXOld)
	line	671
	
l6570:	
;smartkey.C: 666: }
;smartkey.C: 668: }
;smartkey.C: 671: if((timeTick>tmp16) && (mtState == 0 ) && mpuOk ==1){
	movf	(_timeTick+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	goto	l6618
u3410:
	
l6572:	
	movf	(_mtState),f
	skipz
	goto	u3421
	goto	u3420
u3421:
	goto	l6618
u3420:
	
l6574:	
	decf	(main@mpuOk),w
	skipz
	goto	u3431
	goto	u3430
u3431:
	goto	l6618
u3430:
	line	673
	
l6576:	
;smartkey.C: 673: if(timeTick >65000) timeTick =0;
	movlw	high(0FDE9h)
	subwf	(_timeTick+1),w
	movlw	low(0FDE9h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u3441
	goto	u3440
u3441:
	goto	l6580
u3440:
	
l6578:	
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	674
	
l6580:	
;smartkey.C: 674: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l6582:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	676
	
l6584:	
;smartkey.C: 676: if(AccRead(0x3b,buf,6)==0){
	movlw	(main@buf&0ffh)
	movwf	(?_AccRead)
	movlw	(0x0/2)
	movwf	(?_AccRead+1)
	movlw	(06h)
	movwf	0+(?_AccRead)+02h
	movlw	(03Bh)
	fcall	_AccRead
	iorlw	0
	skipz
	goto	u3451
	goto	u3450
u3451:
	goto	l6618
u3450:
	line	677
	
l6586:	
;smartkey.C: 677: if(vibrateOn==1){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	decf	(main@vibrateOn),w
	skipz
	goto	u3461
	goto	u3460
u3461:
	goto	l6602
u3460:
	line	678
	
l6588:	
;smartkey.C: 678: if(compe(buf[0],acXOld ,2) && compe(buf[2],acYOld ,2)){
	movf	(main@acXOld),w
	movwf	(?_compe)
	movlw	(02h)
	movwf	0+(?_compe)+01h
	movf	(main@buf),w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3471
	goto	u3470
u3471:
	goto	l6594
u3470:
	
l6590:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@acYOld),w
	movwf	(?_compe)
	movlw	(02h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+02h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3481
	goto	u3480
u3481:
	goto	l6594
u3480:
	line	680
	
l6592:	
;smartkey.C: 680: isSw=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@isSw)
	line	683
;smartkey.C: 683: }
	goto	l6618
	line	685
	
l6594:	
;smartkey.C: 684: else{
;smartkey.C: 685: isSw++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(main@isSw),f
	line	689
	
l6596:	
;smartkey.C: 688: {
;smartkey.C: 689: beepOn();TMR2ON = 0; beep(7,3);
	fcall	_beepOn
	
l6598:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l6600:	
	movlw	(03h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	goto	l6618
	line	693
	
l6602:	
;smartkey.C: 693: else if(vibrateOn==2){
	movf	(main@vibrateOn),w
	xorlw	02h
	skipz
	goto	u3491
	goto	u3490
u3491:
	goto	l849
u3490:
	line	694
	
l6604:	
;smartkey.C: 694: if(compe(buf[0],(signed char)acXsum ,5) && compe(buf[2],(signed char)acYsum ,5)){
	movf	(main@acXsum),w
	movwf	(?_compe)
	movlw	(05h)
	movwf	0+(?_compe)+01h
	movf	(main@buf),w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3501
	goto	u3500
u3501:
	goto	l6610
u3500:
	
l6606:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@acYsum),w
	movwf	(?_compe)
	movlw	(05h)
	movwf	0+(?_compe)+01h
	movf	0+(main@buf)+02h,w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3511
	goto	u3510
u3511:
	goto	l6610
u3510:
	goto	l6592
	line	701
	
l6610:	
;smartkey.C: 700: else{
;smartkey.C: 701: isSw++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(main@isSw),f
	line	705
	
l6612:	
;smartkey.C: 704: {
;smartkey.C: 705: beepOn();TMR2ON = 0; beep(7,3);
	fcall	_beepOn
	
l6614:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l6616:	
	movlw	(03h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	goto	l6618
	line	710
	
l849:	
	line	715
	
l6618:	
;smartkey.C: 706: }
;smartkey.C: 707: }
;smartkey.C: 708: }
;smartkey.C: 710: }
;smartkey.C: 713: }
;smartkey.C: 715: if(RegStatus & 0x20) {RC4 =1;RC2 =1;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_RegStatus),(5)&7
	goto	u3521
	goto	u3520
u3521:
	goto	l857
u3520:
	
l6620:	
	bsf	(60/8),(60)&7
	bsf	(58/8),(58)&7
	goto	l6304
	line	716
	
l857:	
;smartkey.C: 716: else {RC4 =0;RC2 =0;}
	bcf	(60/8),(60)&7
	bcf	(58/8),(58)&7
	goto	l6304
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	721
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_AccRead
psect	text861,local,class=CODE,delta=2
global __ptext861
__ptext861:

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
;;		On entry : 60/0
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
psect	text861
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
	
l6122:	
;mpu6x.c: 32: unsigned char i;
;mpu6x.c: 34: swI2C_Start();
	fcall	_swI2C_Start
	line	36
;mpu6x.c: 36: if(swI2C_WriteByte(0x68<<1)== 0 )
	movlw	(0D0h)
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2821
	goto	u2820
u2821:
	goto	l6146
u2820:
	line	38
	
l6124:	
;mpu6x.c: 37: {
;mpu6x.c: 38: if(swI2C_WriteByte(rAdd)==0 )
	movf	(AccRead@rAdd),w
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2831
	goto	u2830
u2831:
	goto	l6150
u2830:
	line	40
	
l6126:	
;mpu6x.c: 39: {
;mpu6x.c: 40: swI2C_Start();
	fcall	_swI2C_Start
	line	41
;mpu6x.c: 41: if(swI2C_WriteByte((0x68<<1)|1)== 0 ){
	movlw	(0D1h)
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2841
	goto	u2840
u2841:
	goto	l6146
u2840:
	line	43
	
l6128:	
;mpu6x.c: 43: for(i=0; i<(len-1);i++){
	clrf	(AccRead@i)
	goto	l6134
	line	44
	
l6130:	
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
	
l6132:	
	incf	(AccRead@i),f
	
l6134:	
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
	goto	u2855
	movf	0+(??_AccRead+0)+0,w
	subwf	(AccRead@i),w
u2855:

	skipc
	goto	u2851
	goto	u2850
u2851:
	goto	l6130
u2850:
	line	46
	
l6136:	
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
	
l6138:	
;mpu6x.c: 47: swI2C_Stop();
	fcall	_swI2C_Stop
	line	48
	
l6140:	
;mpu6x.c: 48: return 0;
	movlw	(0)
	goto	l2868
	line	52
	
l6146:	
;mpu6x.c: 51: else
;mpu6x.c: 52: return 1;
	movlw	(01h)
	goto	l2868
	line	55
	
l6150:	
;mpu6x.c: 54: else
;mpu6x.c: 55: return 2;
	movlw	(02h)
	line	59
	
l2868:	
	return
	opt stack 0
GLOBAL	__end_of_AccRead
	__end_of_AccRead:
;; =============== function _AccRead ends ============

	signat	_AccRead,12409
	global	_AccWrite
psect	text862,local,class=CODE,delta=2
global __ptext862
__ptext862:

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
;;		On entry : 60/0
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
psect	text862
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
	
l6088:	
;mpu6x.c: 5: unsigned char i;
;mpu6x.c: 6: swI2C_Start();
	fcall	_swI2C_Start
	line	8
;mpu6x.c: 8: if(swI2C_WriteByte(0x68<<1)== 0 )
	movlw	(0D0h)
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2781
	goto	u2780
u2781:
	goto	l6118
u2780:
	line	10
	
l6090:	
;mpu6x.c: 9: {
;mpu6x.c: 10: if(swI2C_WriteByte(rAdd)==0 )
	movf	(AccWrite@rAdd),w
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2791
	goto	u2790
u2791:
	goto	l6114
u2790:
	line	12
	
l6092:	
;mpu6x.c: 11: {
;mpu6x.c: 12: for(i=0; i<len;i++){
	clrf	(AccWrite@i)
	goto	l6104
	line	13
	
l6094:	
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
	goto	u2801
	goto	u2800
u2801:
	goto	l6102
u2800:
	line	14
	
l6096:	
;mpu6x.c: 14: swI2C_Stop();
	fcall	_swI2C_Stop
	line	15
	
l6098:	
;mpu6x.c: 15: return 3;
	movlw	(03h)
	goto	l2856
	line	12
	
l6102:	
	incf	(AccWrite@i),f
	
l6104:	
	movf	(AccWrite@len),w
	subwf	(AccWrite@i),w
	skipc
	goto	u2811
	goto	u2810
u2811:
	goto	l6094
u2810:
	line	18
	
l6106:	
;mpu6x.c: 16: }
;mpu6x.c: 17: }
;mpu6x.c: 18: swI2C_Stop();
	fcall	_swI2C_Stop
	line	19
	
l6108:	
;mpu6x.c: 19: return 0;
	movlw	(0)
	goto	l2856
	line	22
	
l6114:	
;mpu6x.c: 21: else
;mpu6x.c: 22: return 2;
	movlw	(02h)
	goto	l2856
	line	25
	
l6118:	
;mpu6x.c: 24: else
;mpu6x.c: 25: return 1;
	movlw	(01h)
	line	27
	
l2856:	
	return
	opt stack 0
GLOBAL	__end_of_AccWrite
	__end_of_AccWrite:
;; =============== function _AccWrite ends ============

	signat	_AccWrite,12409
	global	_swI2C_ReadByte
psect	text863,local,class=CODE,delta=2
global __ptext863
__ptext863:

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
;;		On exit  : 60/0
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
psect	text863
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
	bcf	status, 6	;RP1=0, select bank0
	movwf	(swI2C_ReadByte@Ack)
	
l6060:	
	clrf	(swI2C_ReadByte@dat)
	line	115
	
l6062:	
;SWI2C.C: 115: RA0 = 0;
	bcf	(40/8),(40)&7
	line	116
	
l6064:	
;SWI2C.C: 116: TRISA |=0x02;;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(1/8),(1)&7	;volatile
	line	117
	
l6066:	
;SWI2C.C: 117: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	118
	
l6068:	
;SWI2C.C: 118: for(i=0;i<8;i++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(swI2C_ReadByte@i)
	line	119
	
l2192:	
	line	120
;SWI2C.C: 119: {
;SWI2C.C: 120: RA0 = 1;
	bsf	(40/8),(40)&7
	line	121
	
l6072:	
;SWI2C.C: 121: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	122
	
l6074:	
;SWI2C.C: 122: dat = dat<<1 |(RA1 & 1 );
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(41/8),(41)&7
	movlw	1
	andlw	01h
	movwf	(??_swI2C_ReadByte+0)+0
	clrc
	rlf	(swI2C_ReadByte@dat),w
	iorwf	(??_swI2C_ReadByte+0)+0,w
	movwf	(swI2C_ReadByte@dat)
	line	125
	
l6076:	
;SWI2C.C: 125: RA0 = 0;
	bcf	(40/8),(40)&7
	line	126
	
l6078:	
;SWI2C.C: 126: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	118
	
l6080:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(swI2C_ReadByte@i),f
	movlw	(08h)
	subwf	(swI2C_ReadByte@i),w
	skipc
	goto	u2751
	goto	u2750
u2751:
	goto	l2192
u2750:
	
l2193:	
	line	129
;SWI2C.C: 127: }
;SWI2C.C: 129: TRISA &=0xfD;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(1/8),(1)&7	;volatile
	line	131
;SWI2C.C: 131: RA1 = (Ack) ? 0 : 1;
	bcf	status, 5	;RP0=0, select bank0
	movf	(swI2C_ReadByte@Ack)
	skipnz
	goto	u2761
	goto	u2760
	
u2761:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(41/8),(41)&7
	goto	u2774
u2760:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(41/8),(41)&7
u2774:
	line	132
;SWI2C.C: 132: RA0 = 1;
	bsf	(40/8),(40)&7
	line	133
	
l6082:	
;SWI2C.C: 133: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	134
	
l6084:	
;SWI2C.C: 134: RA0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(40/8),(40)&7
	line	135
;SWI2C.C: 135: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	136
;SWI2C.C: 136: return dat;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(swI2C_ReadByte@dat),w
	line	137
	
l2194:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_ReadByte
	__end_of_swI2C_ReadByte:
;; =============== function _swI2C_ReadByte ends ============

	signat	_swI2C_ReadByte,4217
	global	_swI2C_WriteByte
psect	text864,local,class=CODE,delta=2
global __ptext864
__ptext864:

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
;;		On exit  : 60/0
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
psect	text864
	file	"SWI2C.C"
	line	86
	global	__size_of_swI2C_WriteByte
	__size_of_swI2C_WriteByte	equ	__end_of_swI2C_WriteByte-_swI2C_WriteByte
	
_swI2C_WriteByte:	
	opt	stack 4
; Regs used in _swI2C_WriteByte: [wreg+status,2+status,0]
;swI2C_WriteByte@dat stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(swI2C_WriteByte@dat)
	line	87
	
l6032:	
	line	89
	
l6034:	
;SWI2C.C: 89: TRISA &=0xfD;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(1/8),(1)&7	;volatile
	line	90
	
l6036:	
;SWI2C.C: 90: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	91
	
l6038:	
;SWI2C.C: 91: for(i=0;i<8;i++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(swI2C_WriteByte@i)
	line	92
	
l2187:	
	line	93
;SWI2C.C: 92: {
;SWI2C.C: 93: RA1 = (dat&0x80) ? 1:0;
	btfsc	(swI2C_WriteByte@dat),(7)&7
	goto	u2721
	goto	u2720
	
u2721:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(41/8),(41)&7
	goto	u2734
u2720:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(41/8),(41)&7
u2734:
	line	94
;SWI2C.C: 94: dat<<=1;
	clrc
	rlf	(swI2C_WriteByte@dat),f
	line	95
;SWI2C.C: 95: RA0 = 1;
	bsf	(40/8),(40)&7
	line	96
	
l6042:	
;SWI2C.C: 96: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	97
	
l6044:	
;SWI2C.C: 97: RA0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(40/8),(40)&7
	line	98
;SWI2C.C: 98: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	91
	
l6046:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(swI2C_WriteByte@i),f
	
l6048:	
	movlw	(08h)
	subwf	(swI2C_WriteByte@i),w
	skipc
	goto	u2741
	goto	u2740
u2741:
	goto	l2187
u2740:
	
l2188:	
	line	101
;SWI2C.C: 99: }
;SWI2C.C: 101: TRISA |=0x02;;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(1/8),(1)&7	;volatile
	line	102
	
l6050:	
;SWI2C.C: 102: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	103
	
l6052:	
;SWI2C.C: 103: RA0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(40/8),(40)&7
	line	104
;SWI2C.C: 104: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	105
;SWI2C.C: 105: i= RA1;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(41/8),(41)&7
	movlw	1
	movwf	(swI2C_WriteByte@i)
	line	106
	
l6054:	
;SWI2C.C: 106: RA0 = 0;
	bcf	(40/8),(40)&7
	line	107
	
l6056:	
;SWI2C.C: 107: TRISA &=0xfD;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(1/8),(1)&7	;volatile
	line	108
;SWI2C.C: 108: return i;
	bcf	status, 5	;RP0=0, select bank0
	movf	(swI2C_WriteByte@i),w
	line	109
	
l2189:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_WriteByte
	__end_of_swI2C_WriteByte:
;; =============== function _swI2C_WriteByte ends ============

	signat	_swI2C_WriteByte,4217
	global	_swI2C_Stop
psect	text865,local,class=CODE,delta=2
global __ptext865
__ptext865:

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
;;		On entry : 60/0
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
	line	35
	global	__size_of_swI2C_Stop
	__size_of_swI2C_Stop	equ	__end_of_swI2C_Stop-_swI2C_Stop
	
_swI2C_Stop:	
	opt	stack 4
; Regs used in _swI2C_Stop: [wreg]
	line	37
	
l6026:	
;SWI2C.C: 37: RA1 = 0;
	bcf	(41/8),(41)&7
	line	38
;SWI2C.C: 38: RA0 = 1;
	bsf	(40/8),(40)&7
	line	39
	
l6028:	
;SWI2C.C: 39: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	40
	
l6030:	
;SWI2C.C: 40: RA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(41/8),(41)&7
	line	41
;SWI2C.C: 41: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	42
	
l2181:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_Stop
	__end_of_swI2C_Stop:
;; =============== function _swI2C_Stop ends ============

	signat	_swI2C_Stop,88
	global	_swI2C_Start
psect	text866,local,class=CODE,delta=2
global __ptext866
__ptext866:

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
;;		On entry : 60/0
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
psect	text866
	file	"SWI2C.C"
	line	22
	global	__size_of_swI2C_Start
	__size_of_swI2C_Start	equ	__end_of_swI2C_Start-_swI2C_Start
	
_swI2C_Start:	
	opt	stack 4
; Regs used in _swI2C_Start: [wreg]
	line	24
	
l6018:	
;SWI2C.C: 24: RA0 = 1;
	bsf	(40/8),(40)&7
	line	26
;SWI2C.C: 26: RA1 = 1;
	bsf	(41/8),(41)&7
	line	27
	
l6020:	
;SWI2C.C: 27: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	28
	
l6022:	
;SWI2C.C: 28: RA1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(41/8),(41)&7
	line	29
;SWI2C.C: 29: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	30
	
l6024:	
;SWI2C.C: 30: RA0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(40/8),(40)&7
	line	31
;SWI2C.C: 31: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	32
	
l2178:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_Start
	__end_of_swI2C_Start:
;; =============== function _swI2C_Start ends ============

	signat	_swI2C_Start,88
	global	_swI2C_Init
psect	text867,local,class=CODE,delta=2
global __ptext867
__ptext867:

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
;;		On entry : 60/0
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
psect	text867
	file	"SWI2C.C"
	line	8
	global	__size_of_swI2C_Init
	__size_of_swI2C_Init	equ	__end_of_swI2C_Init-_swI2C_Init
	
_swI2C_Init:	
	opt	stack 5
; Regs used in _swI2C_Init: [wreg]
	line	10
	
l6010:	
;SWI2C.C: 10: TRISA &=0xfD;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(1/8),(1)&7	;volatile
	line	11
;SWI2C.C: 11: TRISA &=0xfe;;
	bcf	(133)^080h+(0/8),(0)&7	;volatile
	line	12
	
l6012:	
;SWI2C.C: 12: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	13
	
l6014:	
;SWI2C.C: 13: RA0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(40/8),(40)&7
	line	14
	
l6016:	
;SWI2C.C: 14: RA1 = 1;
	bsf	(41/8),(41)&7
	line	15
;SWI2C.C: 15: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	16
;SWI2C.C: 16: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	17
;SWI2C.C: 17: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	18
;SWI2C.C: 18: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	19
	
l2175:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_Init
	__end_of_swI2C_Init:
;; =============== function _swI2C_Init ends ============

	signat	_swI2C_Init,88
	global	_sys_init
psect	text868,local,class=CODE,delta=2
global __ptext868
__ptext868:

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
;;		On exit  : 60/20
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
psect	text868
	file	"sysinit.c"
	line	3
	global	__size_of_sys_init
	__size_of_sys_init	equ	__end_of_sys_init-_sys_init
	
_sys_init:	
	opt	stack 5
; Regs used in _sys_init: [wreg]
	line	21
	
l6006:	
;sysinit.c: 21: OSCCON = 0B01010001;
	movlw	(051h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	22
	
l6008:	
;sysinit.c: 22: _nop();
	nop
	line	28
;sysinit.c: 28: while(HTS==0);
	
l1512:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1146/8)^080h,(1146)&7
	goto	u2711
	goto	u2710
u2711:
	goto	l1512
u2710:
	line	30
	
l1515:	
	return
	opt stack 0
GLOBAL	__end_of_sys_init
	__end_of_sys_init:
;; =============== function _sys_init ends ============

	signat	_sys_init,88
	global	_beep
psect	text869,local,class=CODE,delta=2
global __ptext869
__ptext869:

;; *************** function _beep *****************
;; Defined at:
;;		line 184 in file "smartkey.C"
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
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
psect	text869
	file	"smartkey.C"
	line	184
	global	__size_of_beep
	__size_of_beep	equ	__end_of_beep-_beep
	
_beep:	
	opt	stack 4
; Regs used in _beep: [wreg+status,2+status,0+pclath+cstack]
;beep@delay stored from wreg
	movwf	(beep@delay)
	line	186
	
l5992:	
;smartkey.C: 185: {
;smartkey.C: 186: while(rep--){
	goto	l6004
	
l730:	
	line	187
;smartkey.C: 187: TMR2ON = 1;
	bsf	(146/8),(146)&7
	line	188
	
l5994:	
;smartkey.C: 188: PR2 = 12;
	movlw	(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	189
	
l5996:	
;smartkey.C: 189: delay_x10ms(delay);
	bcf	status, 5	;RP0=0, select bank0
	movf	(beep@delay),w
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	190
	
l5998:	
;smartkey.C: 190: TMR2ON = 0;RA4 =0;
	bcf	(146/8),(146)&7
	
l6000:	
	bcf	(44/8),(44)&7
	line	191
	
l6002:	
;smartkey.C: 191: delay_x10ms(20);
	movlw	014h
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	186
	
l6004:	
	decf	(beep@rep),f
	movf	((beep@rep)),w
	xorlw	0FFh
	skipz
	goto	u2701
	goto	u2700
u2701:
	goto	l730
u2700:
	line	195
	
l732:	
	return
	opt stack 0
GLOBAL	__end_of_beep
	__end_of_beep:
;; =============== function _beep ends ============

	signat	_beep,8312
	global	___awdiv
psect	text870,local,class=CODE,delta=2
global __ptext870
__ptext870:

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
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
psect	text870
	file	"D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 5
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l5948:	
	clrf	(___awdiv@sign)
	line	10
	
l5950:	
	btfss	(___awdiv@divisor+1),7
	goto	u2631
	goto	u2630
u2631:
	goto	l5956
u2630:
	line	11
	
l5952:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	
l5954:	
	clrf	(___awdiv@sign)
	incf	(___awdiv@sign),f
	line	14
	
l5956:	
	btfss	(___awdiv@dividend+1),7
	goto	u2641
	goto	u2640
u2641:
	goto	l5962
u2640:
	line	15
	
l5958:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l5960:	
	movlw	(01h)
	xorwf	(___awdiv@sign),f
	line	18
	
l5962:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l5964:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2651
	goto	u2650
u2651:
	goto	l5984
u2650:
	line	20
	
l5966:	
	clrf	(___awdiv@counter)
	incf	(___awdiv@counter),f
	line	21
	goto	l5970
	line	22
	
l5968:	
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	line	23
	incf	(___awdiv@counter),f
	line	21
	
l5970:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2661
	goto	u2660
u2661:
	goto	l5968
u2660:
	line	26
	
l5972:	
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	line	27
	
l5974:	
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2675
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2675:
	skipc
	goto	u2671
	goto	u2670
u2671:
	goto	l5980
u2670:
	line	28
	
l5976:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l5978:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	line	31
	
l5980:	
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	line	32
	
l5982:	
	decfsz	(___awdiv@counter),f
	goto	u2681
	goto	u2680
u2681:
	goto	l5972
u2680:
	line	34
	
l5984:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2690
	goto	l5988
u2690:
	line	35
	
l5986:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	line	36
	
l5988:	
	movf	(___awdiv@quotient+1),w
	movwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	movwf	(?___awdiv)
	line	37
	
l3690:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	_timer_init
psect	text871,local,class=CODE,delta=2
global __ptext871
__ptext871:

;; *************** function _timer_init *****************
;; Defined at:
;;		line 45 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
	line	45
	global	__size_of_timer_init
	__size_of_timer_init	equ	__end_of_timer_init-_timer_init
	
_timer_init:	
	opt	stack 5
; Regs used in _timer_init: [wreg+status,2]
	line	55
	
l5936:	
;sysinit.c: 55: TMR2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(17)	;volatile
	line	56
;sysinit.c: 56: PR2 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(146)^080h	;volatile
	line	57
	
l5938:	
;sysinit.c: 57: T2CON = 0B00101001;
	movlw	(029h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	60
	
l5940:	
;sysinit.c: 60: TMR1H = -5000>>8;
	movlw	(0ECh)
	movwf	(15)	;volatile
	line	61
	
l5942:	
;sysinit.c: 61: TMR1L = -5000;
	movlw	(078h)
	movwf	(14)	;volatile
	line	62
	
l5944:	
;sysinit.c: 62: T1CON = 0B00100001;
	movlw	(021h)
	movwf	(16)	;volatile
	line	63
	
l5946:	
;sysinit.c: 63: TMR1ON = 1;
	bsf	(128/8),(128)&7
	line	64
	
l1521:	
	return
	opt stack 0
GLOBAL	__end_of_timer_init
	__end_of_timer_init:
;; =============== function _timer_init ends ============

	signat	_timer_init,88
	global	_int_init
psect	text872,local,class=CODE,delta=2
global __ptext872
__ptext872:

;; *************** function _int_init *****************
;; Defined at:
;;		line 67 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tmp             1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
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
	line	67
	global	__size_of_int_init
	__size_of_int_init	equ	__end_of_int_init-_int_init
	
_int_init:	
	opt	stack 5
; Regs used in _int_init: [wreg+status,2]
	line	72
	
l5906:	
;sysinit.c: 72: INTCON = 0B00000000;
	clrf	(11)	;volatile
	line	73
;sysinit.c: 73: PIE1 = 0B00000000;
	clrf	(140)^080h	;volatile
	line	74
;sysinit.c: 74: PIR1 = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(12)	;volatile
	line	76
	
l5908:	
;sysinit.c: 76: IOCA6 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1206/8)^080h,(1206)&7
	line	77
	
l5910:	
;sysinit.c: 77: tmp = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	78
	
l5912:	
;sysinit.c: 78: PAIF = 0;
	bcf	(88/8),(88)&7
	line	79
	
l5914:	
;sysinit.c: 79: PAIE = 0;
	bcf	(91/8),(91)&7
	line	82
	
l5916:	
;sysinit.c: 82: INTEDG = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1038/8)^080h,(1038)&7
	line	83
	
l5918:	
;sysinit.c: 83: INTF = 0;
	bcf	(89/8),(89)&7
	line	84
	
l5920:	
;sysinit.c: 84: INTE = 1;
	bsf	(92/8),(92)&7
	line	86
	
l5922:	
;sysinit.c: 86: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(97/8),(97)&7
	line	87
	
l5924:	
;sysinit.c: 87: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	88
	
l5926:	
;sysinit.c: 88: TMR2ON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	90
	
l5928:	
;sysinit.c: 90: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	91
	
l5930:	
;sysinit.c: 91: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	94
	
l5932:	
;sysinit.c: 94: PEIE = 1;
	bsf	(94/8),(94)&7
	line	96
	
l5934:	
;sysinit.c: 96: GIE = 1;
	bsf	(95/8),(95)&7
	line	97
	
l1524:	
	return
	opt stack 0
GLOBAL	__end_of_int_init
	__end_of_int_init:
;; =============== function _int_init ends ============

	signat	_int_init,88
	global	_gpio_init
psect	text873,local,class=CODE,delta=2
global __ptext873
__ptext873:

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
;;		On entry : 60/20
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
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
psect	text873
	file	"sysinit.c"
	line	32
	global	__size_of_gpio_init
	__size_of_gpio_init	equ	__end_of_gpio_init-_gpio_init
	
_gpio_init:	
	opt	stack 5
; Regs used in _gpio_init: [wreg+status,2]
	line	34
	
l5896:	
;sysinit.c: 34: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	35
	
l5898:	
;sysinit.c: 35: TRISA = 0B01101110;
	movlw	(06Eh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	36
	
l5900:	
;sysinit.c: 36: WPUA = 0B10000000;
	movlw	(080h)
	movwf	(149)^080h	;volatile
	line	38
;sysinit.c: 38: PORTC = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	39
	
l5902:	
;sysinit.c: 39: TRISC = 0B11101011;
	movlw	(0EBh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	40
	
l5904:	
;sysinit.c: 40: WPUC = 0B00000000;
	clrf	(136)^080h	;volatile
	line	42
	
l1518:	
	return
	opt stack 0
GLOBAL	__end_of_gpio_init
	__end_of_gpio_init:
;; =============== function _gpio_init ends ============

	signat	_gpio_init,88
	global	_compe
psect	text874,local,class=CODE,delta=2
global __ptext874
__ptext874:

;; *************** function _compe *****************
;; Defined at:
;;		line 232 in file "smartkey.C"
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
;;		On entry : 60/0
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
psect	text874
	file	"smartkey.C"
	line	232
	global	__size_of_compe
	__size_of_compe	equ	__end_of_compe-_compe
	
_compe:	
	opt	stack 5
; Regs used in _compe: [wreg]
;compe@a stored from wreg
	line	234
	movwf	(compe@a)
	
l5858:	
;smartkey.C: 234: if(a>b){
	movf	(compe@b),w
	xorlw	80h
	movwf	(??_compe+0)+0
	movf	(compe@a),w
	xorlw	80h
	subwf	(??_compe+0)+0
	skipnc
	goto	u2561
	goto	u2560
u2561:
	goto	l5872
u2560:
	line	235
	
l5860:	
;smartkey.C: 235: if((a-b)<=dt) return 1;
	movf	(compe@b),w
	subwf	(compe@a),w
	movwf	(??_compe+0)+0
	clrf	(??_compe+0)+0+1
	skipc
	decf	1+(??_compe+0)+0,f
	btfsc	(compe@a),7
	decf	((??_compe+0)+0)+1,f
	btfss	(compe@b),7
	goto	u2575o
	incf	((??_compe+0)+0)+1,f
	
u2575o:
	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	goto	u2585
	movf	0+(??_compe+0)+0,w
	subwf	0+(??_compe+2)+0,w
u2585:

	skipc
	goto	u2581
	goto	u2580
u2581:
	goto	l5868
u2580:
	
l5862:	
	movlw	(01h)
	goto	l752
	line	236
	
l5868:	
;smartkey.C: 236: else return 0;
	movlw	(0)
	goto	l752
	line	238
	
l5872:	
;smartkey.C: 238: else if(a<b){
	movf	(compe@a),w
	xorlw	80h
	movwf	(??_compe+0)+0
	movf	(compe@b),w
	xorlw	80h
	subwf	(??_compe+0)+0
	skipnc
	goto	u2591
	goto	u2590
u2591:
	goto	l5886
u2590:
	line	239
	
l5874:	
;smartkey.C: 239: if((b-a)<=dt) return 1;
	movf	(compe@a),w
	subwf	(compe@b),w
	movwf	(??_compe+0)+0
	clrf	(??_compe+0)+0+1
	skipc
	decf	1+(??_compe+0)+0,f
	btfsc	(compe@b),7
	decf	((??_compe+0)+0)+1,f
	btfss	(compe@a),7
	goto	u2605o
	incf	((??_compe+0)+0)+1,f
	
u2605o:
	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	goto	u2615
	movf	0+(??_compe+0)+0,w
	subwf	0+(??_compe+2)+0,w
u2615:

	skipc
	goto	u2611
	goto	u2610
u2611:
	goto	l5868
u2610:
	goto	l5862
	line	242
	
l5886:	
;smartkey.C: 242: else if(a==b){
	movf	(compe@a),w
	xorwf	(compe@b),w
	skipz
	goto	u2621
	goto	u2620
u2621:
	goto	l5868
u2620:
	goto	l5862
	line	246
	
l752:	
	return
	opt stack 0
GLOBAL	__end_of_compe
	__end_of_compe:
;; =============== function _compe ends ============

	signat	_compe,12409
	global	_setState
psect	text875,local,class=CODE,delta=2
global __ptext875
__ptext875:

;; *************** function _setState *****************
;; Defined at:
;;		line 226 in file "smartkey.C"
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
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
psect	text875
	file	"smartkey.C"
	line	226
	global	__size_of_setState
	__size_of_setState	equ	__end_of_setState-_setState
	
_setState:	
	opt	stack 5
; Regs used in _setState: [wreg+status,2]
;setState@stt stored from wreg
	movwf	(setState@stt)
	line	227
	
l5852:	
;smartkey.C: 227: mtOldState = mtState;
	movf	(_mtState),w
	movwf	(_mtOldState)
	line	228
;smartkey.C: 228: mtState = stt;
	movf	(setState@stt),w
	movwf	(_mtState)
	line	229
	
l5854:	
;smartkey.C: 229: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	230
	
l5856:	
;smartkey.C: 230: timeOut = _tOut;
	movf	(setState@_tOut+1),w
	movwf	(_timeOut+1)
	movf	(setState@_tOut),w
	movwf	(_timeOut)
	line	231
	
l747:	
	return
	opt stack 0
GLOBAL	__end_of_setState
	__end_of_setState:
;; =============== function _setState ends ============

	signat	_setState,8312
	global	_beepOn
psect	text876,local,class=CODE,delta=2
global __ptext876
__ptext876:

;; *************** function _beepOn *****************
;; Defined at:
;;		line 180 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 40/20
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
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
	line	180
	global	__size_of_beepOn
	__size_of_beepOn	equ	__end_of_beepOn-_beepOn
	
_beepOn:	
	opt	stack 5
; Regs used in _beepOn: []
	line	181
	
l5850:	
;smartkey.C: 181: TMR2ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(146/8),(146)&7
	line	182
;smartkey.C: 182: TRISA &= 0xef;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(4/8),(4)&7	;volatile
	line	183
	
l726:	
	return
	opt stack 0
GLOBAL	__end_of_beepOn
	__end_of_beepOn:
;; =============== function _beepOn ends ============

	signat	_beepOn,88
	global	_beepOff
psect	text877,local,class=CODE,delta=2
global __ptext877
__ptext877:

;; *************** function _beepOff *****************
;; Defined at:
;;		line 177 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
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
psect	text877
	file	"smartkey.C"
	line	177
	global	__size_of_beepOff
	__size_of_beepOff	equ	__end_of_beepOff-_beepOff
	
_beepOff:	
	opt	stack 5
; Regs used in _beepOff: []
	line	178
	
l5848:	
;smartkey.C: 178: TMR2ON = 0;RA4 =0;TRISA |= 0x10;
	bcf	(146/8),(146)&7
	bcf	(44/8),(44)&7
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(4/8),(4)&7	;volatile
	line	179
	
l723:	
	return
	opt stack 0
GLOBAL	__end_of_beepOff
	__end_of_beepOff:
;; =============== function _beepOff ends ============

	signat	_beepOff,88
	global	_delay_x10ms
psect	text878,local,class=CODE,delta=2
global __ptext878
__ptext878:

;; *************** function _delay_x10ms *****************
;; Defined at:
;;		line 172 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  t               2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  set             2    2[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
psect	text878
	file	"smartkey.C"
	line	172
	global	__size_of_delay_x10ms
	__size_of_delay_x10ms	equ	__end_of_delay_x10ms-_delay_x10ms
	
_delay_x10ms:	
	opt	stack 5
; Regs used in _delay_x10ms: [wreg]
	line	173
	
l5844:	
;smartkey.C: 173: unsigned int set = t + timeTick;
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
	line	174
;smartkey.C: 174: while(timeTick < set);
	
l5846:	
	movf	(delay_x10ms@set+1),w
	subwf	(_timeTick+1),w
	skipz
	goto	u2555
	movf	(delay_x10ms@set),w
	subwf	(_timeTick),w
u2555:
	skipc
	goto	u2551
	goto	u2550
u2551:
	goto	l5846
u2550:
	line	175
	
l720:	
	return
	opt stack 0
GLOBAL	__end_of_delay_x10ms
	__end_of_delay_x10ms:
;; =============== function _delay_x10ms ends ============

	signat	_delay_x10ms,4216
	global	_WRITE_EEPROM
psect	text879,local,class=CODE,delta=2
global __ptext879
__ptext879:

;; *************** function _WRITE_EEPROM *****************
;; Defined at:
;;		line 211 in file "smartkey.C"
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
;;		On entry : 60/0
;;		On exit  : 60/20
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
psect	text879
	file	"smartkey.C"
	line	211
	global	__size_of_WRITE_EEPROM
	__size_of_WRITE_EEPROM	equ	__end_of_WRITE_EEPROM-_WRITE_EEPROM
	
_WRITE_EEPROM:	
	opt	stack 5
; Regs used in _WRITE_EEPROM: [wreg]
;WRITE_EEPROM@EEAddr stored from wreg
	movwf	(WRITE_EEPROM@EEAddr)
	line	212
	
l5836:	
;smartkey.C: 212: GIE = 0;
	bcf	(95/8),(95)&7
	line	213
;smartkey.C: 213: while(GIE) asm("clrwdt");
	goto	l738
	
l739:	
# 213 "smartkey.C"
clrwdt ;#
psect	text879
	
l738:	
	btfsc	(95/8),(95)&7
	goto	u2531
	goto	u2530
u2531:
	goto	l739
u2530:
	line	214
	
l5838:	
;smartkey.C: 214: EEADR = EEAddr;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(WRITE_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	215
;smartkey.C: 215: EEDAT = EEData;
	bcf	status, 5	;RP0=0, select bank0
	movf	(WRITE_EEPROM@EEData),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(154)^080h	;volatile
	line	216
	
l5840:	
;smartkey.C: 216: EEIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(103/8),(103)&7
	line	217
;smartkey.C: 217: EECON1 = 0x34;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(156)^080h	;volatile
	line	218
	
l5842:	
;smartkey.C: 218: WR = 1;
	bsf	(1256/8)^080h,(1256)&7
	line	219
;smartkey.C: 219: while(WR) asm("clrwdt");
	goto	l741
	
l742:	
# 219 "smartkey.C"
clrwdt ;#
psect	text879
	
l741:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1256/8)^080h,(1256)&7
	goto	u2541
	goto	u2540
u2541:
	goto	l742
u2540:
	
l743:	
	line	221
;smartkey.C: 221: GIE = 1;
	bsf	(95/8),(95)&7
	line	222
	
l744:	
	return
	opt stack 0
GLOBAL	__end_of_WRITE_EEPROM
	__end_of_WRITE_EEPROM:
;; =============== function _WRITE_EEPROM ends ============

	signat	_WRITE_EEPROM,8312
	global	_READ_EEPROM
psect	text880,local,class=CODE,delta=2
global __ptext880
__ptext880:

;; *************** function _READ_EEPROM *****************
;; Defined at:
;;		line 200 in file "smartkey.C"
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
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
psect	text880
	file	"smartkey.C"
	line	200
	global	__size_of_READ_EEPROM
	__size_of_READ_EEPROM	equ	__end_of_READ_EEPROM-_READ_EEPROM
	
_READ_EEPROM:	
	opt	stack 5
; Regs used in _READ_EEPROM: [wreg]
;READ_EEPROM@EEAddr stored from wreg
	line	203
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(READ_EEPROM@EEAddr)
	
l5828:	
;smartkey.C: 201: unsigned char ReEepromData;
;smartkey.C: 203: EEADR = EEAddr;
	movf	(READ_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	204
	
l5830:	
;smartkey.C: 204: RD = 1;
	bsf	(1248/8)^080h,(1248)&7
	line	205
;smartkey.C: 205: ReEepromData = EEDAT;
	movf	(154)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	(READ_EEPROM@ReEepromData)
	line	206
	
l5832:	
;smartkey.C: 206: RD = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1248/8)^080h,(1248)&7
	line	207
;smartkey.C: 207: return ReEepromData;
	bcf	status, 5	;RP0=0, select bank0
	movf	(READ_EEPROM@ReEepromData),w
	line	208
	
l735:	
	return
	opt stack 0
GLOBAL	__end_of_READ_EEPROM
	__end_of_READ_EEPROM:
;; =============== function _READ_EEPROM ends ============

	signat	_READ_EEPROM,4217
	global	_ISR
psect	text881,local,class=CODE,delta=2
global __ptext881
__ptext881:

;; *************** function _ISR *****************
;; Defined at:
;;		line 46 in file "smartkey.C"
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
;;		On exit  : 40/0
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
psect	text881
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
psect	text881
	line	50
	
i1l4896:	
;smartkey.C: 50: if(PAIE&&PAIF){
	btfss	(91/8),(91)&7
	goto	u128_21
	goto	u128_20
u128_21:
	goto	i1l4914
u128_20:
	
i1l4898:	
	btfss	(88/8),(88)&7
	goto	u129_21
	goto	u129_20
u129_21:
	goto	i1l4914
u129_20:
	line	52
	
i1l4900:	
;smartkey.C: 52: tmp = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(5),w	;volatile
	line	53
	
i1l4902:	
;smartkey.C: 53: PAIF = 0;
	bcf	(88/8),(88)&7
	line	55
	
i1l4904:	
;smartkey.C: 55: if(RA6){
	btfss	(46/8),(46)&7
	goto	u130_21
	goto	u130_20
u130_21:
	goto	i1l4912
u130_20:
	line	57
	
i1l4906:	
;smartkey.C: 57: if(mode_chek == 0){
	movf	(_mode_chek),f
	skipz
	goto	u131_21
	goto	u131_20
u131_21:
	goto	i1l4914
u131_20:
	line	58
	
i1l4908:	
;smartkey.C: 58: cntCyc = 0;
	clrf	(_cntCyc)
	line	59
;smartkey.C: 59: cntOff = 0;
	clrf	(_cntOff)
	line	61
	
i1l4910:	
;smartkey.C: 61: mode_chek = 1;
	clrf	(_mode_chek)
	incf	(_mode_chek),f
	goto	i1l4914
	line	67
	
i1l4912:	
;smartkey.C: 66: else{
;smartkey.C: 67: cntOff = 0;
	clrf	(_cntOff)
	line	74
	
i1l4914:	
;smartkey.C: 69: }
;smartkey.C: 71: }
;smartkey.C: 74: if(INTE&&INTF){
	btfss	(92/8),(92)&7
	goto	u132_21
	goto	u132_20
u132_21:
	goto	i1l693
u132_20:
	
i1l4916:	
	btfss	(89/8),(89)&7
	goto	u133_21
	goto	u133_20
u133_21:
	goto	i1l693
u133_20:
	line	76
	
i1l4918:	
;smartkey.C: 75: unsigned char tmp;
;smartkey.C: 76: INTF = 0;
	bcf	(89/8),(89)&7
	line	78
;smartkey.C: 78: if( RC1==0){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(57/8),(57)&7
	goto	u134_21
	goto	u134_20
u134_21:
	goto	i1l693
u134_20:
	line	80
	
i1l4920:	
;smartkey.C: 80: if(timeTick <0x20){
	movlw	high(020h)
	subwf	(_timeTick+1),w
	movlw	low(020h)
	skipnz
	subwf	(_timeTick),w
	skipnc
	goto	u135_21
	goto	u135_20
u135_21:
	goto	i1l695
u135_20:
	line	81
	
i1l4922:	
;smartkey.C: 81: tmp = READ_EEPROM(0x40);
	movlw	(040h)
	fcall	i1_READ_EEPROM
	movwf	(ISR@tmp_1057)
	line	82
	
i1l4924:	
;smartkey.C: 82: WRITE_EEPROM(0x40,tmp+1);
	incf	(ISR@tmp_1057),w
	movwf	(?i1_WRITE_EEPROM)
	movlw	(040h)
	fcall	i1_WRITE_EEPROM
	line	85
	
i1l695:	
	goto	i1l695
	line	93
	
i1l693:	
	line	96
;smartkey.C: 91: }
;smartkey.C: 93: }
;smartkey.C: 96: if(TMR1IE&&TMR1IF){
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1120/8)^080h,(1120)&7
	goto	u136_21
	goto	u136_20
u136_21:
	goto	i1l4968
u136_20:
	
i1l4926:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(96/8),(96)&7
	goto	u137_21
	goto	u137_20
u137_21:
	goto	i1l4968
u137_20:
	line	98
	
i1l4928:	
;smartkey.C: 98: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	100
	
i1l4930:	
;smartkey.C: 100: TMR1H = -5000>>8;
	movlw	(0ECh)
	movwf	(15)	;volatile
	line	101
;smartkey.C: 101: TMR1L = -5000;
	movlw	(078h)
	movwf	(14)	;volatile
	line	107
;smartkey.C: 107: if( mode_chek == 1){
	decf	(_mode_chek),w
	skipz
	goto	u138_21
	goto	u138_20
u138_21:
	goto	i1l4952
u138_20:
	line	109
	
i1l4932:	
;smartkey.C: 109: cntCyc++;
	incf	(_cntCyc),f
	line	111
	
i1l4934:	
;smartkey.C: 111: if(RA6==0){
	btfsc	(46/8),(46)&7
	goto	u139_21
	goto	u139_20
u139_21:
	goto	i1l4952
u139_20:
	line	113
	
i1l4936:	
;smartkey.C: 113: cntOff++;
	incf	(_cntOff),f
	line	116
	
i1l4938:	
;smartkey.C: 116: if(cntOff > 15){
	movlw	(010h)
	subwf	(_cntOff),w
	skipc
	goto	u140_21
	goto	u140_20
u140_21:
	goto	i1l4952
u140_20:
	line	118
	
i1l4940:	
;smartkey.C: 118: mode_chek = 0;
	clrf	(_mode_chek)
	line	120
	
i1l4942:	
;smartkey.C: 120: if((cntCyc>15) &&(cntCyc<50)) {
	movlw	(010h)
	subwf	(_cntCyc),w
	skipc
	goto	u141_21
	goto	u141_20
u141_21:
	goto	i1l4948
u141_20:
	
i1l4944:	
	movlw	(032h)
	subwf	(_cntCyc),w
	skipnc
	goto	u142_21
	goto	u142_20
u142_21:
	goto	i1l4948
u142_20:
	line	121
	
i1l4946:	
;smartkey.C: 121: RegStatus |= (0x40);
	bsf	(_RegStatus)+(6/8),(6)&7
	line	122
;smartkey.C: 122: } else if (cntCyc>=50){
	goto	i1l704
	
i1l4948:	
	movlw	(032h)
	subwf	(_cntCyc),w
	skipc
	goto	u143_21
	goto	u143_20
u143_21:
	goto	i1l704
u143_20:
	line	123
	
i1l4950:	
;smartkey.C: 123: RegStatus &= ~(0x40);
	bcf	(_RegStatus)+(6/8),(6)&7
	line	127
	
i1l704:	
;smartkey.C: 124: }
;smartkey.C: 127: RegStatus |= 0x80;
	bsf	(_RegStatus)+(7/8),(7)&7
	line	143
	
i1l4952:	
;smartkey.C: 128: }
;smartkey.C: 130: }
;smartkey.C: 140: }
;smartkey.C: 143: timeTick++;
	incf	(_timeTick),f
	skipnz
	incf	(_timeTick+1),f
	line	145
	
i1l4954:	
;smartkey.C: 145: if((mtState == 4)||(mtState == 3)){
	movf	(_mtState),w
	xorlw	04h
	skipnz
	goto	u144_21
	goto	u144_20
u144_21:
	goto	i1l4958
u144_20:
	
i1l4956:	
	movf	(_mtState),w
	xorlw	03h
	skipz
	goto	u145_21
	goto	u145_20
u145_21:
	goto	i1l4968
u145_20:
	line	147
	
i1l4958:	
;smartkey.C: 147: if(timeTick > cntTmp){
	movf	(_timeTick+1),w
	subwf	(_cntTmp+1),w
	skipz
	goto	u146_25
	movf	(_timeTick),w
	subwf	(_cntTmp),w
u146_25:
	skipnc
	goto	u146_21
	goto	u146_20
u146_21:
	goto	i1l4968
u146_20:
	line	148
	
i1l4960:	
;smartkey.C: 148: cntTmp = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	149
;smartkey.C: 149: if(cntTmp<=timeOut)
	movf	(_cntTmp+1),w
	subwf	(_timeOut+1),w
	skipz
	goto	u147_25
	movf	(_cntTmp),w
	subwf	(_timeOut),w
u147_25:
	skipc
	goto	u147_21
	goto	u147_20
u147_21:
	goto	i1l4968
u147_20:
	line	151
	
i1l4962:	
;smartkey.C: 150: {
;smartkey.C: 151: if(PR2 == 11)
	bsf	status, 5	;RP0=1, select bank1
	movf	(146)^080h,w	;volatile
	xorlw	0Bh
	skipz
	goto	u148_21
	goto	u148_20
u148_21:
	goto	i1l4966
u148_20:
	line	152
	
i1l4964:	
;smartkey.C: 152: PR2 = 30;
	movlw	(01Eh)
	movwf	(146)^080h	;volatile
	goto	i1l4968
	line	154
	
i1l4966:	
;smartkey.C: 153: else
;smartkey.C: 154: PR2 = 11;
	movlw	(0Bh)
	movwf	(146)^080h	;volatile
	line	163
	
i1l4968:	
;smartkey.C: 155: }
;smartkey.C: 156: }
;smartkey.C: 157: }
;smartkey.C: 160: }
;smartkey.C: 163: if(TMR2IE&&TMR2IF)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1121/8)^080h,(1121)&7
	goto	u149_21
	goto	u149_20
u149_21:
	goto	i1l714
u149_20:
	
i1l4970:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u150_21
	goto	u150_20
u150_21:
	goto	i1l714
u150_20:
	line	165
	
i1l4972:	
;smartkey.C: 164: {
;smartkey.C: 165: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	166
	
i1l4974:	
;smartkey.C: 166: RA4 =~ RA4;
	movlw	1<<((44)&7)
	xorwf	((44)/8),f
	line	169
	
i1l714:	
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
psect	text882,local,class=CODE,delta=2
global __ptext882
__ptext882:

;; *************** function i1_WRITE_EEPROM *****************
;; Defined at:
;;		line 211 in file "smartkey.C"
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
;;		On entry : 60/20
;;		On exit  : 60/20
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
psect	text882
	file	"smartkey.C"
	line	211
	global	__size_ofi1_WRITE_EEPROM
	__size_ofi1_WRITE_EEPROM	equ	__end_ofi1_WRITE_EEPROM-i1_WRITE_EEPROM
	
i1_WRITE_EEPROM:	
	opt	stack 4
; Regs used in i1_WRITE_EEPROM: [wreg]
;i1WRITE_EEPROM@EEAddr stored from wreg
	movwf	(i1WRITE_EEPROM@EEAddr)
	line	212
	
i1l5148:	
;smartkey.C: 212: GIE = 0;
	bcf	(95/8),(95)&7
	line	213
;smartkey.C: 213: while(GIE) asm("clrwdt");
	goto	i1l738
	
i1l739:	
# 213 "smartkey.C"
clrwdt ;#
psect	text882
	
i1l738:	
	btfsc	(95/8),(95)&7
	goto	u168_21
	goto	u168_20
u168_21:
	goto	i1l739
u168_20:
	line	214
	
i1l5150:	
;smartkey.C: 214: EEADR = EEAddr;
	movf	(i1WRITE_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(155)^080h	;volatile
	line	215
;smartkey.C: 215: EEDAT = EEData;
	movf	(i1WRITE_EEPROM@EEData),w
	movwf	(154)^080h	;volatile
	line	216
	
i1l5152:	
;smartkey.C: 216: EEIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(103/8),(103)&7
	line	217
;smartkey.C: 217: EECON1 = 0x34;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(156)^080h	;volatile
	line	218
	
i1l5154:	
;smartkey.C: 218: WR = 1;
	bsf	(1256/8)^080h,(1256)&7
	line	219
;smartkey.C: 219: while(WR) asm("clrwdt");
	goto	i1l741
	
i1l742:	
# 219 "smartkey.C"
clrwdt ;#
psect	text882
	
i1l741:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1256/8)^080h,(1256)&7
	goto	u169_21
	goto	u169_20
u169_21:
	goto	i1l742
u169_20:
	
i1l743:	
	line	221
;smartkey.C: 221: GIE = 1;
	bsf	(95/8),(95)&7
	line	222
	
i1l744:	
	return
	opt stack 0
GLOBAL	__end_ofi1_WRITE_EEPROM
	__end_ofi1_WRITE_EEPROM:
;; =============== function i1_WRITE_EEPROM ends ============

	signat	i1_WRITE_EEPROM,88
	global	i1_READ_EEPROM
psect	text883,local,class=CODE,delta=2
global __ptext883
__ptext883:

;; *************** function i1_READ_EEPROM *****************
;; Defined at:
;;		line 200 in file "smartkey.C"
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
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
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
psect	text883
	file	"smartkey.C"
	line	200
	global	__size_ofi1_READ_EEPROM
	__size_ofi1_READ_EEPROM	equ	__end_ofi1_READ_EEPROM-i1_READ_EEPROM
	
i1_READ_EEPROM:	
	opt	stack 4
; Regs used in i1_READ_EEPROM: [wreg]
;i1READ_EEPROM@EEAddr stored from wreg
	line	203
	movwf	(i1READ_EEPROM@EEAddr)
	
i1l5140:	
;smartkey.C: 201: unsigned char ReEepromData;
;smartkey.C: 203: EEADR = EEAddr;
	movf	(i1READ_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	204
	
i1l5142:	
;smartkey.C: 204: RD = 1;
	bsf	(1248/8)^080h,(1248)&7
	line	205
;smartkey.C: 205: ReEepromData = EEDAT;
	movf	(154)^080h,w	;volatile
	movwf	(i1READ_EEPROM@ReEepromData)
	line	206
	
i1l5144:	
;smartkey.C: 206: RD = 0;
	bcf	(1248/8)^080h,(1248)&7
	line	207
;smartkey.C: 207: return ReEepromData;
	movf	(i1READ_EEPROM@ReEepromData),w
	line	208
	
i1l735:	
	return
	opt stack 0
GLOBAL	__end_ofi1_READ_EEPROM
	__end_ofi1_READ_EEPROM:
;; =============== function i1_READ_EEPROM ends ============

	signat	i1_READ_EEPROM,89
psect	text884,local,class=CODE,delta=2
global __ptext884
__ptext884:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end

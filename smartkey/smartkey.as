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
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_cntTmp
	global	_timeOut
	global	_RegStatus
	global	_cntCyc
	global	_cntOff
	global	_lostDetect
	global	_mode_chek
	global	_mtOldState
	global	_mtState
	global	_timeTick
	global	_PSTRCON
psect	text760,local,class=CODE,delta=2
global __ptext760
__ptext760:
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
	global	_RC0
_RC0	set	56
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

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_cntTmp:
       ds      2

_timeOut:
       ds      2

_RegStatus:
       ds      1

_cntCyc:
       ds      1

_cntOff:
       ds      1

_lostDetect:
       ds      1

_mode_chek:
       ds      1

_mtOldState:
       ds      1

_mtState:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
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
	clrf	((__pbssBANK0)+8)&07Fh
	clrf	((__pbssBANK0)+9)&07Fh
	clrf	((__pbssBANK0)+10)&07Fh
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
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
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
	global	?_READ_EEPROM
?_READ_EEPROM:	; 1 bytes @ 0x0
	global	?_swI2C_WriteByte
?_swI2C_WriteByte:	; 1 bytes @ 0x0
	global	?_swI2C_ReadByte
?_swI2C_ReadByte:	; 1 bytes @ 0x0
	ds	2
	global	??_sys_init
??_sys_init:	; 0 bytes @ 0x2
	global	??_gpio_init
??_gpio_init:	; 0 bytes @ 0x2
	global	??_int_init
??_int_init:	; 0 bytes @ 0x2
	global	??_timer_init
??_timer_init:	; 0 bytes @ 0x2
	global	??_swI2C_Init
??_swI2C_Init:	; 0 bytes @ 0x2
	global	?_delay_x10ms
?_delay_x10ms:	; 0 bytes @ 0x2
	global	??_beepOff
??_beepOff:	; 0 bytes @ 0x2
	global	??_beepOn
??_beepOn:	; 0 bytes @ 0x2
	global	??_READ_EEPROM
??_READ_EEPROM:	; 0 bytes @ 0x2
	global	?_WRITE_EEPROM
?_WRITE_EEPROM:	; 0 bytes @ 0x2
	global	?_setState
?_setState:	; 0 bytes @ 0x2
	global	??_swI2C_Start
??_swI2C_Start:	; 0 bytes @ 0x2
	global	??_swI2C_Stop
??_swI2C_Stop:	; 0 bytes @ 0x2
	global	??_swI2C_WriteByte
??_swI2C_WriteByte:	; 0 bytes @ 0x2
	global	??_swI2C_ReadByte
??_swI2C_ReadByte:	; 0 bytes @ 0x2
	global	?_compe
?_compe:	; 1 bytes @ 0x2
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x2
	global	READ_EEPROM@EEAddr
READ_EEPROM@EEAddr:	; 1 bytes @ 0x2
	global	WRITE_EEPROM@EEData
WRITE_EEPROM@EEData:	; 1 bytes @ 0x2
	global	compe@b
compe@b:	; 1 bytes @ 0x2
	global	delay_x10ms@t
delay_x10ms@t:	; 2 bytes @ 0x2
	global	setState@_tOut
setState@_tOut:	; 2 bytes @ 0x2
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x2
	ds	1
	global	??_WRITE_EEPROM
??_WRITE_EEPROM:	; 0 bytes @ 0x3
	global	READ_EEPROM@ReEepromData
READ_EEPROM@ReEepromData:	; 1 bytes @ 0x3
	global	WRITE_EEPROM@EEAddr
WRITE_EEPROM@EEAddr:	; 1 bytes @ 0x3
	global	compe@dt
compe@dt:	; 1 bytes @ 0x3
	global	swI2C_WriteByte@dat
swI2C_WriteByte@dat:	; 1 bytes @ 0x3
	global	swI2C_ReadByte@Ack
swI2C_ReadByte@Ack:	; 1 bytes @ 0x3
	ds	1
	global	??_delay_x10ms
??_delay_x10ms:	; 0 bytes @ 0x4
	global	??_setState
??_setState:	; 0 bytes @ 0x4
	global	??_compe
??_compe:	; 0 bytes @ 0x4
	global	setState@stt
setState@stt:	; 1 bytes @ 0x4
	global	swI2C_WriteByte@i
swI2C_WriteByte@i:	; 1 bytes @ 0x4
	global	swI2C_ReadByte@dat
swI2C_ReadByte@dat:	; 1 bytes @ 0x4
	global	delay_x10ms@set
delay_x10ms@set:	; 2 bytes @ 0x4
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x4
	ds	1
	global	?_AccWrite
?_AccWrite:	; 1 bytes @ 0x5
	global	swI2C_ReadByte@i
swI2C_ReadByte@i:	; 1 bytes @ 0x5
	global	AccWrite@dat
AccWrite@dat:	; 2 bytes @ 0x5
	ds	1
	global	?_beep
?_beep:	; 0 bytes @ 0x6
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x6
	global	?_AccRead
?_AccRead:	; 1 bytes @ 0x6
	global	beep@rep
beep@rep:	; 1 bytes @ 0x6
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x6
	global	AccRead@dat
AccRead@dat:	; 2 bytes @ 0x6
	ds	1
	global	??_beep
??_beep:	; 0 bytes @ 0x7
	global	beep@delay
beep@delay:	; 1 bytes @ 0x7
	global	AccWrite@len
AccWrite@len:	; 1 bytes @ 0x7
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x7
	ds	1
	global	??_AccWrite
??_AccWrite:	; 0 bytes @ 0x8
	global	AccRead@len
AccRead@len:	; 1 bytes @ 0x8
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x8
	ds	1
	global	compe@a
compe@a:	; 1 bytes @ 0x9
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_AccRead
??_AccRead:	; 0 bytes @ 0x0
	global	AccWrite@rAdd
AccWrite@rAdd:	; 1 bytes @ 0x0
	ds	1
	global	AccWrite@i
AccWrite@i:	; 1 bytes @ 0x1
	ds	2
	global	AccRead@rAdd
AccRead@rAdd:	; 1 bytes @ 0x3
	ds	1
	global	AccRead@i
AccRead@i:	; 1 bytes @ 0x4
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x5
	ds	3
	global	main@isWait
main@isWait:	; 2 bytes @ 0x8
	ds	2
	global	main@isFall
main@isFall:	; 1 bytes @ 0xA
	ds	1
	global	main@acYOld
main@acYOld:	; 1 bytes @ 0xB
	ds	1
	global	main@acXOld
main@acXOld:	; 1 bytes @ 0xC
	ds	1
	global	main@vibrateOn
main@vibrateOn:	; 1 bytes @ 0xD
	ds	1
	global	main@buf
main@buf:	; 6 bytes @ 0xE
	ds	6
	global	main@reAlertOn
main@reAlertOn:	; 1 bytes @ 0x14
	ds	1
	global	main@tmp8
main@tmp8:	; 1 bytes @ 0x15
	ds	1
	global	main@mpuOk
main@mpuOk:	; 1 bytes @ 0x16
	ds	1
	global	main@acYsum
main@acYsum:	; 2 bytes @ 0x17
	ds	2
	global	main@acXsum
main@acXsum:	; 2 bytes @ 0x19
	ds	2
	global	main@isSw
main@isSw:	; 1 bytes @ 0x1B
	ds	1
	global	main@tmp16
main@tmp16:	; 2 bytes @ 0x1C
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 13, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      12
;; BANK0           80     30      41
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
;;   _main->_AccWrite
;;   _main->___awdiv
;;   _main->_compe
;;   _AccRead->_swI2C_ReadByte
;;   _AccWrite->_swI2C_WriteByte
;;   _beep->_delay_x10ms
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_AccRead
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
;; (0) _main                                                25    25      0    3547
;;                                              5 BANK0     25    25      0
;;                           _sys_init
;;                          _gpio_init
;;                           _int_init
;;                         _timer_init
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
;; (1) _AccRead                                              8     5      3     477
;;                                              6 COMMON     3     0      3
;;                                              0 BANK0      5     5      0
;;                        _swI2C_Start
;;                    _swI2C_WriteByte
;;                     _swI2C_ReadByte
;;                         _swI2C_Stop
;; ---------------------------------------------------------------------------------
;; (1) _AccWrite                                             7     4      3     300
;;                                              5 COMMON     5     2      3
;;                                              0 BANK0      2     2      0
;;                        _swI2C_Start
;;                    _swI2C_WriteByte
;;                         _swI2C_Stop
;; ---------------------------------------------------------------------------------
;; (2) _swI2C_ReadByte                                       4     4      0     115
;;                                              2 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (2) _swI2C_WriteByte                                      3     3      0     139
;;                                              2 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _swI2C_Stop                                           1     1      0       0
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _swI2C_Start                                          1     1      0       0
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _swI2C_Init                                           1     1      0       0
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _sys_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _beep                                                 2     1      1      90
;;                                              6 COMMON     2     1      1
;;                        _delay_x10ms
;; ---------------------------------------------------------------------------------
;; (1) ___awdiv                                              8     4      4     300
;;                                              2 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (1) _timer_init                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _int_init                                             1     1      0       0
;; ---------------------------------------------------------------------------------
;; (1) _gpio_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _compe                                                8     6      2     264
;;                                              2 COMMON     8     6      2
;; ---------------------------------------------------------------------------------
;; (1) _setState                                             3     1      2      44
;;                                              2 COMMON     3     1      2
;; ---------------------------------------------------------------------------------
;; (1) _WRITE_EEPROM                                         2     1      1      44
;;                                              2 COMMON     2     1      1
;; ---------------------------------------------------------------------------------
;; (1) _READ_EEPROM                                          2     2      0      45
;;                                              2 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _beepOn                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _beepOff                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _delay_x10ms                                          4     2      2      46
;;                                              2 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _ISR                                                  3     3      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
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
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA              80      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      A       C       1       85.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50     1E      29       4       51.3%
;;BITBANK1            20      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BANK1               20      0       0       6        0.0%
;;ABS                  0      0      35       7        0.0%
;;DATA                 0      0      37       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 250 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf             6   14[BANK0 ] char [6]
;;  tmp16           2   28[BANK0 ] unsigned int 
;;  acXsum          2   25[BANK0 ] int 
;;  acYsum          2   23[BANK0 ] int 
;;  isWait          2    8[BANK0 ] unsigned int 
;;  isSw            1   27[BANK0 ] unsigned char 
;;  mpuOk           1   22[BANK0 ] unsigned char 
;;  tmp8            1   21[BANK0 ] unsigned char 
;;  reAlertOn       1   20[BANK0 ] unsigned char 
;;  vibrateOn       1   13[BANK0 ] unsigned char 
;;  acXOld          1   12[BANK0 ] char 
;;  acYOld          1   11[BANK0 ] char 
;;  isFall          1   10[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    3
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
	line	250
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	253
	
l5766:	
# 253 "smartkey.C"
 MOVLW 0x07 ;#
	line	254
# 254 "smartkey.C"
 MOVWF 0x19 ;#
psect	maintext
	line	257
	
l5768:	
;smartkey.C: 257: unsigned char reAlertOn=0,tmp8,isSw=0,isFall=0,mpuOk=0,vibrateOn=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@reAlertOn)
	clrf	(main@isSw)
	clrf	(main@isFall)
	clrf	(main@vibrateOn)
	line	258
;smartkey.C: 258: unsigned int isWait =0;
	clrf	(main@isWait)
	clrf	(main@isWait+1)
	line	259
;smartkey.C: 259: signed int acYsum=0,acXsum=0;
	clrf	(main@acYsum)
	clrf	(main@acYsum+1)
	clrf	(main@acXsum)
	clrf	(main@acXsum+1)
	line	260
;smartkey.C: 260: unsigned int tmp16=0;
	clrf	(main@tmp16)
	clrf	(main@tmp16+1)
	line	264
	
l5770:	
# 264 "smartkey.C"
clrwdt ;#
psect	maintext
	line	266
	
l5772:	
;smartkey.C: 266: sys_init();
	fcall	_sys_init
	line	267
	
l5774:	
;smartkey.C: 267: gpio_init();
	fcall	_gpio_init
	line	268
	
l5776:	
;smartkey.C: 268: int_init();
	fcall	_int_init
	line	269
	
l5778:	
;smartkey.C: 269: timer_init();
	fcall	_timer_init
	line	271
	
l5780:	
;smartkey.C: 271: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3057:
	decfsz	((??_main+0)+0),f
	goto	u3057
	decfsz	((??_main+0)+0+1),f
	goto	u3057
	nop2
opt asmopt_on

	line	272
	
l5782:	
;smartkey.C: 272: RA7 =1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(47/8),(47)&7
	line	273
	
l5784:	
;smartkey.C: 273: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3067:
	decfsz	((??_main+0)+0),f
	goto	u3067
	decfsz	((??_main+0)+0+1),f
	goto	u3067
	nop2
opt asmopt_on

	line	275
	
l5786:	
;smartkey.C: 275: PAIE = 1;
	bsf	(91/8),(91)&7
	line	277
;smartkey.C: 277: RegStatus = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_RegStatus)
	line	279
	
l5788:	
;smartkey.C: 279: swI2C_Init();
	fcall	_swI2C_Init
	line	282
	
l5790:	
;smartkey.C: 282: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	284
	
l5792:	
;smartkey.C: 284: WRITE_EEPROM(0x7F,0xAA);
	movlw	(0AAh)
	movwf	(?_WRITE_EEPROM)
	movlw	(07Fh)
	fcall	_WRITE_EEPROM
	line	285
	
l5794:	
;smartkey.C: 285: WRITE_EEPROM(0x7F,0xAA);
	movlw	(0AAh)
	movwf	(?_WRITE_EEPROM)
	movlw	(07Fh)
	fcall	_WRITE_EEPROM
	line	289
	
l5796:	
;smartkey.C: 289: _delay((unsigned long)((200)*(4000000/4000.0)));
	opt asmopt_off
movlw  2
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	4
movwf	((??_main+0)+0+1),f
	movlw	186
movwf	((??_main+0)+0),f
u3077:
	decfsz	((??_main+0)+0),f
	goto	u3077
	decfsz	((??_main+0)+0+1),f
	goto	u3077
	decfsz	((??_main+0)+0+2),f
	goto	u3077
	clrwdt
opt asmopt_on

	line	291
	
l5798:	
;smartkey.C: 291: tmp8= READ_EEPROM(0x08);
	movlw	(08h)
	fcall	_READ_EEPROM
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@tmp8)
	line	292
	
l5800:	
;smartkey.C: 292: if(tmp8==0xff) {WRITE_EEPROM(0x08,0);_delay((unsigned long)((2)*(4000000/4000.0)));}
	movf	(main@tmp8),w
	xorlw	0FFh
	skipz
	goto	u2421
	goto	u2420
u2421:
	goto	l5806
u2420:
	
l5802:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	
l5804:	
	opt asmopt_off
movlw	3
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u3087:
	decfsz	((??_main+0)+0),f
	goto	u3087
	decfsz	((??_main+0)+0+1),f
	goto	u3087
	nop2
opt asmopt_on

	line	294
	
l5806:	
;smartkey.C: 294: if(tmp8==0xcc){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@tmp8),w
	xorlw	0CCh
	skipz
	goto	u2431
	goto	u2430
u2431:
	goto	l5820
u2430:
	line	295
	
l5808:	
;smartkey.C: 295: RegStatus &=~(0x20);
	bcf	(_RegStatus)+(5/8),(5)&7
	line	296
	
l5810:	
;smartkey.C: 296: setState(3,1800);
	movlw	low(0708h)
	movwf	(?_setState)
	movlw	high(0708h)
	movwf	((?_setState))+1
	movlw	(03h)
	fcall	_setState
	line	297
	
l5812:	
;smartkey.C: 297: mtOldState = 1;
	clrf	(_mtOldState)
	incf	(_mtOldState),f
	line	298
	
l5814:	
;smartkey.C: 298: cntTmp = timeTick+50;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l5816:	
	movlw	032h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	299
	
l5818:	
;smartkey.C: 299: PR2 =12;
	movlw	(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	300
;smartkey.C: 300: beepOn();
	fcall	_beepOn
	line	301
;smartkey.C: 301: } else {
	goto	l5824
	line	302
	
l5820:	
;smartkey.C: 302: setState(2,400);
	movlw	low(0190h)
	movwf	(?_setState)
	movlw	high(0190h)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	304
	
l5822:	
;smartkey.C: 304: mtOldState = 0;
	clrf	(_mtOldState)
	line	328
	
l5824:	
;smartkey.C: 308: }
;smartkey.C: 327: {
;smartkey.C: 328: buf[0] = 0x28;
	movlw	(028h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@buf)
	line	329
	
l5826:	
;smartkey.C: 329: buf[1] = 0x87;
	movlw	(-121)
	movwf	0+(main@buf)+01h
	line	330
	
l5828:	
;smartkey.C: 330: if(AccWrite(0x6b,(unsigned char)buf,2)==0) mpuOk =1;
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
	goto	u2441
	goto	u2440
u2441:
	goto	l5832
u2440:
	
l5830:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@mpuOk)
	incf	(main@mpuOk),f
	goto	l5834
	line	331
	
l5832:	
;smartkey.C: 331: else mpuOk =0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@mpuOk)
	line	333
	
l5834:	
;smartkey.C: 333: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3097:
	decfsz	((??_main+0)+0),f
	goto	u3097
	decfsz	((??_main+0)+0+1),f
	goto	u3097
	nop2
opt asmopt_on

	line	335
	
l5836:	
;smartkey.C: 334: }
;smartkey.C: 335: if(mpuOk ==0){beep(10,2);}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@mpuOk),f
	skipz
	goto	u2451
	goto	u2450
u2451:
	goto	l5840
u2450:
	
l5838:	
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	339
	
l5840:	
;smartkey.C: 339: if(RC1 && mpuOk ==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(57/8),(57)&7
	goto	u2461
	goto	u2460
u2461:
	goto	l758
u2460:
	
l5842:	
	decf	(main@mpuOk),w
	skipz
	goto	u2471
	goto	u2470
u2471:
	goto	l758
u2470:
	line	341
	
l5844:	
;smartkey.C: 340: {
;smartkey.C: 341: tmp8=0;
	clrf	(main@tmp8)
	line	342
;smartkey.C: 342: while((RC1 )&&(tmp8<11))
	goto	l5854
	line	344
	
l5846:	
;smartkey.C: 343: {
;smartkey.C: 344: if(AccRead(0x3b,(unsigned char)buf,6)==0){
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
	goto	u2481
	goto	u2480
u2481:
	goto	l5852
u2480:
	line	346
	
l5848:	
;smartkey.C: 346: acXsum += buf[0];
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
	line	347
;smartkey.C: 347: acYsum += buf[2];
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
	line	348
;smartkey.C: 348: tmp16 = (signed int)tmp16 + buf[4];
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
	line	349
	
l5850:	
;smartkey.C: 349: tmp8++;
	incf	(main@tmp8),f
	line	351
	
l5852:	
;smartkey.C: 350: }
;smartkey.C: 351: _delay((unsigned long)((500)*(4000000/4000.0)));
	opt asmopt_off
movlw  3
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u3107:
	decfsz	((??_main+0)+0),f
	goto	u3107
	decfsz	((??_main+0)+0+1),f
	goto	u3107
	decfsz	((??_main+0)+0+2),f
	goto	u3107
	nop2
opt asmopt_on

	line	342
	
l5854:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(57/8),(57)&7
	goto	u2491
	goto	u2490
u2491:
	goto	l5858
u2490:
	
l5856:	
	movlw	(0Bh)
	subwf	(main@tmp8),w
	skipc
	goto	u2501
	goto	u2500
u2501:
	goto	l5846
u2500:
	line	355
	
l5858:	
;smartkey.C: 353: }
;smartkey.C: 355: if(tmp8==11){
	movf	(main@tmp8),w
	xorlw	0Bh
	skipz
	goto	u2511
	goto	u2510
u2511:
	goto	l5872
u2510:
	line	356
	
l5860:	
;smartkey.C: 356: acXsum =acXsum/10;
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
	line	357
;smartkey.C: 357: acYsum = acYsum/10;
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
	line	358
;smartkey.C: 358: tmp16 = (signed int)tmp16/10;
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
	line	360
	
l5862:	
;smartkey.C: 360: if(((signed int)tmp16 > (-31)) && ((signed int)tmp16 < 31)){
	movf	(main@tmp16+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(-30))^80h
	subwf	btemp+1,w
	skipz
	goto	u2525
	movlw	low(-30)
	subwf	(main@tmp16),w
u2525:

	skipc
	goto	u2521
	goto	u2520
u2521:
	goto	l5868
u2520:
	
l5864:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@tmp16+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01Fh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2535
	movlw	low(01Fh)
	subwf	(main@tmp16),w
u2535:

	skipnc
	goto	u2531
	goto	u2530
u2531:
	goto	l5868
u2530:
	line	361
	
l5866:	
;smartkey.C: 361: beep(10,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	362
;smartkey.C: 362: }
	goto	l758
	line	366
	
l5868:	
;smartkey.C: 363: else
;smartkey.C: 365: {
;smartkey.C: 366: beep(10,3);
	movlw	(03h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	367
;smartkey.C: 367: WRITE_EEPROM(0x10,(unsigned char)acXsum);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@acXsum),w
	movwf	(?_WRITE_EEPROM)
	movlw	(010h)
	fcall	_WRITE_EEPROM
	line	368
;smartkey.C: 368: WRITE_EEPROM(0x11,(unsigned char)acYsum);
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@acYsum),w
	movwf	(?_WRITE_EEPROM)
	movlw	(011h)
	fcall	_WRITE_EEPROM
	line	369
	
l5870:	
;smartkey.C: 369: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u3117:
	decfsz	((??_main+0)+0),f
	goto	u3117
	decfsz	((??_main+0)+0+1),f
	goto	u3117
	nop2
opt asmopt_on

	goto	l758
	line	373
	
l5872:	
;smartkey.C: 373: beep(10,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	375
	
l758:	
	line	377
;smartkey.C: 374: }
;smartkey.C: 375: }
;smartkey.C: 377: acXsum = (signed char)READ_EEPROM(0x10);
	movlw	(010h)
	fcall	_READ_EEPROM
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@acXsum)
	clrf	(main@acXsum+1)
	btfsc	(main@acXsum),7
	decf	(main@acXsum+1),f
	line	378
;smartkey.C: 378: acYsum = (signed char)READ_EEPROM(0x11);
	movlw	(011h)
	fcall	_READ_EEPROM
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@acYsum)
	clrf	(main@acYsum+1)
	btfsc	(main@acYsum),7
	decf	(main@acYsum+1),f
	line	380
	
l5874:	
;smartkey.C: 380: timeTick = 0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	385
	
l5876:	
;smartkey.C: 385: RC0 =RA6;
	btfsc	(46/8),(46)&7
	goto	u2541
	goto	u2540
	
u2541:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	goto	u2554
u2540:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
u2554:
	line	389
	
l5878:	
;smartkey.C: 389: if(mode_chek == 0)
	movf	(_mode_chek),f
	skipz
	goto	u2561
	goto	u2560
u2561:
	goto	l5982
u2560:
	line	392
	
l5880:	
;smartkey.C: 390: {
;smartkey.C: 392: if(RegStatus & 0x80)
	btfss	(_RegStatus),(7)&7
	goto	u2571
	goto	u2570
u2571:
	goto	l5982
u2570:
	line	394
	
l5882:	
;smartkey.C: 393: {
;smartkey.C: 394: PAIE = 0;
	bcf	(91/8),(91)&7
	line	397
;smartkey.C: 397: RegStatus &= (~0x80);
	bcf	(_RegStatus)+(7/8),(7)&7
	line	411
;smartkey.C: 409: {
;smartkey.C: 411: if ((RegStatus & 0x40) !=0){
	btfss	(_RegStatus),(6)&7
	goto	u2581
	goto	u2580
u2581:
	goto	l5980
u2580:
	goto	l5944
	line	417
	
l5886:	
;smartkey.C: 417: lostDetect =0;
	clrf	(_lostDetect)
	line	418
;smartkey.C: 418: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	419
	
l5888:	
;smartkey.C: 419: tmp16 = 40;
	movlw	028h
	movwf	(main@tmp16)
	clrf	(main@tmp16+1)
	line	420
;smartkey.C: 420: break;
	goto	l793
	line	423
	
l5890:	
;smartkey.C: 423: if(timeTick >30){
	movlw	high(01Fh)
	subwf	(_timeTick+1),w
	movlw	low(01Fh)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u2591
	goto	u2590
u2591:
	goto	l793
u2590:
	line	424
	
l5892:	
;smartkey.C: 424: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	426
	
l5894:	
;smartkey.C: 426: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u2601
	goto	u2600
u2601:
	goto	l5898
u2600:
	
l5896:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	428
	
l5898:	
;smartkey.C: 428: if((mtOldState == 3)){
	bcf	status, 5	;RP0=0, select bank0
	movf	(_mtOldState),w
	xorlw	03h
	skipz
	goto	u2611
	goto	u2610
u2611:
	goto	l5908
u2610:
	line	429
	
l5900:	
;smartkey.C: 429: beepOn();TMR2ON = 0; beep(10,1);
	fcall	_beepOn
	
l5902:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l5904:	
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	430
;smartkey.C: 430: if(reAlertOn)reAlertOn =0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@reAlertOn),w
	skipz
	goto	u2620
	goto	l793
u2620:
	
l5906:	
	clrf	(main@reAlertOn)
	goto	l793
	line	432
	
l5908:	
;smartkey.C: 432: else if((mtOldState == 0)||(mtOldState == 4)){
	movf	(_mtOldState),w
	skipz
	goto	u2630
	goto	l784
u2630:
	
l5910:	
	movf	(_mtOldState),w
	xorlw	04h
	skipz
	goto	u2641
	goto	u2640
u2641:
	goto	l5918
u2640:
	
l784:	
	line	433
;smartkey.C: 433: RegStatus |=(0x20);
	bsf	(_RegStatus)+(5/8),(5)&7
	line	434
	
l5912:	
;smartkey.C: 434: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	435
	
l5914:	
;smartkey.C: 435: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l5916:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	436
;smartkey.C: 436: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	437
;smartkey.C: 437: }
	goto	l793
	line	438
	
l5918:	
;smartkey.C: 438: else if((mtOldState == 1)){
	decf	(_mtOldState),w
	skipz
	goto	u2651
	goto	u2650
u2651:
	goto	l793
u2650:
	line	440
	
l5920:	
;smartkey.C: 440: if(reAlertOn)reAlertOn =0;
	movf	(main@reAlertOn),w
	skipz
	goto	u2660
	goto	l777
u2660:
	goto	l5906
	line	442
	
l777:	
	line	443
;smartkey.C: 441: }
;smartkey.C: 442: }
;smartkey.C: 443: break;
	goto	l793
	line	446
	
l5924:	
;smartkey.C: 446: if(timeTick > 200)
	movlw	high(0C9h)
	subwf	(_timeTick+1),w
	movlw	low(0C9h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u2671
	goto	u2670
u2671:
	goto	l793
u2670:
	line	448
	
l5926:	
;smartkey.C: 447: {
;smartkey.C: 448: beepOff();
	fcall	_beepOff
	line	449
	
l5928:	
;smartkey.C: 449: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u2681
	goto	u2680
u2681:
	goto	l5932
u2680:
	
l5930:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	450
	
l5932:	
;smartkey.C: 450: RegStatus |=(0x20);
	bcf	status, 5	;RP0=0, select bank0
	bsf	(_RegStatus)+(5/8),(5)&7
	line	451
;smartkey.C: 451: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	452
	
l5934:	
;smartkey.C: 452: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l5936:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	goto	l793
	line	458
	
l5938:	
;smartkey.C: 458: beepOff();
	fcall	_beepOff
	line	459
	
l5940:	
;smartkey.C: 459: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	460
;smartkey.C: 460: break;
	goto	l793
	line	414
	
l5944:	
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
goto l793
movlw high(S6224)
movwf pclath
	movlw low(S6224)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S6224:
	ljmp	l793
	ljmp	l5886
	ljmp	l5890
	ljmp	l5924
	ljmp	l5938
psect	maintext

	line	479
	
l5946:	
;smartkey.C: 477: {
;smartkey.C: 479: if(lostDetect==1 && timeTick< 1500)
	decf	(_lostDetect),w
	skipz
	goto	u2691
	goto	u2690
u2691:
	goto	l796
u2690:
	
l5948:	
	movlw	high(05DCh)
	subwf	(_timeTick+1),w
	movlw	low(05DCh)
	skipnz
	subwf	(_timeTick),w
	skipnc
	goto	u2701
	goto	u2700
u2701:
	goto	l796
u2700:
	line	481
	
l5950:	
;smartkey.C: 480: {
;smartkey.C: 481: if(READ_EEPROM(0x08)==0x00) WRITE_EEPROM(0x08,0xcc);
	movlw	(08h)
	fcall	_READ_EEPROM
	iorlw	0
	skipz
	goto	u2711
	goto	u2710
u2711:
	goto	l797
u2710:
	
l5952:	
	movlw	(0CCh)
	movwf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	
l797:	
	line	483
;smartkey.C: 483: setState(3,1800);
	movlw	low(0708h)
	movwf	(?_setState)
	movlw	high(0708h)
	movwf	((?_setState))+1
	movlw	(03h)
	fcall	_setState
	line	484
	
l5954:	
;smartkey.C: 484: cntTmp = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l5956:	
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	485
	
l5958:	
;smartkey.C: 485: PR2 =11;
	movlw	(0Bh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	486
;smartkey.C: 486: beepOn();
	fcall	_beepOn
	line	487
	
l5960:	
;smartkey.C: 487: lostDetect =0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_lostDetect)
	line	488
;smartkey.C: 488: }
	goto	l5962
	line	489
	
l796:	
	line	490
;smartkey.C: 489: else {
;smartkey.C: 490: lostDetect =1;
	clrf	(_lostDetect)
	incf	(_lostDetect),f
	line	494
	
l5962:	
;smartkey.C: 493: }
;smartkey.C: 494: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	goto	l5888
	line	501
	
l5966:	
;smartkey.C: 500: {
;smartkey.C: 501: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	502
	
l5968:	
;smartkey.C: 502: beepOn();TMR2ON = 0;
	fcall	_beepOn
	
l5970:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	503
	
l5972:	
;smartkey.C: 503: beep(10,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	504
	
l5974:	
;smartkey.C: 504: if(mtOldState == 3){reAlertOn =1;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_mtOldState),w
	xorlw	03h
	skipz
	goto	u2721
	goto	u2720
u2721:
	goto	l793
u2720:
	
l5976:	
	clrf	(main@reAlertOn)
	incf	(main@reAlertOn),f
	goto	l793
	line	472
	
l5980:	
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
	goto	l5946
	xorlw	2^1	; case 2
	skipnz
	goto	l5966
	goto	l793
	opt asmopt_on

	line	508
	
l793:	
	line	512
;smartkey.C: 508: }
;smartkey.C: 510: }
;smartkey.C: 512: PAIE = 1;
	bsf	(91/8),(91)&7
	line	520
	
l5982:	
;smartkey.C: 513: }
;smartkey.C: 515: }
;smartkey.C: 519: {
;smartkey.C: 520: if((timeOut!=0)&&( timeTick >timeOut)){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_timeOut+1),w
	iorwf	(_timeOut),w
	skipnz
	goto	u2731
	goto	u2730
u2731:
	goto	l6058
u2730:
	
l5984:	
	movf	(_timeTick+1),w
	subwf	(_timeOut+1),w
	skipz
	goto	u2745
	movf	(_timeTick),w
	subwf	(_timeOut),w
u2745:
	skipnc
	goto	u2741
	goto	u2740
u2741:
	goto	l6058
u2740:
	goto	l6056
	line	531
	
l5988:	
;smartkey.C: 531: beepOff();
	fcall	_beepOff
	line	532
	
l5990:	
;smartkey.C: 532: RegStatus &=(~0x20);
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_RegStatus)+(5/8),(5)&7
	line	533
	
l5992:	
;smartkey.C: 533: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	534
;smartkey.C: 534: break;
	goto	l6058
	line	536
	
l5994:	
;smartkey.C: 536: beepOff();
	fcall	_beepOff
	line	537
	
l5996:	
;smartkey.C: 537: delay_x10ms(20);
	movlw	014h
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	538
	
l5998:	
;smartkey.C: 538: beepOn();TMR2ON = 0;reAlertOn =0;
	fcall	_beepOn
	
l6000:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l6002:	
	clrf	(main@reAlertOn)
	line	539
	
l6004:	
;smartkey.C: 539: beep(30,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(01Eh)
	fcall	_beep
	line	540
	
l6006:	
;smartkey.C: 540: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	541
	
l6008:	
;smartkey.C: 541: RA7 =0;
	bcf	(47/8),(47)&7
	line	542
	
l6010:	
;smartkey.C: 542: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l6012:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	543
;smartkey.C: 543: break;
	goto	l6058
	line	546
	
l6014:	
;smartkey.C: 546: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u2751
	goto	u2750
u2751:
	goto	l6018
u2750:
	
l6016:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	548
	
l6018:	
;smartkey.C: 548: if(reAlertOn){
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@reAlertOn),w
	skipz
	goto	u2760
	goto	l6028
u2760:
	line	549
	
l6020:	
;smartkey.C: 549: setState(4,6000);
	movlw	low(01770h)
	movwf	(?_setState)
	movlw	high(01770h)
	movwf	((?_setState))+1
	movlw	(04h)
	fcall	_setState
	line	550
	
l6022:	
;smartkey.C: 550: cntTmp = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l6024:	
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	551
	
l6026:	
;smartkey.C: 551: PR2 =11;
	movlw	(0Bh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	552
;smartkey.C: 552: beepOn();
	fcall	_beepOn
	line	554
;smartkey.C: 554: }else if(mtOldState == 0){
	goto	l6058
	
l6028:	
	movf	(_mtOldState),f
	skipz
	goto	u2771
	goto	u2770
u2771:
	goto	l6038
u2770:
	line	556
	
l6030:	
;smartkey.C: 556: beep(10,5);
	movlw	(05h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	557
	
l6032:	
;smartkey.C: 557: RegStatus |=(0x20);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RegStatus)+(5/8),(5)&7
	line	559
;smartkey.C: 559: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	goto	l6010
	line	563
	
l6038:	
;smartkey.C: 563: beepOn();TMR2ON = 0;
	fcall	_beepOn
	
l6040:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	564
	
l6042:	
;smartkey.C: 564: reAlertOn =0;
	clrf	(main@reAlertOn)
	line	565
	
l6044:	
;smartkey.C: 565: beep(30,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(01Eh)
	fcall	_beep
	line	566
	
l6046:	
;smartkey.C: 566: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	goto	l6008
	line	522
	
l6056:	
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
	goto	l6058
	xorlw	2^1	; case 2
	skipnz
	goto	l6014
	xorlw	3^2	; case 3
	skipnz
	goto	l5988
	xorlw	4^3	; case 4
	skipnz
	goto	l5994
	goto	l6058
	opt asmopt_on

	line	576
	
l6058:	
;smartkey.C: 572: }
;smartkey.C: 574: }
;smartkey.C: 576: if((timeTick>tmp16) && (mtState == 1) && mpuOk ==1){
	movf	(_timeTick+1),w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@tmp16+1),w
	skipz
	goto	u2785
	movf	(_timeTick),w
	subwf	(main@tmp16),w
u2785:
	skipnc
	goto	u2781
	goto	u2780
u2781:
	goto	l6136
u2780:
	
l6060:	
	decf	(_mtState),w
	skipz
	goto	u2791
	goto	u2790
u2791:
	goto	l6136
u2790:
	
l6062:	
	decf	(main@mpuOk),w
	skipz
	goto	u2801
	goto	u2800
u2801:
	goto	l6136
u2800:
	line	577
	
l6064:	
;smartkey.C: 577: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	578
	
l6066:	
;smartkey.C: 578: if(AccRead(0x3b,buf,6)==0){
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
	goto	u2811
	goto	u2810
u2811:
	goto	l6136
u2810:
	line	580
	
l6068:	
;smartkey.C: 580: if(compe(buf[0], (signed char)acXsum,5) && compe(buf[2], (signed char)acYsum,5)){
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
	goto	u2821
	goto	u2820
u2821:
	goto	l6094
u2820:
	
l6070:	
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
	goto	u2831
	goto	u2830
u2831:
	goto	l6094
u2830:
	line	582
	
l6072:	
;smartkey.C: 582: isSw++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(main@isSw),f
	line	583
	
l6074:	
;smartkey.C: 583: if(isSw >44){
	movlw	(02Dh)
	subwf	(main@isSw),w
	skipc
	goto	u2841
	goto	u2840
u2841:
	goto	l6084
u2840:
	line	584
	
l6076:	
;smartkey.C: 584: isSw =0;
	clrf	(main@isSw)
	line	585
	
l6078:	
;smartkey.C: 585: vibrateOn=2;
	movlw	(02h)
	movwf	(main@vibrateOn)
	line	586
	
l6080:	
;smartkey.C: 586: RegStatus &=(~0x20);
	bcf	(_RegStatus)+(5/8),(5)&7
	line	587
	
l6082:	
;smartkey.C: 587: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	588
;smartkey.C: 588: }
	goto	l6114
	line	589
	
l6084:	
;smartkey.C: 589: else if(isSw > 25){
	movlw	(01Ah)
	subwf	(main@isSw),w
	skipc
	goto	u2851
	goto	u2850
u2851:
	goto	l6114
u2850:
	line	590
	
l6086:	
;smartkey.C: 590: if(isSw%2==0){
	btfsc	(main@isSw),(0)&7
	goto	u2861
	goto	u2860
u2861:
	goto	l818
u2860:
	line	591
	
l6088:	
;smartkey.C: 591: beepOn();TMR2ON = 0; beep(7,1);
	fcall	_beepOn
	
l6090:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l6092:	
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(07h)
	fcall	_beep
	goto	l6114
	line	595
	
l818:	
;smartkey.C: 592: }
;smartkey.C: 593: }
;smartkey.C: 595: }
	goto	l6114
	line	597
	
l6094:	
;smartkey.C: 596: else{
;smartkey.C: 597: isSw =0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@isSw)
	line	600
	
l6096:	
;smartkey.C: 600: if(compe(buf[0], acXOld,2) && compe(buf[2], acYOld,2)){
	movf	(main@acXOld),w
	movwf	(?_compe)
	movlw	(02h)
	movwf	0+(?_compe)+01h
	movf	(main@buf),w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u2871
	goto	u2870
u2871:
	goto	l6114
u2870:
	
l6098:	
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
	goto	u2881
	goto	u2880
u2881:
	goto	l6114
u2880:
	line	601
	
l6100:	
;smartkey.C: 601: isWait++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(main@isWait),f
	skipnz
	incf	(main@isWait+1),f
	line	602
	
l6102:	
;smartkey.C: 602: if(isWait==450){
	decf	(main@isWait+1),w
	movlw	194
	skipnz
	xorwf	(main@isWait),w

	skipz
	goto	u2891
	goto	u2890
u2891:
	goto	l6114
u2890:
	line	603
	
l6104:	
;smartkey.C: 603: isWait = 0;
	clrf	(main@isWait)
	clrf	(main@isWait+1)
	line	604
	
l6106:	
;smartkey.C: 604: beep(7,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	line	605
	
l6108:	
;smartkey.C: 605: vibrateOn=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@vibrateOn)
	incf	(main@vibrateOn),f
	line	606
	
l6110:	
;smartkey.C: 606: RegStatus &=(~0x20);
	bcf	(_RegStatus)+(5/8),(5)&7
	line	607
	
l6112:	
;smartkey.C: 607: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	613
	
l6114:	
;smartkey.C: 608: }
;smartkey.C: 609: }
;smartkey.C: 611: }
;smartkey.C: 613: if( (buf[4] > -31) && (buf[4] < 31)) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(main@buf)+04h,w
	xorlw	80h
	addlw	-((-30)^80h)
	skipc
	goto	u2901
	goto	u2900
u2901:
	goto	l6130
u2900:
	
l6116:	
	movf	0+(main@buf)+04h,w
	xorlw	80h
	addlw	-((01Fh)^80h)
	skipnc
	goto	u2911
	goto	u2910
u2911:
	goto	l6130
u2910:
	line	614
	
l6118:	
;smartkey.C: 614: isFall++;
	incf	(main@isFall),f
	line	615
	
l6120:	
;smartkey.C: 615: if(isFall >4){
	movlw	(05h)
	subwf	(main@isFall),w
	skipc
	goto	u2921
	goto	u2920
u2921:
	goto	l6132
u2920:
	line	616
	
l6122:	
;smartkey.C: 616: isFall =0;
	clrf	(main@isFall)
	line	617
	
l6124:	
;smartkey.C: 617: beep(7,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	line	618
	
l6126:	
;smartkey.C: 618: RegStatus &=(~0x20);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(_RegStatus)+(5/8),(5)&7
	line	619
	
l6128:	
;smartkey.C: 619: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	goto	l6132
	line	623
	
l6130:	
;smartkey.C: 622: else{
;smartkey.C: 623: isFall=0;
	clrf	(main@isFall)
	line	626
	
l6132:	
;smartkey.C: 624: }
;smartkey.C: 626: acYOld = buf[2];acXOld = buf[0];
	movf	0+(main@buf)+02h,w
	movwf	(main@acYOld)
	
l6134:	
	movf	(main@buf),w
	movwf	(main@acXOld)
	line	632
	
l6136:	
;smartkey.C: 627: }
;smartkey.C: 629: }
;smartkey.C: 632: if((timeTick>tmp16) && (mtState == 0 ) && mpuOk ==1){
	movf	(_timeTick+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(main@tmp16+1),w
	skipz
	goto	u2935
	movf	(_timeTick),w
	subwf	(main@tmp16),w
u2935:
	skipnc
	goto	u2931
	goto	u2930
u2931:
	goto	l6184
u2930:
	
l6138:	
	movf	(_mtState),f
	skipz
	goto	u2941
	goto	u2940
u2941:
	goto	l6184
u2940:
	
l6140:	
	decf	(main@mpuOk),w
	skipz
	goto	u2951
	goto	u2950
u2951:
	goto	l6184
u2950:
	line	634
	
l6142:	
;smartkey.C: 634: if(timeTick >65000) timeTick =0;
	movlw	high(0FDE9h)
	subwf	(_timeTick+1),w
	movlw	low(0FDE9h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u2961
	goto	u2960
u2961:
	goto	l6146
u2960:
	
l6144:	
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	635
	
l6146:	
;smartkey.C: 635: tmp16 = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(main@tmp16+1)
	movf	(_timeTick),w
	movwf	(main@tmp16)
	
l6148:	
	movlw	028h
	addwf	(main@tmp16),f
	skipnc
	incf	(main@tmp16+1),f
	line	637
	
l6150:	
;smartkey.C: 637: if(AccRead(0x3b,buf,6)==0){
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
	goto	u2971
	goto	u2970
u2971:
	goto	l6184
u2970:
	line	638
	
l6152:	
;smartkey.C: 638: if(vibrateOn==1){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	decf	(main@vibrateOn),w
	skipz
	goto	u2981
	goto	u2980
u2981:
	goto	l6168
u2980:
	line	639
	
l6154:	
;smartkey.C: 639: if(compe(buf[0],acXOld ,2) && compe(buf[2],acYOld ,2)){
	movf	(main@acXOld),w
	movwf	(?_compe)
	movlw	(02h)
	movwf	0+(?_compe)+01h
	movf	(main@buf),w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u2991
	goto	u2990
u2991:
	goto	l6160
u2990:
	
l6156:	
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
	goto	u3001
	goto	u3000
u3001:
	goto	l6160
u3000:
	line	641
	
l6158:	
;smartkey.C: 641: isSw=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@isSw)
	line	644
;smartkey.C: 644: }
	goto	l6184
	line	646
	
l6160:	
;smartkey.C: 645: else{
;smartkey.C: 646: isSw++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(main@isSw),f
	line	650
	
l6162:	
;smartkey.C: 649: {
;smartkey.C: 650: beepOn();TMR2ON = 0; beep(7,3);
	fcall	_beepOn
	
l6164:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l6166:	
	movlw	(03h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	goto	l6184
	line	654
	
l6168:	
;smartkey.C: 654: else if(vibrateOn==2){
	movf	(main@vibrateOn),w
	xorlw	02h
	skipz
	goto	u3011
	goto	u3010
u3011:
	goto	l829
u3010:
	line	655
	
l6170:	
;smartkey.C: 655: if(compe(buf[0],(signed char)acXsum ,5) && compe(buf[2],(signed char)acYsum ,5)){
	movf	(main@acXsum),w
	movwf	(?_compe)
	movlw	(05h)
	movwf	0+(?_compe)+01h
	movf	(main@buf),w
	fcall	_compe
	xorlw	0
	skipnz
	goto	u3021
	goto	u3020
u3021:
	goto	l6176
u3020:
	
l6172:	
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
	goto	u3031
	goto	u3030
u3031:
	goto	l6176
u3030:
	goto	l6158
	line	662
	
l6176:	
;smartkey.C: 661: else{
;smartkey.C: 662: isSw++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(main@isSw),f
	line	666
	
l6178:	
;smartkey.C: 665: {
;smartkey.C: 666: beepOn();TMR2ON = 0; beep(7,3);
	fcall	_beepOn
	
l6180:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l6182:	
	movlw	(03h)
	movwf	(?_beep)
	movlw	(07h)
	fcall	_beep
	goto	l6184
	line	671
	
l829:	
	line	676
	
l6184:	
;smartkey.C: 667: }
;smartkey.C: 668: }
;smartkey.C: 669: }
;smartkey.C: 671: }
;smartkey.C: 674: }
;smartkey.C: 676: if(RegStatus & 0x20) {RC4 =1;RC2 =1;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_RegStatus),(5)&7
	goto	u3041
	goto	u3040
u3041:
	goto	l837
u3040:
	
l6186:	
	bsf	(60/8),(60)&7
	bsf	(58/8),(58)&7
	goto	l5876
	line	677
	
l837:	
;smartkey.C: 677: else {RC4 =0;RC2 =0;}
	bcf	(60/8),(60)&7
	bcf	(58/8),(58)&7
	goto	l5876
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	682
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_AccRead
psect	text761,local,class=CODE,delta=2
global __ptext761
__ptext761:

;; *************** function _AccRead *****************
;; Defined at:
;;		line 31 in file "mpu6x.c"
;; Parameters:    Size  Location     Type
;;  rAdd            1    wreg     unsigned char 
;;  dat             2    6[COMMON] PTR unsigned char 
;;		 -> RAM(256), main@buf(6), 
;;  len             1    8[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  rAdd            1    3[BANK0 ] unsigned char 
;;  i               1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         3       0       0
;;      Locals:         0       2       0
;;      Temps:          0       3       0
;;      Totals:         3       5       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_swI2C_Start
;;		_swI2C_WriteByte
;;		_swI2C_ReadByte
;;		_swI2C_Stop
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text761
	file	"mpu6x.c"
	line	31
	global	__size_of_AccRead
	__size_of_AccRead	equ	__end_of_AccRead-_AccRead
	
_AccRead:	
	opt	stack 5
; Regs used in _AccRead: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;AccRead@rAdd stored from wreg
	line	34
	movwf	(AccRead@rAdd)
	
l5730:	
;mpu6x.c: 32: unsigned char i;
;mpu6x.c: 34: swI2C_Start();
	fcall	_swI2C_Start
	line	36
;mpu6x.c: 36: if(swI2C_WriteByte(0x68<<1)== 0 )
	movlw	(0D0h)
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2381
	goto	u2380
u2381:
	goto	l5754
u2380:
	line	38
	
l5732:	
;mpu6x.c: 37: {
;mpu6x.c: 38: if(swI2C_WriteByte(rAdd)==0 )
	bcf	status, 5	;RP0=0, select bank0
	movf	(AccRead@rAdd),w
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2391
	goto	u2390
u2391:
	goto	l5758
u2390:
	line	40
	
l5734:	
;mpu6x.c: 39: {
;mpu6x.c: 40: swI2C_Start();
	fcall	_swI2C_Start
	line	41
;mpu6x.c: 41: if(swI2C_WriteByte((0x68<<1)|1)== 0 ){
	movlw	(0D1h)
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2401
	goto	u2400
u2401:
	goto	l5754
u2400:
	line	43
	
l5736:	
;mpu6x.c: 43: for(i=0; i<(len-1);i++){
	bcf	status, 5	;RP0=0, select bank0
	clrf	(AccRead@i)
	goto	l5742
	line	44
	
l5738:	
;mpu6x.c: 44: dat[i]=swI2C_ReadByte(1);
	movlw	(01h)
	fcall	_swI2C_ReadByte
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	
l5740:	
	incf	(AccRead@i),f
	
l5742:	
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
	goto	u2415
	movf	0+(??_AccRead+0)+0,w
	subwf	(AccRead@i),w
u2415:

	skipc
	goto	u2411
	goto	u2410
u2411:
	goto	l5738
u2410:
	line	46
	
l5744:	
;mpu6x.c: 45: }
;mpu6x.c: 46: dat[i]=swI2C_ReadByte(1);
	movlw	(01h)
	fcall	_swI2C_ReadByte
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	
l5746:	
;mpu6x.c: 47: swI2C_Stop();
	fcall	_swI2C_Stop
	line	48
	
l5748:	
;mpu6x.c: 48: return 0;
	movlw	(0)
	goto	l2848
	line	52
	
l5754:	
;mpu6x.c: 51: else
;mpu6x.c: 52: return 1;
	movlw	(01h)
	goto	l2848
	line	55
	
l5758:	
;mpu6x.c: 54: else
;mpu6x.c: 55: return 2;
	movlw	(02h)
	line	59
	
l2848:	
	return
	opt stack 0
GLOBAL	__end_of_AccRead
	__end_of_AccRead:
;; =============== function _AccRead ends ============

	signat	_AccRead,12409
	global	_AccWrite
psect	text762,local,class=CODE,delta=2
global __ptext762
__ptext762:

;; *************** function _AccWrite *****************
;; Defined at:
;;		line 4 in file "mpu6x.c"
;; Parameters:    Size  Location     Type
;;  rAdd            1    wreg     unsigned char 
;;  dat             2    5[COMMON] PTR unsigned char 
;;		 -> RAM(256), 
;;  len             1    7[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  rAdd            1    0[BANK0 ] unsigned char 
;;  i               1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         3       0       0
;;      Locals:         0       2       0
;;      Temps:          2       0       0
;;      Totals:         5       2       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_swI2C_Start
;;		_swI2C_WriteByte
;;		_swI2C_Stop
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text762
	file	"mpu6x.c"
	line	4
	global	__size_of_AccWrite
	__size_of_AccWrite	equ	__end_of_AccWrite-_AccWrite
	
_AccWrite:	
	opt	stack 5
; Regs used in _AccWrite: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;AccWrite@rAdd stored from wreg
	line	6
	movwf	(AccWrite@rAdd)
	
l5696:	
;mpu6x.c: 5: unsigned char i;
;mpu6x.c: 6: swI2C_Start();
	fcall	_swI2C_Start
	line	8
;mpu6x.c: 8: if(swI2C_WriteByte(0x68<<1)== 0 )
	movlw	(0D0h)
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2341
	goto	u2340
u2341:
	goto	l5726
u2340:
	line	10
	
l5698:	
;mpu6x.c: 9: {
;mpu6x.c: 10: if(swI2C_WriteByte(rAdd)==0 )
	bcf	status, 5	;RP0=0, select bank0
	movf	(AccWrite@rAdd),w
	fcall	_swI2C_WriteByte
	iorlw	0
	skipz
	goto	u2351
	goto	u2350
u2351:
	goto	l5722
u2350:
	line	12
	
l5700:	
;mpu6x.c: 11: {
;mpu6x.c: 12: for(i=0; i<len;i++){
	bcf	status, 5	;RP0=0, select bank0
	clrf	(AccWrite@i)
	goto	l5712
	line	13
	
l5702:	
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
	goto	u2361
	goto	u2360
u2361:
	goto	l5710
u2360:
	line	14
	
l5704:	
;mpu6x.c: 14: swI2C_Stop();
	fcall	_swI2C_Stop
	line	15
	
l5706:	
;mpu6x.c: 15: return 3;
	movlw	(03h)
	goto	l2836
	line	12
	
l5710:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(AccWrite@i),f
	
l5712:	
	movf	(AccWrite@len),w
	subwf	(AccWrite@i),w
	skipc
	goto	u2371
	goto	u2370
u2371:
	goto	l5702
u2370:
	line	18
	
l5714:	
;mpu6x.c: 16: }
;mpu6x.c: 17: }
;mpu6x.c: 18: swI2C_Stop();
	fcall	_swI2C_Stop
	line	19
	
l5716:	
;mpu6x.c: 19: return 0;
	movlw	(0)
	goto	l2836
	line	22
	
l5722:	
;mpu6x.c: 21: else
;mpu6x.c: 22: return 2;
	movlw	(02h)
	goto	l2836
	line	25
	
l5726:	
;mpu6x.c: 24: else
;mpu6x.c: 25: return 1;
	movlw	(01h)
	line	27
	
l2836:	
	return
	opt stack 0
GLOBAL	__end_of_AccWrite
	__end_of_AccWrite:
;; =============== function _AccWrite ends ============

	signat	_AccWrite,12409
	global	_swI2C_ReadByte
psect	text763,local,class=CODE,delta=2
global __ptext763
__ptext763:

;; *************** function _swI2C_ReadByte *****************
;; Defined at:
;;		line 112 in file "SWI2C.C"
;; Parameters:    Size  Location     Type
;;  Ack             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Ack             1    3[COMMON] unsigned char 
;;  i               1    5[COMMON] unsigned char 
;;  dat             1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         3       0       0
;;      Temps:          1       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AccRead
;; This function uses a non-reentrant model
;;
psect	text763
	file	"SWI2C.C"
	line	112
	global	__size_of_swI2C_ReadByte
	__size_of_swI2C_ReadByte	equ	__end_of_swI2C_ReadByte-_swI2C_ReadByte
	
_swI2C_ReadByte:	
	opt	stack 5
; Regs used in _swI2C_ReadByte: [wreg+status,2+status,0]
;swI2C_ReadByte@Ack stored from wreg
	line	114
	movwf	(swI2C_ReadByte@Ack)
	
l5092:	
	clrf	(swI2C_ReadByte@dat)
	line	115
	
l5094:	
;SWI2C.C: 115: RA0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(40/8),(40)&7
	line	116
	
l5096:	
;SWI2C.C: 116: TRISA |=0x02;;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(1/8),(1)&7	;volatile
	line	117
	
l5098:	
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
	
l5100:	
;SWI2C.C: 118: for(i=0;i<8;i++)
	clrf	(swI2C_ReadByte@i)
	line	119
	
l2172:	
	line	120
;SWI2C.C: 119: {
;SWI2C.C: 120: RA0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(40/8),(40)&7
	line	121
	
l5104:	
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
	
l5106:	
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
	
l5108:	
;SWI2C.C: 125: RA0 = 0;
	bcf	(40/8),(40)&7
	line	126
	
l5110:	
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
	
l5112:	
	incf	(swI2C_ReadByte@i),f
	movlw	(08h)
	subwf	(swI2C_ReadByte@i),w
	skipc
	goto	u1571
	goto	u1570
u1571:
	goto	l2172
u1570:
	
l2173:	
	line	129
;SWI2C.C: 127: }
;SWI2C.C: 129: TRISA &=0xfD;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(133)^080h+(1/8),(1)&7	;volatile
	line	131
;SWI2C.C: 131: RA1 = (Ack) ? 0 : 1;
	movf	(swI2C_ReadByte@Ack)
	skipnz
	goto	u1581
	goto	u1580
	
u1581:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(41/8),(41)&7
	goto	u1594
u1580:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(41/8),(41)&7
u1594:
	line	132
;SWI2C.C: 132: RA0 = 1;
	bsf	(40/8),(40)&7
	line	133
	
l5114:	
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
	
l5116:	
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
	movf	(swI2C_ReadByte@dat),w
	line	137
	
l2174:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_ReadByte
	__end_of_swI2C_ReadByte:
;; =============== function _swI2C_ReadByte ends ============

	signat	_swI2C_ReadByte,4217
	global	_swI2C_WriteByte
psect	text764,local,class=CODE,delta=2
global __ptext764
__ptext764:

;; *************** function _swI2C_WriteByte *****************
;; Defined at:
;;		line 86 in file "SWI2C.C"
;; Parameters:    Size  Location     Type
;;  dat             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  dat             1    3[COMMON] unsigned char 
;;  i               1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/20
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          1       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AccWrite
;;		_AccRead
;; This function uses a non-reentrant model
;;
psect	text764
	file	"SWI2C.C"
	line	86
	global	__size_of_swI2C_WriteByte
	__size_of_swI2C_WriteByte	equ	__end_of_swI2C_WriteByte-_swI2C_WriteByte
	
_swI2C_WriteByte:	
	opt	stack 5
; Regs used in _swI2C_WriteByte: [wreg+status,2+status,0]
;swI2C_WriteByte@dat stored from wreg
	movwf	(swI2C_WriteByte@dat)
	line	87
	
l5668:	
	line	89
	
l5670:	
;SWI2C.C: 89: TRISA &=0xfD;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(133)^080h+(1/8),(1)&7	;volatile
	line	90
	
l5672:	
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
	
l5674:	
;SWI2C.C: 91: for(i=0;i<8;i++)
	clrf	(swI2C_WriteByte@i)
	line	92
	
l2167:	
	line	93
;SWI2C.C: 92: {
;SWI2C.C: 93: RA1 = (dat&0x80) ? 1:0;
	btfsc	(swI2C_WriteByte@dat),(7)&7
	goto	u2311
	goto	u2310
	
u2311:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(41/8),(41)&7
	goto	u2324
u2310:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(41/8),(41)&7
u2324:
	line	94
;SWI2C.C: 94: dat<<=1;
	clrc
	rlf	(swI2C_WriteByte@dat),f
	line	95
;SWI2C.C: 95: RA0 = 1;
	bsf	(40/8),(40)&7
	line	96
	
l5678:	
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
	
l5680:	
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
	
l5682:	
	incf	(swI2C_WriteByte@i),f
	
l5684:	
	movlw	(08h)
	subwf	(swI2C_WriteByte@i),w
	skipc
	goto	u2331
	goto	u2330
u2331:
	goto	l2167
u2330:
	
l2168:	
	line	101
;SWI2C.C: 99: }
;SWI2C.C: 101: TRISA |=0x02;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(133)^080h+(1/8),(1)&7	;volatile
	line	102
	
l5686:	
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
	
l5688:	
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
	
l5690:	
;SWI2C.C: 106: RA0 = 0;
	bcf	(40/8),(40)&7
	line	107
	
l5692:	
;SWI2C.C: 107: TRISA &=0xfD;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(1/8),(1)&7	;volatile
	line	108
;SWI2C.C: 108: return i;
	movf	(swI2C_WriteByte@i),w
	line	109
	
l2169:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_WriteByte
	__end_of_swI2C_WriteByte:
;; =============== function _swI2C_WriteByte ends ============

	signat	_swI2C_WriteByte,4217
	global	_swI2C_Stop
psect	text765,local,class=CODE,delta=2
global __ptext765
__ptext765:

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
;;		On entry : 40/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          1       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AccWrite
;;		_AccRead
;; This function uses a non-reentrant model
;;
psect	text765
	file	"SWI2C.C"
	line	35
	global	__size_of_swI2C_Stop
	__size_of_swI2C_Stop	equ	__end_of_swI2C_Stop-_swI2C_Stop
	
_swI2C_Stop:	
	opt	stack 5
; Regs used in _swI2C_Stop: [wreg]
	line	37
	
l5662:	
;SWI2C.C: 37: RA1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7
	line	38
;SWI2C.C: 38: RA0 = 1;
	bsf	(40/8),(40)&7
	line	39
	
l5664:	
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
	
l5666:	
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
	
l2161:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_Stop
	__end_of_swI2C_Stop:
;; =============== function _swI2C_Stop ends ============

	signat	_swI2C_Stop,88
	global	_swI2C_Start
psect	text766,local,class=CODE,delta=2
global __ptext766
__ptext766:

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
;;		On entry : 40/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          1       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AccWrite
;;		_AccRead
;; This function uses a non-reentrant model
;;
psect	text766
	file	"SWI2C.C"
	line	22
	global	__size_of_swI2C_Start
	__size_of_swI2C_Start	equ	__end_of_swI2C_Start-_swI2C_Start
	
_swI2C_Start:	
	opt	stack 5
; Regs used in _swI2C_Start: [wreg]
	line	24
	
l5654:	
;SWI2C.C: 24: RA0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(40/8),(40)&7
	line	26
;SWI2C.C: 26: RA1 = 1;
	bsf	(41/8),(41)&7
	line	27
	
l5656:	
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
	
l5658:	
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
	
l5660:	
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
	
l2158:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_Start
	__end_of_swI2C_Start:
;; =============== function _swI2C_Start ends ============

	signat	_swI2C_Start,88
	global	_swI2C_Init
psect	text767,local,class=CODE,delta=2
global __ptext767
__ptext767:

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
;;      Temps:          1       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text767
	file	"SWI2C.C"
	line	8
	global	__size_of_swI2C_Init
	__size_of_swI2C_Init	equ	__end_of_swI2C_Init-_swI2C_Init
	
_swI2C_Init:	
	opt	stack 6
; Regs used in _swI2C_Init: [wreg]
	line	10
	
l5042:	
;SWI2C.C: 10: TRISA &=0xfD;;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(1/8),(1)&7	;volatile
	line	11
;SWI2C.C: 11: TRISA &=0xfe;;
	bcf	(133)^080h+(0/8),(0)&7	;volatile
	line	12
	
l5044:	
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
	
l5046:	
;SWI2C.C: 13: RA0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(40/8),(40)&7
	line	14
	
l5048:	
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
	
l2155:	
	return
	opt stack 0
GLOBAL	__end_of_swI2C_Init
	__end_of_swI2C_Init:
;; =============== function _swI2C_Init ends ============

	signat	_swI2C_Init,88
	global	_sys_init
psect	text768,local,class=CODE,delta=2
global __ptext768
__ptext768:

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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text768
	file	"sysinit.c"
	line	3
	global	__size_of_sys_init
	__size_of_sys_init	equ	__end_of_sys_init-_sys_init
	
_sys_init:	
	opt	stack 6
; Regs used in _sys_init: [wreg]
	line	21
	
l5038:	
;sysinit.c: 21: OSCCON = 0B01010001;
	movlw	(051h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	22
	
l5040:	
;sysinit.c: 22: _nop();
	nop
	line	28
;sysinit.c: 28: while(HTS==0);
	
l1492:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1146/8)^080h,(1146)&7
	goto	u1531
	goto	u1530
u1531:
	goto	l1492
u1530:
	line	30
	
l1495:	
	return
	opt stack 0
GLOBAL	__end_of_sys_init
	__end_of_sys_init:
;; =============== function _sys_init ends ============

	signat	_sys_init,88
	global	_beep
psect	text769,local,class=CODE,delta=2
global __ptext769
__ptext769:

;; *************** function _beep *****************
;; Defined at:
;;		line 182 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  delay           1    wreg     unsigned char 
;;  rep             1    6[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  delay           1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay_x10ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text769
	file	"smartkey.C"
	line	182
	global	__size_of_beep
	__size_of_beep	equ	__end_of_beep-_beep
	
_beep:	
	opt	stack 5
; Regs used in _beep: [wreg+status,2+status,0+pclath+cstack]
;beep@delay stored from wreg
	movwf	(beep@delay)
	line	187
	
l5024:	
;smartkey.C: 185: {
;smartkey.C: 187: while(rep--){
	goto	l5036
	
l720:	
	line	188
;smartkey.C: 188: TMR2ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(146/8),(146)&7
	line	189
	
l5026:	
;smartkey.C: 189: PR2 = 12;
	movlw	(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	190
	
l5028:	
;smartkey.C: 190: delay_x10ms(delay);
	movf	(beep@delay),w
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	191
	
l5030:	
;smartkey.C: 191: TMR2ON = 0;RA4 =0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l5032:	
	bcf	(44/8),(44)&7
	line	192
	
l5034:	
;smartkey.C: 192: delay_x10ms(20);
	movlw	014h
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	187
	
l5036:	
	decf	(beep@rep),f
	movf	((beep@rep)),w
	xorlw	0FFh
	skipz
	goto	u1521
	goto	u1520
u1521:
	goto	l720
u1520:
	line	196
	
l722:	
	return
	opt stack 0
GLOBAL	__end_of_beep
	__end_of_beep:
;; =============== function _beep ends ============

	signat	_beep,8312
	global	___awdiv
psect	text770,local,class=CODE,delta=2
global __ptext770
__ptext770:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    2[COMMON] int 
;;  dividend        2    4[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    8[COMMON] int 
;;  sign            1    7[COMMON] unsigned char 
;;  counter         1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         4       0       0
;;      Locals:         4       0       0
;;      Temps:          0       0       0
;;      Totals:         8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text770
	file	"D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l4980:	
	clrf	(___awdiv@sign)
	line	10
	
l4982:	
	btfss	(___awdiv@divisor+1),7
	goto	u1451
	goto	u1450
u1451:
	goto	l4988
u1450:
	line	11
	
l4984:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	
l4986:	
	clrf	(___awdiv@sign)
	incf	(___awdiv@sign),f
	line	14
	
l4988:	
	btfss	(___awdiv@dividend+1),7
	goto	u1461
	goto	u1460
u1461:
	goto	l4994
u1460:
	line	15
	
l4990:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l4992:	
	movlw	(01h)
	xorwf	(___awdiv@sign),f
	line	18
	
l4994:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l4996:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u1471
	goto	u1470
u1471:
	goto	l5016
u1470:
	line	20
	
l4998:	
	clrf	(___awdiv@counter)
	incf	(___awdiv@counter),f
	line	21
	goto	l5002
	line	22
	
l5000:	
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	line	23
	incf	(___awdiv@counter),f
	line	21
	
l5002:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u1481
	goto	u1480
u1481:
	goto	l5000
u1480:
	line	26
	
l5004:	
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	line	27
	
l5006:	
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u1495
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u1495:
	skipc
	goto	u1491
	goto	u1490
u1491:
	goto	l5012
u1490:
	line	28
	
l5008:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l5010:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	line	31
	
l5012:	
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	line	32
	
l5014:	
	decfsz	(___awdiv@counter),f
	goto	u1501
	goto	u1500
u1501:
	goto	l5004
u1500:
	line	34
	
l5016:	
	movf	(___awdiv@sign),w
	skipz
	goto	u1510
	goto	l5020
u1510:
	line	35
	
l5018:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	line	36
	
l5020:	
	movf	(___awdiv@quotient+1),w
	movwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	movwf	(?___awdiv)
	line	37
	
l3670:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	_timer_init
psect	text771,local,class=CODE,delta=2
global __ptext771
__ptext771:

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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text771
	file	"sysinit.c"
	line	45
	global	__size_of_timer_init
	__size_of_timer_init	equ	__end_of_timer_init-_timer_init
	
_timer_init:	
	opt	stack 6
; Regs used in _timer_init: [wreg+status,2]
	line	55
	
l4968:	
;sysinit.c: 55: TMR2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(17)	;volatile
	line	56
;sysinit.c: 56: PR2 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(146)^080h	;volatile
	line	57
	
l4970:	
;sysinit.c: 57: T2CON = 0B00101001;
	movlw	(029h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	60
	
l4972:	
;sysinit.c: 60: TMR1H = -5000>>8;
	movlw	(0ECh)
	movwf	(15)	;volatile
	line	61
	
l4974:	
;sysinit.c: 61: TMR1L = -5000;
	movlw	(078h)
	movwf	(14)	;volatile
	line	62
	
l4976:	
;sysinit.c: 62: T1CON = 0B00100001;
	movlw	(021h)
	movwf	(16)	;volatile
	line	63
	
l4978:	
;sysinit.c: 63: TMR1ON = 1;
	bsf	(128/8),(128)&7
	line	64
	
l1501:	
	return
	opt stack 0
GLOBAL	__end_of_timer_init
	__end_of_timer_init:
;; =============== function _timer_init ends ============

	signat	_timer_init,88
	global	_int_init
psect	text772,local,class=CODE,delta=2
global __ptext772
__ptext772:

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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text772
	file	"sysinit.c"
	line	67
	global	__size_of_int_init
	__size_of_int_init	equ	__end_of_int_init-_int_init
	
_int_init:	
	opt	stack 6
; Regs used in _int_init: [wreg+status,2]
	line	72
	
l4938:	
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
	
l4940:	
;sysinit.c: 76: IOCA6 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1206/8)^080h,(1206)&7
	line	77
	
l4942:	
;sysinit.c: 77: tmp = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	78
	
l4944:	
;sysinit.c: 78: PAIF = 0;
	bcf	(88/8),(88)&7
	line	79
	
l4946:	
;sysinit.c: 79: PAIE = 0;
	bcf	(91/8),(91)&7
	line	82
	
l4948:	
;sysinit.c: 82: INTEDG = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1038/8)^080h,(1038)&7
	line	83
	
l4950:	
;sysinit.c: 83: INTF = 0;
	bcf	(89/8),(89)&7
	line	84
	
l4952:	
;sysinit.c: 84: INTE = 0;
	bcf	(92/8),(92)&7
	line	86
	
l4954:	
;sysinit.c: 86: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(97/8),(97)&7
	line	87
	
l4956:	
;sysinit.c: 87: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	88
	
l4958:	
;sysinit.c: 88: TMR2ON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	90
	
l4960:	
;sysinit.c: 90: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	91
	
l4962:	
;sysinit.c: 91: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	94
	
l4964:	
;sysinit.c: 94: PEIE = 1;
	bsf	(94/8),(94)&7
	line	96
	
l4966:	
;sysinit.c: 96: GIE = 1;
	bsf	(95/8),(95)&7
	line	97
	
l1504:	
	return
	opt stack 0
GLOBAL	__end_of_int_init
	__end_of_int_init:
;; =============== function _int_init ends ============

	signat	_int_init,88
	global	_gpio_init
psect	text773,local,class=CODE,delta=2
global __ptext773
__ptext773:

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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text773
	file	"sysinit.c"
	line	32
	global	__size_of_gpio_init
	__size_of_gpio_init	equ	__end_of_gpio_init-_gpio_init
	
_gpio_init:	
	opt	stack 6
; Regs used in _gpio_init: [wreg+status,2]
	line	34
	
l4928:	
;sysinit.c: 34: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	35
	
l4930:	
;sysinit.c: 35: TRISA = 0B01101110;
	movlw	(06Eh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	36
	
l4932:	
;sysinit.c: 36: WPUA = 0B10000000;
	movlw	(080h)
	movwf	(149)^080h	;volatile
	line	38
;sysinit.c: 38: PORTC = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	39
	
l4934:	
;sysinit.c: 39: TRISC = 0B11101011;
	movlw	(0EBh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	40
	
l4936:	
;sysinit.c: 40: WPUC = 0B00000000;
	clrf	(136)^080h	;volatile
	line	42
	
l1498:	
	return
	opt stack 0
GLOBAL	__end_of_gpio_init
	__end_of_gpio_init:
;; =============== function _gpio_init ends ============

	signat	_gpio_init,88
	global	_compe
psect	text774,local,class=CODE,delta=2
global __ptext774
__ptext774:

;; *************** function _compe *****************
;; Defined at:
;;		line 233 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  a               1    wreg     char 
;;  b               1    2[COMMON] char 
;;  dt              1    3[COMMON] char 
;; Auto vars:     Size  Location     Type
;;  a               1    9[COMMON] char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         1       0       0
;;      Temps:          5       0       0
;;      Totals:         8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text774
	file	"smartkey.C"
	line	233
	global	__size_of_compe
	__size_of_compe	equ	__end_of_compe-_compe
	
_compe:	
	opt	stack 6
; Regs used in _compe: [wreg]
;compe@a stored from wreg
	line	235
	movwf	(compe@a)
	
l4890:	
;smartkey.C: 235: if(a>b){
	movf	(compe@b),w
	xorlw	80h
	movwf	(??_compe+0)+0
	movf	(compe@a),w
	xorlw	80h
	subwf	(??_compe+0)+0
	skipnc
	goto	u1381
	goto	u1380
u1381:
	goto	l4904
u1380:
	line	236
	
l4892:	
;smartkey.C: 236: if((a-b)<=dt) return 1;
	movf	(compe@b),w
	subwf	(compe@a),w
	movwf	(??_compe+0)+0
	clrf	(??_compe+0)+0+1
	skipc
	decf	1+(??_compe+0)+0,f
	btfsc	(compe@a),7
	decf	((??_compe+0)+0)+1,f
	btfss	(compe@b),7
	goto	u1395o
	incf	((??_compe+0)+0)+1,f
	
u1395o:
	
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
	goto	u1405
	movf	0+(??_compe+0)+0,w
	subwf	0+(??_compe+2)+0,w
u1405:

	skipc
	goto	u1401
	goto	u1400
u1401:
	goto	l4900
u1400:
	
l4894:	
	movlw	(01h)
	goto	l742
	line	237
	
l4900:	
;smartkey.C: 237: else return 0;
	movlw	(0)
	goto	l742
	line	239
	
l4904:	
;smartkey.C: 239: else if(a<b){
	movf	(compe@a),w
	xorlw	80h
	movwf	(??_compe+0)+0
	movf	(compe@b),w
	xorlw	80h
	subwf	(??_compe+0)+0
	skipnc
	goto	u1411
	goto	u1410
u1411:
	goto	l4918
u1410:
	line	240
	
l4906:	
;smartkey.C: 240: if((b-a)<=dt) return 1;
	movf	(compe@a),w
	subwf	(compe@b),w
	movwf	(??_compe+0)+0
	clrf	(??_compe+0)+0+1
	skipc
	decf	1+(??_compe+0)+0,f
	btfsc	(compe@b),7
	decf	((??_compe+0)+0)+1,f
	btfss	(compe@a),7
	goto	u1425o
	incf	((??_compe+0)+0)+1,f
	
u1425o:
	
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
	goto	u1435
	movf	0+(??_compe+0)+0,w
	subwf	0+(??_compe+2)+0,w
u1435:

	skipc
	goto	u1431
	goto	u1430
u1431:
	goto	l4900
u1430:
	goto	l4894
	line	243
	
l4918:	
;smartkey.C: 243: else if(a==b){
	movf	(compe@a),w
	xorwf	(compe@b),w
	skipz
	goto	u1441
	goto	u1440
u1441:
	goto	l4900
u1440:
	goto	l4894
	line	247
	
l742:	
	return
	opt stack 0
GLOBAL	__end_of_compe
	__end_of_compe:
;; =============== function _compe ends ============

	signat	_compe,12409
	global	_setState
psect	text775,local,class=CODE,delta=2
global __ptext775
__ptext775:

;; *************** function _setState *****************
;; Defined at:
;;		line 227 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  stt             1    wreg     unsigned char 
;;  _tOut           2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  stt             1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text775
	file	"smartkey.C"
	line	227
	global	__size_of_setState
	__size_of_setState	equ	__end_of_setState-_setState
	
_setState:	
	opt	stack 6
; Regs used in _setState: [wreg+status,2]
;setState@stt stored from wreg
	movwf	(setState@stt)
	line	228
	
l4884:	
;smartkey.C: 228: mtOldState = mtState;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_mtState),w
	movwf	(_mtOldState)
	line	229
;smartkey.C: 229: mtState = stt;
	movf	(setState@stt),w
	movwf	(_mtState)
	line	230
	
l4886:	
;smartkey.C: 230: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	231
	
l4888:	
;smartkey.C: 231: timeOut = _tOut;
	movf	(setState@_tOut+1),w
	movwf	(_timeOut+1)
	movf	(setState@_tOut),w
	movwf	(_timeOut)
	line	232
	
l737:	
	return
	opt stack 0
GLOBAL	__end_of_setState
	__end_of_setState:
;; =============== function _setState ends ============

	signat	_setState,8312
	global	_WRITE_EEPROM
psect	text776,local,class=CODE,delta=2
global __ptext776
__ptext776:

;; *************** function _WRITE_EEPROM *****************
;; Defined at:
;;		line 212 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  EEAddr          1    wreg     unsigned char 
;;  EEData          1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  EEAddr          1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 60/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text776
	file	"smartkey.C"
	line	212
	global	__size_of_WRITE_EEPROM
	__size_of_WRITE_EEPROM	equ	__end_of_WRITE_EEPROM-_WRITE_EEPROM
	
_WRITE_EEPROM:	
	opt	stack 6
; Regs used in _WRITE_EEPROM: [wreg]
;WRITE_EEPROM@EEAddr stored from wreg
	movwf	(WRITE_EEPROM@EEAddr)
	line	213
	
l4876:	
;smartkey.C: 213: GIE = 0;
	bcf	(95/8),(95)&7
	line	214
;smartkey.C: 214: while(GIE) asm("clrwdt");
	goto	l728
	
l729:	
# 214 "smartkey.C"
clrwdt ;#
psect	text776
	
l728:	
	btfsc	(95/8),(95)&7
	goto	u1361
	goto	u1360
u1361:
	goto	l729
u1360:
	line	215
	
l4878:	
;smartkey.C: 215: EEADR = EEAddr;
	movf	(WRITE_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(155)^080h	;volatile
	line	216
;smartkey.C: 216: EEDAT = EEData;
	movf	(WRITE_EEPROM@EEData),w
	movwf	(154)^080h	;volatile
	line	217
	
l4880:	
;smartkey.C: 217: EEIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(103/8),(103)&7
	line	218
;smartkey.C: 218: EECON1 = 0x34;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(156)^080h	;volatile
	line	219
	
l4882:	
;smartkey.C: 219: WR = 1;
	bsf	(1256/8)^080h,(1256)&7
	line	220
;smartkey.C: 220: while(WR) asm("clrwdt");
	goto	l731
	
l732:	
# 220 "smartkey.C"
clrwdt ;#
psect	text776
	
l731:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1256/8)^080h,(1256)&7
	goto	u1371
	goto	u1370
u1371:
	goto	l732
u1370:
	
l733:	
	line	222
;smartkey.C: 222: GIE = 1;
	bsf	(95/8),(95)&7
	line	223
	
l734:	
	return
	opt stack 0
GLOBAL	__end_of_WRITE_EEPROM
	__end_of_WRITE_EEPROM:
;; =============== function _WRITE_EEPROM ends ============

	signat	_WRITE_EEPROM,8312
	global	_READ_EEPROM
psect	text777,local,class=CODE,delta=2
global __ptext777
__ptext777:

;; *************** function _READ_EEPROM *****************
;; Defined at:
;;		line 201 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  EEAddr          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  EEAddr          1    2[COMMON] unsigned char 
;;  ReEepromData    1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text777
	file	"smartkey.C"
	line	201
	global	__size_of_READ_EEPROM
	__size_of_READ_EEPROM	equ	__end_of_READ_EEPROM-_READ_EEPROM
	
_READ_EEPROM:	
	opt	stack 6
; Regs used in _READ_EEPROM: [wreg]
;READ_EEPROM@EEAddr stored from wreg
	line	204
	movwf	(READ_EEPROM@EEAddr)
	
l4868:	
;smartkey.C: 202: unsigned char ReEepromData;
;smartkey.C: 204: EEADR = EEAddr;
	movf	(READ_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(155)^080h	;volatile
	line	205
	
l4870:	
;smartkey.C: 205: RD = 1;
	bsf	(1248/8)^080h,(1248)&7
	line	206
;smartkey.C: 206: ReEepromData = EEDAT;
	movf	(154)^080h,w	;volatile
	movwf	(READ_EEPROM@ReEepromData)
	line	207
	
l4872:	
;smartkey.C: 207: RD = 0;
	bcf	(1248/8)^080h,(1248)&7
	line	208
;smartkey.C: 208: return ReEepromData;
	movf	(READ_EEPROM@ReEepromData),w
	line	209
	
l725:	
	return
	opt stack 0
GLOBAL	__end_of_READ_EEPROM
	__end_of_READ_EEPROM:
;; =============== function _READ_EEPROM ends ============

	signat	_READ_EEPROM,4217
	global	_beepOn
psect	text778,local,class=CODE,delta=2
global __ptext778
__ptext778:

;; *************** function _beepOn *****************
;; Defined at:
;;		line 178 in file "smartkey.C"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text778
	file	"smartkey.C"
	line	178
	global	__size_of_beepOn
	__size_of_beepOn	equ	__end_of_beepOn-_beepOn
	
_beepOn:	
	opt	stack 6
; Regs used in _beepOn: []
	line	179
	
l4866:	
;smartkey.C: 179: TMR2ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(146/8),(146)&7
	line	180
;smartkey.C: 180: TRISA &= 0xef;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(4/8),(4)&7	;volatile
	line	181
	
l716:	
	return
	opt stack 0
GLOBAL	__end_of_beepOn
	__end_of_beepOn:
;; =============== function _beepOn ends ============

	signat	_beepOn,88
	global	_beepOff
psect	text779,local,class=CODE,delta=2
global __ptext779
__ptext779:

;; *************** function _beepOff *****************
;; Defined at:
;;		line 175 in file "smartkey.C"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text779
	file	"smartkey.C"
	line	175
	global	__size_of_beepOff
	__size_of_beepOff	equ	__end_of_beepOff-_beepOff
	
_beepOff:	
	opt	stack 6
; Regs used in _beepOff: []
	line	176
	
l4864:	
;smartkey.C: 176: TMR2ON = 0;RA4 =0;TRISA |= 0x10;
	bcf	(146/8),(146)&7
	bcf	(44/8),(44)&7
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(4/8),(4)&7	;volatile
	line	177
	
l713:	
	return
	opt stack 0
GLOBAL	__end_of_beepOff
	__end_of_beepOff:
;; =============== function _beepOff ends ============

	signat	_beepOff,88
	global	_delay_x10ms
psect	text780,local,class=CODE,delta=2
global __ptext780
__ptext780:

;; *************** function _delay_x10ms *****************
;; Defined at:
;;		line 170 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  t               2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  set             2    4[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 40/20
;;		On exit  : 40/20
;;		Unchanged: FFFBF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_beep
;;		_main
;; This function uses a non-reentrant model
;;
psect	text780
	file	"smartkey.C"
	line	170
	global	__size_of_delay_x10ms
	__size_of_delay_x10ms	equ	__end_of_delay_x10ms-_delay_x10ms
	
_delay_x10ms:	
	opt	stack 6
; Regs used in _delay_x10ms: [wreg]
	line	171
	
l4860:	
;smartkey.C: 171: unsigned int set = t + timeTick;
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
	line	172
;smartkey.C: 172: while(timeTick < set);
	
l4862:	
	movf	(delay_x10ms@set+1),w
	subwf	(_timeTick+1),w
	skipz
	goto	u1355
	movf	(delay_x10ms@set),w
	subwf	(_timeTick),w
u1355:
	skipc
	goto	u1351
	goto	u1350
u1351:
	goto	l4862
u1350:
	line	173
	
l710:	
	return
	opt stack 0
GLOBAL	__end_of_delay_x10ms
	__end_of_delay_x10ms:
;; =============== function _delay_x10ms ends ============

	signat	_delay_x10ms,4216
	global	_ISR
psect	text781,local,class=CODE,delta=2
global __ptext781
__ptext781:

;; *************** function _ISR *****************
;; Defined at:
;;		line 46 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tmp             1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text781
	file	"smartkey.C"
	line	46
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 5
; Regs used in _ISR: [wreg+status,2+status,0]
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
psect	text781
	line	50
	
i1l4790:	
;smartkey.C: 50: if(PAIE&&PAIF){
	btfss	(91/8),(91)&7
	goto	u116_21
	goto	u116_20
u116_21:
	goto	i1l4808
u116_20:
	
i1l4792:	
	btfss	(88/8),(88)&7
	goto	u117_21
	goto	u117_20
u117_21:
	goto	i1l4808
u117_20:
	line	53
	
i1l4794:	
;smartkey.C: 53: tmp = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(5),w	;volatile
	line	54
	
i1l4796:	
;smartkey.C: 54: PAIF = 0;
	bcf	(88/8),(88)&7
	line	56
	
i1l4798:	
;smartkey.C: 56: if(RA6){
	btfss	(46/8),(46)&7
	goto	u118_21
	goto	u118_20
u118_21:
	goto	i1l4806
u118_20:
	line	58
	
i1l4800:	
;smartkey.C: 58: if(mode_chek == 0){
	movf	(_mode_chek),f
	skipz
	goto	u119_21
	goto	u119_20
u119_21:
	goto	i1l4808
u119_20:
	line	59
	
i1l4802:	
;smartkey.C: 59: cntCyc = 0;
	clrf	(_cntCyc)
	line	60
;smartkey.C: 60: cntOff = 0;
	clrf	(_cntOff)
	line	62
	
i1l4804:	
;smartkey.C: 62: mode_chek = 1;
	clrf	(_mode_chek)
	incf	(_mode_chek),f
	goto	i1l4808
	line	68
	
i1l4806:	
;smartkey.C: 67: else{
;smartkey.C: 68: cntOff = 0;
	clrf	(_cntOff)
	line	94
	
i1l4808:	
;smartkey.C: 71: }
;smartkey.C: 73: }
;smartkey.C: 94: if(TMR1IE&&TMR1IF){
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1120/8)^080h,(1120)&7
	goto	u120_21
	goto	u120_20
u120_21:
	goto	i1l4852
u120_20:
	
i1l4810:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(96/8),(96)&7
	goto	u121_21
	goto	u121_20
u121_21:
	goto	i1l4852
u121_20:
	line	96
	
i1l4812:	
;smartkey.C: 96: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	98
	
i1l4814:	
;smartkey.C: 98: TMR1H = -5000>>8;
	movlw	(0ECh)
	movwf	(15)	;volatile
	line	99
;smartkey.C: 99: TMR1L = -5000;
	movlw	(078h)
	movwf	(14)	;volatile
	line	105
;smartkey.C: 105: if( mode_chek == 1){
	decf	(_mode_chek),w
	skipz
	goto	u122_21
	goto	u122_20
u122_21:
	goto	i1l4836
u122_20:
	line	107
	
i1l4816:	
;smartkey.C: 107: cntCyc++;
	incf	(_cntCyc),f
	line	109
	
i1l4818:	
;smartkey.C: 109: if(RA6==0){
	btfsc	(46/8),(46)&7
	goto	u123_21
	goto	u123_20
u123_21:
	goto	i1l4836
u123_20:
	line	111
	
i1l4820:	
;smartkey.C: 111: cntOff++;
	incf	(_cntOff),f
	line	114
	
i1l4822:	
;smartkey.C: 114: if(cntOff > 15){
	movlw	(010h)
	subwf	(_cntOff),w
	skipc
	goto	u124_21
	goto	u124_20
u124_21:
	goto	i1l4836
u124_20:
	line	116
	
i1l4824:	
;smartkey.C: 116: mode_chek = 0;
	clrf	(_mode_chek)
	line	118
	
i1l4826:	
;smartkey.C: 118: if((cntCyc>15) &&(cntCyc<50)) {
	movlw	(010h)
	subwf	(_cntCyc),w
	skipc
	goto	u125_21
	goto	u125_20
u125_21:
	goto	i1l4832
u125_20:
	
i1l4828:	
	movlw	(032h)
	subwf	(_cntCyc),w
	skipnc
	goto	u126_21
	goto	u126_20
u126_21:
	goto	i1l4832
u126_20:
	line	119
	
i1l4830:	
;smartkey.C: 119: RegStatus |= (0x40);
	bsf	(_RegStatus)+(6/8),(6)&7
	line	120
;smartkey.C: 120: } else if (cntCyc>=50){
	goto	i1l694
	
i1l4832:	
	movlw	(032h)
	subwf	(_cntCyc),w
	skipc
	goto	u127_21
	goto	u127_20
u127_21:
	goto	i1l694
u127_20:
	line	121
	
i1l4834:	
;smartkey.C: 121: RegStatus &= ~(0x40);
	bcf	(_RegStatus)+(6/8),(6)&7
	line	125
	
i1l694:	
;smartkey.C: 122: }
;smartkey.C: 125: RegStatus |= 0x80;
	bsf	(_RegStatus)+(7/8),(7)&7
	line	141
	
i1l4836:	
;smartkey.C: 126: }
;smartkey.C: 128: }
;smartkey.C: 138: }
;smartkey.C: 141: timeTick++;
	incf	(_timeTick),f
	skipnz
	incf	(_timeTick+1),f
	line	143
	
i1l4838:	
;smartkey.C: 143: if((mtState == 4)||(mtState == 3)){
	movf	(_mtState),w
	xorlw	04h
	skipnz
	goto	u128_21
	goto	u128_20
u128_21:
	goto	i1l4842
u128_20:
	
i1l4840:	
	movf	(_mtState),w
	xorlw	03h
	skipz
	goto	u129_21
	goto	u129_20
u129_21:
	goto	i1l4852
u129_20:
	line	145
	
i1l4842:	
;smartkey.C: 145: if(timeTick > cntTmp){
	movf	(_timeTick+1),w
	subwf	(_cntTmp+1),w
	skipz
	goto	u130_25
	movf	(_timeTick),w
	subwf	(_cntTmp),w
u130_25:
	skipnc
	goto	u130_21
	goto	u130_20
u130_21:
	goto	i1l4852
u130_20:
	line	146
	
i1l4844:	
;smartkey.C: 146: cntTmp = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	147
;smartkey.C: 147: if(cntTmp<=timeOut)
	movf	(_cntTmp+1),w
	subwf	(_timeOut+1),w
	skipz
	goto	u131_25
	movf	(_cntTmp),w
	subwf	(_timeOut),w
u131_25:
	skipc
	goto	u131_21
	goto	u131_20
u131_21:
	goto	i1l4852
u131_20:
	line	149
	
i1l4846:	
;smartkey.C: 148: {
;smartkey.C: 149: if(PR2 == 11)
	bsf	status, 5	;RP0=1, select bank1
	movf	(146)^080h,w	;volatile
	xorlw	0Bh
	skipz
	goto	u132_21
	goto	u132_20
u132_21:
	goto	i1l4850
u132_20:
	line	150
	
i1l4848:	
;smartkey.C: 150: PR2 = 30;
	movlw	(01Eh)
	movwf	(146)^080h	;volatile
	goto	i1l4852
	line	152
	
i1l4850:	
;smartkey.C: 151: else
;smartkey.C: 152: PR2 = 11;
	movlw	(0Bh)
	movwf	(146)^080h	;volatile
	line	161
	
i1l4852:	
;smartkey.C: 153: }
;smartkey.C: 154: }
;smartkey.C: 155: }
;smartkey.C: 158: }
;smartkey.C: 161: if(TMR2IE&&TMR2IF)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1121/8)^080h,(1121)&7
	goto	u133_21
	goto	u133_20
u133_21:
	goto	i1l704
u133_20:
	
i1l4854:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u134_21
	goto	u134_20
u134_21:
	goto	i1l704
u134_20:
	line	163
	
i1l4856:	
;smartkey.C: 162: {
;smartkey.C: 163: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	164
	
i1l4858:	
;smartkey.C: 164: RA4 =~ RA4;
	movlw	1<<((44)&7)
	xorwf	((44)/8),f
	line	167
	
i1l704:	
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
psect	text782,local,class=CODE,delta=2
global __ptext782
__ptext782:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end

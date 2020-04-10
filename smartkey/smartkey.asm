//Deviec:MS86Fxx02
//-----------------------Variable---------------------------------
		_mode_chek		EQU		73H
		_timeOut		EQU		48H
		_timeTick		EQU		70H
		_cntTmp		EQU		46H
		_cntCyc		EQU		72H
		_cntOff		EQU		4BH
		_lostDetect		EQU		4CH
		_mtState		EQU		74H
		_mtOldState		EQU		4DH
		_RegStatus		EQU		4AH
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	77H 			//0006 	01F7
		LDR 	PCLATH,0 		//0007 	080A
		STR 	78H 			//0008 	01F8
		LJUMP 	491H 			//0009 	3C91
		LJUMP 	74FH 			//000A 	3F4F

		//;smartkey.C: 232: unsigned char reAlertOn=0,tmp8,isSw=0,isFall=0,accEna=1,vibrateOn=0,ac
		//+                          cSet=0,antenSkip=0;
		CLRR 	41H 			//000B 	0141
		ORG		000CH
		CLRR 	42H 			//000C 	0142
		CLRR 	31H 			//000D 	0131
		CLRR 	36H 			//000E 	0136
		INCR	36H,1 			//000F 	09B6
		CLRR 	32H 			//0010 	0132
		CLRR 	33H 			//0011 	0133

		//;smartkey.C: 233: unsigned int isWait =0;
		CLRR 	2FH 			//0012 	012F
		CLRR 	30H 			//0013 	0130
		ORG		0014H

		//;smartkey.C: 234: signed int acYsum=0,acXsum=0;
		CLRR 	37H 			//0014 	0137
		CLRR 	38H 			//0015 	0138
		CLRR 	39H 			//0016 	0139
		CLRR 	3AH 			//0017 	013A

		//;smartkey.C: 235: unsigned int tmp16=0;
		CLRR 	43H 			//0018 	0143
		CLRR 	44H 			//0019 	0144
		CLRWDT	 			//001A 	0001

		//;smartkey.C: 241: sys_init();
		LCALL 	784H 			//001B 	3784
		ORG		001CH

		//;smartkey.C: 242: gpio_init();
		LCALL 	703H 			//001C 	3703

		//;smartkey.C: 243: timer_init();
		LCALL 	73FH 			//001D 	373F

		//;smartkey.C: 244: int_init();
		LCALL 	69FH 			//001E 	369F

		//;smartkey.C: 247: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//001F 	2A82
		STR 	2DH 			//0020 	01AD
		LDWI 	DDH 			//0021 	2ADD
		STR 	2CH 			//0022 	01AC
		DECRSZ 	2CH,1 		//0023 	0EAC
		ORG		0024H
		LJUMP 	23H 			//0024 	3823
		DECRSZ 	2DH,1 		//0025 	0EAD
		LJUMP 	23H 			//0026 	3823
		LJUMP 	28H 			//0027 	3828

		//;smartkey.C: 251: PAIE = 1;
		BSR 	INTCON,3 		//0028 	198B

		//;smartkey.C: 253: RegStatus = 0;
		BCR 	STATUS,5 		//0029 	1283
		CLRR 	4AH 			//002A 	014A

		//;smartkey.C: 255: swI2C_Init();
		LCALL 	680H 			//002B 	3680
		ORG		002CH
		LDWI 	0H 			//002C 	2A00

		//;smartkey.C: 258: setState(0,0);
		BCR 	STATUS,5 		//002D 	1283
		CLRR 	20H 			//002E 	0120
		CLRR 	21H 			//002F 	0121
		LCALL 	778H 			//0030 	3778

		//;smartkey.C: 260: WRITE_EEPROM(0xFF,0xAA);
		LDWI 	AAH 			//0031 	2AAA
		STR 	20H 			//0032 	01A0
		LDWI 	FFH 			//0033 	2AFF
		ORG		0034H
		LCALL 	6BAH 			//0034 	36BA

		//;smartkey.C: 261: WRITE_EEPROM(0xFF,0xAA);
		LDWI 	AAH 			//0035 	2AAA
		BCR 	STATUS,5 		//0036 	1283
		STR 	20H 			//0037 	01A0
		LDWI 	FFH 			//0038 	2AFF
		LCALL 	6BAH 			//0039 	36BA

		//;smartkey.C: 264: _delay((unsigned long)((200)*(4000000/4000.0)));
		LDWI 	2H 			//003A 	2A02
		BCR 	STATUS,5 		//003B 	1283
		ORG		003CH
		STR 	2EH 			//003C 	01AE
		LDWI 	4H 			//003D 	2A04
		STR 	2DH 			//003E 	01AD
		LDWI 	BAH 			//003F 	2ABA
		STR 	2CH 			//0040 	01AC
		DECRSZ 	2CH,1 		//0041 	0EAC
		LJUMP 	41H 			//0042 	3841
		DECRSZ 	2DH,1 		//0043 	0EAD
		ORG		0044H
		LJUMP 	41H 			//0044 	3841
		DECRSZ 	2EH,1 		//0045 	0EAE
		LJUMP 	41H 			//0046 	3841
		CLRWDT	 			//0047 	0001

		//;smartkey.C: 267: tmp8 = READ_EEPROM(0x08);
		LDWI 	8H 			//0048 	2A08
		LCALL 	76BH 			//0049 	376B
		STR 	45H 			//004A 	01C5

		//;smartkey.C: 268: if(tmp8==0xff) {WRITE_EEPROM(0x08,0);_delay((unsigned long)((2)*(40000
		//+                          00/4000.0)));}
		XORWI 	FFH 			//004B 	26FF
		ORG		004CH
		BTSS 	STATUS,2 		//004C 	1D03
		LJUMP 	5BH 			//004D 	385B
		LDWI 	8H 			//004E 	2A08
		CLRR 	20H 			//004F 	0120
		LCALL 	6BAH 			//0050 	36BA
		LDWI 	3H 			//0051 	2A03
		BCR 	STATUS,5 		//0052 	1283
		STR 	2DH 			//0053 	01AD
		ORG		0054H
		LDWI 	97H 			//0054 	2A97
		STR 	2CH 			//0055 	01AC
		DECRSZ 	2CH,1 		//0056 	0EAC
		LJUMP 	56H 			//0057 	3856
		DECRSZ 	2DH,1 		//0058 	0EAD
		LJUMP 	56H 			//0059 	3856
		LJUMP 	5BH 			//005A 	385B

		//;smartkey.C: 269: if(tmp8==0xcc){
		BCR 	STATUS,5 		//005B 	1283
		ORG		005CH
		LDR 	45H,0 			//005C 	0845
		XORWI 	CCH 			//005D 	26CC
		BTSS 	STATUS,2 		//005E 	1D03
		LJUMP 	76H 			//005F 	3876
		LDWI 	8H 			//0060 	2A08

		//;smartkey.C: 270: RegStatus &=~(0x20);
		BCR 	4AH,5 			//0061 	12CA

		//;smartkey.C: 271: setState(3,1800);
		STR 	20H 			//0062 	01A0
		LDWI 	7H 			//0063 	2A07
		ORG		0064H
		STR 	21H 			//0064 	01A1
		LDWI 	3H 			//0065 	2A03
		LCALL 	778H 			//0066 	3778

		//;smartkey.C: 272: mtOldState = 1;
		CLRR 	4DH 			//0067 	014D
		INCR	4DH,1 			//0068 	09CD

		//;smartkey.C: 273: cntTmp = timeTick+50;
		LDR 	71H,0 			//0069 	0871
		STR 	47H 			//006A 	01C7
		LDR 	70H,0 			//006B 	0870
		ORG		006CH
		STR 	46H 			//006C 	01C6
		LDWI 	32H 			//006D 	2A32
		ADDWR 	46H,1 			//006E 	0BC6
		BTSC 	STATUS,0 		//006F 	1403
		INCR	47H,1 			//0070 	09C7

		//;smartkey.C: 274: PR2L =12;
		LDWI 	CH 			//0071 	2A0C
		BSR 	STATUS,5 		//0072 	1A83
		STR 	11H 			//0073 	0191
		ORG		0074H

		//;smartkey.C: 275: beepOn();
		LCALL 	799H 			//0074 	3799

		//;smartkey.C: 276: } else {
		LJUMP 	7DH 			//0075 	387D

		//;smartkey.C: 277: setState(2,400);
		LDWI 	90H 			//0076 	2A90
		STR 	20H 			//0077 	01A0
		LDWI 	1H 			//0078 	2A01
		STR 	21H 			//0079 	01A1
		LDWI 	2H 			//007A 	2A02
		LCALL 	778H 			//007B 	3778
		ORG		007CH

		//;smartkey.C: 278: mtOldState = 0;
		CLRR 	4DH 			//007C 	014D

		//;smartkey.C: 279: }
		//;smartkey.C: 281: tmp8 = READ_EEPROM(0x3F);
		LDWI 	3FH 			//007D 	2A3F
		LCALL 	76BH 			//007E 	376B
		STR 	45H 			//007F 	01C5

		//;smartkey.C: 282: if(tmp8==6){
		XORWI 	6H 			//0080 	2606

		//;smartkey.C: 283: tmp8 = READ_EEPROM(0x40);
		LDWI 	40H 			//0081 	2A40
		BTSS 	STATUS,2 		//0082 	1D03
		LJUMP 	B5H 			//0083 	38B5
		ORG		0084H
		LCALL 	76BH 			//0084 	376B
		STR 	45H 			//0085 	01C5
		LDWI 	3FH 			//0086 	2A3F

		//;smartkey.C: 284: WRITE_EEPROM(0x3F,0);
		CLRR 	20H 			//0087 	0120
		LCALL 	6BAH 			//0088 	36BA

		//;smartkey.C: 285: while( RA2){
		BCR 	STATUS,5 		//0089 	1283
		BTSS 	5H,2 			//008A 	1D05
		LJUMP 	A7H 			//008B 	38A7
		ORG		008CH

		//;smartkey.C: 286: _delay((unsigned long)((1000)*(4000000/4000.0)));
		LDWI 	6H 			//008C 	2A06
		STR 	2EH 			//008D 	01AE
		LDWI 	13H 			//008E 	2A13
		STR 	2DH 			//008F 	01AD
		LDWI 	B1H 			//0090 	2AB1
		STR 	2CH 			//0091 	01AC
		DECRSZ 	2CH,1 		//0092 	0EAC
		LJUMP 	92H 			//0093 	3892
		ORG		0094H
		DECRSZ 	2DH,1 		//0094 	0EAD
		LJUMP 	92H 			//0095 	3892
		DECRSZ 	2EH,1 		//0096 	0EAE
		LJUMP 	92H 			//0097 	3892
		LJUMP 	99H 			//0098 	3899

		//;smartkey.C: 287: tmp8++;
		BCR 	STATUS,5 		//0099 	1283
		INCR	45H,1 			//009A 	09C5

		//;smartkey.C: 288: if( RA2){
		BTSS 	5H,2 			//009B 	1D05
		ORG		009CH
		LJUMP 	89H 			//009C 	3889

		//;smartkey.C: 289: WRITE_EEPROM(0x40,tmp8);
		LDR 	45H,0 			//009D 	0845
		STR 	20H 			//009E 	01A0
		LDWI 	40H 			//009F 	2A40
		LCALL 	6BAH 			//00A0 	36BA
		LDWI 	AH 			//00A1 	2A0A

		//;smartkey.C: 290: beep(10,1);
		BCR 	STATUS,5 		//00A2 	1283
		CLRR 	24H 			//00A3 	0124
		ORG		00A4H
		INCR	24H,1 			//00A4 	09A4
		LCALL 	6EDH 			//00A5 	36ED
		LJUMP 	89H 			//00A6 	3889

		//;smartkey.C: 291: }
		//;smartkey.C: 292: }
		//;smartkey.C: 293: _delay((unsigned long)((1000)*(4000000/4000.0)));
		LDWI 	6H 			//00A7 	2A06
		STR 	2EH 			//00A8 	01AE
		LDWI 	13H 			//00A9 	2A13
		STR 	2DH 			//00AA 	01AD
		LDWI 	B1H 			//00AB 	2AB1
		ORG		00ACH
		STR 	2CH 			//00AC 	01AC
		DECRSZ 	2CH,1 		//00AD 	0EAC
		LJUMP 	ADH 			//00AE 	38AD
		DECRSZ 	2DH,1 		//00AF 	0EAD
		LJUMP 	ADH 			//00B0 	38AD
		DECRSZ 	2EH,1 		//00B1 	0EAE
		LJUMP 	ADH 			//00B2 	38AD
		LJUMP 	B4H 			//00B3 	38B4
		ORG		00B4H

		//;smartkey.C: 294: }
		//;smartkey.C: 296: tmp8 = READ_EEPROM(0x40);
		LDWI 	40H 			//00B4 	2A40
		LCALL 	76BH 			//00B5 	376B
		STR 	45H 			//00B6 	01C5

		//;smartkey.C: 298: if(tmp8==8){
		XORWI 	8H 			//00B7 	2608
		BTSS 	STATUS,2 		//00B8 	1D03
		LJUMP 	DEH 			//00B9 	38DE

		//;smartkey.C: 299: tmp8= READ_EEPROM(0x41);
		LDWI 	41H 			//00BA 	2A41
		LCALL 	76BH 			//00BB 	376B
		ORG		00BCH
		STR 	45H 			//00BC 	01C5
		LDWI 	32H 			//00BD 	2A32

		//;smartkey.C: 300: beep(50,1);
		CLRR 	24H 			//00BE 	0124
		INCR	24H,1 			//00BF 	09A4
		LCALL 	6EDH 			//00C0 	36ED

		//;smartkey.C: 301: if((tmp8==1)||(tmp8==0xff))
		DECR 	45H,0 			//00C1 	0D45
		BTSC 	STATUS,2 		//00C2 	1503
		LJUMP 	C8H 			//00C3 	38C8
		ORG		00C4H
		LDR 	45H,0 			//00C4 	0845
		XORWI 	FFH 			//00C5 	26FF
		BTSS 	STATUS,2 		//00C6 	1D03
		LJUMP 	CBH 			//00C7 	38CB
		LDWI 	41H 			//00C8 	2A41

		//;smartkey.C: 302: WRITE_EEPROM(0x41,0);
		CLRR 	20H 			//00C9 	0120
		LJUMP 	CEH 			//00CA 	38CE
		LDWI 	41H 			//00CB 	2A41
		ORG		00CCH

		//;smartkey.C: 303: else
		//;smartkey.C: 304: WRITE_EEPROM(0x41,0x1);
		CLRR 	20H 			//00CC 	0120
		INCR	20H,1 			//00CD 	09A0
		LCALL 	6BAH 			//00CE 	36BA
		LDWI 	40H 			//00CF 	2A40

		//;smartkey.C: 305: WRITE_EEPROM(0x40,0);
		BCR 	STATUS,5 		//00D0 	1283
		CLRR 	20H 			//00D1 	0120
		LCALL 	6BAH 			//00D2 	36BA

		//;smartkey.C: 307: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//00D3 	2A82
		ORG		00D4H
		BCR 	STATUS,5 		//00D4 	1283
		STR 	2DH 			//00D5 	01AD
		LDWI 	DDH 			//00D6 	2ADD
		STR 	2CH 			//00D7 	01AC
		DECRSZ 	2CH,1 		//00D8 	0EAC
		LJUMP 	D8H 			//00D9 	38D8
		DECRSZ 	2DH,1 		//00DA 	0EAD
		LJUMP 	D8H 			//00DB 	38D8
		ORG		00DCH
		LJUMP 	DDH 			//00DC 	38DD

		//;smartkey.C: 308: } else if(tmp8==0xff) WRITE_EEPROM(0x40,0);
		LJUMP 	E5H 			//00DD 	38E5
		LDR 	45H,0 			//00DE 	0845
		XORWI 	FFH 			//00DF 	26FF
		BTSS 	STATUS,2 		//00E0 	1D03
		LJUMP 	E5H 			//00E1 	38E5
		LDWI 	40H 			//00E2 	2A40
		CLRR 	20H 			//00E3 	0120
		ORG		00E4H
		LCALL 	6BAH 			//00E4 	36BA

		//;smartkey.C: 311: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//00E5 	2A41
		LCALL 	76BH 			//00E6 	376B
		STR 	45H 			//00E7 	01C5

		//;smartkey.C: 312: if(tmp8==1){
		DECRSZ 	45H,0 		//00E8 	0E45
		LJUMP 	F6H 			//00E9 	38F6
		LDWI 	ACH 			//00EA 	2AAC

		//;smartkey.C: 313: RegStatus |=(0x20);
		BSR 	4AH,5 			//00EB 	1ACA
		ORG		00ECH

		//;smartkey.C: 314: setState(1,3500);
		STR 	20H 			//00EC 	01A0
		LDWI 	DH 			//00ED 	2A0D
		STR 	21H 			//00EE 	01A1
		LDWI 	1H 			//00EF 	2A01
		LCALL 	778H 			//00F0 	3778

		//;smartkey.C: 315: mtOldState = 2;
		LDWI 	2H 			//00F1 	2A02
		STR 	4DH 			//00F2 	01CD

		//;smartkey.C: 317: accEna =0;antenSkip =1;
		CLRR 	36H 			//00F3 	0136
		ORG		00F4H
		CLRR 	33H 			//00F4 	0133
		INCR	33H,1 			//00F5 	09B3

		//;smartkey.C: 319: }
		//;smartkey.C: 322: tmp8 = READ_EEPROM(0x40);
		LDWI 	40H 			//00F6 	2A40
		LCALL 	76BH 			//00F7 	376B
		STR 	45H 			//00F8 	01C5

		//;smartkey.C: 324: if(tmp8==5){
		XORWI 	5H 			//00F9 	2605

		//;smartkey.C: 325: tmp8= READ_EEPROM(0x42);
		LDWI 	42H 			//00FA 	2A42
		BTSS 	STATUS,2 		//00FB 	1D03
		ORG		00FCH
		LJUMP 	125H 			//00FC 	3925
		LCALL 	76BH 			//00FD 	376B
		STR 	45H 			//00FE 	01C5
		LDWI 	AH 			//00FF 	2A0A

		//;smartkey.C: 326: beep(10,1);
		CLRR 	24H 			//0100 	0124
		INCR	24H,1 			//0101 	09A4
		LCALL 	6EDH 			//0102 	36ED

		//;smartkey.C: 327: if((tmp8==1)||(tmp8==0xff)){
		DECR 	45H,0 			//0103 	0D45
		ORG		0104H
		BTSC 	STATUS,2 		//0104 	1503
		LJUMP 	10AH 			//0105 	390A
		LDR 	45H,0 			//0106 	0845
		XORWI 	FFH 			//0107 	26FF
		BTSS 	STATUS,2 		//0108 	1D03
		LJUMP 	110H 			//0109 	3910
		LDWI 	42H 			//010A 	2A42

		//;smartkey.C: 328: WRITE_EEPROM(0x42,0);
		CLRR 	20H 			//010B 	0120
		ORG		010CH
		LCALL 	6BAH 			//010C 	36BA

		//;smartkey.C: 329: antenSkip =0;
		BCR 	STATUS,5 		//010D 	1283
		CLRR 	33H 			//010E 	0133

		//;smartkey.C: 330: }
		LJUMP 	117H 			//010F 	3917
		LDWI 	42H 			//0110 	2A42

		//;smartkey.C: 331: else{
		//;smartkey.C: 332: WRITE_EEPROM(0x42,0x1);
		CLRR 	20H 			//0111 	0120
		INCR	20H,1 			//0112 	09A0
		LCALL 	6BAH 			//0113 	36BA
		ORG		0114H

		//;smartkey.C: 333: antenSkip =1;
		BCR 	STATUS,5 		//0114 	1283
		CLRR 	33H 			//0115 	0133
		INCR	33H,1 			//0116 	09B3
		LDWI 	40H 			//0117 	2A40

		//;smartkey.C: 334: }
		//;smartkey.C: 335: WRITE_EEPROM(0x40,0);
		CLRR 	20H 			//0118 	0120
		LCALL 	6BAH 			//0119 	36BA

		//;smartkey.C: 337: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//011A 	2A82
		BCR 	STATUS,5 		//011B 	1283
		ORG		011CH
		STR 	2DH 			//011C 	01AD
		LDWI 	DDH 			//011D 	2ADD
		STR 	2CH 			//011E 	01AC
		DECRSZ 	2CH,1 		//011F 	0EAC
		LJUMP 	11FH 			//0120 	391F
		DECRSZ 	2DH,1 		//0121 	0EAD
		LJUMP 	11FH 			//0122 	391F
		LJUMP 	124H 			//0123 	3924
		ORG		0124H

		//;smartkey.C: 338: }
		//;smartkey.C: 341: tmp8 = READ_EEPROM(0x42);
		LDWI 	42H 			//0124 	2A42
		LCALL 	76BH 			//0125 	376B
		STR 	45H 			//0126 	01C5

		//;smartkey.C: 342: if(tmp8==1){
		DECRSZ 	45H,0 		//0127 	0E45
		LJUMP 	140H 			//0128 	3940
		LDWI 	ACH 			//0129 	2AAC

		//;smartkey.C: 343: antenSkip =1;
		CLRR 	33H 			//012A 	0133
		INCR	33H,1 			//012B 	09B3
		ORG		012CH

		//;smartkey.C: 344: RegStatus |=(0x20);
		BSR 	4AH,5 			//012C 	1ACA

		//;smartkey.C: 345: setState(1,3500);
		STR 	20H 			//012D 	01A0
		LDWI 	DH 			//012E 	2A0D
		STR 	21H 			//012F 	01A1
		LDWI 	1H 			//0130 	2A01
		LCALL 	778H 			//0131 	3778

		//;smartkey.C: 346: mtOldState = 2;
		LDWI 	2H 			//0132 	2A02
		STR 	4DH 			//0133 	01CD
		ORG		0134H

		//;smartkey.C: 347: tmp16 = timeTick+40;
		LDR 	71H,0 			//0134 	0871
		STR 	44H 			//0135 	01C4
		LDR 	70H,0 			//0136 	0870
		STR 	43H 			//0137 	01C3
		LDWI 	28H 			//0138 	2A28
		ADDWR 	43H,1 			//0139 	0BC3
		BTSC 	STATUS,0 		//013A 	1403
		INCR	44H,1 			//013B 	09C4
		ORG		013CH
		LDWI 	AH 			//013C 	2A0A

		//;smartkey.C: 348: beep(10,1);
		CLRR 	24H 			//013D 	0124
		INCR	24H,1 			//013E 	09A4
		LCALL 	6EDH 			//013F 	36ED

		//;smartkey.C: 349: }
		//;smartkey.C: 352: buf[0] = 0x08;
		LDWI 	8H 			//0140 	2A08
		STR 	3BH 			//0141 	01BB

		//;smartkey.C: 353: buf[1] = 0x4d;
		LDWI 	4DH 			//0142 	2A4D
		STR 	3CH 			//0143 	01BC
		ORG		0144H

		//;smartkey.C: 354: if((AccWrite(0x10,(unsigned char)buf,2)==0)) {
		LDWI 	3BH 			//0144 	2A3B
		STR 	2CH 			//0145 	01AC
		CLRR 	2DH 			//0146 	012D
		STR 	23H 			//0147 	01A3
		LDR 	2DH,0 			//0148 	082D
		STR 	24H 			//0149 	01A4
		LDWI 	2H 			//014A 	2A02
		STR 	25H 			//014B 	01A5
		ORG		014CH
		LDWI 	10H 			//014C 	2A10
		LCALL 	658H 			//014D 	3658
		IORWI 	0H 			//014E 	2500
		BTSC 	STATUS,2 		//014F 	1503
		LJUMP 	157H 			//0150 	3957
		LDWI 	2H 			//0151 	2A02

		//;smartkey.C: 357: else {
		//;smartkey.C: 358: accEna =0;
		BCR 	STATUS,5 		//0152 	1283
		CLRR 	36H 			//0153 	0136
		ORG		0154H

		//;smartkey.C: 359: beep(10,2);
		STR 	24H 			//0154 	01A4
		LDWI 	AH 			//0155 	2A0A
		LCALL 	6EDH 			//0156 	36ED

		//;smartkey.C: 360: }
		//;smartkey.C: 365: tmp8= READ_EEPROM(0x40);
		LDWI 	40H 			//0157 	2A40
		LCALL 	76BH 			//0158 	376B
		STR 	45H 			//0159 	01C5

		//;smartkey.C: 367: if(tmp8==6){
		XORWI 	6H 			//015A 	2606
		BTSS 	STATUS,2 		//015B 	1D03
		ORG		015CH
		LJUMP 	20AH 			//015C 	3A0A

		//;smartkey.C: 368: if(accEna ==1){
		DECRSZ 	36H,0 		//015D 	0E36
		LJUMP 	206H 			//015E 	3A06
		LDWI 	3H 			//015F 	2A03

		//;smartkey.C: 369: tmp8=0; beep(10,3);
		CLRR 	45H 			//0160 	0145
		STR 	24H 			//0161 	01A4
		LDWI 	AH 			//0162 	2A0A
		LCALL 	6EDH 			//0163 	36ED
		ORG		0164H

		//;smartkey.C: 370: while((RA2)&&(tmp8<11)){
		LJUMP 	1A0H 			//0164 	39A0

		//;smartkey.C: 371: if(AccRead(0x02,(unsigned char)buf,6)==0){
		LDWI 	3BH 			//0165 	2A3B
		STR 	2CH 			//0166 	01AC
		CLRR 	2DH 			//0167 	012D
		STR 	24H 			//0168 	01A4
		LDR 	2DH,0 			//0169 	082D
		STR 	25H 			//016A 	01A5
		LDWI 	6H 			//016B 	2A06
		ORG		016CH
		STR 	26H 			//016C 	01A6
		LDWI 	2H 			//016D 	2A02
		LCALL 	61DH 			//016E 	361D
		IORWI 	0H 			//016F 	2500
		BTSS 	STATUS,2 		//0170 	1D03
		LJUMP 	192H 			//0171 	3992

		//;smartkey.C: 372: acXsum += buf[1];
		BCR 	STATUS,5 		//0172 	1283
		LDR 	3CH,0 			//0173 	083C
		ORG		0174H
		STR 	2CH 			//0174 	01AC
		CLRR 	2DH 			//0175 	012D
		BTSC 	2CH,7 			//0176 	17AC
		DECR 	2DH,1 			//0177 	0DAD
		ADDWR 	39H,1 			//0178 	0BB9
		BTSC 	STATUS,0 		//0179 	1403
		INCR	3AH,1 			//017A 	09BA
		LDR 	2DH,0 			//017B 	082D
		ORG		017CH
		ADDWR 	3AH,1 			//017C 	0BBA

		//;smartkey.C: 373: acYsum += buf[3];
		LDR 	3EH,0 			//017D 	083E
		STR 	2CH 			//017E 	01AC
		CLRR 	2DH 			//017F 	012D
		BTSC 	2CH,7 			//0180 	17AC
		DECR 	2DH,1 			//0181 	0DAD
		ADDWR 	37H,1 			//0182 	0BB7
		BTSC 	STATUS,0 		//0183 	1403
		ORG		0184H
		INCR	38H,1 			//0184 	09B8
		LDR 	2DH,0 			//0185 	082D
		ADDWR 	38H,1 			//0186 	0BB8

		//;smartkey.C: 374: tmp16 = (signed int)tmp16 + buf[5];
		LDR 	40H,0 			//0187 	0840
		STR 	2CH 			//0188 	01AC
		CLRR 	2DH 			//0189 	012D
		BTSC 	2CH,7 			//018A 	17AC
		DECR 	2DH,1 			//018B 	0DAD
		ORG		018CH
		ADDWR 	43H,1 			//018C 	0BC3
		BTSC 	STATUS,0 		//018D 	1403
		INCR	44H,1 			//018E 	09C4
		LDR 	2DH,0 			//018F 	082D
		ADDWR 	44H,1 			//0190 	0BC4

		//;smartkey.C: 375: tmp8++;
		INCR	45H,1 			//0191 	09C5

		//;smartkey.C: 376: }
		//;smartkey.C: 377: _delay((unsigned long)((500)*(4000000/4000.0)));
		LDWI 	3H 			//0192 	2A03
		BCR 	STATUS,5 		//0193 	1283
		ORG		0194H
		STR 	2EH 			//0194 	01AE
		LDWI 	8AH 			//0195 	2A8A
		STR 	2DH 			//0196 	01AD
		LDWI 	56H 			//0197 	2A56
		STR 	2CH 			//0198 	01AC
		DECRSZ 	2CH,1 		//0199 	0EAC
		LJUMP 	199H 			//019A 	3999
		DECRSZ 	2DH,1 		//019B 	0EAD
		ORG		019CH
		LJUMP 	199H 			//019C 	3999
		DECRSZ 	2EH,1 		//019D 	0EAE
		LJUMP 	199H 			//019E 	3999
		LJUMP 	1A0H 			//019F 	39A0
		BCR 	STATUS,5 		//01A0 	1283
		BTSS 	5H,2 			//01A1 	1D05
		LJUMP 	1A7H 			//01A2 	39A7
		LDWI 	BH 			//01A3 	2A0B
		ORG		01A4H
		SUBWR 	45H,0 			//01A4 	0C45
		BTSS 	STATUS,0 		//01A5 	1C03
		LJUMP 	165H 			//01A6 	3965

		//;smartkey.C: 378: }
		//;smartkey.C: 380: if(tmp8==11){
		LDR 	45H,0 			//01A7 	0845
		XORWI 	BH 			//01A8 	260B
		BTSS 	STATUS,2 		//01A9 	1D03
		LJUMP 	202H 			//01AA 	3A02

		//;smartkey.C: 381: acXsum =acXsum/10;
		LDWI 	AH 			//01AB 	2A0A
		ORG		01ACH
		STR 	20H 			//01AC 	01A0
		CLRR 	21H 			//01AD 	0121
		LDR 	3AH,0 			//01AE 	083A
		STR 	23H 			//01AF 	01A3
		LDR 	39H,0 			//01B0 	0839
		STR 	22H 			//01B1 	01A2
		LCALL 	517H 			//01B2 	3517
		LDR 	21H,0 			//01B3 	0821
		ORG		01B4H
		STR 	3AH 			//01B4 	01BA
		LDR 	20H,0 			//01B5 	0820
		STR 	39H 			//01B6 	01B9

		//;smartkey.C: 382: acYsum = acYsum/10;
		LDWI 	AH 			//01B7 	2A0A
		STR 	20H 			//01B8 	01A0
		CLRR 	21H 			//01B9 	0121
		LDR 	38H,0 			//01BA 	0838
		STR 	23H 			//01BB 	01A3
		ORG		01BCH
		LDR 	37H,0 			//01BC 	0837
		STR 	22H 			//01BD 	01A2
		LCALL 	517H 			//01BE 	3517
		LDR 	21H,0 			//01BF 	0821
		STR 	38H 			//01C0 	01B8
		LDR 	20H,0 			//01C1 	0820
		STR 	37H 			//01C2 	01B7

		//;smartkey.C: 383: tmp16 = (signed int)tmp16/10;
		LDWI 	AH 			//01C3 	2A0A
		ORG		01C4H
		STR 	20H 			//01C4 	01A0
		CLRR 	21H 			//01C5 	0121
		LDR 	44H,0 			//01C6 	0844
		STR 	23H 			//01C7 	01A3
		LDR 	43H,0 			//01C8 	0843
		STR 	22H 			//01C9 	01A2
		LCALL 	517H 			//01CA 	3517
		LDR 	21H,0 			//01CB 	0821
		ORG		01CCH
		STR 	44H 			//01CC 	01C4
		LDR 	20H,0 			//01CD 	0820
		STR 	43H 			//01CE 	01C3

		//;smartkey.C: 385: if(((signed int)tmp16 > (-31)) && ((signed int)tmp16 < 31)){
		LDR 	44H,0 			//01CF 	0844
		XORWI 	80H 			//01D0 	2680
		STR 	7FH 			//01D1 	01FF
		LDWI 	7FH 			//01D2 	2A7F
		SUBWR 	7FH,0 			//01D3 	0C7F
		ORG		01D4H
		BTSS 	STATUS,2 		//01D4 	1D03
		LJUMP 	1D8H 			//01D5 	39D8
		LDWI 	E2H 			//01D6 	2AE2
		SUBWR 	43H,0 			//01D7 	0C43
		BTSS 	STATUS,0 		//01D8 	1C03
		LJUMP 	1E9H 			//01D9 	39E9
		BCR 	STATUS,5 		//01DA 	1283
		LDR 	44H,0 			//01DB 	0844
		ORG		01DCH
		XORWI 	80H 			//01DC 	2680
		STR 	7FH 			//01DD 	01FF
		LDWI 	80H 			//01DE 	2A80
		SUBWR 	7FH,0 			//01DF 	0C7F
		BTSS 	STATUS,2 		//01E0 	1D03
		LJUMP 	1E4H 			//01E1 	39E4
		LDWI 	1FH 			//01E2 	2A1F
		SUBWR 	43H,0 			//01E3 	0C43
		ORG		01E4H
		BTSC 	STATUS,0 		//01E4 	1403
		LJUMP 	1E9H 			//01E5 	39E9

		//;smartkey.C: 386: beep(10,2);
		LDWI 	2H 			//01E6 	2A02
		BCR 	STATUS,5 		//01E7 	1283
		LJUMP 	203H 			//01E8 	3A03

		//;smartkey.C: 387: }else{
		//;smartkey.C: 388: beep(10,3);
		LDWI 	3H 			//01E9 	2A03
		BCR 	STATUS,5 		//01EA 	1283
		STR 	24H 			//01EB 	01A4
		ORG		01ECH
		LDWI 	AH 			//01EC 	2A0A
		LCALL 	6EDH 			//01ED 	36ED

		//;smartkey.C: 390: WRITE_EEPROM(0x10,(unsigned char)acXsum);
		LDR 	39H,0 			//01EE 	0839
		STR 	20H 			//01EF 	01A0
		LDWI 	10H 			//01F0 	2A10
		LCALL 	6BAH 			//01F1 	36BA

		//;smartkey.C: 391: WRITE_EEPROM(0x11,(unsigned char)acYsum);
		BCR 	STATUS,5 		//01F2 	1283
		LDR 	37H,0 			//01F3 	0837
		ORG		01F4H
		STR 	20H 			//01F4 	01A0
		LDWI 	11H 			//01F5 	2A11
		LCALL 	6BAH 			//01F6 	36BA

		//;smartkey.C: 392: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//01F7 	2A82
		BCR 	STATUS,5 		//01F8 	1283
		STR 	2DH 			//01F9 	01AD
		LDWI 	DDH 			//01FA 	2ADD
		STR 	2CH 			//01FB 	01AC
		ORG		01FCH
		DECRSZ 	2CH,1 		//01FC 	0EAC
		LJUMP 	1FCH 			//01FD 	39FC
		DECRSZ 	2DH,1 		//01FE 	0EAD
		LJUMP 	1FCH 			//01FF 	39FC
		LJUMP 	201H 			//0200 	3A01
		LJUMP 	206H 			//0201 	3A06

		//;smartkey.C: 395: beep(10,2);
		LDWI 	2H 			//0202 	2A02
		STR 	24H 			//0203 	01A4
		ORG		0204H
		LDWI 	AH 			//0204 	2A0A
		LCALL 	6EDH 			//0205 	36ED
		LDWI 	40H 			//0206 	2A40

		//;smartkey.C: 396: }
		//;smartkey.C: 397: }
		//;smartkey.C: 398: WRITE_EEPROM(0x40,0);
		BCR 	STATUS,5 		//0207 	1283
		CLRR 	20H 			//0208 	0120
		LCALL 	6BAH 			//0209 	36BA

		//;smartkey.C: 400: }
		//;smartkey.C: 403: acXsum = (signed char)READ_EEPROM(0x10);
		LDWI 	10H 			//020A 	2A10
		LCALL 	76BH 			//020B 	376B
		ORG		020CH
		STR 	39H 			//020C 	01B9
		CLRR 	3AH 			//020D 	013A
		BTSC 	39H,7 			//020E 	17B9
		DECR 	3AH,1 			//020F 	0DBA

		//;smartkey.C: 404: acYsum = (signed char)READ_EEPROM(0x11);
		LDWI 	11H 			//0210 	2A11
		LCALL 	76BH 			//0211 	376B
		STR 	37H 			//0212 	01B7
		CLRR 	38H 			//0213 	0138
		ORG		0214H
		BTSC 	37H,7 			//0214 	17B7
		DECR 	38H,1 			//0215 	0DB8

		//;smartkey.C: 406: timeTick = 0;
		CLRR 	70H 			//0216 	0170
		CLRR 	71H 			//0217 	0171

		//;smartkey.C: 412: if((mode_chek == 0) && (antenSkip ==0)){
		LDR 	73H,1 			//0218 	08F3
		BCR 	STATUS,5 		//0219 	1283
		BTSS 	STATUS,2 		//021A 	1D03
		LJUMP 	2F5H 			//021B 	3AF5
		ORG		021CH
		LDR 	33H,1 			//021C 	08B3
		BTSC 	STATUS,2 		//021D 	1503

		//;smartkey.C: 413: if(RegStatus & 0x80){
		BTSS 	4AH,7 			//021E 	1FCA
		LJUMP 	2F4H 			//021F 	3AF4

		//;smartkey.C: 415: PAIE = 0;
		BCR 	INTCON,3 		//0220 	118B

		//;smartkey.C: 417: RegStatus &= (~0x80);
		BCR 	4AH,7 			//0221 	13CA

		//;smartkey.C: 421: if ((RegStatus & 0x40) !=0){
		BTSC 	4AH,6 			//0222 	174A
		LJUMP 	29FH 			//0223 	3A9F
		ORG		0224H
		LJUMP 	2EBH 			//0224 	3AEB

		//;smartkey.C: 425: lostDetect =0;
		CLRR 	4CH 			//0225 	014C
		LDWI 	28H 			//0226 	2A28

		//;smartkey.C: 426: timeTick =0;
		CLRR 	70H 			//0227 	0170
		CLRR 	71H 			//0228 	0171

		//;smartkey.C: 427: tmp16 = 40;
		STR 	43H 			//0229 	01C3
		CLRR 	44H 			//022A 	0144

		//;smartkey.C: 428: break;
		LJUMP 	2F3H 			//022B 	3AF3
		ORG		022CH

		//;smartkey.C: 431: if(timeTick >30){
		LDWI 	0H 			//022C 	2A00
		SUBWR 	71H,0 			//022D 	0C71
		LDWI 	1FH 			//022E 	2A1F
		BTSC 	STATUS,2 		//022F 	1503
		SUBWR 	70H,0 			//0230 	0C70
		BTSS 	STATUS,0 		//0231 	1C03
		LJUMP 	2F3H 			//0232 	3AF3
		LDWI 	8H 			//0233 	2A08
		ORG		0234H

		//;smartkey.C: 432: timeTick =0;
		CLRR 	70H 			//0234 	0170
		CLRR 	71H 			//0235 	0171

		//;smartkey.C: 434: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LCALL 	76BH 			//0236 	376B
		XORWI 	CCH 			//0237 	26CC
		BTSS 	STATUS,2 		//0238 	1D03
		LJUMP 	23DH 			//0239 	3A3D
		LDWI 	8H 			//023A 	2A08
		CLRR 	20H 			//023B 	0120
		ORG		023CH
		LCALL 	6BAH 			//023C 	36BA

		//;smartkey.C: 436: if((mtOldState == 3)){
		BCR 	STATUS,5 		//023D 	1283
		LDR 	4DH,0 			//023E 	084D
		XORWI 	3H 			//023F 	2603
		BTSS 	STATUS,2 		//0240 	1D03
		LJUMP 	24EH 			//0241 	3A4E

		//;smartkey.C: 437: beepOn();TMR2ON = 0; beep(10,1);
		LCALL 	799H 			//0242 	3799
		LDWI 	AH 			//0243 	2A0A
		ORG		0244H
		BCR 	STATUS,5 		//0244 	1283
		BCR 	12H,2 			//0245 	1112
		CLRR 	24H 			//0246 	0124
		INCR	24H,1 			//0247 	09A4
		LCALL 	6EDH 			//0248 	36ED

		//;smartkey.C: 438: if(reAlertOn)reAlertOn =0;
		LDR 	41H,0 			//0249 	0841
		BTSC 	STATUS,2 		//024A 	1503
		LJUMP 	2F3H 			//024B 	3AF3
		ORG		024CH
		CLRR 	41H 			//024C 	0141
		LJUMP 	2F3H 			//024D 	3AF3

		//;smartkey.C: 440: else if((mtOldState == 0)||(mtOldState == 4)){
		LDR 	4DH,0 			//024E 	084D
		BTSC 	STATUS,2 		//024F 	1503
		LJUMP 	255H 			//0250 	3A55
		LDR 	4DH,0 			//0251 	084D
		XORWI 	4H 			//0252 	2604
		BTSS 	STATUS,2 		//0253 	1D03
		ORG		0254H
		LJUMP 	272H 			//0254 	3A72
		LDWI 	ACH 			//0255 	2AAC

		//;smartkey.C: 441: RegStatus |=(0x20);
		BSR 	4AH,5 			//0256 	1ACA

		//;smartkey.C: 442: setState(1,3500);
		STR 	20H 			//0257 	01A0
		LDWI 	DH 			//0258 	2A0D
		STR 	21H 			//0259 	01A1
		LDWI 	1H 			//025A 	2A01
		LCALL 	778H 			//025B 	3778
		ORG		025CH

		//;smartkey.C: 443: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
		LDWI 	40H 			//025C 	2A40
		LCALL 	76BH 			//025D 	376B
		XORWI 	0H 			//025E 	2600
		BTSC 	STATUS,2 		//025F 	1503
		LJUMP 	264H 			//0260 	3A64
		LDWI 	40H 			//0261 	2A40
		CLRR 	20H 			//0262 	0120
		LCALL 	6BAH 			//0263 	36BA
		ORG		0264H

		//;smartkey.C: 444: tmp16 = timeTick+40;
		LDR 	71H,0 			//0264 	0871
		BCR 	STATUS,5 		//0265 	1283
		STR 	44H 			//0266 	01C4
		LDR 	70H,0 			//0267 	0870
		STR 	43H 			//0268 	01C3
		LDWI 	28H 			//0269 	2A28
		ADDWR 	43H,1 			//026A 	0BC3
		BTSC 	STATUS,0 		//026B 	1403
		ORG		026CH
		INCR	44H,1 			//026C 	09C4
		LDWI 	AH 			//026D 	2A0A

		//;smartkey.C: 445: beep(10,1);
		CLRR 	24H 			//026E 	0124
		INCR	24H,1 			//026F 	09A4
		LCALL 	6EDH 			//0270 	36ED

		//;smartkey.C: 446: }
		LJUMP 	2F3H 			//0271 	3AF3

		//;smartkey.C: 447: else if((mtOldState == 1)){
		DECRSZ 	4DH,0 		//0272 	0E4D
		LJUMP 	2F3H 			//0273 	3AF3
		ORG		0274H
		LJUMP 	249H 			//0274 	3A49

		//;smartkey.C: 450: }
		//;smartkey.C: 451: }
		//;smartkey.C: 452: break;
		//;smartkey.C: 449: if(reAlertOn)reAlertOn =0;
		//;smartkey.C: 455: if(timeTick > 200){
		LDWI 	0H 			//0275 	2A00
		SUBWR 	71H,0 			//0276 	0C71
		LDWI 	C9H 			//0277 	2AC9
		BTSC 	STATUS,2 		//0278 	1503
		SUBWR 	70H,0 			//0279 	0C70
		BTSS 	STATUS,0 		//027A 	1C03
		LJUMP 	2F3H 			//027B 	3AF3
		ORG		027CH

		//;smartkey.C: 457: beepOff();
		LCALL 	79EH 			//027C 	379E

		//;smartkey.C: 458: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LDWI 	8H 			//027D 	2A08
		LCALL 	76BH 			//027E 	376B
		XORWI 	CCH 			//027F 	26CC
		BTSS 	STATUS,2 		//0280 	1D03
		LJUMP 	285H 			//0281 	3A85
		LDWI 	8H 			//0282 	2A08
		CLRR 	20H 			//0283 	0120
		ORG		0284H
		LCALL 	6BAH 			//0284 	36BA
		LDWI 	ACH 			//0285 	2AAC

		//;smartkey.C: 459: RegStatus |=(0x20);
		BCR 	STATUS,5 		//0286 	1283
		BSR 	4AH,5 			//0287 	1ACA

		//;smartkey.C: 460: setState(1,3500);
		STR 	20H 			//0288 	01A0
		LDWI 	DH 			//0289 	2A0D
		STR 	21H 			//028A 	01A1
		LDWI 	1H 			//028B 	2A01
		ORG		028CH
		LCALL 	778H 			//028C 	3778

		//;smartkey.C: 462: tmp16 = timeTick+40;
		LDR 	71H,0 			//028D 	0871
		STR 	44H 			//028E 	01C4
		LDR 	70H,0 			//028F 	0870
		STR 	43H 			//0290 	01C3
		LDWI 	28H 			//0291 	2A28
		ADDWR 	43H,1 			//0292 	0BC3
		BTSC 	STATUS,0 		//0293 	1403
		ORG		0294H
		INCR	44H,1 			//0294 	09C4
		LJUMP 	2F3H 			//0295 	3AF3

		//;smartkey.C: 468: beepOff();
		LCALL 	79EH 			//0296 	379E

		//;smartkey.C: 469: setState(2,300);
		LDWI 	2CH 			//0297 	2A2C
		BCR 	STATUS,5 		//0298 	1283
		STR 	20H 			//0299 	01A0
		LDWI 	1H 			//029A 	2A01
		STR 	21H 			//029B 	01A1
		ORG		029CH
		LDWI 	2H 			//029C 	2A02
		LCALL 	778H 			//029D 	3778

		//;smartkey.C: 470: break;
		LJUMP 	2F3H 			//029E 	3AF3
		LDR 	74H,0 			//029F 	0874
		STR 	FSR 			//02A0 	0184
		LDWI 	5H 			//02A1 	2A05
		SUBWR 	FSR,0 			//02A2 	0C04
		BTSC 	STATUS,0 		//02A3 	1403
		ORG		02A4H
		LJUMP 	2F3H 			//02A4 	3AF3
		LDWI 	7H 			//02A5 	2A07
		STR 	PCLATH 			//02A6 	018A
		LDWI 	94H 			//02A7 	2A94
		ADDWR 	FSR,0 			//02A8 	0B04
		STR 	PCL 			//02A9 	0182

		//;smartkey.C: 485: if((lostDetect==1) && (timeTick< 1500) &&(timeTick >700))
		DECRSZ 	4CH,0 		//02AA 	0E4C
		LJUMP 	2D8H 			//02AB 	3AD8
		ORG		02ACH
		LDWI 	5H 			//02AC 	2A05
		SUBWR 	71H,0 			//02AD 	0C71
		LDWI 	DCH 			//02AE 	2ADC
		BTSC 	STATUS,2 		//02AF 	1503
		SUBWR 	70H,0 			//02B0 	0C70
		BTSC 	STATUS,0 		//02B1 	1403
		LJUMP 	2D8H 			//02B2 	3AD8
		LDWI 	2H 			//02B3 	2A02
		ORG		02B4H
		SUBWR 	71H,0 			//02B4 	0C71
		LDWI 	BDH 			//02B5 	2ABD
		BTSC 	STATUS,2 		//02B6 	1503
		SUBWR 	70H,0 			//02B7 	0C70
		BTSS 	STATUS,0 		//02B8 	1C03
		LJUMP 	2D8H 			//02B9 	3AD8

		//;smartkey.C: 486: {
		//;smartkey.C: 487: if(READ_EEPROM(0x08)==0x00) WRITE_EEPROM(0x08,0xcc);
		LDWI 	8H 			//02BA 	2A08
		LCALL 	76BH 			//02BB 	376B
		ORG		02BCH
		IORWI 	0H 			//02BC 	2500
		BTSS 	STATUS,2 		//02BD 	1D03
		LJUMP 	2C3H 			//02BE 	3AC3
		LDWI 	CCH 			//02BF 	2ACC
		STR 	20H 			//02C0 	01A0
		LDWI 	8H 			//02C1 	2A08
		LCALL 	6BAH 			//02C2 	36BA

		//;smartkey.C: 489: setState(3,1800);
		LDWI 	8H 			//02C3 	2A08
		ORG		02C4H
		BCR 	STATUS,5 		//02C4 	1283
		STR 	20H 			//02C5 	01A0
		LDWI 	7H 			//02C6 	2A07
		STR 	21H 			//02C7 	01A1
		LDWI 	3H 			//02C8 	2A03
		LCALL 	778H 			//02C9 	3778

		//;smartkey.C: 490: cntTmp = timeTick+40;
		LDR 	71H,0 			//02CA 	0871
		STR 	47H 			//02CB 	01C7
		ORG		02CCH
		LDR 	70H,0 			//02CC 	0870
		STR 	46H 			//02CD 	01C6
		LDWI 	28H 			//02CE 	2A28
		ADDWR 	46H,1 			//02CF 	0BC6
		BTSC 	STATUS,0 		//02D0 	1403
		INCR	47H,1 			//02D1 	09C7

		//;smartkey.C: 491: PR2L =20;
		LDWI 	14H 			//02D2 	2A14
		BSR 	STATUS,5 		//02D3 	1A83
		ORG		02D4H
		STR 	11H 			//02D4 	0191

		//;smartkey.C: 492: beepOn();
		LCALL 	799H 			//02D5 	3799

		//;smartkey.C: 493: lostDetect =0;
		BCR 	STATUS,5 		//02D6 	1283
		LJUMP 	225H 			//02D7 	3A25

		//;smartkey.C: 494: }
		//;smartkey.C: 495: else {
		//;smartkey.C: 496: lostDetect =1;
		CLRR 	4CH 			//02D8 	014C
		INCR	4CH,1 			//02D9 	09CC
		LJUMP 	226H 			//02DA 	3A26

		//;smartkey.C: 499: }
		//;smartkey.C: 500: timeTick =0;
		//;smartkey.C: 505: timeTick =0;
		CLRR 	70H 			//02DB 	0170
		ORG		02DCH
		CLRR 	71H 			//02DC 	0171

		//;smartkey.C: 506: beepOn();TMR2ON = 0;
		LCALL 	799H 			//02DD 	3799
		LDWI 	2H 			//02DE 	2A02
		BCR 	STATUS,5 		//02DF 	1283
		BCR 	12H,2 			//02E0 	1112

		//;smartkey.C: 507: beep(10,2);
		STR 	24H 			//02E1 	01A4
		LDWI 	AH 			//02E2 	2A0A
		LCALL 	6EDH 			//02E3 	36ED
		ORG		02E4H

		//;smartkey.C: 508: if(mtOldState == 3){reAlertOn =1;}
		LDR 	4DH,0 			//02E4 	084D
		XORWI 	3H 			//02E5 	2603
		BTSS 	STATUS,2 		//02E6 	1D03
		LJUMP 	2F3H 			//02E7 	3AF3
		CLRR 	41H 			//02E8 	0141
		INCR	41H,1 			//02E9 	09C1
		LJUMP 	2F3H 			//02EA 	3AF3
		LDR 	74H,0 			//02EB 	0874
		ORG		02ECH
		XORWI 	1H 			//02EC 	2601
		BTSC 	STATUS,2 		//02ED 	1503
		LJUMP 	2AAH 			//02EE 	3AAA
		XORWI 	3H 			//02EF 	2603
		BTSC 	STATUS,2 		//02F0 	1503
		LJUMP 	2DBH 			//02F1 	3ADB
		LJUMP 	2F3H 			//02F2 	3AF3

		//;smartkey.C: 511: }
		//;smartkey.C: 512: PAIE = 1;
		BSR 	INTCON,3 		//02F3 	198B
		ORG		02F4H

		//;smartkey.C: 513: }
		//;smartkey.C: 515: }
		//;smartkey.C: 519: if((timeOut!=0)&&( timeTick >timeOut)){
		BCR 	STATUS,5 		//02F4 	1283
		LDR 	49H,0 			//02F5 	0849
		IORWR 	48H,0 			//02F6 	0348
		BTSC 	STATUS,2 		//02F7 	1503
		LJUMP 	37CH 			//02F8 	3B7C
		LDR 	71H,0 			//02F9 	0871
		SUBWR 	49H,0 			//02FA 	0C49
		BTSS 	STATUS,2 		//02FB 	1D03
		ORG		02FCH
		LJUMP 	2FFH 			//02FC 	3AFF
		LDR 	70H,0 			//02FD 	0870
		SUBWR 	48H,0 			//02FE 	0C48
		BTSS 	STATUS,0 		//02FF 	1C03
		LJUMP 	36EH 			//0300 	3B6E
		LJUMP 	37CH 			//0301 	3B7C

		//;smartkey.C: 530: beepOff();
		LCALL 	79EH 			//0302 	379E
		LDWI 	2CH 			//0303 	2A2C
		ORG		0304H

		//;smartkey.C: 531: RegStatus &=(~0x20);
		BCR 	STATUS,5 		//0304 	1283
		BCR 	4AH,5 			//0305 	12CA

		//;smartkey.C: 532: setState(2,300);
		STR 	20H 			//0306 	01A0
		LDWI 	1H 			//0307 	2A01
		STR 	21H 			//0308 	01A1
		LDWI 	2H 			//0309 	2A02
		LCALL 	778H 			//030A 	3778

		//;smartkey.C: 533: break;
		LJUMP 	37CH 			//030B 	3B7C
		ORG		030CH

		//;smartkey.C: 535: beepOff();
		LCALL 	79EH 			//030C 	379E

		//;smartkey.C: 536: delay_x10ms(20);
		LDWI 	14H 			//030D 	2A14
		BCR 	STATUS,5 		//030E 	1283
		STR 	20H 			//030F 	01A0
		CLRR 	21H 			//0310 	0121
		LCALL 	72CH 			//0311 	372C

		//;smartkey.C: 537: beepOn();TMR2ON = 0;reAlertOn =0;
		LCALL 	799H 			//0312 	3799
		LDWI 	1EH 			//0313 	2A1E
		ORG		0314H
		BCR 	STATUS,5 		//0314 	1283
		BCR 	12H,2 			//0315 	1112
		CLRR 	41H 			//0316 	0141
		CLRR 	24H 			//0317 	0124
		INCR	24H,1 			//0318 	09A4
		LCALL 	6EDH 			//0319 	36ED
		LDWI 	0H 			//031A 	2A00

		//;smartkey.C: 539: vibrateOn=1;
		CLRR 	32H 			//031B 	0132
		ORG		031CH
		INCR	32H,1 			//031C 	09B2
		CLRR 	20H 			//031D 	0120
		CLRR 	21H 			//031E 	0121
		LCALL 	778H 			//031F 	3778

		//;smartkey.C: 542: tmp16 = timeTick+40;
		LDR 	71H,0 			//0320 	0871
		STR 	44H 			//0321 	01C4
		LDR 	70H,0 			//0322 	0870
		STR 	43H 			//0323 	01C3
		ORG		0324H
		LDWI 	28H 			//0324 	2A28
		ADDWR 	43H,1 			//0325 	0BC3
		BTSC 	STATUS,0 		//0326 	1403
		INCR	44H,1 			//0327 	09C4

		//;smartkey.C: 543: break;
		LJUMP 	37CH 			//0328 	3B7C

		//;smartkey.C: 546: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LDWI 	8H 			//0329 	2A08
		LCALL 	76BH 			//032A 	376B
		XORWI 	CCH 			//032B 	26CC
		ORG		032CH
		BTSS 	STATUS,2 		//032C 	1D03
		LJUMP 	331H 			//032D 	3B31
		LDWI 	8H 			//032E 	2A08
		CLRR 	20H 			//032F 	0120
		LCALL 	6BAH 			//0330 	36BA

		//;smartkey.C: 548: if(reAlertOn){
		BCR 	STATUS,5 		//0331 	1283
		LDR 	41H,0 			//0332 	0841
		BTSC 	STATUS,2 		//0333 	1503
		ORG		0334H
		LJUMP 	348H 			//0334 	3B48

		//;smartkey.C: 549: setState(4,6000);
		LDWI 	70H 			//0335 	2A70
		STR 	20H 			//0336 	01A0
		LDWI 	17H 			//0337 	2A17
		STR 	21H 			//0338 	01A1
		LDWI 	4H 			//0339 	2A04
		LCALL 	778H 			//033A 	3778

		//;smartkey.C: 550: cntTmp = timeTick+40;
		LDR 	71H,0 			//033B 	0871
		ORG		033CH
		STR 	47H 			//033C 	01C7
		LDR 	70H,0 			//033D 	0870
		STR 	46H 			//033E 	01C6
		LDWI 	28H 			//033F 	2A28
		ADDWR 	46H,1 			//0340 	0BC6
		BTSC 	STATUS,0 		//0341 	1403
		INCR	47H,1 			//0342 	09C7

		//;smartkey.C: 551: PR2L =20;
		LDWI 	14H 			//0343 	2A14
		ORG		0344H
		BSR 	STATUS,5 		//0344 	1A83
		STR 	11H 			//0345 	0191

		//;smartkey.C: 552: beepOn();
		LCALL 	799H 			//0346 	3799

		//;smartkey.C: 554: }else if(mtOldState == 0){
		LJUMP 	37CH 			//0347 	3B7C
		LDR 	4DH,1 			//0348 	08CD
		BTSS 	STATUS,2 		//0349 	1D03
		LJUMP 	35FH 			//034A 	3B5F

		//;smartkey.C: 556: beep(10,5);
		LDWI 	5H 			//034B 	2A05
		ORG		034CH
		STR 	24H 			//034C 	01A4
		LDWI 	AH 			//034D 	2A0A
		LCALL 	6EDH 			//034E 	36ED
		LDWI 	40H 			//034F 	2A40

		//;smartkey.C: 557: RegStatus |=(0x20);
		BSR 	4AH,5 			//0350 	1ACA

		//;smartkey.C: 560: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
		LCALL 	76BH 			//0351 	376B
		XORWI 	0H 			//0352 	2600
		BTSC 	STATUS,2 		//0353 	1503
		ORG		0354H
		LJUMP 	358H 			//0354 	3B58
		LDWI 	40H 			//0355 	2A40
		CLRR 	20H 			//0356 	0120
		LCALL 	6BAH 			//0357 	36BA

		//;smartkey.C: 562: setState(1,3500);
		LDWI 	ACH 			//0358 	2AAC
		BCR 	STATUS,5 		//0359 	1283
		STR 	20H 			//035A 	01A0
		LDWI 	DH 			//035B 	2A0D
		ORG		035CH
		STR 	21H 			//035C 	01A1
		LDWI 	1H 			//035D 	2A01
		LJUMP 	31FH 			//035E 	3B1F

		//;smartkey.C: 566: beepOn();TMR2ON = 0;
		LCALL 	799H 			//035F 	3799
		LDWI 	1EH 			//0360 	2A1E
		BCR 	STATUS,5 		//0361 	1283
		BCR 	12H,2 			//0362 	1112

		//;smartkey.C: 567: reAlertOn =0;
		CLRR 	41H 			//0363 	0141
		ORG		0364H
		CLRR 	24H 			//0364 	0124
		INCR	24H,1 			//0365 	09A4
		LCALL 	6EDH 			//0366 	36ED
		LDWI 	0H 			//0367 	2A00

		//;smartkey.C: 569: setState(0,0);
		CLRR 	20H 			//0368 	0120
		CLRR 	21H 			//0369 	0121
		LCALL 	778H 			//036A 	3778

		//;smartkey.C: 571: vibrateOn=1;
		CLRR 	32H 			//036B 	0132
		ORG		036CH
		INCR	32H,1 			//036C 	09B2
		LJUMP 	320H 			//036D 	3B20
		LDR 	74H,0 			//036E 	0874
		XORWI 	1H 			//036F 	2601
		BTSC 	STATUS,2 		//0370 	1503
		LJUMP 	37CH 			//0371 	3B7C
		XORWI 	3H 			//0372 	2603
		BTSC 	STATUS,2 		//0373 	1503
		ORG		0374H
		LJUMP 	329H 			//0374 	3B29
		XORWI 	1H 			//0375 	2601
		BTSC 	STATUS,2 		//0376 	1503
		LJUMP 	302H 			//0377 	3B02
		XORWI 	7H 			//0378 	2607
		BTSC 	STATUS,2 		//0379 	1503
		LJUMP 	30CH 			//037A 	3B0C
		LJUMP 	37CH 			//037B 	3B7C
		ORG		037CH

		//;smartkey.C: 576: }
		//;smartkey.C: 579: if((timeTick>tmp16) && (mtState == 1) && (accEna ==1)){
		LDR 	71H,0 			//037C 	0871
		BCR 	STATUS,5 		//037D 	1283
		SUBWR 	44H,0 			//037E 	0C44
		BTSS 	STATUS,2 		//037F 	1D03
		LJUMP 	383H 			//0380 	3B83
		LDR 	70H,0 			//0381 	0870
		SUBWR 	43H,0 			//0382 	0C43
		BTSC 	STATUS,0 		//0383 	1403
		ORG		0384H
		LJUMP 	41FH 			//0384 	3C1F
		DECRSZ 	74H,0 		//0385 	0E74
		LJUMP 	41FH 			//0386 	3C1F
		DECRSZ 	36H,0 		//0387 	0E36
		LJUMP 	41FH 			//0388 	3C1F

		//;smartkey.C: 580: tmp16 = timeTick+40;
		LDR 	71H,0 			//0389 	0871
		STR 	44H 			//038A 	01C4
		LDR 	70H,0 			//038B 	0870
		ORG		038CH
		STR 	43H 			//038C 	01C3
		LDWI 	28H 			//038D 	2A28
		ADDWR 	43H,1 			//038E 	0BC3
		BTSC 	STATUS,0 		//038F 	1403
		INCR	44H,1 			//0390 	09C4

		//;smartkey.C: 581: if(AccRead(0x02,buf,6)==0){
		LDWI 	3BH 			//0391 	2A3B
		STR 	24H 			//0392 	01A4
		LDWI 	0H 			//0393 	2A00
		ORG		0394H
		STR 	25H 			//0394 	01A5
		LDWI 	6H 			//0395 	2A06
		STR 	26H 			//0396 	01A6
		LDWI 	2H 			//0397 	2A02
		LCALL 	61DH 			//0398 	361D
		IORWI 	0H 			//0399 	2500
		BTSS 	STATUS,2 		//039A 	1D03
		LJUMP 	41FH 			//039B 	3C1F
		ORG		039CH

		//;smartkey.C: 583: if(compe(buf[1], (signed char)acXsum,5) && compe(buf[3], (signed char)
		//+                          acYsum,5)){
		BCR 	STATUS,5 		//039C 	1283
		LDR 	39H,0 			//039D 	0839
		STR 	20H 			//039E 	01A0
		LDWI 	5H 			//039F 	2A05
		STR 	21H 			//03A0 	01A1
		LDR 	3CH,0 			//03A1 	083C
		LCALL 	55CH 			//03A2 	355C
		XORWI 	0H 			//03A3 	2600
		ORG		03A4H
		BCR 	STATUS,5 		//03A4 	1283
		BTSC 	STATUS,2 		//03A5 	1503
		LJUMP 	3CEH 			//03A6 	3BCE
		LDR 	37H,0 			//03A7 	0837
		STR 	20H 			//03A8 	01A0
		LDWI 	5H 			//03A9 	2A05
		STR 	21H 			//03AA 	01A1
		LDR 	3EH,0 			//03AB 	083E
		ORG		03ACH
		LCALL 	55CH 			//03AC 	355C
		XORWI 	0H 			//03AD 	2600

		//;smartkey.C: 585: isSw++;
		BCR 	STATUS,5 		//03AE 	1283
		BTSC 	STATUS,2 		//03AF 	1503
		LJUMP 	3CEH 			//03B0 	3BCE
		LDWI 	2DH 			//03B1 	2A2D
		INCR	42H,1 			//03B2 	09C2

		//;smartkey.C: 586: if(isSw >44){
		SUBWR 	42H,0 			//03B3 	0C42
		ORG		03B4H
		BTSS 	STATUS,0 		//03B4 	1C03
		LJUMP 	3C1H 			//03B5 	3BC1
		LDWI 	2CH 			//03B6 	2A2C

		//;smartkey.C: 587: isSw =0;
		CLRR 	42H 			//03B7 	0142

		//;smartkey.C: 588: vibrateOn=1;
		CLRR 	32H 			//03B8 	0132
		INCR	32H,1 			//03B9 	09B2

		//;smartkey.C: 591: RegStatus &=(~0x20);
		BCR 	4AH,5 			//03BA 	12CA

		//;smartkey.C: 592: setState(2,300);
		STR 	20H 			//03BB 	01A0
		ORG		03BCH
		LDWI 	1H 			//03BC 	2A01
		STR 	21H 			//03BD 	01A1
		LDWI 	2H 			//03BE 	2A02
		LCALL 	778H 			//03BF 	3778

		//;smartkey.C: 594: }
		LJUMP 	3FEH 			//03C0 	3BFE

		//;smartkey.C: 595: else if(isSw > 25){
		LDWI 	1AH 			//03C1 	2A1A
		SUBWR 	42H,0 			//03C2 	0C42
		BTSC 	STATUS,0 		//03C3 	1403
		ORG		03C4H

		//;smartkey.C: 596: if(isSw%2==0){
		BTSC 	42H,0 			//03C4 	1442
		LJUMP 	3FEH 			//03C5 	3BFE

		//;smartkey.C: 597: beepOn();TMR2ON = 0; beep(7,1);
		LCALL 	799H 			//03C6 	3799
		LDWI 	7H 			//03C7 	2A07
		BCR 	STATUS,5 		//03C8 	1283
		BCR 	12H,2 			//03C9 	1112
		CLRR 	24H 			//03CA 	0124
		INCR	24H,1 			//03CB 	09A4
		ORG		03CCH
		LCALL 	6EDH 			//03CC 	36ED
		LJUMP 	3FEH 			//03CD 	3BFE

		//;smartkey.C: 603: else{
		//;smartkey.C: 604: isSw =0;
		//;smartkey.C: 598: }
		//;smartkey.C: 599: }
		//;smartkey.C: 601: }
		CLRR 	42H 			//03CE 	0142

		//;smartkey.C: 607: if(compe(buf[1], acXOld,1) && compe(buf[3], acYOld,1)){
		LDR 	35H,0 			//03CF 	0835
		STR 	20H 			//03D0 	01A0
		CLRR 	21H 			//03D1 	0121
		INCR	21H,1 			//03D2 	09A1
		LDR 	3CH,0 			//03D3 	083C
		ORG		03D4H
		LCALL 	55CH 			//03D4 	355C
		XORWI 	0H 			//03D5 	2600
		BCR 	STATUS,5 		//03D6 	1283
		BTSC 	STATUS,2 		//03D7 	1503
		LJUMP 	3FCH 			//03D8 	3BFC
		LDR 	34H,0 			//03D9 	0834
		STR 	20H 			//03DA 	01A0
		CLRR 	21H 			//03DB 	0121
		ORG		03DCH
		INCR	21H,1 			//03DC 	09A1
		LDR 	3EH,0 			//03DD 	083E
		LCALL 	55CH 			//03DE 	355C
		XORWI 	0H 			//03DF 	2600

		//;smartkey.C: 608: isWait++;
		BCR 	STATUS,5 		//03E0 	1283
		BTSC 	STATUS,2 		//03E1 	1503
		LJUMP 	3FCH 			//03E2 	3BFC
		INCR	2FH,1 			//03E3 	09AF
		ORG		03E4H
		BTSC 	STATUS,2 		//03E4 	1503
		INCR	30H,1 			//03E5 	09B0

		//;smartkey.C: 609: if(isWait==450){
		DECR 	30H,0 			//03E6 	0D30
		LDWI 	C2H 			//03E7 	2AC2
		BTSC 	STATUS,2 		//03E8 	1503
		XORWR 	2FH,0 			//03E9 	042F
		BTSS 	STATUS,2 		//03EA 	1D03
		LJUMP 	3FEH 			//03EB 	3BFE
		ORG		03ECH
		LDWI 	2H 			//03EC 	2A02

		//;smartkey.C: 610: isWait = 0;
		CLRR 	2FH 			//03ED 	012F
		CLRR 	30H 			//03EE 	0130

		//;smartkey.C: 611: beep(7,2);
		STR 	24H 			//03EF 	01A4
		LDWI 	7H 			//03F0 	2A07
		LCALL 	6EDH 			//03F1 	36ED
		LDWI 	2CH 			//03F2 	2A2C

		//;smartkey.C: 612: vibrateOn=1;
		CLRR 	32H 			//03F3 	0132
		ORG		03F4H
		INCR	32H,1 			//03F4 	09B2

		//;smartkey.C: 613: RegStatus &=(~0x20);
		BCR 	4AH,5 			//03F5 	12CA

		//;smartkey.C: 614: setState(2,300);
		STR 	20H 			//03F6 	01A0
		LDWI 	1H 			//03F7 	2A01
		STR 	21H 			//03F8 	01A1
		LDWI 	2H 			//03F9 	2A02
		LCALL 	778H 			//03FA 	3778
		LJUMP 	3FEH 			//03FB 	3BFE
		ORG		03FCH

		//;smartkey.C: 617: else
		//;smartkey.C: 618: isWait=0;
		CLRR 	2FH 			//03FC 	012F
		CLRR 	30H 			//03FD 	0130

		//;smartkey.C: 619: }
		//;smartkey.C: 621: if( (buf[5] > -31) && (buf[5] < 31)) {
		LDR 	40H,0 			//03FE 	0840
		XORWI 	80H 			//03FF 	2680
		ADDWI 	9EH 			//0400 	279E
		BTSS 	STATUS,0 		//0401 	1C03
		LJUMP 	41AH 			//0402 	3C1A
		LDR 	40H,0 			//0403 	0840
		ORG		0404H
		XORWI 	80H 			//0404 	2680
		ADDWI 	61H 			//0405 	2761
		BTSC 	STATUS,0 		//0406 	1403
		LJUMP 	41AH 			//0407 	3C1A
		LDWI 	5H 			//0408 	2A05

		//;smartkey.C: 622: isFall++;
		INCR	31H,1 			//0409 	09B1

		//;smartkey.C: 623: if(isFall >4){
		SUBWR 	31H,0 			//040A 	0C31
		BTSS 	STATUS,0 		//040B 	1C03
		ORG		040CH
		LJUMP 	41BH 			//040C 	3C1B
		LDWI 	2H 			//040D 	2A02

		//;smartkey.C: 624: isFall =0;
		CLRR 	31H 			//040E 	0131

		//;smartkey.C: 625: beep(7,2);
		STR 	24H 			//040F 	01A4
		LDWI 	7H 			//0410 	2A07
		LCALL 	6EDH 			//0411 	36ED
		LDWI 	2CH 			//0412 	2A2C

		//;smartkey.C: 626: RegStatus &=(~0x20);
		BCR 	4AH,5 			//0413 	12CA
		ORG		0414H

		//;smartkey.C: 627: setState(2,300);
		STR 	20H 			//0414 	01A0
		LDWI 	1H 			//0415 	2A01
		STR 	21H 			//0416 	01A1
		LDWI 	2H 			//0417 	2A02
		LCALL 	778H 			//0418 	3778
		LJUMP 	41BH 			//0419 	3C1B

		//;smartkey.C: 630: else{
		//;smartkey.C: 631: isFall=0;
		CLRR 	31H 			//041A 	0131

		//;smartkey.C: 632: }
		//;smartkey.C: 634: acYOld = buf[3];acXOld = buf[1];
		LDR 	3EH,0 			//041B 	083E
		ORG		041CH
		STR 	34H 			//041C 	01B4
		LDR 	3CH,0 			//041D 	083C
		STR 	35H 			//041E 	01B5

		//;smartkey.C: 635: }
		//;smartkey.C: 636: }
		//;smartkey.C: 639: if((timeTick>tmp16) && (mtState == 0 ) && (accEna ==1)){
		LDR 	71H,0 			//041F 	0871
		BCR 	STATUS,5 		//0420 	1283
		SUBWR 	44H,0 			//0421 	0C44
		BTSS 	STATUS,2 		//0422 	1D03
		LJUMP 	426H 			//0423 	3C26
		ORG		0424H
		LDR 	70H,0 			//0424 	0870
		SUBWR 	43H,0 			//0425 	0C43
		BTSC 	STATUS,0 		//0426 	1403
		LJUMP 	46AH 			//0427 	3C6A
		LDR 	74H,1 			//0428 	08F4
		BTSS 	STATUS,2 		//0429 	1D03
		LJUMP 	46AH 			//042A 	3C6A
		DECRSZ 	36H,0 		//042B 	0E36
		ORG		042CH
		LJUMP 	46AH 			//042C 	3C6A

		//;smartkey.C: 641: if(timeTick >65000) timeTick =0;
		LDWI 	FDH 			//042D 	2AFD
		SUBWR 	71H,0 			//042E 	0C71
		LDWI 	E9H 			//042F 	2AE9
		BTSC 	STATUS,2 		//0430 	1503
		SUBWR 	70H,0 			//0431 	0C70
		BTSS 	STATUS,0 		//0432 	1C03
		LJUMP 	436H 			//0433 	3C36
		ORG		0434H
		CLRR 	70H 			//0434 	0170
		CLRR 	71H 			//0435 	0171

		//;smartkey.C: 642: tmp16 = timeTick+40;
		LDR 	71H,0 			//0436 	0871
		STR 	44H 			//0437 	01C4
		LDR 	70H,0 			//0438 	0870
		STR 	43H 			//0439 	01C3
		LDWI 	28H 			//043A 	2A28
		ADDWR 	43H,1 			//043B 	0BC3
		ORG		043CH
		BTSC 	STATUS,0 		//043C 	1403
		INCR	44H,1 			//043D 	09C4

		//;smartkey.C: 644: if(AccRead(0x02,buf,6)==0){
		LDWI 	3BH 			//043E 	2A3B
		STR 	24H 			//043F 	01A4
		LDWI 	0H 			//0440 	2A00
		STR 	25H 			//0441 	01A5
		LDWI 	6H 			//0442 	2A06
		STR 	26H 			//0443 	01A6
		ORG		0444H
		LDWI 	2H 			//0444 	2A02
		LCALL 	61DH 			//0445 	361D
		IORWI 	0H 			//0446 	2500

		//;smartkey.C: 646: if(vibrateOn==1){
		BCR 	STATUS,5 		//0447 	1283
		BTSS 	STATUS,2 		//0448 	1D03
		LJUMP 	46BH 			//0449 	3C6B
		DECRSZ 	32H,0 		//044A 	0E32
		LJUMP 	46AH 			//044B 	3C6A
		ORG		044CH

		//;smartkey.C: 647: if(compe(buf[1],acXOld ,3) && compe(buf[3],acYOld ,3)){
		LDR 	35H,0 			//044C 	0835
		STR 	20H 			//044D 	01A0
		LDWI 	3H 			//044E 	2A03
		STR 	21H 			//044F 	01A1
		LDR 	3CH,0 			//0450 	083C
		LCALL 	55CH 			//0451 	355C
		XORWI 	0H 			//0452 	2600
		BCR 	STATUS,5 		//0453 	1283
		ORG		0454H
		BTSC 	STATUS,2 		//0454 	1503
		LJUMP 	462H 			//0455 	3C62
		LDR 	34H,0 			//0456 	0834
		STR 	20H 			//0457 	01A0
		LDWI 	3H 			//0458 	2A03
		STR 	21H 			//0459 	01A1
		LDR 	3EH,0 			//045A 	083E
		LCALL 	55CH 			//045B 	355C
		ORG		045CH
		XORWI 	0H 			//045C 	2600

		//;smartkey.C: 649: isSw=0;
		BCR 	STATUS,5 		//045D 	1283
		BTSC 	STATUS,2 		//045E 	1503
		LJUMP 	462H 			//045F 	3C62
		CLRR 	42H 			//0460 	0142

		//;smartkey.C: 650: }
		LJUMP 	46AH 			//0461 	3C6A

		//;smartkey.C: 651: else{
		//;smartkey.C: 652: isSw++;
		INCR	42H,1 			//0462 	09C2

		//;smartkey.C: 654: {
		//;smartkey.C: 655: beepOn();TMR2ON = 0; beep(7,3);
		LCALL 	799H 			//0463 	3799
		ORG		0464H
		LDWI 	3H 			//0464 	2A03
		BCR 	STATUS,5 		//0465 	1283
		BCR 	12H,2 			//0466 	1112
		STR 	24H 			//0467 	01A4
		LDWI 	7H 			//0468 	2A07
		LCALL 	6EDH 			//0469 	36ED

		//;smartkey.C: 656: }
		//;smartkey.C: 657: }
		//;smartkey.C: 658: }
		//;smartkey.C: 659: }
		//;smartkey.C: 660: }
		//;smartkey.C: 662: if(RegStatus & 0x20) {RC0 =1;RC1 =1;}
		BCR 	STATUS,5 		//046A 	1283
		BTSS 	4AH,5 			//046B 	1ECA
		ORG		046CH
		LJUMP 	470H 			//046C 	3C70
		BSR 	7H,0 			//046D 	1807
		BSR 	7H,1 			//046E 	1887
		LJUMP 	472H 			//046F 	3C72

		//;smartkey.C: 663: else {RC0 =0;RC1 =0;}
		BCR 	7H,0 			//0470 	1007
		BCR 	7H,1 			//0471 	1087

		//;smartkey.C: 666: if((timeTick >500)&&(READ_EEPROM(0x3F))) WRITE_EEPROM(0x3F,0);
		LDWI 	1H 			//0472 	2A01
		SUBWR 	71H,0 			//0473 	0C71
		ORG		0474H
		LDWI 	F5H 			//0474 	2AF5
		BTSC 	STATUS,2 		//0475 	1503
		SUBWR 	70H,0 			//0476 	0C70
		BTSS 	STATUS,0 		//0477 	1C03
		LJUMP 	481H 			//0478 	3C81
		LDWI 	3FH 			//0479 	2A3F
		LCALL 	76BH 			//047A 	376B
		XORWI 	0H 			//047B 	2600
		ORG		047CH
		BTSC 	STATUS,2 		//047C 	1503
		LJUMP 	481H 			//047D 	3C81
		LDWI 	3FH 			//047E 	2A3F
		CLRR 	20H 			//047F 	0120
		LCALL 	6BAH 			//0480 	36BA

		//;smartkey.C: 667: if((timeTick >500)&&(READ_EEPROM(0x40))) WRITE_EEPROM(0x40,0);
		LDWI 	1H 			//0481 	2A01
		SUBWR 	71H,0 			//0482 	0C71
		LDWI 	F5H 			//0483 	2AF5
		ORG		0484H
		BTSC 	STATUS,2 		//0484 	1503
		SUBWR 	70H,0 			//0485 	0C70
		BTSS 	STATUS,0 		//0486 	1C03
		LJUMP 	218H 			//0487 	3A18
		LDWI 	40H 			//0488 	2A40
		LCALL 	76BH 			//0489 	376B
		XORWI 	0H 			//048A 	2600
		BTSC 	STATUS,2 		//048B 	1503
		ORG		048CH
		LJUMP 	218H 			//048C 	3A18
		LDWI 	40H 			//048D 	2A40
		CLRR 	20H 			//048E 	0120
		LCALL 	6BAH 			//048F 	36BA
		LJUMP 	218H 			//0490 	3A18

		//;smartkey.C: 41: if(PAIE&&PAIF){
		BTSC 	INTCON,3 		//0491 	158B
		BTSS 	INTCON,0 		//0492 	1C0B
		LJUMP 	4A2H 			//0493 	3CA2
		ORG		0494H

		//;smartkey.C: 42: tmp = PORTA;
		BCR 	STATUS,5 		//0494 	1283
		LDR 	5H,0 			//0495 	0805

		//;smartkey.C: 43: PAIF = 0;
		BCR 	INTCON,0 		//0496 	100B

		//;smartkey.C: 45: if(RA5){
		BTSS 	5H,5 			//0497 	1E85
		LJUMP 	4A1H 			//0498 	3CA1

		//;smartkey.C: 47: if(mode_chek == 0){
		LDR 	73H,1 			//0499 	08F3
		BTSS 	STATUS,2 		//049A 	1D03
		LJUMP 	4A2H 			//049B 	3CA2
		ORG		049CH

		//;smartkey.C: 48: cntCyc = 0;
		CLRR 	72H 			//049C 	0172

		//;smartkey.C: 49: cntOff = 0;
		CLRR 	4BH 			//049D 	014B

		//;smartkey.C: 51: mode_chek = 1;
		CLRR 	73H 			//049E 	0173
		INCR	73H,1 			//049F 	09F3
		LJUMP 	4A2H 			//04A0 	3CA2

		//;smartkey.C: 56: else{
		//;smartkey.C: 57: cntOff = 0;
		CLRR 	4BH 			//04A1 	014B

		//;smartkey.C: 59: }
		//;smartkey.C: 60: }
		//;smartkey.C: 62: if(INTE&&INTF){
		BTSC 	INTCON,4 		//04A2 	160B
		BTSS 	INTCON,1 		//04A3 	1C8B
		ORG		04A4H
		LJUMP 	4B8H 			//04A4 	3CB8

		//;smartkey.C: 63: unsigned char tmp;
		//;smartkey.C: 64: INTF = 0;
		BCR 	INTCON,1 		//04A5 	108B

		//;smartkey.C: 66: if( RA2==0){
		BCR 	STATUS,5 		//04A6 	1283
		BTSC 	5H,2 			//04A7 	1505
		LJUMP 	4B8H 			//04A8 	3CB8

		//;smartkey.C: 68: if(timeTick <0x20){
		LDWI 	0H 			//04A9 	2A00
		SUBWR 	71H,0 			//04AA 	0C71
		LDWI 	20H 			//04AB 	2A20
		ORG		04ACH
		BTSC 	STATUS,2 		//04AC 	1503
		SUBWR 	70H,0 			//04AD 	0C70
		BTSC 	STATUS,0 		//04AE 	1403
		LJUMP 	4B7H 			//04AF 	3CB7

		//;smartkey.C: 69: tmp = READ_EEPROM(0x3F);
		LDWI 	3FH 			//04B0 	2A3F
		LCALL 	78CH 			//04B1 	378C
		STR 	79H 			//04B2 	01F9

		//;smartkey.C: 70: WRITE_EEPROM(0x3F,tmp+1);
		INCR	79H,0 			//04B3 	0979
		ORG		04B4H
		STR 	75H 			//04B4 	01F5
		LDWI 	3FH 			//04B5 	2A3F
		LCALL 	6D5H 			//04B6 	36D5
		LJUMP 	4B7H 			//04B7 	3CB7

		//;smartkey.C: 79: }
		//;smartkey.C: 81: }
		//;smartkey.C: 84: if (T0IE && T0IF) {
		BTSC 	INTCON,5 		//04B8 	168B
		BTSS 	INTCON,2 		//04B9 	1D0B
		LJUMP 	507H 			//04BA 	3D07
		LDWI 	B3H 			//04BB 	2AB3
		ORG		04BCH

		//;smartkey.C: 85: T0IF = 0;
		BCR 	INTCON,2 		//04BC 	110B

		//;smartkey.C: 86: TMR0 = 179;
		BCR 	STATUS,5 		//04BD 	1283
		STR 	1H 			//04BE 	0181

		//;smartkey.C: 92: if( mode_chek == 1){
		DECRSZ 	73H,0 		//04BF 	0E73
		LJUMP 	4D9H 			//04C0 	3CD9

		//;smartkey.C: 94: cntCyc++;
		INCR	72H,1 			//04C1 	09F2

		//;smartkey.C: 96: if(RA5==0){
		BTSC 	5H,5 			//04C2 	1685
		LJUMP 	4D9H 			//04C3 	3CD9
		ORG		04C4H
		LDWI 	10H 			//04C4 	2A10

		//;smartkey.C: 98: cntOff++;
		INCR	4BH,1 			//04C5 	09CB

		//;smartkey.C: 100: if(cntOff > 15){
		SUBWR 	4BH,0 			//04C6 	0C4B
		BTSS 	STATUS,0 		//04C7 	1C03
		LJUMP 	4D9H 			//04C8 	3CD9
		LDWI 	10H 			//04C9 	2A10

		//;smartkey.C: 102: mode_chek = 0;
		CLRR 	73H 			//04CA 	0173

		//;smartkey.C: 104: if((cntCyc>15) &&(cntCyc<50)) {
		SUBWR 	72H,0 			//04CB 	0C72
		ORG		04CCH
		LDWI 	32H 			//04CC 	2A32
		BTSS 	STATUS,0 		//04CD 	1C03
		LJUMP 	4D5H 			//04CE 	3CD5
		SUBWR 	72H,0 			//04CF 	0C72
		BTSC 	STATUS,0 		//04D0 	1403
		LJUMP 	4D4H 			//04D1 	3CD4

		//;smartkey.C: 105: RegStatus |= (0x40);
		BSR 	4AH,6 			//04D2 	1B4A

		//;smartkey.C: 106: } else if (cntCyc>=50){
		LJUMP 	4D8H 			//04D3 	3CD8
		ORG		04D4H
		LDWI 	32H 			//04D4 	2A32
		SUBWR 	72H,0 			//04D5 	0C72
		BTSC 	STATUS,0 		//04D6 	1403

		//;smartkey.C: 107: RegStatus &= ~(0x40);
		BCR 	4AH,6 			//04D7 	134A

		//;smartkey.C: 108: }
		//;smartkey.C: 110: RegStatus |= 0x80;
		BSR 	4AH,7 			//04D8 	1BCA

		//;smartkey.C: 111: }
		//;smartkey.C: 112: }
		//;smartkey.C: 121: }
		//;smartkey.C: 123: timeTick++;
		INCR	70H,1 			//04D9 	09F0
		BTSC 	STATUS,2 		//04DA 	1503
		INCR	71H,1 			//04DB 	09F1
		ORG		04DCH

		//;smartkey.C: 125: if((mtState == 4)||(mtState == 3)){
		LDR 	74H,0 			//04DC 	0874
		XORWI 	4H 			//04DD 	2604
		BTSC 	STATUS,2 		//04DE 	1503
		LJUMP 	4E4H 			//04DF 	3CE4
		LDR 	74H,0 			//04E0 	0874
		XORWI 	3H 			//04E1 	2603
		BTSS 	STATUS,2 		//04E2 	1D03
		LJUMP 	507H 			//04E3 	3D07
		ORG		04E4H

		//;smartkey.C: 126: if(timeTick > cntTmp){
		LDR 	71H,0 			//04E4 	0871
		SUBWR 	47H,0 			//04E5 	0C47
		BTSS 	STATUS,2 		//04E6 	1D03
		LJUMP 	4EAH 			//04E7 	3CEA
		LDR 	70H,0 			//04E8 	0870
		SUBWR 	46H,0 			//04E9 	0C46
		BTSC 	STATUS,0 		//04EA 	1403
		LJUMP 	507H 			//04EB 	3D07
		ORG		04ECH

		//;smartkey.C: 127: cntTmp = timeTick+38;
		LDR 	71H,0 			//04EC 	0871
		STR 	47H 			//04ED 	01C7
		LDR 	70H,0 			//04EE 	0870
		STR 	46H 			//04EF 	01C6
		LDWI 	26H 			//04F0 	2A26
		ADDWR 	46H,1 			//04F1 	0BC6
		BTSC 	STATUS,0 		//04F2 	1403
		INCR	47H,1 			//04F3 	09C7
		ORG		04F4H

		//;smartkey.C: 128: if(cntTmp<=timeOut)
		LDR 	47H,0 			//04F4 	0847
		SUBWR 	49H,0 			//04F5 	0C49
		BTSS 	STATUS,2 		//04F6 	1D03
		LJUMP 	4FAH 			//04F7 	3CFA
		LDR 	46H,0 			//04F8 	0846
		SUBWR 	48H,0 			//04F9 	0C48

		//;smartkey.C: 129: {
		//;smartkey.C: 130: TMR2IE = 0;
		BSR 	STATUS,5 		//04FA 	1A83
		BTSS 	STATUS,0 		//04FB 	1C03
		ORG		04FCH
		LJUMP 	508H 			//04FC 	3D08
		BCR 	CH,1 			//04FD 	108C

		//;smartkey.C: 132: if (PR2L == 20)
		LDR 	11H,0 			//04FE 	0811
		XORWI 	14H 			//04FF 	2614
		BTSS 	STATUS,2 		//0500 	1D03
		LJUMP 	504H 			//0501 	3D04

		//;smartkey.C: 133: PR2L = 25;
		LDWI 	19H 			//0502 	2A19
		LJUMP 	505H 			//0503 	3D05
		ORG		0504H

		//;smartkey.C: 134: else
		//;smartkey.C: 135: PR2L = 20;
		LDWI 	14H 			//0504 	2A14
		STR 	11H 			//0505 	0191

		//;smartkey.C: 136: TMR2IE = 1;
		BSR 	CH,1 			//0506 	188C

		//;smartkey.C: 137: }
		//;smartkey.C: 138: }
		//;smartkey.C: 139: }
		//;smartkey.C: 140: }
		//;smartkey.C: 143: if(TMR2IE&&TMR2IF)
		BSR 	STATUS,5 		//0507 	1A83
		BTSS 	CH,1 			//0508 	1C8C
		LJUMP 	510H 			//0509 	3D10
		BCR 	STATUS,5 		//050A 	1283
		BTSS 	CH,1 			//050B 	1C8C
		ORG		050CH
		LJUMP 	510H 			//050C 	3D10
		LDWI 	8H 			//050D 	2A08

		//;smartkey.C: 144: {
		//;smartkey.C: 145: TMR2IF = 0;
		BCR 	CH,1 			//050E 	108C

		//;smartkey.C: 146: RA3 =~ RA3;
		XORWR 	5H,1 			//050F 	0485
		LDR 	78H,0 			//0510 	0878
		STR 	PCLATH 			//0511 	018A
		SWAPR 	77H,0 			//0512 	0777
		STR 	STATUS 			//0513 	0183
		ORG		0514H
		SWAPR 	7EH,1 			//0514 	07FE
		SWAPR 	7EH,0 			//0515 	077E
		RETI		 			//0516 	0009
		CLRR 	25H 			//0517 	0125
		BTSS 	21H,7 			//0518 	1FA1
		LJUMP 	521H 			//0519 	3D21
		COMR 	20H,1 			//051A 	0FA0
		COMR 	21H,1 			//051B 	0FA1
		ORG		051CH
		INCR	20H,1 			//051C 	09A0
		BTSC 	STATUS,2 		//051D 	1503
		INCR	21H,1 			//051E 	09A1
		CLRR 	25H 			//051F 	0125
		INCR	25H,1 			//0520 	09A5
		BTSS 	23H,7 			//0521 	1FA3
		LJUMP 	52AH 			//0522 	3D2A
		COMR 	22H,1 			//0523 	0FA2
		ORG		0524H
		COMR 	23H,1 			//0524 	0FA3
		INCR	22H,1 			//0525 	09A2
		BTSC 	STATUS,2 		//0526 	1503
		INCR	23H,1 			//0527 	09A3
		LDWI 	1H 			//0528 	2A01
		XORWR 	25H,1 			//0529 	04A5
		CLRR 	26H 			//052A 	0126
		CLRR 	27H 			//052B 	0127
		ORG		052CH
		LDR 	21H,0 			//052C 	0821
		IORWR 	20H,0 			//052D 	0320
		BTSC 	STATUS,2 		//052E 	1503
		LJUMP 	54FH 			//052F 	3D4F
		CLRR 	24H 			//0530 	0124
		INCR	24H,1 			//0531 	09A4
		BTSC 	21H,7 			//0532 	17A1
		LJUMP 	538H 			//0533 	3D38
		ORG		0534H
		BCR 	STATUS,0 		//0534 	1003
		RLR 	20H,1 			//0535 	05A0
		RLR 	21H,1 			//0536 	05A1
		LJUMP 	531H 			//0537 	3D31
		BCR 	STATUS,0 		//0538 	1003
		RLR 	26H,1 			//0539 	05A6
		RLR 	27H,1 			//053A 	05A7
		LDR 	21H,0 			//053B 	0821
		ORG		053CH
		SUBWR 	23H,0 			//053C 	0C23
		BTSS 	STATUS,2 		//053D 	1D03
		LJUMP 	541H 			//053E 	3D41
		LDR 	20H,0 			//053F 	0820
		SUBWR 	22H,0 			//0540 	0C22
		BTSS 	STATUS,0 		//0541 	1C03
		LJUMP 	54BH 			//0542 	3D4B
		LDR 	20H,0 			//0543 	0820
		ORG		0544H
		SUBWR 	22H,1 			//0544 	0CA2
		LDR 	21H,0 			//0545 	0821
		BTSS 	STATUS,0 		//0546 	1C03
		DECR 	23H,1 			//0547 	0DA3
		SUBWR 	23H,1 			//0548 	0CA3
		BSR 	26H,0 			//0549 	1826
		BCR 	STATUS,0 		//054A 	1003
		RRR	21H,1 			//054B 	06A1
		ORG		054CH
		RRR	20H,1 			//054C 	06A0
		DECRSZ 	24H,1 		//054D 	0EA4
		LJUMP 	538H 			//054E 	3D38
		LDR 	25H,0 			//054F 	0825
		BTSC 	STATUS,2 		//0550 	1503
		LJUMP 	557H 			//0551 	3D57
		COMR 	26H,1 			//0552 	0FA6
		COMR 	27H,1 			//0553 	0FA7
		ORG		0554H
		INCR	26H,1 			//0554 	09A6
		BTSC 	STATUS,2 		//0555 	1503
		INCR	27H,1 			//0556 	09A7
		LDR 	27H,0 			//0557 	0827
		STR 	21H 			//0558 	01A1
		LDR 	26H,0 			//0559 	0826
		STR 	20H 			//055A 	01A0
		RET		 					//055B 	0004
		ORG		055CH
		STR 	27H 			//055C 	01A7

		//;smartkey.C: 210: if(a>b){
		LDR 	20H,0 			//055D 	0820
		XORWI 	80H 			//055E 	2680
		STR 	22H 			//055F 	01A2
		LDR 	27H,0 			//0560 	0827
		XORWI 	80H 			//0561 	2680
		SUBWR 	22H,1 			//0562 	0CA2
		BTSC 	STATUS,0 		//0563 	1403
		ORG		0564H
		LJUMP 	588H 			//0564 	3D88

		//;smartkey.C: 211: if((a-b)<=dt) return 1;
		LDR 	20H,0 			//0565 	0820
		SUBWR 	27H,0 			//0566 	0C27
		STR 	22H 			//0567 	01A2
		CLRR 	23H 			//0568 	0123
		BTSS 	STATUS,0 		//0569 	1C03
		DECR 	23H,1 			//056A 	0DA3
		BTSC 	27H,7 			//056B 	17A7
		ORG		056CH
		DECR 	23H,1 			//056C 	0DA3
		BTSC 	20H,7 			//056D 	17A0
		INCR	23H,1 			//056E 	09A3
		BCR 	STATUS,5 		//056F 	1283
		LCALL 	595H 			//0570 	3595
		BTSS 	STATUS,2 		//0571 	1D03
		LJUMP 	575H 			//0572 	3D75
		LDR 	22H,0 			//0573 	0822
		ORG		0574H
		SUBWR 	24H,0 			//0574 	0C24
		BTSS 	STATUS,0 		//0575 	1C03
		RETW 	0H 			//0576 	2100
		RETW 	1H 			//0577 	2101

		//;smartkey.C: 215: if((b-a)<=dt) return 1;
		SUBWR 	20H,0 			//0578 	0C20
		STR 	22H 			//0579 	01A2
		CLRR 	23H 			//057A 	0123
		BTSS 	STATUS,0 		//057B 	1C03
		ORG		057CH
		DECR 	23H,1 			//057C 	0DA3
		BTSC 	20H,7 			//057D 	17A0
		DECR 	23H,1 			//057E 	0DA3
		BTSC 	27H,7 			//057F 	17A7
		INCR	23H,1 			//0580 	09A3
		BCR 	STATUS,5 		//0581 	1283
		LCALL 	595H 			//0582 	3595
		BTSS 	STATUS,2 		//0583 	1D03
		ORG		0584H
		LJUMP 	575H 			//0584 	3D75
		LDR 	22H,0 			//0585 	0822
		SUBWR 	24H,0 			//0586 	0C24
		LJUMP 	575H 			//0587 	3D75

		//;smartkey.C: 212: else return 0;
		//;smartkey.C: 214: else if(a<b){
		LDR 	27H,0 			//0588 	0827
		XORWI 	80H 			//0589 	2680
		STR 	22H 			//058A 	01A2
		LDR 	20H,0 			//058B 	0820
		ORG		058CH
		XORWI 	80H 			//058C 	2680
		SUBWR 	22H,1 			//058D 	0CA2

		//;smartkey.C: 218: else if(a==b){
		LDR 	27H,0 			//058E 	0827
		BTSS 	STATUS,0 		//058F 	1C03
		LJUMP 	578H 			//0590 	3D78
		XORWR 	20H,0 			//0591 	0420
		BTSC 	STATUS,2 		//0592 	1503
		RETW 	1H 			//0593 	2101
		ORG		0594H
		RETW 	0H 			//0594 	2100
		LDR 	21H,0 			//0595 	0821
		STR 	24H 			//0596 	01A4
		CLRR 	25H 			//0597 	0125
		BTSC 	24H,7 			//0598 	17A4
		DECR 	25H,1 			//0599 	0DA5
		LDR 	25H,0 			//059A 	0825
		XORWI 	80H 			//059B 	2680
		ORG		059CH
		STR 	26H 			//059C 	01A6
		LDR 	23H,0 			//059D 	0823
		XORWI 	80H 			//059E 	2680
		SUBWR 	26H,0 			//059F 	0C26
		RET		 					//05A0 	0004

		//;mpu6x.c: 24: else
		//;mpu6x.c: 25: return 1;
		//;mpu6x.c: 21: else
		//;mpu6x.c: 22: return 2;
		BCR 	STATUS,5 		//05A1 	1283
		STR 	21H 			//05A2 	01A1
		CLRR 	22H 			//05A3 	0122
		ORG		05A4H

		//;SWI2C.C: 115: RA7 = 0;
		BCR 	5H,7 			//05A4 	1385

		//;SWI2C.C: 116: TRISA |=0x40;;
		BSR 	STATUS,5 		//05A5 	1A83
		BSR 	5H,6 			//05A6 	1B05

		//;SWI2C.C: 117: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05A7 	2A05
		BCR 	STATUS,5 		//05A8 	1283
		STR 	20H 			//05A9 	01A0
		DECRSZ 	20H,1 		//05AA 	0EA0
		LJUMP 	5AAH 			//05AB 	3DAA
		ORG		05ACH

		//;SWI2C.C: 118: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//05AC 	1283
		CLRR 	23H 			//05AD 	0123
		LDWI 	5H 			//05AE 	2A05

		//;SWI2C.C: 119: {
		//;SWI2C.C: 120: RA7 = 1;
		BSR 	5H,7 			//05AF 	1B85

		//;SWI2C.C: 121: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05B0 	01A0
		DECRSZ 	20H,1 		//05B1 	0EA0
		LJUMP 	5B1H 			//05B2 	3DB1

		//;SWI2C.C: 122: dat = dat<<1 |(RA6 & 1 );
		LDWI 	0H 			//05B3 	2A00
		ORG		05B4H
		BCR 	STATUS,5 		//05B4 	1283
		BTSC 	5H,6 			//05B5 	1705
		LDWI 	1H 			//05B6 	2A01
		ANDWI 	1H 			//05B7 	2401
		STR 	20H 			//05B8 	01A0
		BCR 	STATUS,0 		//05B9 	1003
		RLR 	22H,0 			//05BA 	0522
		IORWR 	20H,0 			//05BB 	0320
		ORG		05BCH
		STR 	22H 			//05BC 	01A2
		LDWI 	5H 			//05BD 	2A05

		//;SWI2C.C: 125: RA7 = 0;
		BCR 	5H,7 			//05BE 	1385

		//;SWI2C.C: 126: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05BF 	01A0
		DECRSZ 	20H,1 		//05C0 	0EA0
		LJUMP 	5C0H 			//05C1 	3DC0
		LDWI 	8H 			//05C2 	2A08
		BCR 	STATUS,5 		//05C3 	1283
		ORG		05C4H
		INCR	23H,1 			//05C4 	09A3
		SUBWR 	23H,0 			//05C5 	0C23
		BTSS 	STATUS,0 		//05C6 	1C03
		LJUMP 	5AEH 			//05C7 	3DAE

		//;SWI2C.C: 127: }
		//;SWI2C.C: 129: TRISA &=0xbf;;
		BSR 	STATUS,5 		//05C8 	1A83
		BCR 	5H,6 			//05C9 	1305

		//;SWI2C.C: 131: RA6 = (Ack) ? 0 : 1;
		BCR 	STATUS,5 		//05CA 	1283
		LDR 	21H,1 			//05CB 	08A1
		ORG		05CCH
		BCR 	STATUS,5 		//05CC 	1283
		BTSS 	STATUS,2 		//05CD 	1D03
		LJUMP 	5D1H 			//05CE 	3DD1
		BSR 	5H,6 			//05CF 	1B05
		LJUMP 	5D2H 			//05D0 	3DD2
		BCR 	5H,6 			//05D1 	1305
		LDWI 	5H 			//05D2 	2A05

		//;SWI2C.C: 132: RA7 = 1;
		BSR 	5H,7 			//05D3 	1B85
		ORG		05D4H

		//;SWI2C.C: 133: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05D4 	01A0
		DECRSZ 	20H,1 		//05D5 	0EA0
		LJUMP 	5D5H 			//05D6 	3DD5
		LDWI 	5H 			//05D7 	2A05

		//;SWI2C.C: 134: RA7 = 0;
		BCR 	STATUS,5 		//05D8 	1283
		BCR 	5H,7 			//05D9 	1385

		//;SWI2C.C: 135: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05DA 	01A0
		DECRSZ 	20H,1 		//05DB 	0EA0
		ORG		05DCH
		LJUMP 	5DBH 			//05DC 	3DDB

		//;SWI2C.C: 136: return dat;
		BCR 	STATUS,5 		//05DD 	1283
		LDR 	22H,0 			//05DE 	0822
		RET		 					//05DF 	0004
		BCR 	STATUS,5 		//05E0 	1283
		STR 	21H 			//05E1 	01A1

		//;SWI2C.C: 89: TRISA &=0xbf;;
		BSR 	STATUS,5 		//05E2 	1A83
		BCR 	5H,6 			//05E3 	1305
		ORG		05E4H

		//;SWI2C.C: 90: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05E4 	2A05
		BCR 	STATUS,5 		//05E5 	1283
		STR 	20H 			//05E6 	01A0
		DECRSZ 	20H,1 		//05E7 	0EA0
		LJUMP 	5E7H 			//05E8 	3DE7

		//;SWI2C.C: 91: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//05E9 	1283
		CLRR 	22H 			//05EA 	0122

		//;SWI2C.C: 92: {
		//;SWI2C.C: 93: RA6 = (dat&0x80) ? 1:0;
		BTSS 	21H,7 			//05EB 	1FA1
		ORG		05ECH
		LJUMP 	5F0H 			//05EC 	3DF0
		BCR 	STATUS,5 		//05ED 	1283
		BSR 	5H,6 			//05EE 	1B05
		LJUMP 	5F2H 			//05EF 	3DF2
		BCR 	STATUS,5 		//05F0 	1283
		BCR 	5H,6 			//05F1 	1305
		LDWI 	5H 			//05F2 	2A05

		//;SWI2C.C: 94: dat<<=1;
		BCR 	STATUS,0 		//05F3 	1003
		ORG		05F4H
		RLR 	21H,1 			//05F4 	05A1

		//;SWI2C.C: 95: RA7 = 1;
		BSR 	5H,7 			//05F5 	1B85

		//;SWI2C.C: 96: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05F6 	01A0
		DECRSZ 	20H,1 		//05F7 	0EA0
		LJUMP 	5F7H 			//05F8 	3DF7
		LDWI 	5H 			//05F9 	2A05

		//;SWI2C.C: 97: RA7 = 0;
		BCR 	STATUS,5 		//05FA 	1283
		BCR 	5H,7 			//05FB 	1385
		ORG		05FCH

		//;SWI2C.C: 98: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05FC 	01A0
		DECRSZ 	20H,1 		//05FD 	0EA0
		LJUMP 	5FDH 			//05FE 	3DFD
		LDWI 	8H 			//05FF 	2A08
		BCR 	STATUS,5 		//0600 	1283
		INCR	22H,1 			//0601 	09A2
		SUBWR 	22H,0 			//0602 	0C22
		BTSS 	STATUS,0 		//0603 	1C03
		ORG		0604H
		LJUMP 	5EBH 			//0604 	3DEB

		//;SWI2C.C: 99: }
		//;SWI2C.C: 101: TRISA |=0x40;;
		BSR 	STATUS,5 		//0605 	1A83
		BSR 	5H,6 			//0606 	1B05

		//;SWI2C.C: 102: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0607 	2A05
		BCR 	STATUS,5 		//0608 	1283
		STR 	20H 			//0609 	01A0
		DECRSZ 	20H,1 		//060A 	0EA0
		LJUMP 	60AH 			//060B 	3E0A
		ORG		060CH
		LDWI 	5H 			//060C 	2A05

		//;SWI2C.C: 103: RA7 = 1;
		BCR 	STATUS,5 		//060D 	1283
		BSR 	5H,7 			//060E 	1B85

		//;SWI2C.C: 104: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//060F 	01A0
		DECRSZ 	20H,1 		//0610 	0EA0
		LJUMP 	610H 			//0611 	3E10

		//;SWI2C.C: 105: i= RA6;
		LDWI 	0H 			//0612 	2A00
		BCR 	STATUS,5 		//0613 	1283
		ORG		0614H
		BTSC 	5H,6 			//0614 	1705
		LDWI 	1H 			//0615 	2A01
		STR 	22H 			//0616 	01A2

		//;SWI2C.C: 106: RA7 = 0;
		BCR 	5H,7 			//0617 	1385

		//;SWI2C.C: 107: TRISA &=0xbf;;
		BSR 	STATUS,5 		//0618 	1A83
		BCR 	5H,6 			//0619 	1305

		//;SWI2C.C: 108: return i;
		BCR 	STATUS,5 		//061A 	1283
		LDR 	22H,0 			//061B 	0822
		ORG		061CH
		RET		 					//061C 	0004
		STR 	2AH 			//061D 	01AA

		//;mpu6x.c: 32: unsigned char i;
		//;mpu6x.c: 34: swI2C_Start();
		LCALL 	719H 			//061E 	3719

		//;mpu6x.c: 36: if(swI2C_WriteByte(0x18<<1)== 0 )
		LDWI 	30H 			//061F 	2A30
		LCALL 	5E0H 			//0620 	35E0
		IORWI 	0H 			//0621 	2500
		BTSS 	STATUS,2 		//0622 	1D03
		RETW 	1H 			//0623 	2101
		ORG		0624H

		//;mpu6x.c: 37: {
		//;mpu6x.c: 38: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	2AH,0 			//0624 	082A
		LCALL 	5E0H 			//0625 	35E0
		IORWI 	0H 			//0626 	2500
		BTSS 	STATUS,2 		//0627 	1D03
		RETW 	2H 			//0628 	2102

		//;mpu6x.c: 39: {
		//;mpu6x.c: 40: swI2C_Start();
		LCALL 	719H 			//0629 	3719

		//;mpu6x.c: 41: if(swI2C_WriteByte((0x18<<1)|1)== 0 ){
		LDWI 	31H 			//062A 	2A31
		LCALL 	5E0H 			//062B 	35E0
		ORG		062CH
		IORWI 	0H 			//062C 	2500
		BTSS 	STATUS,2 		//062D 	1D03
		RETW 	1H 			//062E 	2101

		//;mpu6x.c: 43: for(i=0; i<(len-1);i++){
		CLRR 	2BH 			//062F 	012B
		LDR 	26H,0 			//0630 	0826
		ADDWI 	FFH 			//0631 	27FF
		STR 	27H 			//0632 	01A7
		LDWI 	FFH 			//0633 	2AFF
		ORG		0634H
		BTSC 	STATUS,0 		//0634 	1403
		LDWI 	0H 			//0635 	2A00
		STR 	28H 			//0636 	01A8
		XORWI 	80H 			//0637 	2680
		SUBWI 	80H 			//0638 	2880
		BTSS 	STATUS,2 		//0639 	1D03
		LJUMP 	63DH 			//063A 	3E3D
		LDR 	27H,0 			//063B 	0827
		ORG		063CH
		SUBWR 	2BH,0 			//063C 	0C2B

		//;mpu6x.c: 44: dat[i]=swI2C_ReadByte(1);
		LDWI 	1H 			//063D 	2A01
		BTSC 	STATUS,0 		//063E 	1403
		LJUMP 	644H 			//063F 	3E44
		LCALL 	5A1H 			//0640 	35A1
		LCALL 	648H 			//0641 	3648
		INCR	2BH,1 			//0642 	09AB
		LJUMP 	630H 			//0643 	3E30
		ORG		0644H

		//;mpu6x.c: 45: }
		//;mpu6x.c: 46: dat[i]=swI2C_ReadByte(1);
		LCALL 	5A1H 			//0644 	35A1
		LCALL 	648H 			//0645 	3648

		//;mpu6x.c: 47: swI2C_Stop();
		LCALL 	75EH 			//0646 	375E

		//;mpu6x.c: 48: return 0;
		RETW 	0H 			//0647 	2100

		//;mpu6x.c: 54: else
		//;mpu6x.c: 55: return 2;
		//;mpu6x.c: 51: else
		//;mpu6x.c: 52: return 1;
		STR 	27H 			//0648 	01A7
		LDR 	2BH,0 			//0649 	082B
		ADDWR 	24H,0 			//064A 	0B24
		STR 	28H 			//064B 	01A8
		ORG		064CH
		LDR 	25H,0 			//064C 	0825
		BTSC 	STATUS,0 		//064D 	1403
		ADDWI 	1H 			//064E 	2701
		STR 	29H 			//064F 	01A9
		LDR 	28H,0 			//0650 	0828
		STR 	FSR 			//0651 	0184
		BCR 	STATUS,7 		//0652 	1383
		BTSC 	29H,0 			//0653 	1429
		ORG		0654H
		BSR 	STATUS,7 		//0654 	1B83
		LDR 	27H,0 			//0655 	0827
		STR 	INDF 			//0656 	0180
		RET		 					//0657 	0004
		STR 	28H 			//0658 	01A8

		//;mpu6x.c: 5: unsigned char i;
		//;mpu6x.c: 6: swI2C_Start();
		LCALL 	719H 			//0659 	3719

		//;mpu6x.c: 8: if(swI2C_WriteByte(0x18<<1)== 0 )
		LDWI 	30H 			//065A 	2A30
		LCALL 	5E0H 			//065B 	35E0
		ORG		065CH
		IORWI 	0H 			//065C 	2500
		BTSS 	STATUS,2 		//065D 	1D03
		RETW 	1H 			//065E 	2101

		//;mpu6x.c: 9: {
		//;mpu6x.c: 10: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	28H,0 			//065F 	0828
		LCALL 	5E0H 			//0660 	35E0
		IORWI 	0H 			//0661 	2500
		BTSS 	STATUS,2 		//0662 	1D03
		RETW 	2H 			//0663 	2102
		ORG		0664H

		//;mpu6x.c: 11: {
		//;mpu6x.c: 12: for(i=0; i<len;i++){
		CLRR 	29H 			//0664 	0129
		LDR 	25H,0 			//0665 	0825
		SUBWR 	29H,0 			//0666 	0C29
		BTSC 	STATUS,0 		//0667 	1403
		LJUMP 	67EH 			//0668 	3E7E

		//;mpu6x.c: 13: if(swI2C_WriteByte(dat[i])==1 ){
		LDR 	29H,0 			//0669 	0829
		ADDWR 	23H,0 			//066A 	0B23
		STR 	26H 			//066B 	01A6
		ORG		066CH
		LDR 	24H,0 			//066C 	0824
		BTSC 	STATUS,0 		//066D 	1403
		ADDWI 	1H 			//066E 	2701
		STR 	27H 			//066F 	01A7
		LDR 	26H,0 			//0670 	0826
		STR 	FSR 			//0671 	0184
		BSR 	STATUS,7 		//0672 	1B83
		BTSS 	27H,0 			//0673 	1C27
		ORG		0674H
		BCR 	STATUS,7 		//0674 	1383
		LDR 	INDF,0 			//0675 	0800
		LCALL 	5E0H 			//0676 	35E0
		XORWI 	1H 			//0677 	2601
		BTSS 	STATUS,2 		//0678 	1D03
		LJUMP 	67CH 			//0679 	3E7C

		//;mpu6x.c: 14: swI2C_Stop();
		LCALL 	75EH 			//067A 	375E

		//;mpu6x.c: 15: return 3;
		RETW 	3H 			//067B 	2103
		ORG		067CH
		INCR	29H,1 			//067C 	09A9
		LJUMP 	665H 			//067D 	3E65

		//;mpu6x.c: 16: }
		//;mpu6x.c: 17: }
		//;mpu6x.c: 18: swI2C_Stop();
		LCALL 	75EH 			//067E 	375E

		//;mpu6x.c: 19: return 0;
		RETW 	0H 			//067F 	2100

		//;SWI2C.C: 10: TRISA &=0xbf;;
		BSR 	STATUS,5 		//0680 	1A83
		BCR 	5H,6 			//0681 	1305

		//;SWI2C.C: 11: TRISA &=0x7f;;
		BCR 	5H,7 			//0682 	1385

		//;SWI2C.C: 12: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0683 	2A05
		ORG		0684H
		BCR 	STATUS,5 		//0684 	1283
		STR 	20H 			//0685 	01A0
		DECRSZ 	20H,1 		//0686 	0EA0
		LJUMP 	686H 			//0687 	3E86
		LDWI 	5H 			//0688 	2A05

		//;SWI2C.C: 13: RA7 = 1;
		BCR 	STATUS,5 		//0689 	1283
		BSR 	5H,7 			//068A 	1B85
		BSR 	5H,6 			//068B 	1B05
		ORG		068CH

		//;SWI2C.C: 15: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//068C 	01A0
		DECRSZ 	20H,1 		//068D 	0EA0
		LJUMP 	68DH 			//068E 	3E8D

		//;SWI2C.C: 16: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//068F 	2A05
		BCR 	STATUS,5 		//0690 	1283
		STR 	20H 			//0691 	01A0
		DECRSZ 	20H,1 		//0692 	0EA0
		LJUMP 	692H 			//0693 	3E92
		ORG		0694H

		//;SWI2C.C: 17: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0694 	2A05
		BCR 	STATUS,5 		//0695 	1283
		STR 	20H 			//0696 	01A0
		DECRSZ 	20H,1 		//0697 	0EA0
		LJUMP 	697H 			//0698 	3E97

		//;SWI2C.C: 18: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0699 	2A05
		BCR 	STATUS,5 		//069A 	1283
		STR 	20H 			//069B 	01A0
		ORG		069CH
		DECRSZ 	20H,1 		//069C 	0EA0
		LJUMP 	69CH 			//069D 	3E9C
		RET		 					//069E 	0004

		//;sysinit.c: 88: INTCON = 0B00000000;
		CLRR 	INTCON 			//069F 	010B

		//;sysinit.c: 89: PIE1 = 0B00000000;
		BSR 	STATUS,5 		//06A0 	1A83
		CLRR 	CH 			//06A1 	010C

		//;sysinit.c: 90: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//06A2 	1283
		CLRR 	CH 			//06A3 	010C
		ORG		06A4H

		//;sysinit.c: 92: IOCA5 = 1;
		BSR 	STATUS,5 		//06A4 	1A83
		BSR 	16H,5 			//06A5 	1A96

		//;sysinit.c: 93: tmp = PORTA;
		BCR 	STATUS,5 		//06A6 	1283
		LDR 	5H,0 			//06A7 	0805

		//;sysinit.c: 94: PAIF = 0;
		BCR 	INTCON,0 		//06A8 	100B

		//;sysinit.c: 95: PAIE = 0;
		BCR 	INTCON,3 		//06A9 	118B

		//;sysinit.c: 98: INTEDG = 0;
		BSR 	STATUS,5 		//06AA 	1A83
		BCR 	1H,6 			//06AB 	1301
		ORG		06ACH

		//;sysinit.c: 99: INTF = 0;
		BCR 	INTCON,1 		//06AC 	108B

		//;sysinit.c: 100: INTE = 1;
		BSR 	INTCON,4 		//06AD 	1A0B

		//;sysinit.c: 102: TMR2IF = 0;
		BCR 	STATUS,5 		//06AE 	1283
		BCR 	CH,1 			//06AF 	108C

		//;sysinit.c: 103: TMR2IE = 1;
		BSR 	STATUS,5 		//06B0 	1A83
		BSR 	CH,1 			//06B1 	188C

		//;sysinit.c: 104: TMR2ON = 0;
		BCR 	STATUS,5 		//06B2 	1283
		BCR 	12H,2 			//06B3 	1112
		ORG		06B4H

		//;sysinit.c: 110: T0IF = 0;
		BCR 	INTCON,2 		//06B4 	110B

		//;sysinit.c: 111: T0IE = 1;
		BSR 	INTCON,5 		//06B5 	1A8B

		//;sysinit.c: 112: T0ON = 1;
		BSR 	1FH,3 			//06B6 	199F

		//;sysinit.c: 114: PEIE = 1;
		BSR 	INTCON,6 		//06B7 	1B0B

		//;sysinit.c: 116: GIE = 1;
		BSR 	INTCON,7 		//06B8 	1B8B
		RET		 					//06B9 	0004
		STR 	21H 			//06BA 	01A1

		//;smartkey.C: 190: GIE = 0;
		BCR 	INTCON,7 		//06BB 	138B
		ORG		06BCH

		//;smartkey.C: 191: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//06BC 	1F8B
		LJUMP 	6C0H 			//06BD 	3EC0
		CLRWDT	 			//06BE 	0001
		LJUMP 	6BCH 			//06BF 	3EBC

		//;smartkey.C: 192: EEADR = EEAddr;
		BCR 	STATUS,5 		//06C0 	1283
		LDR 	21H,0 			//06C1 	0821
		BSR 	STATUS,5 		//06C2 	1A83
		STR 	1BH 			//06C3 	019B
		ORG		06C4H

		//;smartkey.C: 193: EEDAT = EEData;
		BCR 	STATUS,5 		//06C4 	1283
		LDR 	20H,0 			//06C5 	0820
		BSR 	STATUS,5 		//06C6 	1A83
		STR 	1AH 			//06C7 	019A
		LDWI 	34H 			//06C8 	2A34

		//;smartkey.C: 194: EEIF = 0;
		BCR 	STATUS,5 		//06C9 	1283
		BCR 	CH,7 			//06CA 	138C

		//;smartkey.C: 195: EECON1 = 0x34;
		BSR 	STATUS,5 		//06CB 	1A83
		ORG		06CCH
		STR 	1CH 			//06CC 	019C

		//;smartkey.C: 196: WR = 1;
		BSR 	1DH,0 			//06CD 	181D

		//;smartkey.C: 197: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//06CE 	1A83
		BTSS 	1DH,0 			//06CF 	1C1D
		LJUMP 	6D3H 			//06D0 	3ED3
		CLRWDT	 			//06D1 	0001
		LJUMP 	6CEH 			//06D2 	3ECE

		//;smartkey.C: 199: GIE = 1;
		BSR 	INTCON,7 		//06D3 	1B8B
		ORG		06D4H
		RET		 					//06D4 	0004
		STR 	76H 			//06D5 	01F6

		//;smartkey.C: 190: GIE = 0;
		BCR 	INTCON,7 		//06D6 	138B

		//;smartkey.C: 191: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//06D7 	1F8B
		LJUMP 	6DBH 			//06D8 	3EDB
		CLRWDT	 			//06D9 	0001
		LJUMP 	6D7H 			//06DA 	3ED7

		//;smartkey.C: 192: EEADR = EEAddr;
		LDR 	76H,0 			//06DB 	0876
		ORG		06DCH
		BSR 	STATUS,5 		//06DC 	1A83
		STR 	1BH 			//06DD 	019B

		//;smartkey.C: 193: EEDAT = EEData;
		LDR 	75H,0 			//06DE 	0875
		STR 	1AH 			//06DF 	019A
		LDWI 	34H 			//06E0 	2A34

		//;smartkey.C: 194: EEIF = 0;
		BCR 	STATUS,5 		//06E1 	1283
		BCR 	CH,7 			//06E2 	138C

		//;smartkey.C: 195: EECON1 = 0x34;
		BSR 	STATUS,5 		//06E3 	1A83
		ORG		06E4H
		STR 	1CH 			//06E4 	019C

		//;smartkey.C: 196: WR = 1;
		BSR 	1DH,0 			//06E5 	181D

		//;smartkey.C: 197: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//06E6 	1A83
		BTSS 	1DH,0 			//06E7 	1C1D
		LJUMP 	6EBH 			//06E8 	3EEB
		CLRWDT	 			//06E9 	0001
		LJUMP 	6E6H 			//06EA 	3EE6

		//;smartkey.C: 199: GIE = 1;
		BSR 	INTCON,7 		//06EB 	1B8B
		ORG		06ECH
		RET		 					//06EC 	0004
		STR 	25H 			//06ED 	01A5

		//;smartkey.C: 163: {
		//;smartkey.C: 164: while(rep--){
		DECR 	24H,1 			//06EE 	0DA4
		LDR 	24H,0 			//06EF 	0824
		XORWI 	FFH 			//06F0 	26FF
		BTSC 	STATUS,2 		//06F1 	1503
		RET		 					//06F2 	0004
		LDWI 	CH 			//06F3 	2A0C
		ORG		06F4H

		//;smartkey.C: 165: TMR2ON = 1;
		BSR 	12H,2 			//06F4 	1912

		//;smartkey.C: 166: PR2L = 12;
		BSR 	STATUS,5 		//06F5 	1A83
		STR 	11H 			//06F6 	0191

		//;smartkey.C: 167: delay_x10ms(delay);
		BCR 	STATUS,5 		//06F7 	1283
		LDR 	25H,0 			//06F8 	0825
		STR 	20H 			//06F9 	01A0
		CLRR 	21H 			//06FA 	0121
		LCALL 	72CH 			//06FB 	372C
		ORG		06FCH
		LDWI 	14H 			//06FC 	2A14

		//;smartkey.C: 169: TMR2ON = 0;RA3 =0;
		BCR 	12H,2 			//06FD 	1112
		BCR 	5H,3 			//06FE 	1185

		//;smartkey.C: 170: delay_x10ms(20);
		STR 	20H 			//06FF 	01A0
		CLRR 	21H 			//0700 	0121
		LCALL 	72CH 			//0701 	372C
		LJUMP 	6EEH 			//0702 	3EEE

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0703 	1283
		ORG		0704H
		CLRR 	5H 			//0704 	0105

		//;sysinit.c: 35: TRISA = 0B00110111;
		LDWI 	37H 			//0705 	2A37
		BSR 	STATUS,5 		//0706 	1A83
		STR 	5H 			//0707 	0185

		//;sysinit.c: 36: WPUA = 0B11000000;
		LDWI 	C0H 			//0708 	2AC0
		STR 	15H 			//0709 	0195

		//;sysinit.c: 38: PORTC = 0B00000000;
		BCR 	STATUS,5 		//070A 	1283
		CLRR 	7H 			//070B 	0107
		ORG		070CH

		//;sysinit.c: 39: TRISC = 0B11111100;
		LDWI 	FCH 			//070C 	2AFC
		BSR 	STATUS,5 		//070D 	1A83
		STR 	7H 			//070E 	0187

		//;sysinit.c: 40: WPUC = 0B00000000;
		CLRR 	13H 			//070F 	0113

		//;sysinit.c: 42: PSRCA = 0B11111111;
		LDWI 	FFH 			//0710 	2AFF
		STR 	8H 			//0711 	0188

		//;sysinit.c: 43: PSRCC = 0B11111111;
		STR 	14H 			//0712 	0194

		//;sysinit.c: 44: PSINKA = 0B11111111;
		STR 	17H 			//0713 	0197
		ORG		0714H

		//;sysinit.c: 45: PSINKC = 0B11111111;
		STR 	1FH 			//0714 	019F

		//;sysinit.c: 47: MSCON = 0B00110000;
		LDWI 	30H 			//0715 	2A30
		BCR 	STATUS,5 		//0716 	1283
		STR 	1BH 			//0717 	019B
		RET		 					//0718 	0004
		LDWI 	5H 			//0719 	2A05

		//;SWI2C.C: 24: RA7 = 1;
		BSR 	5H,7 			//071A 	1B85

		//;SWI2C.C: 26: RA6 = 1;
		BSR 	5H,6 			//071B 	1B05
		ORG		071CH

		//;SWI2C.C: 27: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//071C 	01A0
		DECRSZ 	20H,1 		//071D 	0EA0
		LJUMP 	71DH 			//071E 	3F1D
		LDWI 	5H 			//071F 	2A05

		//;SWI2C.C: 28: RA6 = 0;
		BCR 	STATUS,5 		//0720 	1283
		BCR 	5H,6 			//0721 	1305

		//;SWI2C.C: 29: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0722 	01A0
		DECRSZ 	20H,1 		//0723 	0EA0
		ORG		0724H
		LJUMP 	723H 			//0724 	3F23
		LDWI 	5H 			//0725 	2A05

		//;SWI2C.C: 30: RA7 = 0;
		BCR 	STATUS,5 		//0726 	1283
		BCR 	5H,7 			//0727 	1385

		//;SWI2C.C: 31: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0728 	01A0
		DECRSZ 	20H,1 		//0729 	0EA0
		LJUMP 	729H 			//072A 	3F29
		RET		 					//072B 	0004
		ORG		072CH

		//;smartkey.C: 151: unsigned int set = t + timeTick;
		LDR 	21H,0 			//072C 	0821
		STR 	23H 			//072D 	01A3
		LDR 	20H,0 			//072E 	0820
		STR 	22H 			//072F 	01A2
		LDR 	70H,0 			//0730 	0870
		ADDWR 	22H,1 			//0731 	0BA2
		BTSC 	STATUS,0 		//0732 	1403
		INCR	23H,1 			//0733 	09A3
		ORG		0734H
		LDR 	71H,0 			//0734 	0871
		ADDWR 	23H,1 			//0735 	0BA3

		//;smartkey.C: 152: while(timeTick < set);
		LDR 	23H,0 			//0736 	0823
		SUBWR 	71H,0 			//0737 	0C71
		BTSS 	STATUS,2 		//0738 	1D03
		LJUMP 	73CH 			//0739 	3F3C
		LDR 	22H,0 			//073A 	0822
		SUBWR 	70H,0 			//073B 	0C70
		ORG		073CH
		BTSC 	STATUS,0 		//073C 	1403
		RET		 					//073D 	0004
		LJUMP 	736H 			//073E 	3F36

		//;sysinit.c: 60: T0CON0 = 0B00000000;
		CLRR 	1FH 			//073F 	011F

		//;sysinit.c: 61: OPTION = 0B00000111;
		LDWI 	7H 			//0740 	2A07
		BSR 	STATUS,5 		//0741 	1A83
		STR 	1H 			//0742 	0181

		//;sysinit.c: 62: TMR0 = 179;
		LDWI 	B3H 			//0743 	2AB3
		ORG		0744H
		BCR 	STATUS,5 		//0744 	1283
		STR 	1H 			//0745 	0181

		//;sysinit.c: 64: TMR2H = 0;
		CLRR 	13H 			//0746 	0113

		//;sysinit.c: 65: TMR2L = 0;
		CLRR 	11H 			//0747 	0111

		//;sysinit.c: 66: PR2H = 0;
		BSR 	STATUS,5 		//0748 	1A83
		CLRR 	12H 			//0749 	0112

		//;sysinit.c: 67: PR2L =0;
		CLRR 	11H 			//074A 	0111

		//;sysinit.c: 68: T2CON0 = 0B00101001;
		LDWI 	29H 			//074B 	2A29
		ORG		074CH
		BCR 	STATUS,5 		//074C 	1283
		STR 	12H 			//074D 	0192
		RET		 					//074E 	0004
		CLRR 	70H 			//074F 	0170
		CLRR 	71H 			//0750 	0171
		CLRR 	72H 			//0751 	0172
		CLRR 	73H 			//0752 	0173
		CLRR 	74H 			//0753 	0174
		ORG		0754H
		CLRR 	46H 			//0754 	0146
		CLRR 	47H 			//0755 	0147
		CLRR 	48H 			//0756 	0148
		CLRR 	49H 			//0757 	0149
		CLRR 	4AH 			//0758 	014A
		CLRR 	4BH 			//0759 	014B
		CLRR 	4CH 			//075A 	014C
		CLRR 	4DH 			//075B 	014D
		ORG		075CH
		CLRR 	STATUS 			//075C 	0103
		LJUMP 	0BH 			//075D 	380B
		LDWI 	5H 			//075E 	2A05

		//;SWI2C.C: 37: RA6 = 0;
		BCR 	5H,6 			//075F 	1305

		//;SWI2C.C: 38: RA7 = 1;
		BSR 	5H,7 			//0760 	1B85

		//;SWI2C.C: 39: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0761 	01A0
		DECRSZ 	20H,1 		//0762 	0EA0
		LJUMP 	762H 			//0763 	3F62
		ORG		0764H
		LDWI 	5H 			//0764 	2A05

		//;SWI2C.C: 40: RA6 = 1;
		BCR 	STATUS,5 		//0765 	1283
		BSR 	5H,6 			//0766 	1B05

		//;SWI2C.C: 41: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0767 	01A0
		DECRSZ 	20H,1 		//0768 	0EA0
		LJUMP 	768H 			//0769 	3F68
		RET		 					//076A 	0004
		BCR 	STATUS,5 		//076B 	1283
		ORG		076CH
		STR 	20H 			//076C 	01A0

		//;smartkey.C: 179: unsigned char ReEepromData;
		//;smartkey.C: 181: EEADR = EEAddr;
		BSR 	STATUS,5 		//076D 	1A83
		STR 	1BH 			//076E 	019B

		//;smartkey.C: 182: RD = 1;
		BSR 	1CH,0 			//076F 	181C

		//;smartkey.C: 183: ReEepromData = EEDAT;
		LDR 	1AH,0 			//0770 	081A
		BCR 	STATUS,5 		//0771 	1283
		STR 	21H 			//0772 	01A1

		//;smartkey.C: 184: RD = 0;
		BSR 	STATUS,5 		//0773 	1A83
		ORG		0774H
		BCR 	1CH,0 			//0774 	101C

		//;smartkey.C: 185: return ReEepromData;
		BCR 	STATUS,5 		//0775 	1283
		LDR 	21H,0 			//0776 	0821
		RET		 					//0777 	0004
		STR 	22H 			//0778 	01A2

		//;smartkey.C: 203: mtOldState = mtState;
		LDR 	74H,0 			//0779 	0874
		STR 	4DH 			//077A 	01CD

		//;smartkey.C: 204: mtState = stt;
		LDR 	22H,0 			//077B 	0822
		ORG		077CH
		STR 	74H 			//077C 	01F4

		//;smartkey.C: 205: timeTick =0;
		CLRR 	70H 			//077D 	0170
		CLRR 	71H 			//077E 	0171

		//;smartkey.C: 206: timeOut = _tOut;
		LDR 	21H,0 			//077F 	0821
		STR 	49H 			//0780 	01C9
		LDR 	20H,0 			//0781 	0820
		STR 	48H 			//0782 	01C8
		RET		 					//0783 	0004
		ORG		0784H

		//;sysinit.c: 21: OSCCON = 0B01010001;
		LDWI 	51H 			//0784 	2A51
		BSR 	STATUS,5 		//0785 	1A83
		STR 	FH 			//0786 	018F

		//;sysinit.c: 22: _nop();
		NOP		 					//0787 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//0788 	1A83
		BTSC 	FH,2 			//0789 	150F
		RET		 					//078A 	0004
		LJUMP 	788H 			//078B 	3F88
		ORG		078CH
		STR 	75H 			//078C 	01F5

		//;smartkey.C: 179: unsigned char ReEepromData;
		//;smartkey.C: 181: EEADR = EEAddr;
		BSR 	STATUS,5 		//078D 	1A83
		STR 	1BH 			//078E 	019B

		//;smartkey.C: 182: RD = 1;
		BSR 	1CH,0 			//078F 	181C

		//;smartkey.C: 183: ReEepromData = EEDAT;
		LDR 	1AH,0 			//0790 	081A
		STR 	76H 			//0791 	01F6

		//;smartkey.C: 184: RD = 0;
		BCR 	1CH,0 			//0792 	101C

		//;smartkey.C: 185: return ReEepromData;
		RET		 					//0793 	0004
		ORG		0794H
		LJUMP 	2F3H 			//0794 	3AF3
		LJUMP 	225H 			//0795 	3A25
		LJUMP 	22CH 			//0796 	3A2C
		LJUMP 	275H 			//0797 	3A75
		LJUMP 	296H 			//0798 	3A96

		//;smartkey.C: 159: TMR2ON = 1;
		BCR 	STATUS,5 		//0799 	1283
		BSR 	12H,2 			//079A 	1912

		//;smartkey.C: 160: TRISA &= 0xf7;
		BSR 	STATUS,5 		//079B 	1A83
		ORG		079CH
		BCR 	5H,3 			//079C 	1185
		RET		 					//079D 	0004

		//;smartkey.C: 156: TMR2ON = 0;RA3 =0;TRISA |= 0x08;
		BCR 	12H,2 			//079E 	1112
		BCR 	5H,3 			//079F 	1185
		BSR 	STATUS,5 		//07A0 	1A83
		BSR 	5H,3 			//07A1 	1985
		RET		 					//07A2 	0004
			END

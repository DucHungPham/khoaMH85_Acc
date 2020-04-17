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
		LJUMP 	47EH 			//0009 	3C7E
		LJUMP 	73CH 			//000A 	3F3C

		//;smartkey.C: 232: unsigned char reAlertOn=0,tmp8,isSw=0,isFall=0,accEna=1,vibrateOn=0,an
		//+                          tenSkip=0;
		CLRR 	41H 			//000B 	0141
		ORG		000CH
		CLRR 	42H 			//000C 	0142
		CLRR 	32H 			//000D 	0132
		CLRR 	2FH 			//000E 	012F
		INCR	2FH,1 			//000F 	09AF
		CLRR 	33H 			//0010 	0133
		CLRR 	36H 			//0011 	0136

		//;smartkey.C: 233: unsigned int isWait =0;
		CLRR 	30H 			//0012 	0130
		CLRR 	31H 			//0013 	0131
		ORG		0014H
		CLRR 	39H 			//0014 	0139
		CLRR 	3AH 			//0015 	013A

		//;smartkey.C: 235: unsigned int tmp16=0;
		CLRR 	43H 			//0016 	0143
		CLRR 	44H 			//0017 	0144
		CLRWDT	 			//0018 	0001

		//;smartkey.C: 241: sys_init();
		LCALL 	771H 			//0019 	3771

		//;smartkey.C: 242: gpio_init();
		LCALL 	6F0H 			//001A 	36F0

		//;smartkey.C: 243: timer_init();
		LCALL 	72CH 			//001B 	372C
		ORG		001CH

		//;smartkey.C: 244: int_init();
		LCALL 	68CH 			//001C 	368C

		//;smartkey.C: 247: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//001D 	2A82
		STR 	2DH 			//001E 	01AD
		LDWI 	DDH 			//001F 	2ADD
		STR 	2CH 			//0020 	01AC
		DECRSZ 	2CH,1 		//0021 	0EAC
		LJUMP 	21H 			//0022 	3821
		DECRSZ 	2DH,1 		//0023 	0EAD
		ORG		0024H
		LJUMP 	21H 			//0024 	3821
		LJUMP 	26H 			//0025 	3826

		//;smartkey.C: 249: PAIE = 1;
		BSR 	INTCON,3 		//0026 	198B

		//;smartkey.C: 251: RegStatus = 0;
		BCR 	STATUS,5 		//0027 	1283
		CLRR 	4AH 			//0028 	014A

		//;smartkey.C: 253: swI2C_Init();
		LCALL 	66DH 			//0029 	366D
		LDWI 	0H 			//002A 	2A00

		//;smartkey.C: 256: setState(0,0);
		BCR 	STATUS,5 		//002B 	1283
		ORG		002CH
		CLRR 	20H 			//002C 	0120
		CLRR 	21H 			//002D 	0121
		LCALL 	765H 			//002E 	3765

		//;smartkey.C: 258: WRITE_EEPROM(0xFF,0xAA);
		LDWI 	AAH 			//002F 	2AAA
		STR 	20H 			//0030 	01A0
		LDWI 	FFH 			//0031 	2AFF
		LCALL 	6A7H 			//0032 	36A7

		//;smartkey.C: 259: WRITE_EEPROM(0xFF,0xAA);
		LDWI 	AAH 			//0033 	2AAA
		ORG		0034H
		BCR 	STATUS,5 		//0034 	1283
		STR 	20H 			//0035 	01A0
		LDWI 	FFH 			//0036 	2AFF
		LCALL 	6A7H 			//0037 	36A7

		//;smartkey.C: 261: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//0038 	2A82
		BCR 	STATUS,5 		//0039 	1283
		STR 	2DH 			//003A 	01AD
		LDWI 	DDH 			//003B 	2ADD
		ORG		003CH
		STR 	2CH 			//003C 	01AC
		DECRSZ 	2CH,1 		//003D 	0EAC
		LJUMP 	3DH 			//003E 	383D
		DECRSZ 	2DH,1 		//003F 	0EAD
		LJUMP 	3DH 			//0040 	383D
		LJUMP 	42H 			//0041 	3842

		//;smartkey.C: 263: buf[0] = 0x08;
		LDWI 	8H 			//0042 	2A08
		BCR 	STATUS,5 		//0043 	1283
		ORG		0044H
		STR 	3BH 			//0044 	01BB

		//;smartkey.C: 264: buf[1] = 0x4d;
		LDWI 	4DH 			//0045 	2A4D
		STR 	3CH 			//0046 	01BC

		//;smartkey.C: 265: if((AccWrite(0x10,(unsigned char)buf,2)==0)) {
		LDWI 	3BH 			//0047 	2A3B
		STR 	2CH 			//0048 	01AC
		CLRR 	2DH 			//0049 	012D
		STR 	23H 			//004A 	01A3
		LDR 	2DH,0 			//004B 	082D
		ORG		004CH
		STR 	24H 			//004C 	01A4
		LDWI 	2H 			//004D 	2A02
		STR 	25H 			//004E 	01A5
		LDWI 	10H 			//004F 	2A10
		LCALL 	645H 			//0050 	3645
		IORWI 	0H 			//0051 	2500
		BTSC 	STATUS,2 		//0052 	1503
		LJUMP 	59H 			//0053 	3859
		ORG		0054H

		//;smartkey.C: 268: else {
		//;smartkey.C: 270: beep(10,2);
		LDWI 	2H 			//0054 	2A02
		BCR 	STATUS,5 		//0055 	1283
		STR 	24H 			//0056 	01A4
		LDWI 	AH 			//0057 	2A0A
		LCALL 	6DAH 			//0058 	36DA

		//;smartkey.C: 271: }
		//;smartkey.C: 274: acXsum = (signed char)READ_EEPROM(0x10);
		LDWI 	10H 			//0059 	2A10
		LCALL 	758H 			//005A 	3758
		STR 	39H 			//005B 	01B9
		ORG		005CH
		CLRR 	3AH 			//005C 	013A
		BTSC 	39H,7 			//005D 	17B9
		DECR 	3AH,1 			//005E 	0DBA

		//;smartkey.C: 275: acYsum = (signed char)READ_EEPROM(0x11);
		LDWI 	11H 			//005F 	2A11
		LCALL 	758H 			//0060 	3758
		STR 	37H 			//0061 	01B7
		CLRR 	38H 			//0062 	0138
		BTSC 	37H,7 			//0063 	17B7
		ORG		0064H
		DECR 	38H,1 			//0064 	0DB8

		//;smartkey.C: 277: tmp8= READ_EEPROM(0x42);
		LDWI 	42H 			//0065 	2A42
		LCALL 	758H 			//0066 	3758
		STR 	45H 			//0067 	01C5

		//;smartkey.C: 278: if(tmp8>1) {WRITE_EEPROM(0x42,0);_delay((unsigned long)((2)*(4000000/4
		//+                          000.0)));}
		LDWI 	2H 			//0068 	2A02
		SUBWR 	45H,0 			//0069 	0C45
		BTSS 	STATUS,0 		//006A 	1C03
		LJUMP 	79H 			//006B 	3879
		ORG		006CH
		LDWI 	42H 			//006C 	2A42
		CLRR 	20H 			//006D 	0120
		LCALL 	6A7H 			//006E 	36A7
		LDWI 	3H 			//006F 	2A03
		BCR 	STATUS,5 		//0070 	1283
		STR 	2DH 			//0071 	01AD
		LDWI 	97H 			//0072 	2A97
		STR 	2CH 			//0073 	01AC
		ORG		0074H
		DECRSZ 	2CH,1 		//0074 	0EAC
		LJUMP 	74H 			//0075 	3874
		DECRSZ 	2DH,1 		//0076 	0EAD
		LJUMP 	74H 			//0077 	3874
		LJUMP 	79H 			//0078 	3879

		//;smartkey.C: 279: tmp8= READ_EEPROM(0x41);
		LDWI 	41H 			//0079 	2A41
		LCALL 	758H 			//007A 	3758
		STR 	45H 			//007B 	01C5
		ORG		007CH

		//;smartkey.C: 280: if(tmp8>1) {WRITE_EEPROM(0x41,0);_delay((unsigned long)((2)*(4000000/4
		//+                          000.0)));}
		LDWI 	2H 			//007C 	2A02
		SUBWR 	45H,0 			//007D 	0C45
		BTSS 	STATUS,0 		//007E 	1C03
		LJUMP 	8DH 			//007F 	388D
		LDWI 	41H 			//0080 	2A41
		CLRR 	20H 			//0081 	0120
		LCALL 	6A7H 			//0082 	36A7
		LDWI 	3H 			//0083 	2A03
		ORG		0084H
		BCR 	STATUS,5 		//0084 	1283
		STR 	2DH 			//0085 	01AD
		LDWI 	97H 			//0086 	2A97
		STR 	2CH 			//0087 	01AC
		DECRSZ 	2CH,1 		//0088 	0EAC
		LJUMP 	88H 			//0089 	3888
		DECRSZ 	2DH,1 		//008A 	0EAD
		LJUMP 	88H 			//008B 	3888
		ORG		008CH
		LJUMP 	8DH 			//008C 	388D

		//;smartkey.C: 284: tmp8 = READ_EEPROM(0x08);
		LDWI 	8H 			//008D 	2A08
		LCALL 	758H 			//008E 	3758
		STR 	45H 			//008F 	01C5

		//;smartkey.C: 285: if(tmp8==0xff) {WRITE_EEPROM(0x08,0);_delay((unsigned long)((2)*(40000
		//+                          00/4000.0)));}
		XORWI 	FFH 			//0090 	26FF
		BTSS 	STATUS,2 		//0091 	1D03
		LJUMP 	A0H 			//0092 	38A0
		LDWI 	8H 			//0093 	2A08
		ORG		0094H
		CLRR 	20H 			//0094 	0120
		LCALL 	6A7H 			//0095 	36A7
		LDWI 	3H 			//0096 	2A03
		BCR 	STATUS,5 		//0097 	1283
		STR 	2DH 			//0098 	01AD
		LDWI 	97H 			//0099 	2A97
		STR 	2CH 			//009A 	01AC
		DECRSZ 	2CH,1 		//009B 	0EAC
		ORG		009CH
		LJUMP 	9BH 			//009C 	389B
		DECRSZ 	2DH,1 		//009D 	0EAD
		LJUMP 	9BH 			//009E 	389B
		LJUMP 	A0H 			//009F 	38A0

		//;smartkey.C: 286: if(tmp8==0xcc){
		BCR 	STATUS,5 		//00A0 	1283
		LDR 	45H,0 			//00A1 	0845
		XORWI 	CCH 			//00A2 	26CC
		BTSS 	STATUS,2 		//00A3 	1D03
		ORG		00A4H
		LJUMP 	BBH 			//00A4 	38BB
		LDWI 	8H 			//00A5 	2A08

		//;smartkey.C: 287: RegStatus &=~(0x20);
		BCR 	4AH,5 			//00A6 	12CA

		//;smartkey.C: 288: setState(3,1800);
		STR 	20H 			//00A7 	01A0
		LDWI 	7H 			//00A8 	2A07
		STR 	21H 			//00A9 	01A1
		LDWI 	3H 			//00AA 	2A03
		LCALL 	765H 			//00AB 	3765
		ORG		00ACH

		//;smartkey.C: 289: mtOldState = 1;
		CLRR 	4DH 			//00AC 	014D
		INCR	4DH,1 			//00AD 	09CD

		//;smartkey.C: 290: cntTmp = timeTick+50;
		LDR 	71H,0 			//00AE 	0871
		STR 	47H 			//00AF 	01C7
		LDR 	70H,0 			//00B0 	0870
		STR 	46H 			//00B1 	01C6
		LDWI 	32H 			//00B2 	2A32
		ADDWR 	46H,1 			//00B3 	0BC6
		ORG		00B4H
		BTSC 	STATUS,0 		//00B4 	1403
		INCR	47H,1 			//00B5 	09C7

		//;smartkey.C: 291: PR2L =12;
		LDWI 	CH 			//00B6 	2A0C
		BSR 	STATUS,5 		//00B7 	1A83
		STR 	11H 			//00B8 	0191

		//;smartkey.C: 292: beepOn();
		LCALL 	786H 			//00B9 	3786

		//;smartkey.C: 293: } else {
		LJUMP 	C2H 			//00BA 	38C2

		//;smartkey.C: 294: setState(2,400);
		LDWI 	90H 			//00BB 	2A90
		ORG		00BCH
		STR 	20H 			//00BC 	01A0
		LDWI 	1H 			//00BD 	2A01
		STR 	21H 			//00BE 	01A1
		LDWI 	2H 			//00BF 	2A02
		LCALL 	765H 			//00C0 	3765

		//;smartkey.C: 295: mtOldState = 0;
		CLRR 	4DH 			//00C1 	014D

		//;smartkey.C: 296: }
		//;smartkey.C: 298: tmp8 = READ_EEPROM(0x3F);
		LDWI 	3FH 			//00C2 	2A3F
		LCALL 	758H 			//00C3 	3758
		ORG		00C4H
		STR 	45H 			//00C4 	01C5

		//;smartkey.C: 299: if(tmp8==5){
		XORWI 	5H 			//00C5 	2605
		BTSS 	STATUS,2 		//00C6 	1D03
		LJUMP 	FFH 			//00C7 	38FF
		LDWI 	3FH 			//00C8 	2A3F

		//;smartkey.C: 300: tmp8 = 0;
		CLRR 	45H 			//00C9 	0145

		//;smartkey.C: 301: WRITE_EEPROM(0x3F,0);
		CLRR 	20H 			//00CA 	0120
		LCALL 	6A7H 			//00CB 	36A7
		ORG		00CCH

		//;smartkey.C: 302: while( RA2){
		BCR 	STATUS,5 		//00CC 	1283
		BTSS 	5H,2 			//00CD 	1D05
		LJUMP 	FDH 			//00CE 	38FD

		//;smartkey.C: 303: _delay((unsigned long)((1500)*(4000000/4000.0)));
		LDWI 	8H 			//00CF 	2A08
		STR 	2EH 			//00D0 	01AE
		LDWI 	9DH 			//00D1 	2A9D
		STR 	2DH 			//00D2 	01AD
		LDWI 	BH 			//00D3 	2A0B
		ORG		00D4H
		STR 	2CH 			//00D4 	01AC
		DECRSZ 	2CH,1 		//00D5 	0EAC
		LJUMP 	D5H 			//00D6 	38D5
		DECRSZ 	2DH,1 		//00D7 	0EAD
		LJUMP 	D5H 			//00D8 	38D5
		DECRSZ 	2EH,1 		//00D9 	0EAE
		LJUMP 	D5H 			//00DA 	38D5
		LJUMP 	DCH 			//00DB 	38DC
		ORG		00DCH
		LDWI 	15H 			//00DC 	2A15

		//;smartkey.C: 304: tmp8++;
		BCR 	STATUS,5 		//00DD 	1283
		INCR	45H,1 			//00DE 	09C5

		//;smartkey.C: 305: if(tmp8 >20){
		SUBWR 	45H,0 			//00DF 	0C45
		BTSS 	STATUS,0 		//00E0 	1C03
		LJUMP 	F1H 			//00E1 	38F1

		//;smartkey.C: 306: _delay((unsigned long)((10000)*(4000000/4000.0)));
		LDWI 	33H 			//00E2 	2A33
		STR 	2EH 			//00E3 	01AE
		ORG		00E4H
		LDWI 	BCH 			//00E4 	2ABC
		STR 	2DH 			//00E5 	01AD
		LDWI 	10H 			//00E6 	2A10
		STR 	2CH 			//00E7 	01AC
		DECRSZ 	2CH,1 		//00E8 	0EAC
		LJUMP 	E8H 			//00E9 	38E8
		DECRSZ 	2DH,1 		//00EA 	0EAD
		LJUMP 	E8H 			//00EB 	38E8
		ORG		00ECH
		DECRSZ 	2EH,1 		//00EC 	0EAE
		LJUMP 	E8H 			//00ED 	38E8
		LDWI 	40H 			//00EE 	2A40

		//;smartkey.C: 307: WRITE_EEPROM(0x40,0);
		BCR 	STATUS,5 		//00EF 	1283
		LJUMP 	CAH 			//00F0 	38CA

		//;smartkey.C: 308: }
		//;smartkey.C: 309: else if( RA2){
		BTSS 	5H,2 			//00F1 	1D05
		LJUMP 	CCH 			//00F2 	38CC

		//;smartkey.C: 310: WRITE_EEPROM(0x40,tmp8);
		LDR 	45H,0 			//00F3 	0845
		ORG		00F4H
		STR 	20H 			//00F4 	01A0
		LDWI 	40H 			//00F5 	2A40
		LCALL 	6A7H 			//00F6 	36A7
		LDWI 	AH 			//00F7 	2A0A

		//;smartkey.C: 311: beep(10,1);
		BCR 	STATUS,5 		//00F8 	1283
		CLRR 	24H 			//00F9 	0124
		INCR	24H,1 			//00FA 	09A4
		LCALL 	6DAH 			//00FB 	36DA
		ORG		00FCH
		LJUMP 	CCH 			//00FC 	38CC
		BTSS 	5H,2 			//00FD 	1D05
		LJUMP 	FDH 			//00FE 	38FD

		//;smartkey.C: 316: }
		//;smartkey.C: 319: tmp8 = READ_EEPROM(0x40);
		LDWI 	40H 			//00FF 	2A40
		LCALL 	758H 			//0100 	3758
		STR 	45H 			//0101 	01C5

		//;smartkey.C: 320: switch(tmp8){
		LJUMP 	1CCH 			//0102 	39CC
		LDWI 	3H 			//0103 	2A03
		ORG		0104H

		//;smartkey.C: 323: tmp8=0; beep(10,3);
		CLRR 	45H 			//0104 	0145
		STR 	24H 			//0105 	01A4
		LDWI 	AH 			//0106 	2A0A
		LCALL 	6DAH 			//0107 	36DA

		//;smartkey.C: 324: while((tmp8<11)){
		LJUMP 	136H 			//0108 	3936

		//;smartkey.C: 326: acXsum += buf[1];
		BCR 	STATUS,5 		//0109 	1283
		LDR 	3CH,0 			//010A 	083C
		STR 	2CH 			//010B 	01AC
		ORG		010CH
		CLRR 	2DH 			//010C 	012D
		BTSC 	2CH,7 			//010D 	17AC
		DECR 	2DH,1 			//010E 	0DAD
		ADDWR 	39H,1 			//010F 	0BB9
		BTSC 	STATUS,0 		//0110 	1403
		INCR	3AH,1 			//0111 	09BA
		LDR 	2DH,0 			//0112 	082D
		ADDWR 	3AH,1 			//0113 	0BBA
		ORG		0114H

		//;smartkey.C: 327: acYsum += buf[3];
		LDR 	3EH,0 			//0114 	083E
		STR 	2CH 			//0115 	01AC
		CLRR 	2DH 			//0116 	012D
		BTSC 	2CH,7 			//0117 	17AC
		DECR 	2DH,1 			//0118 	0DAD
		ADDWR 	37H,1 			//0119 	0BB7
		BTSC 	STATUS,0 		//011A 	1403
		INCR	38H,1 			//011B 	09B8
		ORG		011CH
		LDR 	2DH,0 			//011C 	082D
		ADDWR 	38H,1 			//011D 	0BB8

		//;smartkey.C: 328: tmp16 = (signed int)tmp16 + buf[5];
		LDR 	40H,0 			//011E 	0840
		STR 	2CH 			//011F 	01AC
		CLRR 	2DH 			//0120 	012D
		BTSC 	2CH,7 			//0121 	17AC
		DECR 	2DH,1 			//0122 	0DAD
		ADDWR 	43H,1 			//0123 	0BC3
		ORG		0124H
		BTSC 	STATUS,0 		//0124 	1403
		INCR	44H,1 			//0125 	09C4
		LDR 	2DH,0 			//0126 	082D
		ADDWR 	44H,1 			//0127 	0BC4
		LDWI 	3H 			//0128 	2A03

		//;smartkey.C: 329: tmp8++;
		INCR	45H,1 			//0129 	09C5

		//;smartkey.C: 332: _delay((unsigned long)((500)*(4000000/4000.0)));
		//;smartkey.C: 330: } else
		STR 	2EH 			//012A 	01AE
		LDWI 	8AH 			//012B 	2A8A
		ORG		012CH
		STR 	2DH 			//012C 	01AD
		LDWI 	56H 			//012D 	2A56
		STR 	2CH 			//012E 	01AC
		DECRSZ 	2CH,1 		//012F 	0EAC
		LJUMP 	12FH 			//0130 	392F
		DECRSZ 	2DH,1 		//0131 	0EAD
		LJUMP 	12FH 			//0132 	392F
		DECRSZ 	2EH,1 		//0133 	0EAE
		ORG		0134H
		LJUMP 	12FH 			//0134 	392F
		LJUMP 	136H 			//0135 	3936
		LDWI 	BH 			//0136 	2A0B
		BCR 	STATUS,5 		//0137 	1283
		SUBWR 	45H,0 			//0138 	0C45
		BTSC 	STATUS,0 		//0139 	1403
		LJUMP 	148H 			//013A 	3948

		//;smartkey.C: 325: if(AccRead(0x02,(unsigned char)buf,6)==0){
		LDWI 	3BH 			//013B 	2A3B
		ORG		013CH
		STR 	2CH 			//013C 	01AC
		CLRR 	2DH 			//013D 	012D
		STR 	24H 			//013E 	01A4
		LDR 	2DH,0 			//013F 	082D
		STR 	25H 			//0140 	01A5
		LDWI 	6H 			//0141 	2A06
		STR 	26H 			//0142 	01A6
		LDWI 	2H 			//0143 	2A02
		ORG		0144H
		LCALL 	60AH 			//0144 	360A
		IORWI 	0H 			//0145 	2500
		BTSC 	STATUS,2 		//0146 	1503
		LJUMP 	109H 			//0147 	3909

		//;smartkey.C: 333: }
		//;smartkey.C: 335: if(tmp8==11){
		BCR 	STATUS,5 		//0148 	1283
		LDR 	45H,0 			//0149 	0845
		XORWI 	BH 			//014A 	260B
		BTSS 	STATUS,2 		//014B 	1D03
		ORG		014CH
		LJUMP 	19EH 			//014C 	399E

		//;smartkey.C: 336: acXsum =acXsum/10;
		LDWI 	AH 			//014D 	2A0A
		STR 	20H 			//014E 	01A0
		CLRR 	21H 			//014F 	0121
		LDR 	3AH,0 			//0150 	083A
		STR 	23H 			//0151 	01A3
		LDR 	39H,0 			//0152 	0839
		STR 	22H 			//0153 	01A2
		ORG		0154H
		LCALL 	504H 			//0154 	3504
		LDR 	21H,0 			//0155 	0821
		STR 	3AH 			//0156 	01BA
		LDR 	20H,0 			//0157 	0820
		STR 	39H 			//0158 	01B9

		//;smartkey.C: 337: acYsum = acYsum/10;
		LDWI 	AH 			//0159 	2A0A
		STR 	20H 			//015A 	01A0
		CLRR 	21H 			//015B 	0121
		ORG		015CH
		LDR 	38H,0 			//015C 	0838
		STR 	23H 			//015D 	01A3
		LDR 	37H,0 			//015E 	0837
		STR 	22H 			//015F 	01A2
		LCALL 	504H 			//0160 	3504
		LDR 	21H,0 			//0161 	0821
		STR 	38H 			//0162 	01B8
		LDR 	20H,0 			//0163 	0820
		ORG		0164H
		STR 	37H 			//0164 	01B7

		//;smartkey.C: 338: tmp16 = (signed int)tmp16/10;
		LDWI 	AH 			//0165 	2A0A
		STR 	20H 			//0166 	01A0
		CLRR 	21H 			//0167 	0121
		LDR 	44H,0 			//0168 	0844
		STR 	23H 			//0169 	01A3
		LDR 	43H,0 			//016A 	0843
		STR 	22H 			//016B 	01A2
		ORG		016CH
		LCALL 	504H 			//016C 	3504
		LDR 	21H,0 			//016D 	0821
		STR 	44H 			//016E 	01C4
		LDR 	20H,0 			//016F 	0820
		STR 	43H 			//0170 	01C3

		//;smartkey.C: 340: if(((signed int)tmp16 > (-31)) && ((signed int)tmp16 < 31)){
		LDR 	44H,0 			//0171 	0844
		XORWI 	80H 			//0172 	2680
		STR 	7FH 			//0173 	01FF
		ORG		0174H
		LDWI 	7FH 			//0174 	2A7F
		SUBWR 	7FH,0 			//0175 	0C7F
		BTSS 	STATUS,2 		//0176 	1D03
		LJUMP 	17AH 			//0177 	397A
		LDWI 	E2H 			//0178 	2AE2
		SUBWR 	43H,0 			//0179 	0C43
		BCR 	STATUS,5 		//017A 	1283
		BTSS 	STATUS,0 		//017B 	1C03
		ORG		017CH
		LJUMP 	18FH 			//017C 	398F
		LDR 	44H,0 			//017D 	0844
		XORWI 	80H 			//017E 	2680
		STR 	7FH 			//017F 	01FF
		LDWI 	80H 			//0180 	2A80
		SUBWR 	7FH,0 			//0181 	0C7F
		BTSS 	STATUS,2 		//0182 	1D03
		LJUMP 	186H 			//0183 	3986
		ORG		0184H
		LDWI 	1FH 			//0184 	2A1F
		SUBWR 	43H,0 			//0185 	0C43
		BTSC 	STATUS,0 		//0186 	1403
		LJUMP 	18EH 			//0187 	398E

		//;smartkey.C: 341: beep(10,4);
		LDWI 	4H 			//0188 	2A04
		BCR 	STATUS,5 		//0189 	1283
		STR 	24H 			//018A 	01A4
		LDWI 	AH 			//018B 	2A0A
		ORG		018CH
		LCALL 	6DAH 			//018C 	36DA

		//;smartkey.C: 342: }else{
		LJUMP 	1D7H 			//018D 	39D7

		//;smartkey.C: 344: WRITE_EEPROM(0x10,(unsigned char)acXsum);
		BCR 	STATUS,5 		//018E 	1283
		LDR 	39H,0 			//018F 	0839
		STR 	20H 			//0190 	01A0
		LDWI 	10H 			//0191 	2A10
		LCALL 	6A7H 			//0192 	36A7

		//;smartkey.C: 345: WRITE_EEPROM(0x11,(unsigned char)acYsum);
		BCR 	STATUS,5 		//0193 	1283
		ORG		0194H
		LDR 	37H,0 			//0194 	0837
		STR 	20H 			//0195 	01A0
		LDWI 	11H 			//0196 	2A11
		LCALL 	6A7H 			//0197 	36A7

		//;smartkey.C: 346: beep(10,3);
		LDWI 	3H 			//0198 	2A03
		BCR 	STATUS,5 		//0199 	1283
		STR 	24H 			//019A 	01A4
		LDWI 	AH 			//019B 	2A0A
		ORG		019CH
		LCALL 	6DAH 			//019C 	36DA
		LJUMP 	1D7H 			//019D 	39D7

		//;smartkey.C: 349: beep(10,2);
		LDWI 	2H 			//019E 	2A02
		STR 	24H 			//019F 	01A4
		LDWI 	AH 			//01A0 	2A0A
		LCALL 	6DAH 			//01A1 	36DA
		LJUMP 	1D7H 			//01A2 	39D7

		//;smartkey.C: 356: tmp8= READ_EEPROM(0x42);
		LDWI 	42H 			//01A3 	2A42
		ORG		01A4H
		LCALL 	758H 			//01A4 	3758
		STR 	45H 			//01A5 	01C5

		//;smartkey.C: 357: if((tmp8==1)||(tmp8==0xff)){
		DECR 	45H,0 			//01A6 	0D45
		BTSC 	STATUS,2 		//01A7 	1503
		LJUMP 	1ADH 			//01A8 	39AD
		LDR 	45H,0 			//01A9 	0845
		XORWI 	FFH 			//01AA 	26FF
		BTSS 	STATUS,2 		//01AB 	1D03
		ORG		01ACH
		LJUMP 	1B0H 			//01AC 	39B0
		LDWI 	42H 			//01AD 	2A42

		//;smartkey.C: 358: WRITE_EEPROM(0x42,0);
		CLRR 	20H 			//01AE 	0120
		LJUMP 	1B3H 			//01AF 	39B3

		//;smartkey.C: 359: }
		LDWI 	42H 			//01B0 	2A42

		//;smartkey.C: 360: else{
		//;smartkey.C: 361: WRITE_EEPROM(0x42,0x1);
		CLRR 	20H 			//01B1 	0120
		INCR	20H,1 			//01B2 	09A0
		LCALL 	6A7H 			//01B3 	36A7
		ORG		01B4H
		LDWI 	AH 			//01B4 	2A0A

		//;smartkey.C: 362: }
		//;smartkey.C: 363: beep(10,1);
		BCR 	STATUS,5 		//01B5 	1283
		CLRR 	24H 			//01B6 	0124
		INCR	24H,1 			//01B7 	09A4
		LCALL 	6DAH 			//01B8 	36DA

		//;smartkey.C: 364: break;
		LJUMP 	1D7H 			//01B9 	39D7

		//;smartkey.C: 368: tmp8= READ_EEPROM(0x41);
		LDWI 	41H 			//01BA 	2A41
		LCALL 	758H 			//01BB 	3758
		ORG		01BCH
		STR 	45H 			//01BC 	01C5

		//;smartkey.C: 369: if(tmp8){
		LDR 	45H,0 			//01BD 	0845
		LDWI 	41H 			//01BE 	2A41
		BTSC 	STATUS,2 		//01BF 	1503
		LJUMP 	1C3H 			//01C0 	39C3

		//;smartkey.C: 370: WRITE_EEPROM(0x41,0);
		CLRR 	20H 			//01C1 	0120
		LJUMP 	1C5H 			//01C2 	39C5

		//;smartkey.C: 371: }
		//;smartkey.C: 372: else {
		//;smartkey.C: 373: WRITE_EEPROM(0x41,0x1);
		CLRR 	20H 			//01C3 	0120
		ORG		01C4H
		INCR	20H,1 			//01C4 	09A0
		LCALL 	6A7H 			//01C5 	36A7
		LDWI 	32H 			//01C6 	2A32

		//;smartkey.C: 374: }
		//;smartkey.C: 375: beep(50,1);
		BCR 	STATUS,5 		//01C7 	1283
		CLRR 	24H 			//01C8 	0124
		INCR	24H,1 			//01C9 	09A4
		LCALL 	6DAH 			//01CA 	36DA

		//;smartkey.C: 376: break;
		LJUMP 	1D7H 			//01CB 	39D7
		ORG		01CCH
		LDR 	45H,0 			//01CC 	0845
		XORWI 	3H 			//01CD 	2603
		BTSC 	STATUS,2 		//01CE 	1503
		LJUMP 	103H 			//01CF 	3903
		XORWI 	9H 			//01D0 	2609
		BTSC 	STATUS,2 		//01D1 	1503
		LJUMP 	1A3H 			//01D2 	39A3
		XORWI 	1EH 			//01D3 	261E
		ORG		01D4H
		BTSC 	STATUS,2 		//01D4 	1503
		LJUMP 	1BAH 			//01D5 	39BA
		LJUMP 	1D7H 			//01D6 	39D7

		//;smartkey.C: 380: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//01D7 	2A41
		LCALL 	758H 			//01D8 	3758
		STR 	45H 			//01D9 	01C5

		//;smartkey.C: 381: if(tmp8==1){
		DECRSZ 	45H,0 		//01DA 	0E45
		LJUMP 	1E6H 			//01DB 	39E6
		ORG		01DCH
		LDWI 	ACH 			//01DC 	2AAC

		//;smartkey.C: 382: RegStatus |=(0x20);
		BSR 	4AH,5 			//01DD 	1ACA

		//;smartkey.C: 383: setState(1,3500);
		STR 	20H 			//01DE 	01A0
		LDWI 	DH 			//01DF 	2A0D
		STR 	21H 			//01E0 	01A1
		LDWI 	1H 			//01E1 	2A01
		LCALL 	765H 			//01E2 	3765

		//;smartkey.C: 385: antenSkip =1;
		CLRR 	36H 			//01E3 	0136
		ORG		01E4H
		INCR	36H,1 			//01E4 	09B6

		//;smartkey.C: 386: accEna =0;
		CLRR 	2FH 			//01E5 	012F

		//;smartkey.C: 387: }
		//;smartkey.C: 390: tmp8 = READ_EEPROM(0x42);
		LDWI 	42H 			//01E6 	2A42
		LCALL 	758H 			//01E7 	3758
		STR 	45H 			//01E8 	01C5

		//;smartkey.C: 391: if((tmp8==1)&&(antenSkip ==0)){
		DECRSZ 	45H,0 		//01E9 	0E45
		LJUMP 	203H 			//01EA 	3A03
		LDR 	36H,1 			//01EB 	08B6
		ORG		01ECH
		BTSS 	STATUS,2 		//01EC 	1D03
		LJUMP 	203H 			//01ED 	3A03
		LDWI 	ACH 			//01EE 	2AAC

		//;smartkey.C: 392: RegStatus |=(0x20);
		BSR 	4AH,5 			//01EF 	1ACA

		//;smartkey.C: 393: setState(1,3500);
		STR 	20H 			//01F0 	01A0
		LDWI 	DH 			//01F1 	2A0D
		STR 	21H 			//01F2 	01A1
		LDWI 	1H 			//01F3 	2A01
		ORG		01F4H
		LCALL 	765H 			//01F4 	3765

		//;smartkey.C: 395: antenSkip =1;
		CLRR 	36H 			//01F5 	0136
		INCR	36H,1 			//01F6 	09B6

		//;smartkey.C: 396: tmp16 = timeTick+40;
		LDR 	71H,0 			//01F7 	0871
		STR 	44H 			//01F8 	01C4
		LDR 	70H,0 			//01F9 	0870
		STR 	43H 			//01FA 	01C3
		LDWI 	28H 			//01FB 	2A28
		ORG		01FCH
		ADDWR 	43H,1 			//01FC 	0BC3
		BTSC 	STATUS,0 		//01FD 	1403
		INCR	44H,1 			//01FE 	09C4
		LDWI 	AH 			//01FF 	2A0A

		//;smartkey.C: 397: beep(10,1);
		CLRR 	24H 			//0200 	0124
		INCR	24H,1 			//0201 	09A4
		LCALL 	6DAH 			//0202 	36DA

		//;smartkey.C: 398: }
		//;smartkey.C: 400: timeTick = 0;
		CLRR 	70H 			//0203 	0170
		ORG		0204H
		CLRR 	71H 			//0204 	0171

		//;smartkey.C: 406: if( antenSkip ==0){
		BCR 	STATUS,5 		//0205 	1283
		LDR 	36H,1 			//0206 	08B6
		BTSS 	STATUS,2 		//0207 	1D03
		LJUMP 	2E4H 			//0208 	3AE4

		//;smartkey.C: 407: if((mode_chek == 0) && (antenSkip ==0)){
		LDR 	73H,1 			//0209 	08F3
		BTSS 	STATUS,2 		//020A 	1D03
		LJUMP 	2E4H 			//020B 	3AE4
		ORG		020CH
		LDR 	36H,1 			//020C 	08B6
		BTSC 	STATUS,2 		//020D 	1503

		//;smartkey.C: 408: if(RegStatus & 0x80){
		BTSS 	4AH,7 			//020E 	1FCA
		LJUMP 	2E4H 			//020F 	3AE4

		//;smartkey.C: 410: PAIE = 0;
		BCR 	INTCON,3 		//0210 	118B

		//;smartkey.C: 412: RegStatus &= (~0x80);
		BCR 	4AH,7 			//0211 	13CA

		//;smartkey.C: 416: if ((RegStatus & 0x40) !=0){
		BTSC 	4AH,6 			//0212 	174A
		LJUMP 	28FH 			//0213 	3A8F
		ORG		0214H
		LJUMP 	2DBH 			//0214 	3ADB

		//;smartkey.C: 420: lostDetect =0;
		CLRR 	4CH 			//0215 	014C
		LDWI 	28H 			//0216 	2A28

		//;smartkey.C: 421: timeTick =0;
		CLRR 	70H 			//0217 	0170
		CLRR 	71H 			//0218 	0171

		//;smartkey.C: 422: tmp16 = 40;
		STR 	43H 			//0219 	01C3
		CLRR 	44H 			//021A 	0144

		//;smartkey.C: 423: break;
		LJUMP 	2E3H 			//021B 	3AE3
		ORG		021CH

		//;smartkey.C: 426: if(timeTick >30){
		LDWI 	0H 			//021C 	2A00
		SUBWR 	71H,0 			//021D 	0C71
		LDWI 	1FH 			//021E 	2A1F
		BTSC 	STATUS,2 		//021F 	1503
		SUBWR 	70H,0 			//0220 	0C70
		BTSS 	STATUS,0 		//0221 	1C03
		LJUMP 	2E3H 			//0222 	3AE3
		LDWI 	8H 			//0223 	2A08
		ORG		0224H

		//;smartkey.C: 427: timeTick =0;
		CLRR 	70H 			//0224 	0170
		CLRR 	71H 			//0225 	0171

		//;smartkey.C: 429: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LCALL 	758H 			//0226 	3758
		XORWI 	CCH 			//0227 	26CC
		BTSS 	STATUS,2 		//0228 	1D03
		LJUMP 	22DH 			//0229 	3A2D
		LDWI 	8H 			//022A 	2A08
		CLRR 	20H 			//022B 	0120
		ORG		022CH
		LCALL 	6A7H 			//022C 	36A7

		//;smartkey.C: 431: if((mtOldState == 3)){
		BCR 	STATUS,5 		//022D 	1283
		LDR 	4DH,0 			//022E 	084D
		XORWI 	3H 			//022F 	2603
		BTSS 	STATUS,2 		//0230 	1D03
		LJUMP 	23EH 			//0231 	3A3E

		//;smartkey.C: 432: beepOn();TMR2ON = 0; beep(10,1);
		LCALL 	786H 			//0232 	3786
		LDWI 	AH 			//0233 	2A0A
		ORG		0234H
		BCR 	STATUS,5 		//0234 	1283
		BCR 	12H,2 			//0235 	1112
		CLRR 	24H 			//0236 	0124
		INCR	24H,1 			//0237 	09A4
		LCALL 	6DAH 			//0238 	36DA

		//;smartkey.C: 433: if(reAlertOn)reAlertOn =0;
		LDR 	41H,0 			//0239 	0841
		BTSC 	STATUS,2 		//023A 	1503
		LJUMP 	2E3H 			//023B 	3AE3
		ORG		023CH
		CLRR 	41H 			//023C 	0141
		LJUMP 	2E3H 			//023D 	3AE3

		//;smartkey.C: 435: else if((mtOldState == 0)||(mtOldState == 4)){
		LDR 	4DH,0 			//023E 	084D
		BTSC 	STATUS,2 		//023F 	1503
		LJUMP 	245H 			//0240 	3A45
		LDR 	4DH,0 			//0241 	084D
		XORWI 	4H 			//0242 	2604
		BTSS 	STATUS,2 		//0243 	1D03
		ORG		0244H
		LJUMP 	262H 			//0244 	3A62
		LDWI 	ACH 			//0245 	2AAC

		//;smartkey.C: 436: RegStatus |=(0x20);
		BSR 	4AH,5 			//0246 	1ACA

		//;smartkey.C: 437: setState(1,3500);
		STR 	20H 			//0247 	01A0
		LDWI 	DH 			//0248 	2A0D
		STR 	21H 			//0249 	01A1
		LDWI 	1H 			//024A 	2A01
		LCALL 	765H 			//024B 	3765
		ORG		024CH

		//;smartkey.C: 438: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
		LDWI 	40H 			//024C 	2A40
		LCALL 	758H 			//024D 	3758
		XORWI 	0H 			//024E 	2600
		BTSC 	STATUS,2 		//024F 	1503
		LJUMP 	254H 			//0250 	3A54
		LDWI 	40H 			//0251 	2A40
		CLRR 	20H 			//0252 	0120
		LCALL 	6A7H 			//0253 	36A7
		ORG		0254H

		//;smartkey.C: 439: tmp16 = timeTick+40;
		LDR 	71H,0 			//0254 	0871
		BCR 	STATUS,5 		//0255 	1283
		STR 	44H 			//0256 	01C4
		LDR 	70H,0 			//0257 	0870
		STR 	43H 			//0258 	01C3
		LDWI 	28H 			//0259 	2A28
		ADDWR 	43H,1 			//025A 	0BC3
		BTSC 	STATUS,0 		//025B 	1403
		ORG		025CH
		INCR	44H,1 			//025C 	09C4
		LDWI 	AH 			//025D 	2A0A

		//;smartkey.C: 440: beep(10,1);
		CLRR 	24H 			//025E 	0124
		INCR	24H,1 			//025F 	09A4
		LCALL 	6DAH 			//0260 	36DA

		//;smartkey.C: 441: }
		LJUMP 	2E3H 			//0261 	3AE3

		//;smartkey.C: 442: else if((mtOldState == 1)){
		DECRSZ 	4DH,0 		//0262 	0E4D
		LJUMP 	2E3H 			//0263 	3AE3
		ORG		0264H
		LJUMP 	239H 			//0264 	3A39

		//;smartkey.C: 445: }
		//;smartkey.C: 446: }
		//;smartkey.C: 447: break;
		//;smartkey.C: 444: if(reAlertOn)reAlertOn =0;
		//;smartkey.C: 450: if(timeTick > 200){
		LDWI 	0H 			//0265 	2A00
		SUBWR 	71H,0 			//0266 	0C71
		LDWI 	C9H 			//0267 	2AC9
		BTSC 	STATUS,2 		//0268 	1503
		SUBWR 	70H,0 			//0269 	0C70
		BTSS 	STATUS,0 		//026A 	1C03
		LJUMP 	2E3H 			//026B 	3AE3
		ORG		026CH

		//;smartkey.C: 452: beepOff();
		LCALL 	78BH 			//026C 	378B

		//;smartkey.C: 453: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LDWI 	8H 			//026D 	2A08
		LCALL 	758H 			//026E 	3758
		XORWI 	CCH 			//026F 	26CC
		BTSS 	STATUS,2 		//0270 	1D03
		LJUMP 	275H 			//0271 	3A75
		LDWI 	8H 			//0272 	2A08
		CLRR 	20H 			//0273 	0120
		ORG		0274H
		LCALL 	6A7H 			//0274 	36A7
		LDWI 	ACH 			//0275 	2AAC

		//;smartkey.C: 454: RegStatus |=(0x20);
		BCR 	STATUS,5 		//0276 	1283
		BSR 	4AH,5 			//0277 	1ACA

		//;smartkey.C: 455: setState(1,3500);
		STR 	20H 			//0278 	01A0
		LDWI 	DH 			//0279 	2A0D
		STR 	21H 			//027A 	01A1
		LDWI 	1H 			//027B 	2A01
		ORG		027CH
		LCALL 	765H 			//027C 	3765

		//;smartkey.C: 457: tmp16 = timeTick+40;
		LDR 	71H,0 			//027D 	0871
		STR 	44H 			//027E 	01C4
		LDR 	70H,0 			//027F 	0870
		STR 	43H 			//0280 	01C3
		LDWI 	28H 			//0281 	2A28
		ADDWR 	43H,1 			//0282 	0BC3
		BTSC 	STATUS,0 		//0283 	1403
		ORG		0284H
		INCR	44H,1 			//0284 	09C4
		LJUMP 	2E3H 			//0285 	3AE3

		//;smartkey.C: 463: beepOff();
		LCALL 	78BH 			//0286 	378B

		//;smartkey.C: 464: setState(2,300);
		LDWI 	2CH 			//0287 	2A2C
		BCR 	STATUS,5 		//0288 	1283
		STR 	20H 			//0289 	01A0
		LDWI 	1H 			//028A 	2A01
		STR 	21H 			//028B 	01A1
		ORG		028CH
		LDWI 	2H 			//028C 	2A02
		LCALL 	765H 			//028D 	3765

		//;smartkey.C: 465: break;
		LJUMP 	2E3H 			//028E 	3AE3
		LDR 	74H,0 			//028F 	0874
		STR 	FSR 			//0290 	0184
		LDWI 	5H 			//0291 	2A05
		SUBWR 	FSR,0 			//0292 	0C04
		BTSC 	STATUS,0 		//0293 	1403
		ORG		0294H
		LJUMP 	2E3H 			//0294 	3AE3
		LDWI 	7H 			//0295 	2A07
		STR 	PCLATH 			//0296 	018A
		LDWI 	81H 			//0297 	2A81
		ADDWR 	FSR,0 			//0298 	0B04
		STR 	PCL 			//0299 	0182

		//;smartkey.C: 480: if((lostDetect==1) && (timeTick< 1500) &&(timeTick >700))
		DECRSZ 	4CH,0 		//029A 	0E4C
		LJUMP 	2C8H 			//029B 	3AC8
		ORG		029CH
		LDWI 	5H 			//029C 	2A05
		SUBWR 	71H,0 			//029D 	0C71
		LDWI 	DCH 			//029E 	2ADC
		BTSC 	STATUS,2 		//029F 	1503
		SUBWR 	70H,0 			//02A0 	0C70
		BTSC 	STATUS,0 		//02A1 	1403
		LJUMP 	2C8H 			//02A2 	3AC8
		LDWI 	2H 			//02A3 	2A02
		ORG		02A4H
		SUBWR 	71H,0 			//02A4 	0C71
		LDWI 	BDH 			//02A5 	2ABD
		BTSC 	STATUS,2 		//02A6 	1503
		SUBWR 	70H,0 			//02A7 	0C70
		BTSS 	STATUS,0 		//02A8 	1C03
		LJUMP 	2C8H 			//02A9 	3AC8

		//;smartkey.C: 481: {
		//;smartkey.C: 482: if(READ_EEPROM(0x08)==0x00) WRITE_EEPROM(0x08,0xcc);
		LDWI 	8H 			//02AA 	2A08
		LCALL 	758H 			//02AB 	3758
		ORG		02ACH
		IORWI 	0H 			//02AC 	2500
		BTSS 	STATUS,2 		//02AD 	1D03
		LJUMP 	2B3H 			//02AE 	3AB3
		LDWI 	CCH 			//02AF 	2ACC
		STR 	20H 			//02B0 	01A0
		LDWI 	8H 			//02B1 	2A08
		LCALL 	6A7H 			//02B2 	36A7

		//;smartkey.C: 484: setState(3,1800);
		LDWI 	8H 			//02B3 	2A08
		ORG		02B4H
		BCR 	STATUS,5 		//02B4 	1283
		STR 	20H 			//02B5 	01A0
		LDWI 	7H 			//02B6 	2A07
		STR 	21H 			//02B7 	01A1
		LDWI 	3H 			//02B8 	2A03
		LCALL 	765H 			//02B9 	3765

		//;smartkey.C: 485: cntTmp = timeTick+40;
		LDR 	71H,0 			//02BA 	0871
		STR 	47H 			//02BB 	01C7
		ORG		02BCH
		LDR 	70H,0 			//02BC 	0870
		STR 	46H 			//02BD 	01C6
		LDWI 	28H 			//02BE 	2A28
		ADDWR 	46H,1 			//02BF 	0BC6
		BTSC 	STATUS,0 		//02C0 	1403
		INCR	47H,1 			//02C1 	09C7

		//;smartkey.C: 486: PR2L =20;
		LDWI 	14H 			//02C2 	2A14
		BSR 	STATUS,5 		//02C3 	1A83
		ORG		02C4H
		STR 	11H 			//02C4 	0191

		//;smartkey.C: 487: beepOn();
		LCALL 	786H 			//02C5 	3786

		//;smartkey.C: 488: lostDetect =0;
		BCR 	STATUS,5 		//02C6 	1283
		LJUMP 	215H 			//02C7 	3A15

		//;smartkey.C: 489: }
		//;smartkey.C: 490: else {
		//;smartkey.C: 491: lostDetect =1;
		CLRR 	4CH 			//02C8 	014C
		INCR	4CH,1 			//02C9 	09CC
		LJUMP 	216H 			//02CA 	3A16

		//;smartkey.C: 494: }
		//;smartkey.C: 495: timeTick =0;
		//;smartkey.C: 500: timeTick =0;
		CLRR 	70H 			//02CB 	0170
		ORG		02CCH
		CLRR 	71H 			//02CC 	0171

		//;smartkey.C: 501: beepOn();TMR2ON = 0;
		LCALL 	786H 			//02CD 	3786
		LDWI 	2H 			//02CE 	2A02
		BCR 	STATUS,5 		//02CF 	1283
		BCR 	12H,2 			//02D0 	1112

		//;smartkey.C: 502: beep(10,2);
		STR 	24H 			//02D1 	01A4
		LDWI 	AH 			//02D2 	2A0A
		LCALL 	6DAH 			//02D3 	36DA
		ORG		02D4H

		//;smartkey.C: 503: if(mtOldState == 3){reAlertOn =1;}
		LDR 	4DH,0 			//02D4 	084D
		XORWI 	3H 			//02D5 	2603
		BTSS 	STATUS,2 		//02D6 	1D03
		LJUMP 	2E3H 			//02D7 	3AE3
		CLRR 	41H 			//02D8 	0141
		INCR	41H,1 			//02D9 	09C1
		LJUMP 	2E3H 			//02DA 	3AE3
		LDR 	74H,0 			//02DB 	0874
		ORG		02DCH
		XORWI 	1H 			//02DC 	2601
		BTSC 	STATUS,2 		//02DD 	1503
		LJUMP 	29AH 			//02DE 	3A9A
		XORWI 	3H 			//02DF 	2603
		BTSC 	STATUS,2 		//02E0 	1503
		LJUMP 	2CBH 			//02E1 	3ACB
		LJUMP 	2E3H 			//02E2 	3AE3

		//;smartkey.C: 506: }
		//;smartkey.C: 507: PAIE = 1;
		BSR 	INTCON,3 		//02E3 	198B
		ORG		02E4H

		//;smartkey.C: 508: }
		//;smartkey.C: 510: }
		//;smartkey.C: 511: }
		//;smartkey.C: 514: if((timeOut!=0)&&( timeTick >timeOut)){
		LDR 	49H,0 			//02E4 	0849
		IORWR 	48H,0 			//02E5 	0348
		BTSC 	STATUS,2 		//02E6 	1503
		LJUMP 	36BH 			//02E7 	3B6B
		LDR 	71H,0 			//02E8 	0871
		SUBWR 	49H,0 			//02E9 	0C49
		BTSS 	STATUS,2 		//02EA 	1D03
		LJUMP 	2EEH 			//02EB 	3AEE
		ORG		02ECH
		LDR 	70H,0 			//02EC 	0870
		SUBWR 	48H,0 			//02ED 	0C48
		BTSS 	STATUS,0 		//02EE 	1C03
		LJUMP 	35DH 			//02EF 	3B5D
		LJUMP 	36BH 			//02F0 	3B6B

		//;smartkey.C: 525: beepOff();
		LCALL 	78BH 			//02F1 	378B
		LDWI 	2CH 			//02F2 	2A2C

		//;smartkey.C: 526: RegStatus &=(~0x20);
		BCR 	STATUS,5 		//02F3 	1283
		ORG		02F4H
		BCR 	4AH,5 			//02F4 	12CA

		//;smartkey.C: 527: setState(2,300);
		STR 	20H 			//02F5 	01A0
		LDWI 	1H 			//02F6 	2A01
		STR 	21H 			//02F7 	01A1
		LDWI 	2H 			//02F8 	2A02
		LCALL 	765H 			//02F9 	3765

		//;smartkey.C: 528: break;
		LJUMP 	36BH 			//02FA 	3B6B

		//;smartkey.C: 530: beepOff();
		LCALL 	78BH 			//02FB 	378B
		ORG		02FCH

		//;smartkey.C: 531: delay_x10ms(20);
		LDWI 	14H 			//02FC 	2A14
		BCR 	STATUS,5 		//02FD 	1283
		STR 	20H 			//02FE 	01A0
		CLRR 	21H 			//02FF 	0121
		LCALL 	719H 			//0300 	3719

		//;smartkey.C: 532: beepOn();TMR2ON = 0;reAlertOn =0;
		LCALL 	786H 			//0301 	3786
		LDWI 	1EH 			//0302 	2A1E
		BCR 	STATUS,5 		//0303 	1283
		ORG		0304H
		BCR 	12H,2 			//0304 	1112
		CLRR 	41H 			//0305 	0141
		CLRR 	24H 			//0306 	0124
		INCR	24H,1 			//0307 	09A4
		LCALL 	6DAH 			//0308 	36DA
		LDWI 	0H 			//0309 	2A00

		//;smartkey.C: 534: vibrateOn=1;
		CLRR 	33H 			//030A 	0133
		INCR	33H,1 			//030B 	09B3
		ORG		030CH
		CLRR 	20H 			//030C 	0120
		CLRR 	21H 			//030D 	0121
		LCALL 	765H 			//030E 	3765

		//;smartkey.C: 537: tmp16 = timeTick+40;
		LDR 	71H,0 			//030F 	0871
		STR 	44H 			//0310 	01C4
		LDR 	70H,0 			//0311 	0870
		STR 	43H 			//0312 	01C3
		LDWI 	28H 			//0313 	2A28
		ORG		0314H
		ADDWR 	43H,1 			//0314 	0BC3
		BTSC 	STATUS,0 		//0315 	1403
		INCR	44H,1 			//0316 	09C4

		//;smartkey.C: 538: break;
		LJUMP 	36BH 			//0317 	3B6B

		//;smartkey.C: 541: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LDWI 	8H 			//0318 	2A08
		LCALL 	758H 			//0319 	3758
		XORWI 	CCH 			//031A 	26CC
		BTSS 	STATUS,2 		//031B 	1D03
		ORG		031CH
		LJUMP 	320H 			//031C 	3B20
		LDWI 	8H 			//031D 	2A08
		CLRR 	20H 			//031E 	0120
		LCALL 	6A7H 			//031F 	36A7

		//;smartkey.C: 543: if(reAlertOn){
		BCR 	STATUS,5 		//0320 	1283
		LDR 	41H,0 			//0321 	0841
		BTSC 	STATUS,2 		//0322 	1503
		LJUMP 	337H 			//0323 	3B37
		ORG		0324H

		//;smartkey.C: 544: setState(4,6000);
		LDWI 	70H 			//0324 	2A70
		STR 	20H 			//0325 	01A0
		LDWI 	17H 			//0326 	2A17
		STR 	21H 			//0327 	01A1
		LDWI 	4H 			//0328 	2A04
		LCALL 	765H 			//0329 	3765

		//;smartkey.C: 545: cntTmp = timeTick+40;
		LDR 	71H,0 			//032A 	0871
		STR 	47H 			//032B 	01C7
		ORG		032CH
		LDR 	70H,0 			//032C 	0870
		STR 	46H 			//032D 	01C6
		LDWI 	28H 			//032E 	2A28
		ADDWR 	46H,1 			//032F 	0BC6
		BTSC 	STATUS,0 		//0330 	1403
		INCR	47H,1 			//0331 	09C7

		//;smartkey.C: 546: PR2L =20;
		LDWI 	14H 			//0332 	2A14
		BSR 	STATUS,5 		//0333 	1A83
		ORG		0334H
		STR 	11H 			//0334 	0191

		//;smartkey.C: 547: beepOn();
		LCALL 	786H 			//0335 	3786

		//;smartkey.C: 549: }else if(mtOldState == 0){
		LJUMP 	36BH 			//0336 	3B6B
		LDR 	4DH,1 			//0337 	08CD
		BTSS 	STATUS,2 		//0338 	1D03
		LJUMP 	34EH 			//0339 	3B4E

		//;smartkey.C: 551: beep(10,5);
		LDWI 	5H 			//033A 	2A05
		STR 	24H 			//033B 	01A4
		ORG		033CH
		LDWI 	AH 			//033C 	2A0A
		LCALL 	6DAH 			//033D 	36DA
		LDWI 	40H 			//033E 	2A40

		//;smartkey.C: 552: RegStatus |=(0x20);
		BSR 	4AH,5 			//033F 	1ACA

		//;smartkey.C: 555: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
		LCALL 	758H 			//0340 	3758
		XORWI 	0H 			//0341 	2600
		BTSC 	STATUS,2 		//0342 	1503
		LJUMP 	347H 			//0343 	3B47
		ORG		0344H
		LDWI 	40H 			//0344 	2A40
		CLRR 	20H 			//0345 	0120
		LCALL 	6A7H 			//0346 	36A7

		//;smartkey.C: 557: setState(1,3500);
		LDWI 	ACH 			//0347 	2AAC
		BCR 	STATUS,5 		//0348 	1283
		STR 	20H 			//0349 	01A0
		LDWI 	DH 			//034A 	2A0D
		STR 	21H 			//034B 	01A1
		ORG		034CH
		LDWI 	1H 			//034C 	2A01
		LJUMP 	30EH 			//034D 	3B0E

		//;smartkey.C: 561: beepOn();TMR2ON = 0;
		LCALL 	786H 			//034E 	3786
		LDWI 	1EH 			//034F 	2A1E
		BCR 	STATUS,5 		//0350 	1283
		BCR 	12H,2 			//0351 	1112

		//;smartkey.C: 562: reAlertOn =0;
		CLRR 	41H 			//0352 	0141
		CLRR 	24H 			//0353 	0124
		ORG		0354H
		INCR	24H,1 			//0354 	09A4
		LCALL 	6DAH 			//0355 	36DA
		LDWI 	0H 			//0356 	2A00

		//;smartkey.C: 564: setState(0,0);
		CLRR 	20H 			//0357 	0120
		CLRR 	21H 			//0358 	0121
		LCALL 	765H 			//0359 	3765

		//;smartkey.C: 566: vibrateOn=1;
		CLRR 	33H 			//035A 	0133
		INCR	33H,1 			//035B 	09B3
		ORG		035CH
		LJUMP 	30FH 			//035C 	3B0F
		LDR 	74H,0 			//035D 	0874
		XORWI 	1H 			//035E 	2601
		BTSC 	STATUS,2 		//035F 	1503
		LJUMP 	36BH 			//0360 	3B6B
		XORWI 	3H 			//0361 	2603
		BTSC 	STATUS,2 		//0362 	1503
		LJUMP 	318H 			//0363 	3B18
		ORG		0364H
		XORWI 	1H 			//0364 	2601
		BTSC 	STATUS,2 		//0365 	1503
		LJUMP 	2F1H 			//0366 	3AF1
		XORWI 	7H 			//0367 	2607
		BTSC 	STATUS,2 		//0368 	1503
		LJUMP 	2FBH 			//0369 	3AFB
		LJUMP 	36BH 			//036A 	3B6B

		//;smartkey.C: 571: }
		//;smartkey.C: 573: if(accEna ==1){
		BCR 	STATUS,5 		//036B 	1283
		ORG		036CH
		DECRSZ 	2FH,0 		//036C 	0E2F
		LJUMP 	457H 			//036D 	3C57

		//;smartkey.C: 574: if((timeTick>tmp16) && (mtState == 1) ){
		LDR 	71H,0 			//036E 	0871
		SUBWR 	44H,0 			//036F 	0C44
		BTSS 	STATUS,2 		//0370 	1D03
		LJUMP 	374H 			//0371 	3B74
		LDR 	70H,0 			//0372 	0870
		SUBWR 	43H,0 			//0373 	0C43
		ORG		0374H
		BTSC 	STATUS,0 		//0374 	1403
		LJUMP 	40EH 			//0375 	3C0E
		DECRSZ 	74H,0 		//0376 	0E74
		LJUMP 	40EH 			//0377 	3C0E

		//;smartkey.C: 575: tmp16 = timeTick+40;
		LDR 	71H,0 			//0378 	0871
		STR 	44H 			//0379 	01C4
		LDR 	70H,0 			//037A 	0870
		STR 	43H 			//037B 	01C3
		ORG		037CH
		LDWI 	28H 			//037C 	2A28
		ADDWR 	43H,1 			//037D 	0BC3
		BTSC 	STATUS,0 		//037E 	1403
		INCR	44H,1 			//037F 	09C4

		//;smartkey.C: 576: if(AccRead(0x02,buf,6)==0){
		LDWI 	3BH 			//0380 	2A3B
		STR 	24H 			//0381 	01A4
		LDWI 	0H 			//0382 	2A00
		STR 	25H 			//0383 	01A5
		ORG		0384H
		LDWI 	6H 			//0384 	2A06
		STR 	26H 			//0385 	01A6
		LDWI 	2H 			//0386 	2A02
		LCALL 	60AH 			//0387 	360A
		IORWI 	0H 			//0388 	2500
		BTSS 	STATUS,2 		//0389 	1D03
		LJUMP 	40EH 			//038A 	3C0E

		//;smartkey.C: 578: if(compe(buf[1], (signed char)acXsum,5) && compe(buf[3], (signed char)
		//+                          acYsum,5)){
		BCR 	STATUS,5 		//038B 	1283
		ORG		038CH
		LDR 	39H,0 			//038C 	0839
		STR 	20H 			//038D 	01A0
		LDWI 	5H 			//038E 	2A05
		STR 	21H 			//038F 	01A1
		LDR 	3CH,0 			//0390 	083C
		LCALL 	549H 			//0391 	3549
		XORWI 	0H 			//0392 	2600
		BCR 	STATUS,5 		//0393 	1283
		ORG		0394H
		BTSC 	STATUS,2 		//0394 	1503
		LJUMP 	3BDH 			//0395 	3BBD
		LDR 	37H,0 			//0396 	0837
		STR 	20H 			//0397 	01A0
		LDWI 	5H 			//0398 	2A05
		STR 	21H 			//0399 	01A1
		LDR 	3EH,0 			//039A 	083E
		LCALL 	549H 			//039B 	3549
		ORG		039CH
		XORWI 	0H 			//039C 	2600

		//;smartkey.C: 580: isSw++;
		BCR 	STATUS,5 		//039D 	1283
		BTSC 	STATUS,2 		//039E 	1503
		LJUMP 	3BDH 			//039F 	3BBD
		LDWI 	2DH 			//03A0 	2A2D
		INCR	42H,1 			//03A1 	09C2

		//;smartkey.C: 581: if(isSw >44){
		SUBWR 	42H,0 			//03A2 	0C42
		BTSS 	STATUS,0 		//03A3 	1C03
		ORG		03A4H
		LJUMP 	3B0H 			//03A4 	3BB0
		LDWI 	2CH 			//03A5 	2A2C

		//;smartkey.C: 582: isSw =0;
		CLRR 	42H 			//03A6 	0142

		//;smartkey.C: 583: vibrateOn=1;
		CLRR 	33H 			//03A7 	0133
		INCR	33H,1 			//03A8 	09B3

		//;smartkey.C: 586: RegStatus &=(~0x20);
		BCR 	4AH,5 			//03A9 	12CA

		//;smartkey.C: 587: setState(2,300);
		STR 	20H 			//03AA 	01A0
		LDWI 	1H 			//03AB 	2A01
		ORG		03ACH
		STR 	21H 			//03AC 	01A1
		LDWI 	2H 			//03AD 	2A02
		LCALL 	765H 			//03AE 	3765

		//;smartkey.C: 589: }
		LJUMP 	3EDH 			//03AF 	3BED

		//;smartkey.C: 590: else if(isSw > 25){
		LDWI 	1AH 			//03B0 	2A1A
		SUBWR 	42H,0 			//03B1 	0C42
		BTSC 	STATUS,0 		//03B2 	1403

		//;smartkey.C: 591: if(isSw%2==0){
		BTSC 	42H,0 			//03B3 	1442
		ORG		03B4H
		LJUMP 	3EDH 			//03B4 	3BED

		//;smartkey.C: 592: beepOn();TMR2ON = 0; beep(7,1);
		LCALL 	786H 			//03B5 	3786
		LDWI 	7H 			//03B6 	2A07
		BCR 	STATUS,5 		//03B7 	1283
		BCR 	12H,2 			//03B8 	1112
		CLRR 	24H 			//03B9 	0124
		INCR	24H,1 			//03BA 	09A4
		LCALL 	6DAH 			//03BB 	36DA
		ORG		03BCH
		LJUMP 	3EDH 			//03BC 	3BED

		//;smartkey.C: 598: else{
		//;smartkey.C: 599: isSw =0;
		//;smartkey.C: 593: }
		//;smartkey.C: 594: }
		//;smartkey.C: 596: }
		CLRR 	42H 			//03BD 	0142

		//;smartkey.C: 602: if(compe(buf[1], acXOld,1) && compe(buf[3], acYOld,1)){
		LDR 	35H,0 			//03BE 	0835
		STR 	20H 			//03BF 	01A0
		CLRR 	21H 			//03C0 	0121
		INCR	21H,1 			//03C1 	09A1
		LDR 	3CH,0 			//03C2 	083C
		LCALL 	549H 			//03C3 	3549
		ORG		03C4H
		XORWI 	0H 			//03C4 	2600
		BCR 	STATUS,5 		//03C5 	1283
		BTSC 	STATUS,2 		//03C6 	1503
		LJUMP 	3EBH 			//03C7 	3BEB
		LDR 	34H,0 			//03C8 	0834
		STR 	20H 			//03C9 	01A0
		CLRR 	21H 			//03CA 	0121
		INCR	21H,1 			//03CB 	09A1
		ORG		03CCH
		LDR 	3EH,0 			//03CC 	083E
		LCALL 	549H 			//03CD 	3549
		XORWI 	0H 			//03CE 	2600

		//;smartkey.C: 603: isWait++;
		BCR 	STATUS,5 		//03CF 	1283
		BTSC 	STATUS,2 		//03D0 	1503
		LJUMP 	3EBH 			//03D1 	3BEB
		INCR	30H,1 			//03D2 	09B0
		BTSC 	STATUS,2 		//03D3 	1503
		ORG		03D4H
		INCR	31H,1 			//03D4 	09B1

		//;smartkey.C: 604: if(isWait==450){
		DECR 	31H,0 			//03D5 	0D31
		LDWI 	C2H 			//03D6 	2AC2
		BTSC 	STATUS,2 		//03D7 	1503
		XORWR 	30H,0 			//03D8 	0430
		BTSS 	STATUS,2 		//03D9 	1D03
		LJUMP 	3EDH 			//03DA 	3BED
		LDWI 	2H 			//03DB 	2A02
		ORG		03DCH

		//;smartkey.C: 605: isWait = 0;
		CLRR 	30H 			//03DC 	0130
		CLRR 	31H 			//03DD 	0131

		//;smartkey.C: 606: beep(7,2);
		STR 	24H 			//03DE 	01A4
		LDWI 	7H 			//03DF 	2A07
		LCALL 	6DAH 			//03E0 	36DA
		LDWI 	2CH 			//03E1 	2A2C

		//;smartkey.C: 607: vibrateOn=1;
		CLRR 	33H 			//03E2 	0133
		INCR	33H,1 			//03E3 	09B3
		ORG		03E4H

		//;smartkey.C: 608: RegStatus &=(~0x20);
		BCR 	4AH,5 			//03E4 	12CA

		//;smartkey.C: 609: setState(2,300);
		STR 	20H 			//03E5 	01A0
		LDWI 	1H 			//03E6 	2A01
		STR 	21H 			//03E7 	01A1
		LDWI 	2H 			//03E8 	2A02
		LCALL 	765H 			//03E9 	3765
		LJUMP 	3EDH 			//03EA 	3BED

		//;smartkey.C: 612: else
		//;smartkey.C: 613: isWait=0;
		CLRR 	30H 			//03EB 	0130
		ORG		03ECH
		CLRR 	31H 			//03EC 	0131

		//;smartkey.C: 614: }
		//;smartkey.C: 616: if( (buf[5] > -31) && (buf[5] < 31)) {
		LDR 	40H,0 			//03ED 	0840
		XORWI 	80H 			//03EE 	2680
		ADDWI 	9EH 			//03EF 	279E
		BTSS 	STATUS,0 		//03F0 	1C03
		LJUMP 	409H 			//03F1 	3C09
		LDR 	40H,0 			//03F2 	0840
		XORWI 	80H 			//03F3 	2680
		ORG		03F4H
		ADDWI 	61H 			//03F4 	2761
		BTSC 	STATUS,0 		//03F5 	1403
		LJUMP 	409H 			//03F6 	3C09
		LDWI 	5H 			//03F7 	2A05

		//;smartkey.C: 617: isFall++;
		INCR	32H,1 			//03F8 	09B2

		//;smartkey.C: 618: if(isFall >4){
		SUBWR 	32H,0 			//03F9 	0C32
		BTSS 	STATUS,0 		//03FA 	1C03
		LJUMP 	40AH 			//03FB 	3C0A
		ORG		03FCH
		LDWI 	2H 			//03FC 	2A02

		//;smartkey.C: 619: isFall =0;
		CLRR 	32H 			//03FD 	0132

		//;smartkey.C: 620: beep(7,2);
		STR 	24H 			//03FE 	01A4
		LDWI 	7H 			//03FF 	2A07
		LCALL 	6DAH 			//0400 	36DA
		LDWI 	2CH 			//0401 	2A2C

		//;smartkey.C: 621: RegStatus &=(~0x20);
		BCR 	4AH,5 			//0402 	12CA

		//;smartkey.C: 622: setState(2,300);
		STR 	20H 			//0403 	01A0
		ORG		0404H
		LDWI 	1H 			//0404 	2A01
		STR 	21H 			//0405 	01A1
		LDWI 	2H 			//0406 	2A02
		LCALL 	765H 			//0407 	3765
		LJUMP 	40AH 			//0408 	3C0A

		//;smartkey.C: 625: else{
		//;smartkey.C: 626: isFall=0;
		CLRR 	32H 			//0409 	0132

		//;smartkey.C: 627: }
		//;smartkey.C: 629: acYOld = buf[3];acXOld = buf[1];
		LDR 	3EH,0 			//040A 	083E
		STR 	34H 			//040B 	01B4
		ORG		040CH
		LDR 	3CH,0 			//040C 	083C
		STR 	35H 			//040D 	01B5

		//;smartkey.C: 630: }
		//;smartkey.C: 631: }
		//;smartkey.C: 634: if((timeTick>tmp16) && (mtState == 0 ) ){
		LDR 	71H,0 			//040E 	0871
		BCR 	STATUS,5 		//040F 	1283
		SUBWR 	44H,0 			//0410 	0C44
		BTSS 	STATUS,2 		//0411 	1D03
		LJUMP 	415H 			//0412 	3C15
		LDR 	70H,0 			//0413 	0870
		ORG		0414H
		SUBWR 	43H,0 			//0414 	0C43
		BTSC 	STATUS,0 		//0415 	1403
		LJUMP 	457H 			//0416 	3C57
		LDR 	74H,1 			//0417 	08F4
		BTSS 	STATUS,2 		//0418 	1D03
		LJUMP 	457H 			//0419 	3C57

		//;smartkey.C: 636: if(timeTick >65000) timeTick =0;
		LDWI 	FDH 			//041A 	2AFD
		SUBWR 	71H,0 			//041B 	0C71
		ORG		041CH
		LDWI 	E9H 			//041C 	2AE9
		BTSC 	STATUS,2 		//041D 	1503
		SUBWR 	70H,0 			//041E 	0C70
		BTSS 	STATUS,0 		//041F 	1C03
		LJUMP 	423H 			//0420 	3C23
		CLRR 	70H 			//0421 	0170
		CLRR 	71H 			//0422 	0171

		//;smartkey.C: 637: tmp16 = timeTick+40;
		LDR 	71H,0 			//0423 	0871
		ORG		0424H
		STR 	44H 			//0424 	01C4
		LDR 	70H,0 			//0425 	0870
		STR 	43H 			//0426 	01C3
		LDWI 	28H 			//0427 	2A28
		ADDWR 	43H,1 			//0428 	0BC3
		BTSC 	STATUS,0 		//0429 	1403
		INCR	44H,1 			//042A 	09C4

		//;smartkey.C: 639: if(AccRead(0x02,buf,6)==0){
		LDWI 	3BH 			//042B 	2A3B
		ORG		042CH
		STR 	24H 			//042C 	01A4
		LDWI 	0H 			//042D 	2A00
		STR 	25H 			//042E 	01A5
		LDWI 	6H 			//042F 	2A06
		STR 	26H 			//0430 	01A6
		LDWI 	2H 			//0431 	2A02
		LCALL 	60AH 			//0432 	360A
		IORWI 	0H 			//0433 	2500
		ORG		0434H

		//;smartkey.C: 641: if(vibrateOn==1){
		BCR 	STATUS,5 		//0434 	1283
		BTSS 	STATUS,2 		//0435 	1D03
		LJUMP 	458H 			//0436 	3C58
		DECRSZ 	33H,0 		//0437 	0E33
		LJUMP 	457H 			//0438 	3C57

		//;smartkey.C: 642: if(compe(buf[1],acXOld ,3) && compe(buf[3],acYOld ,3)){
		LDR 	35H,0 			//0439 	0835
		STR 	20H 			//043A 	01A0
		LDWI 	3H 			//043B 	2A03
		ORG		043CH
		STR 	21H 			//043C 	01A1
		LDR 	3CH,0 			//043D 	083C
		LCALL 	549H 			//043E 	3549
		XORWI 	0H 			//043F 	2600
		BCR 	STATUS,5 		//0440 	1283
		BTSC 	STATUS,2 		//0441 	1503
		LJUMP 	44FH 			//0442 	3C4F
		LDR 	34H,0 			//0443 	0834
		ORG		0444H
		STR 	20H 			//0444 	01A0
		LDWI 	3H 			//0445 	2A03
		STR 	21H 			//0446 	01A1
		LDR 	3EH,0 			//0447 	083E
		LCALL 	549H 			//0448 	3549
		XORWI 	0H 			//0449 	2600

		//;smartkey.C: 644: isSw=0;
		BCR 	STATUS,5 		//044A 	1283
		BTSC 	STATUS,2 		//044B 	1503
		ORG		044CH
		LJUMP 	44FH 			//044C 	3C4F
		CLRR 	42H 			//044D 	0142

		//;smartkey.C: 645: }
		LJUMP 	457H 			//044E 	3C57

		//;smartkey.C: 646: else{
		//;smartkey.C: 647: isSw++;
		INCR	42H,1 			//044F 	09C2

		//;smartkey.C: 649: {
		//;smartkey.C: 650: beepOn();TMR2ON = 0; beep(7,3);
		LCALL 	786H 			//0450 	3786
		LDWI 	3H 			//0451 	2A03
		BCR 	STATUS,5 		//0452 	1283
		BCR 	12H,2 			//0453 	1112
		ORG		0454H
		STR 	24H 			//0454 	01A4
		LDWI 	7H 			//0455 	2A07
		LCALL 	6DAH 			//0456 	36DA

		//;smartkey.C: 651: }
		//;smartkey.C: 652: }
		//;smartkey.C: 653: }
		//;smartkey.C: 654: }
		//;smartkey.C: 655: }
		//;smartkey.C: 657: }
		//;smartkey.C: 659: if(RegStatus & 0x20) {RC0 =1;RC1 =1;}
		BCR 	STATUS,5 		//0457 	1283
		BTSS 	4AH,5 			//0458 	1ECA
		LJUMP 	45DH 			//0459 	3C5D
		BSR 	7H,0 			//045A 	1807
		BSR 	7H,1 			//045B 	1887
		ORG		045CH
		LJUMP 	45FH 			//045C 	3C5F

		//;smartkey.C: 660: else {RC0 =0;RC1 =0;}
		BCR 	7H,0 			//045D 	1007
		BCR 	7H,1 			//045E 	1087

		//;smartkey.C: 663: if((timeTick >500)&&(READ_EEPROM(0x3F))) WRITE_EEPROM(0x3F,0);
		LDWI 	1H 			//045F 	2A01
		SUBWR 	71H,0 			//0460 	0C71
		LDWI 	F5H 			//0461 	2AF5
		BTSC 	STATUS,2 		//0462 	1503
		SUBWR 	70H,0 			//0463 	0C70
		ORG		0464H
		BTSS 	STATUS,0 		//0464 	1C03
		LJUMP 	46EH 			//0465 	3C6E
		LDWI 	3FH 			//0466 	2A3F
		LCALL 	758H 			//0467 	3758
		XORWI 	0H 			//0468 	2600
		BTSC 	STATUS,2 		//0469 	1503
		LJUMP 	46EH 			//046A 	3C6E
		LDWI 	3FH 			//046B 	2A3F
		ORG		046CH
		CLRR 	20H 			//046C 	0120
		LCALL 	6A7H 			//046D 	36A7

		//;smartkey.C: 664: if((timeTick >500)&&(READ_EEPROM(0x40))) WRITE_EEPROM(0x40,0);
		LDWI 	1H 			//046E 	2A01
		SUBWR 	71H,0 			//046F 	0C71
		LDWI 	F5H 			//0470 	2AF5
		BTSC 	STATUS,2 		//0471 	1503
		SUBWR 	70H,0 			//0472 	0C70
		BTSS 	STATUS,0 		//0473 	1C03
		ORG		0474H
		LJUMP 	205H 			//0474 	3A05
		LDWI 	40H 			//0475 	2A40
		LCALL 	758H 			//0476 	3758
		XORWI 	0H 			//0477 	2600
		BTSC 	STATUS,2 		//0478 	1503
		LJUMP 	205H 			//0479 	3A05
		LDWI 	40H 			//047A 	2A40
		CLRR 	20H 			//047B 	0120
		ORG		047CH
		LCALL 	6A7H 			//047C 	36A7
		LJUMP 	205H 			//047D 	3A05

		//;smartkey.C: 41: if(PAIE&&PAIF){
		BTSC 	INTCON,3 		//047E 	158B
		BTSS 	INTCON,0 		//047F 	1C0B
		LJUMP 	48FH 			//0480 	3C8F

		//;smartkey.C: 42: tmp = PORTA;
		BCR 	STATUS,5 		//0481 	1283
		LDR 	5H,0 			//0482 	0805

		//;smartkey.C: 43: PAIF = 0;
		BCR 	INTCON,0 		//0483 	100B
		ORG		0484H

		//;smartkey.C: 45: if(RA5){
		BTSS 	5H,5 			//0484 	1E85
		LJUMP 	48EH 			//0485 	3C8E

		//;smartkey.C: 47: if(mode_chek == 0){
		LDR 	73H,1 			//0486 	08F3
		BTSS 	STATUS,2 		//0487 	1D03
		LJUMP 	48FH 			//0488 	3C8F

		//;smartkey.C: 48: cntCyc = 0;
		CLRR 	72H 			//0489 	0172

		//;smartkey.C: 49: cntOff = 0;
		CLRR 	4BH 			//048A 	014B

		//;smartkey.C: 51: mode_chek = 1;
		CLRR 	73H 			//048B 	0173
		ORG		048CH
		INCR	73H,1 			//048C 	09F3
		LJUMP 	48FH 			//048D 	3C8F

		//;smartkey.C: 56: else{
		//;smartkey.C: 57: cntOff = 0;
		CLRR 	4BH 			//048E 	014B

		//;smartkey.C: 59: }
		//;smartkey.C: 60: }
		//;smartkey.C: 62: if(INTE&&INTF){
		BTSC 	INTCON,4 		//048F 	160B
		BTSS 	INTCON,1 		//0490 	1C8B
		LJUMP 	4A5H 			//0491 	3CA5

		//;smartkey.C: 63: unsigned char tmp;
		//;smartkey.C: 64: INTF = 0;
		BCR 	INTCON,1 		//0492 	108B

		//;smartkey.C: 66: if( RA2==0){
		BCR 	STATUS,5 		//0493 	1283
		ORG		0494H
		BTSC 	5H,2 			//0494 	1505
		LJUMP 	4A5H 			//0495 	3CA5

		//;smartkey.C: 68: if(timeTick <0x20){
		LDWI 	0H 			//0496 	2A00
		SUBWR 	71H,0 			//0497 	0C71
		LDWI 	20H 			//0498 	2A20
		BTSC 	STATUS,2 		//0499 	1503
		SUBWR 	70H,0 			//049A 	0C70
		BTSC 	STATUS,0 		//049B 	1403
		ORG		049CH
		LJUMP 	4A4H 			//049C 	3CA4

		//;smartkey.C: 69: tmp = READ_EEPROM(0x3F);
		LDWI 	3FH 			//049D 	2A3F
		LCALL 	779H 			//049E 	3779
		STR 	79H 			//049F 	01F9

		//;smartkey.C: 70: WRITE_EEPROM(0x3F,tmp+1);
		INCR	79H,0 			//04A0 	0979
		STR 	75H 			//04A1 	01F5
		LDWI 	3FH 			//04A2 	2A3F
		LCALL 	6C2H 			//04A3 	36C2
		ORG		04A4H
		LJUMP 	4A4H 			//04A4 	3CA4

		//;smartkey.C: 79: }
		//;smartkey.C: 81: }
		//;smartkey.C: 84: if (T0IE && T0IF) {
		BTSC 	INTCON,5 		//04A5 	168B
		BTSS 	INTCON,2 		//04A6 	1D0B
		LJUMP 	4F4H 			//04A7 	3CF4
		LDWI 	B3H 			//04A8 	2AB3

		//;smartkey.C: 85: T0IF = 0;
		BCR 	INTCON,2 		//04A9 	110B

		//;smartkey.C: 86: TMR0 = 179;
		BCR 	STATUS,5 		//04AA 	1283
		STR 	1H 			//04AB 	0181
		ORG		04ACH

		//;smartkey.C: 92: if( mode_chek == 1){
		DECRSZ 	73H,0 		//04AC 	0E73
		LJUMP 	4C6H 			//04AD 	3CC6

		//;smartkey.C: 94: cntCyc++;
		INCR	72H,1 			//04AE 	09F2

		//;smartkey.C: 96: if(RA5==0){
		BTSC 	5H,5 			//04AF 	1685
		LJUMP 	4C6H 			//04B0 	3CC6
		LDWI 	10H 			//04B1 	2A10

		//;smartkey.C: 98: cntOff++;
		INCR	4BH,1 			//04B2 	09CB

		//;smartkey.C: 100: if(cntOff > 15){
		SUBWR 	4BH,0 			//04B3 	0C4B
		ORG		04B4H
		BTSS 	STATUS,0 		//04B4 	1C03
		LJUMP 	4C6H 			//04B5 	3CC6
		LDWI 	10H 			//04B6 	2A10

		//;smartkey.C: 102: mode_chek = 0;
		CLRR 	73H 			//04B7 	0173

		//;smartkey.C: 104: if((cntCyc>15) &&(cntCyc<50)) {
		SUBWR 	72H,0 			//04B8 	0C72
		LDWI 	32H 			//04B9 	2A32
		BTSS 	STATUS,0 		//04BA 	1C03
		LJUMP 	4C2H 			//04BB 	3CC2
		ORG		04BCH
		SUBWR 	72H,0 			//04BC 	0C72
		BTSC 	STATUS,0 		//04BD 	1403
		LJUMP 	4C1H 			//04BE 	3CC1

		//;smartkey.C: 105: RegStatus |= (0x40);
		BSR 	4AH,6 			//04BF 	1B4A

		//;smartkey.C: 106: } else if (cntCyc>=50){
		LJUMP 	4C5H 			//04C0 	3CC5
		LDWI 	32H 			//04C1 	2A32
		SUBWR 	72H,0 			//04C2 	0C72
		BTSC 	STATUS,0 		//04C3 	1403
		ORG		04C4H

		//;smartkey.C: 107: RegStatus &= ~(0x40);
		BCR 	4AH,6 			//04C4 	134A

		//;smartkey.C: 108: }
		//;smartkey.C: 110: RegStatus |= 0x80;
		BSR 	4AH,7 			//04C5 	1BCA

		//;smartkey.C: 111: }
		//;smartkey.C: 112: }
		//;smartkey.C: 121: }
		//;smartkey.C: 123: timeTick++;
		INCR	70H,1 			//04C6 	09F0
		BTSC 	STATUS,2 		//04C7 	1503
		INCR	71H,1 			//04C8 	09F1

		//;smartkey.C: 125: if((mtState == 4)||(mtState == 3)){
		LDR 	74H,0 			//04C9 	0874
		XORWI 	4H 			//04CA 	2604
		BTSC 	STATUS,2 		//04CB 	1503
		ORG		04CCH
		LJUMP 	4D1H 			//04CC 	3CD1
		LDR 	74H,0 			//04CD 	0874
		XORWI 	3H 			//04CE 	2603
		BTSS 	STATUS,2 		//04CF 	1D03
		LJUMP 	4F4H 			//04D0 	3CF4

		//;smartkey.C: 126: if(timeTick > cntTmp){
		LDR 	71H,0 			//04D1 	0871
		SUBWR 	47H,0 			//04D2 	0C47
		BTSS 	STATUS,2 		//04D3 	1D03
		ORG		04D4H
		LJUMP 	4D7H 			//04D4 	3CD7
		LDR 	70H,0 			//04D5 	0870
		SUBWR 	46H,0 			//04D6 	0C46
		BTSC 	STATUS,0 		//04D7 	1403
		LJUMP 	4F4H 			//04D8 	3CF4

		//;smartkey.C: 127: cntTmp = timeTick+38;
		LDR 	71H,0 			//04D9 	0871
		STR 	47H 			//04DA 	01C7
		LDR 	70H,0 			//04DB 	0870
		ORG		04DCH
		STR 	46H 			//04DC 	01C6
		LDWI 	26H 			//04DD 	2A26
		ADDWR 	46H,1 			//04DE 	0BC6
		BTSC 	STATUS,0 		//04DF 	1403
		INCR	47H,1 			//04E0 	09C7

		//;smartkey.C: 128: if(cntTmp<=timeOut)
		LDR 	47H,0 			//04E1 	0847
		SUBWR 	49H,0 			//04E2 	0C49
		BTSS 	STATUS,2 		//04E3 	1D03
		ORG		04E4H
		LJUMP 	4E7H 			//04E4 	3CE7
		LDR 	46H,0 			//04E5 	0846
		SUBWR 	48H,0 			//04E6 	0C48

		//;smartkey.C: 129: {
		//;smartkey.C: 130: TMR2IE = 0;
		BSR 	STATUS,5 		//04E7 	1A83
		BTSS 	STATUS,0 		//04E8 	1C03
		LJUMP 	4F5H 			//04E9 	3CF5
		BCR 	CH,1 			//04EA 	108C

		//;smartkey.C: 132: if (PR2L == 20)
		LDR 	11H,0 			//04EB 	0811
		ORG		04ECH
		XORWI 	14H 			//04EC 	2614
		BTSS 	STATUS,2 		//04ED 	1D03
		LJUMP 	4F1H 			//04EE 	3CF1

		//;smartkey.C: 133: PR2L = 25;
		LDWI 	19H 			//04EF 	2A19
		LJUMP 	4F2H 			//04F0 	3CF2

		//;smartkey.C: 134: else
		//;smartkey.C: 135: PR2L = 20;
		LDWI 	14H 			//04F1 	2A14
		STR 	11H 			//04F2 	0191

		//;smartkey.C: 136: TMR2IE = 1;
		BSR 	CH,1 			//04F3 	188C
		ORG		04F4H

		//;smartkey.C: 137: }
		//;smartkey.C: 138: }
		//;smartkey.C: 139: }
		//;smartkey.C: 140: }
		//;smartkey.C: 143: if(TMR2IE&&TMR2IF)
		BSR 	STATUS,5 		//04F4 	1A83
		BTSS 	CH,1 			//04F5 	1C8C
		LJUMP 	4FDH 			//04F6 	3CFD
		BCR 	STATUS,5 		//04F7 	1283
		BTSS 	CH,1 			//04F8 	1C8C
		LJUMP 	4FDH 			//04F9 	3CFD
		LDWI 	8H 			//04FA 	2A08

		//;smartkey.C: 144: {
		//;smartkey.C: 145: TMR2IF = 0;
		BCR 	CH,1 			//04FB 	108C
		ORG		04FCH

		//;smartkey.C: 146: RA3 =~ RA3;
		XORWR 	5H,1 			//04FC 	0485
		LDR 	78H,0 			//04FD 	0878
		STR 	PCLATH 			//04FE 	018A
		SWAPR 	77H,0 			//04FF 	0777
		STR 	STATUS 			//0500 	0183
		SWAPR 	7EH,1 			//0501 	07FE
		SWAPR 	7EH,0 			//0502 	077E
		RETI		 			//0503 	0009
		ORG		0504H
		CLRR 	25H 			//0504 	0125
		BTSS 	21H,7 			//0505 	1FA1
		LJUMP 	50EH 			//0506 	3D0E
		COMR 	20H,1 			//0507 	0FA0
		COMR 	21H,1 			//0508 	0FA1
		INCR	20H,1 			//0509 	09A0
		BTSC 	STATUS,2 		//050A 	1503
		INCR	21H,1 			//050B 	09A1
		ORG		050CH
		CLRR 	25H 			//050C 	0125
		INCR	25H,1 			//050D 	09A5
		BTSS 	23H,7 			//050E 	1FA3
		LJUMP 	517H 			//050F 	3D17
		COMR 	22H,1 			//0510 	0FA2
		COMR 	23H,1 			//0511 	0FA3
		INCR	22H,1 			//0512 	09A2
		BTSC 	STATUS,2 		//0513 	1503
		ORG		0514H
		INCR	23H,1 			//0514 	09A3
		LDWI 	1H 			//0515 	2A01
		XORWR 	25H,1 			//0516 	04A5
		CLRR 	26H 			//0517 	0126
		CLRR 	27H 			//0518 	0127
		LDR 	21H,0 			//0519 	0821
		IORWR 	20H,0 			//051A 	0320
		BTSC 	STATUS,2 		//051B 	1503
		ORG		051CH
		LJUMP 	53CH 			//051C 	3D3C
		CLRR 	24H 			//051D 	0124
		INCR	24H,1 			//051E 	09A4
		BTSC 	21H,7 			//051F 	17A1
		LJUMP 	525H 			//0520 	3D25
		BCR 	STATUS,0 		//0521 	1003
		RLR 	20H,1 			//0522 	05A0
		RLR 	21H,1 			//0523 	05A1
		ORG		0524H
		LJUMP 	51EH 			//0524 	3D1E
		BCR 	STATUS,0 		//0525 	1003
		RLR 	26H,1 			//0526 	05A6
		RLR 	27H,1 			//0527 	05A7
		LDR 	21H,0 			//0528 	0821
		SUBWR 	23H,0 			//0529 	0C23
		BTSS 	STATUS,2 		//052A 	1D03
		LJUMP 	52EH 			//052B 	3D2E
		ORG		052CH
		LDR 	20H,0 			//052C 	0820
		SUBWR 	22H,0 			//052D 	0C22
		BTSS 	STATUS,0 		//052E 	1C03
		LJUMP 	538H 			//052F 	3D38
		LDR 	20H,0 			//0530 	0820
		SUBWR 	22H,1 			//0531 	0CA2
		LDR 	21H,0 			//0532 	0821
		BTSS 	STATUS,0 		//0533 	1C03
		ORG		0534H
		DECR 	23H,1 			//0534 	0DA3
		SUBWR 	23H,1 			//0535 	0CA3
		BSR 	26H,0 			//0536 	1826
		BCR 	STATUS,0 		//0537 	1003
		RRR	21H,1 			//0538 	06A1
		RRR	20H,1 			//0539 	06A0
		DECRSZ 	24H,1 		//053A 	0EA4
		LJUMP 	525H 			//053B 	3D25
		ORG		053CH
		LDR 	25H,0 			//053C 	0825
		BTSC 	STATUS,2 		//053D 	1503
		LJUMP 	544H 			//053E 	3D44
		COMR 	26H,1 			//053F 	0FA6
		COMR 	27H,1 			//0540 	0FA7
		INCR	26H,1 			//0541 	09A6
		BTSC 	STATUS,2 		//0542 	1503
		INCR	27H,1 			//0543 	09A7
		ORG		0544H
		LDR 	27H,0 			//0544 	0827
		STR 	21H 			//0545 	01A1
		LDR 	26H,0 			//0546 	0826
		STR 	20H 			//0547 	01A0
		RET		 					//0548 	0004
		STR 	27H 			//0549 	01A7

		//;smartkey.C: 210: if(a>b){
		LDR 	20H,0 			//054A 	0820
		XORWI 	80H 			//054B 	2680
		ORG		054CH
		STR 	22H 			//054C 	01A2
		LDR 	27H,0 			//054D 	0827
		XORWI 	80H 			//054E 	2680
		SUBWR 	22H,1 			//054F 	0CA2
		BTSC 	STATUS,0 		//0550 	1403
		LJUMP 	575H 			//0551 	3D75

		//;smartkey.C: 211: if((a-b)<=dt) return 1;
		LDR 	20H,0 			//0552 	0820
		SUBWR 	27H,0 			//0553 	0C27
		ORG		0554H
		STR 	22H 			//0554 	01A2
		CLRR 	23H 			//0555 	0123
		BTSS 	STATUS,0 		//0556 	1C03
		DECR 	23H,1 			//0557 	0DA3
		BTSC 	27H,7 			//0558 	17A7
		DECR 	23H,1 			//0559 	0DA3
		BTSC 	20H,7 			//055A 	17A0
		INCR	23H,1 			//055B 	09A3
		ORG		055CH
		BCR 	STATUS,5 		//055C 	1283
		LCALL 	582H 			//055D 	3582
		BTSS 	STATUS,2 		//055E 	1D03
		LJUMP 	562H 			//055F 	3D62
		LDR 	22H,0 			//0560 	0822
		SUBWR 	24H,0 			//0561 	0C24
		BTSS 	STATUS,0 		//0562 	1C03
		RETW 	0H 			//0563 	2100
		ORG		0564H
		RETW 	1H 			//0564 	2101

		//;smartkey.C: 215: if((b-a)<=dt) return 1;
		SUBWR 	20H,0 			//0565 	0C20
		STR 	22H 			//0566 	01A2
		CLRR 	23H 			//0567 	0123
		BTSS 	STATUS,0 		//0568 	1C03
		DECR 	23H,1 			//0569 	0DA3
		BTSC 	20H,7 			//056A 	17A0
		DECR 	23H,1 			//056B 	0DA3
		ORG		056CH
		BTSC 	27H,7 			//056C 	17A7
		INCR	23H,1 			//056D 	09A3
		BCR 	STATUS,5 		//056E 	1283
		LCALL 	582H 			//056F 	3582
		BTSS 	STATUS,2 		//0570 	1D03
		LJUMP 	562H 			//0571 	3D62
		LDR 	22H,0 			//0572 	0822
		SUBWR 	24H,0 			//0573 	0C24
		ORG		0574H
		LJUMP 	562H 			//0574 	3D62

		//;smartkey.C: 212: else return 0;
		//;smartkey.C: 214: else if(a<b){
		LDR 	27H,0 			//0575 	0827
		XORWI 	80H 			//0576 	2680
		STR 	22H 			//0577 	01A2
		LDR 	20H,0 			//0578 	0820
		XORWI 	80H 			//0579 	2680
		SUBWR 	22H,1 			//057A 	0CA2

		//;smartkey.C: 218: else if(a==b){
		LDR 	27H,0 			//057B 	0827
		ORG		057CH
		BTSS 	STATUS,0 		//057C 	1C03
		LJUMP 	565H 			//057D 	3D65
		XORWR 	20H,0 			//057E 	0420
		BTSC 	STATUS,2 		//057F 	1503
		RETW 	1H 			//0580 	2101
		RETW 	0H 			//0581 	2100
		LDR 	21H,0 			//0582 	0821
		STR 	24H 			//0583 	01A4
		ORG		0584H
		CLRR 	25H 			//0584 	0125
		BTSC 	24H,7 			//0585 	17A4
		DECR 	25H,1 			//0586 	0DA5
		LDR 	25H,0 			//0587 	0825
		XORWI 	80H 			//0588 	2680
		STR 	26H 			//0589 	01A6
		LDR 	23H,0 			//058A 	0823
		XORWI 	80H 			//058B 	2680
		ORG		058CH
		SUBWR 	26H,0 			//058C 	0C26
		RET		 					//058D 	0004

		//;mpu6x.c: 24: else
		//;mpu6x.c: 25: return 1;
		//;mpu6x.c: 21: else
		//;mpu6x.c: 22: return 2;
		BCR 	STATUS,5 		//058E 	1283
		STR 	21H 			//058F 	01A1
		CLRR 	22H 			//0590 	0122

		//;SWI2C.C: 115: RA7 = 0;
		BCR 	5H,7 			//0591 	1385

		//;SWI2C.C: 116: TRISA |=0x40;;
		BSR 	STATUS,5 		//0592 	1A83
		BSR 	5H,6 			//0593 	1B05
		ORG		0594H

		//;SWI2C.C: 117: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0594 	2A05
		BCR 	STATUS,5 		//0595 	1283
		STR 	20H 			//0596 	01A0
		DECRSZ 	20H,1 		//0597 	0EA0
		LJUMP 	597H 			//0598 	3D97

		//;SWI2C.C: 118: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//0599 	1283
		CLRR 	23H 			//059A 	0123
		LDWI 	5H 			//059B 	2A05
		ORG		059CH

		//;SWI2C.C: 119: {
		//;SWI2C.C: 120: RA7 = 1;
		BSR 	5H,7 			//059C 	1B85

		//;SWI2C.C: 121: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//059D 	01A0
		DECRSZ 	20H,1 		//059E 	0EA0
		LJUMP 	59EH 			//059F 	3D9E

		//;SWI2C.C: 122: dat = dat<<1 |(RA6 & 1 );
		LDWI 	0H 			//05A0 	2A00
		BCR 	STATUS,5 		//05A1 	1283
		BTSC 	5H,6 			//05A2 	1705
		LDWI 	1H 			//05A3 	2A01
		ORG		05A4H
		ANDWI 	1H 			//05A4 	2401
		STR 	20H 			//05A5 	01A0
		BCR 	STATUS,0 		//05A6 	1003
		RLR 	22H,0 			//05A7 	0522
		IORWR 	20H,0 			//05A8 	0320
		STR 	22H 			//05A9 	01A2
		LDWI 	5H 			//05AA 	2A05

		//;SWI2C.C: 125: RA7 = 0;
		BCR 	5H,7 			//05AB 	1385
		ORG		05ACH

		//;SWI2C.C: 126: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05AC 	01A0
		DECRSZ 	20H,1 		//05AD 	0EA0
		LJUMP 	5ADH 			//05AE 	3DAD
		LDWI 	8H 			//05AF 	2A08
		BCR 	STATUS,5 		//05B0 	1283
		INCR	23H,1 			//05B1 	09A3
		SUBWR 	23H,0 			//05B2 	0C23
		BTSS 	STATUS,0 		//05B3 	1C03
		ORG		05B4H
		LJUMP 	59BH 			//05B4 	3D9B

		//;SWI2C.C: 127: }
		//;SWI2C.C: 129: TRISA &=0xbf;;
		BSR 	STATUS,5 		//05B5 	1A83
		BCR 	5H,6 			//05B6 	1305

		//;SWI2C.C: 131: RA6 = (Ack) ? 0 : 1;
		BCR 	STATUS,5 		//05B7 	1283
		LDR 	21H,1 			//05B8 	08A1
		BCR 	STATUS,5 		//05B9 	1283
		BTSS 	STATUS,2 		//05BA 	1D03
		LJUMP 	5BEH 			//05BB 	3DBE
		ORG		05BCH
		BSR 	5H,6 			//05BC 	1B05
		LJUMP 	5BFH 			//05BD 	3DBF
		BCR 	5H,6 			//05BE 	1305
		LDWI 	5H 			//05BF 	2A05

		//;SWI2C.C: 132: RA7 = 1;
		BSR 	5H,7 			//05C0 	1B85

		//;SWI2C.C: 133: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05C1 	01A0
		DECRSZ 	20H,1 		//05C2 	0EA0
		LJUMP 	5C2H 			//05C3 	3DC2
		ORG		05C4H
		LDWI 	5H 			//05C4 	2A05

		//;SWI2C.C: 134: RA7 = 0;
		BCR 	STATUS,5 		//05C5 	1283
		BCR 	5H,7 			//05C6 	1385

		//;SWI2C.C: 135: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05C7 	01A0
		DECRSZ 	20H,1 		//05C8 	0EA0
		LJUMP 	5C8H 			//05C9 	3DC8

		//;SWI2C.C: 136: return dat;
		BCR 	STATUS,5 		//05CA 	1283
		LDR 	22H,0 			//05CB 	0822
		ORG		05CCH
		RET		 					//05CC 	0004
		BCR 	STATUS,5 		//05CD 	1283
		STR 	21H 			//05CE 	01A1

		//;SWI2C.C: 89: TRISA &=0xbf;;
		BSR 	STATUS,5 		//05CF 	1A83
		BCR 	5H,6 			//05D0 	1305

		//;SWI2C.C: 90: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05D1 	2A05
		BCR 	STATUS,5 		//05D2 	1283
		STR 	20H 			//05D3 	01A0
		ORG		05D4H
		DECRSZ 	20H,1 		//05D4 	0EA0
		LJUMP 	5D4H 			//05D5 	3DD4

		//;SWI2C.C: 91: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//05D6 	1283
		CLRR 	22H 			//05D7 	0122

		//;SWI2C.C: 92: {
		//;SWI2C.C: 93: RA6 = (dat&0x80) ? 1:0;
		BTSS 	21H,7 			//05D8 	1FA1
		LJUMP 	5DDH 			//05D9 	3DDD
		BCR 	STATUS,5 		//05DA 	1283
		BSR 	5H,6 			//05DB 	1B05
		ORG		05DCH
		LJUMP 	5DFH 			//05DC 	3DDF
		BCR 	STATUS,5 		//05DD 	1283
		BCR 	5H,6 			//05DE 	1305
		LDWI 	5H 			//05DF 	2A05

		//;SWI2C.C: 94: dat<<=1;
		BCR 	STATUS,0 		//05E0 	1003
		RLR 	21H,1 			//05E1 	05A1

		//;SWI2C.C: 95: RA7 = 1;
		BSR 	5H,7 			//05E2 	1B85

		//;SWI2C.C: 96: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05E3 	01A0
		ORG		05E4H
		DECRSZ 	20H,1 		//05E4 	0EA0
		LJUMP 	5E4H 			//05E5 	3DE4
		LDWI 	5H 			//05E6 	2A05

		//;SWI2C.C: 97: RA7 = 0;
		BCR 	STATUS,5 		//05E7 	1283
		BCR 	5H,7 			//05E8 	1385

		//;SWI2C.C: 98: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05E9 	01A0
		DECRSZ 	20H,1 		//05EA 	0EA0
		LJUMP 	5EAH 			//05EB 	3DEA
		ORG		05ECH
		LDWI 	8H 			//05EC 	2A08
		BCR 	STATUS,5 		//05ED 	1283
		INCR	22H,1 			//05EE 	09A2
		SUBWR 	22H,0 			//05EF 	0C22
		BTSS 	STATUS,0 		//05F0 	1C03
		LJUMP 	5D8H 			//05F1 	3DD8

		//;SWI2C.C: 99: }
		//;SWI2C.C: 101: TRISA |=0x40;;
		BSR 	STATUS,5 		//05F2 	1A83
		BSR 	5H,6 			//05F3 	1B05
		ORG		05F4H

		//;SWI2C.C: 102: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05F4 	2A05
		BCR 	STATUS,5 		//05F5 	1283
		STR 	20H 			//05F6 	01A0
		DECRSZ 	20H,1 		//05F7 	0EA0
		LJUMP 	5F7H 			//05F8 	3DF7
		LDWI 	5H 			//05F9 	2A05

		//;SWI2C.C: 103: RA7 = 1;
		BCR 	STATUS,5 		//05FA 	1283
		BSR 	5H,7 			//05FB 	1B85
		ORG		05FCH

		//;SWI2C.C: 104: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05FC 	01A0
		DECRSZ 	20H,1 		//05FD 	0EA0
		LJUMP 	5FDH 			//05FE 	3DFD

		//;SWI2C.C: 105: i= RA6;
		LDWI 	0H 			//05FF 	2A00
		BCR 	STATUS,5 		//0600 	1283
		BTSC 	5H,6 			//0601 	1705
		LDWI 	1H 			//0602 	2A01
		STR 	22H 			//0603 	01A2
		ORG		0604H

		//;SWI2C.C: 106: RA7 = 0;
		BCR 	5H,7 			//0604 	1385

		//;SWI2C.C: 107: TRISA &=0xbf;;
		BSR 	STATUS,5 		//0605 	1A83
		BCR 	5H,6 			//0606 	1305

		//;SWI2C.C: 108: return i;
		BCR 	STATUS,5 		//0607 	1283
		LDR 	22H,0 			//0608 	0822
		RET		 					//0609 	0004
		STR 	2AH 			//060A 	01AA

		//;mpu6x.c: 32: unsigned char i;
		//;mpu6x.c: 34: swI2C_Start();
		LCALL 	706H 			//060B 	3706
		ORG		060CH

		//;mpu6x.c: 36: if(swI2C_WriteByte(0x18<<1)== 0 )
		LDWI 	30H 			//060C 	2A30
		LCALL 	5CDH 			//060D 	35CD
		IORWI 	0H 			//060E 	2500
		BTSS 	STATUS,2 		//060F 	1D03
		RETW 	1H 			//0610 	2101

		//;mpu6x.c: 37: {
		//;mpu6x.c: 38: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	2AH,0 			//0611 	082A
		LCALL 	5CDH 			//0612 	35CD
		IORWI 	0H 			//0613 	2500
		ORG		0614H
		BTSS 	STATUS,2 		//0614 	1D03
		RETW 	2H 			//0615 	2102

		//;mpu6x.c: 39: {
		//;mpu6x.c: 40: swI2C_Start();
		LCALL 	706H 			//0616 	3706

		//;mpu6x.c: 41: if(swI2C_WriteByte((0x18<<1)|1)== 0 ){
		LDWI 	31H 			//0617 	2A31
		LCALL 	5CDH 			//0618 	35CD
		IORWI 	0H 			//0619 	2500
		BTSS 	STATUS,2 		//061A 	1D03
		RETW 	1H 			//061B 	2101
		ORG		061CH

		//;mpu6x.c: 43: for(i=0; i<(len-1);i++){
		CLRR 	2BH 			//061C 	012B
		LDR 	26H,0 			//061D 	0826
		ADDWI 	FFH 			//061E 	27FF
		STR 	27H 			//061F 	01A7
		LDWI 	FFH 			//0620 	2AFF
		BTSC 	STATUS,0 		//0621 	1403
		LDWI 	0H 			//0622 	2A00
		STR 	28H 			//0623 	01A8
		ORG		0624H
		XORWI 	80H 			//0624 	2680
		SUBWI 	80H 			//0625 	2880
		BTSS 	STATUS,2 		//0626 	1D03
		LJUMP 	62AH 			//0627 	3E2A
		LDR 	27H,0 			//0628 	0827
		SUBWR 	2BH,0 			//0629 	0C2B

		//;mpu6x.c: 44: dat[i]=swI2C_ReadByte(1);
		LDWI 	1H 			//062A 	2A01
		BTSC 	STATUS,0 		//062B 	1403
		ORG		062CH
		LJUMP 	631H 			//062C 	3E31
		LCALL 	58EH 			//062D 	358E
		LCALL 	635H 			//062E 	3635
		INCR	2BH,1 			//062F 	09AB
		LJUMP 	61DH 			//0630 	3E1D

		//;mpu6x.c: 45: }
		//;mpu6x.c: 46: dat[i]=swI2C_ReadByte(1);
		LCALL 	58EH 			//0631 	358E
		LCALL 	635H 			//0632 	3635

		//;mpu6x.c: 47: swI2C_Stop();
		LCALL 	74BH 			//0633 	374B
		ORG		0634H

		//;mpu6x.c: 48: return 0;
		RETW 	0H 			//0634 	2100

		//;mpu6x.c: 54: else
		//;mpu6x.c: 55: return 2;
		//;mpu6x.c: 51: else
		//;mpu6x.c: 52: return 1;
		STR 	27H 			//0635 	01A7
		LDR 	2BH,0 			//0636 	082B
		ADDWR 	24H,0 			//0637 	0B24
		STR 	28H 			//0638 	01A8
		LDR 	25H,0 			//0639 	0825
		BTSC 	STATUS,0 		//063A 	1403
		ADDWI 	1H 			//063B 	2701
		ORG		063CH
		STR 	29H 			//063C 	01A9
		LDR 	28H,0 			//063D 	0828
		STR 	FSR 			//063E 	0184
		BCR 	STATUS,7 		//063F 	1383
		BTSC 	29H,0 			//0640 	1429
		BSR 	STATUS,7 		//0641 	1B83
		LDR 	27H,0 			//0642 	0827
		STR 	INDF 			//0643 	0180
		ORG		0644H
		RET		 					//0644 	0004
		STR 	28H 			//0645 	01A8

		//;mpu6x.c: 5: unsigned char i;
		//;mpu6x.c: 6: swI2C_Start();
		LCALL 	706H 			//0646 	3706

		//;mpu6x.c: 8: if(swI2C_WriteByte(0x18<<1)== 0 )
		LDWI 	30H 			//0647 	2A30
		LCALL 	5CDH 			//0648 	35CD
		IORWI 	0H 			//0649 	2500
		BTSS 	STATUS,2 		//064A 	1D03
		RETW 	1H 			//064B 	2101
		ORG		064CH

		//;mpu6x.c: 9: {
		//;mpu6x.c: 10: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	28H,0 			//064C 	0828
		LCALL 	5CDH 			//064D 	35CD
		IORWI 	0H 			//064E 	2500
		BTSS 	STATUS,2 		//064F 	1D03
		RETW 	2H 			//0650 	2102

		//;mpu6x.c: 11: {
		//;mpu6x.c: 12: for(i=0; i<len;i++){
		CLRR 	29H 			//0651 	0129
		LDR 	25H,0 			//0652 	0825
		SUBWR 	29H,0 			//0653 	0C29
		ORG		0654H
		BTSC 	STATUS,0 		//0654 	1403
		LJUMP 	66BH 			//0655 	3E6B

		//;mpu6x.c: 13: if(swI2C_WriteByte(dat[i])==1 ){
		LDR 	29H,0 			//0656 	0829
		ADDWR 	23H,0 			//0657 	0B23
		STR 	26H 			//0658 	01A6
		LDR 	24H,0 			//0659 	0824
		BTSC 	STATUS,0 		//065A 	1403
		ADDWI 	1H 			//065B 	2701
		ORG		065CH
		STR 	27H 			//065C 	01A7
		LDR 	26H,0 			//065D 	0826
		STR 	FSR 			//065E 	0184
		BSR 	STATUS,7 		//065F 	1B83
		BTSS 	27H,0 			//0660 	1C27
		BCR 	STATUS,7 		//0661 	1383
		LDR 	INDF,0 			//0662 	0800
		LCALL 	5CDH 			//0663 	35CD
		ORG		0664H
		XORWI 	1H 			//0664 	2601
		BTSS 	STATUS,2 		//0665 	1D03
		LJUMP 	669H 			//0666 	3E69

		//;mpu6x.c: 14: swI2C_Stop();
		LCALL 	74BH 			//0667 	374B

		//;mpu6x.c: 15: return 3;
		RETW 	3H 			//0668 	2103
		INCR	29H,1 			//0669 	09A9
		LJUMP 	652H 			//066A 	3E52

		//;mpu6x.c: 16: }
		//;mpu6x.c: 17: }
		//;mpu6x.c: 18: swI2C_Stop();
		LCALL 	74BH 			//066B 	374B
		ORG		066CH

		//;mpu6x.c: 19: return 0;
		RETW 	0H 			//066C 	2100

		//;SWI2C.C: 10: TRISA &=0xbf;;
		BSR 	STATUS,5 		//066D 	1A83
		BCR 	5H,6 			//066E 	1305

		//;SWI2C.C: 11: TRISA &=0x7f;;
		BCR 	5H,7 			//066F 	1385

		//;SWI2C.C: 12: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0670 	2A05
		BCR 	STATUS,5 		//0671 	1283
		STR 	20H 			//0672 	01A0
		DECRSZ 	20H,1 		//0673 	0EA0
		ORG		0674H
		LJUMP 	673H 			//0674 	3E73
		LDWI 	5H 			//0675 	2A05

		//;SWI2C.C: 13: RA7 = 1;
		BCR 	STATUS,5 		//0676 	1283
		BSR 	5H,7 			//0677 	1B85
		BSR 	5H,6 			//0678 	1B05

		//;SWI2C.C: 15: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0679 	01A0
		DECRSZ 	20H,1 		//067A 	0EA0
		LJUMP 	67AH 			//067B 	3E7A
		ORG		067CH

		//;SWI2C.C: 16: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//067C 	2A05
		BCR 	STATUS,5 		//067D 	1283
		STR 	20H 			//067E 	01A0
		DECRSZ 	20H,1 		//067F 	0EA0
		LJUMP 	67FH 			//0680 	3E7F

		//;SWI2C.C: 17: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0681 	2A05
		BCR 	STATUS,5 		//0682 	1283
		STR 	20H 			//0683 	01A0
		ORG		0684H
		DECRSZ 	20H,1 		//0684 	0EA0
		LJUMP 	684H 			//0685 	3E84

		//;SWI2C.C: 18: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0686 	2A05
		BCR 	STATUS,5 		//0687 	1283
		STR 	20H 			//0688 	01A0
		DECRSZ 	20H,1 		//0689 	0EA0
		LJUMP 	689H 			//068A 	3E89
		RET		 					//068B 	0004
		ORG		068CH

		//;sysinit.c: 88: INTCON = 0B00000000;
		CLRR 	INTCON 			//068C 	010B

		//;sysinit.c: 89: PIE1 = 0B00000000;
		BSR 	STATUS,5 		//068D 	1A83
		CLRR 	CH 			//068E 	010C

		//;sysinit.c: 90: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//068F 	1283
		CLRR 	CH 			//0690 	010C

		//;sysinit.c: 92: IOCA5 = 1;
		BSR 	STATUS,5 		//0691 	1A83
		BSR 	16H,5 			//0692 	1A96

		//;sysinit.c: 93: tmp = PORTA;
		BCR 	STATUS,5 		//0693 	1283
		ORG		0694H
		LDR 	5H,0 			//0694 	0805

		//;sysinit.c: 94: PAIF = 0;
		BCR 	INTCON,0 		//0695 	100B

		//;sysinit.c: 95: PAIE = 0;
		BCR 	INTCON,3 		//0696 	118B

		//;sysinit.c: 98: INTEDG = 0;
		BSR 	STATUS,5 		//0697 	1A83
		BCR 	1H,6 			//0698 	1301

		//;sysinit.c: 99: INTF = 0;
		BCR 	INTCON,1 		//0699 	108B

		//;sysinit.c: 100: INTE = 1;
		BSR 	INTCON,4 		//069A 	1A0B

		//;sysinit.c: 102: TMR2IF = 0;
		BCR 	STATUS,5 		//069B 	1283
		ORG		069CH
		BCR 	CH,1 			//069C 	108C

		//;sysinit.c: 103: TMR2IE = 1;
		BSR 	STATUS,5 		//069D 	1A83
		BSR 	CH,1 			//069E 	188C

		//;sysinit.c: 104: TMR2ON = 0;
		BCR 	STATUS,5 		//069F 	1283
		BCR 	12H,2 			//06A0 	1112

		//;sysinit.c: 110: T0IF = 0;
		BCR 	INTCON,2 		//06A1 	110B

		//;sysinit.c: 111: T0IE = 1;
		BSR 	INTCON,5 		//06A2 	1A8B

		//;sysinit.c: 112: T0ON = 1;
		BSR 	1FH,3 			//06A3 	199F
		ORG		06A4H

		//;sysinit.c: 114: PEIE = 1;
		BSR 	INTCON,6 		//06A4 	1B0B

		//;sysinit.c: 116: GIE = 1;
		BSR 	INTCON,7 		//06A5 	1B8B
		RET		 					//06A6 	0004
		STR 	21H 			//06A7 	01A1

		//;smartkey.C: 190: GIE = 0;
		BCR 	INTCON,7 		//06A8 	138B

		//;smartkey.C: 191: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//06A9 	1F8B
		LJUMP 	6ADH 			//06AA 	3EAD
		CLRWDT	 			//06AB 	0001
		ORG		06ACH
		LJUMP 	6A9H 			//06AC 	3EA9

		//;smartkey.C: 192: EEADR = EEAddr;
		BCR 	STATUS,5 		//06AD 	1283
		LDR 	21H,0 			//06AE 	0821
		BSR 	STATUS,5 		//06AF 	1A83
		STR 	1BH 			//06B0 	019B

		//;smartkey.C: 193: EEDAT = EEData;
		BCR 	STATUS,5 		//06B1 	1283
		LDR 	20H,0 			//06B2 	0820
		BSR 	STATUS,5 		//06B3 	1A83
		ORG		06B4H
		STR 	1AH 			//06B4 	019A
		LDWI 	34H 			//06B5 	2A34

		//;smartkey.C: 194: EEIF = 0;
		BCR 	STATUS,5 		//06B6 	1283
		BCR 	CH,7 			//06B7 	138C

		//;smartkey.C: 195: EECON1 = 0x34;
		BSR 	STATUS,5 		//06B8 	1A83
		STR 	1CH 			//06B9 	019C

		//;smartkey.C: 196: WR = 1;
		BSR 	1DH,0 			//06BA 	181D

		//;smartkey.C: 197: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//06BB 	1A83
		ORG		06BCH
		BTSS 	1DH,0 			//06BC 	1C1D
		LJUMP 	6C0H 			//06BD 	3EC0
		CLRWDT	 			//06BE 	0001
		LJUMP 	6BBH 			//06BF 	3EBB

		//;smartkey.C: 199: GIE = 1;
		BSR 	INTCON,7 		//06C0 	1B8B
		RET		 					//06C1 	0004
		STR 	76H 			//06C2 	01F6

		//;smartkey.C: 190: GIE = 0;
		BCR 	INTCON,7 		//06C3 	138B
		ORG		06C4H

		//;smartkey.C: 191: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//06C4 	1F8B
		LJUMP 	6C8H 			//06C5 	3EC8
		CLRWDT	 			//06C6 	0001
		LJUMP 	6C4H 			//06C7 	3EC4

		//;smartkey.C: 192: EEADR = EEAddr;
		LDR 	76H,0 			//06C8 	0876
		BSR 	STATUS,5 		//06C9 	1A83
		STR 	1BH 			//06CA 	019B

		//;smartkey.C: 193: EEDAT = EEData;
		LDR 	75H,0 			//06CB 	0875
		ORG		06CCH
		STR 	1AH 			//06CC 	019A
		LDWI 	34H 			//06CD 	2A34

		//;smartkey.C: 194: EEIF = 0;
		BCR 	STATUS,5 		//06CE 	1283
		BCR 	CH,7 			//06CF 	138C

		//;smartkey.C: 195: EECON1 = 0x34;
		BSR 	STATUS,5 		//06D0 	1A83
		STR 	1CH 			//06D1 	019C

		//;smartkey.C: 196: WR = 1;
		BSR 	1DH,0 			//06D2 	181D

		//;smartkey.C: 197: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//06D3 	1A83
		ORG		06D4H
		BTSS 	1DH,0 			//06D4 	1C1D
		LJUMP 	6D8H 			//06D5 	3ED8
		CLRWDT	 			//06D6 	0001
		LJUMP 	6D3H 			//06D7 	3ED3

		//;smartkey.C: 199: GIE = 1;
		BSR 	INTCON,7 		//06D8 	1B8B
		RET		 					//06D9 	0004
		STR 	25H 			//06DA 	01A5

		//;smartkey.C: 163: {
		//;smartkey.C: 164: while(rep--){
		DECR 	24H,1 			//06DB 	0DA4
		ORG		06DCH
		LDR 	24H,0 			//06DC 	0824
		XORWI 	FFH 			//06DD 	26FF
		BTSC 	STATUS,2 		//06DE 	1503
		RET		 					//06DF 	0004
		LDWI 	CH 			//06E0 	2A0C

		//;smartkey.C: 165: TMR2ON = 1;
		BSR 	12H,2 			//06E1 	1912

		//;smartkey.C: 166: PR2L = 12;
		BSR 	STATUS,5 		//06E2 	1A83
		STR 	11H 			//06E3 	0191
		ORG		06E4H

		//;smartkey.C: 167: delay_x10ms(delay);
		BCR 	STATUS,5 		//06E4 	1283
		LDR 	25H,0 			//06E5 	0825
		STR 	20H 			//06E6 	01A0
		CLRR 	21H 			//06E7 	0121
		LCALL 	719H 			//06E8 	3719
		LDWI 	14H 			//06E9 	2A14

		//;smartkey.C: 169: TMR2ON = 0;RA3 =0;
		BCR 	12H,2 			//06EA 	1112
		BCR 	5H,3 			//06EB 	1185
		ORG		06ECH

		//;smartkey.C: 170: delay_x10ms(20);
		STR 	20H 			//06EC 	01A0
		CLRR 	21H 			//06ED 	0121
		LCALL 	719H 			//06EE 	3719
		LJUMP 	6DBH 			//06EF 	3EDB

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//06F0 	1283
		CLRR 	5H 			//06F1 	0105

		//;sysinit.c: 35: TRISA = 0B00110111;
		LDWI 	37H 			//06F2 	2A37
		BSR 	STATUS,5 		//06F3 	1A83
		ORG		06F4H
		STR 	5H 			//06F4 	0185

		//;sysinit.c: 36: WPUA = 0B11000000;
		LDWI 	C0H 			//06F5 	2AC0
		STR 	15H 			//06F6 	0195

		//;sysinit.c: 38: PORTC = 0B00000000;
		BCR 	STATUS,5 		//06F7 	1283
		CLRR 	7H 			//06F8 	0107

		//;sysinit.c: 39: TRISC = 0B11111100;
		LDWI 	FCH 			//06F9 	2AFC
		BSR 	STATUS,5 		//06FA 	1A83
		STR 	7H 			//06FB 	0187
		ORG		06FCH

		//;sysinit.c: 40: WPUC = 0B00000000;
		CLRR 	13H 			//06FC 	0113

		//;sysinit.c: 42: PSRCA = 0B11111111;
		LDWI 	FFH 			//06FD 	2AFF
		STR 	8H 			//06FE 	0188

		//;sysinit.c: 43: PSRCC = 0B11111111;
		STR 	14H 			//06FF 	0194

		//;sysinit.c: 44: PSINKA = 0B11111111;
		STR 	17H 			//0700 	0197

		//;sysinit.c: 45: PSINKC = 0B11111111;
		STR 	1FH 			//0701 	019F

		//;sysinit.c: 47: MSCON = 0B00110000;
		LDWI 	30H 			//0702 	2A30
		BCR 	STATUS,5 		//0703 	1283
		ORG		0704H
		STR 	1BH 			//0704 	019B
		RET		 					//0705 	0004
		LDWI 	5H 			//0706 	2A05

		//;SWI2C.C: 24: RA7 = 1;
		BSR 	5H,7 			//0707 	1B85

		//;SWI2C.C: 26: RA6 = 1;
		BSR 	5H,6 			//0708 	1B05

		//;SWI2C.C: 27: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0709 	01A0
		DECRSZ 	20H,1 		//070A 	0EA0
		LJUMP 	70AH 			//070B 	3F0A
		ORG		070CH
		LDWI 	5H 			//070C 	2A05

		//;SWI2C.C: 28: RA6 = 0;
		BCR 	STATUS,5 		//070D 	1283
		BCR 	5H,6 			//070E 	1305

		//;SWI2C.C: 29: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//070F 	01A0
		DECRSZ 	20H,1 		//0710 	0EA0
		LJUMP 	710H 			//0711 	3F10
		LDWI 	5H 			//0712 	2A05

		//;SWI2C.C: 30: RA7 = 0;
		BCR 	STATUS,5 		//0713 	1283
		ORG		0714H
		BCR 	5H,7 			//0714 	1385

		//;SWI2C.C: 31: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0715 	01A0
		DECRSZ 	20H,1 		//0716 	0EA0
		LJUMP 	716H 			//0717 	3F16
		RET		 					//0718 	0004

		//;smartkey.C: 151: unsigned int set = t + timeTick;
		LDR 	21H,0 			//0719 	0821
		STR 	23H 			//071A 	01A3
		LDR 	20H,0 			//071B 	0820
		ORG		071CH
		STR 	22H 			//071C 	01A2
		LDR 	70H,0 			//071D 	0870
		ADDWR 	22H,1 			//071E 	0BA2
		BTSC 	STATUS,0 		//071F 	1403
		INCR	23H,1 			//0720 	09A3
		LDR 	71H,0 			//0721 	0871
		ADDWR 	23H,1 			//0722 	0BA3

		//;smartkey.C: 152: while(timeTick < set);
		LDR 	23H,0 			//0723 	0823
		ORG		0724H
		SUBWR 	71H,0 			//0724 	0C71
		BTSS 	STATUS,2 		//0725 	1D03
		LJUMP 	729H 			//0726 	3F29
		LDR 	22H,0 			//0727 	0822
		SUBWR 	70H,0 			//0728 	0C70
		BTSC 	STATUS,0 		//0729 	1403
		RET		 					//072A 	0004
		LJUMP 	723H 			//072B 	3F23
		ORG		072CH

		//;sysinit.c: 60: T0CON0 = 0B00000000;
		CLRR 	1FH 			//072C 	011F

		//;sysinit.c: 61: OPTION = 0B00000111;
		LDWI 	7H 			//072D 	2A07
		BSR 	STATUS,5 		//072E 	1A83
		STR 	1H 			//072F 	0181

		//;sysinit.c: 62: TMR0 = 179;
		LDWI 	B3H 			//0730 	2AB3
		BCR 	STATUS,5 		//0731 	1283
		STR 	1H 			//0732 	0181

		//;sysinit.c: 64: TMR2H = 0;
		CLRR 	13H 			//0733 	0113
		ORG		0734H

		//;sysinit.c: 65: TMR2L = 0;
		CLRR 	11H 			//0734 	0111

		//;sysinit.c: 66: PR2H = 0;
		BSR 	STATUS,5 		//0735 	1A83
		CLRR 	12H 			//0736 	0112

		//;sysinit.c: 67: PR2L =0;
		CLRR 	11H 			//0737 	0111

		//;sysinit.c: 68: T2CON0 = 0B00101001;
		LDWI 	29H 			//0738 	2A29
		BCR 	STATUS,5 		//0739 	1283
		STR 	12H 			//073A 	0192
		RET		 					//073B 	0004
		ORG		073CH
		CLRR 	70H 			//073C 	0170
		CLRR 	71H 			//073D 	0171
		CLRR 	72H 			//073E 	0172
		CLRR 	73H 			//073F 	0173
		CLRR 	74H 			//0740 	0174
		CLRR 	46H 			//0741 	0146
		CLRR 	47H 			//0742 	0147
		CLRR 	48H 			//0743 	0148
		ORG		0744H
		CLRR 	49H 			//0744 	0149
		CLRR 	4AH 			//0745 	014A
		CLRR 	4BH 			//0746 	014B
		CLRR 	4CH 			//0747 	014C
		CLRR 	4DH 			//0748 	014D
		CLRR 	STATUS 			//0749 	0103
		LJUMP 	0BH 			//074A 	380B
		LDWI 	5H 			//074B 	2A05
		ORG		074CH

		//;SWI2C.C: 37: RA6 = 0;
		BCR 	5H,6 			//074C 	1305

		//;SWI2C.C: 38: RA7 = 1;
		BSR 	5H,7 			//074D 	1B85

		//;SWI2C.C: 39: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//074E 	01A0
		DECRSZ 	20H,1 		//074F 	0EA0
		LJUMP 	74FH 			//0750 	3F4F
		LDWI 	5H 			//0751 	2A05

		//;SWI2C.C: 40: RA6 = 1;
		BCR 	STATUS,5 		//0752 	1283
		BSR 	5H,6 			//0753 	1B05
		ORG		0754H

		//;SWI2C.C: 41: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0754 	01A0
		DECRSZ 	20H,1 		//0755 	0EA0
		LJUMP 	755H 			//0756 	3F55
		RET		 					//0757 	0004
		BCR 	STATUS,5 		//0758 	1283
		STR 	20H 			//0759 	01A0

		//;smartkey.C: 179: unsigned char ReEepromData;
		//;smartkey.C: 181: EEADR = EEAddr;
		BSR 	STATUS,5 		//075A 	1A83
		STR 	1BH 			//075B 	019B
		ORG		075CH

		//;smartkey.C: 182: RD = 1;
		BSR 	1CH,0 			//075C 	181C

		//;smartkey.C: 183: ReEepromData = EEDAT;
		LDR 	1AH,0 			//075D 	081A
		BCR 	STATUS,5 		//075E 	1283
		STR 	21H 			//075F 	01A1

		//;smartkey.C: 184: RD = 0;
		BSR 	STATUS,5 		//0760 	1A83
		BCR 	1CH,0 			//0761 	101C

		//;smartkey.C: 185: return ReEepromData;
		BCR 	STATUS,5 		//0762 	1283
		LDR 	21H,0 			//0763 	0821
		ORG		0764H
		RET		 					//0764 	0004
		STR 	22H 			//0765 	01A2

		//;smartkey.C: 203: mtOldState = mtState;
		LDR 	74H,0 			//0766 	0874
		STR 	4DH 			//0767 	01CD

		//;smartkey.C: 204: mtState = stt;
		LDR 	22H,0 			//0768 	0822
		STR 	74H 			//0769 	01F4

		//;smartkey.C: 205: timeTick =0;
		CLRR 	70H 			//076A 	0170
		CLRR 	71H 			//076B 	0171
		ORG		076CH

		//;smartkey.C: 206: timeOut = _tOut;
		LDR 	21H,0 			//076C 	0821
		STR 	49H 			//076D 	01C9
		LDR 	20H,0 			//076E 	0820
		STR 	48H 			//076F 	01C8
		RET		 					//0770 	0004

		//;sysinit.c: 21: OSCCON = 0B01010001;
		LDWI 	51H 			//0771 	2A51
		BSR 	STATUS,5 		//0772 	1A83
		STR 	FH 			//0773 	018F
		ORG		0774H

		//;sysinit.c: 22: _nop();
		NOP		 					//0774 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//0775 	1A83
		BTSC 	FH,2 			//0776 	150F
		RET		 					//0777 	0004
		LJUMP 	775H 			//0778 	3F75
		STR 	75H 			//0779 	01F5

		//;smartkey.C: 179: unsigned char ReEepromData;
		//;smartkey.C: 181: EEADR = EEAddr;
		BSR 	STATUS,5 		//077A 	1A83
		STR 	1BH 			//077B 	019B
		ORG		077CH

		//;smartkey.C: 182: RD = 1;
		BSR 	1CH,0 			//077C 	181C

		//;smartkey.C: 183: ReEepromData = EEDAT;
		LDR 	1AH,0 			//077D 	081A
		STR 	76H 			//077E 	01F6

		//;smartkey.C: 184: RD = 0;
		BCR 	1CH,0 			//077F 	101C

		//;smartkey.C: 185: return ReEepromData;
		RET		 					//0780 	0004
		LJUMP 	2E3H 			//0781 	3AE3
		LJUMP 	215H 			//0782 	3A15
		LJUMP 	21CH 			//0783 	3A1C
		ORG		0784H
		LJUMP 	265H 			//0784 	3A65
		LJUMP 	286H 			//0785 	3A86

		//;smartkey.C: 159: TMR2ON = 1;
		BCR 	STATUS,5 		//0786 	1283
		BSR 	12H,2 			//0787 	1912

		//;smartkey.C: 160: TRISA &= 0xf7;
		BSR 	STATUS,5 		//0788 	1A83
		BCR 	5H,3 			//0789 	1185
		RET		 					//078A 	0004

		//;smartkey.C: 156: TMR2ON = 0;RA3 =0;TRISA |= 0x08;
		BCR 	12H,2 			//078B 	1112
		ORG		078CH
		BCR 	5H,3 			//078C 	1185
		BSR 	STATUS,5 		//078D 	1A83
		BSR 	5H,3 			//078E 	1985
		RET		 					//078F 	0004
			END

//Deviec:MS86Fxx02
//-----------------------Variable---------------------------------
		_cntCyc		EQU		73H
		_cntOff		EQU		45H
		_timeOut		EQU		43H
		_timeTick		EQU		70H
		_cntTmp		EQU		41H
		_mtState		EQU		74H
		_mtOldState		EQU		46H
		_RegStatus		EQU		72H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	77H 			//0006 	01F7
		LDR 	PCLATH,0 		//0007 	080A
		STR 	78H 			//0008 	01F8
		LJUMP 	40DH 			//0009 	3C0D
		LJUMP 	6B5H 			//000A 	3EB5

		//;smartkey.C: 208: unsigned char tmp8, isSw = 0, isFall = 0, lostDetect = 0;
		CLRR 	3DH 			//000B 	013D
		ORG		000CH
		CLRR 	2FH 			//000C 	012F
		CLRR 	30H 			//000D 	0130

		//;smartkey.C: 209: unsigned int isWait = 0;
		CLRR 	2DH 			//000E 	012D
		CLRR 	2EH 			//000F 	012E

		//;smartkey.C: 210: signed int acYsum = 0, acXsum = 0;
		CLRR 	39H 			//0010 	0139
		CLRR 	3AH 			//0011 	013A
		CLRR 	3BH 			//0012 	013B
		CLRR 	3CH 			//0013 	013C
		ORG		0014H

		//;smartkey.C: 211: unsigned int tmp16 = 0;
		CLRR 	3EH 			//0014 	013E
		CLRR 	3FH 			//0015 	013F

		//;smartkey.C: 212: signed char acYOld, acXOld;
		//;smartkey.C: 213: unsigned char buf[6];
		//;smartkey.C: 215: RegStatus.byte =0x00;
		CLRR 	72H 			//0016 	0172

		//;smartkey.C: 216: RegStatus.bits.b6 = 1;
		BSR 	72H,6 			//0017 	1B72
		CLRWDT	 			//0018 	0001

		//;smartkey.C: 220: sys_init();
		LCALL 	6E8H 			//0019 	36E8

		//;smartkey.C: 221: gpio_init();
		LCALL 	669H 			//001A 	3669

		//;smartkey.C: 222: timer_init();
		LCALL 	6A5H 			//001B 	36A5
		ORG		001CH

		//;smartkey.C: 223: int_init();
		LCALL 	605H 			//001C 	3605

		//;smartkey.C: 226: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//001D 	2A82
		STR 	2BH 			//001E 	01AB
		LDWI 	DDH 			//001F 	2ADD
		STR 	2AH 			//0020 	01AA
		DECRSZ 	2AH,1 		//0021 	0EAA
		LJUMP 	21H 			//0022 	3821
		DECRSZ 	2BH,1 		//0023 	0EAB
		ORG		0024H
		LJUMP 	21H 			//0024 	3821
		LJUMP 	26H 			//0025 	3826

		//;smartkey.C: 228: PAIE = 1;
		BSR 	INTCON,3 		//0026 	198B

		//;smartkey.C: 230: swI2C_Init();
		LCALL 	5E6H 			//0027 	35E6
		LDWI 	0H 			//0028 	2A00

		//;smartkey.C: 232: setState(0, 0);
		BCR 	STATUS,5 		//0029 	1283
		CLRR 	20H 			//002A 	0120
		CLRR 	21H 			//002B 	0121
		ORG		002CH
		LCALL 	6DCH 			//002C 	36DC

		//;smartkey.C: 234: WRITE_EEPROM(0xFF, 0xAA);
		LDWI 	AAH 			//002D 	2AAA
		STR 	20H 			//002E 	01A0
		LDWI 	FFH 			//002F 	2AFF
		LCALL 	620H 			//0030 	3620

		//;smartkey.C: 235: WRITE_EEPROM(0xFF, 0xAA);
		LDWI 	AAH 			//0031 	2AAA
		BCR 	STATUS,5 		//0032 	1283
		STR 	20H 			//0033 	01A0
		ORG		0034H
		LDWI 	FFH 			//0034 	2AFF
		LCALL 	620H 			//0035 	3620

		//;smartkey.C: 237: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//0036 	2A82
		BCR 	STATUS,5 		//0037 	1283
		STR 	2BH 			//0038 	01AB
		LDWI 	DDH 			//0039 	2ADD
		STR 	2AH 			//003A 	01AA
		DECRSZ 	2AH,1 		//003B 	0EAA
		ORG		003CH
		LJUMP 	3BH 			//003C 	383B
		DECRSZ 	2BH,1 		//003D 	0EAB
		LJUMP 	3BH 			//003E 	383B
		LJUMP 	40H 			//003F 	3840

		//;smartkey.C: 240: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//0040 	2A41
		LCALL 	6CFH 			//0041 	36CF
		STR 	40H 			//0042 	01C0

		//;smartkey.C: 241: if (tmp8 > 3) {WRITE_EEPROM(0x41, 0); _delay((unsigned long)((2)*(4000
		//+                          000/4000.0)));}
		LDWI 	4H 			//0043 	2A04
		ORG		0044H
		SUBWR 	40H,0 			//0044 	0C40
		BTSS 	STATUS,0 		//0045 	1C03
		LJUMP 	54H 			//0046 	3854
		LDWI 	41H 			//0047 	2A41
		CLRR 	20H 			//0048 	0120
		LCALL 	620H 			//0049 	3620
		LDWI 	3H 			//004A 	2A03
		BCR 	STATUS,5 		//004B 	1283
		ORG		004CH
		STR 	2BH 			//004C 	01AB
		LDWI 	97H 			//004D 	2A97
		STR 	2AH 			//004E 	01AA
		DECRSZ 	2AH,1 		//004F 	0EAA
		LJUMP 	4FH 			//0050 	384F
		DECRSZ 	2BH,1 		//0051 	0EAB
		LJUMP 	4FH 			//0052 	384F
		LJUMP 	54H 			//0053 	3854
		ORG		0054H

		//;smartkey.C: 245: tmp8 = READ_EEPROM(0x08);
		LDWI 	8H 			//0054 	2A08
		LCALL 	6CFH 			//0055 	36CF
		STR 	40H 			//0056 	01C0

		//;smartkey.C: 246: if (tmp8 == 0xff) {WRITE_EEPROM(0x08, 0); _delay((unsigned long)((2)*(
		//+                          4000000/4000.0)));}
		XORWI 	FFH 			//0057 	26FF
		BTSS 	STATUS,2 		//0058 	1D03
		LJUMP 	67H 			//0059 	3867
		LDWI 	8H 			//005A 	2A08
		CLRR 	20H 			//005B 	0120
		ORG		005CH
		LCALL 	620H 			//005C 	3620
		LDWI 	3H 			//005D 	2A03
		BCR 	STATUS,5 		//005E 	1283
		STR 	2BH 			//005F 	01AB
		LDWI 	97H 			//0060 	2A97
		STR 	2AH 			//0061 	01AA
		DECRSZ 	2AH,1 		//0062 	0EAA
		LJUMP 	62H 			//0063 	3862
		ORG		0064H
		DECRSZ 	2BH,1 		//0064 	0EAB
		LJUMP 	62H 			//0065 	3862
		LJUMP 	67H 			//0066 	3867

		//;smartkey.C: 247: if (tmp8 == 0xcc) {
		BCR 	STATUS,5 		//0067 	1283
		LDR 	40H,0 			//0068 	0840
		XORWI 	CCH 			//0069 	26CC
		BTSS 	STATUS,2 		//006A 	1D03
		LJUMP 	82H 			//006B 	3882
		ORG		006CH

		//;smartkey.C: 248: RegStatus.bits.b0 = 0;
		BCR 	72H,0 			//006C 	1072

		//;smartkey.C: 249: setState(3, 1800);
		LDWI 	8H 			//006D 	2A08
		STR 	20H 			//006E 	01A0
		LDWI 	7H 			//006F 	2A07
		STR 	21H 			//0070 	01A1
		LDWI 	3H 			//0071 	2A03
		LCALL 	6DCH 			//0072 	36DC

		//;smartkey.C: 250: mtOldState = 1;
		CLRR 	46H 			//0073 	0146
		ORG		0074H
		INCR	46H,1 			//0074 	09C6

		//;smartkey.C: 251: cntTmp = timeTick + 50;
		LDR 	71H,0 			//0075 	0871
		STR 	42H 			//0076 	01C2
		LDR 	70H,0 			//0077 	0870
		STR 	41H 			//0078 	01C1
		LDWI 	32H 			//0079 	2A32
		ADDWR 	41H,1 			//007A 	0BC1
		BTSC 	STATUS,0 		//007B 	1403
		ORG		007CH
		INCR	42H,1 			//007C 	09C2

		//;smartkey.C: 252: PR2L = 12;
		LDWI 	CH 			//007D 	2A0C
		BSR 	STATUS,5 		//007E 	1A83
		STR 	11H 			//007F 	0191

		//;smartkey.C: 253: beepOn();
		LCALL 	705H 			//0080 	3705

		//;smartkey.C: 254: } else {
		LJUMP 	89H 			//0081 	3889

		//;smartkey.C: 255: setState(2, 400);
		LDWI 	90H 			//0082 	2A90
		STR 	20H 			//0083 	01A0
		ORG		0084H
		LDWI 	1H 			//0084 	2A01
		STR 	21H 			//0085 	01A1
		LDWI 	2H 			//0086 	2A02
		LCALL 	6DCH 			//0087 	36DC

		//;smartkey.C: 256: mtOldState = 0;
		CLRR 	46H 			//0088 	0146

		//;smartkey.C: 257: }
		//;smartkey.C: 262: buf[0] = 0x03;
		LDWI 	3H 			//0089 	2A03
		BCR 	STATUS,5 		//008A 	1283
		STR 	33H 			//008B 	01B3
		ORG		008CH

		//;smartkey.C: 263: if ((AccWrite(0x0f, buf, 1) == 0)) {
		LDWI 	33H 			//008C 	2A33
		STR 	23H 			//008D 	01A3
		LDWI 	FH 			//008E 	2A0F
		CLRR 	24H 			//008F 	0124
		INCR	24H,1 			//0090 	09A4
		LCALL 	5C5H 			//0091 	35C5
		IORWI 	0H 			//0092 	2500
		BTSC 	STATUS,2 		//0093 	1503
		ORG		0094H
		LJUMP 	9AH 			//0094 	389A

		//;smartkey.C: 266: else {
		//;smartkey.C: 268: beep(10, 2);
		LDWI 	2H 			//0095 	2A02
		BCR 	STATUS,5 		//0096 	1283
		STR 	24H 			//0097 	01A4
		LDWI 	AH 			//0098 	2A0A
		LCALL 	653H 			//0099 	3653

		//;smartkey.C: 269: }
		//;smartkey.C: 271: buf[0] = 0x08;
		LDWI 	8H 			//009A 	2A08
		BCR 	STATUS,5 		//009B 	1283
		ORG		009CH
		STR 	33H 			//009C 	01B3

		//;smartkey.C: 272: if ((AccWrite(0x10,buf, 1) == 0)) {
		LDWI 	33H 			//009D 	2A33
		STR 	23H 			//009E 	01A3
		LDWI 	10H 			//009F 	2A10
		CLRR 	24H 			//00A0 	0124
		INCR	24H,1 			//00A1 	09A4
		LCALL 	5C5H 			//00A2 	35C5
		IORWI 	0H 			//00A3 	2500
		ORG		00A4H
		BTSC 	STATUS,2 		//00A4 	1503
		LJUMP 	ABH 			//00A5 	38AB

		//;smartkey.C: 275: else {
		//;smartkey.C: 277: beep(10, 2);
		LDWI 	2H 			//00A6 	2A02
		BCR 	STATUS,5 		//00A7 	1283
		STR 	24H 			//00A8 	01A4
		LDWI 	AH 			//00A9 	2A0A
		LCALL 	653H 			//00AA 	3653

		//;smartkey.C: 278: }
		//;smartkey.C: 282: tmp8 = READ_EEPROM(0x3F);
		LDWI 	3FH 			//00AB 	2A3F
		ORG		00ACH
		LCALL 	6CFH 			//00AC 	36CF
		STR 	40H 			//00AD 	01C0

		//;smartkey.C: 283: if (tmp8 == 5) {
		XORWI 	5H 			//00AE 	2605
		BTSS 	STATUS,2 		//00AF 	1D03
		LJUMP 	E8H 			//00B0 	38E8
		LDWI 	3FH 			//00B1 	2A3F

		//;smartkey.C: 284: tmp8 = 0;
		CLRR 	40H 			//00B2 	0140

		//;smartkey.C: 285: WRITE_EEPROM(0x3F, 0);
		CLRR 	20H 			//00B3 	0120
		ORG		00B4H
		LCALL 	620H 			//00B4 	3620

		//;smartkey.C: 286: while ( RA2) {
		BCR 	STATUS,5 		//00B5 	1283
		BTSS 	5H,2 			//00B6 	1D05
		LJUMP 	E6H 			//00B7 	38E6

		//;smartkey.C: 287: _delay((unsigned long)((1500)*(4000000/4000.0)));
		LDWI 	8H 			//00B8 	2A08
		STR 	2CH 			//00B9 	01AC
		LDWI 	9DH 			//00BA 	2A9D
		STR 	2BH 			//00BB 	01AB
		ORG		00BCH
		LDWI 	BH 			//00BC 	2A0B
		STR 	2AH 			//00BD 	01AA
		DECRSZ 	2AH,1 		//00BE 	0EAA
		LJUMP 	BEH 			//00BF 	38BE
		DECRSZ 	2BH,1 		//00C0 	0EAB
		LJUMP 	BEH 			//00C1 	38BE
		DECRSZ 	2CH,1 		//00C2 	0EAC
		LJUMP 	BEH 			//00C3 	38BE
		ORG		00C4H
		LJUMP 	C5H 			//00C4 	38C5
		LDWI 	15H 			//00C5 	2A15

		//;smartkey.C: 288: tmp8++;
		BCR 	STATUS,5 		//00C6 	1283
		INCR	40H,1 			//00C7 	09C0

		//;smartkey.C: 289: if (tmp8 > 20) {
		SUBWR 	40H,0 			//00C8 	0C40
		BTSS 	STATUS,0 		//00C9 	1C03
		LJUMP 	DAH 			//00CA 	38DA

		//;smartkey.C: 290: _delay((unsigned long)((10000)*(4000000/4000.0)));
		LDWI 	33H 			//00CB 	2A33
		ORG		00CCH
		STR 	2CH 			//00CC 	01AC
		LDWI 	BCH 			//00CD 	2ABC
		STR 	2BH 			//00CE 	01AB
		LDWI 	10H 			//00CF 	2A10
		STR 	2AH 			//00D0 	01AA
		DECRSZ 	2AH,1 		//00D1 	0EAA
		LJUMP 	D1H 			//00D2 	38D1
		DECRSZ 	2BH,1 		//00D3 	0EAB
		ORG		00D4H
		LJUMP 	D1H 			//00D4 	38D1
		DECRSZ 	2CH,1 		//00D5 	0EAC
		LJUMP 	D1H 			//00D6 	38D1
		LDWI 	40H 			//00D7 	2A40

		//;smartkey.C: 291: WRITE_EEPROM(0x40, 0);
		BCR 	STATUS,5 		//00D8 	1283
		LJUMP 	B3H 			//00D9 	38B3

		//;smartkey.C: 292: }
		//;smartkey.C: 293: else if ( RA2) {
		BTSS 	5H,2 			//00DA 	1D05
		LJUMP 	B5H 			//00DB 	38B5
		ORG		00DCH

		//;smartkey.C: 294: WRITE_EEPROM(0x40, tmp8);
		LDR 	40H,0 			//00DC 	0840
		STR 	20H 			//00DD 	01A0
		LDWI 	40H 			//00DE 	2A40
		LCALL 	620H 			//00DF 	3620
		LDWI 	AH 			//00E0 	2A0A

		//;smartkey.C: 295: beep(10, 1);
		BCR 	STATUS,5 		//00E1 	1283
		CLRR 	24H 			//00E2 	0124
		INCR	24H,1 			//00E3 	09A4
		ORG		00E4H
		LCALL 	653H 			//00E4 	3653
		LJUMP 	B5H 			//00E5 	38B5
		BTSS 	5H,2 			//00E6 	1D05
		LJUMP 	E6H 			//00E7 	38E6

		//;smartkey.C: 299: }
		//;smartkey.C: 302: tmp8 = READ_EEPROM(0x40);
		LDWI 	40H 			//00E8 	2A40
		LCALL 	6CFH 			//00E9 	36CF
		STR 	40H 			//00EA 	01C0

		//;smartkey.C: 303: switch (tmp8) {
		LJUMP 	182H 			//00EB 	3982
		ORG		00ECH
		LDWI 	3H 			//00EC 	2A03

		//;smartkey.C: 306: tmp8 = 0; beep(10, 3);
		CLRR 	40H 			//00ED 	0140
		STR 	24H 			//00EE 	01A4
		LDWI 	AH 			//00EF 	2A0A
		LCALL 	653H 			//00F0 	3653

		//;smartkey.C: 307: while ((tmp8 < 11)) {
		LJUMP 	11FH 			//00F1 	391F

		//;smartkey.C: 309: acXsum += (signed char)buf[1];
		BCR 	STATUS,5 		//00F2 	1283
		LDR 	34H,0 			//00F3 	0834
		ORG		00F4H
		STR 	2AH 			//00F4 	01AA
		CLRR 	2BH 			//00F5 	012B
		BTSC 	2AH,7 			//00F6 	17AA
		DECR 	2BH,1 			//00F7 	0DAB
		ADDWR 	3BH,1 			//00F8 	0BBB
		BTSC 	STATUS,0 		//00F9 	1403
		INCR	3CH,1 			//00FA 	09BC
		LDR 	2BH,0 			//00FB 	082B
		ORG		00FCH
		ADDWR 	3CH,1 			//00FC 	0BBC

		//;smartkey.C: 310: acYsum += (signed char)buf[3];
		LDR 	36H,0 			//00FD 	0836
		STR 	2AH 			//00FE 	01AA
		CLRR 	2BH 			//00FF 	012B
		BTSC 	2AH,7 			//0100 	17AA
		DECR 	2BH,1 			//0101 	0DAB
		ADDWR 	39H,1 			//0102 	0BB9
		BTSC 	STATUS,0 		//0103 	1403
		ORG		0104H
		INCR	3AH,1 			//0104 	09BA
		LDR 	2BH,0 			//0105 	082B
		ADDWR 	3AH,1 			//0106 	0BBA

		//;smartkey.C: 311: if ( ((signed char)buf[5] > -15) && ((signed char)buf[5] <15)) break;
		LDR 	38H,0 			//0107 	0838
		XORWI 	80H 			//0108 	2680
		ADDWI 	8EH 			//0109 	278E
		BTSS 	STATUS,0 		//010A 	1C03
		LJUMP 	111H 			//010B 	3911
		ORG		010CH
		LDR 	38H,0 			//010C 	0838
		XORWI 	80H 			//010D 	2680
		ADDWI 	71H 			//010E 	2771
		BTSS 	STATUS,0 		//010F 	1C03
		LJUMP 	12DH 			//0110 	392D
		LDWI 	3H 			//0111 	2A03

		//;smartkey.C: 312: tmp8++;
		INCR	40H,1 			//0112 	09C0

		//;smartkey.C: 315: _delay((unsigned long)((500)*(4000000/4000.0)));
		//;smartkey.C: 313: } else
		STR 	2CH 			//0113 	01AC
		ORG		0114H
		LDWI 	8AH 			//0114 	2A8A
		STR 	2BH 			//0115 	01AB
		LDWI 	56H 			//0116 	2A56
		STR 	2AH 			//0117 	01AA
		DECRSZ 	2AH,1 		//0118 	0EAA
		LJUMP 	118H 			//0119 	3918
		DECRSZ 	2BH,1 		//011A 	0EAB
		LJUMP 	118H 			//011B 	3918
		ORG		011CH
		DECRSZ 	2CH,1 		//011C 	0EAC
		LJUMP 	118H 			//011D 	3918
		LJUMP 	11FH 			//011E 	391F
		LDWI 	BH 			//011F 	2A0B
		BCR 	STATUS,5 		//0120 	1283
		SUBWR 	40H,0 			//0121 	0C40
		BTSC 	STATUS,0 		//0122 	1403
		LJUMP 	12DH 			//0123 	392D
		ORG		0124H

		//;smartkey.C: 308: if (AccRead(0x02, buf, 6) == 0) {
		LDWI 	33H 			//0124 	2A33
		STR 	24H 			//0125 	01A4
		LDWI 	6H 			//0126 	2A06
		STR 	25H 			//0127 	01A5
		LDWI 	2H 			//0128 	2A02
		LCALL 	58EH 			//0129 	358E
		IORWI 	0H 			//012A 	2500
		BTSC 	STATUS,2 		//012B 	1503
		ORG		012CH
		LJUMP 	F2H 			//012C 	38F2

		//;smartkey.C: 316: }
		//;smartkey.C: 318: if (tmp8 == 11) {
		BCR 	STATUS,5 		//012D 	1283
		LDR 	40H,0 			//012E 	0840
		XORWI 	BH 			//012F 	260B
		BTSS 	STATUS,2 		//0130 	1D03
		LJUMP 	159H 			//0131 	3959

		//;smartkey.C: 319: acXsum = acXsum / 10;
		LDWI 	AH 			//0132 	2A0A
		STR 	20H 			//0133 	01A0
		ORG		0134H
		CLRR 	21H 			//0134 	0121
		LDR 	3CH,0 			//0135 	083C
		STR 	23H 			//0136 	01A3
		LDR 	3BH,0 			//0137 	083B
		STR 	22H 			//0138 	01A2
		LCALL 	491H 			//0139 	3491
		LDR 	21H,0 			//013A 	0821
		STR 	3CH 			//013B 	01BC
		ORG		013CH
		LDR 	20H,0 			//013C 	0820
		STR 	3BH 			//013D 	01BB

		//;smartkey.C: 320: acYsum = acYsum / 10;
		LDWI 	AH 			//013E 	2A0A
		STR 	20H 			//013F 	01A0
		CLRR 	21H 			//0140 	0121
		LDR 	3AH,0 			//0141 	083A
		STR 	23H 			//0142 	01A3
		LDR 	39H,0 			//0143 	0839
		ORG		0144H
		STR 	22H 			//0144 	01A2
		LCALL 	491H 			//0145 	3491
		LDR 	21H,0 			//0146 	0821
		STR 	3AH 			//0147 	01BA
		LDR 	20H,0 			//0148 	0820
		STR 	39H 			//0149 	01B9

		//;smartkey.C: 322: WRITE_EEPROM(0x10, acXsum);
		LDR 	3BH,0 			//014A 	083B
		STR 	20H 			//014B 	01A0
		ORG		014CH
		LDWI 	10H 			//014C 	2A10
		LCALL 	620H 			//014D 	3620

		//;smartkey.C: 323: WRITE_EEPROM(0x11, acYsum);
		BCR 	STATUS,5 		//014E 	1283
		LDR 	39H,0 			//014F 	0839
		STR 	20H 			//0150 	01A0
		LDWI 	11H 			//0151 	2A11
		LCALL 	620H 			//0152 	3620

		//;smartkey.C: 324: beep(10, 3);
		LDWI 	3H 			//0153 	2A03
		ORG		0154H
		BCR 	STATUS,5 		//0154 	1283
		STR 	24H 			//0155 	01A4
		LDWI 	AH 			//0156 	2A0A
		LCALL 	653H 			//0157 	3653

		//;smartkey.C: 326: } else {
		LJUMP 	18DH 			//0158 	398D

		//;smartkey.C: 327: beep(10, 2);
		LDWI 	2H 			//0159 	2A02
		STR 	24H 			//015A 	01A4
		LDWI 	AH 			//015B 	2A0A
		ORG		015CH
		LCALL 	653H 			//015C 	3653
		LJUMP 	18DH 			//015D 	398D

		//;smartkey.C: 334: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//015E 	2A41
		LCALL 	6CFH 			//015F 	36CF
		STR 	40H 			//0160 	01C0

		//;smartkey.C: 335: if (tmp8 & 2) {
		BTSS 	40H,1 			//0161 	1CC0
		LJUMP 	165H 			//0162 	3965

		//;smartkey.C: 336: tmp8 &= ~2;
		BCR 	40H,1 			//0163 	10C0
		ORG		0164H

		//;smartkey.C: 337: }
		LJUMP 	166H 			//0164 	3966

		//;smartkey.C: 338: else {
		//;smartkey.C: 339: tmp8 |= 2;
		BSR 	40H,1 			//0165 	18C0

		//;smartkey.C: 340: }
		//;smartkey.C: 341: WRITE_EEPROM(0x41, tmp8);
		LDR 	40H,0 			//0166 	0840
		STR 	20H 			//0167 	01A0
		LDWI 	41H 			//0168 	2A41
		LCALL 	620H 			//0169 	3620
		LDWI 	32H 			//016A 	2A32

		//;smartkey.C: 342: beep(50, 1);
		BCR 	STATUS,5 		//016B 	1283
		ORG		016CH
		CLRR 	24H 			//016C 	0124
		INCR	24H,1 			//016D 	09A4
		LCALL 	653H 			//016E 	3653

		//;smartkey.C: 343: break;
		LJUMP 	18DH 			//016F 	398D

		//;smartkey.C: 347: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//0170 	2A41
		LCALL 	6CFH 			//0171 	36CF
		STR 	40H 			//0172 	01C0

		//;smartkey.C: 348: if (tmp8 & 1) {
		BTSS 	40H,0 			//0173 	1C40
		ORG		0174H
		LJUMP 	177H 			//0174 	3977

		//;smartkey.C: 349: tmp8 &= ~1;
		BCR 	40H,0 			//0175 	1040

		//;smartkey.C: 350: }
		LJUMP 	178H 			//0176 	3978

		//;smartkey.C: 351: else {
		//;smartkey.C: 352: tmp8 |= 1;
		BSR 	40H,0 			//0177 	1840

		//;smartkey.C: 353: }
		//;smartkey.C: 354: WRITE_EEPROM(0x41, tmp8);
		LDR 	40H,0 			//0178 	0840
		STR 	20H 			//0179 	01A0
		LDWI 	41H 			//017A 	2A41
		LCALL 	620H 			//017B 	3620
		ORG		017CH
		LDWI 	AH 			//017C 	2A0A

		//;smartkey.C: 355: beep(10, 1);
		BCR 	STATUS,5 		//017D 	1283
		CLRR 	24H 			//017E 	0124
		INCR	24H,1 			//017F 	09A4
		LCALL 	653H 			//0180 	3653

		//;smartkey.C: 356: break;
		LJUMP 	18DH 			//0181 	398D
		LDR 	40H,0 			//0182 	0840
		XORWI 	3H 			//0183 	2603
		ORG		0184H
		BTSC 	STATUS,2 		//0184 	1503
		LJUMP 	ECH 			//0185 	38EC
		XORWI 	9H 			//0186 	2609
		BTSC 	STATUS,2 		//0187 	1503
		LJUMP 	170H 			//0188 	3970
		XORWI 	1EH 			//0189 	261E
		BTSC 	STATUS,2 		//018A 	1503
		LJUMP 	15EH 			//018B 	395E
		ORG		018CH
		LJUMP 	18DH 			//018C 	398D

		//;smartkey.C: 360: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//018D 	2A41
		LCALL 	6CFH 			//018E 	36CF
		STR 	40H 			//018F 	01C0

		//;smartkey.C: 361: if (tmp8 >0 && tmp8<4 ) {
		LDR 	40H,0 			//0190 	0840
		BTSC 	STATUS,2 		//0191 	1503
		LJUMP 	1B1H 			//0192 	39B1
		LDWI 	4H 			//0193 	2A04
		ORG		0194H
		SUBWR 	40H,0 			//0194 	0C40
		BTSC 	STATUS,0 		//0195 	1403
		LJUMP 	1B1H 			//0196 	39B1

		//;smartkey.C: 362: RegStatus.bits.b0 = 1;
		BSR 	72H,0 			//0197 	1872

		//;smartkey.C: 363: setState(1, 3500);
		LDWI 	ACH 			//0198 	2AAC
		STR 	20H 			//0199 	01A0
		LDWI 	DH 			//019A 	2A0D
		STR 	21H 			//019B 	01A1
		ORG		019CH
		LDWI 	1H 			//019C 	2A01
		LCALL 	6DCH 			//019D 	36DC

		//;smartkey.C: 364: RegStatus.bits.b4 = 1;
		BSR 	72H,4 			//019E 	1A72

		//;smartkey.C: 366: if (tmp8 & 2) {
		BTSS 	40H,1 			//019F 	1CC0
		LJUMP 	1A3H 			//01A0 	39A3

		//;smartkey.C: 367: RegStatus.bits.b6 = 0;
		BCR 	72H,6 			//01A1 	1372

		//;smartkey.C: 368: }
		LJUMP 	1B1H 			//01A2 	39B1

		//;smartkey.C: 369: else if (tmp8 & 1) {
		BTSS 	40H,0 			//01A3 	1C40
		ORG		01A4H
		LJUMP 	1B1H 			//01A4 	39B1

		//;smartkey.C: 370: tmp16 = timeTick + 40;
		LDR 	71H,0 			//01A5 	0871
		STR 	3FH 			//01A6 	01BF
		LDR 	70H,0 			//01A7 	0870
		STR 	3EH 			//01A8 	01BE
		LDWI 	28H 			//01A9 	2A28
		ADDWR 	3EH,1 			//01AA 	0BBE
		BTSC 	STATUS,0 		//01AB 	1403
		ORG		01ACH
		INCR	3FH,1 			//01AC 	09BF
		LDWI 	AH 			//01AD 	2A0A

		//;smartkey.C: 371: beep(10, 1);
		CLRR 	24H 			//01AE 	0124
		INCR	24H,1 			//01AF 	09A4
		LCALL 	653H 			//01B0 	3653

		//;smartkey.C: 372: }
		//;smartkey.C: 373: }
		//;smartkey.C: 376: acXsum = (signed int)READ_EEPROM(0x10);
		LDWI 	10H 			//01B1 	2A10
		LCALL 	6CFH 			//01B2 	36CF
		STR 	3BH 			//01B3 	01BB
		ORG		01B4H
		LDWI 	11H 			//01B4 	2A11
		CLRR 	3CH 			//01B5 	013C

		//;smartkey.C: 377: acYsum = (signed int)READ_EEPROM(0x11);
		LCALL 	6CFH 			//01B6 	36CF
		STR 	39H 			//01B7 	01B9
		CLRR 	3AH 			//01B8 	013A

		//;smartkey.C: 379: timeTick = 0;
		CLRR 	70H 			//01B9 	0170
		CLRR 	71H 			//01BA 	0171

		//;smartkey.C: 385: if ( RegStatus.bits.b4 == 0) {
		BTSS 	72H,4 			//01BB 	1E72
		ORG		01BCH

		//;smartkey.C: 386: if (RegStatus.bits.b3 == 0) {
		BTSC 	72H,3 			//01BC 	15F2
		LJUMP 	293H 			//01BD 	3A93

		//;smartkey.C: 387: if (RegStatus.bits.b1) {
		BTSS 	72H,1 			//01BE 	1CF2
		LJUMP 	293H 			//01BF 	3A93

		//;smartkey.C: 389: PAIE = 0;
		BCR 	INTCON,3 		//01C0 	118B

		//;smartkey.C: 391: RegStatus.bits.b1 = 0;
		BCR 	72H,1 			//01C1 	10F2

		//;smartkey.C: 395: if (RegStatus.bits.b2) {
		BTSC 	72H,2 			//01C2 	1572
		LJUMP 	23FH 			//01C3 	3A3F
		ORG		01C4H
		LJUMP 	28AH 			//01C4 	3A8A

		//;smartkey.C: 399: lostDetect = 0;
		BCR 	STATUS,5 		//01C5 	1283
		CLRR 	30H 			//01C6 	0130
		LDWI 	28H 			//01C7 	2A28

		//;smartkey.C: 400: timeTick = 0;
		CLRR 	70H 			//01C8 	0170
		CLRR 	71H 			//01C9 	0171

		//;smartkey.C: 401: tmp16 = 40;
		STR 	3EH 			//01CA 	01BE
		CLRR 	3FH 			//01CB 	013F
		ORG		01CCH

		//;smartkey.C: 402: break;
		LJUMP 	292H 			//01CC 	3A92

		//;smartkey.C: 405: if (timeTick > 30) {
		LDWI 	0H 			//01CD 	2A00
		SUBWR 	71H,0 			//01CE 	0C71
		LDWI 	1FH 			//01CF 	2A1F
		BTSC 	STATUS,2 		//01D0 	1503
		SUBWR 	70H,0 			//01D1 	0C70
		BTSS 	STATUS,0 		//01D2 	1C03
		LJUMP 	292H 			//01D3 	3A92
		ORG		01D4H
		LDWI 	8H 			//01D4 	2A08

		//;smartkey.C: 406: timeTick = 0;
		CLRR 	70H 			//01D5 	0170
		CLRR 	71H 			//01D6 	0171

		//;smartkey.C: 408: if (READ_EEPROM(0x08) == 0xcc) WRITE_EEPROM(0x08, 0);
		LCALL 	6CFH 			//01D7 	36CF
		XORWI 	CCH 			//01D8 	26CC
		BTSS 	STATUS,2 		//01D9 	1D03
		LJUMP 	1DEH 			//01DA 	39DE
		LDWI 	8H 			//01DB 	2A08
		ORG		01DCH
		CLRR 	20H 			//01DC 	0120
		LCALL 	620H 			//01DD 	3620

		//;smartkey.C: 410: if ((mtOldState == 3)) {
		BCR 	STATUS,5 		//01DE 	1283
		LDR 	46H,0 			//01DF 	0846
		XORWI 	3H 			//01E0 	2603
		BTSS 	STATUS,2 		//01E1 	1D03
		LJUMP 	1EEH 			//01E2 	39EE

		//;smartkey.C: 411: beepOn(); TMR2ON = 0; beep(10, 1);
		LCALL 	705H 			//01E3 	3705
		ORG		01E4H
		LDWI 	AH 			//01E4 	2A0A
		BCR 	STATUS,5 		//01E5 	1283
		BCR 	12H,2 			//01E6 	1112
		CLRR 	24H 			//01E7 	0124
		INCR	24H,1 			//01E8 	09A4
		LCALL 	653H 			//01E9 	3653

		//;smartkey.C: 412: if (RegStatus.bits.b7)RegStatus.bits.b7 = 0;
		BTSS 	72H,7 			//01EA 	1FF2
		LJUMP 	292H 			//01EB 	3A92
		ORG		01ECH
		BCR 	72H,7 			//01EC 	13F2
		LJUMP 	292H 			//01ED 	3A92

		//;smartkey.C: 414: else if ((mtOldState == 0) || (mtOldState == 4)) {
		LDR 	46H,0 			//01EE 	0846
		BTSC 	STATUS,2 		//01EF 	1503
		LJUMP 	1F5H 			//01F0 	39F5
		LDR 	46H,0 			//01F1 	0846
		XORWI 	4H 			//01F2 	2604
		BTSS 	STATUS,2 		//01F3 	1D03
		ORG		01F4H
		LJUMP 	212H 			//01F4 	3A12

		//;smartkey.C: 415: RegStatus.bits.b0 = 1;
		BSR 	72H,0 			//01F5 	1872

		//;smartkey.C: 416: setState(1, 3500);
		LDWI 	ACH 			//01F6 	2AAC
		STR 	20H 			//01F7 	01A0
		LDWI 	DH 			//01F8 	2A0D
		STR 	21H 			//01F9 	01A1
		LDWI 	1H 			//01FA 	2A01
		LCALL 	6DCH 			//01FB 	36DC
		ORG		01FCH

		//;smartkey.C: 417: if (READ_EEPROM(0x40))WRITE_EEPROM(0x40, 0);
		LDWI 	40H 			//01FC 	2A40
		LCALL 	6CFH 			//01FD 	36CF
		XORWI 	0H 			//01FE 	2600
		BTSC 	STATUS,2 		//01FF 	1503
		LJUMP 	204H 			//0200 	3A04
		LDWI 	40H 			//0201 	2A40
		CLRR 	20H 			//0202 	0120
		LCALL 	620H 			//0203 	3620
		ORG		0204H

		//;smartkey.C: 418: tmp16 = timeTick + 40;
		LDR 	71H,0 			//0204 	0871
		BCR 	STATUS,5 		//0205 	1283
		STR 	3FH 			//0206 	01BF
		LDR 	70H,0 			//0207 	0870
		STR 	3EH 			//0208 	01BE
		LDWI 	28H 			//0209 	2A28
		ADDWR 	3EH,1 			//020A 	0BBE
		BTSC 	STATUS,0 		//020B 	1403
		ORG		020CH
		INCR	3FH,1 			//020C 	09BF
		LDWI 	AH 			//020D 	2A0A

		//;smartkey.C: 419: beep(10, 1);
		CLRR 	24H 			//020E 	0124
		INCR	24H,1 			//020F 	09A4
		LCALL 	653H 			//0210 	3653

		//;smartkey.C: 420: }
		LJUMP 	292H 			//0211 	3A92

		//;smartkey.C: 421: else if ((mtOldState == 1)) {
		DECRSZ 	46H,0 		//0212 	0E46
		LJUMP 	292H 			//0213 	3A92
		ORG		0214H

		//;smartkey.C: 423: if (RegStatus.bits.b7)RegStatus.bits.b7 = 0;
		LJUMP 	1EAH 			//0214 	39EA

		//;smartkey.C: 424: }
		//;smartkey.C: 425: }
		//;smartkey.C: 426: break;
		//;smartkey.C: 429: if (timeTick > 200) {
		LDWI 	0H 			//0215 	2A00
		SUBWR 	71H,0 			//0216 	0C71
		LDWI 	C9H 			//0217 	2AC9
		BTSC 	STATUS,2 		//0218 	1503
		SUBWR 	70H,0 			//0219 	0C70
		BTSS 	STATUS,0 		//021A 	1C03
		LJUMP 	292H 			//021B 	3A92
		ORG		021CH

		//;smartkey.C: 431: beepOff();
		LCALL 	6F8H 			//021C 	36F8

		//;smartkey.C: 432: if (READ_EEPROM(0x08) == 0xcc) WRITE_EEPROM(0x08, 0);
		LDWI 	8H 			//021D 	2A08
		LCALL 	6CFH 			//021E 	36CF
		XORWI 	CCH 			//021F 	26CC
		BTSS 	STATUS,2 		//0220 	1D03
		LJUMP 	225H 			//0221 	3A25
		LDWI 	8H 			//0222 	2A08
		CLRR 	20H 			//0223 	0120
		ORG		0224H
		LCALL 	620H 			//0224 	3620

		//;smartkey.C: 433: RegStatus.bits.b0 = 1;
		BSR 	72H,0 			//0225 	1872

		//;smartkey.C: 434: setState(1, 3500);
		LDWI 	ACH 			//0226 	2AAC
		BCR 	STATUS,5 		//0227 	1283
		STR 	20H 			//0228 	01A0
		LDWI 	DH 			//0229 	2A0D
		STR 	21H 			//022A 	01A1
		LDWI 	1H 			//022B 	2A01
		ORG		022CH
		LCALL 	6DCH 			//022C 	36DC

		//;smartkey.C: 436: tmp16 = timeTick + 40;
		LDR 	71H,0 			//022D 	0871
		STR 	3FH 			//022E 	01BF
		LDR 	70H,0 			//022F 	0870
		STR 	3EH 			//0230 	01BE
		LDWI 	28H 			//0231 	2A28
		ADDWR 	3EH,1 			//0232 	0BBE
		BTSC 	STATUS,0 		//0233 	1403
		ORG		0234H
		INCR	3FH,1 			//0234 	09BF
		LJUMP 	292H 			//0235 	3A92

		//;smartkey.C: 442: beepOff();
		LCALL 	6F8H 			//0236 	36F8

		//;smartkey.C: 443: setState(2, 300);
		LDWI 	2CH 			//0237 	2A2C
		BCR 	STATUS,5 		//0238 	1283
		STR 	20H 			//0239 	01A0
		LDWI 	1H 			//023A 	2A01
		STR 	21H 			//023B 	01A1
		ORG		023CH
		LDWI 	2H 			//023C 	2A02
		LCALL 	6DCH 			//023D 	36DC

		//;smartkey.C: 444: break;
		LJUMP 	292H 			//023E 	3A92
		LDR 	74H,0 			//023F 	0874
		STR 	FSR 			//0240 	0184
		LDWI 	5H 			//0241 	2A05
		SUBWR 	FSR,0 			//0242 	0C04
		BTSC 	STATUS,0 		//0243 	1403
		ORG		0244H
		LJUMP 	292H 			//0244 	3A92
		LDWI 	7H 			//0245 	2A07
		STR 	PCLATH 			//0246 	018A
		LDWI 	0H 			//0247 	2A00
		ADDWR 	FSR,0 			//0248 	0B04
		STR 	PCL 			//0249 	0182

		//;smartkey.C: 459: if ((lostDetect == 1) && (timeTick < 1500) && (timeTick > 700))
		BCR 	STATUS,5 		//024A 	1283
		DECRSZ 	30H,0 		//024B 	0E30
		ORG		024CH
		LJUMP 	278H 			//024C 	3A78
		LDWI 	5H 			//024D 	2A05
		SUBWR 	71H,0 			//024E 	0C71
		LDWI 	DCH 			//024F 	2ADC
		BTSC 	STATUS,2 		//0250 	1503
		SUBWR 	70H,0 			//0251 	0C70
		BTSC 	STATUS,0 		//0252 	1403
		LJUMP 	278H 			//0253 	3A78
		ORG		0254H
		LDWI 	2H 			//0254 	2A02
		SUBWR 	71H,0 			//0255 	0C71
		LDWI 	BDH 			//0256 	2ABD
		BTSC 	STATUS,2 		//0257 	1503
		SUBWR 	70H,0 			//0258 	0C70
		BTSS 	STATUS,0 		//0259 	1C03
		LJUMP 	278H 			//025A 	3A78

		//;smartkey.C: 460: {
		//;smartkey.C: 461: if (READ_EEPROM(0x08) == 0x00) WRITE_EEPROM(0x08, 0xcc);
		LDWI 	8H 			//025B 	2A08
		ORG		025CH
		LCALL 	6CFH 			//025C 	36CF
		IORWI 	0H 			//025D 	2500
		BTSS 	STATUS,2 		//025E 	1D03
		LJUMP 	264H 			//025F 	3A64
		LDWI 	CCH 			//0260 	2ACC
		STR 	20H 			//0261 	01A0
		LDWI 	8H 			//0262 	2A08
		LCALL 	620H 			//0263 	3620
		ORG		0264H

		//;smartkey.C: 463: setState(3, 1800);
		LDWI 	8H 			//0264 	2A08
		BCR 	STATUS,5 		//0265 	1283
		STR 	20H 			//0266 	01A0
		LDWI 	7H 			//0267 	2A07
		STR 	21H 			//0268 	01A1
		LDWI 	3H 			//0269 	2A03
		LCALL 	6DCH 			//026A 	36DC

		//;smartkey.C: 464: cntTmp = timeTick + 40;
		LDR 	71H,0 			//026B 	0871
		ORG		026CH
		STR 	42H 			//026C 	01C2
		LDR 	70H,0 			//026D 	0870
		STR 	41H 			//026E 	01C1
		LDWI 	28H 			//026F 	2A28
		ADDWR 	41H,1 			//0270 	0BC1
		BTSC 	STATUS,0 		//0271 	1403
		INCR	42H,1 			//0272 	09C2

		//;smartkey.C: 465: PR2L = 20;
		LDWI 	14H 			//0273 	2A14
		ORG		0274H
		BSR 	STATUS,5 		//0274 	1A83
		STR 	11H 			//0275 	0191

		//;smartkey.C: 466: beepOn();
		LCALL 	705H 			//0276 	3705
		LJUMP 	1C5H 			//0277 	39C5

		//;smartkey.C: 468: }
		//;smartkey.C: 467: lostDetect = 0;
		//;smartkey.C: 469: else {
		//;smartkey.C: 470: lostDetect = 1;
		CLRR 	30H 			//0278 	0130
		INCR	30H,1 			//0279 	09B0
		LJUMP 	1C7H 			//027A 	39C7

		//;smartkey.C: 473: }
		//;smartkey.C: 474: timeTick = 0;
		//;smartkey.C: 479: timeTick = 0;
		CLRR 	70H 			//027B 	0170
		ORG		027CH
		CLRR 	71H 			//027C 	0171

		//;smartkey.C: 480: beepOn(); TMR2ON = 0;
		LCALL 	705H 			//027D 	3705
		LDWI 	2H 			//027E 	2A02
		BCR 	STATUS,5 		//027F 	1283
		BCR 	12H,2 			//0280 	1112

		//;smartkey.C: 481: beep(10, 2);
		STR 	24H 			//0281 	01A4
		LDWI 	AH 			//0282 	2A0A
		LCALL 	653H 			//0283 	3653
		ORG		0284H

		//;smartkey.C: 482: if (mtOldState == 3) {RegStatus.bits.b7 = 1;}
		LDR 	46H,0 			//0284 	0846
		XORWI 	3H 			//0285 	2603
		BTSS 	STATUS,2 		//0286 	1D03
		LJUMP 	292H 			//0287 	3A92
		BSR 	72H,7 			//0288 	1BF2
		LJUMP 	292H 			//0289 	3A92
		LDR 	74H,0 			//028A 	0874
		XORWI 	1H 			//028B 	2601
		ORG		028CH
		BTSC 	STATUS,2 		//028C 	1503
		LJUMP 	24AH 			//028D 	3A4A
		XORWI 	3H 			//028E 	2603
		BTSC 	STATUS,2 		//028F 	1503
		LJUMP 	27BH 			//0290 	3A7B
		LJUMP 	292H 			//0291 	3A92

		//;smartkey.C: 485: }
		//;smartkey.C: 486: PAIE = 1;
		BSR 	INTCON,3 		//0292 	198B

		//;smartkey.C: 487: }
		//;smartkey.C: 488: }
		//;smartkey.C: 489: }
		//;smartkey.C: 492: if ((timeOut != 0) && ( timeTick > timeOut)) {
		BCR 	STATUS,5 		//0293 	1283
		ORG		0294H
		LDR 	44H,0 			//0294 	0844
		IORWR 	43H,0 			//0295 	0343
		BTSC 	STATUS,2 		//0296 	1503
		LJUMP 	319H 			//0297 	3B19
		LDR 	71H,0 			//0298 	0871
		SUBWR 	44H,0 			//0299 	0C44
		BTSS 	STATUS,2 		//029A 	1D03
		LJUMP 	29EH 			//029B 	3A9E
		ORG		029CH
		LDR 	70H,0 			//029C 	0870
		SUBWR 	43H,0 			//029D 	0C43
		BTSS 	STATUS,0 		//029E 	1C03
		LJUMP 	30BH 			//029F 	3B0B
		LJUMP 	319H 			//02A0 	3B19

		//;smartkey.C: 500: beepOff();
		LCALL 	6F8H 			//02A1 	36F8

		//;smartkey.C: 501: RegStatus.bits.b0 = 0;
		BCR 	72H,0 			//02A2 	1072

		//;smartkey.C: 502: setState(2, 300);
		LDWI 	2CH 			//02A3 	2A2C
		ORG		02A4H
		BCR 	STATUS,5 		//02A4 	1283
		STR 	20H 			//02A5 	01A0
		LDWI 	1H 			//02A6 	2A01
		STR 	21H 			//02A7 	01A1
		LDWI 	2H 			//02A8 	2A02
		LCALL 	6DCH 			//02A9 	36DC

		//;smartkey.C: 503: break;
		LJUMP 	319H 			//02AA 	3B19

		//;smartkey.C: 505: beepOff();
		LCALL 	6F8H 			//02AB 	36F8
		ORG		02ACH

		//;smartkey.C: 506: delay_x10ms(20);
		LDWI 	14H 			//02AC 	2A14
		BCR 	STATUS,5 		//02AD 	1283
		STR 	20H 			//02AE 	01A0
		CLRR 	21H 			//02AF 	0121
		LCALL 	692H 			//02B0 	3692

		//;smartkey.C: 507: beepOn(); TMR2ON = 0; RegStatus.bits.b7 = 0;
		LCALL 	705H 			//02B1 	3705
		BCR 	STATUS,5 		//02B2 	1283
		BCR 	12H,2 			//02B3 	1112
		ORG		02B4H
		BCR 	72H,7 			//02B4 	13F2
		LDWI 	1EH 			//02B5 	2A1E

		//;smartkey.C: 508: beep(30, 1);
		CLRR 	24H 			//02B6 	0124
		INCR	24H,1 			//02B7 	09A4
		LCALL 	653H 			//02B8 	3653

		//;smartkey.C: 509: RegStatus.bits.b5 = 1;
		BSR 	72H,5 			//02B9 	1AF2
		LDWI 	0H 			//02BA 	2A00

		//;smartkey.C: 510: setState(0, 0);
		CLRR 	20H 			//02BB 	0120
		ORG		02BCH
		CLRR 	21H 			//02BC 	0121
		LCALL 	6DCH 			//02BD 	36DC

		//;smartkey.C: 512: tmp16 = timeTick + 40;
		LDR 	71H,0 			//02BE 	0871
		STR 	3FH 			//02BF 	01BF
		LDR 	70H,0 			//02C0 	0870
		STR 	3EH 			//02C1 	01BE
		LDWI 	28H 			//02C2 	2A28
		ADDWR 	3EH,1 			//02C3 	0BBE
		ORG		02C4H
		BTSC 	STATUS,0 		//02C4 	1403
		INCR	3FH,1 			//02C5 	09BF

		//;smartkey.C: 513: break;
		LJUMP 	319H 			//02C6 	3B19

		//;smartkey.C: 516: if (READ_EEPROM(0x08) == 0xcc) WRITE_EEPROM(0x08, 0);
		LDWI 	8H 			//02C7 	2A08
		LCALL 	6CFH 			//02C8 	36CF
		XORWI 	CCH 			//02C9 	26CC
		BTSS 	STATUS,2 		//02CA 	1D03
		LJUMP 	2CFH 			//02CB 	3ACF
		ORG		02CCH
		LDWI 	8H 			//02CC 	2A08
		CLRR 	20H 			//02CD 	0120
		LCALL 	620H 			//02CE 	3620

		//;smartkey.C: 517: if (RegStatus.bits.b7) {
		BTSS 	72H,7 			//02CF 	1FF2
		LJUMP 	2E5H 			//02D0 	3AE5

		//;smartkey.C: 518: setState(4, 6000);
		LDWI 	70H 			//02D1 	2A70
		BCR 	STATUS,5 		//02D2 	1283
		STR 	20H 			//02D3 	01A0
		ORG		02D4H
		LDWI 	17H 			//02D4 	2A17
		STR 	21H 			//02D5 	01A1
		LDWI 	4H 			//02D6 	2A04
		LCALL 	6DCH 			//02D7 	36DC

		//;smartkey.C: 519: cntTmp = timeTick + 40;
		LDR 	71H,0 			//02D8 	0871
		STR 	42H 			//02D9 	01C2
		LDR 	70H,0 			//02DA 	0870
		STR 	41H 			//02DB 	01C1
		ORG		02DCH
		LDWI 	28H 			//02DC 	2A28
		ADDWR 	41H,1 			//02DD 	0BC1
		BTSC 	STATUS,0 		//02DE 	1403
		INCR	42H,1 			//02DF 	09C2

		//;smartkey.C: 520: PR2L = 20;
		LDWI 	14H 			//02E0 	2A14
		BSR 	STATUS,5 		//02E1 	1A83
		STR 	11H 			//02E2 	0191

		//;smartkey.C: 521: beepOn();
		LCALL 	705H 			//02E3 	3705
		ORG		02E4H

		//;smartkey.C: 523: } else if (mtOldState == 0) {
		LJUMP 	319H 			//02E4 	3B19
		BCR 	STATUS,5 		//02E5 	1283
		LDR 	46H,1 			//02E6 	08C6
		BTSS 	STATUS,2 		//02E7 	1D03
		LJUMP 	2FDH 			//02E8 	3AFD

		//;smartkey.C: 525: beep(10, 5);
		LDWI 	5H 			//02E9 	2A05
		STR 	24H 			//02EA 	01A4
		LDWI 	AH 			//02EB 	2A0A
		ORG		02ECH
		LCALL 	653H 			//02EC 	3653

		//;smartkey.C: 526: RegStatus.bits.b0 = 1;
		BSR 	72H,0 			//02ED 	1872

		//;smartkey.C: 527: if (READ_EEPROM(0x40))WRITE_EEPROM(0x40, 0);
		LDWI 	40H 			//02EE 	2A40
		LCALL 	6CFH 			//02EF 	36CF
		XORWI 	0H 			//02F0 	2600
		BTSC 	STATUS,2 		//02F1 	1503
		LJUMP 	2F6H 			//02F2 	3AF6
		LDWI 	40H 			//02F3 	2A40
		ORG		02F4H
		CLRR 	20H 			//02F4 	0120
		LCALL 	620H 			//02F5 	3620

		//;smartkey.C: 528: setState(1, 3500);
		LDWI 	ACH 			//02F6 	2AAC
		BCR 	STATUS,5 		//02F7 	1283
		STR 	20H 			//02F8 	01A0
		LDWI 	DH 			//02F9 	2A0D
		STR 	21H 			//02FA 	01A1
		LDWI 	1H 			//02FB 	2A01
		ORG		02FCH
		LJUMP 	2BDH 			//02FC 	3ABD

		//;smartkey.C: 532: beepOn(); TMR2ON = 0;
		LCALL 	705H 			//02FD 	3705
		BCR 	STATUS,5 		//02FE 	1283
		BCR 	12H,2 			//02FF 	1112

		//;smartkey.C: 533: RegStatus.bits.b7 = 0;
		BCR 	72H,7 			//0300 	13F2
		LDWI 	1EH 			//0301 	2A1E

		//;smartkey.C: 534: beep(30, 1);
		CLRR 	24H 			//0302 	0124
		INCR	24H,1 			//0303 	09A4
		ORG		0304H
		LCALL 	653H 			//0304 	3653
		LDWI 	0H 			//0305 	2A00

		//;smartkey.C: 535: setState(0, 0);
		CLRR 	20H 			//0306 	0120
		CLRR 	21H 			//0307 	0121
		LCALL 	6DCH 			//0308 	36DC

		//;smartkey.C: 537: RegStatus.bits.b5 = 1;
		BSR 	72H,5 			//0309 	1AF2
		LJUMP 	2BEH 			//030A 	3ABE
		LDR 	74H,0 			//030B 	0874
		ORG		030CH
		XORWI 	1H 			//030C 	2601
		BTSC 	STATUS,2 		//030D 	1503
		LJUMP 	319H 			//030E 	3B19
		XORWI 	3H 			//030F 	2603
		BTSC 	STATUS,2 		//0310 	1503
		LJUMP 	2C7H 			//0311 	3AC7
		XORWI 	1H 			//0312 	2601
		BTSC 	STATUS,2 		//0313 	1503
		ORG		0314H
		LJUMP 	2A1H 			//0314 	3AA1
		XORWI 	7H 			//0315 	2607
		BTSC 	STATUS,2 		//0316 	1503
		LJUMP 	2ABH 			//0317 	3AAB
		LJUMP 	319H 			//0318 	3B19

		//;smartkey.C: 542: }
		//;smartkey.C: 544: if ((timeTick > tmp16) && (RegStatus.bits.b6 == 1)) {
		LDR 	71H,0 			//0319 	0871
		BCR 	STATUS,5 		//031A 	1283
		SUBWR 	3FH,0 			//031B 	0C3F
		ORG		031CH
		BTSS 	STATUS,2 		//031C 	1D03
		LJUMP 	320H 			//031D 	3B20
		LDR 	70H,0 			//031E 	0870
		SUBWR 	3EH,0 			//031F 	0C3E
		BTSS 	STATUS,0 		//0320 	1C03
		BTSS 	72H,6 			//0321 	1F72
		LJUMP 	3ECH 			//0322 	3BEC

		//;smartkey.C: 545: if (timeTick > 65000) timeTick = 0;
		LDWI 	FDH 			//0323 	2AFD
		ORG		0324H
		SUBWR 	71H,0 			//0324 	0C71
		LDWI 	E9H 			//0325 	2AE9
		BTSC 	STATUS,2 		//0326 	1503
		SUBWR 	70H,0 			//0327 	0C70
		BTSS 	STATUS,0 		//0328 	1C03
		LJUMP 	32CH 			//0329 	3B2C
		CLRR 	70H 			//032A 	0170
		CLRR 	71H 			//032B 	0171
		ORG		032CH

		//;smartkey.C: 546: tmp16 = timeTick + 40;
		LDR 	71H,0 			//032C 	0871
		STR 	3FH 			//032D 	01BF
		LDR 	70H,0 			//032E 	0870
		STR 	3EH 			//032F 	01BE
		LDWI 	28H 			//0330 	2A28
		ADDWR 	3EH,1 			//0331 	0BBE
		BTSC 	STATUS,0 		//0332 	1403
		INCR	3FH,1 			//0333 	09BF
		ORG		0334H

		//;smartkey.C: 548: if (AccRead(0x02,buf, 6) == 0) {
		LDWI 	33H 			//0334 	2A33
		STR 	24H 			//0335 	01A4
		LDWI 	6H 			//0336 	2A06
		STR 	25H 			//0337 	01A5
		LDWI 	2H 			//0338 	2A02
		LCALL 	58EH 			//0339 	358E
		IORWI 	0H 			//033A 	2500
		BTSS 	STATUS,2 		//033B 	1D03
		ORG		033CH
		LJUMP 	3ECH 			//033C 	3BEC

		//;smartkey.C: 550: if((mtState == 1) ){
		DECRSZ 	74H,0 		//033D 	0E74
		LJUMP 	3C9H 			//033E 	3BC9

		//;smartkey.C: 553: if (compe((signed char)buf[1], (signed char)acXsum, 4) && compe((signe
		//+                          d char)buf[3], (signed char)acYsum, 4)) {
		BCR 	STATUS,5 		//033F 	1283
		LDR 	3BH,0 			//0340 	083B
		STR 	20H 			//0341 	01A0
		LDWI 	4H 			//0342 	2A04
		STR 	21H 			//0343 	01A1
		ORG		0344H
		LDR 	34H,0 			//0344 	0834
		LCALL 	551H 			//0345 	3551
		XORWI 	0H 			//0346 	2600
		BCR 	STATUS,5 		//0347 	1283
		BTSC 	STATUS,2 		//0348 	1503
		LJUMP 	378H 			//0349 	3B78
		LDR 	39H,0 			//034A 	0839
		STR 	20H 			//034B 	01A0
		ORG		034CH
		LDWI 	4H 			//034C 	2A04
		STR 	21H 			//034D 	01A1
		LDR 	36H,0 			//034E 	0836
		LCALL 	551H 			//034F 	3551
		XORWI 	0H 			//0350 	2600

		//;smartkey.C: 555: isSw++;
		BCR 	STATUS,5 		//0351 	1283
		BTSC 	STATUS,2 		//0352 	1503
		LJUMP 	378H 			//0353 	3B78
		ORG		0354H
		LDWI 	2DH 			//0354 	2A2D
		INCR	3DH,1 			//0355 	09BD

		//;smartkey.C: 556: if (isSw > 44) {
		SUBWR 	3DH,0 			//0356 	0C3D
		BTSS 	STATUS,0 		//0357 	1C03
		LJUMP 	36BH 			//0358 	3B6B

		//;smartkey.C: 557: isSw = 0;
		CLRR 	3DH 			//0359 	013D

		//;smartkey.C: 558: RegStatus.bits.b5 = 1;
		BSR 	72H,5 			//035A 	1AF2

		//;smartkey.C: 561: RegStatus.bits.b0 = 0;
		BCR 	72H,0 			//035B 	1072
		ORG		035CH

		//;smartkey.C: 562: setState(2, 300);
		LDWI 	2CH 			//035C 	2A2C
		STR 	20H 			//035D 	01A0
		LDWI 	1H 			//035E 	2A01
		STR 	21H 			//035F 	01A1
		LDWI 	2H 			//0360 	2A02
		LCALL 	6DCH 			//0361 	36DC

		//;smartkey.C: 563: tmp16 = timeTick + 40;
		LDR 	71H,0 			//0362 	0871
		STR 	3FH 			//0363 	01BF
		ORG		0364H
		LDR 	70H,0 			//0364 	0870
		STR 	3EH 			//0365 	01BE
		LDWI 	28H 			//0366 	2A28
		ADDWR 	3EH,1 			//0367 	0BBE
		BTSC 	STATUS,0 		//0368 	1403
		INCR	3FH,1 			//0369 	09BF

		//;smartkey.C: 564: }
		LJUMP 	3A7H 			//036A 	3BA7

		//;smartkey.C: 565: else if (isSw > 25) {
		LDWI 	1AH 			//036B 	2A1A
		ORG		036CH
		SUBWR 	3DH,0 			//036C 	0C3D
		BTSC 	STATUS,0 		//036D 	1403

		//;smartkey.C: 566: if (isSw % 2 == 0) {
		BTSC 	3DH,0 			//036E 	143D
		LJUMP 	3A7H 			//036F 	3BA7

		//;smartkey.C: 567: beepOn(); TMR2ON = 0; beep(7, 1);
		LCALL 	705H 			//0370 	3705
		LDWI 	7H 			//0371 	2A07
		BCR 	STATUS,5 		//0372 	1283
		BCR 	12H,2 			//0373 	1112
		ORG		0374H
		CLRR 	24H 			//0374 	0124
		INCR	24H,1 			//0375 	09A4
		LCALL 	653H 			//0376 	3653
		LJUMP 	3A7H 			//0377 	3BA7

		//;smartkey.C: 572: else
		//;smartkey.C: 574: {
		//;smartkey.C: 575: isSw = 0;
		//;smartkey.C: 568: }
		//;smartkey.C: 569: }
		//;smartkey.C: 570: }
		CLRR 	3DH 			//0378 	013D

		//;smartkey.C: 578: if (compe((signed char)buf[1],acXOld,1 ) && compe((signed char)buf[3],
		//+                          acYOld,1)) {
		LDR 	32H,0 			//0379 	0832
		STR 	20H 			//037A 	01A0
		CLRR 	21H 			//037B 	0121
		ORG		037CH
		INCR	21H,1 			//037C 	09A1
		LDR 	34H,0 			//037D 	0834
		LCALL 	551H 			//037E 	3551
		XORWI 	0H 			//037F 	2600
		BCR 	STATUS,5 		//0380 	1283
		BTSC 	STATUS,2 		//0381 	1503
		LJUMP 	3A5H 			//0382 	3BA5
		LDR 	31H,0 			//0383 	0831
		ORG		0384H
		STR 	20H 			//0384 	01A0
		CLRR 	21H 			//0385 	0121
		INCR	21H,1 			//0386 	09A1
		LDR 	36H,0 			//0387 	0836
		LCALL 	551H 			//0388 	3551
		XORWI 	0H 			//0389 	2600

		//;smartkey.C: 579: isWait++;
		BCR 	STATUS,5 		//038A 	1283
		BTSC 	STATUS,2 		//038B 	1503
		ORG		038CH
		LJUMP 	3A5H 			//038C 	3BA5
		INCR	2DH,1 			//038D 	09AD
		BTSC 	STATUS,2 		//038E 	1503
		INCR	2EH,1 			//038F 	09AE

		//;smartkey.C: 580: if (isWait == 450) {
		DECR 	2EH,0 			//0390 	0D2E
		LDWI 	C2H 			//0391 	2AC2
		BTSC 	STATUS,2 		//0392 	1503
		XORWR 	2DH,0 			//0393 	042D
		ORG		0394H
		BTSS 	STATUS,2 		//0394 	1D03
		LJUMP 	3A7H 			//0395 	3BA7
		LDWI 	2H 			//0396 	2A02

		//;smartkey.C: 581: isWait = 0;
		CLRR 	2DH 			//0397 	012D
		CLRR 	2EH 			//0398 	012E

		//;smartkey.C: 582: beep(7, 2);
		STR 	24H 			//0399 	01A4
		LDWI 	7H 			//039A 	2A07
		LCALL 	653H 			//039B 	3653
		ORG		039CH

		//;smartkey.C: 583: RegStatus.bits.b5 = 1;
		BSR 	72H,5 			//039C 	1AF2

		//;smartkey.C: 584: RegStatus.bits.b0 = 0;
		BCR 	72H,0 			//039D 	1072

		//;smartkey.C: 585: setState(2, 300);
		LDWI 	2CH 			//039E 	2A2C
		STR 	20H 			//039F 	01A0
		LDWI 	1H 			//03A0 	2A01
		STR 	21H 			//03A1 	01A1
		LDWI 	2H 			//03A2 	2A02
		LCALL 	6DCH 			//03A3 	36DC
		ORG		03A4H
		LJUMP 	3A7H 			//03A4 	3BA7

		//;smartkey.C: 588: else
		//;smartkey.C: 589: {isWait = 0;}
		CLRR 	2DH 			//03A5 	012D
		CLRR 	2EH 			//03A6 	012E

		//;smartkey.C: 590: }
		//;smartkey.C: 593: if ( ((signed char)buf[5] > -15) && ((signed char)buf[5] < 15)) {
		LDR 	38H,0 			//03A7 	0838
		XORWI 	80H 			//03A8 	2680
		ADDWI 	8EH 			//03A9 	278E
		BTSS 	STATUS,0 		//03AA 	1C03
		LJUMP 	3C3H 			//03AB 	3BC3
		ORG		03ACH
		LDR 	38H,0 			//03AC 	0838
		XORWI 	80H 			//03AD 	2680
		ADDWI 	71H 			//03AE 	2771
		BTSC 	STATUS,0 		//03AF 	1403
		LJUMP 	3C3H 			//03B0 	3BC3
		LDWI 	5H 			//03B1 	2A05

		//;smartkey.C: 594: isFall++;
		INCR	2FH,1 			//03B2 	09AF

		//;smartkey.C: 595: if (isFall > 4) {
		SUBWR 	2FH,0 			//03B3 	0C2F
		ORG		03B4H
		BTSS 	STATUS,0 		//03B4 	1C03
		LJUMP 	3C4H 			//03B5 	3BC4
		LDWI 	2H 			//03B6 	2A02

		//;smartkey.C: 596: isFall = 0;
		CLRR 	2FH 			//03B7 	012F

		//;smartkey.C: 597: beep(7, 2);
		STR 	24H 			//03B8 	01A4
		LDWI 	7H 			//03B9 	2A07
		LCALL 	653H 			//03BA 	3653

		//;smartkey.C: 598: RegStatus.bits.b0 = 0;
		BCR 	72H,0 			//03BB 	1072
		ORG		03BCH

		//;smartkey.C: 599: setState(2, 300);
		LDWI 	2CH 			//03BC 	2A2C
		STR 	20H 			//03BD 	01A0
		LDWI 	1H 			//03BE 	2A01
		STR 	21H 			//03BF 	01A1
		LDWI 	2H 			//03C0 	2A02
		LCALL 	6DCH 			//03C1 	36DC
		LJUMP 	3C4H 			//03C2 	3BC4

		//;smartkey.C: 602: else {
		//;smartkey.C: 603: isFall = 0;
		CLRR 	2FH 			//03C3 	012F
		ORG		03C4H

		//;smartkey.C: 604: }
		//;smartkey.C: 607: acYOld =(signed char)buf[3]; acXOld = (signed char)buf[1];
		LDR 	36H,0 			//03C4 	0836
		STR 	31H 			//03C5 	01B1
		LDR 	34H,0 			//03C6 	0834
		STR 	32H 			//03C7 	01B2

		//;smartkey.C: 610: }
		LJUMP 	3ECH 			//03C8 	3BEC

		//;smartkey.C: 611: else if(mtState== 0){
		LDR 	74H,1 			//03C9 	08F4
		BTSC 	STATUS,2 		//03CA 	1503

		//;smartkey.C: 613: if (RegStatus.bits.b5) {
		BTSS 	72H,5 			//03CB 	1EF2
		ORG		03CCH
		LJUMP 	3ECH 			//03CC 	3BEC

		//;smartkey.C: 614: if (compe((signed char)buf[1],acXOld , 3) && compe((signed char)buf[3]
		//+                          ,acYOld , 3)) {
		BCR 	STATUS,5 		//03CD 	1283
		LDR 	32H,0 			//03CE 	0832
		STR 	20H 			//03CF 	01A0
		LDWI 	3H 			//03D0 	2A03
		STR 	21H 			//03D1 	01A1
		LDR 	34H,0 			//03D2 	0834
		LCALL 	551H 			//03D3 	3551
		ORG		03D4H
		XORWI 	0H 			//03D4 	2600
		BCR 	STATUS,5 		//03D5 	1283
		BTSC 	STATUS,2 		//03D6 	1503
		LJUMP 	3E4H 			//03D7 	3BE4
		LDR 	31H,0 			//03D8 	0831
		STR 	20H 			//03D9 	01A0
		LDWI 	3H 			//03DA 	2A03
		STR 	21H 			//03DB 	01A1
		ORG		03DCH
		LDR 	36H,0 			//03DC 	0836
		LCALL 	551H 			//03DD 	3551
		XORWI 	0H 			//03DE 	2600

		//;smartkey.C: 616: isSw = 0;
		BCR 	STATUS,5 		//03DF 	1283
		BTSC 	STATUS,2 		//03E0 	1503
		LJUMP 	3E4H 			//03E1 	3BE4
		CLRR 	3DH 			//03E2 	013D

		//;smartkey.C: 617: }
		LJUMP 	3ECH 			//03E3 	3BEC
		ORG		03E4H

		//;smartkey.C: 618: else {
		//;smartkey.C: 619: isSw++;
		INCR	3DH,1 			//03E4 	09BD

		//;smartkey.C: 620: beepOn(); TMR2ON = 0; beep(7, 3);
		LCALL 	705H 			//03E5 	3705
		LDWI 	3H 			//03E6 	2A03
		BCR 	STATUS,5 		//03E7 	1283
		BCR 	12H,2 			//03E8 	1112
		STR 	24H 			//03E9 	01A4
		LDWI 	7H 			//03EA 	2A07
		LCALL 	653H 			//03EB 	3653
		ORG		03ECH

		//;smartkey.C: 621: }
		//;smartkey.C: 622: }
		//;smartkey.C: 623: }
		//;smartkey.C: 626: }
		//;smartkey.C: 627: }
		//;smartkey.C: 629: if (RegStatus.bits.b0) {RC0 = 1; RC1 = 1;}
		BTSS 	72H,0 			//03EC 	1C72
		LJUMP 	3F2H 			//03ED 	3BF2
		BCR 	STATUS,5 		//03EE 	1283
		BSR 	7H,0 			//03EF 	1807
		BSR 	7H,1 			//03F0 	1887
		LJUMP 	3F5H 			//03F1 	3BF5

		//;smartkey.C: 630: else {RC0 = 0; RC1 = 0;}
		BCR 	STATUS,5 		//03F2 	1283
		BCR 	7H,0 			//03F3 	1007
		ORG		03F4H
		BCR 	7H,1 			//03F4 	1087

		//;smartkey.C: 633: if (timeTick > 500){
		LDWI 	1H 			//03F5 	2A01
		SUBWR 	71H,0 			//03F6 	0C71
		LDWI 	F5H 			//03F7 	2AF5
		BTSC 	STATUS,2 		//03F8 	1503
		SUBWR 	70H,0 			//03F9 	0C70
		BTSS 	STATUS,0 		//03FA 	1C03
		LJUMP 	1BBH 			//03FB 	39BB
		ORG		03FCH

		//;smartkey.C: 634: if (READ_EEPROM(0x3F)) WRITE_EEPROM(0x3F, 0);
		LDWI 	3FH 			//03FC 	2A3F
		LCALL 	6CFH 			//03FD 	36CF
		XORWI 	0H 			//03FE 	2600
		BTSC 	STATUS,2 		//03FF 	1503
		LJUMP 	404H 			//0400 	3C04
		LDWI 	3FH 			//0401 	2A3F
		CLRR 	20H 			//0402 	0120
		LCALL 	620H 			//0403 	3620
		ORG		0404H

		//;smartkey.C: 635: if (READ_EEPROM(0x40)) WRITE_EEPROM(0x40, 0);
		LDWI 	40H 			//0404 	2A40
		LCALL 	6CFH 			//0405 	36CF
		XORWI 	0H 			//0406 	2600
		BTSC 	STATUS,2 		//0407 	1503
		LJUMP 	1BBH 			//0408 	39BB
		LDWI 	40H 			//0409 	2A40
		CLRR 	20H 			//040A 	0120
		LCALL 	620H 			//040B 	3620
		ORG		040CH
		LJUMP 	1BBH 			//040C 	39BB

		//;smartkey.C: 50: if (PAIE && PAIF) {
		BTSC 	INTCON,3 		//040D 	158B
		BTSS 	INTCON,0 		//040E 	1C0B
		LJUMP 	41CH 			//040F 	3C1C
		BCR 	STATUS,5 		//0410 	1283
		LDR 	5H,0 			//0411 	0805

		//;smartkey.C: 52: PAIF = 0;
		BCR 	INTCON,0 		//0412 	100B

		//;smartkey.C: 54: if (RA5) {
		BTSS 	5H,5 			//0413 	1E85
		ORG		0414H
		LJUMP 	41BH 			//0414 	3C1B

		//;smartkey.C: 55: if (RegStatus.bits.b3 == 0) {
		BTSC 	72H,3 			//0415 	15F2
		LJUMP 	41CH 			//0416 	3C1C

		//;smartkey.C: 56: cntCyc = 0;
		CLRR 	73H 			//0417 	0173

		//;smartkey.C: 57: cntOff = 0;
		CLRR 	45H 			//0418 	0145

		//;smartkey.C: 59: RegStatus.bits.b3 = 1;
		BSR 	72H,3 			//0419 	19F2
		LJUMP 	41CH 			//041A 	3C1C

		//;smartkey.C: 62: else {
		//;smartkey.C: 63: cntOff = 0;
		CLRR 	45H 			//041B 	0145
		ORG		041CH

		//;smartkey.C: 64: }
		//;smartkey.C: 65: }
		//;smartkey.C: 67: if (INTE && INTF) {
		BTSC 	INTCON,4 		//041C 	160B
		BTSS 	INTCON,1 		//041D 	1C8B
		LJUMP 	432H 			//041E 	3C32

		//;smartkey.C: 68: INTF = 0;
		BCR 	INTCON,1 		//041F 	108B

		//;smartkey.C: 69: if ( RA2 == 0) {
		BCR 	STATUS,5 		//0420 	1283
		BTSC 	5H,2 			//0421 	1505
		LJUMP 	432H 			//0422 	3C32

		//;smartkey.C: 70: if (timeTick < 32) {
		LDWI 	0H 			//0423 	2A00
		ORG		0424H
		SUBWR 	71H,0 			//0424 	0C71
		LDWI 	20H 			//0425 	2A20
		BTSC 	STATUS,2 		//0426 	1503
		SUBWR 	70H,0 			//0427 	0C70
		BTSC 	STATUS,0 		//0428 	1403
		LJUMP 	431H 			//0429 	3C31

		//;smartkey.C: 71: tmp = READ_EEPROM(0x3F);
		LDWI 	3FH 			//042A 	2A3F
		LCALL 	6F0H 			//042B 	36F0
		ORG		042CH
		STR 	79H 			//042C 	01F9

		//;smartkey.C: 72: WRITE_EEPROM(0x3F, tmp + 1);
		INCR	79H,0 			//042D 	0979
		STR 	75H 			//042E 	01F5
		LDWI 	3FH 			//042F 	2A3F
		LCALL 	63BH 			//0430 	363B
		LJUMP 	431H 			//0431 	3C31

		//;smartkey.C: 75: }
		//;smartkey.C: 76: }
		//;smartkey.C: 79: if (T0IE && T0IF) {
		BTSC 	INTCON,5 		//0432 	168B
		BTSS 	INTCON,2 		//0433 	1D0B
		ORG		0434H
		LJUMP 	481H 			//0434 	3C81
		LDWI 	B3H 			//0435 	2AB3

		//;smartkey.C: 80: T0IF = 0;
		BCR 	INTCON,2 		//0436 	110B

		//;smartkey.C: 81: TMR0 = 179;
		BCR 	STATUS,5 		//0437 	1283
		STR 	1H 			//0438 	0181

		//;smartkey.C: 87: if ( RegStatus.bits.b3 == 1) {
		BTSS 	72H,3 			//0439 	1DF2
		LJUMP 	453H 			//043A 	3C53

		//;smartkey.C: 89: cntCyc++;
		INCR	73H,1 			//043B 	09F3
		ORG		043CH

		//;smartkey.C: 90: if (RA5 == 0) {
		BTSC 	5H,5 			//043C 	1685
		LJUMP 	453H 			//043D 	3C53
		LDWI 	10H 			//043E 	2A10

		//;smartkey.C: 92: cntOff++;
		INCR	45H,1 			//043F 	09C5

		//;smartkey.C: 94: if (cntOff > 15) {
		SUBWR 	45H,0 			//0440 	0C45
		BTSS 	STATUS,0 		//0441 	1C03
		LJUMP 	453H 			//0442 	3C53

		//;smartkey.C: 96: RegStatus.bits.b3 = 0;
		BCR 	72H,3 			//0443 	11F2
		ORG		0444H

		//;smartkey.C: 98: if ((cntCyc > 15) && (cntCyc < 50)) {
		LDWI 	10H 			//0444 	2A10
		SUBWR 	73H,0 			//0445 	0C73
		LDWI 	32H 			//0446 	2A32
		BTSS 	STATUS,0 		//0447 	1C03
		LJUMP 	44FH 			//0448 	3C4F
		SUBWR 	73H,0 			//0449 	0C73
		BTSC 	STATUS,0 		//044A 	1403
		LJUMP 	44EH 			//044B 	3C4E
		ORG		044CH

		//;smartkey.C: 99: RegStatus.bits.b2 =1;
		BSR 	72H,2 			//044C 	1972

		//;smartkey.C: 100: } else if (cntCyc >= 50) {
		LJUMP 	452H 			//044D 	3C52
		LDWI 	32H 			//044E 	2A32
		SUBWR 	73H,0 			//044F 	0C73
		BTSC 	STATUS,0 		//0450 	1403

		//;smartkey.C: 101: RegStatus.bits.b2 =0;
		BCR 	72H,2 			//0451 	1172

		//;smartkey.C: 102: }
		//;smartkey.C: 103: RegStatus.bits.b1 = 1;
		BSR 	72H,1 			//0452 	18F2

		//;smartkey.C: 104: }
		//;smartkey.C: 105: }
		//;smartkey.C: 106: }
		//;smartkey.C: 108: timeTick++;
		INCR	70H,1 			//0453 	09F0
		ORG		0454H
		BTSC 	STATUS,2 		//0454 	1503
		INCR	71H,1 			//0455 	09F1

		//;smartkey.C: 110: if ((mtState == 4) || (mtState == 3)) {
		LDR 	74H,0 			//0456 	0874
		XORWI 	4H 			//0457 	2604
		BTSC 	STATUS,2 		//0458 	1503
		LJUMP 	45EH 			//0459 	3C5E
		LDR 	74H,0 			//045A 	0874
		XORWI 	3H 			//045B 	2603
		ORG		045CH
		BTSS 	STATUS,2 		//045C 	1D03
		LJUMP 	481H 			//045D 	3C81

		//;smartkey.C: 111: if (timeTick > cntTmp) {
		LDR 	71H,0 			//045E 	0871
		SUBWR 	42H,0 			//045F 	0C42
		BTSS 	STATUS,2 		//0460 	1D03
		LJUMP 	464H 			//0461 	3C64
		LDR 	70H,0 			//0462 	0870
		SUBWR 	41H,0 			//0463 	0C41
		ORG		0464H
		BTSC 	STATUS,0 		//0464 	1403
		LJUMP 	481H 			//0465 	3C81

		//;smartkey.C: 112: cntTmp = timeTick + 38;
		LDR 	71H,0 			//0466 	0871
		STR 	42H 			//0467 	01C2
		LDR 	70H,0 			//0468 	0870
		STR 	41H 			//0469 	01C1
		LDWI 	26H 			//046A 	2A26
		ADDWR 	41H,1 			//046B 	0BC1
		ORG		046CH
		BTSC 	STATUS,0 		//046C 	1403
		INCR	42H,1 			//046D 	09C2

		//;smartkey.C: 113: if (cntTmp <= timeOut)
		LDR 	42H,0 			//046E 	0842
		SUBWR 	44H,0 			//046F 	0C44
		BTSS 	STATUS,2 		//0470 	1D03
		LJUMP 	474H 			//0471 	3C74
		LDR 	41H,0 			//0472 	0841
		SUBWR 	43H,0 			//0473 	0C43
		ORG		0474H

		//;smartkey.C: 114: {
		//;smartkey.C: 115: TMR2IE = 0;
		BSR 	STATUS,5 		//0474 	1A83
		BTSS 	STATUS,0 		//0475 	1C03
		LJUMP 	482H 			//0476 	3C82
		BCR 	CH,1 			//0477 	108C

		//;smartkey.C: 116: if (PR2L == 20)
		LDR 	11H,0 			//0478 	0811
		XORWI 	14H 			//0479 	2614
		BTSS 	STATUS,2 		//047A 	1D03
		LJUMP 	47EH 			//047B 	3C7E
		ORG		047CH

		//;smartkey.C: 117: PR2L = 25;
		LDWI 	19H 			//047C 	2A19
		LJUMP 	47FH 			//047D 	3C7F

		//;smartkey.C: 118: else
		//;smartkey.C: 119: PR2L = 20;
		LDWI 	14H 			//047E 	2A14
		STR 	11H 			//047F 	0191

		//;smartkey.C: 120: TMR2IE = 1;
		BSR 	CH,1 			//0480 	188C

		//;smartkey.C: 121: }
		//;smartkey.C: 122: }
		//;smartkey.C: 123: }
		//;smartkey.C: 124: }
		//;smartkey.C: 127: if (TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//0481 	1A83
		BTSS 	CH,1 			//0482 	1C8C
		LJUMP 	48AH 			//0483 	3C8A
		ORG		0484H
		BCR 	STATUS,5 		//0484 	1283
		BTSS 	CH,1 			//0485 	1C8C
		LJUMP 	48AH 			//0486 	3C8A
		LDWI 	8H 			//0487 	2A08

		//;smartkey.C: 128: {
		//;smartkey.C: 129: TMR2IF = 0;
		BCR 	CH,1 			//0488 	108C

		//;smartkey.C: 130: RA3 = ~ RA3;
		XORWR 	5H,1 			//0489 	0485
		LDR 	78H,0 			//048A 	0878
		STR 	PCLATH 			//048B 	018A
		ORG		048CH
		SWAPR 	77H,0 			//048C 	0777
		STR 	STATUS 			//048D 	0183
		SWAPR 	7EH,1 			//048E 	07FE
		SWAPR 	7EH,0 			//048F 	077E
		RETI		 			//0490 	0009
		CLRR 	25H 			//0491 	0125
		BTSS 	21H,7 			//0492 	1FA1
		LJUMP 	49BH 			//0493 	3C9B
		ORG		0494H
		COMR 	20H,1 			//0494 	0FA0
		COMR 	21H,1 			//0495 	0FA1
		INCR	20H,1 			//0496 	09A0
		BTSC 	STATUS,2 		//0497 	1503
		INCR	21H,1 			//0498 	09A1
		CLRR 	25H 			//0499 	0125
		INCR	25H,1 			//049A 	09A5
		BTSS 	23H,7 			//049B 	1FA3
		ORG		049CH
		LJUMP 	4A4H 			//049C 	3CA4
		COMR 	22H,1 			//049D 	0FA2
		COMR 	23H,1 			//049E 	0FA3
		INCR	22H,1 			//049F 	09A2
		BTSC 	STATUS,2 		//04A0 	1503
		INCR	23H,1 			//04A1 	09A3
		LDWI 	1H 			//04A2 	2A01
		XORWR 	25H,1 			//04A3 	04A5
		ORG		04A4H
		CLRR 	26H 			//04A4 	0126
		CLRR 	27H 			//04A5 	0127
		LDR 	21H,0 			//04A6 	0821
		IORWR 	20H,0 			//04A7 	0320
		BTSC 	STATUS,2 		//04A8 	1503
		LJUMP 	4C9H 			//04A9 	3CC9
		CLRR 	24H 			//04AA 	0124
		INCR	24H,1 			//04AB 	09A4
		ORG		04ACH
		BTSC 	21H,7 			//04AC 	17A1
		LJUMP 	4B2H 			//04AD 	3CB2
		BCR 	STATUS,0 		//04AE 	1003
		RLR 	20H,1 			//04AF 	05A0
		RLR 	21H,1 			//04B0 	05A1
		LJUMP 	4ABH 			//04B1 	3CAB
		BCR 	STATUS,0 		//04B2 	1003
		RLR 	26H,1 			//04B3 	05A6
		ORG		04B4H
		RLR 	27H,1 			//04B4 	05A7
		LDR 	21H,0 			//04B5 	0821
		SUBWR 	23H,0 			//04B6 	0C23
		BTSS 	STATUS,2 		//04B7 	1D03
		LJUMP 	4BBH 			//04B8 	3CBB
		LDR 	20H,0 			//04B9 	0820
		SUBWR 	22H,0 			//04BA 	0C22
		BTSS 	STATUS,0 		//04BB 	1C03
		ORG		04BCH
		LJUMP 	4C5H 			//04BC 	3CC5
		LDR 	20H,0 			//04BD 	0820
		SUBWR 	22H,1 			//04BE 	0CA2
		LDR 	21H,0 			//04BF 	0821
		BTSS 	STATUS,0 		//04C0 	1C03
		DECR 	23H,1 			//04C1 	0DA3
		SUBWR 	23H,1 			//04C2 	0CA3
		BSR 	26H,0 			//04C3 	1826
		ORG		04C4H
		BCR 	STATUS,0 		//04C4 	1003
		RRR	21H,1 			//04C5 	06A1
		RRR	20H,1 			//04C6 	06A0
		DECRSZ 	24H,1 		//04C7 	0EA4
		LJUMP 	4B2H 			//04C8 	3CB2
		LDR 	25H,0 			//04C9 	0825
		BTSC 	STATUS,2 		//04CA 	1503
		LJUMP 	4D1H 			//04CB 	3CD1
		ORG		04CCH
		COMR 	26H,1 			//04CC 	0FA6
		COMR 	27H,1 			//04CD 	0FA7
		INCR	26H,1 			//04CE 	09A6
		BTSC 	STATUS,2 		//04CF 	1503
		INCR	27H,1 			//04D0 	09A7
		LDR 	27H,0 			//04D1 	0827
		STR 	21H 			//04D2 	01A1
		LDR 	26H,0 			//04D3 	0826
		ORG		04D4H
		STR 	20H 			//04D4 	01A0
		RET		 					//04D5 	0004

		//;mpu6x.c: 28: }
		//;mpu6x.c: 29: return 0;
		STR 	21H 			//04D6 	01A1
		CLRR 	22H 			//04D7 	0122

		//;SWI2C.C: 115: RA7 = 0;
		BCR 	5H,7 			//04D8 	1385

		//;SWI2C.C: 116: TRISA |=0x40;;
		BSR 	STATUS,5 		//04D9 	1A83
		BSR 	5H,6 			//04DA 	1B05

		//;SWI2C.C: 117: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//04DB 	2A05
		ORG		04DCH
		BCR 	STATUS,5 		//04DC 	1283
		STR 	20H 			//04DD 	01A0
		DECRSZ 	20H,1 		//04DE 	0EA0
		LJUMP 	4DEH 			//04DF 	3CDE

		//;SWI2C.C: 118: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//04E0 	1283
		CLRR 	23H 			//04E1 	0123
		LDWI 	5H 			//04E2 	2A05

		//;SWI2C.C: 119: {
		//;SWI2C.C: 120: RA7 = 1;
		BSR 	5H,7 			//04E3 	1B85
		ORG		04E4H

		//;SWI2C.C: 121: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//04E4 	01A0
		DECRSZ 	20H,1 		//04E5 	0EA0
		LJUMP 	4E5H 			//04E6 	3CE5

		//;SWI2C.C: 122: dat = dat<<1 |(RA6 & 1 );
		LDWI 	0H 			//04E7 	2A00
		BCR 	STATUS,5 		//04E8 	1283
		BTSC 	5H,6 			//04E9 	1705
		LDWI 	1H 			//04EA 	2A01
		ANDWI 	1H 			//04EB 	2401
		ORG		04ECH
		STR 	20H 			//04EC 	01A0
		BCR 	STATUS,0 		//04ED 	1003
		RLR 	22H,0 			//04EE 	0522
		IORWR 	20H,0 			//04EF 	0320
		STR 	22H 			//04F0 	01A2
		LDWI 	5H 			//04F1 	2A05

		//;SWI2C.C: 125: RA7 = 0;
		BCR 	5H,7 			//04F2 	1385

		//;SWI2C.C: 126: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//04F3 	01A0
		ORG		04F4H
		DECRSZ 	20H,1 		//04F4 	0EA0
		LJUMP 	4F4H 			//04F5 	3CF4
		LDWI 	8H 			//04F6 	2A08
		BCR 	STATUS,5 		//04F7 	1283
		INCR	23H,1 			//04F8 	09A3
		SUBWR 	23H,0 			//04F9 	0C23
		BTSS 	STATUS,0 		//04FA 	1C03
		LJUMP 	4E2H 			//04FB 	3CE2
		ORG		04FCH

		//;SWI2C.C: 127: }
		//;SWI2C.C: 129: TRISA &=0xbf;;
		BSR 	STATUS,5 		//04FC 	1A83
		BCR 	5H,6 			//04FD 	1305

		//;SWI2C.C: 131: RA6 = (Ack) ? 1 : 0;
		BCR 	STATUS,5 		//04FE 	1283
		LDR 	21H,1 			//04FF 	08A1
		BCR 	STATUS,5 		//0500 	1283
		BTSC 	STATUS,2 		//0501 	1503
		LJUMP 	505H 			//0502 	3D05
		BSR 	5H,6 			//0503 	1B05
		ORG		0504H
		LJUMP 	506H 			//0504 	3D06
		BCR 	5H,6 			//0505 	1305
		LDWI 	5H 			//0506 	2A05

		//;SWI2C.C: 132: RA7 = 1;
		BSR 	5H,7 			//0507 	1B85

		//;SWI2C.C: 133: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0508 	01A0
		DECRSZ 	20H,1 		//0509 	0EA0
		LJUMP 	509H 			//050A 	3D09
		LDWI 	5H 			//050B 	2A05
		ORG		050CH

		//;SWI2C.C: 134: RA7 = 0;
		BCR 	STATUS,5 		//050C 	1283
		BCR 	5H,7 			//050D 	1385

		//;SWI2C.C: 135: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//050E 	01A0
		DECRSZ 	20H,1 		//050F 	0EA0
		LJUMP 	50FH 			//0510 	3D0F

		//;SWI2C.C: 136: return dat;
		BCR 	STATUS,5 		//0511 	1283
		LDR 	22H,0 			//0512 	0822
		RET		 					//0513 	0004
		ORG		0514H
		BCR 	STATUS,5 		//0514 	1283
		STR 	21H 			//0515 	01A1

		//;SWI2C.C: 89: TRISA &=0xbf;;
		BSR 	STATUS,5 		//0516 	1A83
		BCR 	5H,6 			//0517 	1305

		//;SWI2C.C: 90: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0518 	2A05
		BCR 	STATUS,5 		//0519 	1283
		STR 	20H 			//051A 	01A0
		DECRSZ 	20H,1 		//051B 	0EA0
		ORG		051CH
		LJUMP 	51BH 			//051C 	3D1B

		//;SWI2C.C: 91: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//051D 	1283
		CLRR 	22H 			//051E 	0122

		//;SWI2C.C: 92: {
		//;SWI2C.C: 93: RA6 = (dat&0x80) ? 1:0;
		BTSS 	21H,7 			//051F 	1FA1
		LJUMP 	524H 			//0520 	3D24
		BCR 	STATUS,5 		//0521 	1283
		BSR 	5H,6 			//0522 	1B05
		LJUMP 	526H 			//0523 	3D26
		ORG		0524H
		BCR 	STATUS,5 		//0524 	1283
		BCR 	5H,6 			//0525 	1305
		LDWI 	5H 			//0526 	2A05

		//;SWI2C.C: 94: dat<<=1;
		BCR 	STATUS,0 		//0527 	1003
		RLR 	21H,1 			//0528 	05A1

		//;SWI2C.C: 95: RA7 = 1;
		BSR 	5H,7 			//0529 	1B85

		//;SWI2C.C: 96: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//052A 	01A0
		DECRSZ 	20H,1 		//052B 	0EA0
		ORG		052CH
		LJUMP 	52BH 			//052C 	3D2B
		LDWI 	5H 			//052D 	2A05

		//;SWI2C.C: 97: RA7 = 0;
		BCR 	STATUS,5 		//052E 	1283
		BCR 	5H,7 			//052F 	1385

		//;SWI2C.C: 98: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0530 	01A0
		DECRSZ 	20H,1 		//0531 	0EA0
		LJUMP 	531H 			//0532 	3D31
		LDWI 	8H 			//0533 	2A08
		ORG		0534H
		BCR 	STATUS,5 		//0534 	1283
		INCR	22H,1 			//0535 	09A2
		SUBWR 	22H,0 			//0536 	0C22
		BTSS 	STATUS,0 		//0537 	1C03
		LJUMP 	51FH 			//0538 	3D1F

		//;SWI2C.C: 99: }
		//;SWI2C.C: 101: TRISA |=0x40;;
		BSR 	STATUS,5 		//0539 	1A83
		BSR 	5H,6 			//053A 	1B05

		//;SWI2C.C: 102: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//053B 	2A05
		ORG		053CH
		BCR 	STATUS,5 		//053C 	1283
		STR 	20H 			//053D 	01A0
		DECRSZ 	20H,1 		//053E 	0EA0
		LJUMP 	53EH 			//053F 	3D3E
		LDWI 	5H 			//0540 	2A05

		//;SWI2C.C: 103: RA7 = 1;
		BCR 	STATUS,5 		//0541 	1283
		BSR 	5H,7 			//0542 	1B85

		//;SWI2C.C: 104: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0543 	01A0
		ORG		0544H
		DECRSZ 	20H,1 		//0544 	0EA0
		LJUMP 	544H 			//0545 	3D44

		//;SWI2C.C: 105: i= RA6;
		LDWI 	0H 			//0546 	2A00
		BCR 	STATUS,5 		//0547 	1283
		BTSC 	5H,6 			//0548 	1705
		LDWI 	1H 			//0549 	2A01
		STR 	22H 			//054A 	01A2

		//;SWI2C.C: 106: RA7 = 0;
		BCR 	5H,7 			//054B 	1385
		ORG		054CH

		//;SWI2C.C: 107: TRISA &=0xbf;;
		BSR 	STATUS,5 		//054C 	1A83
		BCR 	5H,6 			//054D 	1305

		//;SWI2C.C: 108: return i;
		BCR 	STATUS,5 		//054E 	1283
		LDR 	22H,0 			//054F 	0822
		RET		 					//0550 	0004
		STR 	24H 			//0551 	01A4

		//;smartkey.C: 192: if (a > b) {
		LDR 	20H,0 			//0552 	0820
		XORWI 	80H 			//0553 	2680
		ORG		0554H
		STR 	22H 			//0554 	01A2
		LDR 	24H,0 			//0555 	0824
		XORWI 	80H 			//0556 	2680
		SUBWR 	22H,1 			//0557 	0CA2
		BTSC 	STATUS,0 		//0558 	1403
		LJUMP 	581H 			//0559 	3D81

		//;smartkey.C: 193: if ((a - b) <= dt) return 1;
		LDR 	20H,0 			//055A 	0820
		SUBWR 	24H,0 			//055B 	0C24
		ORG		055CH
		STR 	22H 			//055C 	01A2
		CLRR 	23H 			//055D 	0123
		BTSS 	STATUS,0 		//055E 	1C03
		DECR 	23H,1 			//055F 	0DA3
		BTSC 	24H,7 			//0560 	17A4
		DECR 	23H,1 			//0561 	0DA3
		BTSC 	20H,7 			//0562 	17A0
		INCR	23H,1 			//0563 	09A3
		ORG		0564H
		BCR 	STATUS,5 		//0564 	1283
		LDR 	23H,0 			//0565 	0823
		XORWI 	80H 			//0566 	2680
		SUBWI 	80H 			//0567 	2880
		BTSS 	STATUS,2 		//0568 	1D03
		LJUMP 	56CH 			//0569 	3D6C
		LDR 	22H,0 			//056A 	0822
		SUBWR 	21H,0 			//056B 	0C21
		ORG		056CH
		BTSS 	STATUS,0 		//056C 	1C03
		RETW 	0H 			//056D 	2100
		RETW 	1H 			//056E 	2101

		//;smartkey.C: 197: if ((b - a) <= dt) return 1;
		SUBWR 	20H,0 			//056F 	0C20
		STR 	22H 			//0570 	01A2
		CLRR 	23H 			//0571 	0123
		BTSS 	STATUS,0 		//0572 	1C03
		DECR 	23H,1 			//0573 	0DA3
		ORG		0574H
		BTSC 	20H,7 			//0574 	17A0
		DECR 	23H,1 			//0575 	0DA3
		BTSC 	24H,7 			//0576 	17A4
		INCR	23H,1 			//0577 	09A3
		BCR 	STATUS,5 		//0578 	1283
		LDR 	23H,0 			//0579 	0823
		XORWI 	80H 			//057A 	2680
		SUBWI 	80H 			//057B 	2880
		ORG		057CH
		BTSS 	STATUS,2 		//057C 	1D03
		LJUMP 	56CH 			//057D 	3D6C
		LDR 	22H,0 			//057E 	0822
		SUBWR 	21H,0 			//057F 	0C21
		LJUMP 	56CH 			//0580 	3D6C

		//;smartkey.C: 194: else return 0;
		//;smartkey.C: 196: else if (a < b) {
		LDR 	24H,0 			//0581 	0824
		XORWI 	80H 			//0582 	2680
		STR 	22H 			//0583 	01A2
		ORG		0584H
		LDR 	20H,0 			//0584 	0820
		XORWI 	80H 			//0585 	2680
		SUBWR 	22H,1 			//0586 	0CA2

		//;smartkey.C: 200: else if (a == b) {
		LDR 	24H,0 			//0587 	0824
		BTSS 	STATUS,0 		//0588 	1C03
		LJUMP 	56FH 			//0589 	3D6F
		XORWR 	20H,0 			//058A 	0420
		BTSC 	STATUS,2 		//058B 	1503
		ORG		058CH
		RETW 	1H 			//058C 	2101
		RETW 	0H 			//058D 	2100
		STR 	28H 			//058E 	01A8

		//;mpu6x.c: 35: unsigned char i;
		//;mpu6x.c: 37: swI2C_Start();
		LCALL 	67FH 			//058F 	367F

		//;mpu6x.c: 38: if(swI2C_WriteByte(0x18<<1)== 0 )
		LDWI 	30H 			//0590 	2A30
		LCALL 	514H 			//0591 	3514
		IORWI 	0H 			//0592 	2500
		BTSS 	STATUS,2 		//0593 	1D03
		ORG		0594H
		RETW 	1H 			//0594 	2101

		//;mpu6x.c: 39: {
		//;mpu6x.c: 40: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	28H,0 			//0595 	0828
		LCALL 	514H 			//0596 	3514
		IORWI 	0H 			//0597 	2500
		BTSS 	STATUS,2 		//0598 	1D03
		RETW 	2H 			//0599 	2102

		//;mpu6x.c: 41: {
		//;mpu6x.c: 42: swI2C_Start();
		LCALL 	67FH 			//059A 	367F

		//;mpu6x.c: 43: if(swI2C_WriteByte((0x18<<1)|1)== 0 ){
		LDWI 	31H 			//059B 	2A31
		ORG		059CH
		LCALL 	514H 			//059C 	3514
		IORWI 	0H 			//059D 	2500
		BTSS 	STATUS,2 		//059E 	1D03
		RETW 	1H 			//059F 	2101

		//;mpu6x.c: 45: for(i=0; i<(len-1);i++){
		CLRR 	29H 			//05A0 	0129
		LDR 	25H,0 			//05A1 	0825
		ADDWI 	FFH 			//05A2 	27FF
		STR 	26H 			//05A3 	01A6
		ORG		05A4H
		LDWI 	FFH 			//05A4 	2AFF
		BTSC 	STATUS,0 		//05A5 	1403
		LDWI 	0H 			//05A6 	2A00
		STR 	27H 			//05A7 	01A7
		XORWI 	80H 			//05A8 	2680
		SUBWI 	80H 			//05A9 	2880
		BTSS 	STATUS,2 		//05AA 	1D03
		LJUMP 	5AEH 			//05AB 	3DAE
		ORG		05ACH
		LDR 	26H,0 			//05AC 	0826
		SUBWR 	29H,0 			//05AD 	0C29

		//;mpu6x.c: 46: dat[i]=swI2C_ReadByte(0);
		BCR 	STATUS,5 		//05AE 	1283
		LDR 	29H,0 			//05AF 	0829
		BTSC 	STATUS,0 		//05B0 	1403
		LJUMP 	5BBH 			//05B1 	3DBB
		ADDWR 	24H,0 			//05B2 	0B24
		STR 	26H 			//05B3 	01A6
		ORG		05B4H
		STR 	FSR 			//05B4 	0184
		LDWI 	0H 			//05B5 	2A00
		LCALL 	4D6H 			//05B6 	34D6
		BCR 	STATUS,7 		//05B7 	1383
		STR 	INDF 			//05B8 	0180
		INCR	29H,1 			//05B9 	09A9
		LJUMP 	5A1H 			//05BA 	3DA1

		//;mpu6x.c: 47: }
		//;mpu6x.c: 48: dat[i]=swI2C_ReadByte(1);
		ADDWR 	24H,0 			//05BB 	0B24
		ORG		05BCH
		STR 	26H 			//05BC 	01A6
		LDR 	26H,0 			//05BD 	0826
		STR 	FSR 			//05BE 	0184
		LDWI 	1H 			//05BF 	2A01
		LCALL 	4D6H 			//05C0 	34D6
		BCR 	STATUS,7 		//05C1 	1383
		STR 	INDF 			//05C2 	0180

		//;mpu6x.c: 49: swI2C_Stop();
		LCALL 	6C2H 			//05C3 	36C2
		ORG		05C4H

		//;mpu6x.c: 50: return 0;
		RETW 	0H 			//05C4 	2100

		//;mpu6x.c: 56: else
		//;mpu6x.c: 57: return 2;
		//;mpu6x.c: 53: else
		//;mpu6x.c: 54: return 1;
		STR 	26H 			//05C5 	01A6

		//;mpu6x.c: 5: unsigned char i;
		//;mpu6x.c: 7: for(i=0; i<len;i++){
		CLRR 	27H 			//05C6 	0127
		LDR 	24H,0 			//05C7 	0824
		SUBWR 	27H,0 			//05C8 	0C27
		BTSC 	STATUS,0 		//05C9 	1403
		RETW 	0H 			//05CA 	2100

		//;mpu6x.c: 8: swI2C_Start();
		LCALL 	67FH 			//05CB 	367F
		ORG		05CCH

		//;mpu6x.c: 10: if(swI2C_WriteByte(0x18<<1)== 0 )
		LDWI 	30H 			//05CC 	2A30
		LCALL 	514H 			//05CD 	3514
		IORWI 	0H 			//05CE 	2500
		BTSS 	STATUS,2 		//05CF 	1D03
		RETW 	1H 			//05D0 	2101

		//;mpu6x.c: 11: {
		//;mpu6x.c: 12: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	26H,0 			//05D1 	0826
		LCALL 	514H 			//05D2 	3514
		IORWI 	0H 			//05D3 	2500
		ORG		05D4H
		BTSS 	STATUS,2 		//05D4 	1D03
		RETW 	2H 			//05D5 	2102

		//;mpu6x.c: 13: {
		//;mpu6x.c: 15: {
		//;mpu6x.c: 16: if(swI2C_WriteByte(dat[i])==1 ){
		LDR 	27H,0 			//05D6 	0827
		ADDWR 	23H,0 			//05D7 	0B23
		STR 	25H 			//05D8 	01A5
		STR 	FSR 			//05D9 	0184
		BCR 	STATUS,7 		//05DA 	1383
		LDR 	INDF,0 			//05DB 	0800
		ORG		05DCH
		LCALL 	514H 			//05DC 	3514
		XORWI 	1H 			//05DD 	2601
		BTSS 	STATUS,2 		//05DE 	1D03
		LJUMP 	5E2H 			//05DF 	3DE2

		//;mpu6x.c: 17: swI2C_Stop();
		LCALL 	6C2H 			//05E0 	36C2

		//;mpu6x.c: 18: return 3;
		RETW 	3H 			//05E1 	2103

		//;mpu6x.c: 19: }
		//;mpu6x.c: 20: }
		//;mpu6x.c: 21: swI2C_Stop();
		LCALL 	6C2H 			//05E2 	36C2

		//;mpu6x.c: 26: else
		//;mpu6x.c: 27: return 1;
		//;mpu6x.c: 23: else
		//;mpu6x.c: 24: return 2;
		//;mpu6x.c: 22: }
		BCR 	STATUS,5 		//05E3 	1283
		ORG		05E4H
		INCR	27H,1 			//05E4 	09A7
		LJUMP 	5C7H 			//05E5 	3DC7

		//;SWI2C.C: 10: TRISA &=0xbf;;
		BSR 	STATUS,5 		//05E6 	1A83
		BCR 	5H,6 			//05E7 	1305

		//;SWI2C.C: 11: TRISA &=0x7f;;
		BCR 	5H,7 			//05E8 	1385

		//;SWI2C.C: 12: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05E9 	2A05
		BCR 	STATUS,5 		//05EA 	1283
		STR 	20H 			//05EB 	01A0
		ORG		05ECH
		DECRSZ 	20H,1 		//05EC 	0EA0
		LJUMP 	5ECH 			//05ED 	3DEC
		LDWI 	5H 			//05EE 	2A05

		//;SWI2C.C: 13: RA7 = 1;
		BCR 	STATUS,5 		//05EF 	1283
		BSR 	5H,7 			//05F0 	1B85
		BSR 	5H,6 			//05F1 	1B05

		//;SWI2C.C: 15: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05F2 	01A0
		DECRSZ 	20H,1 		//05F3 	0EA0
		ORG		05F4H
		LJUMP 	5F3H 			//05F4 	3DF3

		//;SWI2C.C: 16: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05F5 	2A05
		BCR 	STATUS,5 		//05F6 	1283
		STR 	20H 			//05F7 	01A0
		DECRSZ 	20H,1 		//05F8 	0EA0
		LJUMP 	5F8H 			//05F9 	3DF8

		//;SWI2C.C: 17: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05FA 	2A05
		BCR 	STATUS,5 		//05FB 	1283
		ORG		05FCH
		STR 	20H 			//05FC 	01A0
		DECRSZ 	20H,1 		//05FD 	0EA0
		LJUMP 	5FDH 			//05FE 	3DFD

		//;SWI2C.C: 18: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05FF 	2A05
		BCR 	STATUS,5 		//0600 	1283
		STR 	20H 			//0601 	01A0
		DECRSZ 	20H,1 		//0602 	0EA0
		LJUMP 	602H 			//0603 	3E02
		ORG		0604H
		RET		 					//0604 	0004

		//;sysinit.c: 88: INTCON = 0B00000000;
		CLRR 	INTCON 			//0605 	010B

		//;sysinit.c: 89: PIE1 = 0B00000000;
		BSR 	STATUS,5 		//0606 	1A83
		CLRR 	CH 			//0607 	010C

		//;sysinit.c: 90: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//0608 	1283
		CLRR 	CH 			//0609 	010C

		//;sysinit.c: 92: IOCA5 = 1;
		BSR 	STATUS,5 		//060A 	1A83
		BSR 	16H,5 			//060B 	1A96
		ORG		060CH

		//;sysinit.c: 93: tmp = PORTA;
		BCR 	STATUS,5 		//060C 	1283
		LDR 	5H,0 			//060D 	0805

		//;sysinit.c: 94: PAIF = 0;
		BCR 	INTCON,0 		//060E 	100B

		//;sysinit.c: 95: PAIE = 0;
		BCR 	INTCON,3 		//060F 	118B

		//;sysinit.c: 98: INTEDG = 0;
		BSR 	STATUS,5 		//0610 	1A83
		BCR 	1H,6 			//0611 	1301

		//;sysinit.c: 99: INTF = 0;
		BCR 	INTCON,1 		//0612 	108B

		//;sysinit.c: 100: INTE = 1;
		BSR 	INTCON,4 		//0613 	1A0B
		ORG		0614H

		//;sysinit.c: 102: TMR2IF = 0;
		BCR 	STATUS,5 		//0614 	1283
		BCR 	CH,1 			//0615 	108C

		//;sysinit.c: 103: TMR2IE = 1;
		BSR 	STATUS,5 		//0616 	1A83
		BSR 	CH,1 			//0617 	188C

		//;sysinit.c: 104: TMR2ON = 0;
		BCR 	STATUS,5 		//0618 	1283
		BCR 	12H,2 			//0619 	1112

		//;sysinit.c: 110: T0IF = 0;
		BCR 	INTCON,2 		//061A 	110B

		//;sysinit.c: 111: T0IE = 1;
		BSR 	INTCON,5 		//061B 	1A8B
		ORG		061CH

		//;sysinit.c: 112: T0ON = 1;
		BSR 	1FH,3 			//061C 	199F

		//;sysinit.c: 114: PEIE = 1;
		BSR 	INTCON,6 		//061D 	1B0B

		//;sysinit.c: 116: GIE = 1;
		BSR 	INTCON,7 		//061E 	1B8B
		RET		 					//061F 	0004
		STR 	21H 			//0620 	01A1

		//;smartkey.C: 173: GIE = 0;
		BCR 	INTCON,7 		//0621 	138B

		//;smartkey.C: 174: while (GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//0622 	1F8B
		LJUMP 	626H 			//0623 	3E26
		ORG		0624H
		CLRWDT	 			//0624 	0001
		LJUMP 	622H 			//0625 	3E22

		//;smartkey.C: 175: EEADR = EEAddr;
		BCR 	STATUS,5 		//0626 	1283
		LDR 	21H,0 			//0627 	0821
		BSR 	STATUS,5 		//0628 	1A83
		STR 	1BH 			//0629 	019B

		//;smartkey.C: 176: EEDAT = EEData;
		BCR 	STATUS,5 		//062A 	1283
		LDR 	20H,0 			//062B 	0820
		ORG		062CH
		BSR 	STATUS,5 		//062C 	1A83
		STR 	1AH 			//062D 	019A
		LDWI 	34H 			//062E 	2A34

		//;smartkey.C: 177: EEIF = 0;
		BCR 	STATUS,5 		//062F 	1283
		BCR 	CH,7 			//0630 	138C

		//;smartkey.C: 178: EECON1 = 0x34;
		BSR 	STATUS,5 		//0631 	1A83
		STR 	1CH 			//0632 	019C

		//;smartkey.C: 179: WR = 1;
		BSR 	1DH,0 			//0633 	181D
		ORG		0634H

		//;smartkey.C: 180: while (WR) asm("clrwdt");
		BSR 	STATUS,5 		//0634 	1A83
		BTSS 	1DH,0 			//0635 	1C1D
		LJUMP 	639H 			//0636 	3E39
		CLRWDT	 			//0637 	0001
		LJUMP 	634H 			//0638 	3E34

		//;smartkey.C: 181: GIE = 1;
		BSR 	INTCON,7 		//0639 	1B8B
		RET		 					//063A 	0004
		STR 	76H 			//063B 	01F6
		ORG		063CH

		//;smartkey.C: 173: GIE = 0;
		BCR 	INTCON,7 		//063C 	138B

		//;smartkey.C: 174: while (GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//063D 	1F8B
		LJUMP 	641H 			//063E 	3E41
		CLRWDT	 			//063F 	0001
		LJUMP 	63DH 			//0640 	3E3D

		//;smartkey.C: 175: EEADR = EEAddr;
		LDR 	76H,0 			//0641 	0876
		BSR 	STATUS,5 		//0642 	1A83
		STR 	1BH 			//0643 	019B
		ORG		0644H

		//;smartkey.C: 176: EEDAT = EEData;
		LDR 	75H,0 			//0644 	0875
		STR 	1AH 			//0645 	019A
		LDWI 	34H 			//0646 	2A34

		//;smartkey.C: 177: EEIF = 0;
		BCR 	STATUS,5 		//0647 	1283
		BCR 	CH,7 			//0648 	138C

		//;smartkey.C: 178: EECON1 = 0x34;
		BSR 	STATUS,5 		//0649 	1A83
		STR 	1CH 			//064A 	019C

		//;smartkey.C: 179: WR = 1;
		BSR 	1DH,0 			//064B 	181D
		ORG		064CH

		//;smartkey.C: 180: while (WR) asm("clrwdt");
		BSR 	STATUS,5 		//064C 	1A83
		BTSS 	1DH,0 			//064D 	1C1D
		LJUMP 	651H 			//064E 	3E51
		CLRWDT	 			//064F 	0001
		LJUMP 	64CH 			//0650 	3E4C

		//;smartkey.C: 181: GIE = 1;
		BSR 	INTCON,7 		//0651 	1B8B
		RET		 					//0652 	0004
		STR 	25H 			//0653 	01A5
		ORG		0654H

		//;smartkey.C: 147: {
		//;smartkey.C: 148: while (rep--) {
		DECR 	24H,1 			//0654 	0DA4
		LDR 	24H,0 			//0655 	0824
		XORWI 	FFH 			//0656 	26FF
		BTSC 	STATUS,2 		//0657 	1503
		RET		 					//0658 	0004
		LDWI 	CH 			//0659 	2A0C

		//;smartkey.C: 149: TMR2ON = 1;
		BSR 	12H,2 			//065A 	1912

		//;smartkey.C: 150: PR2L = 12;
		BSR 	STATUS,5 		//065B 	1A83
		ORG		065CH
		STR 	11H 			//065C 	0191

		//;smartkey.C: 151: delay_x10ms(delay);
		BCR 	STATUS,5 		//065D 	1283
		LDR 	25H,0 			//065E 	0825
		STR 	20H 			//065F 	01A0
		CLRR 	21H 			//0660 	0121
		LCALL 	692H 			//0661 	3692
		LDWI 	14H 			//0662 	2A14

		//;smartkey.C: 153: TMR2ON = 0; RA3 = 0;
		BCR 	12H,2 			//0663 	1112
		ORG		0664H
		BCR 	5H,3 			//0664 	1185

		//;smartkey.C: 154: delay_x10ms(20);
		STR 	20H 			//0665 	01A0
		CLRR 	21H 			//0666 	0121
		LCALL 	692H 			//0667 	3692
		LJUMP 	654H 			//0668 	3E54

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0669 	1283
		CLRR 	5H 			//066A 	0105

		//;sysinit.c: 35: TRISA = 0B00110111;
		LDWI 	37H 			//066B 	2A37
		ORG		066CH
		BSR 	STATUS,5 		//066C 	1A83
		STR 	5H 			//066D 	0185

		//;sysinit.c: 36: WPUA = 0B11000000;
		LDWI 	C0H 			//066E 	2AC0
		STR 	15H 			//066F 	0195

		//;sysinit.c: 38: PORTC = 0B00000000;
		BCR 	STATUS,5 		//0670 	1283
		CLRR 	7H 			//0671 	0107

		//;sysinit.c: 39: TRISC = 0B11111100;
		LDWI 	FCH 			//0672 	2AFC
		BSR 	STATUS,5 		//0673 	1A83
		ORG		0674H
		STR 	7H 			//0674 	0187

		//;sysinit.c: 40: WPUC = 0B00000000;
		CLRR 	13H 			//0675 	0113

		//;sysinit.c: 42: PSRCA = 0B11111111;
		LDWI 	FFH 			//0676 	2AFF
		STR 	8H 			//0677 	0188

		//;sysinit.c: 43: PSRCC = 0B11111111;
		STR 	14H 			//0678 	0194

		//;sysinit.c: 44: PSINKA = 0B11111111;
		STR 	17H 			//0679 	0197

		//;sysinit.c: 45: PSINKC = 0B11111111;
		STR 	1FH 			//067A 	019F

		//;sysinit.c: 47: MSCON = 0B00110000;
		LDWI 	30H 			//067B 	2A30
		ORG		067CH
		BCR 	STATUS,5 		//067C 	1283
		STR 	1BH 			//067D 	019B
		RET		 					//067E 	0004
		LDWI 	5H 			//067F 	2A05

		//;SWI2C.C: 24: RA7 = 1;
		BSR 	5H,7 			//0680 	1B85

		//;SWI2C.C: 26: RA6 = 1;
		BSR 	5H,6 			//0681 	1B05

		//;SWI2C.C: 27: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0682 	01A0
		DECRSZ 	20H,1 		//0683 	0EA0
		ORG		0684H
		LJUMP 	683H 			//0684 	3E83
		LDWI 	5H 			//0685 	2A05

		//;SWI2C.C: 28: RA6 = 0;
		BCR 	STATUS,5 		//0686 	1283
		BCR 	5H,6 			//0687 	1305

		//;SWI2C.C: 29: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0688 	01A0
		DECRSZ 	20H,1 		//0689 	0EA0
		LJUMP 	689H 			//068A 	3E89
		LDWI 	5H 			//068B 	2A05
		ORG		068CH

		//;SWI2C.C: 30: RA7 = 0;
		BCR 	STATUS,5 		//068C 	1283
		BCR 	5H,7 			//068D 	1385

		//;SWI2C.C: 31: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//068E 	01A0
		DECRSZ 	20H,1 		//068F 	0EA0
		LJUMP 	68FH 			//0690 	3E8F
		RET		 					//0691 	0004

		//;smartkey.C: 135: unsigned int set = t + timeTick;
		LDR 	21H,0 			//0692 	0821
		STR 	23H 			//0693 	01A3
		ORG		0694H
		LDR 	20H,0 			//0694 	0820
		STR 	22H 			//0695 	01A2
		LDR 	70H,0 			//0696 	0870
		ADDWR 	22H,1 			//0697 	0BA2
		BTSC 	STATUS,0 		//0698 	1403
		INCR	23H,1 			//0699 	09A3
		LDR 	71H,0 			//069A 	0871
		ADDWR 	23H,1 			//069B 	0BA3
		ORG		069CH

		//;smartkey.C: 136: while (timeTick < set);
		LDR 	23H,0 			//069C 	0823
		SUBWR 	71H,0 			//069D 	0C71
		BTSS 	STATUS,2 		//069E 	1D03
		LJUMP 	6A2H 			//069F 	3EA2
		LDR 	22H,0 			//06A0 	0822
		SUBWR 	70H,0 			//06A1 	0C70
		BTSC 	STATUS,0 		//06A2 	1403
		RET		 					//06A3 	0004
		ORG		06A4H
		LJUMP 	69CH 			//06A4 	3E9C

		//;sysinit.c: 60: T0CON0 = 0B00000000;
		CLRR 	1FH 			//06A5 	011F

		//;sysinit.c: 61: OPTION = 0B00000111;
		LDWI 	7H 			//06A6 	2A07
		BSR 	STATUS,5 		//06A7 	1A83
		STR 	1H 			//06A8 	0181

		//;sysinit.c: 62: TMR0 = 179;
		LDWI 	B3H 			//06A9 	2AB3
		BCR 	STATUS,5 		//06AA 	1283
		STR 	1H 			//06AB 	0181
		ORG		06ACH

		//;sysinit.c: 64: TMR2H = 0;
		CLRR 	13H 			//06AC 	0113

		//;sysinit.c: 65: TMR2L = 0;
		CLRR 	11H 			//06AD 	0111

		//;sysinit.c: 66: PR2H = 0;
		BSR 	STATUS,5 		//06AE 	1A83
		CLRR 	12H 			//06AF 	0112

		//;sysinit.c: 67: PR2L =0;
		CLRR 	11H 			//06B0 	0111

		//;sysinit.c: 68: T2CON0 = 0B00101001;
		LDWI 	29H 			//06B1 	2A29
		BCR 	STATUS,5 		//06B2 	1283
		STR 	12H 			//06B3 	0192
		ORG		06B4H
		RET		 					//06B4 	0004
		CLRR 	70H 			//06B5 	0170
		CLRR 	71H 			//06B6 	0171
		CLRR 	72H 			//06B7 	0172
		CLRR 	73H 			//06B8 	0173
		CLRR 	74H 			//06B9 	0174
		CLRR 	41H 			//06BA 	0141
		CLRR 	42H 			//06BB 	0142
		ORG		06BCH
		CLRR 	43H 			//06BC 	0143
		CLRR 	44H 			//06BD 	0144
		CLRR 	45H 			//06BE 	0145
		CLRR 	46H 			//06BF 	0146
		CLRR 	STATUS 			//06C0 	0103
		LJUMP 	0BH 			//06C1 	380B
		LDWI 	5H 			//06C2 	2A05

		//;SWI2C.C: 37: RA6 = 0;
		BCR 	5H,6 			//06C3 	1305
		ORG		06C4H

		//;SWI2C.C: 38: RA7 = 1;
		BSR 	5H,7 			//06C4 	1B85

		//;SWI2C.C: 39: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//06C5 	01A0
		DECRSZ 	20H,1 		//06C6 	0EA0
		LJUMP 	6C6H 			//06C7 	3EC6
		LDWI 	5H 			//06C8 	2A05

		//;SWI2C.C: 40: RA6 = 1;
		BCR 	STATUS,5 		//06C9 	1283
		BSR 	5H,6 			//06CA 	1B05

		//;SWI2C.C: 41: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//06CB 	01A0
		ORG		06CCH
		DECRSZ 	20H,1 		//06CC 	0EA0
		LJUMP 	6CCH 			//06CD 	3ECC
		RET		 					//06CE 	0004
		BCR 	STATUS,5 		//06CF 	1283
		STR 	20H 			//06D0 	01A0

		//;smartkey.C: 163: unsigned char ReEepromData;
		//;smartkey.C: 164: EEADR = EEAddr;
		BSR 	STATUS,5 		//06D1 	1A83
		STR 	1BH 			//06D2 	019B

		//;smartkey.C: 165: RD = 1;
		BSR 	1CH,0 			//06D3 	181C
		ORG		06D4H

		//;smartkey.C: 166: ReEepromData = EEDAT;
		LDR 	1AH,0 			//06D4 	081A
		BCR 	STATUS,5 		//06D5 	1283
		STR 	21H 			//06D6 	01A1

		//;smartkey.C: 167: RD = 0;
		BSR 	STATUS,5 		//06D7 	1A83
		BCR 	1CH,0 			//06D8 	101C

		//;smartkey.C: 168: return ReEepromData;
		BCR 	STATUS,5 		//06D9 	1283
		LDR 	21H,0 			//06DA 	0821
		RET		 					//06DB 	0004
		ORG		06DCH
		STR 	22H 			//06DC 	01A2

		//;smartkey.C: 185: mtOldState = mtState;
		LDR 	74H,0 			//06DD 	0874
		STR 	46H 			//06DE 	01C6

		//;smartkey.C: 186: mtState = stt;
		LDR 	22H,0 			//06DF 	0822
		STR 	74H 			//06E0 	01F4

		//;smartkey.C: 187: timeTick = 0;
		CLRR 	70H 			//06E1 	0170
		CLRR 	71H 			//06E2 	0171

		//;smartkey.C: 188: timeOut = _tOut;
		LDR 	21H,0 			//06E3 	0821
		ORG		06E4H
		STR 	44H 			//06E4 	01C4
		LDR 	20H,0 			//06E5 	0820
		STR 	43H 			//06E6 	01C3
		RET		 					//06E7 	0004

		//;sysinit.c: 21: OSCCON = 0B01010001;
		LDWI 	51H 			//06E8 	2A51
		BSR 	STATUS,5 		//06E9 	1A83
		STR 	FH 			//06EA 	018F

		//;sysinit.c: 22: _nop();
		NOP		 					//06EB 	0000
		ORG		06ECH

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//06EC 	1A83
		BTSC 	FH,2 			//06ED 	150F
		RET		 					//06EE 	0004
		LJUMP 	6ECH 			//06EF 	3EEC
		STR 	75H 			//06F0 	01F5

		//;smartkey.C: 163: unsigned char ReEepromData;
		//;smartkey.C: 164: EEADR = EEAddr;
		BSR 	STATUS,5 		//06F1 	1A83
		STR 	1BH 			//06F2 	019B

		//;smartkey.C: 165: RD = 1;
		BSR 	1CH,0 			//06F3 	181C
		ORG		06F4H

		//;smartkey.C: 166: ReEepromData = EEDAT;
		LDR 	1AH,0 			//06F4 	081A
		STR 	76H 			//06F5 	01F6

		//;smartkey.C: 167: RD = 0;
		BCR 	1CH,0 			//06F6 	101C

		//;smartkey.C: 168: return ReEepromData;
		RET		 					//06F7 	0004

		//;smartkey.C: 140: TMR2ON = 0; RA3 = 0; TRISA |= 0x08;
		BCR 	STATUS,5 		//06F8 	1283
		BCR 	12H,2 			//06F9 	1112
		BCR 	5H,3 			//06FA 	1185
		BSR 	STATUS,5 		//06FB 	1A83
		ORG		06FCH
		BSR 	5H,3 			//06FC 	1985
		RET		 					//06FD 	0004
		ORG		0700H
		LJUMP 	292H 			//0700 	3A92
		LJUMP 	1C5H 			//0701 	39C5
		LJUMP 	1CDH 			//0702 	39CD
		LJUMP 	215H 			//0703 	3A15
		LJUMP 	236H 			//0704 	3A36

		//;smartkey.C: 143: TMR2ON = 1;
		BCR 	STATUS,5 		//0705 	1283
		BSR 	12H,2 			//0706 	1912

		//;smartkey.C: 144: TRISA &= 0xf7;
		BSR 	STATUS,5 		//0707 	1A83
		ORG		0708H
		BCR 	5H,3 			//0708 	1185
		RET		 					//0709 	0004
			END

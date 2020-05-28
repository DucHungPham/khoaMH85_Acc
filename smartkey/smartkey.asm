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
		LJUMP 	3F6H 			//0009 	3BF6
		LJUMP 	6A0H 			//000A 	3EA0

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
		LCALL 	6D3H 			//0019 	36D3

		//;smartkey.C: 221: gpio_init();
		LCALL 	654H 			//001A 	3654

		//;smartkey.C: 222: timer_init();
		LCALL 	690H 			//001B 	3690
		ORG		001CH

		//;smartkey.C: 223: int_init();
		LCALL 	5F0H 			//001C 	35F0

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

		//;smartkey.C: 228: swI2C_Init();
		LCALL 	5D1H 			//0026 	35D1
		LDWI 	0H 			//0027 	2A00

		//;smartkey.C: 230: setState(0, 0);
		BCR 	STATUS,5 		//0028 	1283
		CLRR 	20H 			//0029 	0120
		CLRR 	21H 			//002A 	0121
		LCALL 	6C7H 			//002B 	36C7
		ORG		002CH

		//;smartkey.C: 232: WRITE_EEPROM(0xFF, 0xAA);
		LDWI 	AAH 			//002C 	2AAA
		STR 	20H 			//002D 	01A0
		LDWI 	FFH 			//002E 	2AFF
		LCALL 	60BH 			//002F 	360B

		//;smartkey.C: 233: WRITE_EEPROM(0xFF, 0xAA);
		LDWI 	AAH 			//0030 	2AAA
		BCR 	STATUS,5 		//0031 	1283
		STR 	20H 			//0032 	01A0
		LDWI 	FFH 			//0033 	2AFF
		ORG		0034H
		LCALL 	60BH 			//0034 	360B

		//;smartkey.C: 235: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//0035 	2A82
		BCR 	STATUS,5 		//0036 	1283
		STR 	2BH 			//0037 	01AB
		LDWI 	DDH 			//0038 	2ADD
		STR 	2AH 			//0039 	01AA
		DECRSZ 	2AH,1 		//003A 	0EAA
		LJUMP 	3AH 			//003B 	383A
		ORG		003CH
		DECRSZ 	2BH,1 		//003C 	0EAB
		LJUMP 	3AH 			//003D 	383A
		LJUMP 	3FH 			//003E 	383F

		//;smartkey.C: 238: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//003F 	2A41
		LCALL 	6BAH 			//0040 	36BA
		STR 	40H 			//0041 	01C0

		//;smartkey.C: 239: if (tmp8 > 3) {WRITE_EEPROM(0x41, 0); _delay((unsigned long)((2)*(4000
		//+                          000/4000.0)));}
		LDWI 	4H 			//0042 	2A04
		SUBWR 	40H,0 			//0043 	0C40
		ORG		0044H
		BTSS 	STATUS,0 		//0044 	1C03
		LJUMP 	53H 			//0045 	3853
		LDWI 	41H 			//0046 	2A41
		CLRR 	20H 			//0047 	0120
		LCALL 	60BH 			//0048 	360B
		LDWI 	3H 			//0049 	2A03
		BCR 	STATUS,5 		//004A 	1283
		STR 	2BH 			//004B 	01AB
		ORG		004CH
		LDWI 	97H 			//004C 	2A97
		STR 	2AH 			//004D 	01AA
		DECRSZ 	2AH,1 		//004E 	0EAA
		LJUMP 	4EH 			//004F 	384E
		DECRSZ 	2BH,1 		//0050 	0EAB
		LJUMP 	4EH 			//0051 	384E
		LJUMP 	53H 			//0052 	3853

		//;smartkey.C: 243: tmp8 = READ_EEPROM(0x08);
		LDWI 	8H 			//0053 	2A08
		ORG		0054H
		LCALL 	6BAH 			//0054 	36BA
		STR 	40H 			//0055 	01C0

		//;smartkey.C: 244: if (tmp8 == 0xff) {WRITE_EEPROM(0x08, 0); _delay((unsigned long)((2)*(
		//+                          4000000/4000.0)));}
		XORWI 	FFH 			//0056 	26FF
		BTSS 	STATUS,2 		//0057 	1D03
		LJUMP 	66H 			//0058 	3866
		LDWI 	8H 			//0059 	2A08
		CLRR 	20H 			//005A 	0120
		LCALL 	60BH 			//005B 	360B
		ORG		005CH
		LDWI 	3H 			//005C 	2A03
		BCR 	STATUS,5 		//005D 	1283
		STR 	2BH 			//005E 	01AB
		LDWI 	97H 			//005F 	2A97
		STR 	2AH 			//0060 	01AA
		DECRSZ 	2AH,1 		//0061 	0EAA
		LJUMP 	61H 			//0062 	3861
		DECRSZ 	2BH,1 		//0063 	0EAB
		ORG		0064H
		LJUMP 	61H 			//0064 	3861
		LJUMP 	66H 			//0065 	3866

		//;smartkey.C: 245: if (tmp8 == 0xcc) {
		BCR 	STATUS,5 		//0066 	1283
		LDR 	40H,0 			//0067 	0840
		XORWI 	CCH 			//0068 	26CC
		BTSS 	STATUS,2 		//0069 	1D03
		LJUMP 	81H 			//006A 	3881

		//;smartkey.C: 246: RegStatus.bits.b0 = 0;
		BCR 	72H,0 			//006B 	1072
		ORG		006CH

		//;smartkey.C: 247: setState(3, 1800);
		LDWI 	8H 			//006C 	2A08
		STR 	20H 			//006D 	01A0
		LDWI 	7H 			//006E 	2A07
		STR 	21H 			//006F 	01A1
		LDWI 	3H 			//0070 	2A03
		LCALL 	6C7H 			//0071 	36C7

		//;smartkey.C: 248: mtOldState = 1;
		CLRR 	46H 			//0072 	0146
		INCR	46H,1 			//0073 	09C6
		ORG		0074H

		//;smartkey.C: 249: cntTmp = timeTick + 50;
		LDR 	71H,0 			//0074 	0871
		STR 	42H 			//0075 	01C2
		LDR 	70H,0 			//0076 	0870
		STR 	41H 			//0077 	01C1
		LDWI 	32H 			//0078 	2A32
		ADDWR 	41H,1 			//0079 	0BC1
		BTSC 	STATUS,0 		//007A 	1403
		INCR	42H,1 			//007B 	09C2
		ORG		007CH

		//;smartkey.C: 250: PR2L = 12;
		LDWI 	CH 			//007C 	2A0C
		BSR 	STATUS,5 		//007D 	1A83
		STR 	11H 			//007E 	0191

		//;smartkey.C: 251: beepOn();
		LCALL 	6EEH 			//007F 	36EE

		//;smartkey.C: 252: } else {
		LJUMP 	88H 			//0080 	3888

		//;smartkey.C: 253: setState(2, 400);
		LDWI 	90H 			//0081 	2A90
		STR 	20H 			//0082 	01A0
		LDWI 	1H 			//0083 	2A01
		ORG		0084H
		STR 	21H 			//0084 	01A1
		LDWI 	2H 			//0085 	2A02
		LCALL 	6C7H 			//0086 	36C7

		//;smartkey.C: 254: mtOldState = 0;
		CLRR 	46H 			//0087 	0146

		//;smartkey.C: 255: }
		//;smartkey.C: 260: buf[0] = 0x08;
		LDWI 	8H 			//0088 	2A08
		BCR 	STATUS,5 		//0089 	1283
		STR 	33H 			//008A 	01B3

		//;smartkey.C: 261: if ((AccWrite(0x10,buf, 1) == 0)) {
		LDWI 	33H 			//008B 	2A33
		ORG		008CH
		STR 	23H 			//008C 	01A3
		LDWI 	10H 			//008D 	2A10
		CLRR 	24H 			//008E 	0124
		INCR	24H,1 			//008F 	09A4
		LCALL 	5B0H 			//0090 	35B0
		IORWI 	0H 			//0091 	2500
		BTSC 	STATUS,2 		//0092 	1503
		LJUMP 	99H 			//0093 	3899
		ORG		0094H

		//;smartkey.C: 264: else {
		//;smartkey.C: 266: beep(10, 2);
		LDWI 	2H 			//0094 	2A02
		BCR 	STATUS,5 		//0095 	1283
		STR 	24H 			//0096 	01A4
		LDWI 	AH 			//0097 	2A0A
		LCALL 	63EH 			//0098 	363E

		//;smartkey.C: 267: }
		//;smartkey.C: 270: tmp8 = READ_EEPROM(0x3F);
		LDWI 	3FH 			//0099 	2A3F
		LCALL 	6BAH 			//009A 	36BA
		STR 	40H 			//009B 	01C0
		ORG		009CH

		//;smartkey.C: 271: if (tmp8 == 5) {
		XORWI 	5H 			//009C 	2605
		BTSS 	STATUS,2 		//009D 	1D03
		LJUMP 	D6H 			//009E 	38D6
		LDWI 	3FH 			//009F 	2A3F

		//;smartkey.C: 272: tmp8 = 0;
		CLRR 	40H 			//00A0 	0140

		//;smartkey.C: 273: WRITE_EEPROM(0x3F, 0);
		CLRR 	20H 			//00A1 	0120
		LCALL 	60BH 			//00A2 	360B

		//;smartkey.C: 274: while ( RA2) {
		BCR 	STATUS,5 		//00A3 	1283
		ORG		00A4H
		BTSS 	5H,2 			//00A4 	1D05
		LJUMP 	D4H 			//00A5 	38D4

		//;smartkey.C: 275: _delay((unsigned long)((1500)*(4000000/4000.0)));
		LDWI 	8H 			//00A6 	2A08
		STR 	2CH 			//00A7 	01AC
		LDWI 	9DH 			//00A8 	2A9D
		STR 	2BH 			//00A9 	01AB
		LDWI 	BH 			//00AA 	2A0B
		STR 	2AH 			//00AB 	01AA
		ORG		00ACH
		DECRSZ 	2AH,1 		//00AC 	0EAA
		LJUMP 	ACH 			//00AD 	38AC
		DECRSZ 	2BH,1 		//00AE 	0EAB
		LJUMP 	ACH 			//00AF 	38AC
		DECRSZ 	2CH,1 		//00B0 	0EAC
		LJUMP 	ACH 			//00B1 	38AC
		LJUMP 	B3H 			//00B2 	38B3
		LDWI 	15H 			//00B3 	2A15
		ORG		00B4H

		//;smartkey.C: 276: tmp8++;
		BCR 	STATUS,5 		//00B4 	1283
		INCR	40H,1 			//00B5 	09C0

		//;smartkey.C: 277: if (tmp8 > 20) {
		SUBWR 	40H,0 			//00B6 	0C40
		BTSS 	STATUS,0 		//00B7 	1C03
		LJUMP 	C8H 			//00B8 	38C8

		//;smartkey.C: 278: _delay((unsigned long)((10000)*(4000000/4000.0)));
		LDWI 	33H 			//00B9 	2A33
		STR 	2CH 			//00BA 	01AC
		LDWI 	BCH 			//00BB 	2ABC
		ORG		00BCH
		STR 	2BH 			//00BC 	01AB
		LDWI 	10H 			//00BD 	2A10
		STR 	2AH 			//00BE 	01AA
		DECRSZ 	2AH,1 		//00BF 	0EAA
		LJUMP 	BFH 			//00C0 	38BF
		DECRSZ 	2BH,1 		//00C1 	0EAB
		LJUMP 	BFH 			//00C2 	38BF
		DECRSZ 	2CH,1 		//00C3 	0EAC
		ORG		00C4H
		LJUMP 	BFH 			//00C4 	38BF
		LDWI 	40H 			//00C5 	2A40

		//;smartkey.C: 279: WRITE_EEPROM(0x40, 0);
		BCR 	STATUS,5 		//00C6 	1283
		LJUMP 	A1H 			//00C7 	38A1

		//;smartkey.C: 280: }
		//;smartkey.C: 281: else if ( RA2) {
		BTSS 	5H,2 			//00C8 	1D05
		LJUMP 	A3H 			//00C9 	38A3

		//;smartkey.C: 282: WRITE_EEPROM(0x40, tmp8);
		LDR 	40H,0 			//00CA 	0840
		STR 	20H 			//00CB 	01A0
		ORG		00CCH
		LDWI 	40H 			//00CC 	2A40
		LCALL 	60BH 			//00CD 	360B
		LDWI 	AH 			//00CE 	2A0A

		//;smartkey.C: 283: beep(10, 1);
		BCR 	STATUS,5 		//00CF 	1283
		CLRR 	24H 			//00D0 	0124
		INCR	24H,1 			//00D1 	09A4
		LCALL 	63EH 			//00D2 	363E
		LJUMP 	A3H 			//00D3 	38A3
		ORG		00D4H
		BTSS 	5H,2 			//00D4 	1D05
		LJUMP 	D4H 			//00D5 	38D4

		//;smartkey.C: 287: }
		//;smartkey.C: 290: tmp8 = READ_EEPROM(0x40);
		LDWI 	40H 			//00D6 	2A40
		LCALL 	6BAH 			//00D7 	36BA
		STR 	40H 			//00D8 	01C0

		//;smartkey.C: 291: switch (tmp8) {
		LJUMP 	170H 			//00D9 	3970
		LDWI 	3H 			//00DA 	2A03

		//;smartkey.C: 294: tmp8 = 0; beep(10, 3);
		CLRR 	40H 			//00DB 	0140
		ORG		00DCH
		STR 	24H 			//00DC 	01A4
		LDWI 	AH 			//00DD 	2A0A
		LCALL 	63EH 			//00DE 	363E

		//;smartkey.C: 295: while ((tmp8 < 11)) {
		LJUMP 	10DH 			//00DF 	390D

		//;smartkey.C: 297: acXsum += (signed char)buf[1];
		BCR 	STATUS,5 		//00E0 	1283
		LDR 	34H,0 			//00E1 	0834
		STR 	2AH 			//00E2 	01AA
		CLRR 	2BH 			//00E3 	012B
		ORG		00E4H
		BTSC 	2AH,7 			//00E4 	17AA
		DECR 	2BH,1 			//00E5 	0DAB
		ADDWR 	3BH,1 			//00E6 	0BBB
		BTSC 	STATUS,0 		//00E7 	1403
		INCR	3CH,1 			//00E8 	09BC
		LDR 	2BH,0 			//00E9 	082B
		ADDWR 	3CH,1 			//00EA 	0BBC

		//;smartkey.C: 298: acYsum += (signed char)buf[3];
		LDR 	36H,0 			//00EB 	0836
		ORG		00ECH
		STR 	2AH 			//00EC 	01AA
		CLRR 	2BH 			//00ED 	012B
		BTSC 	2AH,7 			//00EE 	17AA
		DECR 	2BH,1 			//00EF 	0DAB
		ADDWR 	39H,1 			//00F0 	0BB9
		BTSC 	STATUS,0 		//00F1 	1403
		INCR	3AH,1 			//00F2 	09BA
		LDR 	2BH,0 			//00F3 	082B
		ORG		00F4H
		ADDWR 	3AH,1 			//00F4 	0BBA

		//;smartkey.C: 299: if ( ((signed char)buf[5] > -15) && ((signed char)buf[5] <15)) break;
		LDR 	38H,0 			//00F5 	0838
		XORWI 	80H 			//00F6 	2680
		ADDWI 	8EH 			//00F7 	278E
		BTSS 	STATUS,0 		//00F8 	1C03
		LJUMP 	FFH 			//00F9 	38FF
		LDR 	38H,0 			//00FA 	0838
		XORWI 	80H 			//00FB 	2680
		ORG		00FCH
		ADDWI 	71H 			//00FC 	2771
		BTSS 	STATUS,0 		//00FD 	1C03
		LJUMP 	11BH 			//00FE 	391B
		LDWI 	3H 			//00FF 	2A03

		//;smartkey.C: 300: tmp8++;
		INCR	40H,1 			//0100 	09C0

		//;smartkey.C: 303: _delay((unsigned long)((500)*(4000000/4000.0)));
		//;smartkey.C: 301: } else
		STR 	2CH 			//0101 	01AC
		LDWI 	8AH 			//0102 	2A8A
		STR 	2BH 			//0103 	01AB
		ORG		0104H
		LDWI 	56H 			//0104 	2A56
		STR 	2AH 			//0105 	01AA
		DECRSZ 	2AH,1 		//0106 	0EAA
		LJUMP 	106H 			//0107 	3906
		DECRSZ 	2BH,1 		//0108 	0EAB
		LJUMP 	106H 			//0109 	3906
		DECRSZ 	2CH,1 		//010A 	0EAC
		LJUMP 	106H 			//010B 	3906
		ORG		010CH
		LJUMP 	10DH 			//010C 	390D
		LDWI 	BH 			//010D 	2A0B
		BCR 	STATUS,5 		//010E 	1283
		SUBWR 	40H,0 			//010F 	0C40
		BTSC 	STATUS,0 		//0110 	1403
		LJUMP 	11BH 			//0111 	391B

		//;smartkey.C: 296: if (AccRead(0x02, buf, 6) == 0) {
		LDWI 	33H 			//0112 	2A33
		STR 	24H 			//0113 	01A4
		ORG		0114H
		LDWI 	6H 			//0114 	2A06
		STR 	25H 			//0115 	01A5
		LDWI 	2H 			//0116 	2A02
		LCALL 	579H 			//0117 	3579
		IORWI 	0H 			//0118 	2500
		BTSC 	STATUS,2 		//0119 	1503
		LJUMP 	E0H 			//011A 	38E0

		//;smartkey.C: 304: }
		//;smartkey.C: 306: if (tmp8 == 11) {
		BCR 	STATUS,5 		//011B 	1283
		ORG		011CH
		LDR 	40H,0 			//011C 	0840
		XORWI 	BH 			//011D 	260B
		BTSS 	STATUS,2 		//011E 	1D03
		LJUMP 	147H 			//011F 	3947

		//;smartkey.C: 307: acXsum = acXsum / 10;
		LDWI 	AH 			//0120 	2A0A
		STR 	20H 			//0121 	01A0
		CLRR 	21H 			//0122 	0121
		LDR 	3CH,0 			//0123 	083C
		ORG		0124H
		STR 	23H 			//0124 	01A3
		LDR 	3BH,0 			//0125 	083B
		STR 	22H 			//0126 	01A2
		LCALL 	47CH 			//0127 	347C
		LDR 	21H,0 			//0128 	0821
		STR 	3CH 			//0129 	01BC
		LDR 	20H,0 			//012A 	0820
		STR 	3BH 			//012B 	01BB
		ORG		012CH

		//;smartkey.C: 308: acYsum = acYsum / 10;
		LDWI 	AH 			//012C 	2A0A
		STR 	20H 			//012D 	01A0
		CLRR 	21H 			//012E 	0121
		LDR 	3AH,0 			//012F 	083A
		STR 	23H 			//0130 	01A3
		LDR 	39H,0 			//0131 	0839
		STR 	22H 			//0132 	01A2
		LCALL 	47CH 			//0133 	347C
		ORG		0134H
		LDR 	21H,0 			//0134 	0821
		STR 	3AH 			//0135 	01BA
		LDR 	20H,0 			//0136 	0820
		STR 	39H 			//0137 	01B9

		//;smartkey.C: 310: WRITE_EEPROM(0x10, acXsum);
		LDR 	3BH,0 			//0138 	083B
		STR 	20H 			//0139 	01A0
		LDWI 	10H 			//013A 	2A10
		LCALL 	60BH 			//013B 	360B
		ORG		013CH

		//;smartkey.C: 311: WRITE_EEPROM(0x11, acYsum);
		BCR 	STATUS,5 		//013C 	1283
		LDR 	39H,0 			//013D 	0839
		STR 	20H 			//013E 	01A0
		LDWI 	11H 			//013F 	2A11
		LCALL 	60BH 			//0140 	360B

		//;smartkey.C: 312: beep(10, 3);
		LDWI 	3H 			//0141 	2A03
		BCR 	STATUS,5 		//0142 	1283
		STR 	24H 			//0143 	01A4
		ORG		0144H
		LDWI 	AH 			//0144 	2A0A
		LCALL 	63EH 			//0145 	363E

		//;smartkey.C: 314: } else {
		LJUMP 	17BH 			//0146 	397B

		//;smartkey.C: 315: beep(10, 2);
		LDWI 	2H 			//0147 	2A02
		STR 	24H 			//0148 	01A4
		LDWI 	AH 			//0149 	2A0A
		LCALL 	63EH 			//014A 	363E
		LJUMP 	17BH 			//014B 	397B
		ORG		014CH

		//;smartkey.C: 322: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//014C 	2A41
		LCALL 	6BAH 			//014D 	36BA
		STR 	40H 			//014E 	01C0

		//;smartkey.C: 323: if (tmp8 & 2) {
		BTSS 	40H,1 			//014F 	1CC0
		LJUMP 	153H 			//0150 	3953

		//;smartkey.C: 324: tmp8 &= ~2;
		BCR 	40H,1 			//0151 	10C0

		//;smartkey.C: 325: }
		LJUMP 	154H 			//0152 	3954

		//;smartkey.C: 326: else {
		//;smartkey.C: 327: tmp8 |= 2;
		BSR 	40H,1 			//0153 	18C0
		ORG		0154H

		//;smartkey.C: 328: }
		//;smartkey.C: 329: WRITE_EEPROM(0x41, tmp8);
		LDR 	40H,0 			//0154 	0840
		STR 	20H 			//0155 	01A0
		LDWI 	41H 			//0156 	2A41
		LCALL 	60BH 			//0157 	360B
		LDWI 	32H 			//0158 	2A32

		//;smartkey.C: 330: beep(50, 1);
		BCR 	STATUS,5 		//0159 	1283
		CLRR 	24H 			//015A 	0124
		INCR	24H,1 			//015B 	09A4
		ORG		015CH
		LCALL 	63EH 			//015C 	363E

		//;smartkey.C: 331: break;
		LJUMP 	17BH 			//015D 	397B

		//;smartkey.C: 335: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//015E 	2A41
		LCALL 	6BAH 			//015F 	36BA
		STR 	40H 			//0160 	01C0

		//;smartkey.C: 336: if (tmp8 & 1) {
		BTSS 	40H,0 			//0161 	1C40
		LJUMP 	165H 			//0162 	3965

		//;smartkey.C: 337: tmp8 &= ~1;
		BCR 	40H,0 			//0163 	1040
		ORG		0164H

		//;smartkey.C: 338: }
		LJUMP 	166H 			//0164 	3966

		//;smartkey.C: 339: else {
		//;smartkey.C: 340: tmp8 |= 1;
		BSR 	40H,0 			//0165 	1840

		//;smartkey.C: 341: }
		//;smartkey.C: 342: WRITE_EEPROM(0x41, tmp8);
		LDR 	40H,0 			//0166 	0840
		STR 	20H 			//0167 	01A0
		LDWI 	41H 			//0168 	2A41
		LCALL 	60BH 			//0169 	360B
		LDWI 	AH 			//016A 	2A0A

		//;smartkey.C: 343: beep(10, 1);
		BCR 	STATUS,5 		//016B 	1283
		ORG		016CH
		CLRR 	24H 			//016C 	0124
		INCR	24H,1 			//016D 	09A4
		LCALL 	63EH 			//016E 	363E

		//;smartkey.C: 344: break;
		LJUMP 	17BH 			//016F 	397B
		LDR 	40H,0 			//0170 	0840
		XORWI 	3H 			//0171 	2603
		BTSC 	STATUS,2 		//0172 	1503
		LJUMP 	DAH 			//0173 	38DA
		ORG		0174H
		XORWI 	9H 			//0174 	2609
		BTSC 	STATUS,2 		//0175 	1503
		LJUMP 	15EH 			//0176 	395E
		XORWI 	1EH 			//0177 	261E
		BTSC 	STATUS,2 		//0178 	1503
		LJUMP 	14CH 			//0179 	394C
		LJUMP 	17BH 			//017A 	397B

		//;smartkey.C: 348: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//017B 	2A41
		ORG		017CH
		LCALL 	6BAH 			//017C 	36BA
		STR 	40H 			//017D 	01C0

		//;smartkey.C: 349: if (tmp8 >0 && tmp8<4 ) {
		LDR 	40H,0 			//017E 	0840
		BTSC 	STATUS,2 		//017F 	1503
		LJUMP 	19FH 			//0180 	399F
		LDWI 	4H 			//0181 	2A04
		SUBWR 	40H,0 			//0182 	0C40
		BTSC 	STATUS,0 		//0183 	1403
		ORG		0184H
		LJUMP 	19FH 			//0184 	399F

		//;smartkey.C: 350: RegStatus.bits.b0 = 1;
		BSR 	72H,0 			//0185 	1872

		//;smartkey.C: 351: setState(1, 3500);
		LDWI 	ACH 			//0186 	2AAC
		STR 	20H 			//0187 	01A0
		LDWI 	DH 			//0188 	2A0D
		STR 	21H 			//0189 	01A1
		LDWI 	1H 			//018A 	2A01
		LCALL 	6C7H 			//018B 	36C7
		ORG		018CH

		//;smartkey.C: 352: RegStatus.bits.b4 = 1;
		BSR 	72H,4 			//018C 	1A72

		//;smartkey.C: 354: if (tmp8 & 2) {
		BTSS 	40H,1 			//018D 	1CC0
		LJUMP 	191H 			//018E 	3991

		//;smartkey.C: 355: RegStatus.bits.b6 = 0;
		BCR 	72H,6 			//018F 	1372

		//;smartkey.C: 356: }
		LJUMP 	19FH 			//0190 	399F

		//;smartkey.C: 357: else if (tmp8 & 1) {
		BTSS 	40H,0 			//0191 	1C40
		LJUMP 	19FH 			//0192 	399F

		//;smartkey.C: 358: tmp16 = timeTick + 40;
		LDR 	71H,0 			//0193 	0871
		ORG		0194H
		STR 	3FH 			//0194 	01BF
		LDR 	70H,0 			//0195 	0870
		STR 	3EH 			//0196 	01BE
		LDWI 	28H 			//0197 	2A28
		ADDWR 	3EH,1 			//0198 	0BBE
		BTSC 	STATUS,0 		//0199 	1403
		INCR	3FH,1 			//019A 	09BF
		LDWI 	AH 			//019B 	2A0A
		ORG		019CH

		//;smartkey.C: 359: beep(10, 1);
		CLRR 	24H 			//019C 	0124
		INCR	24H,1 			//019D 	09A4
		LCALL 	63EH 			//019E 	363E

		//;smartkey.C: 360: }
		//;smartkey.C: 361: }
		//;smartkey.C: 364: acXsum = (signed int)READ_EEPROM(0x10);
		LDWI 	10H 			//019F 	2A10
		LCALL 	6BAH 			//01A0 	36BA
		STR 	3BH 			//01A1 	01BB
		LDWI 	11H 			//01A2 	2A11
		CLRR 	3CH 			//01A3 	013C
		ORG		01A4H

		//;smartkey.C: 365: acYsum = (signed int)READ_EEPROM(0x11);
		LCALL 	6BAH 			//01A4 	36BA
		STR 	39H 			//01A5 	01B9
		CLRR 	3AH 			//01A6 	013A

		//;smartkey.C: 367: PAIE = 1;
		BSR 	INTCON,3 		//01A7 	198B

		//;smartkey.C: 368: timeTick = 0;
		CLRR 	70H 			//01A8 	0170
		CLRR 	71H 			//01A9 	0171

		//;smartkey.C: 374: if ( RegStatus.bits.b4 == 0) {
		BTSS 	72H,4 			//01AA 	1E72

		//;smartkey.C: 375: if (RegStatus.bits.b3 == 0) {
		BTSC 	72H,3 			//01AB 	15F2
		ORG		01ACH
		LJUMP 	27CH 			//01AC 	3A7C

		//;smartkey.C: 376: if (RegStatus.bits.b1) {
		BTSS 	72H,1 			//01AD 	1CF2
		LJUMP 	27CH 			//01AE 	3A7C

		//;smartkey.C: 378: PAIE = 0;
		BCR 	INTCON,3 		//01AF 	118B

		//;smartkey.C: 380: RegStatus.bits.b1 = 0;
		BCR 	72H,1 			//01B0 	10F2

		//;smartkey.C: 384: if (RegStatus.bits.b2) {
		BTSC 	72H,2 			//01B1 	1572
		LJUMP 	22EH 			//01B2 	3A2E
		LJUMP 	273H 			//01B3 	3A73
		ORG		01B4H

		//;smartkey.C: 388: lostDetect = 0;
		BCR 	STATUS,5 		//01B4 	1283
		CLRR 	30H 			//01B5 	0130
		LDWI 	28H 			//01B6 	2A28

		//;smartkey.C: 389: timeTick = 0;
		CLRR 	70H 			//01B7 	0170
		CLRR 	71H 			//01B8 	0171

		//;smartkey.C: 390: tmp16 = 40;
		STR 	3EH 			//01B9 	01BE
		CLRR 	3FH 			//01BA 	013F

		//;smartkey.C: 391: break;
		LJUMP 	27BH 			//01BB 	3A7B
		ORG		01BCH

		//;smartkey.C: 394: if (timeTick > 30) {
		LDWI 	0H 			//01BC 	2A00
		SUBWR 	71H,0 			//01BD 	0C71
		LDWI 	1FH 			//01BE 	2A1F
		BTSC 	STATUS,2 		//01BF 	1503
		SUBWR 	70H,0 			//01C0 	0C70
		BTSS 	STATUS,0 		//01C1 	1C03
		LJUMP 	27BH 			//01C2 	3A7B
		LDWI 	8H 			//01C3 	2A08
		ORG		01C4H

		//;smartkey.C: 395: timeTick = 0;
		CLRR 	70H 			//01C4 	0170
		CLRR 	71H 			//01C5 	0171

		//;smartkey.C: 397: if (READ_EEPROM(0x08) == 0xcc) WRITE_EEPROM(0x08, 0);
		LCALL 	6BAH 			//01C6 	36BA
		XORWI 	CCH 			//01C7 	26CC
		BTSS 	STATUS,2 		//01C8 	1D03
		LJUMP 	1CDH 			//01C9 	39CD
		LDWI 	8H 			//01CA 	2A08
		CLRR 	20H 			//01CB 	0120
		ORG		01CCH
		LCALL 	60BH 			//01CC 	360B

		//;smartkey.C: 399: if ((mtOldState == 3)) {
		BCR 	STATUS,5 		//01CD 	1283
		LDR 	46H,0 			//01CE 	0846
		XORWI 	3H 			//01CF 	2603
		BTSS 	STATUS,2 		//01D0 	1D03
		LJUMP 	1DDH 			//01D1 	39DD

		//;smartkey.C: 400: beepOn(); TMR2ON = 0; beep(10, 1);
		LCALL 	6EEH 			//01D2 	36EE
		LDWI 	AH 			//01D3 	2A0A
		ORG		01D4H
		BCR 	STATUS,5 		//01D4 	1283
		BCR 	12H,2 			//01D5 	1112
		CLRR 	24H 			//01D6 	0124
		INCR	24H,1 			//01D7 	09A4
		LCALL 	63EH 			//01D8 	363E

		//;smartkey.C: 401: if (RegStatus.bits.b7)RegStatus.bits.b7 = 0;
		BTSS 	72H,7 			//01D9 	1FF2
		LJUMP 	27BH 			//01DA 	3A7B
		BCR 	72H,7 			//01DB 	13F2
		ORG		01DCH
		LJUMP 	27BH 			//01DC 	3A7B

		//;smartkey.C: 403: else if ((mtOldState == 0) || (mtOldState == 4)) {
		LDR 	46H,0 			//01DD 	0846
		BTSC 	STATUS,2 		//01DE 	1503
		LJUMP 	1E4H 			//01DF 	39E4
		LDR 	46H,0 			//01E0 	0846
		XORWI 	4H 			//01E1 	2604
		BTSS 	STATUS,2 		//01E2 	1D03
		LJUMP 	201H 			//01E3 	3A01
		ORG		01E4H

		//;smartkey.C: 404: RegStatus.bits.b0 = 1;
		BSR 	72H,0 			//01E4 	1872

		//;smartkey.C: 405: setState(1, 3500);
		LDWI 	ACH 			//01E5 	2AAC
		STR 	20H 			//01E6 	01A0
		LDWI 	DH 			//01E7 	2A0D
		STR 	21H 			//01E8 	01A1
		LDWI 	1H 			//01E9 	2A01
		LCALL 	6C7H 			//01EA 	36C7

		//;smartkey.C: 406: if (READ_EEPROM(0x40))WRITE_EEPROM(0x40, 0);
		LDWI 	40H 			//01EB 	2A40
		ORG		01ECH
		LCALL 	6BAH 			//01EC 	36BA
		XORWI 	0H 			//01ED 	2600
		BTSC 	STATUS,2 		//01EE 	1503
		LJUMP 	1F3H 			//01EF 	39F3
		LDWI 	40H 			//01F0 	2A40
		CLRR 	20H 			//01F1 	0120
		LCALL 	60BH 			//01F2 	360B

		//;smartkey.C: 407: tmp16 = timeTick + 40;
		LDR 	71H,0 			//01F3 	0871
		ORG		01F4H
		BCR 	STATUS,5 		//01F4 	1283
		STR 	3FH 			//01F5 	01BF
		LDR 	70H,0 			//01F6 	0870
		STR 	3EH 			//01F7 	01BE
		LDWI 	28H 			//01F8 	2A28
		ADDWR 	3EH,1 			//01F9 	0BBE
		BTSC 	STATUS,0 		//01FA 	1403
		INCR	3FH,1 			//01FB 	09BF
		ORG		01FCH
		LDWI 	AH 			//01FC 	2A0A

		//;smartkey.C: 408: beep(10, 1);
		CLRR 	24H 			//01FD 	0124
		INCR	24H,1 			//01FE 	09A4
		LCALL 	63EH 			//01FF 	363E

		//;smartkey.C: 409: }
		LJUMP 	27BH 			//0200 	3A7B

		//;smartkey.C: 410: else if ((mtOldState == 1)) {
		DECRSZ 	46H,0 		//0201 	0E46
		LJUMP 	27BH 			//0202 	3A7B

		//;smartkey.C: 412: if (RegStatus.bits.b7)RegStatus.bits.b7 = 0;
		LJUMP 	1D9H 			//0203 	39D9
		ORG		0204H

		//;smartkey.C: 413: }
		//;smartkey.C: 414: }
		//;smartkey.C: 415: break;
		//;smartkey.C: 418: if (timeTick > 200) {
		LDWI 	0H 			//0204 	2A00
		SUBWR 	71H,0 			//0205 	0C71
		LDWI 	C9H 			//0206 	2AC9
		BTSC 	STATUS,2 		//0207 	1503
		SUBWR 	70H,0 			//0208 	0C70
		BTSS 	STATUS,0 		//0209 	1C03
		LJUMP 	27BH 			//020A 	3A7B

		//;smartkey.C: 420: beepOff();
		LCALL 	6E3H 			//020B 	36E3
		ORG		020CH

		//;smartkey.C: 421: if (READ_EEPROM(0x08) == 0xcc) WRITE_EEPROM(0x08, 0);
		LDWI 	8H 			//020C 	2A08
		LCALL 	6BAH 			//020D 	36BA
		XORWI 	CCH 			//020E 	26CC
		BTSS 	STATUS,2 		//020F 	1D03
		LJUMP 	214H 			//0210 	3A14
		LDWI 	8H 			//0211 	2A08
		CLRR 	20H 			//0212 	0120
		LCALL 	60BH 			//0213 	360B
		ORG		0214H

		//;smartkey.C: 422: RegStatus.bits.b0 = 1;
		BSR 	72H,0 			//0214 	1872

		//;smartkey.C: 423: setState(1, 3500);
		LDWI 	ACH 			//0215 	2AAC
		BCR 	STATUS,5 		//0216 	1283
		STR 	20H 			//0217 	01A0
		LDWI 	DH 			//0218 	2A0D
		STR 	21H 			//0219 	01A1
		LDWI 	1H 			//021A 	2A01
		LCALL 	6C7H 			//021B 	36C7
		ORG		021CH

		//;smartkey.C: 425: tmp16 = timeTick + 40;
		LDR 	71H,0 			//021C 	0871
		STR 	3FH 			//021D 	01BF
		LDR 	70H,0 			//021E 	0870
		STR 	3EH 			//021F 	01BE
		LDWI 	28H 			//0220 	2A28
		ADDWR 	3EH,1 			//0221 	0BBE
		BTSC 	STATUS,0 		//0222 	1403
		INCR	3FH,1 			//0223 	09BF
		ORG		0224H
		LJUMP 	27BH 			//0224 	3A7B

		//;smartkey.C: 431: beepOff();
		LCALL 	6E3H 			//0225 	36E3

		//;smartkey.C: 432: setState(2, 300);
		LDWI 	2CH 			//0226 	2A2C
		BCR 	STATUS,5 		//0227 	1283
		STR 	20H 			//0228 	01A0
		LDWI 	1H 			//0229 	2A01
		STR 	21H 			//022A 	01A1
		LDWI 	2H 			//022B 	2A02
		ORG		022CH
		LCALL 	6C7H 			//022C 	36C7

		//;smartkey.C: 433: break;
		LJUMP 	27BH 			//022D 	3A7B
		LDR 	74H,0 			//022E 	0874
		STR 	FSR 			//022F 	0184
		LDWI 	5H 			//0230 	2A05
		SUBWR 	FSR,0 			//0231 	0C04
		BTSC 	STATUS,0 		//0232 	1403
		LJUMP 	27BH 			//0233 	3A7B
		ORG		0234H
		LDWI 	6H 			//0234 	2A06
		STR 	PCLATH 			//0235 	018A
		LDWI 	E9H 			//0236 	2AE9
		ADDWR 	FSR,0 			//0237 	0B04
		STR 	PCL 			//0238 	0182

		//;smartkey.C: 448: if ((lostDetect == 1) && (timeTick < 1500) && (timeTick > 700))
		BCR 	STATUS,5 		//0239 	1283
		DECRSZ 	30H,0 		//023A 	0E30
		LJUMP 	267H 			//023B 	3A67
		ORG		023CH
		LDWI 	5H 			//023C 	2A05
		SUBWR 	71H,0 			//023D 	0C71
		LDWI 	DCH 			//023E 	2ADC
		BTSC 	STATUS,2 		//023F 	1503
		SUBWR 	70H,0 			//0240 	0C70
		BTSC 	STATUS,0 		//0241 	1403
		LJUMP 	267H 			//0242 	3A67
		LDWI 	2H 			//0243 	2A02
		ORG		0244H
		SUBWR 	71H,0 			//0244 	0C71
		LDWI 	BDH 			//0245 	2ABD
		BTSC 	STATUS,2 		//0246 	1503
		SUBWR 	70H,0 			//0247 	0C70
		BTSS 	STATUS,0 		//0248 	1C03
		LJUMP 	267H 			//0249 	3A67

		//;smartkey.C: 449: {
		//;smartkey.C: 450: if (READ_EEPROM(0x08) == 0x00) WRITE_EEPROM(0x08, 0xcc);
		LDWI 	8H 			//024A 	2A08
		LCALL 	6BAH 			//024B 	36BA
		ORG		024CH
		IORWI 	0H 			//024C 	2500
		BTSS 	STATUS,2 		//024D 	1D03
		LJUMP 	253H 			//024E 	3A53
		LDWI 	CCH 			//024F 	2ACC
		STR 	20H 			//0250 	01A0
		LDWI 	8H 			//0251 	2A08
		LCALL 	60BH 			//0252 	360B

		//;smartkey.C: 452: setState(3, 1800);
		LDWI 	8H 			//0253 	2A08
		ORG		0254H
		BCR 	STATUS,5 		//0254 	1283
		STR 	20H 			//0255 	01A0
		LDWI 	7H 			//0256 	2A07
		STR 	21H 			//0257 	01A1
		LDWI 	3H 			//0258 	2A03
		LCALL 	6C7H 			//0259 	36C7

		//;smartkey.C: 453: cntTmp = timeTick + 40;
		LDR 	71H,0 			//025A 	0871
		STR 	42H 			//025B 	01C2
		ORG		025CH
		LDR 	70H,0 			//025C 	0870
		STR 	41H 			//025D 	01C1
		LDWI 	28H 			//025E 	2A28
		ADDWR 	41H,1 			//025F 	0BC1
		BTSC 	STATUS,0 		//0260 	1403
		INCR	42H,1 			//0261 	09C2

		//;smartkey.C: 454: PR2L = 20;
		LDWI 	14H 			//0262 	2A14
		BSR 	STATUS,5 		//0263 	1A83
		ORG		0264H
		STR 	11H 			//0264 	0191

		//;smartkey.C: 455: beepOn();
		LCALL 	6EEH 			//0265 	36EE
		LJUMP 	1B4H 			//0266 	39B4

		//;smartkey.C: 457: }
		//;smartkey.C: 456: lostDetect = 0;
		//;smartkey.C: 458: else {
		//;smartkey.C: 459: lostDetect = 1;
		CLRR 	30H 			//0267 	0130
		INCR	30H,1 			//0268 	09B0
		LJUMP 	1B6H 			//0269 	39B6

		//;smartkey.C: 462: }
		//;smartkey.C: 463: timeTick = 0;
		//;smartkey.C: 468: timeTick = 0;
		CLRR 	70H 			//026A 	0170
		CLRR 	71H 			//026B 	0171
		ORG		026CH

		//;smartkey.C: 471: if (mtOldState == 3) {RegStatus.bits.b7 = 1;}
		BCR 	STATUS,5 		//026C 	1283
		LDR 	46H,0 			//026D 	0846
		XORWI 	3H 			//026E 	2603
		BTSS 	STATUS,2 		//026F 	1D03
		LJUMP 	27BH 			//0270 	3A7B
		BSR 	72H,7 			//0271 	1BF2
		LJUMP 	27BH 			//0272 	3A7B
		LDR 	74H,0 			//0273 	0874
		ORG		0274H
		XORWI 	1H 			//0274 	2601
		BTSC 	STATUS,2 		//0275 	1503
		LJUMP 	239H 			//0276 	3A39
		XORWI 	3H 			//0277 	2603
		BTSC 	STATUS,2 		//0278 	1503
		LJUMP 	26AH 			//0279 	3A6A
		LJUMP 	27BH 			//027A 	3A7B

		//;smartkey.C: 474: }
		//;smartkey.C: 475: PAIE = 1;
		BSR 	INTCON,3 		//027B 	198B
		ORG		027CH

		//;smartkey.C: 476: }
		//;smartkey.C: 477: }
		//;smartkey.C: 478: }
		//;smartkey.C: 481: if ((timeOut != 0) && ( timeTick > timeOut)) {
		BCR 	STATUS,5 		//027C 	1283
		LDR 	44H,0 			//027D 	0844
		IORWR 	43H,0 			//027E 	0343
		BTSC 	STATUS,2 		//027F 	1503
		LJUMP 	302H 			//0280 	3B02
		LDR 	71H,0 			//0281 	0871
		SUBWR 	44H,0 			//0282 	0C44
		BTSS 	STATUS,2 		//0283 	1D03
		ORG		0284H
		LJUMP 	287H 			//0284 	3A87
		LDR 	70H,0 			//0285 	0870
		SUBWR 	43H,0 			//0286 	0C43
		BTSS 	STATUS,0 		//0287 	1C03
		LJUMP 	2F4H 			//0288 	3AF4
		LJUMP 	302H 			//0289 	3B02

		//;smartkey.C: 489: beepOff();
		LCALL 	6E3H 			//028A 	36E3

		//;smartkey.C: 490: RegStatus.bits.b0 = 0;
		BCR 	72H,0 			//028B 	1072
		ORG		028CH

		//;smartkey.C: 491: setState(2, 300);
		LDWI 	2CH 			//028C 	2A2C
		BCR 	STATUS,5 		//028D 	1283
		STR 	20H 			//028E 	01A0
		LDWI 	1H 			//028F 	2A01
		STR 	21H 			//0290 	01A1
		LDWI 	2H 			//0291 	2A02
		LCALL 	6C7H 			//0292 	36C7

		//;smartkey.C: 492: break;
		LJUMP 	302H 			//0293 	3B02
		ORG		0294H

		//;smartkey.C: 494: beepOff();
		LCALL 	6E3H 			//0294 	36E3

		//;smartkey.C: 495: delay_x10ms(20);
		LDWI 	14H 			//0295 	2A14
		BCR 	STATUS,5 		//0296 	1283
		STR 	20H 			//0297 	01A0
		CLRR 	21H 			//0298 	0121
		LCALL 	67DH 			//0299 	367D

		//;smartkey.C: 496: beepOn(); TMR2ON = 0; RegStatus.bits.b7 = 0;
		LCALL 	6EEH 			//029A 	36EE
		BCR 	STATUS,5 		//029B 	1283
		ORG		029CH
		BCR 	12H,2 			//029C 	1112
		BCR 	72H,7 			//029D 	13F2
		LDWI 	1EH 			//029E 	2A1E

		//;smartkey.C: 497: beep(30, 1);
		CLRR 	24H 			//029F 	0124
		INCR	24H,1 			//02A0 	09A4
		LCALL 	63EH 			//02A1 	363E

		//;smartkey.C: 498: RegStatus.bits.b5 = 1;
		BSR 	72H,5 			//02A2 	1AF2
		LDWI 	0H 			//02A3 	2A00
		ORG		02A4H

		//;smartkey.C: 499: setState(0, 0);
		CLRR 	20H 			//02A4 	0120
		CLRR 	21H 			//02A5 	0121
		LCALL 	6C7H 			//02A6 	36C7

		//;smartkey.C: 501: tmp16 = timeTick + 40;
		LDR 	71H,0 			//02A7 	0871
		STR 	3FH 			//02A8 	01BF
		LDR 	70H,0 			//02A9 	0870
		STR 	3EH 			//02AA 	01BE
		LDWI 	28H 			//02AB 	2A28
		ORG		02ACH
		ADDWR 	3EH,1 			//02AC 	0BBE
		BTSC 	STATUS,0 		//02AD 	1403
		INCR	3FH,1 			//02AE 	09BF

		//;smartkey.C: 502: break;
		LJUMP 	302H 			//02AF 	3B02

		//;smartkey.C: 505: if (READ_EEPROM(0x08) == 0xcc) WRITE_EEPROM(0x08, 0);
		LDWI 	8H 			//02B0 	2A08
		LCALL 	6BAH 			//02B1 	36BA
		XORWI 	CCH 			//02B2 	26CC
		BTSS 	STATUS,2 		//02B3 	1D03
		ORG		02B4H
		LJUMP 	2B8H 			//02B4 	3AB8
		LDWI 	8H 			//02B5 	2A08
		CLRR 	20H 			//02B6 	0120
		LCALL 	60BH 			//02B7 	360B

		//;smartkey.C: 506: if (RegStatus.bits.b7) {
		BTSS 	72H,7 			//02B8 	1FF2
		LJUMP 	2CEH 			//02B9 	3ACE

		//;smartkey.C: 507: setState(4, 6000);
		LDWI 	70H 			//02BA 	2A70
		BCR 	STATUS,5 		//02BB 	1283
		ORG		02BCH
		STR 	20H 			//02BC 	01A0
		LDWI 	17H 			//02BD 	2A17
		STR 	21H 			//02BE 	01A1
		LDWI 	4H 			//02BF 	2A04
		LCALL 	6C7H 			//02C0 	36C7

		//;smartkey.C: 508: cntTmp = timeTick + 40;
		LDR 	71H,0 			//02C1 	0871
		STR 	42H 			//02C2 	01C2
		LDR 	70H,0 			//02C3 	0870
		ORG		02C4H
		STR 	41H 			//02C4 	01C1
		LDWI 	28H 			//02C5 	2A28
		ADDWR 	41H,1 			//02C6 	0BC1
		BTSC 	STATUS,0 		//02C7 	1403
		INCR	42H,1 			//02C8 	09C2

		//;smartkey.C: 509: PR2L = 20;
		LDWI 	14H 			//02C9 	2A14
		BSR 	STATUS,5 		//02CA 	1A83
		STR 	11H 			//02CB 	0191
		ORG		02CCH

		//;smartkey.C: 510: beepOn();
		LCALL 	6EEH 			//02CC 	36EE

		//;smartkey.C: 512: } else if (mtOldState == 0) {
		LJUMP 	302H 			//02CD 	3B02
		BCR 	STATUS,5 		//02CE 	1283
		LDR 	46H,1 			//02CF 	08C6
		BTSS 	STATUS,2 		//02D0 	1D03
		LJUMP 	2E6H 			//02D1 	3AE6

		//;smartkey.C: 514: beep(10, 5);
		LDWI 	5H 			//02D2 	2A05
		STR 	24H 			//02D3 	01A4
		ORG		02D4H
		LDWI 	AH 			//02D4 	2A0A
		LCALL 	63EH 			//02D5 	363E

		//;smartkey.C: 515: RegStatus.bits.b0 = 1;
		BSR 	72H,0 			//02D6 	1872

		//;smartkey.C: 516: if (READ_EEPROM(0x40))WRITE_EEPROM(0x40, 0);
		LDWI 	40H 			//02D7 	2A40
		LCALL 	6BAH 			//02D8 	36BA
		XORWI 	0H 			//02D9 	2600
		BTSC 	STATUS,2 		//02DA 	1503
		LJUMP 	2DFH 			//02DB 	3ADF
		ORG		02DCH
		LDWI 	40H 			//02DC 	2A40
		CLRR 	20H 			//02DD 	0120
		LCALL 	60BH 			//02DE 	360B

		//;smartkey.C: 517: setState(1, 3500);
		LDWI 	ACH 			//02DF 	2AAC
		BCR 	STATUS,5 		//02E0 	1283
		STR 	20H 			//02E1 	01A0
		LDWI 	DH 			//02E2 	2A0D
		STR 	21H 			//02E3 	01A1
		ORG		02E4H
		LDWI 	1H 			//02E4 	2A01
		LJUMP 	2A6H 			//02E5 	3AA6

		//;smartkey.C: 521: beepOn(); TMR2ON = 0;
		LCALL 	6EEH 			//02E6 	36EE
		BCR 	STATUS,5 		//02E7 	1283
		BCR 	12H,2 			//02E8 	1112

		//;smartkey.C: 522: RegStatus.bits.b7 = 0;
		BCR 	72H,7 			//02E9 	13F2
		LDWI 	1EH 			//02EA 	2A1E

		//;smartkey.C: 523: beep(30, 1);
		CLRR 	24H 			//02EB 	0124
		ORG		02ECH
		INCR	24H,1 			//02EC 	09A4
		LCALL 	63EH 			//02ED 	363E
		LDWI 	0H 			//02EE 	2A00

		//;smartkey.C: 524: setState(0, 0);
		CLRR 	20H 			//02EF 	0120
		CLRR 	21H 			//02F0 	0121
		LCALL 	6C7H 			//02F1 	36C7

		//;smartkey.C: 526: RegStatus.bits.b5 = 1;
		BSR 	72H,5 			//02F2 	1AF2
		LJUMP 	2A7H 			//02F3 	3AA7
		ORG		02F4H
		LDR 	74H,0 			//02F4 	0874
		XORWI 	1H 			//02F5 	2601
		BTSC 	STATUS,2 		//02F6 	1503
		LJUMP 	302H 			//02F7 	3B02
		XORWI 	3H 			//02F8 	2603
		BTSC 	STATUS,2 		//02F9 	1503
		LJUMP 	2B0H 			//02FA 	3AB0
		XORWI 	1H 			//02FB 	2601
		ORG		02FCH
		BTSC 	STATUS,2 		//02FC 	1503
		LJUMP 	28AH 			//02FD 	3A8A
		XORWI 	7H 			//02FE 	2607
		BTSC 	STATUS,2 		//02FF 	1503
		LJUMP 	294H 			//0300 	3A94
		LJUMP 	302H 			//0301 	3B02

		//;smartkey.C: 531: }
		//;smartkey.C: 533: if ((timeTick > tmp16) && (RegStatus.bits.b6 == 1)) {
		LDR 	71H,0 			//0302 	0871
		BCR 	STATUS,5 		//0303 	1283
		ORG		0304H
		SUBWR 	3FH,0 			//0304 	0C3F
		BTSS 	STATUS,2 		//0305 	1D03
		LJUMP 	309H 			//0306 	3B09
		LDR 	70H,0 			//0307 	0870
		SUBWR 	3EH,0 			//0308 	0C3E
		BTSS 	STATUS,0 		//0309 	1C03
		BTSS 	72H,6 			//030A 	1F72
		LJUMP 	3D5H 			//030B 	3BD5
		ORG		030CH

		//;smartkey.C: 534: if (timeTick > 65000) timeTick = 0;
		LDWI 	FDH 			//030C 	2AFD
		SUBWR 	71H,0 			//030D 	0C71
		LDWI 	E9H 			//030E 	2AE9
		BTSC 	STATUS,2 		//030F 	1503
		SUBWR 	70H,0 			//0310 	0C70
		BTSS 	STATUS,0 		//0311 	1C03
		LJUMP 	315H 			//0312 	3B15
		CLRR 	70H 			//0313 	0170
		ORG		0314H
		CLRR 	71H 			//0314 	0171

		//;smartkey.C: 535: tmp16 = timeTick + 40;
		LDR 	71H,0 			//0315 	0871
		STR 	3FH 			//0316 	01BF
		LDR 	70H,0 			//0317 	0870
		STR 	3EH 			//0318 	01BE
		LDWI 	28H 			//0319 	2A28
		ADDWR 	3EH,1 			//031A 	0BBE
		BTSC 	STATUS,0 		//031B 	1403
		ORG		031CH
		INCR	3FH,1 			//031C 	09BF

		//;smartkey.C: 537: if (AccRead(0x02,buf, 6) == 0) {
		LDWI 	33H 			//031D 	2A33
		STR 	24H 			//031E 	01A4
		LDWI 	6H 			//031F 	2A06
		STR 	25H 			//0320 	01A5
		LDWI 	2H 			//0321 	2A02
		LCALL 	579H 			//0322 	3579
		IORWI 	0H 			//0323 	2500
		ORG		0324H
		BTSS 	STATUS,2 		//0324 	1D03
		LJUMP 	3D5H 			//0325 	3BD5

		//;smartkey.C: 539: if((mtState == 1) ){
		DECRSZ 	74H,0 		//0326 	0E74
		LJUMP 	3B2H 			//0327 	3BB2

		//;smartkey.C: 542: if (compe((signed char)buf[1], (signed char)acXsum, 4) && compe((signe
		//+                          d char)buf[3], (signed char)acYsum, 4)) {
		BCR 	STATUS,5 		//0328 	1283
		LDR 	3BH,0 			//0329 	083B
		STR 	20H 			//032A 	01A0
		LDWI 	4H 			//032B 	2A04
		ORG		032CH
		STR 	21H 			//032C 	01A1
		LDR 	34H,0 			//032D 	0834
		LCALL 	53CH 			//032E 	353C
		XORWI 	0H 			//032F 	2600
		BCR 	STATUS,5 		//0330 	1283
		BTSC 	STATUS,2 		//0331 	1503
		LJUMP 	361H 			//0332 	3B61
		LDR 	39H,0 			//0333 	0839
		ORG		0334H
		STR 	20H 			//0334 	01A0
		LDWI 	4H 			//0335 	2A04
		STR 	21H 			//0336 	01A1
		LDR 	36H,0 			//0337 	0836
		LCALL 	53CH 			//0338 	353C
		XORWI 	0H 			//0339 	2600

		//;smartkey.C: 544: isSw++;
		BCR 	STATUS,5 		//033A 	1283
		BTSC 	STATUS,2 		//033B 	1503
		ORG		033CH
		LJUMP 	361H 			//033C 	3B61
		LDWI 	2DH 			//033D 	2A2D
		INCR	3DH,1 			//033E 	09BD

		//;smartkey.C: 545: if (isSw > 44) {
		SUBWR 	3DH,0 			//033F 	0C3D
		BTSS 	STATUS,0 		//0340 	1C03
		LJUMP 	354H 			//0341 	3B54

		//;smartkey.C: 546: isSw = 0;
		CLRR 	3DH 			//0342 	013D

		//;smartkey.C: 547: RegStatus.bits.b5 = 1;
		BSR 	72H,5 			//0343 	1AF2
		ORG		0344H

		//;smartkey.C: 550: RegStatus.bits.b0 = 0;
		BCR 	72H,0 			//0344 	1072

		//;smartkey.C: 551: setState(2, 300);
		LDWI 	2CH 			//0345 	2A2C
		STR 	20H 			//0346 	01A0
		LDWI 	1H 			//0347 	2A01
		STR 	21H 			//0348 	01A1
		LDWI 	2H 			//0349 	2A02
		LCALL 	6C7H 			//034A 	36C7

		//;smartkey.C: 552: tmp16 = timeTick + 40;
		LDR 	71H,0 			//034B 	0871
		ORG		034CH
		STR 	3FH 			//034C 	01BF
		LDR 	70H,0 			//034D 	0870
		STR 	3EH 			//034E 	01BE
		LDWI 	28H 			//034F 	2A28
		ADDWR 	3EH,1 			//0350 	0BBE
		BTSC 	STATUS,0 		//0351 	1403
		INCR	3FH,1 			//0352 	09BF

		//;smartkey.C: 553: }
		LJUMP 	390H 			//0353 	3B90
		ORG		0354H

		//;smartkey.C: 554: else if (isSw > 25) {
		LDWI 	1AH 			//0354 	2A1A
		SUBWR 	3DH,0 			//0355 	0C3D
		BTSC 	STATUS,0 		//0356 	1403

		//;smartkey.C: 555: if (isSw % 2 == 0) {
		BTSC 	3DH,0 			//0357 	143D
		LJUMP 	390H 			//0358 	3B90

		//;smartkey.C: 556: beepOn(); TMR2ON = 0; beep(7, 1);
		LCALL 	6EEH 			//0359 	36EE
		LDWI 	7H 			//035A 	2A07
		BCR 	STATUS,5 		//035B 	1283
		ORG		035CH
		BCR 	12H,2 			//035C 	1112
		CLRR 	24H 			//035D 	0124
		INCR	24H,1 			//035E 	09A4
		LCALL 	63EH 			//035F 	363E
		LJUMP 	390H 			//0360 	3B90

		//;smartkey.C: 561: else
		//;smartkey.C: 563: {
		//;smartkey.C: 564: isSw = 0;
		//;smartkey.C: 557: }
		//;smartkey.C: 558: }
		//;smartkey.C: 559: }
		CLRR 	3DH 			//0361 	013D

		//;smartkey.C: 567: if (compe((signed char)buf[1],acXOld,1 ) && compe((signed char)buf[3],
		//+                          acYOld,1)) {
		LDR 	32H,0 			//0362 	0832
		STR 	20H 			//0363 	01A0
		ORG		0364H
		CLRR 	21H 			//0364 	0121
		INCR	21H,1 			//0365 	09A1
		LDR 	34H,0 			//0366 	0834
		LCALL 	53CH 			//0367 	353C
		XORWI 	0H 			//0368 	2600
		BCR 	STATUS,5 		//0369 	1283
		BTSC 	STATUS,2 		//036A 	1503
		LJUMP 	38EH 			//036B 	3B8E
		ORG		036CH
		LDR 	31H,0 			//036C 	0831
		STR 	20H 			//036D 	01A0
		CLRR 	21H 			//036E 	0121
		INCR	21H,1 			//036F 	09A1
		LDR 	36H,0 			//0370 	0836
		LCALL 	53CH 			//0371 	353C
		XORWI 	0H 			//0372 	2600

		//;smartkey.C: 568: isWait++;
		BCR 	STATUS,5 		//0373 	1283
		ORG		0374H
		BTSC 	STATUS,2 		//0374 	1503
		LJUMP 	38EH 			//0375 	3B8E
		INCR	2DH,1 			//0376 	09AD
		BTSC 	STATUS,2 		//0377 	1503
		INCR	2EH,1 			//0378 	09AE

		//;smartkey.C: 569: if (isWait == 450) {
		DECR 	2EH,0 			//0379 	0D2E
		LDWI 	C2H 			//037A 	2AC2
		BTSC 	STATUS,2 		//037B 	1503
		ORG		037CH
		XORWR 	2DH,0 			//037C 	042D
		BTSS 	STATUS,2 		//037D 	1D03
		LJUMP 	390H 			//037E 	3B90
		LDWI 	2H 			//037F 	2A02

		//;smartkey.C: 570: isWait = 0;
		CLRR 	2DH 			//0380 	012D
		CLRR 	2EH 			//0381 	012E

		//;smartkey.C: 571: beep(7, 2);
		STR 	24H 			//0382 	01A4
		LDWI 	7H 			//0383 	2A07
		ORG		0384H
		LCALL 	63EH 			//0384 	363E

		//;smartkey.C: 572: RegStatus.bits.b5 = 1;
		BSR 	72H,5 			//0385 	1AF2

		//;smartkey.C: 573: RegStatus.bits.b0 = 0;
		BCR 	72H,0 			//0386 	1072

		//;smartkey.C: 574: setState(2, 300);
		LDWI 	2CH 			//0387 	2A2C
		STR 	20H 			//0388 	01A0
		LDWI 	1H 			//0389 	2A01
		STR 	21H 			//038A 	01A1
		LDWI 	2H 			//038B 	2A02
		ORG		038CH
		LCALL 	6C7H 			//038C 	36C7
		LJUMP 	390H 			//038D 	3B90

		//;smartkey.C: 577: else
		//;smartkey.C: 578: {isWait = 0;}
		CLRR 	2DH 			//038E 	012D
		CLRR 	2EH 			//038F 	012E

		//;smartkey.C: 579: }
		//;smartkey.C: 582: if ( ((signed char)buf[5] > -15) && ((signed char)buf[5] < 15)) {
		LDR 	38H,0 			//0390 	0838
		XORWI 	80H 			//0391 	2680
		ADDWI 	8EH 			//0392 	278E
		BTSS 	STATUS,0 		//0393 	1C03
		ORG		0394H
		LJUMP 	3ACH 			//0394 	3BAC
		LDR 	38H,0 			//0395 	0838
		XORWI 	80H 			//0396 	2680
		ADDWI 	71H 			//0397 	2771
		BTSC 	STATUS,0 		//0398 	1403
		LJUMP 	3ACH 			//0399 	3BAC
		LDWI 	5H 			//039A 	2A05

		//;smartkey.C: 583: isFall++;
		INCR	2FH,1 			//039B 	09AF
		ORG		039CH

		//;smartkey.C: 584: if (isFall > 4) {
		SUBWR 	2FH,0 			//039C 	0C2F
		BTSS 	STATUS,0 		//039D 	1C03
		LJUMP 	3ADH 			//039E 	3BAD
		LDWI 	2H 			//039F 	2A02

		//;smartkey.C: 585: isFall = 0;
		CLRR 	2FH 			//03A0 	012F

		//;smartkey.C: 586: beep(7, 2);
		STR 	24H 			//03A1 	01A4
		LDWI 	7H 			//03A2 	2A07
		LCALL 	63EH 			//03A3 	363E
		ORG		03A4H

		//;smartkey.C: 587: RegStatus.bits.b0 = 0;
		BCR 	72H,0 			//03A4 	1072

		//;smartkey.C: 588: setState(2, 300);
		LDWI 	2CH 			//03A5 	2A2C
		STR 	20H 			//03A6 	01A0
		LDWI 	1H 			//03A7 	2A01
		STR 	21H 			//03A8 	01A1
		LDWI 	2H 			//03A9 	2A02
		LCALL 	6C7H 			//03AA 	36C7
		LJUMP 	3ADH 			//03AB 	3BAD
		ORG		03ACH

		//;smartkey.C: 591: else {
		//;smartkey.C: 592: isFall = 0;
		CLRR 	2FH 			//03AC 	012F

		//;smartkey.C: 593: }
		//;smartkey.C: 596: acYOld =(signed char)buf[3]; acXOld = (signed char)buf[1];
		LDR 	36H,0 			//03AD 	0836
		STR 	31H 			//03AE 	01B1
		LDR 	34H,0 			//03AF 	0834
		STR 	32H 			//03B0 	01B2

		//;smartkey.C: 599: }
		LJUMP 	3D5H 			//03B1 	3BD5

		//;smartkey.C: 600: else if(mtState== 0){
		LDR 	74H,1 			//03B2 	08F4
		BTSC 	STATUS,2 		//03B3 	1503
		ORG		03B4H

		//;smartkey.C: 602: if (RegStatus.bits.b5) {
		BTSS 	72H,5 			//03B4 	1EF2
		LJUMP 	3D5H 			//03B5 	3BD5

		//;smartkey.C: 603: if (compe((signed char)buf[1],acXOld , 3) && compe((signed char)buf[3]
		//+                          ,acYOld , 3)) {
		BCR 	STATUS,5 		//03B6 	1283
		LDR 	32H,0 			//03B7 	0832
		STR 	20H 			//03B8 	01A0
		LDWI 	3H 			//03B9 	2A03
		STR 	21H 			//03BA 	01A1
		LDR 	34H,0 			//03BB 	0834
		ORG		03BCH
		LCALL 	53CH 			//03BC 	353C
		XORWI 	0H 			//03BD 	2600
		BCR 	STATUS,5 		//03BE 	1283
		BTSC 	STATUS,2 		//03BF 	1503
		LJUMP 	3CDH 			//03C0 	3BCD
		LDR 	31H,0 			//03C1 	0831
		STR 	20H 			//03C2 	01A0
		LDWI 	3H 			//03C3 	2A03
		ORG		03C4H
		STR 	21H 			//03C4 	01A1
		LDR 	36H,0 			//03C5 	0836
		LCALL 	53CH 			//03C6 	353C
		XORWI 	0H 			//03C7 	2600

		//;smartkey.C: 605: isSw = 0;
		BCR 	STATUS,5 		//03C8 	1283
		BTSC 	STATUS,2 		//03C9 	1503
		LJUMP 	3CDH 			//03CA 	3BCD
		CLRR 	3DH 			//03CB 	013D
		ORG		03CCH

		//;smartkey.C: 606: }
		LJUMP 	3D5H 			//03CC 	3BD5

		//;smartkey.C: 607: else {
		//;smartkey.C: 608: isSw++;
		INCR	3DH,1 			//03CD 	09BD

		//;smartkey.C: 609: beepOn(); TMR2ON = 0; beep(7, 3);
		LCALL 	6EEH 			//03CE 	36EE
		LDWI 	3H 			//03CF 	2A03
		BCR 	STATUS,5 		//03D0 	1283
		BCR 	12H,2 			//03D1 	1112
		STR 	24H 			//03D2 	01A4
		LDWI 	7H 			//03D3 	2A07
		ORG		03D4H
		LCALL 	63EH 			//03D4 	363E

		//;smartkey.C: 610: }
		//;smartkey.C: 611: }
		//;smartkey.C: 612: }
		//;smartkey.C: 615: }
		//;smartkey.C: 616: }
		//;smartkey.C: 618: if (RegStatus.bits.b0) {RC0 = 1; RC1 = 1;}
		BTSS 	72H,0 			//03D5 	1C72
		LJUMP 	3DBH 			//03D6 	3BDB
		BCR 	STATUS,5 		//03D7 	1283
		BSR 	7H,0 			//03D8 	1807
		BSR 	7H,1 			//03D9 	1887
		LJUMP 	3DEH 			//03DA 	3BDE

		//;smartkey.C: 619: else {RC0 = 0; RC1 = 0;}
		BCR 	STATUS,5 		//03DB 	1283
		ORG		03DCH
		BCR 	7H,0 			//03DC 	1007
		BCR 	7H,1 			//03DD 	1087

		//;smartkey.C: 622: if (timeTick > 500){
		LDWI 	1H 			//03DE 	2A01
		SUBWR 	71H,0 			//03DF 	0C71
		LDWI 	F5H 			//03E0 	2AF5
		BTSC 	STATUS,2 		//03E1 	1503
		SUBWR 	70H,0 			//03E2 	0C70
		BTSS 	STATUS,0 		//03E3 	1C03
		ORG		03E4H
		LJUMP 	1AAH 			//03E4 	39AA

		//;smartkey.C: 623: if (READ_EEPROM(0x3F)) WRITE_EEPROM(0x3F, 0);
		LDWI 	3FH 			//03E5 	2A3F
		LCALL 	6BAH 			//03E6 	36BA
		XORWI 	0H 			//03E7 	2600
		BTSC 	STATUS,2 		//03E8 	1503
		LJUMP 	3EDH 			//03E9 	3BED
		LDWI 	3FH 			//03EA 	2A3F
		CLRR 	20H 			//03EB 	0120
		ORG		03ECH
		LCALL 	60BH 			//03EC 	360B

		//;smartkey.C: 624: if (READ_EEPROM(0x40)) WRITE_EEPROM(0x40, 0);
		LDWI 	40H 			//03ED 	2A40
		LCALL 	6BAH 			//03EE 	36BA
		XORWI 	0H 			//03EF 	2600
		BTSC 	STATUS,2 		//03F0 	1503
		LJUMP 	1AAH 			//03F1 	39AA
		LDWI 	40H 			//03F2 	2A40
		CLRR 	20H 			//03F3 	0120
		ORG		03F4H
		LCALL 	60BH 			//03F4 	360B
		LJUMP 	1AAH 			//03F5 	39AA

		//;smartkey.C: 50: if (PAIE && PAIF) {
		BTSC 	INTCON,3 		//03F6 	158B
		BTSS 	INTCON,0 		//03F7 	1C0B
		LJUMP 	405H 			//03F8 	3C05
		BCR 	STATUS,5 		//03F9 	1283
		LDR 	5H,0 			//03FA 	0805

		//;smartkey.C: 52: PAIF = 0;
		BCR 	INTCON,0 		//03FB 	100B
		ORG		03FCH

		//;smartkey.C: 54: if (RA5) {
		BTSS 	5H,5 			//03FC 	1E85
		LJUMP 	404H 			//03FD 	3C04

		//;smartkey.C: 55: if (RegStatus.bits.b3 == 0) {
		BTSC 	72H,3 			//03FE 	15F2
		LJUMP 	405H 			//03FF 	3C05

		//;smartkey.C: 56: cntCyc = 0;
		CLRR 	73H 			//0400 	0173

		//;smartkey.C: 57: cntOff = 0;
		CLRR 	45H 			//0401 	0145

		//;smartkey.C: 59: RegStatus.bits.b3 = 1;
		BSR 	72H,3 			//0402 	19F2
		LJUMP 	405H 			//0403 	3C05
		ORG		0404H

		//;smartkey.C: 62: else {
		//;smartkey.C: 63: cntOff = 0;
		CLRR 	45H 			//0404 	0145

		//;smartkey.C: 64: }
		//;smartkey.C: 65: }
		//;smartkey.C: 67: if (INTE && INTF) {
		BTSC 	INTCON,4 		//0405 	160B
		BTSS 	INTCON,1 		//0406 	1C8B
		LJUMP 	41DH 			//0407 	3C1D

		//;smartkey.C: 68: INTF = 0;
		BCR 	INTCON,1 		//0408 	108B

		//;smartkey.C: 69: if ( RA2 == 0) {
		BCR 	STATUS,5 		//0409 	1283
		BTSC 	5H,2 			//040A 	1505
		LJUMP 	41DH 			//040B 	3C1D
		ORG		040CH

		//;smartkey.C: 70: if (timeTick < 32) {
		LDWI 	0H 			//040C 	2A00
		SUBWR 	71H,0 			//040D 	0C71
		LDWI 	20H 			//040E 	2A20
		BTSC 	STATUS,2 		//040F 	1503
		SUBWR 	70H,0 			//0410 	0C70
		BTSC 	STATUS,0 		//0411 	1403
		LJUMP 	41AH 			//0412 	3C1A

		//;smartkey.C: 71: tmp = READ_EEPROM(0x3F);
		LDWI 	3FH 			//0413 	2A3F
		ORG		0414H
		LCALL 	6DBH 			//0414 	36DB
		STR 	79H 			//0415 	01F9

		//;smartkey.C: 72: WRITE_EEPROM(0x3F, tmp + 1);
		INCR	79H,0 			//0416 	0979
		STR 	75H 			//0417 	01F5
		LDWI 	3FH 			//0418 	2A3F
		LCALL 	626H 			//0419 	3626
		BCR 	STATUS,5 		//041A 	1283
		BTSS 	5H,2 			//041B 	1D05
		ORG		041CH
		LJUMP 	41AH 			//041C 	3C1A

		//;smartkey.C: 75: }
		//;smartkey.C: 76: }
		//;smartkey.C: 79: if (T0IE && T0IF) {
		BTSC 	INTCON,5 		//041D 	168B
		BTSS 	INTCON,2 		//041E 	1D0B
		LJUMP 	46CH 			//041F 	3C6C
		LDWI 	B3H 			//0420 	2AB3

		//;smartkey.C: 80: T0IF = 0;
		BCR 	INTCON,2 		//0421 	110B

		//;smartkey.C: 81: TMR0 = 179;
		BCR 	STATUS,5 		//0422 	1283
		STR 	1H 			//0423 	0181
		ORG		0424H

		//;smartkey.C: 87: if ( RegStatus.bits.b3 == 1) {
		BTSS 	72H,3 			//0424 	1DF2
		LJUMP 	43EH 			//0425 	3C3E

		//;smartkey.C: 89: cntCyc++;
		INCR	73H,1 			//0426 	09F3

		//;smartkey.C: 90: if (RA5 == 0) {
		BTSC 	5H,5 			//0427 	1685
		LJUMP 	43EH 			//0428 	3C3E
		LDWI 	10H 			//0429 	2A10

		//;smartkey.C: 92: cntOff++;
		INCR	45H,1 			//042A 	09C5

		//;smartkey.C: 94: if (cntOff > 15) {
		SUBWR 	45H,0 			//042B 	0C45
		ORG		042CH
		BTSS 	STATUS,0 		//042C 	1C03
		LJUMP 	43EH 			//042D 	3C3E

		//;smartkey.C: 96: RegStatus.bits.b3 = 0;
		BCR 	72H,3 			//042E 	11F2

		//;smartkey.C: 98: if ((cntCyc > 15) && (cntCyc < 50)) {
		LDWI 	10H 			//042F 	2A10
		SUBWR 	73H,0 			//0430 	0C73
		LDWI 	32H 			//0431 	2A32
		BTSS 	STATUS,0 		//0432 	1C03
		LJUMP 	43AH 			//0433 	3C3A
		ORG		0434H
		SUBWR 	73H,0 			//0434 	0C73
		BTSC 	STATUS,0 		//0435 	1403
		LJUMP 	439H 			//0436 	3C39

		//;smartkey.C: 99: RegStatus.bits.b2 =1;
		BSR 	72H,2 			//0437 	1972

		//;smartkey.C: 100: } else if (cntCyc >= 50) {
		LJUMP 	43DH 			//0438 	3C3D
		LDWI 	32H 			//0439 	2A32
		SUBWR 	73H,0 			//043A 	0C73
		BTSC 	STATUS,0 		//043B 	1403
		ORG		043CH

		//;smartkey.C: 101: RegStatus.bits.b2 =0;
		BCR 	72H,2 			//043C 	1172

		//;smartkey.C: 102: }
		//;smartkey.C: 103: RegStatus.bits.b1 = 1;
		BSR 	72H,1 			//043D 	18F2

		//;smartkey.C: 104: }
		//;smartkey.C: 105: }
		//;smartkey.C: 106: }
		//;smartkey.C: 108: timeTick++;
		INCR	70H,1 			//043E 	09F0
		BTSC 	STATUS,2 		//043F 	1503
		INCR	71H,1 			//0440 	09F1

		//;smartkey.C: 110: if ((mtState == 4) || (mtState == 3)) {
		LDR 	74H,0 			//0441 	0874
		XORWI 	4H 			//0442 	2604
		BTSC 	STATUS,2 		//0443 	1503
		ORG		0444H
		LJUMP 	449H 			//0444 	3C49
		LDR 	74H,0 			//0445 	0874
		XORWI 	3H 			//0446 	2603
		BTSS 	STATUS,2 		//0447 	1D03
		LJUMP 	46CH 			//0448 	3C6C

		//;smartkey.C: 111: if (timeTick > cntTmp) {
		LDR 	71H,0 			//0449 	0871
		SUBWR 	42H,0 			//044A 	0C42
		BTSS 	STATUS,2 		//044B 	1D03
		ORG		044CH
		LJUMP 	44FH 			//044C 	3C4F
		LDR 	70H,0 			//044D 	0870
		SUBWR 	41H,0 			//044E 	0C41
		BTSC 	STATUS,0 		//044F 	1403
		LJUMP 	46CH 			//0450 	3C6C

		//;smartkey.C: 112: cntTmp = timeTick + 38;
		LDR 	71H,0 			//0451 	0871
		STR 	42H 			//0452 	01C2
		LDR 	70H,0 			//0453 	0870
		ORG		0454H
		STR 	41H 			//0454 	01C1
		LDWI 	26H 			//0455 	2A26
		ADDWR 	41H,1 			//0456 	0BC1
		BTSC 	STATUS,0 		//0457 	1403
		INCR	42H,1 			//0458 	09C2

		//;smartkey.C: 113: if (cntTmp <= timeOut)
		LDR 	42H,0 			//0459 	0842
		SUBWR 	44H,0 			//045A 	0C44
		BTSS 	STATUS,2 		//045B 	1D03
		ORG		045CH
		LJUMP 	45FH 			//045C 	3C5F
		LDR 	41H,0 			//045D 	0841
		SUBWR 	43H,0 			//045E 	0C43

		//;smartkey.C: 114: {
		//;smartkey.C: 115: TMR2IE = 0;
		BSR 	STATUS,5 		//045F 	1A83
		BTSS 	STATUS,0 		//0460 	1C03
		LJUMP 	46DH 			//0461 	3C6D
		BCR 	CH,1 			//0462 	108C

		//;smartkey.C: 116: if (PR2L == 20)
		LDR 	11H,0 			//0463 	0811
		ORG		0464H
		XORWI 	14H 			//0464 	2614
		BTSS 	STATUS,2 		//0465 	1D03
		LJUMP 	469H 			//0466 	3C69

		//;smartkey.C: 117: PR2L = 25;
		LDWI 	19H 			//0467 	2A19
		LJUMP 	46AH 			//0468 	3C6A

		//;smartkey.C: 118: else
		//;smartkey.C: 119: PR2L = 20;
		LDWI 	14H 			//0469 	2A14
		STR 	11H 			//046A 	0191

		//;smartkey.C: 120: TMR2IE = 1;
		BSR 	CH,1 			//046B 	188C
		ORG		046CH

		//;smartkey.C: 121: }
		//;smartkey.C: 122: }
		//;smartkey.C: 123: }
		//;smartkey.C: 124: }
		//;smartkey.C: 127: if (TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//046C 	1A83
		BTSS 	CH,1 			//046D 	1C8C
		LJUMP 	475H 			//046E 	3C75
		BCR 	STATUS,5 		//046F 	1283
		BTSS 	CH,1 			//0470 	1C8C
		LJUMP 	475H 			//0471 	3C75
		LDWI 	8H 			//0472 	2A08

		//;smartkey.C: 128: {
		//;smartkey.C: 129: TMR2IF = 0;
		BCR 	CH,1 			//0473 	108C
		ORG		0474H

		//;smartkey.C: 130: RA3 = ~ RA3;
		XORWR 	5H,1 			//0474 	0485
		LDR 	78H,0 			//0475 	0878
		STR 	PCLATH 			//0476 	018A
		SWAPR 	77H,0 			//0477 	0777
		STR 	STATUS 			//0478 	0183
		SWAPR 	7EH,1 			//0479 	07FE
		SWAPR 	7EH,0 			//047A 	077E
		RETI		 			//047B 	0009
		ORG		047CH
		CLRR 	25H 			//047C 	0125
		BTSS 	21H,7 			//047D 	1FA1
		LJUMP 	486H 			//047E 	3C86
		COMR 	20H,1 			//047F 	0FA0
		COMR 	21H,1 			//0480 	0FA1
		INCR	20H,1 			//0481 	09A0
		BTSC 	STATUS,2 		//0482 	1503
		INCR	21H,1 			//0483 	09A1
		ORG		0484H
		CLRR 	25H 			//0484 	0125
		INCR	25H,1 			//0485 	09A5
		BTSS 	23H,7 			//0486 	1FA3
		LJUMP 	48FH 			//0487 	3C8F
		COMR 	22H,1 			//0488 	0FA2
		COMR 	23H,1 			//0489 	0FA3
		INCR	22H,1 			//048A 	09A2
		BTSC 	STATUS,2 		//048B 	1503
		ORG		048CH
		INCR	23H,1 			//048C 	09A3
		LDWI 	1H 			//048D 	2A01
		XORWR 	25H,1 			//048E 	04A5
		CLRR 	26H 			//048F 	0126
		CLRR 	27H 			//0490 	0127
		LDR 	21H,0 			//0491 	0821
		IORWR 	20H,0 			//0492 	0320
		BTSC 	STATUS,2 		//0493 	1503
		ORG		0494H
		LJUMP 	4B4H 			//0494 	3CB4
		CLRR 	24H 			//0495 	0124
		INCR	24H,1 			//0496 	09A4
		BTSC 	21H,7 			//0497 	17A1
		LJUMP 	49DH 			//0498 	3C9D
		BCR 	STATUS,0 		//0499 	1003
		RLR 	20H,1 			//049A 	05A0
		RLR 	21H,1 			//049B 	05A1
		ORG		049CH
		LJUMP 	496H 			//049C 	3C96
		BCR 	STATUS,0 		//049D 	1003
		RLR 	26H,1 			//049E 	05A6
		RLR 	27H,1 			//049F 	05A7
		LDR 	21H,0 			//04A0 	0821
		SUBWR 	23H,0 			//04A1 	0C23
		BTSS 	STATUS,2 		//04A2 	1D03
		LJUMP 	4A6H 			//04A3 	3CA6
		ORG		04A4H
		LDR 	20H,0 			//04A4 	0820
		SUBWR 	22H,0 			//04A5 	0C22
		BTSS 	STATUS,0 		//04A6 	1C03
		LJUMP 	4B0H 			//04A7 	3CB0
		LDR 	20H,0 			//04A8 	0820
		SUBWR 	22H,1 			//04A9 	0CA2
		LDR 	21H,0 			//04AA 	0821
		BTSS 	STATUS,0 		//04AB 	1C03
		ORG		04ACH
		DECR 	23H,1 			//04AC 	0DA3
		SUBWR 	23H,1 			//04AD 	0CA3
		BSR 	26H,0 			//04AE 	1826
		BCR 	STATUS,0 		//04AF 	1003
		RRR	21H,1 			//04B0 	06A1
		RRR	20H,1 			//04B1 	06A0
		DECRSZ 	24H,1 		//04B2 	0EA4
		LJUMP 	49DH 			//04B3 	3C9D
		ORG		04B4H
		LDR 	25H,0 			//04B4 	0825
		BTSC 	STATUS,2 		//04B5 	1503
		LJUMP 	4BCH 			//04B6 	3CBC
		COMR 	26H,1 			//04B7 	0FA6
		COMR 	27H,1 			//04B8 	0FA7
		INCR	26H,1 			//04B9 	09A6
		BTSC 	STATUS,2 		//04BA 	1503
		INCR	27H,1 			//04BB 	09A7
		ORG		04BCH
		LDR 	27H,0 			//04BC 	0827
		STR 	21H 			//04BD 	01A1
		LDR 	26H,0 			//04BE 	0826
		STR 	20H 			//04BF 	01A0
		RET		 					//04C0 	0004

		//;mpu6x.c: 28: }
		//;mpu6x.c: 29: return 0;
		STR 	21H 			//04C1 	01A1
		CLRR 	22H 			//04C2 	0122

		//;SWI2C.C: 115: RA7 = 0;
		BCR 	5H,7 			//04C3 	1385
		ORG		04C4H

		//;SWI2C.C: 116: TRISA |=0x40;;
		BSR 	STATUS,5 		//04C4 	1A83
		BSR 	5H,6 			//04C5 	1B05

		//;SWI2C.C: 117: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//04C6 	2A05
		BCR 	STATUS,5 		//04C7 	1283
		STR 	20H 			//04C8 	01A0
		DECRSZ 	20H,1 		//04C9 	0EA0
		LJUMP 	4C9H 			//04CA 	3CC9

		//;SWI2C.C: 118: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//04CB 	1283
		ORG		04CCH
		CLRR 	23H 			//04CC 	0123
		LDWI 	5H 			//04CD 	2A05

		//;SWI2C.C: 119: {
		//;SWI2C.C: 120: RA7 = 1;
		BSR 	5H,7 			//04CE 	1B85

		//;SWI2C.C: 121: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//04CF 	01A0
		DECRSZ 	20H,1 		//04D0 	0EA0
		LJUMP 	4D0H 			//04D1 	3CD0

		//;SWI2C.C: 122: dat = dat<<1 |(RA6 & 1 );
		LDWI 	0H 			//04D2 	2A00
		BCR 	STATUS,5 		//04D3 	1283
		ORG		04D4H
		BTSC 	5H,6 			//04D4 	1705
		LDWI 	1H 			//04D5 	2A01
		ANDWI 	1H 			//04D6 	2401
		STR 	20H 			//04D7 	01A0
		BCR 	STATUS,0 		//04D8 	1003
		RLR 	22H,0 			//04D9 	0522
		IORWR 	20H,0 			//04DA 	0320
		STR 	22H 			//04DB 	01A2
		ORG		04DCH
		LDWI 	5H 			//04DC 	2A05

		//;SWI2C.C: 125: RA7 = 0;
		BCR 	5H,7 			//04DD 	1385

		//;SWI2C.C: 126: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//04DE 	01A0
		DECRSZ 	20H,1 		//04DF 	0EA0
		LJUMP 	4DFH 			//04E0 	3CDF
		LDWI 	8H 			//04E1 	2A08
		BCR 	STATUS,5 		//04E2 	1283
		INCR	23H,1 			//04E3 	09A3
		ORG		04E4H
		SUBWR 	23H,0 			//04E4 	0C23
		BTSS 	STATUS,0 		//04E5 	1C03
		LJUMP 	4CDH 			//04E6 	3CCD

		//;SWI2C.C: 127: }
		//;SWI2C.C: 129: TRISA &=0xbf;;
		BSR 	STATUS,5 		//04E7 	1A83
		BCR 	5H,6 			//04E8 	1305

		//;SWI2C.C: 131: RA6 = (Ack) ? 1 : 0;
		BCR 	STATUS,5 		//04E9 	1283
		LDR 	21H,1 			//04EA 	08A1
		BCR 	STATUS,5 		//04EB 	1283
		ORG		04ECH
		BTSC 	STATUS,2 		//04EC 	1503
		LJUMP 	4F0H 			//04ED 	3CF0
		BSR 	5H,6 			//04EE 	1B05
		LJUMP 	4F1H 			//04EF 	3CF1
		BCR 	5H,6 			//04F0 	1305
		LDWI 	5H 			//04F1 	2A05

		//;SWI2C.C: 132: RA7 = 1;
		BSR 	5H,7 			//04F2 	1B85

		//;SWI2C.C: 133: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//04F3 	01A0
		ORG		04F4H
		DECRSZ 	20H,1 		//04F4 	0EA0
		LJUMP 	4F4H 			//04F5 	3CF4
		LDWI 	5H 			//04F6 	2A05

		//;SWI2C.C: 134: RA7 = 0;
		BCR 	STATUS,5 		//04F7 	1283
		BCR 	5H,7 			//04F8 	1385

		//;SWI2C.C: 135: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//04F9 	01A0
		DECRSZ 	20H,1 		//04FA 	0EA0
		LJUMP 	4FAH 			//04FB 	3CFA
		ORG		04FCH

		//;SWI2C.C: 136: return dat;
		BCR 	STATUS,5 		//04FC 	1283
		LDR 	22H,0 			//04FD 	0822
		RET		 					//04FE 	0004
		BCR 	STATUS,5 		//04FF 	1283
		STR 	21H 			//0500 	01A1

		//;SWI2C.C: 89: TRISA &=0xbf;;
		BSR 	STATUS,5 		//0501 	1A83
		BCR 	5H,6 			//0502 	1305

		//;SWI2C.C: 90: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0503 	2A05
		ORG		0504H
		BCR 	STATUS,5 		//0504 	1283
		STR 	20H 			//0505 	01A0
		DECRSZ 	20H,1 		//0506 	0EA0
		LJUMP 	506H 			//0507 	3D06

		//;SWI2C.C: 91: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//0508 	1283
		CLRR 	22H 			//0509 	0122

		//;SWI2C.C: 92: {
		//;SWI2C.C: 93: RA6 = (dat&0x80) ? 1:0;
		BTSS 	21H,7 			//050A 	1FA1
		LJUMP 	50FH 			//050B 	3D0F
		ORG		050CH
		BCR 	STATUS,5 		//050C 	1283
		BSR 	5H,6 			//050D 	1B05
		LJUMP 	511H 			//050E 	3D11
		BCR 	STATUS,5 		//050F 	1283
		BCR 	5H,6 			//0510 	1305
		LDWI 	5H 			//0511 	2A05

		//;SWI2C.C: 94: dat<<=1;
		BCR 	STATUS,0 		//0512 	1003
		RLR 	21H,1 			//0513 	05A1
		ORG		0514H

		//;SWI2C.C: 95: RA7 = 1;
		BSR 	5H,7 			//0514 	1B85

		//;SWI2C.C: 96: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0515 	01A0
		DECRSZ 	20H,1 		//0516 	0EA0
		LJUMP 	516H 			//0517 	3D16
		LDWI 	5H 			//0518 	2A05

		//;SWI2C.C: 97: RA7 = 0;
		BCR 	STATUS,5 		//0519 	1283
		BCR 	5H,7 			//051A 	1385

		//;SWI2C.C: 98: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//051B 	01A0
		ORG		051CH
		DECRSZ 	20H,1 		//051C 	0EA0
		LJUMP 	51CH 			//051D 	3D1C
		LDWI 	8H 			//051E 	2A08
		BCR 	STATUS,5 		//051F 	1283
		INCR	22H,1 			//0520 	09A2
		SUBWR 	22H,0 			//0521 	0C22
		BTSS 	STATUS,0 		//0522 	1C03
		LJUMP 	50AH 			//0523 	3D0A
		ORG		0524H

		//;SWI2C.C: 99: }
		//;SWI2C.C: 101: TRISA |=0x40;;
		BSR 	STATUS,5 		//0524 	1A83
		BSR 	5H,6 			//0525 	1B05

		//;SWI2C.C: 102: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0526 	2A05
		BCR 	STATUS,5 		//0527 	1283
		STR 	20H 			//0528 	01A0
		DECRSZ 	20H,1 		//0529 	0EA0
		LJUMP 	529H 			//052A 	3D29
		LDWI 	5H 			//052B 	2A05
		ORG		052CH

		//;SWI2C.C: 103: RA7 = 1;
		BCR 	STATUS,5 		//052C 	1283
		BSR 	5H,7 			//052D 	1B85

		//;SWI2C.C: 104: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//052E 	01A0
		DECRSZ 	20H,1 		//052F 	0EA0
		LJUMP 	52FH 			//0530 	3D2F

		//;SWI2C.C: 105: i= RA6;
		LDWI 	0H 			//0531 	2A00
		BCR 	STATUS,5 		//0532 	1283
		BTSC 	5H,6 			//0533 	1705
		ORG		0534H
		LDWI 	1H 			//0534 	2A01
		STR 	22H 			//0535 	01A2

		//;SWI2C.C: 106: RA7 = 0;
		BCR 	5H,7 			//0536 	1385

		//;SWI2C.C: 107: TRISA &=0xbf;;
		BSR 	STATUS,5 		//0537 	1A83
		BCR 	5H,6 			//0538 	1305

		//;SWI2C.C: 108: return i;
		BCR 	STATUS,5 		//0539 	1283
		LDR 	22H,0 			//053A 	0822
		RET		 					//053B 	0004
		ORG		053CH
		STR 	24H 			//053C 	01A4

		//;smartkey.C: 192: if (a > b) {
		LDR 	20H,0 			//053D 	0820
		XORWI 	80H 			//053E 	2680
		STR 	22H 			//053F 	01A2
		LDR 	24H,0 			//0540 	0824
		XORWI 	80H 			//0541 	2680
		SUBWR 	22H,1 			//0542 	0CA2
		BTSC 	STATUS,0 		//0543 	1403
		ORG		0544H
		LJUMP 	56CH 			//0544 	3D6C

		//;smartkey.C: 193: if ((a - b) <= dt) return 1;
		LDR 	20H,0 			//0545 	0820
		SUBWR 	24H,0 			//0546 	0C24
		STR 	22H 			//0547 	01A2
		CLRR 	23H 			//0548 	0123
		BTSS 	STATUS,0 		//0549 	1C03
		DECR 	23H,1 			//054A 	0DA3
		BTSC 	24H,7 			//054B 	17A4
		ORG		054CH
		DECR 	23H,1 			//054C 	0DA3
		BTSC 	20H,7 			//054D 	17A0
		INCR	23H,1 			//054E 	09A3
		BCR 	STATUS,5 		//054F 	1283
		LDR 	23H,0 			//0550 	0823
		XORWI 	80H 			//0551 	2680
		SUBWI 	80H 			//0552 	2880
		BTSS 	STATUS,2 		//0553 	1D03
		ORG		0554H
		LJUMP 	557H 			//0554 	3D57
		LDR 	22H,0 			//0555 	0822
		SUBWR 	21H,0 			//0556 	0C21
		BTSS 	STATUS,0 		//0557 	1C03
		RETW 	0H 			//0558 	2100
		RETW 	1H 			//0559 	2101

		//;smartkey.C: 197: if ((b - a) <= dt) return 1;
		SUBWR 	20H,0 			//055A 	0C20
		STR 	22H 			//055B 	01A2
		ORG		055CH
		CLRR 	23H 			//055C 	0123
		BTSS 	STATUS,0 		//055D 	1C03
		DECR 	23H,1 			//055E 	0DA3
		BTSC 	20H,7 			//055F 	17A0
		DECR 	23H,1 			//0560 	0DA3
		BTSC 	24H,7 			//0561 	17A4
		INCR	23H,1 			//0562 	09A3
		BCR 	STATUS,5 		//0563 	1283
		ORG		0564H
		LDR 	23H,0 			//0564 	0823
		XORWI 	80H 			//0565 	2680
		SUBWI 	80H 			//0566 	2880
		BTSS 	STATUS,2 		//0567 	1D03
		LJUMP 	557H 			//0568 	3D57
		LDR 	22H,0 			//0569 	0822
		SUBWR 	21H,0 			//056A 	0C21
		LJUMP 	557H 			//056B 	3D57
		ORG		056CH

		//;smartkey.C: 194: else return 0;
		//;smartkey.C: 196: else if (a < b) {
		LDR 	24H,0 			//056C 	0824
		XORWI 	80H 			//056D 	2680
		STR 	22H 			//056E 	01A2
		LDR 	20H,0 			//056F 	0820
		XORWI 	80H 			//0570 	2680
		SUBWR 	22H,1 			//0571 	0CA2

		//;smartkey.C: 200: else if (a == b) {
		LDR 	24H,0 			//0572 	0824
		BTSS 	STATUS,0 		//0573 	1C03
		ORG		0574H
		LJUMP 	55AH 			//0574 	3D5A
		XORWR 	20H,0 			//0575 	0420
		BTSC 	STATUS,2 		//0576 	1503
		RETW 	1H 			//0577 	2101
		RETW 	0H 			//0578 	2100
		STR 	28H 			//0579 	01A8

		//;mpu6x.c: 35: unsigned char i;
		//;mpu6x.c: 37: swI2C_Start();
		LCALL 	66AH 			//057A 	366A

		//;mpu6x.c: 38: if(swI2C_WriteByte(0x18<<1)== 0 )
		LDWI 	30H 			//057B 	2A30
		ORG		057CH
		LCALL 	4FFH 			//057C 	34FF
		IORWI 	0H 			//057D 	2500
		BTSS 	STATUS,2 		//057E 	1D03
		RETW 	1H 			//057F 	2101

		//;mpu6x.c: 39: {
		//;mpu6x.c: 40: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	28H,0 			//0580 	0828
		LCALL 	4FFH 			//0581 	34FF
		IORWI 	0H 			//0582 	2500
		BTSS 	STATUS,2 		//0583 	1D03
		ORG		0584H
		RETW 	2H 			//0584 	2102

		//;mpu6x.c: 41: {
		//;mpu6x.c: 42: swI2C_Start();
		LCALL 	66AH 			//0585 	366A

		//;mpu6x.c: 43: if(swI2C_WriteByte((0x18<<1)|1)== 0 ){
		LDWI 	31H 			//0586 	2A31
		LCALL 	4FFH 			//0587 	34FF
		IORWI 	0H 			//0588 	2500
		BTSS 	STATUS,2 		//0589 	1D03
		RETW 	1H 			//058A 	2101

		//;mpu6x.c: 45: for(i=0; i<(len-1);i++){
		CLRR 	29H 			//058B 	0129
		ORG		058CH
		LDR 	25H,0 			//058C 	0825
		ADDWI 	FFH 			//058D 	27FF
		STR 	26H 			//058E 	01A6
		LDWI 	FFH 			//058F 	2AFF
		BTSC 	STATUS,0 		//0590 	1403
		LDWI 	0H 			//0591 	2A00
		STR 	27H 			//0592 	01A7
		XORWI 	80H 			//0593 	2680
		ORG		0594H
		SUBWI 	80H 			//0594 	2880
		BTSS 	STATUS,2 		//0595 	1D03
		LJUMP 	599H 			//0596 	3D99
		LDR 	26H,0 			//0597 	0826
		SUBWR 	29H,0 			//0598 	0C29

		//;mpu6x.c: 46: dat[i]=swI2C_ReadByte(0);
		BCR 	STATUS,5 		//0599 	1283
		LDR 	29H,0 			//059A 	0829
		BTSC 	STATUS,0 		//059B 	1403
		ORG		059CH
		LJUMP 	5A6H 			//059C 	3DA6
		ADDWR 	24H,0 			//059D 	0B24
		STR 	26H 			//059E 	01A6
		STR 	FSR 			//059F 	0184
		LDWI 	0H 			//05A0 	2A00
		LCALL 	4C1H 			//05A1 	34C1
		BCR 	STATUS,7 		//05A2 	1383
		STR 	INDF 			//05A3 	0180
		ORG		05A4H
		INCR	29H,1 			//05A4 	09A9
		LJUMP 	58CH 			//05A5 	3D8C

		//;mpu6x.c: 47: }
		//;mpu6x.c: 48: dat[i]=swI2C_ReadByte(1);
		ADDWR 	24H,0 			//05A6 	0B24
		STR 	26H 			//05A7 	01A6
		LDR 	26H,0 			//05A8 	0826
		STR 	FSR 			//05A9 	0184
		LDWI 	1H 			//05AA 	2A01
		LCALL 	4C1H 			//05AB 	34C1
		ORG		05ACH
		BCR 	STATUS,7 		//05AC 	1383
		STR 	INDF 			//05AD 	0180

		//;mpu6x.c: 49: swI2C_Stop();
		LCALL 	6ADH 			//05AE 	36AD

		//;mpu6x.c: 50: return 0;
		RETW 	0H 			//05AF 	2100

		//;mpu6x.c: 56: else
		//;mpu6x.c: 57: return 2;
		//;mpu6x.c: 53: else
		//;mpu6x.c: 54: return 1;
		STR 	26H 			//05B0 	01A6

		//;mpu6x.c: 5: unsigned char i;
		//;mpu6x.c: 7: for(i=0; i<len;i++){
		CLRR 	27H 			//05B1 	0127
		LDR 	24H,0 			//05B2 	0824
		SUBWR 	27H,0 			//05B3 	0C27
		ORG		05B4H
		BTSC 	STATUS,0 		//05B4 	1403
		RETW 	0H 			//05B5 	2100

		//;mpu6x.c: 8: swI2C_Start();
		LCALL 	66AH 			//05B6 	366A

		//;mpu6x.c: 10: if(swI2C_WriteByte(0x18<<1)== 0 )
		LDWI 	30H 			//05B7 	2A30
		LCALL 	4FFH 			//05B8 	34FF
		IORWI 	0H 			//05B9 	2500
		BTSS 	STATUS,2 		//05BA 	1D03
		RETW 	1H 			//05BB 	2101
		ORG		05BCH

		//;mpu6x.c: 11: {
		//;mpu6x.c: 12: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	26H,0 			//05BC 	0826
		LCALL 	4FFH 			//05BD 	34FF
		IORWI 	0H 			//05BE 	2500
		BTSS 	STATUS,2 		//05BF 	1D03
		RETW 	2H 			//05C0 	2102

		//;mpu6x.c: 13: {
		//;mpu6x.c: 15: {
		//;mpu6x.c: 16: if(swI2C_WriteByte(dat[i])==1 ){
		LDR 	27H,0 			//05C1 	0827
		ADDWR 	23H,0 			//05C2 	0B23
		STR 	25H 			//05C3 	01A5
		ORG		05C4H
		STR 	FSR 			//05C4 	0184
		BCR 	STATUS,7 		//05C5 	1383
		LDR 	INDF,0 			//05C6 	0800
		LCALL 	4FFH 			//05C7 	34FF
		XORWI 	1H 			//05C8 	2601
		BTSS 	STATUS,2 		//05C9 	1D03
		LJUMP 	5CDH 			//05CA 	3DCD

		//;mpu6x.c: 17: swI2C_Stop();
		LCALL 	6ADH 			//05CB 	36AD
		ORG		05CCH

		//;mpu6x.c: 18: return 3;
		RETW 	3H 			//05CC 	2103

		//;mpu6x.c: 19: }
		//;mpu6x.c: 20: }
		//;mpu6x.c: 21: swI2C_Stop();
		LCALL 	6ADH 			//05CD 	36AD

		//;mpu6x.c: 26: else
		//;mpu6x.c: 27: return 1;
		//;mpu6x.c: 23: else
		//;mpu6x.c: 24: return 2;
		//;mpu6x.c: 22: }
		BCR 	STATUS,5 		//05CE 	1283
		INCR	27H,1 			//05CF 	09A7
		LJUMP 	5B2H 			//05D0 	3DB2

		//;SWI2C.C: 10: TRISA &=0xbf;;
		BSR 	STATUS,5 		//05D1 	1A83
		BCR 	5H,6 			//05D2 	1305

		//;SWI2C.C: 11: TRISA &=0x7f;;
		BCR 	5H,7 			//05D3 	1385
		ORG		05D4H

		//;SWI2C.C: 12: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05D4 	2A05
		BCR 	STATUS,5 		//05D5 	1283
		STR 	20H 			//05D6 	01A0
		DECRSZ 	20H,1 		//05D7 	0EA0
		LJUMP 	5D7H 			//05D8 	3DD7
		LDWI 	5H 			//05D9 	2A05

		//;SWI2C.C: 13: RA7 = 1;
		BCR 	STATUS,5 		//05DA 	1283
		BSR 	5H,7 			//05DB 	1B85
		ORG		05DCH
		BSR 	5H,6 			//05DC 	1B05

		//;SWI2C.C: 15: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05DD 	01A0
		DECRSZ 	20H,1 		//05DE 	0EA0
		LJUMP 	5DEH 			//05DF 	3DDE

		//;SWI2C.C: 16: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05E0 	2A05
		BCR 	STATUS,5 		//05E1 	1283
		STR 	20H 			//05E2 	01A0
		DECRSZ 	20H,1 		//05E3 	0EA0
		ORG		05E4H
		LJUMP 	5E3H 			//05E4 	3DE3

		//;SWI2C.C: 17: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05E5 	2A05
		BCR 	STATUS,5 		//05E6 	1283
		STR 	20H 			//05E7 	01A0
		DECRSZ 	20H,1 		//05E8 	0EA0
		LJUMP 	5E8H 			//05E9 	3DE8

		//;SWI2C.C: 18: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05EA 	2A05
		BCR 	STATUS,5 		//05EB 	1283
		ORG		05ECH
		STR 	20H 			//05EC 	01A0
		DECRSZ 	20H,1 		//05ED 	0EA0
		LJUMP 	5EDH 			//05EE 	3DED
		RET		 					//05EF 	0004

		//;sysinit.c: 88: INTCON = 0B00000000;
		CLRR 	INTCON 			//05F0 	010B

		//;sysinit.c: 89: PIE1 = 0B00000000;
		BSR 	STATUS,5 		//05F1 	1A83
		CLRR 	CH 			//05F2 	010C

		//;sysinit.c: 90: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//05F3 	1283
		ORG		05F4H
		CLRR 	CH 			//05F4 	010C

		//;sysinit.c: 92: IOCA5 = 1;
		BSR 	STATUS,5 		//05F5 	1A83
		BSR 	16H,5 			//05F6 	1A96

		//;sysinit.c: 93: tmp = PORTA;
		BCR 	STATUS,5 		//05F7 	1283
		LDR 	5H,0 			//05F8 	0805

		//;sysinit.c: 94: PAIF = 0;
		BCR 	INTCON,0 		//05F9 	100B

		//;sysinit.c: 95: PAIE = 0;
		BCR 	INTCON,3 		//05FA 	118B

		//;sysinit.c: 98: INTEDG = 0;
		BSR 	STATUS,5 		//05FB 	1A83
		ORG		05FCH
		BCR 	1H,6 			//05FC 	1301

		//;sysinit.c: 99: INTF = 0;
		BCR 	INTCON,1 		//05FD 	108B

		//;sysinit.c: 100: INTE = 1;
		BSR 	INTCON,4 		//05FE 	1A0B

		//;sysinit.c: 102: TMR2IF = 0;
		BCR 	STATUS,5 		//05FF 	1283
		BCR 	CH,1 			//0600 	108C

		//;sysinit.c: 103: TMR2IE = 1;
		BSR 	STATUS,5 		//0601 	1A83
		BSR 	CH,1 			//0602 	188C

		//;sysinit.c: 104: TMR2ON = 0;
		BCR 	STATUS,5 		//0603 	1283
		ORG		0604H
		BCR 	12H,2 			//0604 	1112

		//;sysinit.c: 110: T0IF = 0;
		BCR 	INTCON,2 		//0605 	110B

		//;sysinit.c: 111: T0IE = 1;
		BSR 	INTCON,5 		//0606 	1A8B

		//;sysinit.c: 112: T0ON = 1;
		BSR 	1FH,3 			//0607 	199F

		//;sysinit.c: 114: PEIE = 1;
		BSR 	INTCON,6 		//0608 	1B0B

		//;sysinit.c: 116: GIE = 1;
		BSR 	INTCON,7 		//0609 	1B8B
		RET		 					//060A 	0004
		STR 	21H 			//060B 	01A1
		ORG		060CH

		//;smartkey.C: 173: GIE = 0;
		BCR 	INTCON,7 		//060C 	138B

		//;smartkey.C: 174: while (GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//060D 	1F8B
		LJUMP 	611H 			//060E 	3E11
		CLRWDT	 			//060F 	0001
		LJUMP 	60DH 			//0610 	3E0D

		//;smartkey.C: 175: EEADR = EEAddr;
		BCR 	STATUS,5 		//0611 	1283
		LDR 	21H,0 			//0612 	0821
		BSR 	STATUS,5 		//0613 	1A83
		ORG		0614H
		STR 	1BH 			//0614 	019B

		//;smartkey.C: 176: EEDAT = EEData;
		BCR 	STATUS,5 		//0615 	1283
		LDR 	20H,0 			//0616 	0820
		BSR 	STATUS,5 		//0617 	1A83
		STR 	1AH 			//0618 	019A
		LDWI 	34H 			//0619 	2A34

		//;smartkey.C: 177: EEIF = 0;
		BCR 	STATUS,5 		//061A 	1283
		BCR 	CH,7 			//061B 	138C
		ORG		061CH

		//;smartkey.C: 178: EECON1 = 0x34;
		BSR 	STATUS,5 		//061C 	1A83
		STR 	1CH 			//061D 	019C

		//;smartkey.C: 179: WR = 1;
		BSR 	1DH,0 			//061E 	181D

		//;smartkey.C: 180: while (WR) asm("clrwdt");
		BSR 	STATUS,5 		//061F 	1A83
		BTSS 	1DH,0 			//0620 	1C1D
		LJUMP 	624H 			//0621 	3E24
		CLRWDT	 			//0622 	0001
		LJUMP 	61FH 			//0623 	3E1F
		ORG		0624H

		//;smartkey.C: 181: GIE = 1;
		BSR 	INTCON,7 		//0624 	1B8B
		RET		 					//0625 	0004
		STR 	76H 			//0626 	01F6

		//;smartkey.C: 173: GIE = 0;
		BCR 	INTCON,7 		//0627 	138B

		//;smartkey.C: 174: while (GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//0628 	1F8B
		LJUMP 	62CH 			//0629 	3E2C
		CLRWDT	 			//062A 	0001
		LJUMP 	628H 			//062B 	3E28
		ORG		062CH

		//;smartkey.C: 175: EEADR = EEAddr;
		LDR 	76H,0 			//062C 	0876
		BSR 	STATUS,5 		//062D 	1A83
		STR 	1BH 			//062E 	019B

		//;smartkey.C: 176: EEDAT = EEData;
		LDR 	75H,0 			//062F 	0875
		STR 	1AH 			//0630 	019A
		LDWI 	34H 			//0631 	2A34

		//;smartkey.C: 177: EEIF = 0;
		BCR 	STATUS,5 		//0632 	1283
		BCR 	CH,7 			//0633 	138C
		ORG		0634H

		//;smartkey.C: 178: EECON1 = 0x34;
		BSR 	STATUS,5 		//0634 	1A83
		STR 	1CH 			//0635 	019C

		//;smartkey.C: 179: WR = 1;
		BSR 	1DH,0 			//0636 	181D

		//;smartkey.C: 180: while (WR) asm("clrwdt");
		BSR 	STATUS,5 		//0637 	1A83
		BTSS 	1DH,0 			//0638 	1C1D
		LJUMP 	63CH 			//0639 	3E3C
		CLRWDT	 			//063A 	0001
		LJUMP 	637H 			//063B 	3E37
		ORG		063CH

		//;smartkey.C: 181: GIE = 1;
		BSR 	INTCON,7 		//063C 	1B8B
		RET		 					//063D 	0004
		STR 	25H 			//063E 	01A5

		//;smartkey.C: 147: {
		//;smartkey.C: 148: while (rep--) {
		DECR 	24H,1 			//063F 	0DA4
		LDR 	24H,0 			//0640 	0824
		XORWI 	FFH 			//0641 	26FF
		BTSC 	STATUS,2 		//0642 	1503
		RET		 					//0643 	0004
		ORG		0644H
		LDWI 	CH 			//0644 	2A0C

		//;smartkey.C: 149: TMR2ON = 1;
		BSR 	12H,2 			//0645 	1912

		//;smartkey.C: 150: PR2L = 12;
		BSR 	STATUS,5 		//0646 	1A83
		STR 	11H 			//0647 	0191

		//;smartkey.C: 151: delay_x10ms(delay);
		BCR 	STATUS,5 		//0648 	1283
		LDR 	25H,0 			//0649 	0825
		STR 	20H 			//064A 	01A0
		CLRR 	21H 			//064B 	0121
		ORG		064CH
		LCALL 	67DH 			//064C 	367D
		LDWI 	14H 			//064D 	2A14

		//;smartkey.C: 153: TMR2ON = 0; RA3 = 0;
		BCR 	12H,2 			//064E 	1112
		BCR 	5H,3 			//064F 	1185

		//;smartkey.C: 154: delay_x10ms(20);
		STR 	20H 			//0650 	01A0
		CLRR 	21H 			//0651 	0121
		LCALL 	67DH 			//0652 	367D
		LJUMP 	63FH 			//0653 	3E3F
		ORG		0654H

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0654 	1283
		CLRR 	5H 			//0655 	0105

		//;sysinit.c: 35: TRISA = 0B00110111;
		LDWI 	37H 			//0656 	2A37
		BSR 	STATUS,5 		//0657 	1A83
		STR 	5H 			//0658 	0185

		//;sysinit.c: 36: WPUA = 0B11000000;
		LDWI 	C0H 			//0659 	2AC0
		STR 	15H 			//065A 	0195

		//;sysinit.c: 38: PORTC = 0B00000000;
		BCR 	STATUS,5 		//065B 	1283
		ORG		065CH
		CLRR 	7H 			//065C 	0107

		//;sysinit.c: 39: TRISC = 0B11111100;
		LDWI 	FCH 			//065D 	2AFC
		BSR 	STATUS,5 		//065E 	1A83
		STR 	7H 			//065F 	0187

		//;sysinit.c: 40: WPUC = 0B00000000;
		CLRR 	13H 			//0660 	0113

		//;sysinit.c: 42: PSRCA = 0B11111111;
		LDWI 	FFH 			//0661 	2AFF
		STR 	8H 			//0662 	0188

		//;sysinit.c: 43: PSRCC = 0B11111111;
		STR 	14H 			//0663 	0194
		ORG		0664H

		//;sysinit.c: 44: PSINKA = 0B11111111;
		STR 	17H 			//0664 	0197

		//;sysinit.c: 45: PSINKC = 0B11111111;
		STR 	1FH 			//0665 	019F

		//;sysinit.c: 47: MSCON = 0B00110000;
		LDWI 	30H 			//0666 	2A30
		BCR 	STATUS,5 		//0667 	1283
		STR 	1BH 			//0668 	019B
		RET		 					//0669 	0004
		LDWI 	5H 			//066A 	2A05

		//;SWI2C.C: 24: RA7 = 1;
		BSR 	5H,7 			//066B 	1B85
		ORG		066CH

		//;SWI2C.C: 26: RA6 = 1;
		BSR 	5H,6 			//066C 	1B05

		//;SWI2C.C: 27: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//066D 	01A0
		DECRSZ 	20H,1 		//066E 	0EA0
		LJUMP 	66EH 			//066F 	3E6E
		LDWI 	5H 			//0670 	2A05

		//;SWI2C.C: 28: RA6 = 0;
		BCR 	STATUS,5 		//0671 	1283
		BCR 	5H,6 			//0672 	1305

		//;SWI2C.C: 29: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0673 	01A0
		ORG		0674H
		DECRSZ 	20H,1 		//0674 	0EA0
		LJUMP 	674H 			//0675 	3E74
		LDWI 	5H 			//0676 	2A05

		//;SWI2C.C: 30: RA7 = 0;
		BCR 	STATUS,5 		//0677 	1283
		BCR 	5H,7 			//0678 	1385

		//;SWI2C.C: 31: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0679 	01A0
		DECRSZ 	20H,1 		//067A 	0EA0
		LJUMP 	67AH 			//067B 	3E7A
		ORG		067CH
		RET		 					//067C 	0004

		//;smartkey.C: 135: unsigned int set = t + timeTick;
		LDR 	21H,0 			//067D 	0821
		STR 	23H 			//067E 	01A3
		LDR 	20H,0 			//067F 	0820
		STR 	22H 			//0680 	01A2
		LDR 	70H,0 			//0681 	0870
		ADDWR 	22H,1 			//0682 	0BA2
		BTSC 	STATUS,0 		//0683 	1403
		ORG		0684H
		INCR	23H,1 			//0684 	09A3
		LDR 	71H,0 			//0685 	0871
		ADDWR 	23H,1 			//0686 	0BA3

		//;smartkey.C: 136: while (timeTick < set);
		LDR 	23H,0 			//0687 	0823
		SUBWR 	71H,0 			//0688 	0C71
		BTSS 	STATUS,2 		//0689 	1D03
		LJUMP 	68DH 			//068A 	3E8D
		LDR 	22H,0 			//068B 	0822
		ORG		068CH
		SUBWR 	70H,0 			//068C 	0C70
		BTSC 	STATUS,0 		//068D 	1403
		RET		 					//068E 	0004
		LJUMP 	687H 			//068F 	3E87

		//;sysinit.c: 60: T0CON0 = 0B00000000;
		CLRR 	1FH 			//0690 	011F

		//;sysinit.c: 61: OPTION = 0B00000111;
		LDWI 	7H 			//0691 	2A07
		BSR 	STATUS,5 		//0692 	1A83
		STR 	1H 			//0693 	0181
		ORG		0694H

		//;sysinit.c: 62: TMR0 = 179;
		LDWI 	B3H 			//0694 	2AB3
		BCR 	STATUS,5 		//0695 	1283
		STR 	1H 			//0696 	0181

		//;sysinit.c: 64: TMR2H = 0;
		CLRR 	13H 			//0697 	0113

		//;sysinit.c: 65: TMR2L = 0;
		CLRR 	11H 			//0698 	0111

		//;sysinit.c: 66: PR2H = 0;
		BSR 	STATUS,5 		//0699 	1A83
		CLRR 	12H 			//069A 	0112

		//;sysinit.c: 67: PR2L =0;
		CLRR 	11H 			//069B 	0111
		ORG		069CH

		//;sysinit.c: 68: T2CON0 = 0B00101001;
		LDWI 	29H 			//069C 	2A29
		BCR 	STATUS,5 		//069D 	1283
		STR 	12H 			//069E 	0192
		RET		 					//069F 	0004
		CLRR 	70H 			//06A0 	0170
		CLRR 	71H 			//06A1 	0171
		CLRR 	72H 			//06A2 	0172
		CLRR 	73H 			//06A3 	0173
		ORG		06A4H
		CLRR 	74H 			//06A4 	0174
		CLRR 	41H 			//06A5 	0141
		CLRR 	42H 			//06A6 	0142
		CLRR 	43H 			//06A7 	0143
		CLRR 	44H 			//06A8 	0144
		CLRR 	45H 			//06A9 	0145
		CLRR 	46H 			//06AA 	0146
		CLRR 	STATUS 			//06AB 	0103
		ORG		06ACH
		LJUMP 	0BH 			//06AC 	380B
		LDWI 	5H 			//06AD 	2A05

		//;SWI2C.C: 37: RA6 = 0;
		BCR 	5H,6 			//06AE 	1305

		//;SWI2C.C: 38: RA7 = 1;
		BSR 	5H,7 			//06AF 	1B85

		//;SWI2C.C: 39: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//06B0 	01A0
		DECRSZ 	20H,1 		//06B1 	0EA0
		LJUMP 	6B1H 			//06B2 	3EB1
		LDWI 	5H 			//06B3 	2A05
		ORG		06B4H

		//;SWI2C.C: 40: RA6 = 1;
		BCR 	STATUS,5 		//06B4 	1283
		BSR 	5H,6 			//06B5 	1B05

		//;SWI2C.C: 41: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//06B6 	01A0
		DECRSZ 	20H,1 		//06B7 	0EA0
		LJUMP 	6B7H 			//06B8 	3EB7
		RET		 					//06B9 	0004
		BCR 	STATUS,5 		//06BA 	1283
		STR 	20H 			//06BB 	01A0
		ORG		06BCH

		//;smartkey.C: 163: unsigned char ReEepromData;
		//;smartkey.C: 164: EEADR = EEAddr;
		BSR 	STATUS,5 		//06BC 	1A83
		STR 	1BH 			//06BD 	019B

		//;smartkey.C: 165: RD = 1;
		BSR 	1CH,0 			//06BE 	181C

		//;smartkey.C: 166: ReEepromData = EEDAT;
		LDR 	1AH,0 			//06BF 	081A
		BCR 	STATUS,5 		//06C0 	1283
		STR 	21H 			//06C1 	01A1

		//;smartkey.C: 167: RD = 0;
		BSR 	STATUS,5 		//06C2 	1A83
		BCR 	1CH,0 			//06C3 	101C
		ORG		06C4H

		//;smartkey.C: 168: return ReEepromData;
		BCR 	STATUS,5 		//06C4 	1283
		LDR 	21H,0 			//06C5 	0821
		RET		 					//06C6 	0004
		STR 	22H 			//06C7 	01A2

		//;smartkey.C: 185: mtOldState = mtState;
		LDR 	74H,0 			//06C8 	0874
		STR 	46H 			//06C9 	01C6

		//;smartkey.C: 186: mtState = stt;
		LDR 	22H,0 			//06CA 	0822
		STR 	74H 			//06CB 	01F4
		ORG		06CCH

		//;smartkey.C: 187: timeTick = 0;
		CLRR 	70H 			//06CC 	0170
		CLRR 	71H 			//06CD 	0171

		//;smartkey.C: 188: timeOut = _tOut;
		LDR 	21H,0 			//06CE 	0821
		STR 	44H 			//06CF 	01C4
		LDR 	20H,0 			//06D0 	0820
		STR 	43H 			//06D1 	01C3
		RET		 					//06D2 	0004

		//;sysinit.c: 21: OSCCON = 0B01010001;
		LDWI 	51H 			//06D3 	2A51
		ORG		06D4H
		BSR 	STATUS,5 		//06D4 	1A83
		STR 	FH 			//06D5 	018F

		//;sysinit.c: 22: _nop();
		NOP		 					//06D6 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//06D7 	1A83
		BTSC 	FH,2 			//06D8 	150F
		RET		 					//06D9 	0004
		LJUMP 	6D7H 			//06DA 	3ED7
		STR 	75H 			//06DB 	01F5
		ORG		06DCH

		//;smartkey.C: 163: unsigned char ReEepromData;
		//;smartkey.C: 164: EEADR = EEAddr;
		BSR 	STATUS,5 		//06DC 	1A83
		STR 	1BH 			//06DD 	019B

		//;smartkey.C: 165: RD = 1;
		BSR 	1CH,0 			//06DE 	181C

		//;smartkey.C: 166: ReEepromData = EEDAT;
		LDR 	1AH,0 			//06DF 	081A
		STR 	76H 			//06E0 	01F6

		//;smartkey.C: 167: RD = 0;
		BCR 	1CH,0 			//06E1 	101C

		//;smartkey.C: 168: return ReEepromData;
		RET		 					//06E2 	0004

		//;smartkey.C: 140: TMR2ON = 0; RA3 = 0; TRISA |= 0x08;
		BCR 	STATUS,5 		//06E3 	1283
		ORG		06E4H
		BCR 	12H,2 			//06E4 	1112
		BCR 	5H,3 			//06E5 	1185
		BSR 	STATUS,5 		//06E6 	1A83
		BSR 	5H,3 			//06E7 	1985
		RET		 					//06E8 	0004
		LJUMP 	27BH 			//06E9 	3A7B
		LJUMP 	1B4H 			//06EA 	39B4
		LJUMP 	1BCH 			//06EB 	39BC
		ORG		06ECH
		LJUMP 	204H 			//06EC 	3A04
		LJUMP 	225H 			//06ED 	3A25

		//;smartkey.C: 143: TMR2ON = 1;
		BCR 	STATUS,5 		//06EE 	1283
		BSR 	12H,2 			//06EF 	1912

		//;smartkey.C: 144: TRISA &= 0xf7;
		BSR 	STATUS,5 		//06F0 	1A83
		BCR 	5H,3 			//06F1 	1185
		RET		 					//06F2 	0004
			END

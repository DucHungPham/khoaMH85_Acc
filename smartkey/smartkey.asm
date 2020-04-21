//Deviec:MS86Fxx02
//-----------------------Variable---------------------------------
		_cntCyc		EQU		73H
		_cntOff		EQU		47H
		_timeOut		EQU		45H
		_timeTick		EQU		70H
		_cntTmp		EQU		43H
		_mtState		EQU		74H
		_mtOldState		EQU		48H
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
		LJUMP 	438H 			//0009 	3C38
		LJUMP 	6F4H 			//000A 	3EF4

		//;smartkey.C: 208: unsigned char tmp8, isSw = 0, isFall = 0, lostDetect = 0;
		CLRR 	3FH 			//000B 	013F
		ORG		000CH
		CLRR 	31H 			//000C 	0131
		CLRR 	32H 			//000D 	0132

		//;smartkey.C: 209: unsigned int isWait = 0;
		CLRR 	2FH 			//000E 	012F
		CLRR 	30H 			//000F 	0130
		CLRR 	37H 			//0010 	0137
		CLRR 	38H 			//0011 	0138

		//;smartkey.C: 211: unsigned int tmp16 = 0;
		CLRR 	40H 			//0012 	0140
		CLRR 	41H 			//0013 	0141
		ORG		0014H

		//;smartkey.C: 212: signed char acYOld, acXOld;
		//;smartkey.C: 213: signed char buf[6];
		//;smartkey.C: 215: RegStatus.byte =0;
		CLRR 	72H 			//0014 	0172

		//;smartkey.C: 216: RegStatus.bits.b6 = 1;
		BSR 	72H,6 			//0015 	1B72
		CLRWDT	 			//0016 	0001

		//;smartkey.C: 220: sys_init();
		LCALL 	727H 			//0017 	3727

		//;smartkey.C: 221: gpio_init();
		LCALL 	6A8H 			//0018 	36A8

		//;smartkey.C: 222: timer_init();
		LCALL 	6E4H 			//0019 	36E4

		//;smartkey.C: 223: int_init();
		LCALL 	644H 			//001A 	3644

		//;smartkey.C: 226: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//001B 	2A82
		ORG		001CH
		STR 	2DH 			//001C 	01AD
		LDWI 	DDH 			//001D 	2ADD
		STR 	2CH 			//001E 	01AC
		DECRSZ 	2CH,1 		//001F 	0EAC
		LJUMP 	1FH 			//0020 	381F
		DECRSZ 	2DH,1 		//0021 	0EAD
		LJUMP 	1FH 			//0022 	381F
		LJUMP 	24H 			//0023 	3824
		ORG		0024H

		//;smartkey.C: 228: PAIE = 1;
		BSR 	INTCON,3 		//0024 	198B

		//;smartkey.C: 230: swI2C_Init();
		LCALL 	625H 			//0025 	3625
		LDWI 	0H 			//0026 	2A00

		//;smartkey.C: 232: setState(0, 0);
		BCR 	STATUS,5 		//0027 	1283
		CLRR 	20H 			//0028 	0120
		CLRR 	21H 			//0029 	0121
		LCALL 	71BH 			//002A 	371B

		//;smartkey.C: 234: WRITE_EEPROM(0xFF, 0xAA);
		LDWI 	AAH 			//002B 	2AAA
		ORG		002CH
		STR 	20H 			//002C 	01A0
		LDWI 	FFH 			//002D 	2AFF
		LCALL 	65FH 			//002E 	365F

		//;smartkey.C: 235: WRITE_EEPROM(0xFF, 0xAA);
		LDWI 	AAH 			//002F 	2AAA
		BCR 	STATUS,5 		//0030 	1283
		STR 	20H 			//0031 	01A0
		LDWI 	FFH 			//0032 	2AFF
		LCALL 	65FH 			//0033 	365F
		ORG		0034H

		//;smartkey.C: 237: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//0034 	2A82
		BCR 	STATUS,5 		//0035 	1283
		STR 	2DH 			//0036 	01AD
		LDWI 	DDH 			//0037 	2ADD
		STR 	2CH 			//0038 	01AC
		DECRSZ 	2CH,1 		//0039 	0EAC
		LJUMP 	39H 			//003A 	3839
		DECRSZ 	2DH,1 		//003B 	0EAD
		ORG		003CH
		LJUMP 	39H 			//003C 	3839
		LJUMP 	3EH 			//003D 	383E

		//;smartkey.C: 239: buf[0] = 0x08;
		LDWI 	8H 			//003E 	2A08
		BCR 	STATUS,5 		//003F 	1283
		STR 	39H 			//0040 	01B9

		//;smartkey.C: 240: buf[1] = 0x4d;
		LDWI 	4DH 			//0041 	2A4D
		STR 	3AH 			//0042 	01BA

		//;smartkey.C: 241: if ((AccWrite(0x10, (unsigned char)buf, 2) == 0)) {
		LDWI 	39H 			//0043 	2A39
		ORG		0044H
		STR 	2CH 			//0044 	01AC
		CLRR 	2DH 			//0045 	012D
		STR 	23H 			//0046 	01A3
		LDR 	2DH,0 			//0047 	082D
		STR 	24H 			//0048 	01A4
		LDWI 	2H 			//0049 	2A02
		STR 	25H 			//004A 	01A5
		LDWI 	10H 			//004B 	2A10
		ORG		004CH
		LCALL 	5FDH 			//004C 	35FD
		IORWI 	0H 			//004D 	2500
		BTSC 	STATUS,2 		//004E 	1503
		LJUMP 	55H 			//004F 	3855

		//;smartkey.C: 244: else {
		//;smartkey.C: 246: beep(10, 2);
		LDWI 	2H 			//0050 	2A02
		BCR 	STATUS,5 		//0051 	1283
		STR 	24H 			//0052 	01A4
		LDWI 	AH 			//0053 	2A0A
		ORG		0054H
		LCALL 	692H 			//0054 	3692

		//;smartkey.C: 247: }
		//;smartkey.C: 250: acXsum = (signed char)READ_EEPROM(0x10);
		LDWI 	10H 			//0055 	2A10
		LCALL 	70EH 			//0056 	370E
		STR 	37H 			//0057 	01B7
		CLRR 	38H 			//0058 	0138
		BTSC 	37H,7 			//0059 	17B7
		DECR 	38H,1 			//005A 	0DB8

		//;smartkey.C: 251: acYsum = (signed char)READ_EEPROM(0x11);
		LDWI 	11H 			//005B 	2A11
		ORG		005CH
		LCALL 	70EH 			//005C 	370E
		STR 	35H 			//005D 	01B5
		CLRR 	36H 			//005E 	0136
		BTSC 	35H,7 			//005F 	17B5
		DECR 	36H,1 			//0060 	0DB6

		//;smartkey.C: 253: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//0061 	2A41
		LCALL 	70EH 			//0062 	370E
		STR 	42H 			//0063 	01C2
		ORG		0064H

		//;smartkey.C: 254: if (tmp8 > 3) {WRITE_EEPROM(0x41, 0); _delay((unsigned long)((2)*(4000
		//+                          000/4000.0)));}
		LDWI 	4H 			//0064 	2A04
		SUBWR 	42H,0 			//0065 	0C42
		BTSS 	STATUS,0 		//0066 	1C03
		LJUMP 	75H 			//0067 	3875
		LDWI 	41H 			//0068 	2A41
		CLRR 	20H 			//0069 	0120
		LCALL 	65FH 			//006A 	365F
		LDWI 	3H 			//006B 	2A03
		ORG		006CH
		BCR 	STATUS,5 		//006C 	1283
		STR 	2DH 			//006D 	01AD
		LDWI 	97H 			//006E 	2A97
		STR 	2CH 			//006F 	01AC
		DECRSZ 	2CH,1 		//0070 	0EAC
		LJUMP 	70H 			//0071 	3870
		DECRSZ 	2DH,1 		//0072 	0EAD
		LJUMP 	70H 			//0073 	3870
		ORG		0074H
		LJUMP 	75H 			//0074 	3875

		//;smartkey.C: 258: tmp8 = READ_EEPROM(0x08);
		LDWI 	8H 			//0075 	2A08
		LCALL 	70EH 			//0076 	370E
		STR 	42H 			//0077 	01C2

		//;smartkey.C: 259: if (tmp8 == 0xff) {WRITE_EEPROM(0x08, 0); _delay((unsigned long)((2)*(
		//+                          4000000/4000.0)));}
		XORWI 	FFH 			//0078 	26FF
		BTSS 	STATUS,2 		//0079 	1D03
		LJUMP 	88H 			//007A 	3888
		LDWI 	8H 			//007B 	2A08
		ORG		007CH
		CLRR 	20H 			//007C 	0120
		LCALL 	65FH 			//007D 	365F
		LDWI 	3H 			//007E 	2A03
		BCR 	STATUS,5 		//007F 	1283
		STR 	2DH 			//0080 	01AD
		LDWI 	97H 			//0081 	2A97
		STR 	2CH 			//0082 	01AC
		DECRSZ 	2CH,1 		//0083 	0EAC
		ORG		0084H
		LJUMP 	83H 			//0084 	3883
		DECRSZ 	2DH,1 		//0085 	0EAD
		LJUMP 	83H 			//0086 	3883
		LJUMP 	88H 			//0087 	3888

		//;smartkey.C: 260: if (tmp8 == 0xcc) {
		BCR 	STATUS,5 		//0088 	1283
		LDR 	42H,0 			//0089 	0842
		XORWI 	CCH 			//008A 	26CC
		BTSS 	STATUS,2 		//008B 	1D03
		ORG		008CH
		LJUMP 	A3H 			//008C 	38A3
		LDWI 	8H 			//008D 	2A08

		//;smartkey.C: 261: RegStatus.bits.b0 = 0;
		BCR 	72H,0 			//008E 	1072

		//;smartkey.C: 262: setState(3, 1800);
		STR 	20H 			//008F 	01A0
		LDWI 	7H 			//0090 	2A07
		STR 	21H 			//0091 	01A1
		LDWI 	3H 			//0092 	2A03
		LCALL 	71BH 			//0093 	371B
		ORG		0094H

		//;smartkey.C: 263: mtOldState = 1;
		CLRR 	48H 			//0094 	0148
		INCR	48H,1 			//0095 	09C8

		//;smartkey.C: 264: cntTmp = timeTick + 50;
		LDR 	71H,0 			//0096 	0871
		STR 	44H 			//0097 	01C4
		LDR 	70H,0 			//0098 	0870
		STR 	43H 			//0099 	01C3
		LDWI 	32H 			//009A 	2A32
		ADDWR 	43H,1 			//009B 	0BC3
		ORG		009CH
		BTSC 	STATUS,0 		//009C 	1403
		INCR	44H,1 			//009D 	09C4

		//;smartkey.C: 265: PR2L = 12;
		LDWI 	CH 			//009E 	2A0C
		BSR 	STATUS,5 		//009F 	1A83
		STR 	11H 			//00A0 	0191

		//;smartkey.C: 266: beepOn();
		LCALL 	742H 			//00A1 	3742

		//;smartkey.C: 267: } else {
		LJUMP 	AAH 			//00A2 	38AA

		//;smartkey.C: 268: setState(2, 400);
		LDWI 	90H 			//00A3 	2A90
		ORG		00A4H
		STR 	20H 			//00A4 	01A0
		LDWI 	1H 			//00A5 	2A01
		STR 	21H 			//00A6 	01A1
		LDWI 	2H 			//00A7 	2A02
		LCALL 	71BH 			//00A8 	371B

		//;smartkey.C: 269: mtOldState = 0;
		CLRR 	48H 			//00A9 	0148

		//;smartkey.C: 270: }
		//;smartkey.C: 272: tmp8 = READ_EEPROM(0x3F);
		LDWI 	3FH 			//00AA 	2A3F
		LCALL 	70EH 			//00AB 	370E
		ORG		00ACH
		STR 	42H 			//00AC 	01C2

		//;smartkey.C: 273: if (tmp8 == 5) {
		XORWI 	5H 			//00AD 	2605
		BTSS 	STATUS,2 		//00AE 	1D03
		LJUMP 	E7H 			//00AF 	38E7
		LDWI 	3FH 			//00B0 	2A3F

		//;smartkey.C: 274: tmp8 = 0;
		CLRR 	42H 			//00B1 	0142

		//;smartkey.C: 275: WRITE_EEPROM(0x3F, 0);
		CLRR 	20H 			//00B2 	0120
		LCALL 	65FH 			//00B3 	365F
		ORG		00B4H

		//;smartkey.C: 276: while ( RA2) {
		BCR 	STATUS,5 		//00B4 	1283
		BTSS 	5H,2 			//00B5 	1D05
		LJUMP 	E5H 			//00B6 	38E5

		//;smartkey.C: 277: _delay((unsigned long)((1500)*(4000000/4000.0)));
		LDWI 	8H 			//00B7 	2A08
		STR 	2EH 			//00B8 	01AE
		LDWI 	9DH 			//00B9 	2A9D
		STR 	2DH 			//00BA 	01AD
		LDWI 	BH 			//00BB 	2A0B
		ORG		00BCH
		STR 	2CH 			//00BC 	01AC
		DECRSZ 	2CH,1 		//00BD 	0EAC
		LJUMP 	BDH 			//00BE 	38BD
		DECRSZ 	2DH,1 		//00BF 	0EAD
		LJUMP 	BDH 			//00C0 	38BD
		DECRSZ 	2EH,1 		//00C1 	0EAE
		LJUMP 	BDH 			//00C2 	38BD
		LJUMP 	C4H 			//00C3 	38C4
		ORG		00C4H
		LDWI 	15H 			//00C4 	2A15

		//;smartkey.C: 278: tmp8++;
		BCR 	STATUS,5 		//00C5 	1283
		INCR	42H,1 			//00C6 	09C2

		//;smartkey.C: 279: if (tmp8 > 20) {
		SUBWR 	42H,0 			//00C7 	0C42
		BTSS 	STATUS,0 		//00C8 	1C03
		LJUMP 	D9H 			//00C9 	38D9

		//;smartkey.C: 280: _delay((unsigned long)((10000)*(4000000/4000.0)));
		LDWI 	33H 			//00CA 	2A33
		STR 	2EH 			//00CB 	01AE
		ORG		00CCH
		LDWI 	BCH 			//00CC 	2ABC
		STR 	2DH 			//00CD 	01AD
		LDWI 	10H 			//00CE 	2A10
		STR 	2CH 			//00CF 	01AC
		DECRSZ 	2CH,1 		//00D0 	0EAC
		LJUMP 	D0H 			//00D1 	38D0
		DECRSZ 	2DH,1 		//00D2 	0EAD
		LJUMP 	D0H 			//00D3 	38D0
		ORG		00D4H
		DECRSZ 	2EH,1 		//00D4 	0EAE
		LJUMP 	D0H 			//00D5 	38D0
		LDWI 	40H 			//00D6 	2A40

		//;smartkey.C: 281: WRITE_EEPROM(0x40, 0);
		BCR 	STATUS,5 		//00D7 	1283
		LJUMP 	B2H 			//00D8 	38B2

		//;smartkey.C: 282: }
		//;smartkey.C: 283: else if ( RA2) {
		BTSS 	5H,2 			//00D9 	1D05
		LJUMP 	B4H 			//00DA 	38B4

		//;smartkey.C: 284: WRITE_EEPROM(0x40, tmp8);
		LDR 	42H,0 			//00DB 	0842
		ORG		00DCH
		STR 	20H 			//00DC 	01A0
		LDWI 	40H 			//00DD 	2A40
		LCALL 	65FH 			//00DE 	365F
		LDWI 	AH 			//00DF 	2A0A

		//;smartkey.C: 285: beep(10, 1);
		BCR 	STATUS,5 		//00E0 	1283
		CLRR 	24H 			//00E1 	0124
		INCR	24H,1 			//00E2 	09A4
		LCALL 	692H 			//00E3 	3692
		ORG		00E4H
		LJUMP 	B4H 			//00E4 	38B4
		BTSS 	5H,2 			//00E5 	1D05
		LJUMP 	E5H 			//00E6 	38E5

		//;smartkey.C: 289: }
		//;smartkey.C: 292: tmp8 = READ_EEPROM(0x40);
		LDWI 	40H 			//00E7 	2A40
		LCALL 	70EH 			//00E8 	370E
		STR 	42H 			//00E9 	01C2

		//;smartkey.C: 293: switch (tmp8) {
		LJUMP 	19FH 			//00EA 	399F
		LDWI 	3H 			//00EB 	2A03
		ORG		00ECH

		//;smartkey.C: 296: tmp8 = 0; beep(10, 3);
		CLRR 	42H 			//00EC 	0142
		STR 	24H 			//00ED 	01A4
		LDWI 	AH 			//00EE 	2A0A
		LCALL 	692H 			//00EF 	3692

		//;smartkey.C: 297: while ((tmp8 < 11)) {
		LJUMP 	11EH 			//00F0 	391E

		//;smartkey.C: 299: acXsum += buf[1];
		BCR 	STATUS,5 		//00F1 	1283
		LDR 	3AH,0 			//00F2 	083A
		STR 	2CH 			//00F3 	01AC
		ORG		00F4H
		CLRR 	2DH 			//00F4 	012D
		BTSC 	2CH,7 			//00F5 	17AC
		DECR 	2DH,1 			//00F6 	0DAD
		ADDWR 	37H,1 			//00F7 	0BB7
		BTSC 	STATUS,0 		//00F8 	1403
		INCR	38H,1 			//00F9 	09B8
		LDR 	2DH,0 			//00FA 	082D
		ADDWR 	38H,1 			//00FB 	0BB8
		ORG		00FCH

		//;smartkey.C: 300: acYsum += buf[3];
		LDR 	3CH,0 			//00FC 	083C
		STR 	2CH 			//00FD 	01AC
		CLRR 	2DH 			//00FE 	012D
		BTSC 	2CH,7 			//00FF 	17AC
		DECR 	2DH,1 			//0100 	0DAD
		ADDWR 	35H,1 			//0101 	0BB5
		BTSC 	STATUS,0 		//0102 	1403
		INCR	36H,1 			//0103 	09B6
		ORG		0104H
		LDR 	2DH,0 			//0104 	082D
		ADDWR 	36H,1 			//0105 	0BB6

		//;smartkey.C: 301: tmp16 = (signed int)tmp16 + buf[5];
		LDR 	3EH,0 			//0106 	083E
		STR 	2CH 			//0107 	01AC
		CLRR 	2DH 			//0108 	012D
		BTSC 	2CH,7 			//0109 	17AC
		DECR 	2DH,1 			//010A 	0DAD
		ADDWR 	40H,1 			//010B 	0BC0
		ORG		010CH
		BTSC 	STATUS,0 		//010C 	1403
		INCR	41H,1 			//010D 	09C1
		LDR 	2DH,0 			//010E 	082D
		ADDWR 	41H,1 			//010F 	0BC1
		LDWI 	3H 			//0110 	2A03

		//;smartkey.C: 302: tmp8++;
		INCR	42H,1 			//0111 	09C2

		//;smartkey.C: 305: _delay((unsigned long)((500)*(4000000/4000.0)));
		//;smartkey.C: 303: } else
		STR 	2EH 			//0112 	01AE
		LDWI 	8AH 			//0113 	2A8A
		ORG		0114H
		STR 	2DH 			//0114 	01AD
		LDWI 	56H 			//0115 	2A56
		STR 	2CH 			//0116 	01AC
		DECRSZ 	2CH,1 		//0117 	0EAC
		LJUMP 	117H 			//0118 	3917
		DECRSZ 	2DH,1 		//0119 	0EAD
		LJUMP 	117H 			//011A 	3917
		DECRSZ 	2EH,1 		//011B 	0EAE
		ORG		011CH
		LJUMP 	117H 			//011C 	3917
		LJUMP 	11EH 			//011D 	391E
		LDWI 	BH 			//011E 	2A0B
		BCR 	STATUS,5 		//011F 	1283
		SUBWR 	42H,0 			//0120 	0C42
		BTSC 	STATUS,0 		//0121 	1403
		LJUMP 	130H 			//0122 	3930

		//;smartkey.C: 298: if (AccRead(0x02, (unsigned char)buf, 6) == 0) {
		LDWI 	39H 			//0123 	2A39
		ORG		0124H
		STR 	2CH 			//0124 	01AC
		CLRR 	2DH 			//0125 	012D
		STR 	24H 			//0126 	01A4
		LDR 	2DH,0 			//0127 	082D
		STR 	25H 			//0128 	01A5
		LDWI 	6H 			//0129 	2A06
		STR 	26H 			//012A 	01A6
		LDWI 	2H 			//012B 	2A02
		ORG		012CH
		LCALL 	5C2H 			//012C 	35C2
		IORWI 	0H 			//012D 	2500
		BTSC 	STATUS,2 		//012E 	1503
		LJUMP 	F1H 			//012F 	38F1

		//;smartkey.C: 306: }
		//;smartkey.C: 308: if (tmp8 == 11) {
		BCR 	STATUS,5 		//0130 	1283
		LDR 	42H,0 			//0131 	0842
		XORWI 	BH 			//0132 	260B
		BTSS 	STATUS,2 		//0133 	1D03
		ORG		0134H
		LJUMP 	176H 			//0134 	3976

		//;smartkey.C: 309: acXsum = acXsum / 10;
		LDWI 	AH 			//0135 	2A0A
		STR 	20H 			//0136 	01A0
		CLRR 	21H 			//0137 	0121
		LDR 	38H,0 			//0138 	0838
		STR 	23H 			//0139 	01A3
		LDR 	37H,0 			//013A 	0837
		STR 	22H 			//013B 	01A2
		ORG		013CH
		LCALL 	4BCH 			//013C 	34BC
		LDR 	21H,0 			//013D 	0821
		STR 	38H 			//013E 	01B8
		LDR 	20H,0 			//013F 	0820
		STR 	37H 			//0140 	01B7

		//;smartkey.C: 310: acYsum = acYsum / 10;
		LDWI 	AH 			//0141 	2A0A
		STR 	20H 			//0142 	01A0
		CLRR 	21H 			//0143 	0121
		ORG		0144H
		LDR 	36H,0 			//0144 	0836
		STR 	23H 			//0145 	01A3
		LDR 	35H,0 			//0146 	0835
		STR 	22H 			//0147 	01A2
		LCALL 	4BCH 			//0148 	34BC
		LDR 	21H,0 			//0149 	0821
		STR 	36H 			//014A 	01B6
		LDR 	20H,0 			//014B 	0820
		ORG		014CH
		STR 	35H 			//014C 	01B5

		//;smartkey.C: 311: tmp16 = (signed int)tmp16 / 10;
		LDWI 	AH 			//014D 	2A0A
		STR 	20H 			//014E 	01A0
		CLRR 	21H 			//014F 	0121
		LDR 	41H,0 			//0150 	0841
		STR 	23H 			//0151 	01A3
		LDR 	40H,0 			//0152 	0840
		STR 	22H 			//0153 	01A2
		ORG		0154H
		LCALL 	4BCH 			//0154 	34BC
		LDR 	21H,0 			//0155 	0821
		STR 	41H 			//0156 	01C1
		LDR 	20H,0 			//0157 	0820
		STR 	40H 			//0158 	01C0

		//;smartkey.C: 313: if (((signed char)tmp16 > (-31)) && ((signed char)tmp16 < 31)) {
		XORWI 	80H 			//0159 	2680
		ADDWI 	9EH 			//015A 	279E
		BTSS 	STATUS,0 		//015B 	1C03
		ORG		015CH
		LJUMP 	167H 			//015C 	3967
		LDR 	40H,0 			//015D 	0840
		XORWI 	80H 			//015E 	2680
		ADDWI 	61H 			//015F 	2761
		BTSC 	STATUS,0 		//0160 	1403
		LJUMP 	167H 			//0161 	3967

		//;smartkey.C: 314: beep(10, 4);
		LDWI 	4H 			//0162 	2A04
		STR 	24H 			//0163 	01A4
		ORG		0164H
		LDWI 	AH 			//0164 	2A0A
		LCALL 	692H 			//0165 	3692

		//;smartkey.C: 315: } else {
		LJUMP 	1AAH 			//0166 	39AA

		//;smartkey.C: 317: WRITE_EEPROM(0x10, (unsigned char)acXsum);
		LDR 	37H,0 			//0167 	0837
		STR 	20H 			//0168 	01A0
		LDWI 	10H 			//0169 	2A10
		LCALL 	65FH 			//016A 	365F

		//;smartkey.C: 318: WRITE_EEPROM(0x11, (unsigned char)acYsum);
		BCR 	STATUS,5 		//016B 	1283
		ORG		016CH
		LDR 	35H,0 			//016C 	0835
		STR 	20H 			//016D 	01A0
		LDWI 	11H 			//016E 	2A11
		LCALL 	65FH 			//016F 	365F

		//;smartkey.C: 319: beep(10, 3);
		LDWI 	3H 			//0170 	2A03
		BCR 	STATUS,5 		//0171 	1283
		STR 	24H 			//0172 	01A4
		LDWI 	AH 			//0173 	2A0A
		ORG		0174H
		LCALL 	692H 			//0174 	3692
		LJUMP 	1AAH 			//0175 	39AA

		//;smartkey.C: 322: beep(10, 2);
		LDWI 	2H 			//0176 	2A02
		STR 	24H 			//0177 	01A4
		LDWI 	AH 			//0178 	2A0A
		LCALL 	692H 			//0179 	3692
		LJUMP 	1AAH 			//017A 	39AA

		//;smartkey.C: 329: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//017B 	2A41
		ORG		017CH
		LCALL 	70EH 			//017C 	370E
		STR 	42H 			//017D 	01C2

		//;smartkey.C: 330: if (tmp8 & 2) {
		BTSS 	42H,1 			//017E 	1CC2
		LJUMP 	182H 			//017F 	3982

		//;smartkey.C: 331: tmp8 &= ~2;
		BCR 	42H,1 			//0180 	10C2

		//;smartkey.C: 332: }
		LJUMP 	183H 			//0181 	3983

		//;smartkey.C: 333: else {
		//;smartkey.C: 334: tmp8 |= 2;
		BSR 	42H,1 			//0182 	18C2

		//;smartkey.C: 335: }
		//;smartkey.C: 336: WRITE_EEPROM(0x41, tmp8);
		LDR 	42H,0 			//0183 	0842
		ORG		0184H
		STR 	20H 			//0184 	01A0
		LDWI 	41H 			//0185 	2A41
		LCALL 	65FH 			//0186 	365F
		LDWI 	32H 			//0187 	2A32

		//;smartkey.C: 337: beep(50, 1);
		BCR 	STATUS,5 		//0188 	1283
		CLRR 	24H 			//0189 	0124
		INCR	24H,1 			//018A 	09A4
		LCALL 	692H 			//018B 	3692
		ORG		018CH

		//;smartkey.C: 338: break;
		LJUMP 	1AAH 			//018C 	39AA

		//;smartkey.C: 342: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//018D 	2A41
		LCALL 	70EH 			//018E 	370E
		STR 	42H 			//018F 	01C2

		//;smartkey.C: 343: if (tmp8 & 1) {
		BTSS 	42H,0 			//0190 	1C42
		LJUMP 	194H 			//0191 	3994

		//;smartkey.C: 344: tmp8 &= ~1;
		BCR 	42H,0 			//0192 	1042

		//;smartkey.C: 345: }
		LJUMP 	195H 			//0193 	3995
		ORG		0194H

		//;smartkey.C: 346: else {
		//;smartkey.C: 347: tmp8 |= 1;
		BSR 	42H,0 			//0194 	1842

		//;smartkey.C: 348: }
		//;smartkey.C: 349: WRITE_EEPROM(0x41, tmp8);
		LDR 	42H,0 			//0195 	0842
		STR 	20H 			//0196 	01A0
		LDWI 	41H 			//0197 	2A41
		LCALL 	65FH 			//0198 	365F

		//;smartkey.C: 350: beep(10, 2);
		LDWI 	2H 			//0199 	2A02
		BCR 	STATUS,5 		//019A 	1283
		STR 	24H 			//019B 	01A4
		ORG		019CH
		LDWI 	AH 			//019C 	2A0A
		LCALL 	692H 			//019D 	3692

		//;smartkey.C: 351: break;
		LJUMP 	1AAH 			//019E 	39AA
		LDR 	42H,0 			//019F 	0842
		XORWI 	3H 			//01A0 	2603
		BTSC 	STATUS,2 		//01A1 	1503
		LJUMP 	EBH 			//01A2 	38EB
		XORWI 	9H 			//01A3 	2609
		ORG		01A4H
		BTSC 	STATUS,2 		//01A4 	1503
		LJUMP 	18DH 			//01A5 	398D
		XORWI 	1EH 			//01A6 	261E
		BTSC 	STATUS,2 		//01A7 	1503
		LJUMP 	17BH 			//01A8 	397B
		LJUMP 	1AAH 			//01A9 	39AA

		//;smartkey.C: 355: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//01AA 	2A41
		LCALL 	70EH 			//01AB 	370E
		ORG		01ACH
		STR 	42H 			//01AC 	01C2

		//;smartkey.C: 356: if (tmp8 >0 && tmp8<4 ) {
		LDR 	42H,0 			//01AD 	0842
		BTSC 	STATUS,2 		//01AE 	1503
		LJUMP 	1CEH 			//01AF 	39CE
		LDWI 	4H 			//01B0 	2A04
		SUBWR 	42H,0 			//01B1 	0C42
		BTSC 	STATUS,0 		//01B2 	1403
		LJUMP 	1CEH 			//01B3 	39CE
		ORG		01B4H
		LDWI 	ACH 			//01B4 	2AAC

		//;smartkey.C: 357: RegStatus.bits.b0 = 1;
		BSR 	72H,0 			//01B5 	1872

		//;smartkey.C: 358: setState(1, 3500);
		STR 	20H 			//01B6 	01A0
		LDWI 	DH 			//01B7 	2A0D
		STR 	21H 			//01B8 	01A1
		LDWI 	1H 			//01B9 	2A01
		LCALL 	71BH 			//01BA 	371B

		//;smartkey.C: 359: RegStatus.bits.b4 = 1;
		BSR 	72H,4 			//01BB 	1A72
		ORG		01BCH

		//;smartkey.C: 361: if (tmp8 & 2) {
		BTSS 	42H,1 			//01BC 	1CC2
		LJUMP 	1C0H 			//01BD 	39C0

		//;smartkey.C: 362: RegStatus.bits.b6 = 0;
		BCR 	72H,6 			//01BE 	1372

		//;smartkey.C: 363: }
		LJUMP 	1CEH 			//01BF 	39CE

		//;smartkey.C: 364: else if (tmp8 & 1) {
		BTSS 	42H,0 			//01C0 	1C42
		LJUMP 	1CEH 			//01C1 	39CE

		//;smartkey.C: 365: tmp16 = timeTick + 40;
		LDR 	71H,0 			//01C2 	0871
		STR 	41H 			//01C3 	01C1
		ORG		01C4H
		LDR 	70H,0 			//01C4 	0870
		STR 	40H 			//01C5 	01C0
		LDWI 	28H 			//01C6 	2A28
		ADDWR 	40H,1 			//01C7 	0BC0
		BTSC 	STATUS,0 		//01C8 	1403
		INCR	41H,1 			//01C9 	09C1
		LDWI 	AH 			//01CA 	2A0A

		//;smartkey.C: 366: beep(10, 1);
		CLRR 	24H 			//01CB 	0124
		ORG		01CCH
		INCR	24H,1 			//01CC 	09A4
		LCALL 	692H 			//01CD 	3692

		//;smartkey.C: 367: }
		//;smartkey.C: 368: }
		//;smartkey.C: 370: timeTick = 0;
		CLRR 	70H 			//01CE 	0170
		CLRR 	71H 			//01CF 	0171

		//;smartkey.C: 376: if ( RegStatus.bits.b4 == 0) {
		BTSS 	72H,4 			//01D0 	1E72

		//;smartkey.C: 377: if (RegStatus.bits.b3 == 0) {
		BTSC 	72H,3 			//01D1 	15F2
		LJUMP 	2A8H 			//01D2 	3AA8

		//;smartkey.C: 378: if (RegStatus.bits.b1) {
		BTSS 	72H,1 			//01D3 	1CF2
		ORG		01D4H
		LJUMP 	2A8H 			//01D4 	3AA8

		//;smartkey.C: 380: PAIE = 0;
		BCR 	INTCON,3 		//01D5 	118B

		//;smartkey.C: 382: RegStatus.bits.b1 = 0;
		BCR 	72H,1 			//01D6 	10F2

		//;smartkey.C: 386: if (RegStatus.bits.b2) {
		BTSC 	72H,2 			//01D7 	1572
		LJUMP 	254H 			//01D8 	3A54
		LJUMP 	29FH 			//01D9 	3A9F

		//;smartkey.C: 390: lostDetect = 0;
		BCR 	STATUS,5 		//01DA 	1283
		CLRR 	32H 			//01DB 	0132
		ORG		01DCH
		LDWI 	28H 			//01DC 	2A28

		//;smartkey.C: 391: timeTick = 0;
		CLRR 	70H 			//01DD 	0170
		CLRR 	71H 			//01DE 	0171

		//;smartkey.C: 392: tmp16 = 40;
		STR 	40H 			//01DF 	01C0
		CLRR 	41H 			//01E0 	0141

		//;smartkey.C: 393: break;
		LJUMP 	2A7H 			//01E1 	3AA7

		//;smartkey.C: 396: if (timeTick > 30) {
		LDWI 	0H 			//01E2 	2A00
		SUBWR 	71H,0 			//01E3 	0C71
		ORG		01E4H
		LDWI 	1FH 			//01E4 	2A1F
		BTSC 	STATUS,2 		//01E5 	1503
		SUBWR 	70H,0 			//01E6 	0C70
		BTSS 	STATUS,0 		//01E7 	1C03
		LJUMP 	2A7H 			//01E8 	3AA7
		LDWI 	8H 			//01E9 	2A08

		//;smartkey.C: 397: timeTick = 0;
		CLRR 	70H 			//01EA 	0170
		CLRR 	71H 			//01EB 	0171
		ORG		01ECH

		//;smartkey.C: 399: if (READ_EEPROM(0x08) == 0xcc) WRITE_EEPROM(0x08, 0);
		LCALL 	70EH 			//01EC 	370E
		XORWI 	CCH 			//01ED 	26CC
		BTSS 	STATUS,2 		//01EE 	1D03
		LJUMP 	1F3H 			//01EF 	39F3
		LDWI 	8H 			//01F0 	2A08
		CLRR 	20H 			//01F1 	0120
		LCALL 	65FH 			//01F2 	365F

		//;smartkey.C: 401: if ((mtOldState == 3)) {
		BCR 	STATUS,5 		//01F3 	1283
		ORG		01F4H
		LDR 	48H,0 			//01F4 	0848
		XORWI 	3H 			//01F5 	2603
		BTSS 	STATUS,2 		//01F6 	1D03
		LJUMP 	203H 			//01F7 	3A03

		//;smartkey.C: 402: beepOn(); TMR2ON = 0; beep(10, 1);
		LCALL 	742H 			//01F8 	3742
		LDWI 	AH 			//01F9 	2A0A
		BCR 	STATUS,5 		//01FA 	1283
		BCR 	12H,2 			//01FB 	1112
		ORG		01FCH
		CLRR 	24H 			//01FC 	0124
		INCR	24H,1 			//01FD 	09A4
		LCALL 	692H 			//01FE 	3692

		//;smartkey.C: 403: if (RegStatus.bits.b7)RegStatus.bits.b7 = 0;
		BTSS 	72H,7 			//01FF 	1FF2
		LJUMP 	2A7H 			//0200 	3AA7
		BCR 	72H,7 			//0201 	13F2
		LJUMP 	2A7H 			//0202 	3AA7

		//;smartkey.C: 405: else if ((mtOldState == 0) || (mtOldState == 4)) {
		LDR 	48H,0 			//0203 	0848
		ORG		0204H
		BTSC 	STATUS,2 		//0204 	1503
		LJUMP 	20AH 			//0205 	3A0A
		LDR 	48H,0 			//0206 	0848
		XORWI 	4H 			//0207 	2604
		BTSS 	STATUS,2 		//0208 	1D03
		LJUMP 	227H 			//0209 	3A27
		LDWI 	ACH 			//020A 	2AAC

		//;smartkey.C: 406: RegStatus.bits.b0 = 1;
		BSR 	72H,0 			//020B 	1872
		ORG		020CH

		//;smartkey.C: 407: setState(1, 3500);
		STR 	20H 			//020C 	01A0
		LDWI 	DH 			//020D 	2A0D
		STR 	21H 			//020E 	01A1
		LDWI 	1H 			//020F 	2A01
		LCALL 	71BH 			//0210 	371B

		//;smartkey.C: 408: if (READ_EEPROM(0x40))WRITE_EEPROM(0x40, 0);
		LDWI 	40H 			//0211 	2A40
		LCALL 	70EH 			//0212 	370E
		XORWI 	0H 			//0213 	2600
		ORG		0214H
		BTSC 	STATUS,2 		//0214 	1503
		LJUMP 	219H 			//0215 	3A19
		LDWI 	40H 			//0216 	2A40
		CLRR 	20H 			//0217 	0120
		LCALL 	65FH 			//0218 	365F

		//;smartkey.C: 409: tmp16 = timeTick + 40;
		LDR 	71H,0 			//0219 	0871
		BCR 	STATUS,5 		//021A 	1283
		STR 	41H 			//021B 	01C1
		ORG		021CH
		LDR 	70H,0 			//021C 	0870
		STR 	40H 			//021D 	01C0
		LDWI 	28H 			//021E 	2A28
		ADDWR 	40H,1 			//021F 	0BC0
		BTSC 	STATUS,0 		//0220 	1403
		INCR	41H,1 			//0221 	09C1
		LDWI 	AH 			//0222 	2A0A

		//;smartkey.C: 410: beep(10, 1);
		CLRR 	24H 			//0223 	0124
		ORG		0224H
		INCR	24H,1 			//0224 	09A4
		LCALL 	692H 			//0225 	3692

		//;smartkey.C: 411: }
		LJUMP 	2A7H 			//0226 	3AA7

		//;smartkey.C: 412: else if ((mtOldState == 1)) {
		DECRSZ 	48H,0 		//0227 	0E48
		LJUMP 	2A7H 			//0228 	3AA7

		//;smartkey.C: 414: if (RegStatus.bits.b7)RegStatus.bits.b7 = 0;
		LJUMP 	1FFH 			//0229 	39FF

		//;smartkey.C: 415: }
		//;smartkey.C: 416: }
		//;smartkey.C: 417: break;
		//;smartkey.C: 420: if (timeTick > 200) {
		LDWI 	0H 			//022A 	2A00
		SUBWR 	71H,0 			//022B 	0C71
		ORG		022CH
		LDWI 	C9H 			//022C 	2AC9
		BTSC 	STATUS,2 		//022D 	1503
		SUBWR 	70H,0 			//022E 	0C70
		BTSS 	STATUS,0 		//022F 	1C03
		LJUMP 	2A7H 			//0230 	3AA7

		//;smartkey.C: 422: beepOff();
		LCALL 	737H 			//0231 	3737

		//;smartkey.C: 423: if (READ_EEPROM(0x08) == 0xcc) WRITE_EEPROM(0x08, 0);
		LDWI 	8H 			//0232 	2A08
		LCALL 	70EH 			//0233 	370E
		ORG		0234H
		XORWI 	CCH 			//0234 	26CC
		BTSS 	STATUS,2 		//0235 	1D03
		LJUMP 	23AH 			//0236 	3A3A
		LDWI 	8H 			//0237 	2A08
		CLRR 	20H 			//0238 	0120
		LCALL 	65FH 			//0239 	365F
		LDWI 	ACH 			//023A 	2AAC

		//;smartkey.C: 424: RegStatus.bits.b0 = 1;
		BSR 	72H,0 			//023B 	1872
		ORG		023CH

		//;smartkey.C: 425: setState(1, 3500);
		BCR 	STATUS,5 		//023C 	1283
		STR 	20H 			//023D 	01A0
		LDWI 	DH 			//023E 	2A0D
		STR 	21H 			//023F 	01A1
		LDWI 	1H 			//0240 	2A01
		LCALL 	71BH 			//0241 	371B

		//;smartkey.C: 427: tmp16 = timeTick + 40;
		LDR 	71H,0 			//0242 	0871
		STR 	41H 			//0243 	01C1
		ORG		0244H
		LDR 	70H,0 			//0244 	0870
		STR 	40H 			//0245 	01C0
		LDWI 	28H 			//0246 	2A28
		ADDWR 	40H,1 			//0247 	0BC0
		BTSC 	STATUS,0 		//0248 	1403
		INCR	41H,1 			//0249 	09C1
		LJUMP 	2A7H 			//024A 	3AA7

		//;smartkey.C: 433: beepOff();
		LCALL 	737H 			//024B 	3737
		ORG		024CH

		//;smartkey.C: 434: setState(2, 300);
		LDWI 	2CH 			//024C 	2A2C
		BCR 	STATUS,5 		//024D 	1283
		STR 	20H 			//024E 	01A0
		LDWI 	1H 			//024F 	2A01
		STR 	21H 			//0250 	01A1
		LDWI 	2H 			//0251 	2A02
		LCALL 	71BH 			//0252 	371B

		//;smartkey.C: 435: break;
		LJUMP 	2A7H 			//0253 	3AA7
		ORG		0254H
		LDR 	74H,0 			//0254 	0874
		STR 	FSR 			//0255 	0184
		LDWI 	5H 			//0256 	2A05
		SUBWR 	FSR,0 			//0257 	0C04
		BTSC 	STATUS,0 		//0258 	1403
		LJUMP 	2A7H 			//0259 	3AA7
		LDWI 	7H 			//025A 	2A07
		STR 	PCLATH 			//025B 	018A
		ORG		025CH
		LDWI 	3DH 			//025C 	2A3D
		ADDWR 	FSR,0 			//025D 	0B04
		STR 	PCL 			//025E 	0182

		//;smartkey.C: 450: if ((lostDetect == 1) && (timeTick < 1500) && (timeTick > 700))
		BCR 	STATUS,5 		//025F 	1283
		DECRSZ 	32H,0 		//0260 	0E32
		LJUMP 	28DH 			//0261 	3A8D
		LDWI 	5H 			//0262 	2A05
		SUBWR 	71H,0 			//0263 	0C71
		ORG		0264H
		LDWI 	DCH 			//0264 	2ADC
		BTSC 	STATUS,2 		//0265 	1503
		SUBWR 	70H,0 			//0266 	0C70
		BTSC 	STATUS,0 		//0267 	1403
		LJUMP 	28DH 			//0268 	3A8D
		LDWI 	2H 			//0269 	2A02
		SUBWR 	71H,0 			//026A 	0C71
		LDWI 	BDH 			//026B 	2ABD
		ORG		026CH
		BTSC 	STATUS,2 		//026C 	1503
		SUBWR 	70H,0 			//026D 	0C70
		BTSS 	STATUS,0 		//026E 	1C03
		LJUMP 	28DH 			//026F 	3A8D

		//;smartkey.C: 451: {
		//;smartkey.C: 452: if (READ_EEPROM(0x08) == 0x00) WRITE_EEPROM(0x08, 0xcc);
		LDWI 	8H 			//0270 	2A08
		LCALL 	70EH 			//0271 	370E
		IORWI 	0H 			//0272 	2500
		BTSS 	STATUS,2 		//0273 	1D03
		ORG		0274H
		LJUMP 	279H 			//0274 	3A79
		LDWI 	CCH 			//0275 	2ACC
		STR 	20H 			//0276 	01A0
		LDWI 	8H 			//0277 	2A08
		LCALL 	65FH 			//0278 	365F

		//;smartkey.C: 454: setState(3, 1800);
		LDWI 	8H 			//0279 	2A08
		BCR 	STATUS,5 		//027A 	1283
		STR 	20H 			//027B 	01A0
		ORG		027CH
		LDWI 	7H 			//027C 	2A07
		STR 	21H 			//027D 	01A1
		LDWI 	3H 			//027E 	2A03
		LCALL 	71BH 			//027F 	371B

		//;smartkey.C: 455: cntTmp = timeTick + 40;
		LDR 	71H,0 			//0280 	0871
		STR 	44H 			//0281 	01C4
		LDR 	70H,0 			//0282 	0870
		STR 	43H 			//0283 	01C3
		ORG		0284H
		LDWI 	28H 			//0284 	2A28
		ADDWR 	43H,1 			//0285 	0BC3
		BTSC 	STATUS,0 		//0286 	1403
		INCR	44H,1 			//0287 	09C4

		//;smartkey.C: 456: PR2L = 20;
		LDWI 	14H 			//0288 	2A14
		BSR 	STATUS,5 		//0289 	1A83
		STR 	11H 			//028A 	0191

		//;smartkey.C: 457: beepOn();
		LCALL 	742H 			//028B 	3742
		ORG		028CH
		LJUMP 	1DAH 			//028C 	39DA

		//;smartkey.C: 459: }
		//;smartkey.C: 458: lostDetect = 0;
		//;smartkey.C: 460: else {
		//;smartkey.C: 461: lostDetect = 1;
		CLRR 	32H 			//028D 	0132
		INCR	32H,1 			//028E 	09B2
		LJUMP 	1DCH 			//028F 	39DC

		//;smartkey.C: 464: }
		//;smartkey.C: 465: timeTick = 0;
		//;smartkey.C: 470: timeTick = 0;
		CLRR 	70H 			//0290 	0170
		CLRR 	71H 			//0291 	0171

		//;smartkey.C: 471: beepOn(); TMR2ON = 0;
		LCALL 	742H 			//0292 	3742
		LDWI 	2H 			//0293 	2A02
		ORG		0294H
		BCR 	STATUS,5 		//0294 	1283
		BCR 	12H,2 			//0295 	1112

		//;smartkey.C: 472: beep(10, 2);
		STR 	24H 			//0296 	01A4
		LDWI 	AH 			//0297 	2A0A
		LCALL 	692H 			//0298 	3692

		//;smartkey.C: 473: if (mtOldState == 3) {RegStatus.bits.b7 = 1;}
		LDR 	48H,0 			//0299 	0848
		XORWI 	3H 			//029A 	2603
		BTSS 	STATUS,2 		//029B 	1D03
		ORG		029CH
		LJUMP 	2A7H 			//029C 	3AA7
		BSR 	72H,7 			//029D 	1BF2
		LJUMP 	2A7H 			//029E 	3AA7
		LDR 	74H,0 			//029F 	0874
		XORWI 	1H 			//02A0 	2601
		BTSC 	STATUS,2 		//02A1 	1503
		LJUMP 	25FH 			//02A2 	3A5F
		XORWI 	3H 			//02A3 	2603
		ORG		02A4H
		BTSC 	STATUS,2 		//02A4 	1503
		LJUMP 	290H 			//02A5 	3A90
		LJUMP 	2A7H 			//02A6 	3AA7

		//;smartkey.C: 476: }
		//;smartkey.C: 477: PAIE = 1;
		BSR 	INTCON,3 		//02A7 	198B

		//;smartkey.C: 478: }
		//;smartkey.C: 479: }
		//;smartkey.C: 480: }
		//;smartkey.C: 483: if ((timeOut != 0) && ( timeTick > timeOut)) {
		BCR 	STATUS,5 		//02A8 	1283
		LDR 	46H,0 			//02A9 	0846
		IORWR 	45H,0 			//02AA 	0345
		BTSC 	STATUS,2 		//02AB 	1503
		ORG		02ACH
		LJUMP 	32EH 			//02AC 	3B2E
		LDR 	71H,0 			//02AD 	0871
		SUBWR 	46H,0 			//02AE 	0C46
		BTSS 	STATUS,2 		//02AF 	1D03
		LJUMP 	2B3H 			//02B0 	3AB3
		LDR 	70H,0 			//02B1 	0870
		SUBWR 	45H,0 			//02B2 	0C45
		BTSS 	STATUS,0 		//02B3 	1C03
		ORG		02B4H
		LJUMP 	320H 			//02B4 	3B20
		LJUMP 	32EH 			//02B5 	3B2E

		//;smartkey.C: 489: beepOff();
		LCALL 	737H 			//02B6 	3737
		LDWI 	2CH 			//02B7 	2A2C

		//;smartkey.C: 490: RegStatus.bits.b0 = 0;
		BCR 	72H,0 			//02B8 	1072

		//;smartkey.C: 491: setState(2, 300);
		BCR 	STATUS,5 		//02B9 	1283
		STR 	20H 			//02BA 	01A0
		LDWI 	1H 			//02BB 	2A01
		ORG		02BCH
		STR 	21H 			//02BC 	01A1
		LDWI 	2H 			//02BD 	2A02
		LCALL 	71BH 			//02BE 	371B

		//;smartkey.C: 492: break;
		LJUMP 	32EH 			//02BF 	3B2E

		//;smartkey.C: 494: beepOff();
		LCALL 	737H 			//02C0 	3737

		//;smartkey.C: 495: delay_x10ms(20);
		LDWI 	14H 			//02C1 	2A14
		BCR 	STATUS,5 		//02C2 	1283
		STR 	20H 			//02C3 	01A0
		ORG		02C4H
		CLRR 	21H 			//02C4 	0121
		LCALL 	6D1H 			//02C5 	36D1

		//;smartkey.C: 496: beepOn(); TMR2ON = 0; RegStatus.bits.b7 = 0;
		LCALL 	742H 			//02C6 	3742
		LDWI 	1EH 			//02C7 	2A1E
		BCR 	STATUS,5 		//02C8 	1283
		BCR 	12H,2 			//02C9 	1112
		BCR 	72H,7 			//02CA 	13F2

		//;smartkey.C: 497: beep(30, 1);
		CLRR 	24H 			//02CB 	0124
		ORG		02CCH
		INCR	24H,1 			//02CC 	09A4
		LCALL 	692H 			//02CD 	3692
		LDWI 	0H 			//02CE 	2A00

		//;smartkey.C: 498: RegStatus.bits.b5 = 1;
		BSR 	72H,5 			//02CF 	1AF2

		//;smartkey.C: 499: setState(0, 0);
		CLRR 	20H 			//02D0 	0120
		CLRR 	21H 			//02D1 	0121
		LCALL 	71BH 			//02D2 	371B

		//;smartkey.C: 501: tmp16 = timeTick + 40;
		LDR 	71H,0 			//02D3 	0871
		ORG		02D4H
		STR 	41H 			//02D4 	01C1
		LDR 	70H,0 			//02D5 	0870
		STR 	40H 			//02D6 	01C0
		LDWI 	28H 			//02D7 	2A28
		ADDWR 	40H,1 			//02D8 	0BC0
		BTSC 	STATUS,0 		//02D9 	1403
		INCR	41H,1 			//02DA 	09C1

		//;smartkey.C: 502: break;
		LJUMP 	32EH 			//02DB 	3B2E
		ORG		02DCH

		//;smartkey.C: 505: if (READ_EEPROM(0x08) == 0xcc) WRITE_EEPROM(0x08, 0);
		LDWI 	8H 			//02DC 	2A08
		LCALL 	70EH 			//02DD 	370E
		XORWI 	CCH 			//02DE 	26CC
		BTSS 	STATUS,2 		//02DF 	1D03
		LJUMP 	2E4H 			//02E0 	3AE4
		LDWI 	8H 			//02E1 	2A08
		CLRR 	20H 			//02E2 	0120
		LCALL 	65FH 			//02E3 	365F
		ORG		02E4H

		//;smartkey.C: 506: if (RegStatus.bits.b7) {
		BTSS 	72H,7 			//02E4 	1FF2
		LJUMP 	2FAH 			//02E5 	3AFA

		//;smartkey.C: 507: setState(4, 6000);
		LDWI 	70H 			//02E6 	2A70
		BCR 	STATUS,5 		//02E7 	1283
		STR 	20H 			//02E8 	01A0
		LDWI 	17H 			//02E9 	2A17
		STR 	21H 			//02EA 	01A1
		LDWI 	4H 			//02EB 	2A04
		ORG		02ECH
		LCALL 	71BH 			//02EC 	371B

		//;smartkey.C: 508: cntTmp = timeTick + 40;
		LDR 	71H,0 			//02ED 	0871
		STR 	44H 			//02EE 	01C4
		LDR 	70H,0 			//02EF 	0870
		STR 	43H 			//02F0 	01C3
		LDWI 	28H 			//02F1 	2A28
		ADDWR 	43H,1 			//02F2 	0BC3
		BTSC 	STATUS,0 		//02F3 	1403
		ORG		02F4H
		INCR	44H,1 			//02F4 	09C4

		//;smartkey.C: 509: PR2L = 20;
		LDWI 	14H 			//02F5 	2A14
		BSR 	STATUS,5 		//02F6 	1A83
		STR 	11H 			//02F7 	0191

		//;smartkey.C: 510: beepOn();
		LCALL 	742H 			//02F8 	3742

		//;smartkey.C: 512: } else if (mtOldState == 0) {
		LJUMP 	32EH 			//02F9 	3B2E
		BCR 	STATUS,5 		//02FA 	1283
		LDR 	48H,1 			//02FB 	08C8
		ORG		02FCH
		BTSS 	STATUS,2 		//02FC 	1D03
		LJUMP 	312H 			//02FD 	3B12

		//;smartkey.C: 514: beep(10, 5);
		LDWI 	5H 			//02FE 	2A05
		STR 	24H 			//02FF 	01A4
		LDWI 	AH 			//0300 	2A0A
		LCALL 	692H 			//0301 	3692
		LDWI 	40H 			//0302 	2A40

		//;smartkey.C: 515: RegStatus.bits.b0 = 1;
		BSR 	72H,0 			//0303 	1872
		ORG		0304H

		//;smartkey.C: 516: if (READ_EEPROM(0x40))WRITE_EEPROM(0x40, 0);
		LCALL 	70EH 			//0304 	370E
		XORWI 	0H 			//0305 	2600
		BTSC 	STATUS,2 		//0306 	1503
		LJUMP 	30BH 			//0307 	3B0B
		LDWI 	40H 			//0308 	2A40
		CLRR 	20H 			//0309 	0120
		LCALL 	65FH 			//030A 	365F

		//;smartkey.C: 517: setState(1, 3500);
		LDWI 	ACH 			//030B 	2AAC
		ORG		030CH
		BCR 	STATUS,5 		//030C 	1283
		STR 	20H 			//030D 	01A0
		LDWI 	DH 			//030E 	2A0D
		STR 	21H 			//030F 	01A1
		LDWI 	1H 			//0310 	2A01
		LJUMP 	2D2H 			//0311 	3AD2

		//;smartkey.C: 521: beepOn(); TMR2ON = 0;
		LCALL 	742H 			//0312 	3742
		LDWI 	1EH 			//0313 	2A1E
		ORG		0314H
		BCR 	STATUS,5 		//0314 	1283
		BCR 	12H,2 			//0315 	1112

		//;smartkey.C: 522: RegStatus.bits.b7 = 0;
		BCR 	72H,7 			//0316 	13F2
		CLRR 	24H 			//0317 	0124
		INCR	24H,1 			//0318 	09A4
		LCALL 	692H 			//0319 	3692
		LDWI 	0H 			//031A 	2A00

		//;smartkey.C: 524: setState(0, 0);
		CLRR 	20H 			//031B 	0120
		ORG		031CH
		CLRR 	21H 			//031C 	0121
		LCALL 	71BH 			//031D 	371B

		//;smartkey.C: 526: RegStatus.bits.b5 = 1;
		BSR 	72H,5 			//031E 	1AF2
		LJUMP 	2D3H 			//031F 	3AD3
		LDR 	74H,0 			//0320 	0874
		XORWI 	1H 			//0321 	2601
		BTSC 	STATUS,2 		//0322 	1503
		LJUMP 	32EH 			//0323 	3B2E
		ORG		0324H
		XORWI 	3H 			//0324 	2603
		BTSC 	STATUS,2 		//0325 	1503
		LJUMP 	2DCH 			//0326 	3ADC
		XORWI 	1H 			//0327 	2601
		BTSC 	STATUS,2 		//0328 	1503
		LJUMP 	2B6H 			//0329 	3AB6
		XORWI 	7H 			//032A 	2607
		BTSC 	STATUS,2 		//032B 	1503
		ORG		032CH
		LJUMP 	2C0H 			//032C 	3AC0
		LJUMP 	32EH 			//032D 	3B2E

		//;smartkey.C: 531: }
		//;smartkey.C: 533: if (RegStatus.bits.b6 == 1) {
		BTSS 	72H,6 			//032E 	1F72
		LJUMP 	417H 			//032F 	3C17

		//;smartkey.C: 534: if ((timeTick > tmp16) && (mtState == 1) ) {
		LDR 	71H,0 			//0330 	0871
		BCR 	STATUS,5 		//0331 	1283
		SUBWR 	41H,0 			//0332 	0C41
		BTSS 	STATUS,2 		//0333 	1D03
		ORG		0334H
		LJUMP 	337H 			//0334 	3B37
		LDR 	70H,0 			//0335 	0870
		SUBWR 	40H,0 			//0336 	0C40
		BTSC 	STATUS,0 		//0337 	1403
		LJUMP 	3CFH 			//0338 	3BCF
		DECRSZ 	74H,0 		//0339 	0E74
		LJUMP 	3CFH 			//033A 	3BCF

		//;smartkey.C: 535: tmp16 = timeTick + 40;
		LDR 	71H,0 			//033B 	0871
		ORG		033CH
		STR 	41H 			//033C 	01C1
		LDR 	70H,0 			//033D 	0870
		STR 	40H 			//033E 	01C0
		LDWI 	28H 			//033F 	2A28
		ADDWR 	40H,1 			//0340 	0BC0
		BTSC 	STATUS,0 		//0341 	1403
		INCR	41H,1 			//0342 	09C1

		//;smartkey.C: 536: if (AccRead(0x02, buf, 6) == 0) {
		LDWI 	39H 			//0343 	2A39
		ORG		0344H
		STR 	24H 			//0344 	01A4
		LDWI 	0H 			//0345 	2A00
		STR 	25H 			//0346 	01A5
		LDWI 	6H 			//0347 	2A06
		STR 	26H 			//0348 	01A6
		LDWI 	2H 			//0349 	2A02
		LCALL 	5C2H 			//034A 	35C2
		IORWI 	0H 			//034B 	2500
		ORG		034CH
		BTSS 	STATUS,2 		//034C 	1D03
		LJUMP 	3CFH 			//034D 	3BCF

		//;smartkey.C: 538: if (compe(buf[1], (signed char)acXsum, 5) && compe(buf[3], (signed cha
		//+                          r)acYsum, 5)) {
		BCR 	STATUS,5 		//034E 	1283
		LDR 	37H,0 			//034F 	0837
		STR 	20H 			//0350 	01A0
		LDWI 	5H 			//0351 	2A05
		STR 	21H 			//0352 	01A1
		LDR 	3AH,0 			//0353 	083A
		ORG		0354H
		LCALL 	501H 			//0354 	3501
		XORWI 	0H 			//0355 	2600
		BCR 	STATUS,5 		//0356 	1283
		BTSC 	STATUS,2 		//0357 	1503
		LJUMP 	37FH 			//0358 	3B7F
		LDR 	35H,0 			//0359 	0835
		STR 	20H 			//035A 	01A0
		LDWI 	5H 			//035B 	2A05
		ORG		035CH
		STR 	21H 			//035C 	01A1
		LDR 	3CH,0 			//035D 	083C
		LCALL 	501H 			//035E 	3501
		XORWI 	0H 			//035F 	2600

		//;smartkey.C: 540: isSw++;
		BCR 	STATUS,5 		//0360 	1283
		BTSC 	STATUS,2 		//0361 	1503
		LJUMP 	37FH 			//0362 	3B7F
		LDWI 	2DH 			//0363 	2A2D
		ORG		0364H
		INCR	3FH,1 			//0364 	09BF

		//;smartkey.C: 541: if (isSw > 44) {
		SUBWR 	3FH,0 			//0365 	0C3F
		BTSS 	STATUS,0 		//0366 	1C03
		LJUMP 	372H 			//0367 	3B72
		LDWI 	2CH 			//0368 	2A2C

		//;smartkey.C: 542: isSw = 0;
		CLRR 	3FH 			//0369 	013F

		//;smartkey.C: 543: RegStatus.bits.b5 = 1;
		BSR 	72H,5 			//036A 	1AF2

		//;smartkey.C: 546: RegStatus.bits.b0 = 0;
		BCR 	72H,0 			//036B 	1072
		ORG		036CH

		//;smartkey.C: 547: setState(2, 300);
		STR 	20H 			//036C 	01A0
		LDWI 	1H 			//036D 	2A01
		STR 	21H 			//036E 	01A1
		LDWI 	2H 			//036F 	2A02
		LCALL 	71BH 			//0370 	371B

		//;smartkey.C: 548: }
		LJUMP 	3AEH 			//0371 	3BAE

		//;smartkey.C: 549: else if (isSw > 25) {
		LDWI 	1AH 			//0372 	2A1A
		SUBWR 	3FH,0 			//0373 	0C3F
		ORG		0374H
		BTSC 	STATUS,0 		//0374 	1403

		//;smartkey.C: 550: if (isSw % 2 == 0) {
		BTSC 	3FH,0 			//0375 	143F
		LJUMP 	3AEH 			//0376 	3BAE

		//;smartkey.C: 551: beepOn(); TMR2ON = 0; beep(7, 1);
		LCALL 	742H 			//0377 	3742
		LDWI 	7H 			//0378 	2A07
		BCR 	STATUS,5 		//0379 	1283
		BCR 	12H,2 			//037A 	1112
		CLRR 	24H 			//037B 	0124
		ORG		037CH
		INCR	24H,1 			//037C 	09A4
		LCALL 	692H 			//037D 	3692
		LJUMP 	3AEH 			//037E 	3BAE

		//;smartkey.C: 556: else {
		//;smartkey.C: 557: isSw = 0;
		//;smartkey.C: 552: }
		//;smartkey.C: 553: }
		//;smartkey.C: 554: }
		CLRR 	3FH 			//037F 	013F

		//;smartkey.C: 560: if (compe(buf[1], acXOld, 1) && compe(buf[3], acYOld, 1)) {
		LDR 	34H,0 			//0380 	0834
		STR 	20H 			//0381 	01A0
		CLRR 	21H 			//0382 	0121
		INCR	21H,1 			//0383 	09A1
		ORG		0384H
		LDR 	3AH,0 			//0384 	083A
		LCALL 	501H 			//0385 	3501
		XORWI 	0H 			//0386 	2600
		BCR 	STATUS,5 		//0387 	1283
		BTSC 	STATUS,2 		//0388 	1503
		LJUMP 	3ACH 			//0389 	3BAC
		LDR 	33H,0 			//038A 	0833
		STR 	20H 			//038B 	01A0
		ORG		038CH
		CLRR 	21H 			//038C 	0121
		INCR	21H,1 			//038D 	09A1
		LDR 	3CH,0 			//038E 	083C
		LCALL 	501H 			//038F 	3501
		XORWI 	0H 			//0390 	2600

		//;smartkey.C: 561: isWait++;
		BCR 	STATUS,5 		//0391 	1283
		BTSC 	STATUS,2 		//0392 	1503
		LJUMP 	3ACH 			//0393 	3BAC
		ORG		0394H
		INCR	2FH,1 			//0394 	09AF
		BTSC 	STATUS,2 		//0395 	1503
		INCR	30H,1 			//0396 	09B0

		//;smartkey.C: 562: if (isWait == 450) {
		DECR 	30H,0 			//0397 	0D30
		LDWI 	C2H 			//0398 	2AC2
		BTSC 	STATUS,2 		//0399 	1503
		XORWR 	2FH,0 			//039A 	042F
		BTSS 	STATUS,2 		//039B 	1D03
		ORG		039CH
		LJUMP 	3AEH 			//039C 	3BAE
		LDWI 	2H 			//039D 	2A02

		//;smartkey.C: 563: isWait = 0;
		CLRR 	2FH 			//039E 	012F
		CLRR 	30H 			//039F 	0130

		//;smartkey.C: 564: beep(7, 2);
		STR 	24H 			//03A0 	01A4
		LDWI 	7H 			//03A1 	2A07
		LCALL 	692H 			//03A2 	3692
		LDWI 	2CH 			//03A3 	2A2C
		ORG		03A4H

		//;smartkey.C: 565: RegStatus.bits.b5 = 1;
		BSR 	72H,5 			//03A4 	1AF2

		//;smartkey.C: 566: RegStatus.bits.b0 = 0;
		BCR 	72H,0 			//03A5 	1072

		//;smartkey.C: 567: setState(2, 300);
		STR 	20H 			//03A6 	01A0
		LDWI 	1H 			//03A7 	2A01
		STR 	21H 			//03A8 	01A1
		LDWI 	2H 			//03A9 	2A02
		LCALL 	71BH 			//03AA 	371B
		LJUMP 	3AEH 			//03AB 	3BAE
		ORG		03ACH

		//;smartkey.C: 570: else
		//;smartkey.C: 571: isWait = 0;
		CLRR 	2FH 			//03AC 	012F
		CLRR 	30H 			//03AD 	0130

		//;smartkey.C: 572: }
		//;smartkey.C: 574: if ( (buf[5] > -31) && (buf[5] < 31)) {
		LDR 	3EH,0 			//03AE 	083E
		XORWI 	80H 			//03AF 	2680
		ADDWI 	9EH 			//03B0 	279E
		BTSS 	STATUS,0 		//03B1 	1C03
		LJUMP 	3CAH 			//03B2 	3BCA
		LDR 	3EH,0 			//03B3 	083E
		ORG		03B4H
		XORWI 	80H 			//03B4 	2680
		ADDWI 	61H 			//03B5 	2761
		BTSC 	STATUS,0 		//03B6 	1403
		LJUMP 	3CAH 			//03B7 	3BCA
		LDWI 	5H 			//03B8 	2A05

		//;smartkey.C: 575: isFall++;
		INCR	31H,1 			//03B9 	09B1

		//;smartkey.C: 576: if (isFall > 4) {
		SUBWR 	31H,0 			//03BA 	0C31
		BTSS 	STATUS,0 		//03BB 	1C03
		ORG		03BCH
		LJUMP 	3CBH 			//03BC 	3BCB
		LDWI 	2H 			//03BD 	2A02

		//;smartkey.C: 577: isFall = 0;
		CLRR 	31H 			//03BE 	0131

		//;smartkey.C: 578: beep(7, 2);
		STR 	24H 			//03BF 	01A4
		LDWI 	7H 			//03C0 	2A07
		LCALL 	692H 			//03C1 	3692
		LDWI 	2CH 			//03C2 	2A2C

		//;smartkey.C: 579: RegStatus.bits.b0 = 0;
		BCR 	72H,0 			//03C3 	1072
		ORG		03C4H

		//;smartkey.C: 580: setState(2, 300);
		STR 	20H 			//03C4 	01A0
		LDWI 	1H 			//03C5 	2A01
		STR 	21H 			//03C6 	01A1
		LDWI 	2H 			//03C7 	2A02
		LCALL 	71BH 			//03C8 	371B
		LJUMP 	3CBH 			//03C9 	3BCB

		//;smartkey.C: 583: else {
		//;smartkey.C: 584: isFall = 0;
		CLRR 	31H 			//03CA 	0131

		//;smartkey.C: 585: }
		//;smartkey.C: 587: acYOld = buf[3]; acXOld = buf[1];
		LDR 	3CH,0 			//03CB 	083C
		ORG		03CCH
		STR 	33H 			//03CC 	01B3
		LDR 	3AH,0 			//03CD 	083A
		STR 	34H 			//03CE 	01B4

		//;smartkey.C: 588: }
		//;smartkey.C: 589: }
		//;smartkey.C: 592: if ((timeTick > tmp16) && (mtState == 0 ) ) {
		LDR 	71H,0 			//03CF 	0871
		BCR 	STATUS,5 		//03D0 	1283
		SUBWR 	41H,0 			//03D1 	0C41
		BTSS 	STATUS,2 		//03D2 	1D03
		LJUMP 	3D6H 			//03D3 	3BD6
		ORG		03D4H
		LDR 	70H,0 			//03D4 	0870
		SUBWR 	40H,0 			//03D5 	0C40
		BTSC 	STATUS,0 		//03D6 	1403
		LJUMP 	417H 			//03D7 	3C17
		LDR 	74H,1 			//03D8 	08F4
		BTSS 	STATUS,2 		//03D9 	1D03
		LJUMP 	417H 			//03DA 	3C17

		//;smartkey.C: 594: if (timeTick > 65000) timeTick = 0;
		LDWI 	FDH 			//03DB 	2AFD
		ORG		03DCH
		SUBWR 	71H,0 			//03DC 	0C71
		LDWI 	E9H 			//03DD 	2AE9
		BTSC 	STATUS,2 		//03DE 	1503
		SUBWR 	70H,0 			//03DF 	0C70
		BTSS 	STATUS,0 		//03E0 	1C03
		LJUMP 	3E4H 			//03E1 	3BE4
		CLRR 	70H 			//03E2 	0170
		CLRR 	71H 			//03E3 	0171
		ORG		03E4H

		//;smartkey.C: 595: tmp16 = timeTick + 40;
		LDR 	71H,0 			//03E4 	0871
		STR 	41H 			//03E5 	01C1
		LDR 	70H,0 			//03E6 	0870
		STR 	40H 			//03E7 	01C0
		LDWI 	28H 			//03E8 	2A28
		ADDWR 	40H,1 			//03E9 	0BC0
		BTSC 	STATUS,0 		//03EA 	1403
		INCR	41H,1 			//03EB 	09C1
		ORG		03ECH

		//;smartkey.C: 597: if (AccRead(0x02, buf, 6) == 0) {
		LDWI 	39H 			//03EC 	2A39
		STR 	24H 			//03ED 	01A4
		LDWI 	0H 			//03EE 	2A00
		STR 	25H 			//03EF 	01A5
		LDWI 	6H 			//03F0 	2A06
		STR 	26H 			//03F1 	01A6
		LDWI 	2H 			//03F2 	2A02
		LCALL 	5C2H 			//03F3 	35C2
		ORG		03F4H
		IORWI 	0H 			//03F4 	2500
		BTSC 	STATUS,2 		//03F5 	1503

		//;smartkey.C: 598: if (RegStatus.bits.b5) {
		BTSS 	72H,5 			//03F6 	1EF2
		LJUMP 	417H 			//03F7 	3C17

		//;smartkey.C: 599: if (compe(buf[1], acXOld , 3) && compe(buf[3], acYOld , 3)) {
		BCR 	STATUS,5 		//03F8 	1283
		LDR 	34H,0 			//03F9 	0834
		STR 	20H 			//03FA 	01A0
		LDWI 	3H 			//03FB 	2A03
		ORG		03FCH
		STR 	21H 			//03FC 	01A1
		LDR 	3AH,0 			//03FD 	083A
		LCALL 	501H 			//03FE 	3501
		XORWI 	0H 			//03FF 	2600
		BCR 	STATUS,5 		//0400 	1283
		BTSC 	STATUS,2 		//0401 	1503
		LJUMP 	40FH 			//0402 	3C0F
		LDR 	33H,0 			//0403 	0833
		ORG		0404H
		STR 	20H 			//0404 	01A0
		LDWI 	3H 			//0405 	2A03
		STR 	21H 			//0406 	01A1
		LDR 	3CH,0 			//0407 	083C
		LCALL 	501H 			//0408 	3501
		XORWI 	0H 			//0409 	2600

		//;smartkey.C: 601: isSw = 0;
		BCR 	STATUS,5 		//040A 	1283
		BTSC 	STATUS,2 		//040B 	1503
		ORG		040CH
		LJUMP 	40FH 			//040C 	3C0F
		CLRR 	3FH 			//040D 	013F

		//;smartkey.C: 602: }
		LJUMP 	417H 			//040E 	3C17

		//;smartkey.C: 603: else {
		//;smartkey.C: 604: isSw++;
		INCR	3FH,1 			//040F 	09BF

		//;smartkey.C: 605: beepOn(); TMR2ON = 0; beep(7, 3);
		LCALL 	742H 			//0410 	3742
		LDWI 	3H 			//0411 	2A03
		BCR 	STATUS,5 		//0412 	1283
		BCR 	12H,2 			//0413 	1112
		ORG		0414H
		STR 	24H 			//0414 	01A4
		LDWI 	7H 			//0415 	2A07
		LCALL 	692H 			//0416 	3692

		//;smartkey.C: 606: }
		//;smartkey.C: 607: }
		//;smartkey.C: 608: }
		//;smartkey.C: 609: }
		//;smartkey.C: 610: }
		//;smartkey.C: 612: if (RegStatus.bits.b0) {RC0 = 1; RC1 = 1;}
		BTSS 	72H,0 			//0417 	1C72
		LJUMP 	41DH 			//0418 	3C1D
		BCR 	STATUS,5 		//0419 	1283
		BSR 	7H,0 			//041A 	1807
		BSR 	7H,1 			//041B 	1887
		ORG		041CH
		LJUMP 	420H 			//041C 	3C20

		//;smartkey.C: 613: else {RC0 = 0; RC1 = 0;}
		BCR 	STATUS,5 		//041D 	1283
		BCR 	7H,0 			//041E 	1007
		BCR 	7H,1 			//041F 	1087

		//;smartkey.C: 616: if (timeTick > 500){
		LDWI 	1H 			//0420 	2A01
		SUBWR 	71H,0 			//0421 	0C71
		LDWI 	F5H 			//0422 	2AF5
		BTSC 	STATUS,2 		//0423 	1503
		ORG		0424H
		SUBWR 	70H,0 			//0424 	0C70
		BTSS 	STATUS,0 		//0425 	1C03
		LJUMP 	1D0H 			//0426 	39D0

		//;smartkey.C: 617: if (READ_EEPROM(0x3F)) WRITE_EEPROM(0x3F, 0);
		LDWI 	3FH 			//0427 	2A3F
		LCALL 	70EH 			//0428 	370E
		XORWI 	0H 			//0429 	2600
		BTSC 	STATUS,2 		//042A 	1503
		LJUMP 	42FH 			//042B 	3C2F
		ORG		042CH
		LDWI 	3FH 			//042C 	2A3F
		CLRR 	20H 			//042D 	0120
		LCALL 	65FH 			//042E 	365F

		//;smartkey.C: 618: if (READ_EEPROM(0x40)) WRITE_EEPROM(0x40, 0);
		LDWI 	40H 			//042F 	2A40
		LCALL 	70EH 			//0430 	370E
		XORWI 	0H 			//0431 	2600
		BTSC 	STATUS,2 		//0432 	1503
		LJUMP 	1D0H 			//0433 	39D0
		ORG		0434H
		LDWI 	40H 			//0434 	2A40
		CLRR 	20H 			//0435 	0120
		LCALL 	65FH 			//0436 	365F
		LJUMP 	1D0H 			//0437 	39D0

		//;smartkey.C: 50: if (PAIE && PAIF) {
		BTSC 	INTCON,3 		//0438 	158B
		BTSS 	INTCON,0 		//0439 	1C0B
		LJUMP 	447H 			//043A 	3C47
		BCR 	STATUS,5 		//043B 	1283
		ORG		043CH
		LDR 	5H,0 			//043C 	0805

		//;smartkey.C: 52: PAIF = 0;
		BCR 	INTCON,0 		//043D 	100B

		//;smartkey.C: 54: if (RA5) {
		BTSS 	5H,5 			//043E 	1E85
		LJUMP 	446H 			//043F 	3C46

		//;smartkey.C: 55: if (RegStatus.bits.b3 == 0) {
		BTSC 	72H,3 			//0440 	15F2
		LJUMP 	447H 			//0441 	3C47

		//;smartkey.C: 56: cntCyc = 0;
		CLRR 	73H 			//0442 	0173

		//;smartkey.C: 57: cntOff = 0;
		CLRR 	47H 			//0443 	0147
		ORG		0444H

		//;smartkey.C: 59: RegStatus.bits.b3 = 1;
		BSR 	72H,3 			//0444 	19F2
		LJUMP 	447H 			//0445 	3C47

		//;smartkey.C: 62: else {
		//;smartkey.C: 63: cntOff = 0;
		CLRR 	47H 			//0446 	0147

		//;smartkey.C: 64: }
		//;smartkey.C: 65: }
		//;smartkey.C: 67: if (INTE && INTF) {
		BTSC 	INTCON,4 		//0447 	160B
		BTSS 	INTCON,1 		//0448 	1C8B
		LJUMP 	45DH 			//0449 	3C5D

		//;smartkey.C: 68: INTF = 0;
		BCR 	INTCON,1 		//044A 	108B

		//;smartkey.C: 69: if ( RA2 == 0) {
		BCR 	STATUS,5 		//044B 	1283
		ORG		044CH
		BTSC 	5H,2 			//044C 	1505
		LJUMP 	45DH 			//044D 	3C5D

		//;smartkey.C: 70: if (timeTick < 32) {
		LDWI 	0H 			//044E 	2A00
		SUBWR 	71H,0 			//044F 	0C71
		LDWI 	20H 			//0450 	2A20
		BTSC 	STATUS,2 		//0451 	1503
		SUBWR 	70H,0 			//0452 	0C70
		BTSC 	STATUS,0 		//0453 	1403
		ORG		0454H
		LJUMP 	45CH 			//0454 	3C5C

		//;smartkey.C: 71: tmp = READ_EEPROM(0x3F);
		LDWI 	3FH 			//0455 	2A3F
		LCALL 	72FH 			//0456 	372F
		STR 	79H 			//0457 	01F9

		//;smartkey.C: 72: WRITE_EEPROM(0x3F, tmp + 1);
		INCR	79H,0 			//0458 	0979
		STR 	75H 			//0459 	01F5
		LDWI 	3FH 			//045A 	2A3F
		LCALL 	67AH 			//045B 	367A
		ORG		045CH
		LJUMP 	45CH 			//045C 	3C5C

		//;smartkey.C: 75: }
		//;smartkey.C: 76: }
		//;smartkey.C: 79: if (T0IE && T0IF) {
		BTSC 	INTCON,5 		//045D 	168B
		BTSS 	INTCON,2 		//045E 	1D0B
		LJUMP 	4ACH 			//045F 	3CAC
		LDWI 	B3H 			//0460 	2AB3

		//;smartkey.C: 80: T0IF = 0;
		BCR 	INTCON,2 		//0461 	110B

		//;smartkey.C: 81: TMR0 = 179;
		BCR 	STATUS,5 		//0462 	1283
		STR 	1H 			//0463 	0181
		ORG		0464H

		//;smartkey.C: 87: if ( RegStatus.bits.b3 == 1) {
		BTSS 	72H,3 			//0464 	1DF2
		LJUMP 	47EH 			//0465 	3C7E

		//;smartkey.C: 89: cntCyc++;
		INCR	73H,1 			//0466 	09F3

		//;smartkey.C: 90: if (RA5 == 0) {
		BTSC 	5H,5 			//0467 	1685
		LJUMP 	47EH 			//0468 	3C7E
		LDWI 	10H 			//0469 	2A10

		//;smartkey.C: 92: cntOff++;
		INCR	47H,1 			//046A 	09C7

		//;smartkey.C: 94: if (cntOff > 15) {
		SUBWR 	47H,0 			//046B 	0C47
		ORG		046CH
		BTSS 	STATUS,0 		//046C 	1C03
		LJUMP 	47EH 			//046D 	3C7E
		LDWI 	10H 			//046E 	2A10

		//;smartkey.C: 96: RegStatus.bits.b3 = 0;
		BCR 	72H,3 			//046F 	11F2

		//;smartkey.C: 98: if ((cntCyc > 15) && (cntCyc < 50)) {
		SUBWR 	73H,0 			//0470 	0C73
		LDWI 	32H 			//0471 	2A32
		BTSS 	STATUS,0 		//0472 	1C03
		LJUMP 	47AH 			//0473 	3C7A
		ORG		0474H
		SUBWR 	73H,0 			//0474 	0C73
		BTSC 	STATUS,0 		//0475 	1403
		LJUMP 	479H 			//0476 	3C79

		//;smartkey.C: 99: RegStatus.bits.b2 =1;
		BSR 	72H,2 			//0477 	1972

		//;smartkey.C: 100: } else if (cntCyc >= 50) {
		LJUMP 	47DH 			//0478 	3C7D
		LDWI 	32H 			//0479 	2A32
		SUBWR 	73H,0 			//047A 	0C73
		BTSC 	STATUS,0 		//047B 	1403
		ORG		047CH

		//;smartkey.C: 101: RegStatus.bits.b2 =0;
		BCR 	72H,2 			//047C 	1172

		//;smartkey.C: 102: }
		//;smartkey.C: 103: RegStatus.bits.b1 = 1;
		BSR 	72H,1 			//047D 	18F2

		//;smartkey.C: 104: }
		//;smartkey.C: 105: }
		//;smartkey.C: 106: }
		//;smartkey.C: 108: timeTick++;
		INCR	70H,1 			//047E 	09F0
		BTSC 	STATUS,2 		//047F 	1503
		INCR	71H,1 			//0480 	09F1

		//;smartkey.C: 110: if ((mtState == 4) || (mtState == 3)) {
		LDR 	74H,0 			//0481 	0874
		XORWI 	4H 			//0482 	2604
		BTSC 	STATUS,2 		//0483 	1503
		ORG		0484H
		LJUMP 	489H 			//0484 	3C89
		LDR 	74H,0 			//0485 	0874
		XORWI 	3H 			//0486 	2603
		BTSS 	STATUS,2 		//0487 	1D03
		LJUMP 	4ACH 			//0488 	3CAC

		//;smartkey.C: 111: if (timeTick > cntTmp) {
		LDR 	71H,0 			//0489 	0871
		SUBWR 	44H,0 			//048A 	0C44
		BTSS 	STATUS,2 		//048B 	1D03
		ORG		048CH
		LJUMP 	48FH 			//048C 	3C8F
		LDR 	70H,0 			//048D 	0870
		SUBWR 	43H,0 			//048E 	0C43
		BTSC 	STATUS,0 		//048F 	1403
		LJUMP 	4ACH 			//0490 	3CAC

		//;smartkey.C: 112: cntTmp = timeTick + 38;
		LDR 	71H,0 			//0491 	0871
		STR 	44H 			//0492 	01C4
		LDR 	70H,0 			//0493 	0870
		ORG		0494H
		STR 	43H 			//0494 	01C3
		LDWI 	26H 			//0495 	2A26
		ADDWR 	43H,1 			//0496 	0BC3
		BTSC 	STATUS,0 		//0497 	1403
		INCR	44H,1 			//0498 	09C4

		//;smartkey.C: 113: if (cntTmp <= timeOut)
		LDR 	44H,0 			//0499 	0844
		SUBWR 	46H,0 			//049A 	0C46
		BTSS 	STATUS,2 		//049B 	1D03
		ORG		049CH
		LJUMP 	49FH 			//049C 	3C9F
		LDR 	43H,0 			//049D 	0843
		SUBWR 	45H,0 			//049E 	0C45

		//;smartkey.C: 114: {
		//;smartkey.C: 115: TMR2IE = 0;
		BSR 	STATUS,5 		//049F 	1A83
		BTSS 	STATUS,0 		//04A0 	1C03
		LJUMP 	4ADH 			//04A1 	3CAD
		BCR 	CH,1 			//04A2 	108C

		//;smartkey.C: 116: if (PR2L == 20)
		LDR 	11H,0 			//04A3 	0811
		ORG		04A4H
		XORWI 	14H 			//04A4 	2614
		BTSS 	STATUS,2 		//04A5 	1D03
		LJUMP 	4A9H 			//04A6 	3CA9

		//;smartkey.C: 117: PR2L = 25;
		LDWI 	19H 			//04A7 	2A19
		LJUMP 	4AAH 			//04A8 	3CAA

		//;smartkey.C: 118: else
		//;smartkey.C: 119: PR2L = 20;
		LDWI 	14H 			//04A9 	2A14
		STR 	11H 			//04AA 	0191

		//;smartkey.C: 120: TMR2IE = 1;
		BSR 	CH,1 			//04AB 	188C
		ORG		04ACH

		//;smartkey.C: 121: }
		//;smartkey.C: 122: }
		//;smartkey.C: 123: }
		//;smartkey.C: 124: }
		//;smartkey.C: 127: if (TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//04AC 	1A83
		BTSS 	CH,1 			//04AD 	1C8C
		LJUMP 	4B5H 			//04AE 	3CB5
		BCR 	STATUS,5 		//04AF 	1283
		BTSS 	CH,1 			//04B0 	1C8C
		LJUMP 	4B5H 			//04B1 	3CB5
		LDWI 	8H 			//04B2 	2A08

		//;smartkey.C: 128: {
		//;smartkey.C: 129: TMR2IF = 0;
		BCR 	CH,1 			//04B3 	108C
		ORG		04B4H

		//;smartkey.C: 130: RA3 = ~ RA3;
		XORWR 	5H,1 			//04B4 	0485
		LDR 	78H,0 			//04B5 	0878
		STR 	PCLATH 			//04B6 	018A
		SWAPR 	77H,0 			//04B7 	0777
		STR 	STATUS 			//04B8 	0183
		SWAPR 	7EH,1 			//04B9 	07FE
		SWAPR 	7EH,0 			//04BA 	077E
		RETI		 			//04BB 	0009
		ORG		04BCH
		CLRR 	25H 			//04BC 	0125
		BTSS 	21H,7 			//04BD 	1FA1
		LJUMP 	4C6H 			//04BE 	3CC6
		COMR 	20H,1 			//04BF 	0FA0
		COMR 	21H,1 			//04C0 	0FA1
		INCR	20H,1 			//04C1 	09A0
		BTSC 	STATUS,2 		//04C2 	1503
		INCR	21H,1 			//04C3 	09A1
		ORG		04C4H
		CLRR 	25H 			//04C4 	0125
		INCR	25H,1 			//04C5 	09A5
		BTSS 	23H,7 			//04C6 	1FA3
		LJUMP 	4CFH 			//04C7 	3CCF
		COMR 	22H,1 			//04C8 	0FA2
		COMR 	23H,1 			//04C9 	0FA3
		INCR	22H,1 			//04CA 	09A2
		BTSC 	STATUS,2 		//04CB 	1503
		ORG		04CCH
		INCR	23H,1 			//04CC 	09A3
		LDWI 	1H 			//04CD 	2A01
		XORWR 	25H,1 			//04CE 	04A5
		CLRR 	26H 			//04CF 	0126
		CLRR 	27H 			//04D0 	0127
		LDR 	21H,0 			//04D1 	0821
		IORWR 	20H,0 			//04D2 	0320
		BTSC 	STATUS,2 		//04D3 	1503
		ORG		04D4H
		LJUMP 	4F4H 			//04D4 	3CF4
		CLRR 	24H 			//04D5 	0124
		INCR	24H,1 			//04D6 	09A4
		BTSC 	21H,7 			//04D7 	17A1
		LJUMP 	4DDH 			//04D8 	3CDD
		BCR 	STATUS,0 		//04D9 	1003
		RLR 	20H,1 			//04DA 	05A0
		RLR 	21H,1 			//04DB 	05A1
		ORG		04DCH
		LJUMP 	4D6H 			//04DC 	3CD6
		BCR 	STATUS,0 		//04DD 	1003
		RLR 	26H,1 			//04DE 	05A6
		RLR 	27H,1 			//04DF 	05A7
		LDR 	21H,0 			//04E0 	0821
		SUBWR 	23H,0 			//04E1 	0C23
		BTSS 	STATUS,2 		//04E2 	1D03
		LJUMP 	4E6H 			//04E3 	3CE6
		ORG		04E4H
		LDR 	20H,0 			//04E4 	0820
		SUBWR 	22H,0 			//04E5 	0C22
		BTSS 	STATUS,0 		//04E6 	1C03
		LJUMP 	4F0H 			//04E7 	3CF0
		LDR 	20H,0 			//04E8 	0820
		SUBWR 	22H,1 			//04E9 	0CA2
		LDR 	21H,0 			//04EA 	0821
		BTSS 	STATUS,0 		//04EB 	1C03
		ORG		04ECH
		DECR 	23H,1 			//04EC 	0DA3
		SUBWR 	23H,1 			//04ED 	0CA3
		BSR 	26H,0 			//04EE 	1826
		BCR 	STATUS,0 		//04EF 	1003
		RRR	21H,1 			//04F0 	06A1
		RRR	20H,1 			//04F1 	06A0
		DECRSZ 	24H,1 		//04F2 	0EA4
		LJUMP 	4DDH 			//04F3 	3CDD
		ORG		04F4H
		LDR 	25H,0 			//04F4 	0825
		BTSC 	STATUS,2 		//04F5 	1503
		LJUMP 	4FCH 			//04F6 	3CFC
		COMR 	26H,1 			//04F7 	0FA6
		COMR 	27H,1 			//04F8 	0FA7
		INCR	26H,1 			//04F9 	09A6
		BTSC 	STATUS,2 		//04FA 	1503
		INCR	27H,1 			//04FB 	09A7
		ORG		04FCH
		LDR 	27H,0 			//04FC 	0827
		STR 	21H 			//04FD 	01A1
		LDR 	26H,0 			//04FE 	0826
		STR 	20H 			//04FF 	01A0
		RET		 					//0500 	0004
		STR 	27H 			//0501 	01A7

		//;smartkey.C: 192: if (a > b) {
		LDR 	20H,0 			//0502 	0820
		XORWI 	80H 			//0503 	2680
		ORG		0504H
		STR 	22H 			//0504 	01A2
		LDR 	27H,0 			//0505 	0827
		XORWI 	80H 			//0506 	2680
		SUBWR 	22H,1 			//0507 	0CA2
		BTSC 	STATUS,0 		//0508 	1403
		LJUMP 	52DH 			//0509 	3D2D

		//;smartkey.C: 193: if ((a - b) <= dt) return 1;
		LDR 	20H,0 			//050A 	0820
		SUBWR 	27H,0 			//050B 	0C27
		ORG		050CH
		STR 	22H 			//050C 	01A2
		CLRR 	23H 			//050D 	0123
		BTSS 	STATUS,0 		//050E 	1C03
		DECR 	23H,1 			//050F 	0DA3
		BTSC 	27H,7 			//0510 	17A7
		DECR 	23H,1 			//0511 	0DA3
		BTSC 	20H,7 			//0512 	17A0
		INCR	23H,1 			//0513 	09A3
		ORG		0514H
		BCR 	STATUS,5 		//0514 	1283
		LCALL 	53AH 			//0515 	353A
		BTSS 	STATUS,2 		//0516 	1D03
		LJUMP 	51AH 			//0517 	3D1A
		LDR 	22H,0 			//0518 	0822
		SUBWR 	24H,0 			//0519 	0C24
		BTSS 	STATUS,0 		//051A 	1C03
		RETW 	0H 			//051B 	2100
		ORG		051CH
		RETW 	1H 			//051C 	2101

		//;smartkey.C: 197: if ((b - a) <= dt) return 1;
		SUBWR 	20H,0 			//051D 	0C20
		STR 	22H 			//051E 	01A2
		CLRR 	23H 			//051F 	0123
		BTSS 	STATUS,0 		//0520 	1C03
		DECR 	23H,1 			//0521 	0DA3
		BTSC 	20H,7 			//0522 	17A0
		DECR 	23H,1 			//0523 	0DA3
		ORG		0524H
		BTSC 	27H,7 			//0524 	17A7
		INCR	23H,1 			//0525 	09A3
		BCR 	STATUS,5 		//0526 	1283
		LCALL 	53AH 			//0527 	353A
		BTSS 	STATUS,2 		//0528 	1D03
		LJUMP 	51AH 			//0529 	3D1A
		LDR 	22H,0 			//052A 	0822
		SUBWR 	24H,0 			//052B 	0C24
		ORG		052CH
		LJUMP 	51AH 			//052C 	3D1A

		//;smartkey.C: 194: else return 0;
		//;smartkey.C: 196: else if (a < b) {
		LDR 	27H,0 			//052D 	0827
		XORWI 	80H 			//052E 	2680
		STR 	22H 			//052F 	01A2
		LDR 	20H,0 			//0530 	0820
		XORWI 	80H 			//0531 	2680
		SUBWR 	22H,1 			//0532 	0CA2

		//;smartkey.C: 200: else if (a == b) {
		LDR 	27H,0 			//0533 	0827
		ORG		0534H
		BTSS 	STATUS,0 		//0534 	1C03
		LJUMP 	51DH 			//0535 	3D1D
		XORWR 	20H,0 			//0536 	0420
		BTSC 	STATUS,2 		//0537 	1503
		RETW 	1H 			//0538 	2101
		RETW 	0H 			//0539 	2100
		LDR 	21H,0 			//053A 	0821
		STR 	24H 			//053B 	01A4
		ORG		053CH
		CLRR 	25H 			//053C 	0125
		BTSC 	24H,7 			//053D 	17A4
		DECR 	25H,1 			//053E 	0DA5
		LDR 	25H,0 			//053F 	0825
		XORWI 	80H 			//0540 	2680
		STR 	26H 			//0541 	01A6
		LDR 	23H,0 			//0542 	0823
		XORWI 	80H 			//0543 	2680
		ORG		0544H
		SUBWR 	26H,0 			//0544 	0C26
		RET		 					//0545 	0004

		//;mpu6x.c: 24: else
		//;mpu6x.c: 25: return 1;
		//;mpu6x.c: 21: else
		//;mpu6x.c: 22: return 2;
		BCR 	STATUS,5 		//0546 	1283
		STR 	21H 			//0547 	01A1
		CLRR 	22H 			//0548 	0122

		//;SWI2C.C: 115: RA7 = 0;
		BCR 	5H,7 			//0549 	1385

		//;SWI2C.C: 116: TRISA |=0x40;;
		BSR 	STATUS,5 		//054A 	1A83
		BSR 	5H,6 			//054B 	1B05
		ORG		054CH

		//;SWI2C.C: 117: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//054C 	2A05
		BCR 	STATUS,5 		//054D 	1283
		STR 	20H 			//054E 	01A0
		DECRSZ 	20H,1 		//054F 	0EA0
		LJUMP 	54FH 			//0550 	3D4F

		//;SWI2C.C: 118: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//0551 	1283
		CLRR 	23H 			//0552 	0123
		LDWI 	5H 			//0553 	2A05
		ORG		0554H

		//;SWI2C.C: 119: {
		//;SWI2C.C: 120: RA7 = 1;
		BSR 	5H,7 			//0554 	1B85

		//;SWI2C.C: 121: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0555 	01A0
		DECRSZ 	20H,1 		//0556 	0EA0
		LJUMP 	556H 			//0557 	3D56

		//;SWI2C.C: 122: dat = dat<<1 |(RA6 & 1 );
		LDWI 	0H 			//0558 	2A00
		BCR 	STATUS,5 		//0559 	1283
		BTSC 	5H,6 			//055A 	1705
		LDWI 	1H 			//055B 	2A01
		ORG		055CH
		ANDWI 	1H 			//055C 	2401
		STR 	20H 			//055D 	01A0
		BCR 	STATUS,0 		//055E 	1003
		RLR 	22H,0 			//055F 	0522
		IORWR 	20H,0 			//0560 	0320
		STR 	22H 			//0561 	01A2
		LDWI 	5H 			//0562 	2A05

		//;SWI2C.C: 125: RA7 = 0;
		BCR 	5H,7 			//0563 	1385
		ORG		0564H

		//;SWI2C.C: 126: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0564 	01A0
		DECRSZ 	20H,1 		//0565 	0EA0
		LJUMP 	565H 			//0566 	3D65
		LDWI 	8H 			//0567 	2A08
		BCR 	STATUS,5 		//0568 	1283
		INCR	23H,1 			//0569 	09A3
		SUBWR 	23H,0 			//056A 	0C23
		BTSS 	STATUS,0 		//056B 	1C03
		ORG		056CH
		LJUMP 	553H 			//056C 	3D53

		//;SWI2C.C: 127: }
		//;SWI2C.C: 129: TRISA &=0xbf;;
		BSR 	STATUS,5 		//056D 	1A83
		BCR 	5H,6 			//056E 	1305

		//;SWI2C.C: 131: RA6 = (Ack) ? 0 : 1;
		BCR 	STATUS,5 		//056F 	1283
		LDR 	21H,1 			//0570 	08A1
		BCR 	STATUS,5 		//0571 	1283
		BTSS 	STATUS,2 		//0572 	1D03
		LJUMP 	576H 			//0573 	3D76
		ORG		0574H
		BSR 	5H,6 			//0574 	1B05
		LJUMP 	577H 			//0575 	3D77
		BCR 	5H,6 			//0576 	1305
		LDWI 	5H 			//0577 	2A05

		//;SWI2C.C: 132: RA7 = 1;
		BSR 	5H,7 			//0578 	1B85

		//;SWI2C.C: 133: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0579 	01A0
		DECRSZ 	20H,1 		//057A 	0EA0
		LJUMP 	57AH 			//057B 	3D7A
		ORG		057CH
		LDWI 	5H 			//057C 	2A05

		//;SWI2C.C: 134: RA7 = 0;
		BCR 	STATUS,5 		//057D 	1283
		BCR 	5H,7 			//057E 	1385

		//;SWI2C.C: 135: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//057F 	01A0
		DECRSZ 	20H,1 		//0580 	0EA0
		LJUMP 	580H 			//0581 	3D80

		//;SWI2C.C: 136: return dat;
		BCR 	STATUS,5 		//0582 	1283
		LDR 	22H,0 			//0583 	0822
		ORG		0584H
		RET		 					//0584 	0004
		BCR 	STATUS,5 		//0585 	1283
		STR 	21H 			//0586 	01A1

		//;SWI2C.C: 89: TRISA &=0xbf;;
		BSR 	STATUS,5 		//0587 	1A83
		BCR 	5H,6 			//0588 	1305

		//;SWI2C.C: 90: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0589 	2A05
		BCR 	STATUS,5 		//058A 	1283
		STR 	20H 			//058B 	01A0
		ORG		058CH
		DECRSZ 	20H,1 		//058C 	0EA0
		LJUMP 	58CH 			//058D 	3D8C

		//;SWI2C.C: 91: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//058E 	1283
		CLRR 	22H 			//058F 	0122

		//;SWI2C.C: 92: {
		//;SWI2C.C: 93: RA6 = (dat&0x80) ? 1:0;
		BTSS 	21H,7 			//0590 	1FA1
		LJUMP 	595H 			//0591 	3D95
		BCR 	STATUS,5 		//0592 	1283
		BSR 	5H,6 			//0593 	1B05
		ORG		0594H
		LJUMP 	597H 			//0594 	3D97
		BCR 	STATUS,5 		//0595 	1283
		BCR 	5H,6 			//0596 	1305
		LDWI 	5H 			//0597 	2A05

		//;SWI2C.C: 94: dat<<=1;
		BCR 	STATUS,0 		//0598 	1003
		RLR 	21H,1 			//0599 	05A1

		//;SWI2C.C: 95: RA7 = 1;
		BSR 	5H,7 			//059A 	1B85

		//;SWI2C.C: 96: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//059B 	01A0
		ORG		059CH
		DECRSZ 	20H,1 		//059C 	0EA0
		LJUMP 	59CH 			//059D 	3D9C
		LDWI 	5H 			//059E 	2A05

		//;SWI2C.C: 97: RA7 = 0;
		BCR 	STATUS,5 		//059F 	1283
		BCR 	5H,7 			//05A0 	1385

		//;SWI2C.C: 98: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05A1 	01A0
		DECRSZ 	20H,1 		//05A2 	0EA0
		LJUMP 	5A2H 			//05A3 	3DA2
		ORG		05A4H
		LDWI 	8H 			//05A4 	2A08
		BCR 	STATUS,5 		//05A5 	1283
		INCR	22H,1 			//05A6 	09A2
		SUBWR 	22H,0 			//05A7 	0C22
		BTSS 	STATUS,0 		//05A8 	1C03
		LJUMP 	590H 			//05A9 	3D90

		//;SWI2C.C: 99: }
		//;SWI2C.C: 101: TRISA |=0x40;;
		BSR 	STATUS,5 		//05AA 	1A83
		BSR 	5H,6 			//05AB 	1B05
		ORG		05ACH

		//;SWI2C.C: 102: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05AC 	2A05
		BCR 	STATUS,5 		//05AD 	1283
		STR 	20H 			//05AE 	01A0
		DECRSZ 	20H,1 		//05AF 	0EA0
		LJUMP 	5AFH 			//05B0 	3DAF
		LDWI 	5H 			//05B1 	2A05

		//;SWI2C.C: 103: RA7 = 1;
		BCR 	STATUS,5 		//05B2 	1283
		BSR 	5H,7 			//05B3 	1B85
		ORG		05B4H

		//;SWI2C.C: 104: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05B4 	01A0
		DECRSZ 	20H,1 		//05B5 	0EA0
		LJUMP 	5B5H 			//05B6 	3DB5

		//;SWI2C.C: 105: i= RA6;
		LDWI 	0H 			//05B7 	2A00
		BCR 	STATUS,5 		//05B8 	1283
		BTSC 	5H,6 			//05B9 	1705
		LDWI 	1H 			//05BA 	2A01
		STR 	22H 			//05BB 	01A2
		ORG		05BCH

		//;SWI2C.C: 106: RA7 = 0;
		BCR 	5H,7 			//05BC 	1385

		//;SWI2C.C: 107: TRISA &=0xbf;;
		BSR 	STATUS,5 		//05BD 	1A83
		BCR 	5H,6 			//05BE 	1305

		//;SWI2C.C: 108: return i;
		BCR 	STATUS,5 		//05BF 	1283
		LDR 	22H,0 			//05C0 	0822
		RET		 					//05C1 	0004
		STR 	2AH 			//05C2 	01AA

		//;mpu6x.c: 32: unsigned char i;
		//;mpu6x.c: 34: swI2C_Start();
		LCALL 	6BEH 			//05C3 	36BE
		ORG		05C4H

		//;mpu6x.c: 36: if(swI2C_WriteByte(0x18<<1)== 0 )
		LDWI 	30H 			//05C4 	2A30
		LCALL 	585H 			//05C5 	3585
		IORWI 	0H 			//05C6 	2500
		BTSS 	STATUS,2 		//05C7 	1D03
		RETW 	1H 			//05C8 	2101

		//;mpu6x.c: 37: {
		//;mpu6x.c: 38: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	2AH,0 			//05C9 	082A
		LCALL 	585H 			//05CA 	3585
		IORWI 	0H 			//05CB 	2500
		ORG		05CCH
		BTSS 	STATUS,2 		//05CC 	1D03
		RETW 	2H 			//05CD 	2102

		//;mpu6x.c: 39: {
		//;mpu6x.c: 40: swI2C_Start();
		LCALL 	6BEH 			//05CE 	36BE

		//;mpu6x.c: 41: if(swI2C_WriteByte((0x18<<1)|1)== 0 ){
		LDWI 	31H 			//05CF 	2A31
		LCALL 	585H 			//05D0 	3585
		IORWI 	0H 			//05D1 	2500
		BTSS 	STATUS,2 		//05D2 	1D03
		RETW 	1H 			//05D3 	2101
		ORG		05D4H

		//;mpu6x.c: 43: for(i=0; i<(len-1);i++){
		CLRR 	2BH 			//05D4 	012B
		LDR 	26H,0 			//05D5 	0826
		ADDWI 	FFH 			//05D6 	27FF
		STR 	27H 			//05D7 	01A7
		LDWI 	FFH 			//05D8 	2AFF
		BTSC 	STATUS,0 		//05D9 	1403
		LDWI 	0H 			//05DA 	2A00
		STR 	28H 			//05DB 	01A8
		ORG		05DCH
		XORWI 	80H 			//05DC 	2680
		SUBWI 	80H 			//05DD 	2880
		BTSS 	STATUS,2 		//05DE 	1D03
		LJUMP 	5E2H 			//05DF 	3DE2
		LDR 	27H,0 			//05E0 	0827
		SUBWR 	2BH,0 			//05E1 	0C2B

		//;mpu6x.c: 44: dat[i]=swI2C_ReadByte(1);
		LDWI 	1H 			//05E2 	2A01
		BTSC 	STATUS,0 		//05E3 	1403
		ORG		05E4H
		LJUMP 	5E9H 			//05E4 	3DE9
		LCALL 	546H 			//05E5 	3546
		LCALL 	5EDH 			//05E6 	35ED
		INCR	2BH,1 			//05E7 	09AB
		LJUMP 	5D5H 			//05E8 	3DD5

		//;mpu6x.c: 45: }
		//;mpu6x.c: 46: dat[i]=swI2C_ReadByte(1);
		LCALL 	546H 			//05E9 	3546
		LCALL 	5EDH 			//05EA 	35ED

		//;mpu6x.c: 47: swI2C_Stop();
		LCALL 	701H 			//05EB 	3701
		ORG		05ECH

		//;mpu6x.c: 48: return 0;
		RETW 	0H 			//05EC 	2100

		//;mpu6x.c: 54: else
		//;mpu6x.c: 55: return 2;
		//;mpu6x.c: 51: else
		//;mpu6x.c: 52: return 1;
		STR 	27H 			//05ED 	01A7
		LDR 	2BH,0 			//05EE 	082B
		ADDWR 	24H,0 			//05EF 	0B24
		STR 	28H 			//05F0 	01A8
		LDR 	25H,0 			//05F1 	0825
		BTSC 	STATUS,0 		//05F2 	1403
		ADDWI 	1H 			//05F3 	2701
		ORG		05F4H
		STR 	29H 			//05F4 	01A9
		LDR 	28H,0 			//05F5 	0828
		STR 	FSR 			//05F6 	0184
		BCR 	STATUS,7 		//05F7 	1383
		BTSC 	29H,0 			//05F8 	1429
		BSR 	STATUS,7 		//05F9 	1B83
		LDR 	27H,0 			//05FA 	0827
		STR 	INDF 			//05FB 	0180
		ORG		05FCH
		RET		 					//05FC 	0004
		STR 	28H 			//05FD 	01A8

		//;mpu6x.c: 5: unsigned char i;
		//;mpu6x.c: 6: swI2C_Start();
		LCALL 	6BEH 			//05FE 	36BE

		//;mpu6x.c: 8: if(swI2C_WriteByte(0x18<<1)== 0 )
		LDWI 	30H 			//05FF 	2A30
		LCALL 	585H 			//0600 	3585
		IORWI 	0H 			//0601 	2500
		BTSS 	STATUS,2 		//0602 	1D03
		RETW 	1H 			//0603 	2101
		ORG		0604H

		//;mpu6x.c: 9: {
		//;mpu6x.c: 10: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	28H,0 			//0604 	0828
		LCALL 	585H 			//0605 	3585
		IORWI 	0H 			//0606 	2500
		BTSS 	STATUS,2 		//0607 	1D03
		RETW 	2H 			//0608 	2102

		//;mpu6x.c: 11: {
		//;mpu6x.c: 12: for(i=0; i<len;i++){
		CLRR 	29H 			//0609 	0129
		LDR 	25H,0 			//060A 	0825
		SUBWR 	29H,0 			//060B 	0C29
		ORG		060CH
		BTSC 	STATUS,0 		//060C 	1403
		LJUMP 	623H 			//060D 	3E23

		//;mpu6x.c: 13: if(swI2C_WriteByte(dat[i])==1 ){
		LDR 	29H,0 			//060E 	0829
		ADDWR 	23H,0 			//060F 	0B23
		STR 	26H 			//0610 	01A6
		LDR 	24H,0 			//0611 	0824
		BTSC 	STATUS,0 		//0612 	1403
		ADDWI 	1H 			//0613 	2701
		ORG		0614H
		STR 	27H 			//0614 	01A7
		LDR 	26H,0 			//0615 	0826
		STR 	FSR 			//0616 	0184
		BSR 	STATUS,7 		//0617 	1B83
		BTSS 	27H,0 			//0618 	1C27
		BCR 	STATUS,7 		//0619 	1383
		LDR 	INDF,0 			//061A 	0800
		LCALL 	585H 			//061B 	3585
		ORG		061CH
		XORWI 	1H 			//061C 	2601
		BTSS 	STATUS,2 		//061D 	1D03
		LJUMP 	621H 			//061E 	3E21

		//;mpu6x.c: 14: swI2C_Stop();
		LCALL 	701H 			//061F 	3701

		//;mpu6x.c: 15: return 3;
		RETW 	3H 			//0620 	2103
		INCR	29H,1 			//0621 	09A9
		LJUMP 	60AH 			//0622 	3E0A

		//;mpu6x.c: 16: }
		//;mpu6x.c: 17: }
		//;mpu6x.c: 18: swI2C_Stop();
		LCALL 	701H 			//0623 	3701
		ORG		0624H

		//;mpu6x.c: 19: return 0;
		RETW 	0H 			//0624 	2100

		//;SWI2C.C: 10: TRISA &=0xbf;;
		BSR 	STATUS,5 		//0625 	1A83
		BCR 	5H,6 			//0626 	1305

		//;SWI2C.C: 11: TRISA &=0x7f;;
		BCR 	5H,7 			//0627 	1385

		//;SWI2C.C: 12: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0628 	2A05
		BCR 	STATUS,5 		//0629 	1283
		STR 	20H 			//062A 	01A0
		DECRSZ 	20H,1 		//062B 	0EA0
		ORG		062CH
		LJUMP 	62BH 			//062C 	3E2B
		LDWI 	5H 			//062D 	2A05

		//;SWI2C.C: 13: RA7 = 1;
		BCR 	STATUS,5 		//062E 	1283
		BSR 	5H,7 			//062F 	1B85
		BSR 	5H,6 			//0630 	1B05

		//;SWI2C.C: 15: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0631 	01A0
		DECRSZ 	20H,1 		//0632 	0EA0
		LJUMP 	632H 			//0633 	3E32
		ORG		0634H

		//;SWI2C.C: 16: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0634 	2A05
		BCR 	STATUS,5 		//0635 	1283
		STR 	20H 			//0636 	01A0
		DECRSZ 	20H,1 		//0637 	0EA0
		LJUMP 	637H 			//0638 	3E37

		//;SWI2C.C: 17: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0639 	2A05
		BCR 	STATUS,5 		//063A 	1283
		STR 	20H 			//063B 	01A0
		ORG		063CH
		DECRSZ 	20H,1 		//063C 	0EA0
		LJUMP 	63CH 			//063D 	3E3C

		//;SWI2C.C: 18: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//063E 	2A05
		BCR 	STATUS,5 		//063F 	1283
		STR 	20H 			//0640 	01A0
		DECRSZ 	20H,1 		//0641 	0EA0
		LJUMP 	641H 			//0642 	3E41
		RET		 					//0643 	0004
		ORG		0644H

		//;sysinit.c: 88: INTCON = 0B00000000;
		CLRR 	INTCON 			//0644 	010B

		//;sysinit.c: 89: PIE1 = 0B00000000;
		BSR 	STATUS,5 		//0645 	1A83
		CLRR 	CH 			//0646 	010C

		//;sysinit.c: 90: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//0647 	1283
		CLRR 	CH 			//0648 	010C

		//;sysinit.c: 92: IOCA5 = 1;
		BSR 	STATUS,5 		//0649 	1A83
		BSR 	16H,5 			//064A 	1A96

		//;sysinit.c: 93: tmp = PORTA;
		BCR 	STATUS,5 		//064B 	1283
		ORG		064CH
		LDR 	5H,0 			//064C 	0805

		//;sysinit.c: 94: PAIF = 0;
		BCR 	INTCON,0 		//064D 	100B

		//;sysinit.c: 95: PAIE = 0;
		BCR 	INTCON,3 		//064E 	118B

		//;sysinit.c: 98: INTEDG = 0;
		BSR 	STATUS,5 		//064F 	1A83
		BCR 	1H,6 			//0650 	1301

		//;sysinit.c: 99: INTF = 0;
		BCR 	INTCON,1 		//0651 	108B

		//;sysinit.c: 100: INTE = 1;
		BSR 	INTCON,4 		//0652 	1A0B

		//;sysinit.c: 102: TMR2IF = 0;
		BCR 	STATUS,5 		//0653 	1283
		ORG		0654H
		BCR 	CH,1 			//0654 	108C

		//;sysinit.c: 103: TMR2IE = 1;
		BSR 	STATUS,5 		//0655 	1A83
		BSR 	CH,1 			//0656 	188C

		//;sysinit.c: 104: TMR2ON = 0;
		BCR 	STATUS,5 		//0657 	1283
		BCR 	12H,2 			//0658 	1112

		//;sysinit.c: 110: T0IF = 0;
		BCR 	INTCON,2 		//0659 	110B

		//;sysinit.c: 111: T0IE = 1;
		BSR 	INTCON,5 		//065A 	1A8B

		//;sysinit.c: 112: T0ON = 1;
		BSR 	1FH,3 			//065B 	199F
		ORG		065CH

		//;sysinit.c: 114: PEIE = 1;
		BSR 	INTCON,6 		//065C 	1B0B

		//;sysinit.c: 116: GIE = 1;
		BSR 	INTCON,7 		//065D 	1B8B
		RET		 					//065E 	0004
		STR 	21H 			//065F 	01A1

		//;smartkey.C: 173: GIE = 0;
		BCR 	INTCON,7 		//0660 	138B

		//;smartkey.C: 174: while (GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//0661 	1F8B
		LJUMP 	665H 			//0662 	3E65
		CLRWDT	 			//0663 	0001
		ORG		0664H
		LJUMP 	661H 			//0664 	3E61

		//;smartkey.C: 175: EEADR = EEAddr;
		BCR 	STATUS,5 		//0665 	1283
		LDR 	21H,0 			//0666 	0821
		BSR 	STATUS,5 		//0667 	1A83
		STR 	1BH 			//0668 	019B

		//;smartkey.C: 176: EEDAT = EEData;
		BCR 	STATUS,5 		//0669 	1283
		LDR 	20H,0 			//066A 	0820
		BSR 	STATUS,5 		//066B 	1A83
		ORG		066CH
		STR 	1AH 			//066C 	019A
		LDWI 	34H 			//066D 	2A34

		//;smartkey.C: 177: EEIF = 0;
		BCR 	STATUS,5 		//066E 	1283
		BCR 	CH,7 			//066F 	138C

		//;smartkey.C: 178: EECON1 = 0x34;
		BSR 	STATUS,5 		//0670 	1A83
		STR 	1CH 			//0671 	019C

		//;smartkey.C: 179: WR = 1;
		BSR 	1DH,0 			//0672 	181D

		//;smartkey.C: 180: while (WR) asm("clrwdt");
		BSR 	STATUS,5 		//0673 	1A83
		ORG		0674H
		BTSS 	1DH,0 			//0674 	1C1D
		LJUMP 	678H 			//0675 	3E78
		CLRWDT	 			//0676 	0001
		LJUMP 	673H 			//0677 	3E73

		//;smartkey.C: 181: GIE = 1;
		BSR 	INTCON,7 		//0678 	1B8B
		RET		 					//0679 	0004
		STR 	76H 			//067A 	01F6

		//;smartkey.C: 173: GIE = 0;
		BCR 	INTCON,7 		//067B 	138B
		ORG		067CH

		//;smartkey.C: 174: while (GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//067C 	1F8B
		LJUMP 	680H 			//067D 	3E80
		CLRWDT	 			//067E 	0001
		LJUMP 	67CH 			//067F 	3E7C

		//;smartkey.C: 175: EEADR = EEAddr;
		LDR 	76H,0 			//0680 	0876
		BSR 	STATUS,5 		//0681 	1A83
		STR 	1BH 			//0682 	019B

		//;smartkey.C: 176: EEDAT = EEData;
		LDR 	75H,0 			//0683 	0875
		ORG		0684H
		STR 	1AH 			//0684 	019A
		LDWI 	34H 			//0685 	2A34

		//;smartkey.C: 177: EEIF = 0;
		BCR 	STATUS,5 		//0686 	1283
		BCR 	CH,7 			//0687 	138C

		//;smartkey.C: 178: EECON1 = 0x34;
		BSR 	STATUS,5 		//0688 	1A83
		STR 	1CH 			//0689 	019C

		//;smartkey.C: 179: WR = 1;
		BSR 	1DH,0 			//068A 	181D

		//;smartkey.C: 180: while (WR) asm("clrwdt");
		BSR 	STATUS,5 		//068B 	1A83
		ORG		068CH
		BTSS 	1DH,0 			//068C 	1C1D
		LJUMP 	690H 			//068D 	3E90
		CLRWDT	 			//068E 	0001
		LJUMP 	68BH 			//068F 	3E8B

		//;smartkey.C: 181: GIE = 1;
		BSR 	INTCON,7 		//0690 	1B8B
		RET		 					//0691 	0004
		STR 	25H 			//0692 	01A5

		//;smartkey.C: 147: {
		//;smartkey.C: 148: while (rep--) {
		DECR 	24H,1 			//0693 	0DA4
		ORG		0694H
		LDR 	24H,0 			//0694 	0824
		XORWI 	FFH 			//0695 	26FF
		BTSC 	STATUS,2 		//0696 	1503
		RET		 					//0697 	0004
		LDWI 	CH 			//0698 	2A0C

		//;smartkey.C: 149: TMR2ON = 1;
		BSR 	12H,2 			//0699 	1912

		//;smartkey.C: 150: PR2L = 12;
		BSR 	STATUS,5 		//069A 	1A83
		STR 	11H 			//069B 	0191
		ORG		069CH

		//;smartkey.C: 151: delay_x10ms(delay);
		BCR 	STATUS,5 		//069C 	1283
		LDR 	25H,0 			//069D 	0825
		STR 	20H 			//069E 	01A0
		CLRR 	21H 			//069F 	0121
		LCALL 	6D1H 			//06A0 	36D1
		LDWI 	14H 			//06A1 	2A14

		//;smartkey.C: 153: TMR2ON = 0; RA3 = 0;
		BCR 	12H,2 			//06A2 	1112
		BCR 	5H,3 			//06A3 	1185
		ORG		06A4H

		//;smartkey.C: 154: delay_x10ms(20);
		STR 	20H 			//06A4 	01A0
		CLRR 	21H 			//06A5 	0121
		LCALL 	6D1H 			//06A6 	36D1
		LJUMP 	693H 			//06A7 	3E93

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//06A8 	1283
		CLRR 	5H 			//06A9 	0105

		//;sysinit.c: 35: TRISA = 0B00110111;
		LDWI 	37H 			//06AA 	2A37
		BSR 	STATUS,5 		//06AB 	1A83
		ORG		06ACH
		STR 	5H 			//06AC 	0185

		//;sysinit.c: 36: WPUA = 0B11000000;
		LDWI 	C0H 			//06AD 	2AC0
		STR 	15H 			//06AE 	0195

		//;sysinit.c: 38: PORTC = 0B00000000;
		BCR 	STATUS,5 		//06AF 	1283
		CLRR 	7H 			//06B0 	0107

		//;sysinit.c: 39: TRISC = 0B11111100;
		LDWI 	FCH 			//06B1 	2AFC
		BSR 	STATUS,5 		//06B2 	1A83
		STR 	7H 			//06B3 	0187
		ORG		06B4H

		//;sysinit.c: 40: WPUC = 0B00000000;
		CLRR 	13H 			//06B4 	0113

		//;sysinit.c: 42: PSRCA = 0B11111111;
		LDWI 	FFH 			//06B5 	2AFF
		STR 	8H 			//06B6 	0188

		//;sysinit.c: 43: PSRCC = 0B11111111;
		STR 	14H 			//06B7 	0194

		//;sysinit.c: 44: PSINKA = 0B11111111;
		STR 	17H 			//06B8 	0197

		//;sysinit.c: 45: PSINKC = 0B11111111;
		STR 	1FH 			//06B9 	019F

		//;sysinit.c: 47: MSCON = 0B00110000;
		LDWI 	30H 			//06BA 	2A30
		BCR 	STATUS,5 		//06BB 	1283
		ORG		06BCH
		STR 	1BH 			//06BC 	019B
		RET		 					//06BD 	0004
		LDWI 	5H 			//06BE 	2A05

		//;SWI2C.C: 24: RA7 = 1;
		BSR 	5H,7 			//06BF 	1B85

		//;SWI2C.C: 26: RA6 = 1;
		BSR 	5H,6 			//06C0 	1B05

		//;SWI2C.C: 27: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//06C1 	01A0
		DECRSZ 	20H,1 		//06C2 	0EA0
		LJUMP 	6C2H 			//06C3 	3EC2
		ORG		06C4H
		LDWI 	5H 			//06C4 	2A05

		//;SWI2C.C: 28: RA6 = 0;
		BCR 	STATUS,5 		//06C5 	1283
		BCR 	5H,6 			//06C6 	1305

		//;SWI2C.C: 29: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//06C7 	01A0
		DECRSZ 	20H,1 		//06C8 	0EA0
		LJUMP 	6C8H 			//06C9 	3EC8
		LDWI 	5H 			//06CA 	2A05

		//;SWI2C.C: 30: RA7 = 0;
		BCR 	STATUS,5 		//06CB 	1283
		ORG		06CCH
		BCR 	5H,7 			//06CC 	1385

		//;SWI2C.C: 31: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//06CD 	01A0
		DECRSZ 	20H,1 		//06CE 	0EA0
		LJUMP 	6CEH 			//06CF 	3ECE
		RET		 					//06D0 	0004

		//;smartkey.C: 135: unsigned int set = t + timeTick;
		LDR 	21H,0 			//06D1 	0821
		STR 	23H 			//06D2 	01A3
		LDR 	20H,0 			//06D3 	0820
		ORG		06D4H
		STR 	22H 			//06D4 	01A2
		LDR 	70H,0 			//06D5 	0870
		ADDWR 	22H,1 			//06D6 	0BA2
		BTSC 	STATUS,0 		//06D7 	1403
		INCR	23H,1 			//06D8 	09A3
		LDR 	71H,0 			//06D9 	0871
		ADDWR 	23H,1 			//06DA 	0BA3

		//;smartkey.C: 136: while (timeTick < set);
		LDR 	23H,0 			//06DB 	0823
		ORG		06DCH
		SUBWR 	71H,0 			//06DC 	0C71
		BTSS 	STATUS,2 		//06DD 	1D03
		LJUMP 	6E1H 			//06DE 	3EE1
		LDR 	22H,0 			//06DF 	0822
		SUBWR 	70H,0 			//06E0 	0C70
		BTSC 	STATUS,0 		//06E1 	1403
		RET		 					//06E2 	0004
		LJUMP 	6DBH 			//06E3 	3EDB
		ORG		06E4H

		//;sysinit.c: 60: T0CON0 = 0B00000000;
		CLRR 	1FH 			//06E4 	011F

		//;sysinit.c: 61: OPTION = 0B00000111;
		LDWI 	7H 			//06E5 	2A07
		BSR 	STATUS,5 		//06E6 	1A83
		STR 	1H 			//06E7 	0181

		//;sysinit.c: 62: TMR0 = 179;
		LDWI 	B3H 			//06E8 	2AB3
		BCR 	STATUS,5 		//06E9 	1283
		STR 	1H 			//06EA 	0181

		//;sysinit.c: 64: TMR2H = 0;
		CLRR 	13H 			//06EB 	0113
		ORG		06ECH

		//;sysinit.c: 65: TMR2L = 0;
		CLRR 	11H 			//06EC 	0111

		//;sysinit.c: 66: PR2H = 0;
		BSR 	STATUS,5 		//06ED 	1A83
		CLRR 	12H 			//06EE 	0112

		//;sysinit.c: 67: PR2L =0;
		CLRR 	11H 			//06EF 	0111

		//;sysinit.c: 68: T2CON0 = 0B00101001;
		LDWI 	29H 			//06F0 	2A29
		BCR 	STATUS,5 		//06F1 	1283
		STR 	12H 			//06F2 	0192
		RET		 					//06F3 	0004
		ORG		06F4H
		CLRR 	70H 			//06F4 	0170
		CLRR 	71H 			//06F5 	0171
		CLRR 	72H 			//06F6 	0172
		CLRR 	73H 			//06F7 	0173
		CLRR 	74H 			//06F8 	0174
		CLRR 	43H 			//06F9 	0143
		CLRR 	44H 			//06FA 	0144
		CLRR 	45H 			//06FB 	0145
		ORG		06FCH
		CLRR 	46H 			//06FC 	0146
		CLRR 	47H 			//06FD 	0147
		CLRR 	48H 			//06FE 	0148
		CLRR 	STATUS 			//06FF 	0103
		LJUMP 	0BH 			//0700 	380B
		LDWI 	5H 			//0701 	2A05

		//;SWI2C.C: 37: RA6 = 0;
		BCR 	5H,6 			//0702 	1305

		//;SWI2C.C: 38: RA7 = 1;
		BSR 	5H,7 			//0703 	1B85
		ORG		0704H

		//;SWI2C.C: 39: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0704 	01A0
		DECRSZ 	20H,1 		//0705 	0EA0
		LJUMP 	705H 			//0706 	3F05
		LDWI 	5H 			//0707 	2A05

		//;SWI2C.C: 40: RA6 = 1;
		BCR 	STATUS,5 		//0708 	1283
		BSR 	5H,6 			//0709 	1B05

		//;SWI2C.C: 41: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//070A 	01A0
		DECRSZ 	20H,1 		//070B 	0EA0
		ORG		070CH
		LJUMP 	70BH 			//070C 	3F0B
		RET		 					//070D 	0004
		BCR 	STATUS,5 		//070E 	1283
		STR 	20H 			//070F 	01A0

		//;smartkey.C: 163: unsigned char ReEepromData;
		//;smartkey.C: 164: EEADR = EEAddr;
		BSR 	STATUS,5 		//0710 	1A83
		STR 	1BH 			//0711 	019B

		//;smartkey.C: 165: RD = 1;
		BSR 	1CH,0 			//0712 	181C

		//;smartkey.C: 166: ReEepromData = EEDAT;
		LDR 	1AH,0 			//0713 	081A
		ORG		0714H
		BCR 	STATUS,5 		//0714 	1283
		STR 	21H 			//0715 	01A1

		//;smartkey.C: 167: RD = 0;
		BSR 	STATUS,5 		//0716 	1A83
		BCR 	1CH,0 			//0717 	101C

		//;smartkey.C: 168: return ReEepromData;
		BCR 	STATUS,5 		//0718 	1283
		LDR 	21H,0 			//0719 	0821
		RET		 					//071A 	0004
		STR 	22H 			//071B 	01A2
		ORG		071CH

		//;smartkey.C: 185: mtOldState = mtState;
		LDR 	74H,0 			//071C 	0874
		STR 	48H 			//071D 	01C8

		//;smartkey.C: 186: mtState = stt;
		LDR 	22H,0 			//071E 	0822
		STR 	74H 			//071F 	01F4

		//;smartkey.C: 187: timeTick = 0;
		CLRR 	70H 			//0720 	0170
		CLRR 	71H 			//0721 	0171

		//;smartkey.C: 188: timeOut = _tOut;
		LDR 	21H,0 			//0722 	0821
		STR 	46H 			//0723 	01C6
		ORG		0724H
		LDR 	20H,0 			//0724 	0820
		STR 	45H 			//0725 	01C5
		RET		 					//0726 	0004

		//;sysinit.c: 21: OSCCON = 0B01010001;
		LDWI 	51H 			//0727 	2A51
		BSR 	STATUS,5 		//0728 	1A83
		STR 	FH 			//0729 	018F

		//;sysinit.c: 22: _nop();
		NOP		 					//072A 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//072B 	1A83
		ORG		072CH
		BTSC 	FH,2 			//072C 	150F
		RET		 					//072D 	0004
		LJUMP 	72BH 			//072E 	3F2B
		STR 	75H 			//072F 	01F5

		//;smartkey.C: 163: unsigned char ReEepromData;
		//;smartkey.C: 164: EEADR = EEAddr;
		BSR 	STATUS,5 		//0730 	1A83
		STR 	1BH 			//0731 	019B

		//;smartkey.C: 165: RD = 1;
		BSR 	1CH,0 			//0732 	181C

		//;smartkey.C: 166: ReEepromData = EEDAT;
		LDR 	1AH,0 			//0733 	081A
		ORG		0734H
		STR 	76H 			//0734 	01F6

		//;smartkey.C: 167: RD = 0;
		BCR 	1CH,0 			//0735 	101C

		//;smartkey.C: 168: return ReEepromData;
		RET		 					//0736 	0004

		//;smartkey.C: 140: TMR2ON = 0; RA3 = 0; TRISA |= 0x08;
		BCR 	STATUS,5 		//0737 	1283
		BCR 	12H,2 			//0738 	1112
		BCR 	5H,3 			//0739 	1185
		BSR 	STATUS,5 		//073A 	1A83
		BSR 	5H,3 			//073B 	1985
		ORG		073CH
		RET		 					//073C 	0004
		LJUMP 	2A7H 			//073D 	3AA7
		LJUMP 	1DAH 			//073E 	39DA
		LJUMP 	1E2H 			//073F 	39E2
		LJUMP 	22AH 			//0740 	3A2A
		LJUMP 	24BH 			//0741 	3A4B

		//;smartkey.C: 143: TMR2ON = 1;
		BCR 	STATUS,5 		//0742 	1283
		BSR 	12H,2 			//0743 	1912
		ORG		0744H

		//;smartkey.C: 144: TRISA &= 0xf7;
		BSR 	STATUS,5 		//0744 	1A83
		BCR 	5H,3 			//0745 	1185
		RET		 					//0746 	0004
			END

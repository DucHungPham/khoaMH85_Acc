//Deviec:MS82Fxx02
//-----------------------Variable---------------------------------
		_mode_chek		EQU		73H
		_timeOut		EQU		47H
		_timeTick		EQU		70H
		_cntTmp		EQU		45H
		_cntCyc		EQU		72H
		_cntOff		EQU		4AH
		_lostDetect		EQU		4BH
		_mtState		EQU		74H
		_mtOldState		EQU		4CH
		_RegStatus		EQU		49H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	77H 			//0006 	01F7
		LDR 	PCLATH,0 		//0007 	080A
		STR 	78H 			//0008 	01F8
		LJUMP 	420H 			//0009 	3C20
		LJUMP 	6CCH 			//000A 	3ECC
		LDWI 	7H 			//000B 	2A07
		ORG		000CH
		STR 	19H 			//000C 	0199

		//;smartkey.C: 256: unsigned char reAlertOn=0,tmp8,isSw=0,isFall=0,mpuOk=0,vibrateOn=0,acc
		//+                          Set=0;
		BCR 	STATUS,5 		//000D 	1283
		BCR 	STATUS,6 		//000E 	1303
		CLRR 	3BH 			//000F 	013B
		CLRR 	41H 			//0010 	0141
		CLRR 	31H 			//0011 	0131
		CLRR 	34H 			//0012 	0134

		//;smartkey.C: 257: unsigned int isWait =0;
		CLRR 	2FH 			//0013 	012F
		ORG		0014H
		CLRR 	30H 			//0014 	0130

		//;smartkey.C: 258: signed int acYsum=0,acXsum=0;
		CLRR 	3DH 			//0015 	013D
		CLRR 	3EH 			//0016 	013E
		CLRR 	3FH 			//0017 	013F
		CLRR 	40H 			//0018 	0140

		//;smartkey.C: 259: unsigned int tmp16=0;
		CLRR 	42H 			//0019 	0142
		CLRR 	43H 			//001A 	0143
		CLRWDT	 			//001B 	0001
		ORG		001CH

		//;smartkey.C: 265: sys_init();
		LCALL 	720H 			//001C 	3720

		//;smartkey.C: 266: gpio_init();
		LCALL 	6F8H 			//001D 	36F8

		//;smartkey.C: 267: int_init();
		LCALL 	65AH 			//001E 	365A

		//;smartkey.C: 268: timer_init();
		LCALL 	6DBH 			//001F 	36DB

		//;smartkey.C: 270: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//0020 	2A82
		STR 	2DH 			//0021 	01AD
		LDWI 	DDH 			//0022 	2ADD
		STR 	2CH 			//0023 	01AC
		ORG		0024H
		DECRSZ 	2CH,1 		//0024 	0EAC
		LJUMP 	24H 			//0025 	3824
		DECRSZ 	2DH,1 		//0026 	0EAD
		LJUMP 	24H 			//0027 	3824
		LJUMP 	29H 			//0028 	3829
		LDWI 	82H 			//0029 	2A82

		//;smartkey.C: 271: RA7 =1;
		BCR 	STATUS,5 		//002A 	1283
		BCR 	STATUS,6 		//002B 	1303
		ORG		002CH
		BSR 	5H,7 			//002C 	1B85

		//;smartkey.C: 272: _delay((unsigned long)((100)*(4000000/4000.0)));
		STR 	2DH 			//002D 	01AD
		LDWI 	DDH 			//002E 	2ADD
		STR 	2CH 			//002F 	01AC
		DECRSZ 	2CH,1 		//0030 	0EAC
		LJUMP 	30H 			//0031 	3830
		DECRSZ 	2DH,1 		//0032 	0EAD
		LJUMP 	30H 			//0033 	3830
		ORG		0034H
		LJUMP 	35H 			//0034 	3835

		//;smartkey.C: 274: PAIE = 1;
		BSR 	INTCON,3 		//0035 	198B

		//;smartkey.C: 276: RegStatus = 0;
		BCR 	STATUS,5 		//0036 	1283
		BCR 	STATUS,6 		//0037 	1303
		CLRR 	49H 			//0038 	0149

		//;smartkey.C: 278: swI2C_Init();
		LCALL 	63EH 			//0039 	363E
		LDWI 	0H 			//003A 	2A00

		//;smartkey.C: 281: setState(0,0);
		BCR 	STATUS,5 		//003B 	1283
		ORG		003CH
		BCR 	STATUS,6 		//003C 	1303
		CLRR 	20H 			//003D 	0120
		CLRR 	21H 			//003E 	0121
		LCALL 	714H 			//003F 	3714

		//;smartkey.C: 283: WRITE_EEPROM(0x7F,0xAA);
		LDWI 	AAH 			//0040 	2AAA
		STR 	20H 			//0041 	01A0
		LDWI 	7FH 			//0042 	2A7F
		LCALL 	621H 			//0043 	3621
		ORG		0044H

		//;smartkey.C: 284: WRITE_EEPROM(0x7F,0xAA);
		LDWI 	AAH 			//0044 	2AAA
		BCR 	STATUS,5 		//0045 	1283
		STR 	20H 			//0046 	01A0
		LDWI 	7FH 			//0047 	2A7F
		LCALL 	621H 			//0048 	3621

		//;smartkey.C: 288: _delay((unsigned long)((200)*(4000000/4000.0)));
		LDWI 	2H 			//0049 	2A02
		BCR 	STATUS,5 		//004A 	1283
		STR 	2EH 			//004B 	01AE
		ORG		004CH
		LDWI 	4H 			//004C 	2A04
		STR 	2DH 			//004D 	01AD
		LDWI 	BAH 			//004E 	2ABA
		STR 	2CH 			//004F 	01AC
		DECRSZ 	2CH,1 		//0050 	0EAC
		LJUMP 	50H 			//0051 	3850
		DECRSZ 	2DH,1 		//0052 	0EAD
		LJUMP 	50H 			//0053 	3850
		ORG		0054H
		DECRSZ 	2EH,1 		//0054 	0EAE
		LJUMP 	50H 			//0055 	3850
		CLRWDT	 			//0056 	0001

		//;smartkey.C: 290: tmp8= READ_EEPROM(0x08);
		LDWI 	8H 			//0057 	2A08
		LCALL 	706H 			//0058 	3706
		STR 	44H 			//0059 	01C4

		//;smartkey.C: 291: if(tmp8==0xff) {WRITE_EEPROM(0x08,0);_delay((unsigned long)((2)*(40000
		//+                          00/4000.0)));}
		XORWI 	FFH 			//005A 	26FF
		BTSS 	STATUS,2 		//005B 	1D03
		ORG		005CH
		LJUMP 	6AH 			//005C 	386A
		LDWI 	8H 			//005D 	2A08
		CLRR 	20H 			//005E 	0120
		LCALL 	621H 			//005F 	3621
		LDWI 	3H 			//0060 	2A03
		BCR 	STATUS,5 		//0061 	1283
		STR 	2DH 			//0062 	01AD
		LDWI 	97H 			//0063 	2A97
		ORG		0064H
		STR 	2CH 			//0064 	01AC
		DECRSZ 	2CH,1 		//0065 	0EAC
		LJUMP 	65H 			//0066 	3865
		DECRSZ 	2DH,1 		//0067 	0EAD
		LJUMP 	65H 			//0068 	3865
		LJUMP 	6AH 			//0069 	386A

		//;smartkey.C: 293: if(tmp8==0xcc){
		BCR 	STATUS,5 		//006A 	1283
		BCR 	STATUS,6 		//006B 	1303
		ORG		006CH
		LDR 	44H,0 			//006C 	0844
		XORWI 	CCH 			//006D 	26CC
		BTSS 	STATUS,2 		//006E 	1D03
		LJUMP 	86H 			//006F 	3886
		LDWI 	8H 			//0070 	2A08

		//;smartkey.C: 294: RegStatus &=~(0x20);
		BCR 	49H,5 			//0071 	12C9

		//;smartkey.C: 295: setState(3,1800);
		STR 	20H 			//0072 	01A0
		LDWI 	7H 			//0073 	2A07
		ORG		0074H
		STR 	21H 			//0074 	01A1
		LDWI 	3H 			//0075 	2A03
		LCALL 	714H 			//0076 	3714

		//;smartkey.C: 296: mtOldState = 1;
		CLRR 	4CH 			//0077 	014C
		INCR	4CH,1 			//0078 	09CC

		//;smartkey.C: 297: cntTmp = timeTick+50;
		LDR 	71H,0 			//0079 	0871
		STR 	46H 			//007A 	01C6
		LDR 	70H,0 			//007B 	0870
		ORG		007CH
		STR 	45H 			//007C 	01C5
		LDWI 	32H 			//007D 	2A32
		ADDWR 	45H,1 			//007E 	0BC5
		BTSC 	STATUS,0 		//007F 	1403
		INCR	46H,1 			//0080 	09C6

		//;smartkey.C: 298: PR2 =12;
		LDWI 	CH 			//0081 	2A0C
		BSR 	STATUS,5 		//0082 	1A83
		STR 	12H 			//0083 	0192
		ORG		0084H

		//;smartkey.C: 299: beepOn();
		LCALL 	737H 			//0084 	3737

		//;smartkey.C: 300: } else {
		LJUMP 	8DH 			//0085 	388D

		//;smartkey.C: 301: setState(2,400);
		LDWI 	90H 			//0086 	2A90
		STR 	20H 			//0087 	01A0
		LDWI 	1H 			//0088 	2A01
		STR 	21H 			//0089 	01A1
		LDWI 	2H 			//008A 	2A02
		LCALL 	714H 			//008B 	3714
		ORG		008CH

		//;smartkey.C: 303: mtOldState = 0;
		CLRR 	4CH 			//008C 	014C

		//;smartkey.C: 307: }
		//;smartkey.C: 310: tmp8 = READ_EEPROM(0x40);
		LDWI 	40H 			//008D 	2A40
		LCALL 	706H 			//008E 	3706
		STR 	44H 			//008F 	01C4

		//;smartkey.C: 311: if(tmp8==8){
		XORWI 	8H 			//0090 	2608

		//;smartkey.C: 312: tmp8= READ_EEPROM(0x41);
		LDWI 	41H 			//0091 	2A41
		BTSS 	STATUS,2 		//0092 	1D03
		LJUMP 	B2H 			//0093 	38B2
		ORG		0094H
		LCALL 	706H 			//0094 	3706
		STR 	44H 			//0095 	01C4
		LDWI 	19H 			//0096 	2A19

		//;smartkey.C: 313: beep(25,1);
		CLRR 	24H 			//0097 	0124
		INCR	24H,1 			//0098 	09A4
		LCALL 	68EH 			//0099 	368E

		//;smartkey.C: 314: if(tmp8){
		LDR 	44H,0 			//009A 	0844
		LDWI 	41H 			//009B 	2A41
		ORG		009CH
		BTSC 	STATUS,2 		//009C 	1503
		LJUMP 	A0H 			//009D 	38A0

		//;smartkey.C: 315: WRITE_EEPROM(0x41,0);
		CLRR 	20H 			//009E 	0120
		LJUMP 	A2H 			//009F 	38A2

		//;smartkey.C: 316: }
		//;smartkey.C: 317: else {
		//;smartkey.C: 318: WRITE_EEPROM(0x41,0x1);
		CLRR 	20H 			//00A0 	0120
		INCR	20H,1 			//00A1 	09A0
		LCALL 	621H 			//00A2 	3621
		LDWI 	40H 			//00A3 	2A40
		ORG		00A4H

		//;smartkey.C: 320: }
		//;smartkey.C: 321: WRITE_EEPROM(0x40,0);
		BCR 	STATUS,5 		//00A4 	1283
		CLRR 	20H 			//00A5 	0120
		LCALL 	621H 			//00A6 	3621

		//;smartkey.C: 323: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//00A7 	2A82
		BCR 	STATUS,5 		//00A8 	1283
		STR 	2DH 			//00A9 	01AD
		LDWI 	DDH 			//00AA 	2ADD
		STR 	2CH 			//00AB 	01AC
		ORG		00ACH
		DECRSZ 	2CH,1 		//00AC 	0EAC
		LJUMP 	ACH 			//00AD 	38AC
		DECRSZ 	2DH,1 		//00AE 	0EAD
		LJUMP 	ACH 			//00AF 	38AC
		LJUMP 	B1H 			//00B0 	38B1

		//;smartkey.C: 324: }
		//;smartkey.C: 330: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//00B1 	2A41
		LCALL 	706H 			//00B2 	3706
		STR 	44H 			//00B3 	01C4
		ORG		00B4H

		//;smartkey.C: 331: if(tmp8){
		LDR 	44H,0 			//00B4 	0844
		BTSC 	STATUS,2 		//00B5 	1503
		LJUMP 	D5H 			//00B6 	38D5

		//;smartkey.C: 332: RC4 =1;RC2 =1;
		BSR 	7H,4 			//00B7 	1A07
		BSR 	7H,2 			//00B8 	1907

		//;smartkey.C: 334: _delay((unsigned long)((1000)*(4000000/4000.0)));
		LDWI 	6H 			//00B9 	2A06
		BCR 	STATUS,5 		//00BA 	1283
		BCR 	STATUS,6 		//00BB 	1303
		ORG		00BCH
		STR 	2EH 			//00BC 	01AE
		LDWI 	13H 			//00BD 	2A13
		STR 	2DH 			//00BE 	01AD
		LDWI 	B1H 			//00BF 	2AB1
		STR 	2CH 			//00C0 	01AC
		DECRSZ 	2CH,1 		//00C1 	0EAC
		LJUMP 	C1H 			//00C2 	38C1
		DECRSZ 	2DH,1 		//00C3 	0EAD
		ORG		00C4H
		LJUMP 	C1H 			//00C4 	38C1
		DECRSZ 	2EH,1 		//00C5 	0EAE
		LJUMP 	C1H 			//00C6 	38C1
		LJUMP 	C8H 			//00C7 	38C8

		//;smartkey.C: 335: if(timeTick >300) WRITE_EEPROM(0x40,0);
		LDWI 	1H 			//00C8 	2A01
		SUBWR 	71H,0 			//00C9 	0C71
		LDWI 	2DH 			//00CA 	2A2D
		BTSC 	STATUS,2 		//00CB 	1503
		ORG		00CCH
		SUBWR 	70H,0 			//00CC 	0C70
		BTSS 	STATUS,0 		//00CD 	1C03
		LJUMP 	B9H 			//00CE 	38B9
		LDWI 	40H 			//00CF 	2A40
		BCR 	STATUS,5 		//00D0 	1283
		BCR 	STATUS,6 		//00D1 	1303
		CLRR 	20H 			//00D2 	0120
		LCALL 	621H 			//00D3 	3621
		ORG		00D4H
		LJUMP 	B9H 			//00D4 	38B9

		//;smartkey.C: 336: }
		//;smartkey.C: 337: }
		//;smartkey.C: 357: {
		//;smartkey.C: 358: buf[0] = 0x28;
		LDWI 	28H 			//00D5 	2A28
		STR 	35H 			//00D6 	01B5

		//;smartkey.C: 359: buf[1] = 0x87;
		LDWI 	87H 			//00D7 	2A87
		STR 	36H 			//00D8 	01B6

		//;smartkey.C: 360: if(AccWrite(0x6b,(unsigned char)buf,2)==0) mpuOk =1;
		LDWI 	35H 			//00D9 	2A35
		STR 	2CH 			//00DA 	01AC
		CLRR 	2DH 			//00DB 	012D
		ORG		00DCH
		STR 	23H 			//00DC 	01A3
		LDR 	2DH,0 			//00DD 	082D
		STR 	24H 			//00DE 	01A4
		LDWI 	2H 			//00DF 	2A02
		STR 	25H 			//00E0 	01A5
		LDWI 	6BH 			//00E1 	2A6B
		LCALL 	5F9H 			//00E2 	35F9
		IORWI 	0H 			//00E3 	2500
		ORG		00E4H
		BCR 	STATUS,5 		//00E4 	1283
		BCR 	STATUS,6 		//00E5 	1303
		BTSS 	STATUS,2 		//00E6 	1D03
		LJUMP 	EBH 			//00E7 	38EB
		CLRR 	3CH 			//00E8 	013C
		INCR	3CH,1 			//00E9 	09BC
		LJUMP 	ECH 			//00EA 	38EC

		//;smartkey.C: 361: else mpuOk =0;
		CLRR 	3CH 			//00EB 	013C
		ORG		00ECH

		//;smartkey.C: 363: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//00EC 	2A82
		STR 	2DH 			//00ED 	01AD
		LDWI 	DDH 			//00EE 	2ADD
		STR 	2CH 			//00EF 	01AC
		DECRSZ 	2CH,1 		//00F0 	0EAC
		LJUMP 	F0H 			//00F1 	38F0
		DECRSZ 	2DH,1 		//00F2 	0EAD
		LJUMP 	F0H 			//00F3 	38F0
		ORG		00F4H
		LJUMP 	F5H 			//00F4 	38F5

		//;smartkey.C: 364: }
		//;smartkey.C: 365: if(mpuOk ==0){beep(10,2);}
		BCR 	STATUS,5 		//00F5 	1283
		BCR 	STATUS,6 		//00F6 	1303
		LDR 	3CH,1 			//00F7 	08BC
		BTSS 	STATUS,2 		//00F8 	1D03
		LJUMP 	FEH 			//00F9 	38FE
		LDWI 	2H 			//00FA 	2A02
		STR 	24H 			//00FB 	01A4
		ORG		00FCH
		LDWI 	AH 			//00FC 	2A0A
		LCALL 	68EH 			//00FD 	368E

		//;smartkey.C: 370: tmp8= READ_EEPROM(0x40);
		LDWI 	40H 			//00FE 	2A40
		LCALL 	706H 			//00FF 	3706
		STR 	44H 			//0100 	01C4

		//;smartkey.C: 371: if(tmp8==6 && mpuOk ==1)
		XORWI 	6H 			//0101 	2606
		BTSS 	STATUS,2 		//0102 	1D03
		LJUMP 	1B8H 			//0103 	39B8
		ORG		0104H
		DECRSZ 	3CH,0 		//0104 	0E3C
		LJUMP 	1B8H 			//0105 	39B8
		LDWI 	3H 			//0106 	2A03

		//;smartkey.C: 372: {
		//;smartkey.C: 373: tmp8=0; beep(10,3);
		CLRR 	44H 			//0107 	0144
		STR 	24H 			//0108 	01A4
		LDWI 	AH 			//0109 	2A0A
		LCALL 	68EH 			//010A 	368E

		//;smartkey.C: 374: while((RC1 )&&(tmp8<11))
		LJUMP 	149H 			//010B 	3949
		ORG		010CH

		//;smartkey.C: 375: {
		//;smartkey.C: 376: if(AccRead(0x3b,(unsigned char)buf,6)==0){
		LDWI 	35H 			//010C 	2A35
		STR 	2CH 			//010D 	01AC
		CLRR 	2DH 			//010E 	012D
		STR 	24H 			//010F 	01A4
		LDR 	2DH,0 			//0110 	082D
		STR 	25H 			//0111 	01A5
		LDWI 	6H 			//0112 	2A06
		STR 	26H 			//0113 	01A6
		ORG		0114H
		LDWI 	3BH 			//0114 	2A3B
		LCALL 	5BEH 			//0115 	35BE
		IORWI 	0H 			//0116 	2500
		BTSS 	STATUS,2 		//0117 	1D03
		LJUMP 	13AH 			//0118 	393A

		//;smartkey.C: 378: acXsum += buf[0];
		BCR 	STATUS,5 		//0119 	1283
		BCR 	STATUS,6 		//011A 	1303
		LDR 	35H,0 			//011B 	0835
		ORG		011CH
		STR 	2CH 			//011C 	01AC
		CLRR 	2DH 			//011D 	012D
		BTSC 	2CH,7 			//011E 	17AC
		DECR 	2DH,1 			//011F 	0DAD
		ADDWR 	3FH,1 			//0120 	0BBF
		BTSC 	STATUS,0 		//0121 	1403
		INCR	40H,1 			//0122 	09C0
		LDR 	2DH,0 			//0123 	082D
		ORG		0124H
		ADDWR 	40H,1 			//0124 	0BC0

		//;smartkey.C: 379: acYsum += buf[2];
		LDR 	37H,0 			//0125 	0837
		STR 	2CH 			//0126 	01AC
		CLRR 	2DH 			//0127 	012D
		BTSC 	2CH,7 			//0128 	17AC
		DECR 	2DH,1 			//0129 	0DAD
		ADDWR 	3DH,1 			//012A 	0BBD
		BTSC 	STATUS,0 		//012B 	1403
		ORG		012CH
		INCR	3EH,1 			//012C 	09BE
		LDR 	2DH,0 			//012D 	082D
		ADDWR 	3EH,1 			//012E 	0BBE

		//;smartkey.C: 380: tmp16 = (signed int)tmp16 + buf[4];
		LDR 	39H,0 			//012F 	0839
		STR 	2CH 			//0130 	01AC
		CLRR 	2DH 			//0131 	012D
		BTSC 	2CH,7 			//0132 	17AC
		DECR 	2DH,1 			//0133 	0DAD
		ORG		0134H
		ADDWR 	42H,1 			//0134 	0BC2
		BTSC 	STATUS,0 		//0135 	1403
		INCR	43H,1 			//0136 	09C3
		LDR 	2DH,0 			//0137 	082D
		ADDWR 	43H,1 			//0138 	0BC3

		//;smartkey.C: 381: tmp8++;
		INCR	44H,1 			//0139 	09C4

		//;smartkey.C: 382: }
		//;smartkey.C: 383: _delay((unsigned long)((500)*(4000000/4000.0)));
		LDWI 	3H 			//013A 	2A03
		BCR 	STATUS,5 		//013B 	1283
		ORG		013CH
		BCR 	STATUS,6 		//013C 	1303
		STR 	2EH 			//013D 	01AE
		LDWI 	8AH 			//013E 	2A8A
		STR 	2DH 			//013F 	01AD
		LDWI 	56H 			//0140 	2A56
		STR 	2CH 			//0141 	01AC
		DECRSZ 	2CH,1 		//0142 	0EAC
		LJUMP 	142H 			//0143 	3942
		ORG		0144H
		DECRSZ 	2DH,1 		//0144 	0EAD
		LJUMP 	142H 			//0145 	3942
		DECRSZ 	2EH,1 		//0146 	0EAE
		LJUMP 	142H 			//0147 	3942
		LJUMP 	149H 			//0148 	3949
		BCR 	STATUS,5 		//0149 	1283
		BCR 	STATUS,6 		//014A 	1303
		BTSS 	7H,1 			//014B 	1C87
		ORG		014CH
		LJUMP 	151H 			//014C 	3951
		LDWI 	BH 			//014D 	2A0B
		SUBWR 	44H,0 			//014E 	0C44
		BTSS 	STATUS,0 		//014F 	1C03
		LJUMP 	10CH 			//0150 	390C

		//;smartkey.C: 385: }
		//;smartkey.C: 387: if(tmp8==11){
		LDR 	44H,0 			//0151 	0844
		XORWI 	BH 			//0152 	260B
		BTSS 	STATUS,2 		//0153 	1D03
		ORG		0154H
		LJUMP 	1AFH 			//0154 	39AF

		//;smartkey.C: 388: acXsum =acXsum/10;
		LDWI 	AH 			//0155 	2A0A
		STR 	20H 			//0156 	01A0
		CLRR 	21H 			//0157 	0121
		LDR 	40H,0 			//0158 	0840
		STR 	23H 			//0159 	01A3
		LDR 	3FH,0 			//015A 	083F
		STR 	22H 			//015B 	01A2
		ORG		015CH
		LCALL 	536H 			//015C 	3536
		LDR 	21H,0 			//015D 	0821
		STR 	40H 			//015E 	01C0
		LDR 	20H,0 			//015F 	0820
		STR 	3FH 			//0160 	01BF

		//;smartkey.C: 389: acYsum = acYsum/10;
		LDWI 	AH 			//0161 	2A0A
		STR 	20H 			//0162 	01A0
		CLRR 	21H 			//0163 	0121
		ORG		0164H
		LDR 	3EH,0 			//0164 	083E
		STR 	23H 			//0165 	01A3
		LDR 	3DH,0 			//0166 	083D
		STR 	22H 			//0167 	01A2
		LCALL 	536H 			//0168 	3536
		LDR 	21H,0 			//0169 	0821
		STR 	3EH 			//016A 	01BE
		LDR 	20H,0 			//016B 	0820
		ORG		016CH
		STR 	3DH 			//016C 	01BD

		//;smartkey.C: 390: tmp16 = (signed int)tmp16/10;
		LDWI 	AH 			//016D 	2A0A
		STR 	20H 			//016E 	01A0
		CLRR 	21H 			//016F 	0121
		LDR 	43H,0 			//0170 	0843
		STR 	23H 			//0171 	01A3
		LDR 	42H,0 			//0172 	0842
		STR 	22H 			//0173 	01A2
		ORG		0174H
		LCALL 	536H 			//0174 	3536
		LDR 	21H,0 			//0175 	0821
		STR 	43H 			//0176 	01C3
		LDR 	20H,0 			//0177 	0820
		STR 	42H 			//0178 	01C2

		//;smartkey.C: 392: if(((signed int)tmp16 > (-31)) && ((signed int)tmp16 < 31)){
		LDR 	43H,0 			//0179 	0843
		XORWI 	80H 			//017A 	2680
		STR 	7FH 			//017B 	01FF
		ORG		017CH
		LDWI 	7FH 			//017C 	2A7F
		SUBWR 	7FH,0 			//017D 	0C7F
		BTSS 	STATUS,2 		//017E 	1D03
		LJUMP 	182H 			//017F 	3982
		LDWI 	E2H 			//0180 	2AE2
		SUBWR 	42H,0 			//0181 	0C42
		BTSS 	STATUS,0 		//0182 	1C03
		LJUMP 	195H 			//0183 	3995
		ORG		0184H
		BCR 	STATUS,5 		//0184 	1283
		BCR 	STATUS,6 		//0185 	1303
		LDR 	43H,0 			//0186 	0843
		XORWI 	80H 			//0187 	2680
		STR 	7FH 			//0188 	01FF
		LDWI 	80H 			//0189 	2A80
		SUBWR 	7FH,0 			//018A 	0C7F
		BTSS 	STATUS,2 		//018B 	1D03
		ORG		018CH
		LJUMP 	18FH 			//018C 	398F
		LDWI 	1FH 			//018D 	2A1F
		SUBWR 	42H,0 			//018E 	0C42
		BTSC 	STATUS,0 		//018F 	1403
		LJUMP 	195H 			//0190 	3995

		//;smartkey.C: 393: beep(10,2);
		LDWI 	2H 			//0191 	2A02
		BCR 	STATUS,5 		//0192 	1283
		BCR 	STATUS,6 		//0193 	1303
		ORG		0194H
		LJUMP 	1B0H 			//0194 	39B0

		//;smartkey.C: 394: }
		//;smartkey.C: 395: else
		//;smartkey.C: 397: {
		//;smartkey.C: 398: beep(10,3);
		LDWI 	3H 			//0195 	2A03
		BCR 	STATUS,5 		//0196 	1283
		BCR 	STATUS,6 		//0197 	1303
		STR 	24H 			//0198 	01A4
		LDWI 	AH 			//0199 	2A0A
		LCALL 	68EH 			//019A 	368E

		//;smartkey.C: 399: WRITE_EEPROM(0x10,(unsigned char)acXsum);
		LDR 	3FH,0 			//019B 	083F
		ORG		019CH
		STR 	20H 			//019C 	01A0
		LDWI 	10H 			//019D 	2A10
		LCALL 	621H 			//019E 	3621

		//;smartkey.C: 400: WRITE_EEPROM(0x11,(unsigned char)acYsum);
		BCR 	STATUS,5 		//019F 	1283
		LDR 	3DH,0 			//01A0 	083D
		STR 	20H 			//01A1 	01A0
		LDWI 	11H 			//01A2 	2A11
		LCALL 	621H 			//01A3 	3621
		ORG		01A4H

		//;smartkey.C: 401: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//01A4 	2A82
		BCR 	STATUS,5 		//01A5 	1283
		STR 	2DH 			//01A6 	01AD
		LDWI 	DDH 			//01A7 	2ADD
		STR 	2CH 			//01A8 	01AC
		DECRSZ 	2CH,1 		//01A9 	0EAC
		LJUMP 	1A9H 			//01AA 	39A9
		DECRSZ 	2DH,1 		//01AB 	0EAD
		ORG		01ACH
		LJUMP 	1A9H 			//01AC 	39A9
		LJUMP 	1AEH 			//01AD 	39AE
		LJUMP 	1B3H 			//01AE 	39B3

		//;smartkey.C: 405: beep(10,2);
		LDWI 	2H 			//01AF 	2A02
		STR 	24H 			//01B0 	01A4
		LDWI 	AH 			//01B1 	2A0A
		LCALL 	68EH 			//01B2 	368E
		LDWI 	40H 			//01B3 	2A40
		ORG		01B4H

		//;smartkey.C: 406: }
		//;smartkey.C: 407: WRITE_EEPROM(0x40,0);
		BCR 	STATUS,5 		//01B4 	1283
		BCR 	STATUS,6 		//01B5 	1303
		CLRR 	20H 			//01B6 	0120
		LCALL 	621H 			//01B7 	3621

		//;smartkey.C: 409: }
		//;smartkey.C: 411: acXsum = (signed char)READ_EEPROM(0x10);
		LDWI 	10H 			//01B8 	2A10
		LCALL 	706H 			//01B9 	3706
		STR 	3FH 			//01BA 	01BF
		CLRR 	40H 			//01BB 	0140
		ORG		01BCH
		BTSC 	3FH,7 			//01BC 	17BF
		DECR 	40H,1 			//01BD 	0DC0

		//;smartkey.C: 412: acYsum = (signed char)READ_EEPROM(0x11);
		LDWI 	11H 			//01BE 	2A11
		LCALL 	706H 			//01BF 	3706
		STR 	3DH 			//01C0 	01BD
		CLRR 	3EH 			//01C1 	013E
		BTSC 	3DH,7 			//01C2 	17BD
		DECR 	3EH,1 			//01C3 	0DBE
		ORG		01C4H

		//;smartkey.C: 414: timeTick = 0;
		CLRR 	70H 			//01C4 	0170
		CLRR 	71H 			//01C5 	0171

		//;smartkey.C: 423: if(mode_chek == 0)
		LDR 	73H,1 			//01C6 	08F3
		BTSC 	STATUS,2 		//01C7 	1503

		//;smartkey.C: 424: {
		//;smartkey.C: 426: if(RegStatus & 0x80)
		BTSS 	49H,7 			//01C8 	1FC9
		LJUMP 	297H 			//01C9 	3A97

		//;smartkey.C: 427: {
		//;smartkey.C: 428: PAIE = 0;
		BCR 	INTCON,3 		//01CA 	118B

		//;smartkey.C: 431: RegStatus &= (~0x80);
		BCR 	49H,7 			//01CB 	13C9
		ORG		01CCH

		//;smartkey.C: 443: {
		//;smartkey.C: 445: if ((RegStatus & 0x40) !=0){
		BTSC 	49H,6 			//01CC 	1749
		LJUMP 	249H 			//01CD 	3A49
		LJUMP 	28EH 			//01CE 	3A8E

		//;smartkey.C: 451: lostDetect =0;
		CLRR 	4BH 			//01CF 	014B
		LDWI 	28H 			//01D0 	2A28

		//;smartkey.C: 452: timeTick =0;
		CLRR 	70H 			//01D1 	0170
		CLRR 	71H 			//01D2 	0171

		//;smartkey.C: 453: tmp16 = 40;
		STR 	42H 			//01D3 	01C2
		ORG		01D4H
		CLRR 	43H 			//01D4 	0143

		//;smartkey.C: 454: break;
		LJUMP 	296H 			//01D5 	3A96

		//;smartkey.C: 457: if(timeTick >30){
		LDWI 	0H 			//01D6 	2A00
		SUBWR 	71H,0 			//01D7 	0C71
		LDWI 	1FH 			//01D8 	2A1F
		BTSC 	STATUS,2 		//01D9 	1503
		SUBWR 	70H,0 			//01DA 	0C70
		BTSS 	STATUS,0 		//01DB 	1C03
		ORG		01DCH
		LJUMP 	296H 			//01DC 	3A96
		LDWI 	8H 			//01DD 	2A08

		//;smartkey.C: 458: timeTick =0;
		CLRR 	70H 			//01DE 	0170
		CLRR 	71H 			//01DF 	0171

		//;smartkey.C: 460: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LCALL 	706H 			//01E0 	3706
		XORWI 	CCH 			//01E1 	26CC
		BTSS 	STATUS,2 		//01E2 	1D03
		LJUMP 	1E7H 			//01E3 	39E7
		ORG		01E4H
		LDWI 	8H 			//01E4 	2A08
		CLRR 	20H 			//01E5 	0120
		LCALL 	621H 			//01E6 	3621

		//;smartkey.C: 462: if((mtOldState == 3)){
		BCR 	STATUS,5 		//01E7 	1283
		LDR 	4CH,0 			//01E8 	084C
		XORWI 	3H 			//01E9 	2603
		BTSS 	STATUS,2 		//01EA 	1D03
		LJUMP 	1F8H 			//01EB 	39F8
		ORG		01ECH

		//;smartkey.C: 463: beepOn();TMR2ON = 0; beep(10,1);
		LCALL 	737H 			//01EC 	3737
		LDWI 	AH 			//01ED 	2A0A
		BCR 	STATUS,5 		//01EE 	1283
		BCR 	12H,2 			//01EF 	1112
		CLRR 	24H 			//01F0 	0124
		INCR	24H,1 			//01F1 	09A4
		LCALL 	68EH 			//01F2 	368E

		//;smartkey.C: 464: if(reAlertOn)reAlertOn =0;
		LDR 	3BH,0 			//01F3 	083B
		ORG		01F4H
		BTSC 	STATUS,2 		//01F4 	1503
		LJUMP 	296H 			//01F5 	3A96
		CLRR 	3BH 			//01F6 	013B
		LJUMP 	296H 			//01F7 	3A96

		//;smartkey.C: 466: else if((mtOldState == 0)||(mtOldState == 4)){
		LDR 	4CH,0 			//01F8 	084C
		BTSC 	STATUS,2 		//01F9 	1503
		LJUMP 	1FFH 			//01FA 	39FF
		LDR 	4CH,0 			//01FB 	084C
		ORG		01FCH
		XORWI 	4H 			//01FC 	2604
		BTSS 	STATUS,2 		//01FD 	1D03
		LJUMP 	21CH 			//01FE 	3A1C
		LDWI 	ACH 			//01FF 	2AAC

		//;smartkey.C: 467: RegStatus |=(0x20);
		BSR 	49H,5 			//0200 	1AC9

		//;smartkey.C: 468: setState(1,3500);
		STR 	20H 			//0201 	01A0
		LDWI 	DH 			//0202 	2A0D
		STR 	21H 			//0203 	01A1
		ORG		0204H
		LDWI 	1H 			//0204 	2A01
		LCALL 	714H 			//0205 	3714

		//;smartkey.C: 469: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
		LDWI 	40H 			//0206 	2A40
		LCALL 	706H 			//0207 	3706
		XORWI 	0H 			//0208 	2600
		BTSC 	STATUS,2 		//0209 	1503
		LJUMP 	20EH 			//020A 	3A0E
		LDWI 	40H 			//020B 	2A40
		ORG		020CH
		CLRR 	20H 			//020C 	0120
		LCALL 	621H 			//020D 	3621

		//;smartkey.C: 470: tmp16 = timeTick+40;
		LDR 	71H,0 			//020E 	0871
		BCR 	STATUS,5 		//020F 	1283
		STR 	43H 			//0210 	01C3
		LDR 	70H,0 			//0211 	0870
		STR 	42H 			//0212 	01C2
		LDWI 	28H 			//0213 	2A28
		ORG		0214H
		ADDWR 	42H,1 			//0214 	0BC2
		BTSC 	STATUS,0 		//0215 	1403
		INCR	43H,1 			//0216 	09C3
		LDWI 	AH 			//0217 	2A0A

		//;smartkey.C: 471: beep(10,1);
		CLRR 	24H 			//0218 	0124
		INCR	24H,1 			//0219 	09A4
		LCALL 	68EH 			//021A 	368E

		//;smartkey.C: 472: }
		LJUMP 	296H 			//021B 	3A96
		ORG		021CH

		//;smartkey.C: 473: else if((mtOldState == 1)){
		DECRSZ 	4CH,0 		//021C 	0E4C
		LJUMP 	296H 			//021D 	3A96
		LJUMP 	1F3H 			//021E 	39F3

		//;smartkey.C: 476: }
		//;smartkey.C: 477: }
		//;smartkey.C: 478: break;
		//;smartkey.C: 475: if(reAlertOn)reAlertOn =0;
		//;smartkey.C: 481: if(timeTick > 200)
		LDWI 	0H 			//021F 	2A00
		SUBWR 	71H,0 			//0220 	0C71
		LDWI 	C9H 			//0221 	2AC9
		BTSC 	STATUS,2 		//0222 	1503
		SUBWR 	70H,0 			//0223 	0C70
		ORG		0224H
		BTSS 	STATUS,0 		//0224 	1C03
		LJUMP 	296H 			//0225 	3A96

		//;smartkey.C: 482: {
		//;smartkey.C: 483: beepOff();
		LCALL 	73CH 			//0226 	373C

		//;smartkey.C: 484: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LDWI 	8H 			//0227 	2A08
		LCALL 	706H 			//0228 	3706
		XORWI 	CCH 			//0229 	26CC
		BTSS 	STATUS,2 		//022A 	1D03
		LJUMP 	22FH 			//022B 	3A2F
		ORG		022CH
		LDWI 	8H 			//022C 	2A08
		CLRR 	20H 			//022D 	0120
		LCALL 	621H 			//022E 	3621
		LDWI 	ACH 			//022F 	2AAC

		//;smartkey.C: 485: RegStatus |=(0x20);
		BCR 	STATUS,5 		//0230 	1283
		BSR 	49H,5 			//0231 	1AC9

		//;smartkey.C: 486: setState(1,3500);
		STR 	20H 			//0232 	01A0
		LDWI 	DH 			//0233 	2A0D
		ORG		0234H
		STR 	21H 			//0234 	01A1
		LDWI 	1H 			//0235 	2A01
		LCALL 	714H 			//0236 	3714

		//;smartkey.C: 488: tmp16 = timeTick+40;
		LDR 	71H,0 			//0237 	0871
		STR 	43H 			//0238 	01C3
		LDR 	70H,0 			//0239 	0870
		STR 	42H 			//023A 	01C2
		LDWI 	28H 			//023B 	2A28
		ORG		023CH
		ADDWR 	42H,1 			//023C 	0BC2
		BTSC 	STATUS,0 		//023D 	1403
		INCR	43H,1 			//023E 	09C3
		LJUMP 	296H 			//023F 	3A96

		//;smartkey.C: 494: beepOff();
		LCALL 	73CH 			//0240 	373C

		//;smartkey.C: 495: setState(2,300);
		LDWI 	2CH 			//0241 	2A2C
		BCR 	STATUS,5 		//0242 	1283
		STR 	20H 			//0243 	01A0
		ORG		0244H
		LDWI 	1H 			//0244 	2A01
		STR 	21H 			//0245 	01A1
		LDWI 	2H 			//0246 	2A02
		LCALL 	714H 			//0247 	3714

		//;smartkey.C: 496: break;
		LJUMP 	296H 			//0248 	3A96
		LDR 	74H,0 			//0249 	0874
		STR 	FSR 			//024A 	0184
		LDWI 	5H 			//024B 	2A05
		ORG		024CH
		SUBWR 	FSR,0 			//024C 	0C04
		BTSC 	STATUS,0 		//024D 	1403
		LJUMP 	296H 			//024E 	3A96
		LDWI 	7H 			//024F 	2A07
		STR 	PCLATH 			//0250 	018A
		LDWI 	32H 			//0251 	2A32
		ADDWR 	FSR,0 			//0252 	0B04
		STR 	PCL 			//0253 	0182
		ORG		0254H

		//;smartkey.C: 513: {
		//;smartkey.C: 515: if(lostDetect==1 && timeTick< 1500)
		DECRSZ 	4BH,0 		//0254 	0E4B
		LJUMP 	27BH 			//0255 	3A7B
		LDWI 	5H 			//0256 	2A05
		SUBWR 	71H,0 			//0257 	0C71
		LDWI 	DCH 			//0258 	2ADC
		BTSC 	STATUS,2 		//0259 	1503
		SUBWR 	70H,0 			//025A 	0C70
		BTSC 	STATUS,0 		//025B 	1403
		ORG		025CH
		LJUMP 	27BH 			//025C 	3A7B

		//;smartkey.C: 516: {
		//;smartkey.C: 517: if(READ_EEPROM(0x08)==0x00) WRITE_EEPROM(0x08,0xcc);
		LDWI 	8H 			//025D 	2A08
		LCALL 	706H 			//025E 	3706
		IORWI 	0H 			//025F 	2500
		BTSS 	STATUS,2 		//0260 	1D03
		LJUMP 	266H 			//0261 	3A66
		LDWI 	CCH 			//0262 	2ACC
		STR 	20H 			//0263 	01A0
		ORG		0264H
		LDWI 	8H 			//0264 	2A08
		LCALL 	621H 			//0265 	3621

		//;smartkey.C: 519: setState(3,1800);
		LDWI 	8H 			//0266 	2A08
		BCR 	STATUS,5 		//0267 	1283
		STR 	20H 			//0268 	01A0
		LDWI 	7H 			//0269 	2A07
		STR 	21H 			//026A 	01A1
		LDWI 	3H 			//026B 	2A03
		ORG		026CH
		LCALL 	714H 			//026C 	3714

		//;smartkey.C: 520: cntTmp = timeTick+40;
		LDR 	71H,0 			//026D 	0871
		STR 	46H 			//026E 	01C6
		LDR 	70H,0 			//026F 	0870
		STR 	45H 			//0270 	01C5
		LDWI 	28H 			//0271 	2A28
		ADDWR 	45H,1 			//0272 	0BC5
		BTSC 	STATUS,0 		//0273 	1403
		ORG		0274H
		INCR	46H,1 			//0274 	09C6

		//;smartkey.C: 521: PR2 =11;
		LDWI 	BH 			//0275 	2A0B
		BSR 	STATUS,5 		//0276 	1A83
		STR 	12H 			//0277 	0192

		//;smartkey.C: 522: beepOn();
		LCALL 	737H 			//0278 	3737

		//;smartkey.C: 523: lostDetect =0;
		BCR 	STATUS,5 		//0279 	1283
		LJUMP 	1CFH 			//027A 	39CF

		//;smartkey.C: 524: }
		//;smartkey.C: 525: else {
		//;smartkey.C: 526: lostDetect =1;
		CLRR 	4BH 			//027B 	014B
		ORG		027CH
		INCR	4BH,1 			//027C 	09CB
		LJUMP 	1D0H 			//027D 	39D0

		//;smartkey.C: 529: }
		//;smartkey.C: 530: timeTick =0;
		//;smartkey.C: 536: {
		//;smartkey.C: 537: timeTick =0;
		CLRR 	70H 			//027E 	0170
		CLRR 	71H 			//027F 	0171

		//;smartkey.C: 538: beepOn();TMR2ON = 0;
		LCALL 	737H 			//0280 	3737
		LDWI 	2H 			//0281 	2A02
		BCR 	STATUS,5 		//0282 	1283
		BCR 	12H,2 			//0283 	1112
		ORG		0284H

		//;smartkey.C: 539: beep(10,2);
		STR 	24H 			//0284 	01A4
		LDWI 	AH 			//0285 	2A0A
		LCALL 	68EH 			//0286 	368E

		//;smartkey.C: 540: if(mtOldState == 3){reAlertOn =1;}
		LDR 	4CH,0 			//0287 	084C
		XORWI 	3H 			//0288 	2603
		BTSS 	STATUS,2 		//0289 	1D03
		LJUMP 	296H 			//028A 	3A96
		CLRR 	3BH 			//028B 	013B
		ORG		028CH
		INCR	3BH,1 			//028C 	09BB
		LJUMP 	296H 			//028D 	3A96
		LDR 	74H,0 			//028E 	0874
		XORWI 	1H 			//028F 	2601
		BTSC 	STATUS,2 		//0290 	1503
		LJUMP 	254H 			//0291 	3A54
		XORWI 	3H 			//0292 	2603
		BTSC 	STATUS,2 		//0293 	1503
		ORG		0294H
		LJUMP 	27EH 			//0294 	3A7E
		LJUMP 	296H 			//0295 	3A96

		//;smartkey.C: 544: }
		//;smartkey.C: 546: }
		//;smartkey.C: 548: PAIE = 1;
		BSR 	INTCON,3 		//0296 	198B

		//;smartkey.C: 549: }
		//;smartkey.C: 551: }
		//;smartkey.C: 555: {
		//;smartkey.C: 556: if((timeOut!=0)&&( timeTick >timeOut)){
		LDR 	48H,0 			//0297 	0848
		IORWR 	47H,0 			//0298 	0347
		BTSC 	STATUS,2 		//0299 	1503
		LJUMP 	30FH 			//029A 	3B0F
		LDR 	71H,0 			//029B 	0871
		ORG		029CH
		SUBWR 	48H,0 			//029C 	0C48
		BTSS 	STATUS,2 		//029D 	1D03
		LJUMP 	2A1H 			//029E 	3AA1
		LDR 	70H,0 			//029F 	0870
		SUBWR 	47H,0 			//02A0 	0C47
		BTSS 	STATUS,0 		//02A1 	1C03
		LJUMP 	301H 			//02A2 	3B01
		LJUMP 	30FH 			//02A3 	3B0F
		ORG		02A4H

		//;smartkey.C: 567: beepOff();
		LCALL 	73CH 			//02A4 	373C
		LDWI 	2CH 			//02A5 	2A2C

		//;smartkey.C: 568: RegStatus &=(~0x20);
		BCR 	STATUS,5 		//02A6 	1283
		BCR 	49H,5 			//02A7 	12C9

		//;smartkey.C: 569: setState(2,300);
		STR 	20H 			//02A8 	01A0
		LDWI 	1H 			//02A9 	2A01
		STR 	21H 			//02AA 	01A1
		LDWI 	2H 			//02AB 	2A02
		ORG		02ACH
		LCALL 	714H 			//02AC 	3714

		//;smartkey.C: 570: break;
		LJUMP 	30FH 			//02AD 	3B0F

		//;smartkey.C: 572: beepOff();
		LCALL 	73CH 			//02AE 	373C

		//;smartkey.C: 573: delay_x10ms(20);
		LDWI 	14H 			//02AF 	2A14
		BCR 	STATUS,5 		//02B0 	1283
		STR 	20H 			//02B1 	01A0
		CLRR 	21H 			//02B2 	0121
		LCALL 	6B9H 			//02B3 	36B9
		ORG		02B4H

		//;smartkey.C: 574: beepOn();TMR2ON = 0;reAlertOn =0;
		LCALL 	737H 			//02B4 	3737
		LDWI 	1EH 			//02B5 	2A1E
		BCR 	STATUS,5 		//02B6 	1283
		BCR 	12H,2 			//02B7 	1112
		CLRR 	3BH 			//02B8 	013B
		CLRR 	24H 			//02B9 	0124
		INCR	24H,1 			//02BA 	09A4
		LCALL 	68EH 			//02BB 	368E
		ORG		02BCH
		LDWI 	0H 			//02BC 	2A00

		//;smartkey.C: 576: setState(0,0);
		CLRR 	20H 			//02BD 	0120
		CLRR 	21H 			//02BE 	0121
		LCALL 	714H 			//02BF 	3714

		//;smartkey.C: 577: RA7 =0;
		BCR 	5H,7 			//02C0 	1385

		//;smartkey.C: 578: tmp16 = timeTick+40;
		LDR 	71H,0 			//02C1 	0871
		STR 	43H 			//02C2 	01C3
		LDR 	70H,0 			//02C3 	0870
		ORG		02C4H
		STR 	42H 			//02C4 	01C2
		LDWI 	28H 			//02C5 	2A28
		ADDWR 	42H,1 			//02C6 	0BC2
		BTSC 	STATUS,0 		//02C7 	1403
		INCR	43H,1 			//02C8 	09C3

		//;smartkey.C: 579: break;
		LJUMP 	30FH 			//02C9 	3B0F

		//;smartkey.C: 582: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LDWI 	8H 			//02CA 	2A08
		LCALL 	706H 			//02CB 	3706
		ORG		02CCH
		XORWI 	CCH 			//02CC 	26CC
		BTSS 	STATUS,2 		//02CD 	1D03
		LJUMP 	2D2H 			//02CE 	3AD2
		LDWI 	8H 			//02CF 	2A08
		CLRR 	20H 			//02D0 	0120
		LCALL 	621H 			//02D1 	3621

		//;smartkey.C: 584: if(reAlertOn){
		BCR 	STATUS,5 		//02D2 	1283
		LDR 	3BH,0 			//02D3 	083B
		ORG		02D4H
		BTSC 	STATUS,2 		//02D4 	1503
		LJUMP 	2E9H 			//02D5 	3AE9

		//;smartkey.C: 585: setState(4,6000);
		LDWI 	70H 			//02D6 	2A70
		STR 	20H 			//02D7 	01A0
		LDWI 	17H 			//02D8 	2A17
		STR 	21H 			//02D9 	01A1
		LDWI 	4H 			//02DA 	2A04
		LCALL 	714H 			//02DB 	3714
		ORG		02DCH

		//;smartkey.C: 586: cntTmp = timeTick+40;
		LDR 	71H,0 			//02DC 	0871
		STR 	46H 			//02DD 	01C6
		LDR 	70H,0 			//02DE 	0870
		STR 	45H 			//02DF 	01C5
		LDWI 	28H 			//02E0 	2A28
		ADDWR 	45H,1 			//02E1 	0BC5
		BTSC 	STATUS,0 		//02E2 	1403
		INCR	46H,1 			//02E3 	09C6
		ORG		02E4H

		//;smartkey.C: 587: PR2 =11;
		LDWI 	BH 			//02E4 	2A0B
		BSR 	STATUS,5 		//02E5 	1A83
		STR 	12H 			//02E6 	0192

		//;smartkey.C: 588: beepOn();
		LCALL 	737H 			//02E7 	3737

		//;smartkey.C: 590: }else if(mtOldState == 0){
		LJUMP 	30FH 			//02E8 	3B0F
		LDR 	4CH,1 			//02E9 	08CC
		BTSS 	STATUS,2 		//02EA 	1D03
		LJUMP 	2B4H 			//02EB 	3AB4
		ORG		02ECH

		//;smartkey.C: 592: beep(10,5);
		LDWI 	5H 			//02EC 	2A05
		STR 	24H 			//02ED 	01A4
		LDWI 	AH 			//02EE 	2A0A
		LCALL 	68EH 			//02EF 	368E
		LDWI 	40H 			//02F0 	2A40

		//;smartkey.C: 593: RegStatus |=(0x20);
		BSR 	49H,5 			//02F1 	1AC9

		//;smartkey.C: 596: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
		LCALL 	706H 			//02F2 	3706
		XORWI 	0H 			//02F3 	2600
		ORG		02F4H
		BTSC 	STATUS,2 		//02F4 	1503
		LJUMP 	2F9H 			//02F5 	3AF9
		LDWI 	40H 			//02F6 	2A40
		CLRR 	20H 			//02F7 	0120
		LCALL 	621H 			//02F8 	3621

		//;smartkey.C: 598: setState(1,3500);
		LDWI 	ACH 			//02F9 	2AAC
		BCR 	STATUS,5 		//02FA 	1283
		STR 	20H 			//02FB 	01A0
		ORG		02FCH
		LDWI 	DH 			//02FC 	2A0D
		STR 	21H 			//02FD 	01A1
		LDWI 	1H 			//02FE 	2A01
		LCALL 	714H 			//02FF 	3714
		LJUMP 	2C1H 			//0300 	3AC1

		//;smartkey.C: 605: setState(0,0);
		//;smartkey.C: 604: beep(30,1);
		//;smartkey.C: 603: reAlertOn =0;
		//;smartkey.C: 602: beepOn();TMR2ON = 0;
		LDR 	74H,0 			//0301 	0874
		XORWI 	1H 			//0302 	2601
		BTSC 	STATUS,2 		//0303 	1503
		ORG		0304H
		LJUMP 	30FH 			//0304 	3B0F
		XORWI 	3H 			//0305 	2603
		BTSC 	STATUS,2 		//0306 	1503
		LJUMP 	2CAH 			//0307 	3ACA
		XORWI 	1H 			//0308 	2601
		BTSC 	STATUS,2 		//0309 	1503
		LJUMP 	2A4H 			//030A 	3AA4
		XORWI 	7H 			//030B 	2607
		ORG		030CH
		BTSC 	STATUS,2 		//030C 	1503
		LJUMP 	2AEH 			//030D 	3AAE
		LJUMP 	30FH 			//030E 	3B0F

		//;smartkey.C: 611: }
		//;smartkey.C: 613: }
		//;smartkey.C: 615: if((timeTick>tmp16) && (mtState == 1) && mpuOk ==1){
		LDR 	71H,0 			//030F 	0871
		BCR 	STATUS,5 		//0310 	1283
		SUBWR 	43H,0 			//0311 	0C43
		BTSS 	STATUS,2 		//0312 	1D03
		LJUMP 	316H 			//0313 	3B16
		ORG		0314H
		LDR 	70H,0 			//0314 	0870
		SUBWR 	42H,0 			//0315 	0C42
		BTSC 	STATUS,0 		//0316 	1403
		LJUMP 	3AEH 			//0317 	3BAE
		DECRSZ 	74H,0 		//0318 	0E74
		LJUMP 	3AEH 			//0319 	3BAE
		DECRSZ 	3CH,0 		//031A 	0E3C
		LJUMP 	3AEH 			//031B 	3BAE
		ORG		031CH

		//;smartkey.C: 616: tmp16 = timeTick+40;
		LDR 	71H,0 			//031C 	0871
		STR 	43H 			//031D 	01C3
		LDR 	70H,0 			//031E 	0870
		STR 	42H 			//031F 	01C2
		LDWI 	28H 			//0320 	2A28
		ADDWR 	42H,1 			//0321 	0BC2
		BTSC 	STATUS,0 		//0322 	1403
		INCR	43H,1 			//0323 	09C3
		ORG		0324H

		//;smartkey.C: 617: if(AccRead(0x3b,buf,6)==0){
		LDWI 	35H 			//0324 	2A35
		STR 	24H 			//0325 	01A4
		LDWI 	6H 			//0326 	2A06
		CLRR 	25H 			//0327 	0125
		STR 	26H 			//0328 	01A6
		LDWI 	3BH 			//0329 	2A3B
		LCALL 	5BEH 			//032A 	35BE
		IORWI 	0H 			//032B 	2500
		ORG		032CH
		BTSS 	STATUS,2 		//032C 	1D03
		LJUMP 	3AEH 			//032D 	3BAE

		//;smartkey.C: 619: if(compe(buf[0], (signed char)acXsum,5) && compe(buf[2], (signed char)
		//+                          acYsum,5)){
		BCR 	STATUS,5 		//032E 	1283
		BCR 	STATUS,6 		//032F 	1303
		LDR 	3FH,0 			//0330 	083F
		STR 	20H 			//0331 	01A0
		LDWI 	5H 			//0332 	2A05
		STR 	21H 			//0333 	01A1
		ORG		0334H
		LDR 	35H,0 			//0334 	0835
		LCALL 	4ABH 			//0335 	34AB
		XORWI 	0H 			//0336 	2600
		BCR 	STATUS,5 		//0337 	1283
		BCR 	STATUS,6 		//0338 	1303
		BTSC 	STATUS,2 		//0339 	1503
		LJUMP 	35CH 			//033A 	3B5C
		LDR 	3DH,0 			//033B 	083D
		ORG		033CH
		STR 	20H 			//033C 	01A0
		LDWI 	5H 			//033D 	2A05
		STR 	21H 			//033E 	01A1
		LDR 	37H,0 			//033F 	0837
		LCALL 	4ABH 			//0340 	34AB
		XORWI 	0H 			//0341 	2600

		//;smartkey.C: 621: isSw++;
		BCR 	STATUS,5 		//0342 	1283
		BCR 	STATUS,6 		//0343 	1303
		ORG		0344H
		BTSC 	STATUS,2 		//0344 	1503
		LJUMP 	35CH 			//0345 	3B5C
		LDWI 	2DH 			//0346 	2A2D
		INCR	41H,1 			//0347 	09C1

		//;smartkey.C: 622: if(isSw >44){
		SUBWR 	41H,0 			//0348 	0C41
		BTSS 	STATUS,0 		//0349 	1C03
		LJUMP 	34FH 			//034A 	3B4F
		LDWI 	2H 			//034B 	2A02
		ORG		034CH

		//;smartkey.C: 623: isSw =0;
		CLRR 	41H 			//034C 	0141

		//;smartkey.C: 624: vibrateOn=2;
		STR 	34H 			//034D 	01B4
		LJUMP 	384H 			//034E 	3B84

		//;smartkey.C: 627: }
		//;smartkey.C: 626: setState(2,300);
		//;smartkey.C: 625: RegStatus &=(~0x20);
		//;smartkey.C: 628: else if(isSw > 25){
		LDWI 	1AH 			//034F 	2A1A
		SUBWR 	41H,0 			//0350 	0C41
		BTSC 	STATUS,0 		//0351 	1403

		//;smartkey.C: 629: if(isSw%2==0){
		BTSC 	41H,0 			//0352 	1441
		LJUMP 	38BH 			//0353 	3B8B
		ORG		0354H

		//;smartkey.C: 630: beepOn();TMR2ON = 0; beep(7,1);
		LCALL 	737H 			//0354 	3737
		LDWI 	7H 			//0355 	2A07
		BCR 	STATUS,5 		//0356 	1283
		BCR 	12H,2 			//0357 	1112
		CLRR 	24H 			//0358 	0124
		INCR	24H,1 			//0359 	09A4
		LCALL 	68EH 			//035A 	368E
		LJUMP 	38BH 			//035B 	3B8B
		ORG		035CH

		//;smartkey.C: 635: else{
		//;smartkey.C: 636: isSw =0;
		//;smartkey.C: 631: }
		//;smartkey.C: 632: }
		//;smartkey.C: 634: }
		CLRR 	41H 			//035C 	0141

		//;smartkey.C: 639: if(compe(buf[0], acXOld,2) && compe(buf[2], acYOld,2)){
		LDR 	33H,0 			//035D 	0833
		STR 	20H 			//035E 	01A0
		LDWI 	2H 			//035F 	2A02
		STR 	21H 			//0360 	01A1
		LDR 	35H,0 			//0361 	0835
		LCALL 	4ABH 			//0362 	34AB
		XORWI 	0H 			//0363 	2600
		ORG		0364H
		BCR 	STATUS,5 		//0364 	1283
		BCR 	STATUS,6 		//0365 	1303
		BTSC 	STATUS,2 		//0366 	1503
		LJUMP 	38DH 			//0367 	3B8D
		LDR 	32H,0 			//0368 	0832
		STR 	20H 			//0369 	01A0
		LDWI 	2H 			//036A 	2A02
		STR 	21H 			//036B 	01A1
		ORG		036CH
		LDR 	37H,0 			//036C 	0837
		LCALL 	4ABH 			//036D 	34AB
		XORWI 	0H 			//036E 	2600

		//;smartkey.C: 640: isWait++;
		BCR 	STATUS,5 		//036F 	1283
		BCR 	STATUS,6 		//0370 	1303
		BTSC 	STATUS,2 		//0371 	1503
		LJUMP 	38DH 			//0372 	3B8D
		INCR	2FH,1 			//0373 	09AF
		ORG		0374H
		BTSC 	STATUS,2 		//0374 	1503
		INCR	30H,1 			//0375 	09B0

		//;smartkey.C: 641: if(isWait==450){
		DECR 	30H,0 			//0376 	0D30
		LDWI 	C2H 			//0377 	2AC2
		BTSC 	STATUS,2 		//0378 	1503
		XORWR 	2FH,0 			//0379 	042F
		BTSS 	STATUS,2 		//037A 	1D03
		LJUMP 	38BH 			//037B 	3B8B
		ORG		037CH
		LDWI 	2H 			//037C 	2A02

		//;smartkey.C: 642: isWait = 0;
		CLRR 	2FH 			//037D 	012F
		CLRR 	30H 			//037E 	0130

		//;smartkey.C: 643: beep(7,2);
		STR 	24H 			//037F 	01A4
		LDWI 	7H 			//0380 	2A07
		LCALL 	68EH 			//0381 	368E

		//;smartkey.C: 644: vibrateOn=1;
		CLRR 	34H 			//0382 	0134
		INCR	34H,1 			//0383 	09B4
		ORG		0384H
		LDWI 	2CH 			//0384 	2A2C

		//;smartkey.C: 645: RegStatus &=(~0x20);
		BCR 	49H,5 			//0385 	12C9

		//;smartkey.C: 646: setState(2,300);
		STR 	20H 			//0386 	01A0
		LDWI 	1H 			//0387 	2A01
		STR 	21H 			//0388 	01A1
		LDWI 	2H 			//0389 	2A02
		LCALL 	714H 			//038A 	3714

		//;smartkey.C: 647: }
		//;smartkey.C: 648: }
		//;smartkey.C: 650: }
		//;smartkey.C: 652: if( (buf[4] > -31) && (buf[4] < 31)) {
		BCR 	STATUS,5 		//038B 	1283
		ORG		038CH
		BCR 	STATUS,6 		//038C 	1303
		LDR 	39H,0 			//038D 	0839
		XORWI 	80H 			//038E 	2680
		ADDWI 	9EH 			//038F 	279E
		BTSS 	STATUS,0 		//0390 	1C03
		LJUMP 	3A9H 			//0391 	3BA9
		LDR 	39H,0 			//0392 	0839
		XORWI 	80H 			//0393 	2680
		ORG		0394H
		ADDWI 	61H 			//0394 	2761
		BTSC 	STATUS,0 		//0395 	1403
		LJUMP 	3A9H 			//0396 	3BA9
		LDWI 	5H 			//0397 	2A05

		//;smartkey.C: 653: isFall++;
		INCR	31H,1 			//0398 	09B1

		//;smartkey.C: 654: if(isFall >4){
		SUBWR 	31H,0 			//0399 	0C31
		BTSS 	STATUS,0 		//039A 	1C03
		LJUMP 	3AAH 			//039B 	3BAA
		ORG		039CH
		LDWI 	2H 			//039C 	2A02

		//;smartkey.C: 655: isFall =0;
		CLRR 	31H 			//039D 	0131

		//;smartkey.C: 656: beep(7,2);
		STR 	24H 			//039E 	01A4
		LDWI 	7H 			//039F 	2A07
		LCALL 	68EH 			//03A0 	368E
		LDWI 	2CH 			//03A1 	2A2C

		//;smartkey.C: 657: RegStatus &=(~0x20);
		BCR 	49H,5 			//03A2 	12C9

		//;smartkey.C: 658: setState(2,300);
		STR 	20H 			//03A3 	01A0
		ORG		03A4H
		LDWI 	1H 			//03A4 	2A01
		STR 	21H 			//03A5 	01A1
		LDWI 	2H 			//03A6 	2A02
		LCALL 	714H 			//03A7 	3714
		LJUMP 	3AAH 			//03A8 	3BAA

		//;smartkey.C: 661: else{
		//;smartkey.C: 662: isFall=0;
		CLRR 	31H 			//03A9 	0131

		//;smartkey.C: 663: }
		//;smartkey.C: 665: acYOld = buf[2];acXOld = buf[0];
		LDR 	37H,0 			//03AA 	0837
		STR 	32H 			//03AB 	01B2
		ORG		03ACH
		LDR 	35H,0 			//03AC 	0835
		STR 	33H 			//03AD 	01B3

		//;smartkey.C: 666: }
		//;smartkey.C: 668: }
		//;smartkey.C: 671: if((timeTick>tmp16) && (mtState == 0 ) && mpuOk ==1){
		LDR 	71H,0 			//03AE 	0871
		BCR 	STATUS,5 		//03AF 	1283
		BCR 	STATUS,6 		//03B0 	1303
		SUBWR 	43H,0 			//03B1 	0C43
		BTSS 	STATUS,2 		//03B2 	1D03
		LJUMP 	3B6H 			//03B3 	3BB6
		ORG		03B4H
		LDR 	70H,0 			//03B4 	0870
		SUBWR 	42H,0 			//03B5 	0C42
		BTSC 	STATUS,0 		//03B6 	1403
		LJUMP 	416H 			//03B7 	3C16
		LDR 	74H,1 			//03B8 	08F4
		BTSS 	STATUS,2 		//03B9 	1D03
		LJUMP 	416H 			//03BA 	3C16
		DECRSZ 	3CH,0 		//03BB 	0E3C
		ORG		03BCH
		LJUMP 	416H 			//03BC 	3C16

		//;smartkey.C: 673: if(timeTick >65000) timeTick =0;
		LDWI 	FDH 			//03BD 	2AFD
		SUBWR 	71H,0 			//03BE 	0C71
		LDWI 	E9H 			//03BF 	2AE9
		BTSC 	STATUS,2 		//03C0 	1503
		SUBWR 	70H,0 			//03C1 	0C70
		BTSS 	STATUS,0 		//03C2 	1C03
		LJUMP 	3C6H 			//03C3 	3BC6
		ORG		03C4H
		CLRR 	70H 			//03C4 	0170
		CLRR 	71H 			//03C5 	0171

		//;smartkey.C: 674: tmp16 = timeTick+40;
		LDR 	71H,0 			//03C6 	0871
		STR 	43H 			//03C7 	01C3
		LDR 	70H,0 			//03C8 	0870
		STR 	42H 			//03C9 	01C2
		LDWI 	28H 			//03CA 	2A28
		ADDWR 	42H,1 			//03CB 	0BC2
		ORG		03CCH
		BTSC 	STATUS,0 		//03CC 	1403
		INCR	43H,1 			//03CD 	09C3

		//;smartkey.C: 676: if(AccRead(0x3b,buf,6)==0){
		LDWI 	35H 			//03CE 	2A35
		STR 	24H 			//03CF 	01A4
		LDWI 	6H 			//03D0 	2A06
		CLRR 	25H 			//03D1 	0125
		STR 	26H 			//03D2 	01A6
		LDWI 	3BH 			//03D3 	2A3B
		ORG		03D4H
		LCALL 	5BEH 			//03D4 	35BE
		IORWI 	0H 			//03D5 	2500

		//;smartkey.C: 677: if(vibrateOn==1){
		BCR 	STATUS,5 		//03D6 	1283
		BCR 	STATUS,6 		//03D7 	1303
		BTSS 	STATUS,2 		//03D8 	1D03
		LJUMP 	418H 			//03D9 	3C18
		DECRSZ 	34H,0 		//03DA 	0E34
		LJUMP 	3F4H 			//03DB 	3BF4
		ORG		03DCH

		//;smartkey.C: 678: if(compe(buf[0],acXOld ,2) && compe(buf[2],acYOld ,2)){
		LDR 	33H,0 			//03DC 	0833
		STR 	20H 			//03DD 	01A0
		LDWI 	2H 			//03DE 	2A02
		STR 	21H 			//03DF 	01A1
		LDR 	35H,0 			//03E0 	0835
		LCALL 	4ABH 			//03E1 	34AB
		XORWI 	0H 			//03E2 	2600
		BCR 	STATUS,5 		//03E3 	1283
		ORG		03E4H
		BCR 	STATUS,6 		//03E4 	1303
		BTSC 	STATUS,2 		//03E5 	1503
		LJUMP 	40EH 			//03E6 	3C0E
		LDR 	32H,0 			//03E7 	0832
		STR 	20H 			//03E8 	01A0
		LDWI 	2H 			//03E9 	2A02
		STR 	21H 			//03EA 	01A1
		LDR 	37H,0 			//03EB 	0837
		ORG		03ECH
		LCALL 	4ABH 			//03EC 	34AB
		XORWI 	0H 			//03ED 	2600
		BTSC 	STATUS,2 		//03EE 	1503
		LJUMP 	40CH 			//03EF 	3C0C

		//;smartkey.C: 680: isSw=0;
		BCR 	STATUS,5 		//03F0 	1283
		BCR 	STATUS,6 		//03F1 	1303
		CLRR 	41H 			//03F2 	0141

		//;smartkey.C: 683: }
		LJUMP 	416H 			//03F3 	3C16
		ORG		03F4H

		//;smartkey.C: 688: {
		//;smartkey.C: 689: beepOn();TMR2ON = 0; beep(7,3);
		//;smartkey.C: 684: else{
		//;smartkey.C: 685: isSw++;
		//;smartkey.C: 693: else if(vibrateOn==2){
		LDR 	34H,0 			//03F4 	0834
		XORWI 	2H 			//03F5 	2602
		BTSS 	STATUS,2 		//03F6 	1D03
		LJUMP 	416H 			//03F7 	3C16

		//;smartkey.C: 694: if(compe(buf[0],(signed char)acXsum ,5) && compe(buf[2],(signed char)a
		//+                          cYsum ,5)){
		LDR 	3FH,0 			//03F8 	083F
		STR 	20H 			//03F9 	01A0
		LDWI 	5H 			//03FA 	2A05
		STR 	21H 			//03FB 	01A1
		ORG		03FCH
		LDR 	35H,0 			//03FC 	0835
		LCALL 	4ABH 			//03FD 	34AB
		XORWI 	0H 			//03FE 	2600
		BCR 	STATUS,5 		//03FF 	1283
		BCR 	STATUS,6 		//0400 	1303
		BTSC 	STATUS,2 		//0401 	1503
		LJUMP 	40EH 			//0402 	3C0E
		LDR 	3DH,0 			//0403 	083D
		ORG		0404H
		STR 	20H 			//0404 	01A0
		LDWI 	5H 			//0405 	2A05
		STR 	21H 			//0406 	01A1
		LDR 	37H,0 			//0407 	0837
		LCALL 	4ABH 			//0408 	34AB
		XORWI 	0H 			//0409 	2600
		BTSS 	STATUS,2 		//040A 	1D03
		LJUMP 	3F0H 			//040B 	3BF0
		ORG		040CH

		//;smartkey.C: 700: else{
		//;smartkey.C: 701: isSw++;
		BCR 	STATUS,5 		//040C 	1283
		BCR 	STATUS,6 		//040D 	1303
		INCR	41H,1 			//040E 	09C1

		//;smartkey.C: 704: {
		//;smartkey.C: 705: beepOn();TMR2ON = 0; beep(7,3);
		LCALL 	737H 			//040F 	3737
		LDWI 	3H 			//0410 	2A03
		BCR 	STATUS,5 		//0411 	1283
		BCR 	12H,2 			//0412 	1112
		STR 	24H 			//0413 	01A4
		ORG		0414H
		LDWI 	7H 			//0414 	2A07
		LCALL 	68EH 			//0415 	368E

		//;smartkey.C: 706: }
		//;smartkey.C: 707: }
		//;smartkey.C: 708: }
		//;smartkey.C: 710: }
		//;smartkey.C: 713: }
		//;smartkey.C: 715: if(RegStatus & 0x20) {RC4 =1;RC2 =1;}
		BCR 	STATUS,5 		//0416 	1283
		BCR 	STATUS,6 		//0417 	1303
		BTSS 	49H,5 			//0418 	1EC9
		LJUMP 	41DH 			//0419 	3C1D
		BSR 	7H,4 			//041A 	1A07
		BSR 	7H,2 			//041B 	1907
		ORG		041CH
		LJUMP 	1C6H 			//041C 	39C6

		//;smartkey.C: 716: else {RC4 =0;RC2 =0;}
		BCR 	7H,4 			//041D 	1207
		BCR 	7H,2 			//041E 	1107
		LJUMP 	1C6H 			//041F 	39C6

		//;smartkey.C: 50: if(PAIE&&PAIF){
		BTSC 	INTCON,3 		//0420 	158B
		BTSS 	INTCON,0 		//0421 	1C0B
		LJUMP 	432H 			//0422 	3C32

		//;smartkey.C: 52: tmp = PORTA;
		BCR 	STATUS,5 		//0423 	1283
		ORG		0424H
		BCR 	STATUS,6 		//0424 	1303
		LDR 	5H,0 			//0425 	0805

		//;smartkey.C: 53: PAIF = 0;
		BCR 	INTCON,0 		//0426 	100B

		//;smartkey.C: 55: if(RA6){
		BTSS 	5H,6 			//0427 	1F05
		LJUMP 	431H 			//0428 	3C31

		//;smartkey.C: 57: if(mode_chek == 0){
		LDR 	73H,1 			//0429 	08F3
		BTSS 	STATUS,2 		//042A 	1D03
		LJUMP 	432H 			//042B 	3C32
		ORG		042CH

		//;smartkey.C: 58: cntCyc = 0;
		CLRR 	72H 			//042C 	0172

		//;smartkey.C: 59: cntOff = 0;
		CLRR 	4AH 			//042D 	014A

		//;smartkey.C: 61: mode_chek = 1;
		CLRR 	73H 			//042E 	0173
		INCR	73H,1 			//042F 	09F3
		LJUMP 	432H 			//0430 	3C32

		//;smartkey.C: 66: else{
		//;smartkey.C: 67: cntOff = 0;
		CLRR 	4AH 			//0431 	014A

		//;smartkey.C: 69: }
		//;smartkey.C: 71: }
		//;smartkey.C: 74: if(INTE&&INTF){
		BTSC 	INTCON,4 		//0432 	160B
		BTSS 	INTCON,1 		//0433 	1C8B
		ORG		0434H
		LJUMP 	449H 			//0434 	3C49

		//;smartkey.C: 75: unsigned char tmp;
		//;smartkey.C: 76: INTF = 0;
		BCR 	INTCON,1 		//0435 	108B

		//;smartkey.C: 78: if( RC1==0){
		BCR 	STATUS,5 		//0436 	1283
		BCR 	STATUS,6 		//0437 	1303
		BTSC 	7H,1 			//0438 	1487
		LJUMP 	449H 			//0439 	3C49

		//;smartkey.C: 80: if(timeTick <0x20){
		LDWI 	0H 			//043A 	2A00
		SUBWR 	71H,0 			//043B 	0C71
		ORG		043CH
		LDWI 	20H 			//043C 	2A20
		BTSC 	STATUS,2 		//043D 	1503
		SUBWR 	70H,0 			//043E 	0C70
		BTSC 	STATUS,0 		//043F 	1403
		LJUMP 	448H 			//0440 	3C48

		//;smartkey.C: 81: tmp = READ_EEPROM(0x40);
		LDWI 	40H 			//0441 	2A40
		LCALL 	72AH 			//0442 	372A
		STR 	79H 			//0443 	01F9
		ORG		0444H

		//;smartkey.C: 82: WRITE_EEPROM(0x40,tmp+1);
		INCR	79H,0 			//0444 	0979
		STR 	75H 			//0445 	01F5
		LDWI 	40H 			//0446 	2A40
		LCALL 	674H 			//0447 	3674
		LJUMP 	448H 			//0448 	3C48

		//;smartkey.C: 91: }
		//;smartkey.C: 93: }
		//;smartkey.C: 96: if(TMR1IE&&TMR1IF){
		BSR 	STATUS,5 		//0449 	1A83
		BCR 	STATUS,6 		//044A 	1303
		BTSS 	CH,0 			//044B 	1C0C
		ORG		044CH
		LJUMP 	49BH 			//044C 	3C9B
		BCR 	STATUS,5 		//044D 	1283
		BTSS 	CH,0 			//044E 	1C0C
		LJUMP 	49BH 			//044F 	3C9B
		LDWI 	ECH 			//0450 	2AEC

		//;smartkey.C: 98: TMR1IF = 0;
		BCR 	CH,0 			//0451 	100C

		//;smartkey.C: 100: TMR1H = -5000>>8;
		STR 	FH 			//0452 	018F

		//;smartkey.C: 101: TMR1L = -5000;
		LDWI 	78H 			//0453 	2A78
		ORG		0454H
		STR 	EH 			//0454 	018E

		//;smartkey.C: 107: if( mode_chek == 1){
		DECRSZ 	73H,0 		//0455 	0E73
		LJUMP 	46FH 			//0456 	3C6F

		//;smartkey.C: 109: cntCyc++;
		INCR	72H,1 			//0457 	09F2

		//;smartkey.C: 111: if(RA6==0){
		BTSC 	5H,6 			//0458 	1705
		LJUMP 	46FH 			//0459 	3C6F
		LDWI 	10H 			//045A 	2A10

		//;smartkey.C: 113: cntOff++;
		INCR	4AH,1 			//045B 	09CA
		ORG		045CH

		//;smartkey.C: 116: if(cntOff > 15){
		SUBWR 	4AH,0 			//045C 	0C4A
		BTSS 	STATUS,0 		//045D 	1C03
		LJUMP 	46FH 			//045E 	3C6F
		LDWI 	10H 			//045F 	2A10

		//;smartkey.C: 118: mode_chek = 0;
		CLRR 	73H 			//0460 	0173

		//;smartkey.C: 120: if((cntCyc>15) &&(cntCyc<50)) {
		SUBWR 	72H,0 			//0461 	0C72
		LDWI 	32H 			//0462 	2A32
		BTSS 	STATUS,0 		//0463 	1C03
		ORG		0464H
		LJUMP 	46BH 			//0464 	3C6B
		SUBWR 	72H,0 			//0465 	0C72
		BTSC 	STATUS,0 		//0466 	1403
		LJUMP 	46AH 			//0467 	3C6A

		//;smartkey.C: 121: RegStatus |= (0x40);
		BSR 	49H,6 			//0468 	1B49

		//;smartkey.C: 122: } else if (cntCyc>=50){
		LJUMP 	46EH 			//0469 	3C6E
		LDWI 	32H 			//046A 	2A32
		SUBWR 	72H,0 			//046B 	0C72
		ORG		046CH
		BTSC 	STATUS,0 		//046C 	1403

		//;smartkey.C: 123: RegStatus &= ~(0x40);
		BCR 	49H,6 			//046D 	1349

		//;smartkey.C: 124: }
		//;smartkey.C: 127: RegStatus |= 0x80;
		BSR 	49H,7 			//046E 	1BC9

		//;smartkey.C: 128: }
		//;smartkey.C: 130: }
		//;smartkey.C: 140: }
		//;smartkey.C: 143: timeTick++;
		INCR	70H,1 			//046F 	09F0
		BTSC 	STATUS,2 		//0470 	1503
		INCR	71H,1 			//0471 	09F1

		//;smartkey.C: 145: if((mtState == 4)||(mtState == 3)){
		LDR 	74H,0 			//0472 	0874
		XORWI 	4H 			//0473 	2604
		ORG		0474H
		BTSC 	STATUS,2 		//0474 	1503
		LJUMP 	47AH 			//0475 	3C7A
		LDR 	74H,0 			//0476 	0874
		XORWI 	3H 			//0477 	2603
		BTSS 	STATUS,2 		//0478 	1D03
		LJUMP 	49BH 			//0479 	3C9B

		//;smartkey.C: 147: if(timeTick > cntTmp){
		LDR 	71H,0 			//047A 	0871
		SUBWR 	46H,0 			//047B 	0C46
		ORG		047CH
		BTSS 	STATUS,2 		//047C 	1D03
		LJUMP 	480H 			//047D 	3C80
		LDR 	70H,0 			//047E 	0870
		SUBWR 	45H,0 			//047F 	0C45
		BTSC 	STATUS,0 		//0480 	1403
		LJUMP 	49BH 			//0481 	3C9B

		//;smartkey.C: 148: cntTmp = timeTick+40;
		LDR 	71H,0 			//0482 	0871
		STR 	46H 			//0483 	01C6
		ORG		0484H
		LDR 	70H,0 			//0484 	0870
		STR 	45H 			//0485 	01C5
		LDWI 	28H 			//0486 	2A28
		ADDWR 	45H,1 			//0487 	0BC5
		BTSC 	STATUS,0 		//0488 	1403
		INCR	46H,1 			//0489 	09C6

		//;smartkey.C: 149: if(cntTmp<=timeOut)
		LDR 	46H,0 			//048A 	0846
		SUBWR 	48H,0 			//048B 	0C48
		ORG		048CH
		BTSS 	STATUS,2 		//048C 	1D03
		LJUMP 	490H 			//048D 	3C90
		LDR 	45H,0 			//048E 	0845
		SUBWR 	47H,0 			//048F 	0C47

		//;smartkey.C: 150: {
		//;smartkey.C: 151: if(PR2 == 11)
		BSR 	STATUS,5 		//0490 	1A83
		BTSS 	STATUS,0 		//0491 	1C03
		LJUMP 	49CH 			//0492 	3C9C
		LDR 	12H,0 			//0493 	0812
		ORG		0494H
		XORWI 	BH 			//0494 	260B
		BTSS 	STATUS,2 		//0495 	1D03
		LJUMP 	499H 			//0496 	3C99

		//;smartkey.C: 152: PR2 = 30;
		LDWI 	1EH 			//0497 	2A1E
		LJUMP 	49AH 			//0498 	3C9A

		//;smartkey.C: 153: else
		//;smartkey.C: 154: PR2 = 11;
		LDWI 	BH 			//0499 	2A0B
		STR 	12H 			//049A 	0192

		//;smartkey.C: 155: }
		//;smartkey.C: 156: }
		//;smartkey.C: 157: }
		//;smartkey.C: 160: }
		//;smartkey.C: 163: if(TMR2IE&&TMR2IF)
		BSR 	STATUS,5 		//049B 	1A83
		ORG		049CH
		BTSS 	CH,1 			//049C 	1C8C
		LJUMP 	4A4H 			//049D 	3CA4
		BCR 	STATUS,5 		//049E 	1283
		BTSS 	CH,1 			//049F 	1C8C
		LJUMP 	4A4H 			//04A0 	3CA4
		LDWI 	10H 			//04A1 	2A10

		//;smartkey.C: 164: {
		//;smartkey.C: 165: TMR2IF = 0;
		BCR 	CH,1 			//04A2 	108C

		//;smartkey.C: 166: RA4 =~ RA4;
		XORWR 	5H,1 			//04A3 	0485
		ORG		04A4H
		LDR 	78H,0 			//04A4 	0878
		STR 	PCLATH 			//04A5 	018A
		SWAPR 	77H,0 			//04A6 	0777
		STR 	STATUS 			//04A7 	0183
		SWAPR 	7EH,1 			//04A8 	07FE
		SWAPR 	7EH,0 			//04A9 	077E
		RETI		 			//04AA 	0009
		STR 	27H 			//04AB 	01A7
		ORG		04ACH

		//;smartkey.C: 234: if(a>b){
		LDR 	20H,0 			//04AC 	0820
		XORWI 	80H 			//04AD 	2680
		STR 	22H 			//04AE 	01A2
		LDR 	27H,0 			//04AF 	0827
		XORWI 	80H 			//04B0 	2680
		SUBWR 	22H,1 			//04B1 	0CA2
		BTSC 	STATUS,0 		//04B2 	1403
		LJUMP 	4D7H 			//04B3 	3CD7
		ORG		04B4H

		//;smartkey.C: 235: if((a-b)<=dt) return 1;
		LDR 	20H,0 			//04B4 	0820
		SUBWR 	27H,0 			//04B5 	0C27
		STR 	22H 			//04B6 	01A2
		CLRR 	23H 			//04B7 	0123
		BTSS 	STATUS,0 		//04B8 	1C03
		DECR 	23H,1 			//04B9 	0DA3
		BTSC 	27H,7 			//04BA 	17A7
		DECR 	23H,1 			//04BB 	0DA3
		ORG		04BCH
		BTSC 	20H,7 			//04BC 	17A0
		INCR	23H,1 			//04BD 	09A3
		BCR 	STATUS,5 		//04BE 	1283
		LCALL 	4E4H 			//04BF 	34E4
		BTSS 	STATUS,2 		//04C0 	1D03
		LJUMP 	4C4H 			//04C1 	3CC4
		LDR 	22H,0 			//04C2 	0822
		SUBWR 	24H,0 			//04C3 	0C24
		ORG		04C4H
		BTSS 	STATUS,0 		//04C4 	1C03
		RETW 	0H 			//04C5 	2100
		RETW 	1H 			//04C6 	2101

		//;smartkey.C: 239: if((b-a)<=dt) return 1;
		SUBWR 	20H,0 			//04C7 	0C20
		STR 	22H 			//04C8 	01A2
		CLRR 	23H 			//04C9 	0123
		BTSS 	STATUS,0 		//04CA 	1C03
		DECR 	23H,1 			//04CB 	0DA3
		ORG		04CCH
		BTSC 	20H,7 			//04CC 	17A0
		DECR 	23H,1 			//04CD 	0DA3
		BTSC 	27H,7 			//04CE 	17A7
		INCR	23H,1 			//04CF 	09A3
		BCR 	STATUS,5 		//04D0 	1283
		LCALL 	4E4H 			//04D1 	34E4
		BTSS 	STATUS,2 		//04D2 	1D03
		LJUMP 	4C4H 			//04D3 	3CC4
		ORG		04D4H
		LDR 	22H,0 			//04D4 	0822
		SUBWR 	24H,0 			//04D5 	0C24
		LJUMP 	4C4H 			//04D6 	3CC4

		//;smartkey.C: 236: else return 0;
		//;smartkey.C: 238: else if(a<b){
		LDR 	27H,0 			//04D7 	0827
		XORWI 	80H 			//04D8 	2680
		STR 	22H 			//04D9 	01A2
		LDR 	20H,0 			//04DA 	0820
		XORWI 	80H 			//04DB 	2680
		ORG		04DCH
		SUBWR 	22H,1 			//04DC 	0CA2

		//;smartkey.C: 242: else if(a==b){
		LDR 	27H,0 			//04DD 	0827
		BTSS 	STATUS,0 		//04DE 	1C03
		LJUMP 	4C7H 			//04DF 	3CC7
		XORWR 	20H,0 			//04E0 	0420
		BTSC 	STATUS,2 		//04E1 	1503
		RETW 	1H 			//04E2 	2101
		RETW 	0H 			//04E3 	2100
		ORG		04E4H
		BCR 	STATUS,6 		//04E4 	1303
		LDR 	21H,0 			//04E5 	0821
		STR 	24H 			//04E6 	01A4
		CLRR 	25H 			//04E7 	0125
		BTSC 	24H,7 			//04E8 	17A4
		DECR 	25H,1 			//04E9 	0DA5
		LDR 	25H,0 			//04EA 	0825
		XORWI 	80H 			//04EB 	2680
		ORG		04ECH
		STR 	26H 			//04EC 	01A6
		LDR 	23H,0 			//04ED 	0823
		XORWI 	80H 			//04EE 	2680
		SUBWR 	26H,0 			//04EF 	0C26
		RET		 					//04F0 	0004

		//;mpu6x.c: 24: else
		//;mpu6x.c: 25: return 1;
		//;mpu6x.c: 21: else
		//;mpu6x.c: 22: return 2;
		BCR 	STATUS,5 		//04F1 	1283
		BCR 	STATUS,6 		//04F2 	1303
		STR 	21H 			//04F3 	01A1
		ORG		04F4H
		CLRR 	22H 			//04F4 	0122

		//;SWI2C.C: 115: RA0 = 0;
		BCR 	5H,0 			//04F5 	1005

		//;SWI2C.C: 116: TRISA |=0x02;;
		BSR 	STATUS,5 		//04F6 	1A83
		BSR 	5H,1 			//04F7 	1885

		//;SWI2C.C: 117: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	4F9H 			//04F8 	3CF9
		LJUMP 	4FAH 			//04F9 	3CFA
		LJUMP 	4FBH 			//04FA 	3CFB
		LJUMP 	4FCH 			//04FB 	3CFC
		ORG		04FCH

		//;SWI2C.C: 118: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//04FC 	1283
		BCR 	STATUS,6 		//04FD 	1303
		CLRR 	23H 			//04FE 	0123

		//;SWI2C.C: 119: {
		//;SWI2C.C: 120: RA0 = 1;
		BSR 	5H,0 			//04FF 	1805

		//;SWI2C.C: 121: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	501H 			//0500 	3D01
		LJUMP 	502H 			//0501 	3D02
		LJUMP 	503H 			//0502 	3D03
		LJUMP 	504H 			//0503 	3D04
		ORG		0504H

		//;SWI2C.C: 122: dat = dat<<1 |(RA1 & 1 );
		LDWI 	0H 			//0504 	2A00
		BCR 	STATUS,5 		//0505 	1283
		BCR 	STATUS,6 		//0506 	1303
		BTSC 	5H,1 			//0507 	1485
		LDWI 	1H 			//0508 	2A01
		ANDWI 	1H 			//0509 	2401
		STR 	20H 			//050A 	01A0
		BCR 	STATUS,0 		//050B 	1003
		ORG		050CH
		RLR 	22H,0 			//050C 	0522
		IORWR 	20H,0 			//050D 	0320
		STR 	22H 			//050E 	01A2

		//;SWI2C.C: 125: RA0 = 0;
		BCR 	5H,0 			//050F 	1005

		//;SWI2C.C: 126: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	511H 			//0510 	3D11
		LJUMP 	512H 			//0511 	3D12
		LJUMP 	513H 			//0512 	3D13
		LJUMP 	514H 			//0513 	3D14
		ORG		0514H
		LDWI 	8H 			//0514 	2A08
		BCR 	STATUS,5 		//0515 	1283
		BCR 	STATUS,6 		//0516 	1303
		INCR	23H,1 			//0517 	09A3
		SUBWR 	23H,0 			//0518 	0C23
		BTSS 	STATUS,0 		//0519 	1C03
		LJUMP 	4FFH 			//051A 	3CFF

		//;SWI2C.C: 127: }
		//;SWI2C.C: 129: TRISA &=0xfD;;
		BSR 	STATUS,5 		//051B 	1A83
		ORG		051CH
		BCR 	5H,1 			//051C 	1085

		//;SWI2C.C: 131: RA1 = (Ack) ? 0 : 1;
		BCR 	STATUS,5 		//051D 	1283
		LDR 	21H,1 			//051E 	08A1
		BCR 	STATUS,5 		//051F 	1283
		BCR 	STATUS,6 		//0520 	1303
		BTSS 	STATUS,2 		//0521 	1D03
		LJUMP 	525H 			//0522 	3D25
		BSR 	5H,1 			//0523 	1885
		ORG		0524H
		LJUMP 	526H 			//0524 	3D26
		BCR 	5H,1 			//0525 	1085

		//;SWI2C.C: 132: RA0 = 1;
		BSR 	5H,0 			//0526 	1805

		//;SWI2C.C: 133: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	528H 			//0527 	3D28
		LJUMP 	529H 			//0528 	3D29
		LJUMP 	52AH 			//0529 	3D2A
		LJUMP 	52BH 			//052A 	3D2B

		//;SWI2C.C: 134: RA0 = 0;
		BCR 	STATUS,5 		//052B 	1283
		ORG		052CH
		BCR 	STATUS,6 		//052C 	1303
		BCR 	5H,0 			//052D 	1005

		//;SWI2C.C: 135: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	52FH 			//052E 	3D2F
		LJUMP 	530H 			//052F 	3D30
		LJUMP 	531H 			//0530 	3D31
		LJUMP 	532H 			//0531 	3D32

		//;SWI2C.C: 136: return dat;
		BCR 	STATUS,5 		//0532 	1283
		BCR 	STATUS,6 		//0533 	1303
		ORG		0534H
		LDR 	22H,0 			//0534 	0822
		RET		 					//0535 	0004
		CLRR 	25H 			//0536 	0125
		BTSS 	21H,7 			//0537 	1FA1
		LJUMP 	540H 			//0538 	3D40
		COMR 	20H,1 			//0539 	0FA0
		COMR 	21H,1 			//053A 	0FA1
		INCR	20H,1 			//053B 	09A0
		ORG		053CH
		BTSC 	STATUS,2 		//053C 	1503
		INCR	21H,1 			//053D 	09A1
		CLRR 	25H 			//053E 	0125
		INCR	25H,1 			//053F 	09A5
		BTSS 	23H,7 			//0540 	1FA3
		LJUMP 	549H 			//0541 	3D49
		COMR 	22H,1 			//0542 	0FA2
		COMR 	23H,1 			//0543 	0FA3
		ORG		0544H
		INCR	22H,1 			//0544 	09A2
		BTSC 	STATUS,2 		//0545 	1503
		INCR	23H,1 			//0546 	09A3
		LDWI 	1H 			//0547 	2A01
		XORWR 	25H,1 			//0548 	04A5
		CLRR 	26H 			//0549 	0126
		CLRR 	27H 			//054A 	0127
		LDR 	21H,0 			//054B 	0821
		ORG		054CH
		IORWR 	20H,0 			//054C 	0320
		BTSC 	STATUS,2 		//054D 	1503
		LJUMP 	56EH 			//054E 	3D6E
		CLRR 	24H 			//054F 	0124
		INCR	24H,1 			//0550 	09A4
		BTSC 	21H,7 			//0551 	17A1
		LJUMP 	557H 			//0552 	3D57
		BCR 	STATUS,0 		//0553 	1003
		ORG		0554H
		RLR 	20H,1 			//0554 	05A0
		RLR 	21H,1 			//0555 	05A1
		LJUMP 	550H 			//0556 	3D50
		BCR 	STATUS,0 		//0557 	1003
		RLR 	26H,1 			//0558 	05A6
		RLR 	27H,1 			//0559 	05A7
		LDR 	21H,0 			//055A 	0821
		SUBWR 	23H,0 			//055B 	0C23
		ORG		055CH
		BTSS 	STATUS,2 		//055C 	1D03
		LJUMP 	560H 			//055D 	3D60
		LDR 	20H,0 			//055E 	0820
		SUBWR 	22H,0 			//055F 	0C22
		BTSS 	STATUS,0 		//0560 	1C03
		LJUMP 	56AH 			//0561 	3D6A
		LDR 	20H,0 			//0562 	0820
		SUBWR 	22H,1 			//0563 	0CA2
		ORG		0564H
		LDR 	21H,0 			//0564 	0821
		BTSS 	STATUS,0 		//0565 	1C03
		DECR 	23H,1 			//0566 	0DA3
		SUBWR 	23H,1 			//0567 	0CA3
		BSR 	26H,0 			//0568 	1826
		BCR 	STATUS,0 		//0569 	1003
		RRR	21H,1 			//056A 	06A1
		RRR	20H,1 			//056B 	06A0
		ORG		056CH
		DECRSZ 	24H,1 		//056C 	0EA4
		LJUMP 	557H 			//056D 	3D57
		LDR 	25H,0 			//056E 	0825
		BTSC 	STATUS,2 		//056F 	1503
		LJUMP 	576H 			//0570 	3D76
		COMR 	26H,1 			//0571 	0FA6
		COMR 	27H,1 			//0572 	0FA7
		INCR	26H,1 			//0573 	09A6
		ORG		0574H
		BTSC 	STATUS,2 		//0574 	1503
		INCR	27H,1 			//0575 	09A7
		LDR 	27H,0 			//0576 	0827
		STR 	21H 			//0577 	01A1
		LDR 	26H,0 			//0578 	0826
		STR 	20H 			//0579 	01A0
		RET		 					//057A 	0004
		BCR 	STATUS,5 		//057B 	1283
		ORG		057CH
		BCR 	STATUS,6 		//057C 	1303
		STR 	21H 			//057D 	01A1

		//;SWI2C.C: 89: TRISA &=0xfD;;
		BSR 	STATUS,5 		//057E 	1A83
		BCR 	5H,1 			//057F 	1085

		//;SWI2C.C: 90: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	581H 			//0580 	3D81
		LJUMP 	582H 			//0581 	3D82
		LJUMP 	583H 			//0582 	3D83
		LJUMP 	584H 			//0583 	3D84
		ORG		0584H

		//;SWI2C.C: 91: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//0584 	1283
		BCR 	STATUS,6 		//0585 	1303
		CLRR 	22H 			//0586 	0122

		//;SWI2C.C: 92: {
		//;SWI2C.C: 93: RA1 = (dat&0x80) ? 1:0;
		BTSS 	21H,7 			//0587 	1FA1
		LJUMP 	58DH 			//0588 	3D8D
		BCR 	STATUS,5 		//0589 	1283
		BCR 	STATUS,6 		//058A 	1303
		BSR 	5H,1 			//058B 	1885
		ORG		058CH
		LJUMP 	590H 			//058C 	3D90
		BCR 	STATUS,5 		//058D 	1283
		BCR 	STATUS,6 		//058E 	1303
		BCR 	5H,1 			//058F 	1085

		//;SWI2C.C: 94: dat<<=1;
		BCR 	STATUS,0 		//0590 	1003
		RLR 	21H,1 			//0591 	05A1

		//;SWI2C.C: 95: RA0 = 1;
		BSR 	5H,0 			//0592 	1805

		//;SWI2C.C: 96: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	594H 			//0593 	3D94
		ORG		0594H
		LJUMP 	595H 			//0594 	3D95
		LJUMP 	596H 			//0595 	3D96
		LJUMP 	597H 			//0596 	3D97

		//;SWI2C.C: 97: RA0 = 0;
		BCR 	STATUS,5 		//0597 	1283
		BCR 	STATUS,6 		//0598 	1303
		BCR 	5H,0 			//0599 	1005

		//;SWI2C.C: 98: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	59BH 			//059A 	3D9B
		LJUMP 	59CH 			//059B 	3D9C
		ORG		059CH
		LJUMP 	59DH 			//059C 	3D9D
		LJUMP 	59EH 			//059D 	3D9E
		LDWI 	8H 			//059E 	2A08
		BCR 	STATUS,5 		//059F 	1283
		BCR 	STATUS,6 		//05A0 	1303
		INCR	22H,1 			//05A1 	09A2
		SUBWR 	22H,0 			//05A2 	0C22
		BTSS 	STATUS,0 		//05A3 	1C03
		ORG		05A4H
		LJUMP 	587H 			//05A4 	3D87

		//;SWI2C.C: 99: }
		//;SWI2C.C: 101: TRISA |=0x02;;
		BSR 	STATUS,5 		//05A5 	1A83
		BSR 	5H,1 			//05A6 	1885

		//;SWI2C.C: 102: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	5A8H 			//05A7 	3DA8
		LJUMP 	5A9H 			//05A8 	3DA9
		LJUMP 	5AAH 			//05A9 	3DAA
		LJUMP 	5ABH 			//05AA 	3DAB

		//;SWI2C.C: 103: RA0 = 1;
		BCR 	STATUS,5 		//05AB 	1283
		ORG		05ACH
		BCR 	STATUS,6 		//05AC 	1303
		BSR 	5H,0 			//05AD 	1805

		//;SWI2C.C: 104: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	5AFH 			//05AE 	3DAF
		LJUMP 	5B0H 			//05AF 	3DB0
		LJUMP 	5B1H 			//05B0 	3DB1
		LJUMP 	5B2H 			//05B1 	3DB2

		//;SWI2C.C: 105: i= RA1;
		LDWI 	0H 			//05B2 	2A00
		BCR 	STATUS,5 		//05B3 	1283
		ORG		05B4H
		BCR 	STATUS,6 		//05B4 	1303
		BTSC 	5H,1 			//05B5 	1485
		LDWI 	1H 			//05B6 	2A01
		STR 	22H 			//05B7 	01A2

		//;SWI2C.C: 106: RA0 = 0;
		BCR 	5H,0 			//05B8 	1005

		//;SWI2C.C: 107: TRISA &=0xfD;;
		BSR 	STATUS,5 		//05B9 	1A83
		BCR 	5H,1 			//05BA 	1085

		//;SWI2C.C: 108: return i;
		BCR 	STATUS,5 		//05BB 	1283
		ORG		05BCH
		LDR 	22H,0 			//05BC 	0822
		RET		 					//05BD 	0004
		STR 	2AH 			//05BE 	01AA

		//;mpu6x.c: 32: unsigned char i;
		//;mpu6x.c: 34: swI2C_Start();
		LCALL 	6A4H 			//05BF 	36A4

		//;mpu6x.c: 36: if(swI2C_WriteByte(0x68<<1)== 0 )
		LDWI 	D0H 			//05C0 	2AD0
		LCALL 	57BH 			//05C1 	357B
		IORWI 	0H 			//05C2 	2500
		BTSS 	STATUS,2 		//05C3 	1D03
		ORG		05C4H
		RETW 	1H 			//05C4 	2101

		//;mpu6x.c: 37: {
		//;mpu6x.c: 38: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	2AH,0 			//05C5 	082A
		LCALL 	57BH 			//05C6 	357B
		IORWI 	0H 			//05C7 	2500
		BTSS 	STATUS,2 		//05C8 	1D03
		RETW 	2H 			//05C9 	2102

		//;mpu6x.c: 39: {
		//;mpu6x.c: 40: swI2C_Start();
		LCALL 	6A4H 			//05CA 	36A4

		//;mpu6x.c: 41: if(swI2C_WriteByte((0x68<<1)|1)== 0 ){
		LDWI 	D1H 			//05CB 	2AD1
		ORG		05CCH
		LCALL 	57BH 			//05CC 	357B
		IORWI 	0H 			//05CD 	2500
		BTSS 	STATUS,2 		//05CE 	1D03
		RETW 	1H 			//05CF 	2101

		//;mpu6x.c: 43: for(i=0; i<(len-1);i++){
		CLRR 	2BH 			//05D0 	012B
		LDR 	26H,0 			//05D1 	0826
		ADDWI 	FFH 			//05D2 	27FF
		STR 	27H 			//05D3 	01A7
		ORG		05D4H
		LDWI 	FFH 			//05D4 	2AFF
		BTSC 	STATUS,0 		//05D5 	1403
		LDWI 	0H 			//05D6 	2A00
		STR 	28H 			//05D7 	01A8
		XORWI 	80H 			//05D8 	2680
		SUBWI 	80H 			//05D9 	2880
		BTSS 	STATUS,2 		//05DA 	1D03
		LJUMP 	5DEH 			//05DB 	3DDE
		ORG		05DCH
		LDR 	27H,0 			//05DC 	0827
		SUBWR 	2BH,0 			//05DD 	0C2B

		//;mpu6x.c: 44: dat[i]=swI2C_ReadByte(1);
		LDWI 	1H 			//05DE 	2A01
		BTSC 	STATUS,0 		//05DF 	1403
		LJUMP 	5E5H 			//05E0 	3DE5
		LCALL 	4F1H 			//05E1 	34F1
		LCALL 	5E9H 			//05E2 	35E9
		INCR	2BH,1 			//05E3 	09AB
		ORG		05E4H
		LJUMP 	5D1H 			//05E4 	3DD1

		//;mpu6x.c: 45: }
		//;mpu6x.c: 46: dat[i]=swI2C_ReadByte(1);
		LCALL 	4F1H 			//05E5 	34F1
		LCALL 	5E9H 			//05E6 	35E9

		//;mpu6x.c: 47: swI2C_Stop();
		LCALL 	6EAH 			//05E7 	36EA

		//;mpu6x.c: 48: return 0;
		RETW 	0H 			//05E8 	2100

		//;mpu6x.c: 54: else
		//;mpu6x.c: 55: return 2;
		//;mpu6x.c: 51: else
		//;mpu6x.c: 52: return 1;
		STR 	27H 			//05E9 	01A7
		LDR 	2BH,0 			//05EA 	082B
		ADDWR 	24H,0 			//05EB 	0B24
		ORG		05ECH
		STR 	28H 			//05EC 	01A8
		LDR 	25H,0 			//05ED 	0825
		BTSC 	STATUS,0 		//05EE 	1403
		ADDWI 	1H 			//05EF 	2701
		STR 	29H 			//05F0 	01A9
		LDR 	28H,0 			//05F1 	0828
		STR 	FSR 			//05F2 	0184
		BCR 	STATUS,7 		//05F3 	1383
		ORG		05F4H
		BTSC 	29H,0 			//05F4 	1429
		BSR 	STATUS,7 		//05F5 	1B83
		LDR 	27H,0 			//05F6 	0827
		STR 	INDF 			//05F7 	0180
		RET		 					//05F8 	0004
		STR 	28H 			//05F9 	01A8

		//;mpu6x.c: 5: unsigned char i;
		//;mpu6x.c: 6: swI2C_Start();
		LCALL 	6A4H 			//05FA 	36A4

		//;mpu6x.c: 8: if(swI2C_WriteByte(0x68<<1)== 0 )
		LDWI 	D0H 			//05FB 	2AD0
		ORG		05FCH
		LCALL 	57BH 			//05FC 	357B
		IORWI 	0H 			//05FD 	2500
		BTSS 	STATUS,2 		//05FE 	1D03
		RETW 	1H 			//05FF 	2101

		//;mpu6x.c: 9: {
		//;mpu6x.c: 10: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	28H,0 			//0600 	0828
		LCALL 	57BH 			//0601 	357B
		IORWI 	0H 			//0602 	2500
		BTSS 	STATUS,2 		//0603 	1D03
		ORG		0604H
		RETW 	2H 			//0604 	2102

		//;mpu6x.c: 11: {
		//;mpu6x.c: 12: for(i=0; i<len;i++){
		CLRR 	29H 			//0605 	0129
		LDR 	25H,0 			//0606 	0825
		SUBWR 	29H,0 			//0607 	0C29
		BTSC 	STATUS,0 		//0608 	1403
		LJUMP 	61FH 			//0609 	3E1F

		//;mpu6x.c: 13: if(swI2C_WriteByte(dat[i])==1 ){
		LDR 	29H,0 			//060A 	0829
		ADDWR 	23H,0 			//060B 	0B23
		ORG		060CH
		STR 	26H 			//060C 	01A6
		LDR 	24H,0 			//060D 	0824
		BTSC 	STATUS,0 		//060E 	1403
		ADDWI 	1H 			//060F 	2701
		STR 	27H 			//0610 	01A7
		LDR 	26H,0 			//0611 	0826
		STR 	FSR 			//0612 	0184
		BSR 	STATUS,7 		//0613 	1B83
		ORG		0614H
		BTSS 	27H,0 			//0614 	1C27
		BCR 	STATUS,7 		//0615 	1383
		LDR 	INDF,0 			//0616 	0800
		LCALL 	57BH 			//0617 	357B
		XORWI 	1H 			//0618 	2601
		BTSS 	STATUS,2 		//0619 	1D03
		LJUMP 	61DH 			//061A 	3E1D

		//;mpu6x.c: 14: swI2C_Stop();
		LCALL 	6EAH 			//061B 	36EA
		ORG		061CH

		//;mpu6x.c: 15: return 3;
		RETW 	3H 			//061C 	2103
		INCR	29H,1 			//061D 	09A9
		LJUMP 	606H 			//061E 	3E06

		//;mpu6x.c: 16: }
		//;mpu6x.c: 17: }
		//;mpu6x.c: 18: swI2C_Stop();
		LCALL 	6EAH 			//061F 	36EA

		//;mpu6x.c: 19: return 0;
		RETW 	0H 			//0620 	2100
		STR 	21H 			//0621 	01A1

		//;smartkey.C: 212: GIE = 0;
		BCR 	INTCON,7 		//0622 	138B

		//;smartkey.C: 213: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//0623 	1F8B
		ORG		0624H
		LJUMP 	627H 			//0624 	3E27
		CLRWDT	 			//0625 	0001
		LJUMP 	623H 			//0626 	3E23

		//;smartkey.C: 214: EEADR = EEAddr;
		BCR 	STATUS,5 		//0627 	1283
		BCR 	STATUS,6 		//0628 	1303
		LDR 	21H,0 			//0629 	0821
		BSR 	STATUS,5 		//062A 	1A83
		STR 	1BH 			//062B 	019B
		ORG		062CH

		//;smartkey.C: 215: EEDAT = EEData;
		BCR 	STATUS,5 		//062C 	1283
		LDR 	20H,0 			//062D 	0820
		BSR 	STATUS,5 		//062E 	1A83
		STR 	1AH 			//062F 	019A
		LDWI 	34H 			//0630 	2A34

		//;smartkey.C: 216: EEIF = 0;
		BCR 	STATUS,5 		//0631 	1283
		BCR 	CH,7 			//0632 	138C

		//;smartkey.C: 217: EECON1 = 0x34;
		BSR 	STATUS,5 		//0633 	1A83
		ORG		0634H
		STR 	1CH 			//0634 	019C

		//;smartkey.C: 218: WR = 1;
		BSR 	1DH,0 			//0635 	181D

		//;smartkey.C: 219: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//0636 	1A83
		BCR 	STATUS,6 		//0637 	1303
		BTSS 	1DH,0 			//0638 	1C1D
		LJUMP 	63CH 			//0639 	3E3C
		CLRWDT	 			//063A 	0001
		LJUMP 	636H 			//063B 	3E36
		ORG		063CH

		//;smartkey.C: 221: GIE = 1;
		BSR 	INTCON,7 		//063C 	1B8B
		RET		 					//063D 	0004

		//;SWI2C.C: 10: TRISA &=0xfD;;
		BSR 	STATUS,5 		//063E 	1A83
		BCR 	5H,1 			//063F 	1085

		//;SWI2C.C: 11: TRISA &=0xfe;;
		BCR 	5H,0 			//0640 	1005

		//;SWI2C.C: 12: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	642H 			//0641 	3E42
		LJUMP 	643H 			//0642 	3E43
		LJUMP 	644H 			//0643 	3E44
		ORG		0644H
		LJUMP 	645H 			//0644 	3E45

		//;SWI2C.C: 13: RA0 = 1;
		BCR 	STATUS,5 		//0645 	1283
		BCR 	STATUS,6 		//0646 	1303
		BSR 	5H,0 			//0647 	1805

		//;SWI2C.C: 14: RA1 = 1;
		BSR 	5H,1 			//0648 	1885

		//;SWI2C.C: 15: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	64AH 			//0649 	3E4A
		LJUMP 	64BH 			//064A 	3E4B
		LJUMP 	64CH 			//064B 	3E4C
		ORG		064CH
		LJUMP 	64DH 			//064C 	3E4D

		//;SWI2C.C: 16: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	64EH 			//064D 	3E4E
		LJUMP 	64FH 			//064E 	3E4F
		LJUMP 	650H 			//064F 	3E50
		LJUMP 	651H 			//0650 	3E51

		//;SWI2C.C: 17: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	652H 			//0651 	3E52
		LJUMP 	653H 			//0652 	3E53
		LJUMP 	654H 			//0653 	3E54
		ORG		0654H
		LJUMP 	655H 			//0654 	3E55

		//;SWI2C.C: 18: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	656H 			//0655 	3E56
		LJUMP 	657H 			//0656 	3E57
		LJUMP 	658H 			//0657 	3E58
		LJUMP 	659H 			//0658 	3E59
		RET		 					//0659 	0004

		//;sysinit.c: 72: INTCON = 0B00000000;
		CLRR 	INTCON 			//065A 	010B

		//;sysinit.c: 73: PIE1 = 0B00000000;
		CLRR 	CH 			//065B 	010C
		ORG		065CH

		//;sysinit.c: 74: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//065C 	1283
		CLRR 	CH 			//065D 	010C

		//;sysinit.c: 76: IOCA6 = 1;
		BSR 	STATUS,5 		//065E 	1A83
		BSR 	16H,6 			//065F 	1B16

		//;sysinit.c: 77: tmp = PORTA;
		BCR 	STATUS,5 		//0660 	1283
		LDR 	5H,0 			//0661 	0805

		//;sysinit.c: 78: PAIF = 0;
		BCR 	INTCON,0 		//0662 	100B

		//;sysinit.c: 79: PAIE = 0;
		BCR 	INTCON,3 		//0663 	118B
		ORG		0664H

		//;sysinit.c: 82: INTEDG = 0;
		BSR 	STATUS,5 		//0664 	1A83
		BCR 	1H,6 			//0665 	1301

		//;sysinit.c: 83: INTF = 0;
		BCR 	INTCON,1 		//0666 	108B

		//;sysinit.c: 84: INTE = 1;
		BSR 	INTCON,4 		//0667 	1A0B

		//;sysinit.c: 86: TMR2IF = 0;
		BCR 	STATUS,5 		//0668 	1283
		BCR 	CH,1 			//0669 	108C

		//;sysinit.c: 87: TMR2IE = 1;
		BSR 	STATUS,5 		//066A 	1A83
		BSR 	CH,1 			//066B 	188C
		ORG		066CH

		//;sysinit.c: 88: TMR2ON = 0;
		BCR 	STATUS,5 		//066C 	1283
		BCR 	12H,2 			//066D 	1112

		//;sysinit.c: 90: TMR1IF = 0;
		BCR 	CH,0 			//066E 	100C

		//;sysinit.c: 91: TMR1IE = 1;
		BSR 	STATUS,5 		//066F 	1A83
		BSR 	CH,0 			//0670 	180C

		//;sysinit.c: 94: PEIE = 1;
		BSR 	INTCON,6 		//0671 	1B0B

		//;sysinit.c: 96: GIE = 1;
		BSR 	INTCON,7 		//0672 	1B8B
		RET		 					//0673 	0004
		ORG		0674H
		STR 	76H 			//0674 	01F6

		//;smartkey.C: 212: GIE = 0;
		BCR 	INTCON,7 		//0675 	138B

		//;smartkey.C: 213: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//0676 	1F8B
		LJUMP 	67AH 			//0677 	3E7A
		CLRWDT	 			//0678 	0001
		LJUMP 	676H 			//0679 	3E76

		//;smartkey.C: 214: EEADR = EEAddr;
		LDR 	76H,0 			//067A 	0876
		BSR 	STATUS,5 		//067B 	1A83
		ORG		067CH
		BCR 	STATUS,6 		//067C 	1303
		STR 	1BH 			//067D 	019B

		//;smartkey.C: 215: EEDAT = EEData;
		LDR 	75H,0 			//067E 	0875
		STR 	1AH 			//067F 	019A
		LDWI 	34H 			//0680 	2A34

		//;smartkey.C: 216: EEIF = 0;
		BCR 	STATUS,5 		//0681 	1283
		BCR 	CH,7 			//0682 	138C

		//;smartkey.C: 217: EECON1 = 0x34;
		BSR 	STATUS,5 		//0683 	1A83
		ORG		0684H
		STR 	1CH 			//0684 	019C

		//;smartkey.C: 218: WR = 1;
		BSR 	1DH,0 			//0685 	181D

		//;smartkey.C: 219: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//0686 	1A83
		BCR 	STATUS,6 		//0687 	1303
		BTSS 	1DH,0 			//0688 	1C1D
		LJUMP 	68CH 			//0689 	3E8C
		CLRWDT	 			//068A 	0001
		LJUMP 	686H 			//068B 	3E86
		ORG		068CH

		//;smartkey.C: 221: GIE = 1;
		BSR 	INTCON,7 		//068C 	1B8B
		RET		 					//068D 	0004
		STR 	25H 			//068E 	01A5

		//;smartkey.C: 185: {
		//;smartkey.C: 186: while(rep--){
		DECR 	24H,1 			//068F 	0DA4
		LDR 	24H,0 			//0690 	0824
		XORWI 	FFH 			//0691 	26FF
		BTSC 	STATUS,2 		//0692 	1503
		RET		 					//0693 	0004
		ORG		0694H
		LDWI 	CH 			//0694 	2A0C

		//;smartkey.C: 187: TMR2ON = 1;
		BSR 	12H,2 			//0695 	1912

		//;smartkey.C: 188: PR2 = 12;
		BSR 	STATUS,5 		//0696 	1A83
		STR 	12H 			//0697 	0192

		//;smartkey.C: 189: delay_x10ms(delay);
		BCR 	STATUS,5 		//0698 	1283
		LDR 	25H,0 			//0699 	0825
		STR 	20H 			//069A 	01A0
		CLRR 	21H 			//069B 	0121
		ORG		069CH
		LCALL 	6B9H 			//069C 	36B9
		LDWI 	14H 			//069D 	2A14

		//;smartkey.C: 190: TMR2ON = 0;RA4 =0;
		BCR 	12H,2 			//069E 	1112
		BCR 	5H,4 			//069F 	1205

		//;smartkey.C: 191: delay_x10ms(20);
		STR 	20H 			//06A0 	01A0
		CLRR 	21H 			//06A1 	0121
		LCALL 	6B9H 			//06A2 	36B9
		LJUMP 	68FH 			//06A3 	3E8F
		ORG		06A4H

		//;SWI2C.C: 24: RA0 = 1;
		BSR 	5H,0 			//06A4 	1805

		//;SWI2C.C: 26: RA1 = 1;
		BSR 	5H,1 			//06A5 	1885

		//;SWI2C.C: 27: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	6A7H 			//06A6 	3EA7
		LJUMP 	6A8H 			//06A7 	3EA8
		LJUMP 	6A9H 			//06A8 	3EA9
		LJUMP 	6AAH 			//06A9 	3EAA

		//;SWI2C.C: 28: RA1 = 0;
		BCR 	STATUS,5 		//06AA 	1283
		BCR 	STATUS,6 		//06AB 	1303
		ORG		06ACH
		BCR 	5H,1 			//06AC 	1085

		//;SWI2C.C: 29: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	6AEH 			//06AD 	3EAE
		LJUMP 	6AFH 			//06AE 	3EAF
		LJUMP 	6B0H 			//06AF 	3EB0
		LJUMP 	6B1H 			//06B0 	3EB1

		//;SWI2C.C: 30: RA0 = 0;
		BCR 	STATUS,5 		//06B1 	1283
		BCR 	STATUS,6 		//06B2 	1303
		BCR 	5H,0 			//06B3 	1005
		ORG		06B4H

		//;SWI2C.C: 31: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	6B5H 			//06B4 	3EB5
		LJUMP 	6B6H 			//06B5 	3EB6
		LJUMP 	6B7H 			//06B6 	3EB7
		LJUMP 	6B8H 			//06B7 	3EB8
		RET		 					//06B8 	0004

		//;smartkey.C: 173: unsigned int set = t + timeTick;
		LDR 	21H,0 			//06B9 	0821
		STR 	23H 			//06BA 	01A3
		LDR 	20H,0 			//06BB 	0820
		ORG		06BCH
		STR 	22H 			//06BC 	01A2
		LDR 	70H,0 			//06BD 	0870
		ADDWR 	22H,1 			//06BE 	0BA2
		BTSC 	STATUS,0 		//06BF 	1403
		INCR	23H,1 			//06C0 	09A3
		LDR 	71H,0 			//06C1 	0871
		ADDWR 	23H,1 			//06C2 	0BA3

		//;smartkey.C: 174: while(timeTick < set);
		LDR 	23H,0 			//06C3 	0823
		ORG		06C4H
		SUBWR 	71H,0 			//06C4 	0C71
		BTSS 	STATUS,2 		//06C5 	1D03
		LJUMP 	6C9H 			//06C6 	3EC9
		LDR 	22H,0 			//06C7 	0822
		SUBWR 	70H,0 			//06C8 	0C70
		BTSC 	STATUS,0 		//06C9 	1403
		RET		 					//06CA 	0004
		LJUMP 	6C3H 			//06CB 	3EC3
		ORG		06CCH
		CLRR 	70H 			//06CC 	0170
		CLRR 	71H 			//06CD 	0171
		CLRR 	72H 			//06CE 	0172
		CLRR 	73H 			//06CF 	0173
		CLRR 	74H 			//06D0 	0174
		CLRR 	45H 			//06D1 	0145
		CLRR 	46H 			//06D2 	0146
		CLRR 	47H 			//06D3 	0147
		ORG		06D4H
		CLRR 	48H 			//06D4 	0148
		CLRR 	49H 			//06D5 	0149
		CLRR 	4AH 			//06D6 	014A
		CLRR 	4BH 			//06D7 	014B
		CLRR 	4CH 			//06D8 	014C
		CLRR 	STATUS 			//06D9 	0103
		LJUMP 	0BH 			//06DA 	380B

		//;sysinit.c: 55: TMR2 = 0;
		BCR 	STATUS,5 		//06DB 	1283
		ORG		06DCH
		CLRR 	11H 			//06DC 	0111

		//;sysinit.c: 56: PR2 = 0;
		BSR 	STATUS,5 		//06DD 	1A83
		CLRR 	12H 			//06DE 	0112

		//;sysinit.c: 57: T2CON = 0B00101001;
		LDWI 	29H 			//06DF 	2A29
		BCR 	STATUS,5 		//06E0 	1283
		STR 	12H 			//06E1 	0192

		//;sysinit.c: 60: TMR1H = -5000>>8;
		LDWI 	ECH 			//06E2 	2AEC
		STR 	FH 			//06E3 	018F
		ORG		06E4H

		//;sysinit.c: 61: TMR1L = -5000;
		LDWI 	78H 			//06E4 	2A78
		STR 	EH 			//06E5 	018E

		//;sysinit.c: 62: T1CON = 0B00100001;
		LDWI 	21H 			//06E6 	2A21
		STR 	10H 			//06E7 	0190

		//;sysinit.c: 63: TMR1ON = 1;
		BSR 	10H,0 			//06E8 	1810
		RET		 					//06E9 	0004

		//;SWI2C.C: 37: RA1 = 0;
		BCR 	5H,1 			//06EA 	1085

		//;SWI2C.C: 38: RA0 = 1;
		BSR 	5H,0 			//06EB 	1805
		ORG		06ECH

		//;SWI2C.C: 39: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	6EDH 			//06EC 	3EED
		LJUMP 	6EEH 			//06ED 	3EEE
		LJUMP 	6EFH 			//06EE 	3EEF
		LJUMP 	6F0H 			//06EF 	3EF0

		//;SWI2C.C: 40: RA1 = 1;
		BCR 	STATUS,5 		//06F0 	1283
		BCR 	STATUS,6 		//06F1 	1303
		BSR 	5H,1 			//06F2 	1885

		//;SWI2C.C: 41: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	6F4H 			//06F3 	3EF4
		ORG		06F4H
		LJUMP 	6F5H 			//06F4 	3EF5
		LJUMP 	6F6H 			//06F5 	3EF6
		LJUMP 	6F7H 			//06F6 	3EF7
		RET		 					//06F7 	0004

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//06F8 	1283
		CLRR 	5H 			//06F9 	0105

		//;sysinit.c: 35: TRISA = 0B01101110;
		LDWI 	6EH 			//06FA 	2A6E
		BSR 	STATUS,5 		//06FB 	1A83
		ORG		06FCH
		STR 	5H 			//06FC 	0185

		//;sysinit.c: 36: WPUA = 0B10000000;
		LDWI 	80H 			//06FD 	2A80
		STR 	15H 			//06FE 	0195

		//;sysinit.c: 38: PORTC = 0B00000000;
		BCR 	STATUS,5 		//06FF 	1283
		CLRR 	7H 			//0700 	0107

		//;sysinit.c: 39: TRISC = 0B11101011;
		LDWI 	EBH 			//0701 	2AEB
		BSR 	STATUS,5 		//0702 	1A83
		STR 	7H 			//0703 	0187
		ORG		0704H

		//;sysinit.c: 40: WPUC = 0B00000000;
		CLRR 	8H 			//0704 	0108
		RET		 					//0705 	0004
		BCR 	STATUS,5 		//0706 	1283
		BCR 	STATUS,6 		//0707 	1303
		STR 	20H 			//0708 	01A0

		//;smartkey.C: 201: unsigned char ReEepromData;
		//;smartkey.C: 203: EEADR = EEAddr;
		BSR 	STATUS,5 		//0709 	1A83
		STR 	1BH 			//070A 	019B

		//;smartkey.C: 204: RD = 1;
		BSR 	1CH,0 			//070B 	181C
		ORG		070CH

		//;smartkey.C: 205: ReEepromData = EEDAT;
		LDR 	1AH,0 			//070C 	081A
		BCR 	STATUS,5 		//070D 	1283
		STR 	21H 			//070E 	01A1

		//;smartkey.C: 206: RD = 0;
		BSR 	STATUS,5 		//070F 	1A83
		BCR 	1CH,0 			//0710 	101C

		//;smartkey.C: 207: return ReEepromData;
		BCR 	STATUS,5 		//0711 	1283
		LDR 	21H,0 			//0712 	0821
		RET		 					//0713 	0004
		ORG		0714H
		STR 	22H 			//0714 	01A2

		//;smartkey.C: 227: mtOldState = mtState;
		LDR 	74H,0 			//0715 	0874
		STR 	4CH 			//0716 	01CC

		//;smartkey.C: 228: mtState = stt;
		LDR 	22H,0 			//0717 	0822
		STR 	74H 			//0718 	01F4

		//;smartkey.C: 229: timeTick =0;
		CLRR 	70H 			//0719 	0170
		CLRR 	71H 			//071A 	0171

		//;smartkey.C: 230: timeOut = _tOut;
		LDR 	21H,0 			//071B 	0821
		ORG		071CH
		STR 	48H 			//071C 	01C8
		LDR 	20H,0 			//071D 	0820
		STR 	47H 			//071E 	01C7
		RET		 					//071F 	0004

		//;sysinit.c: 21: OSCCON = 0B01010001;
		LDWI 	51H 			//0720 	2A51
		BSR 	STATUS,5 		//0721 	1A83
		BCR 	STATUS,6 		//0722 	1303
		STR 	FH 			//0723 	018F
		ORG		0724H

		//;sysinit.c: 22: _nop();
		NOP		 					//0724 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//0725 	1A83
		BCR 	STATUS,6 		//0726 	1303
		BTSC 	FH,2 			//0727 	150F
		RET		 					//0728 	0004
		LJUMP 	725H 			//0729 	3F25
		STR 	75H 			//072A 	01F5

		//;smartkey.C: 201: unsigned char ReEepromData;
		//;smartkey.C: 203: EEADR = EEAddr;
		BSR 	STATUS,5 		//072B 	1A83
		ORG		072CH
		STR 	1BH 			//072C 	019B

		//;smartkey.C: 204: RD = 1;
		BSR 	1CH,0 			//072D 	181C

		//;smartkey.C: 205: ReEepromData = EEDAT;
		LDR 	1AH,0 			//072E 	081A
		STR 	76H 			//072F 	01F6

		//;smartkey.C: 206: RD = 0;
		BCR 	1CH,0 			//0730 	101C

		//;smartkey.C: 207: return ReEepromData;
		RET		 					//0731 	0004
		LJUMP 	296H 			//0732 	3A96
		LJUMP 	1CFH 			//0733 	39CF
		ORG		0734H
		LJUMP 	1D6H 			//0734 	39D6
		LJUMP 	21FH 			//0735 	3A1F
		LJUMP 	240H 			//0736 	3A40

		//;smartkey.C: 181: TMR2ON = 1;
		BCR 	STATUS,5 		//0737 	1283
		BSR 	12H,2 			//0738 	1912

		//;smartkey.C: 182: TRISA &= 0xef;
		BSR 	STATUS,5 		//0739 	1A83
		BCR 	5H,4 			//073A 	1205
		RET		 					//073B 	0004
		ORG		073CH

		//;smartkey.C: 178: TMR2ON = 0;RA4 =0;TRISA |= 0x10;
		BCR 	12H,2 			//073C 	1112
		BCR 	5H,4 			//073D 	1205
		BSR 	STATUS,5 		//073E 	1A83
		BSR 	5H,4 			//073F 	1A05
		RET		 					//0740 	0004
			END

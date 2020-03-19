//Deviec:MS86Fxx02
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
		LJUMP 	3DBH 			//0009 	3BDB
		LJUMP 	699H 			//000A 	3E99

		//;smartkey.C: 251: unsigned char reAlertOn=0,tmp8,isSw=0,isFall=0,mpuOk=0,vibrateOn=0,acc
		//+                          Set=0;
		CLRR 	40H 			//000B 	0140
		ORG		000CH
		CLRR 	41H 			//000C 	0141
		CLRR 	32H 			//000D 	0132
		CLRR 	31H 			//000E 	0131

		//;smartkey.C: 252: unsigned int isWait =0;
		CLRR 	2FH 			//000F 	012F
		CLRR 	30H 			//0010 	0130

		//;smartkey.C: 253: signed int acYsum=0,acXsum=0;
		CLRR 	36H 			//0011 	0136
		CLRR 	37H 			//0012 	0137
		CLRR 	38H 			//0013 	0138
		ORG		0014H
		CLRR 	39H 			//0014 	0139

		//;smartkey.C: 254: unsigned int tmp16=0;
		CLRR 	42H 			//0015 	0142
		CLRR 	43H 			//0016 	0143
		CLRWDT	 			//0017 	0001

		//;smartkey.C: 260: sys_init();
		LCALL 	6CEH 			//0018 	36CE

		//;smartkey.C: 261: gpio_init();
		LCALL 	64DH 			//0019 	364D

		//;smartkey.C: 262: timer_init();
		LCALL 	689H 			//001A 	3689

		//;smartkey.C: 263: int_init();
		LCALL 	5E9H 			//001B 	35E9
		ORG		001CH

		//;smartkey.C: 266: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//001C 	2A82
		STR 	2DH 			//001D 	01AD
		LDWI 	DDH 			//001E 	2ADD
		STR 	2CH 			//001F 	01AC
		DECRSZ 	2CH,1 		//0020 	0EAC
		LJUMP 	20H 			//0021 	3820
		DECRSZ 	2DH,1 		//0022 	0EAD
		LJUMP 	20H 			//0023 	3820
		ORG		0024H
		LJUMP 	25H 			//0024 	3825

		//;smartkey.C: 270: PAIE = 1;
		BSR 	INTCON,3 		//0025 	198B

		//;smartkey.C: 272: RegStatus = 0;
		BCR 	STATUS,5 		//0026 	1283
		CLRR 	49H 			//0027 	0149

		//;smartkey.C: 274: swI2C_Init();
		LCALL 	5CAH 			//0028 	35CA
		LDWI 	0H 			//0029 	2A00

		//;smartkey.C: 277: setState(0,0);
		BCR 	STATUS,5 		//002A 	1283
		CLRR 	20H 			//002B 	0120
		ORG		002CH
		CLRR 	21H 			//002C 	0121
		LCALL 	6C2H 			//002D 	36C2

		//;smartkey.C: 279: WRITE_EEPROM(0xFF,0xAA);
		LDWI 	AAH 			//002E 	2AAA
		STR 	20H 			//002F 	01A0
		LDWI 	FFH 			//0030 	2AFF
		LCALL 	604H 			//0031 	3604

		//;smartkey.C: 280: WRITE_EEPROM(0xFF,0xAA);
		LDWI 	AAH 			//0032 	2AAA
		BCR 	STATUS,5 		//0033 	1283
		ORG		0034H
		STR 	20H 			//0034 	01A0
		LDWI 	FFH 			//0035 	2AFF
		LCALL 	604H 			//0036 	3604

		//;smartkey.C: 283: _delay((unsigned long)((200)*(4000000/4000.0)));
		LDWI 	2H 			//0037 	2A02
		BCR 	STATUS,5 		//0038 	1283
		STR 	2EH 			//0039 	01AE
		LDWI 	4H 			//003A 	2A04
		STR 	2DH 			//003B 	01AD
		ORG		003CH
		LDWI 	BAH 			//003C 	2ABA
		STR 	2CH 			//003D 	01AC
		DECRSZ 	2CH,1 		//003E 	0EAC
		LJUMP 	3EH 			//003F 	383E
		DECRSZ 	2DH,1 		//0040 	0EAD
		LJUMP 	3EH 			//0041 	383E
		DECRSZ 	2EH,1 		//0042 	0EAE
		LJUMP 	3EH 			//0043 	383E
		ORG		0044H
		CLRWDT	 			//0044 	0001

		//;smartkey.C: 285: tmp8= READ_EEPROM(0x08);
		LDWI 	8H 			//0045 	2A08
		LCALL 	6B5H 			//0046 	36B5
		STR 	44H 			//0047 	01C4

		//;smartkey.C: 286: if(tmp8==0xff) {WRITE_EEPROM(0x08,0);_delay((unsigned long)((2)*(40000
		//+                          00/4000.0)));}
		XORWI 	FFH 			//0048 	26FF
		BTSS 	STATUS,2 		//0049 	1D03
		LJUMP 	58H 			//004A 	3858
		LDWI 	8H 			//004B 	2A08
		ORG		004CH
		CLRR 	20H 			//004C 	0120
		LCALL 	604H 			//004D 	3604
		LDWI 	3H 			//004E 	2A03
		BCR 	STATUS,5 		//004F 	1283
		STR 	2DH 			//0050 	01AD
		LDWI 	97H 			//0051 	2A97
		STR 	2CH 			//0052 	01AC
		DECRSZ 	2CH,1 		//0053 	0EAC
		ORG		0054H
		LJUMP 	53H 			//0054 	3853
		DECRSZ 	2DH,1 		//0055 	0EAD
		LJUMP 	53H 			//0056 	3853
		LJUMP 	58H 			//0057 	3858

		//;smartkey.C: 288: if(tmp8==0xcc){
		BCR 	STATUS,5 		//0058 	1283
		LDR 	44H,0 			//0059 	0844
		XORWI 	CCH 			//005A 	26CC
		BTSS 	STATUS,2 		//005B 	1D03
		ORG		005CH
		LJUMP 	73H 			//005C 	3873
		LDWI 	8H 			//005D 	2A08

		//;smartkey.C: 289: RegStatus &=~(0x20);
		BCR 	49H,5 			//005E 	12C9

		//;smartkey.C: 290: setState(3,1800);
		STR 	20H 			//005F 	01A0
		LDWI 	7H 			//0060 	2A07
		STR 	21H 			//0061 	01A1
		LDWI 	3H 			//0062 	2A03
		LCALL 	6C2H 			//0063 	36C2
		ORG		0064H

		//;smartkey.C: 291: mtOldState = 1;
		CLRR 	4CH 			//0064 	014C
		INCR	4CH,1 			//0065 	09CC

		//;smartkey.C: 292: cntTmp = timeTick+50;
		LDR 	71H,0 			//0066 	0871
		STR 	46H 			//0067 	01C6
		LDR 	70H,0 			//0068 	0870
		STR 	45H 			//0069 	01C5
		LDWI 	32H 			//006A 	2A32
		ADDWR 	45H,1 			//006B 	0BC5
		ORG		006CH
		BTSC 	STATUS,0 		//006C 	1403
		INCR	46H,1 			//006D 	09C6

		//;smartkey.C: 293: PR2L =12;
		LDWI 	CH 			//006E 	2A0C
		BSR 	STATUS,5 		//006F 	1A83
		STR 	11H 			//0070 	0191

		//;smartkey.C: 294: beepOn();
		LCALL 	6E3H 			//0071 	36E3

		//;smartkey.C: 295: } else {
		LJUMP 	7AH 			//0072 	387A

		//;smartkey.C: 296: setState(2,400);
		LDWI 	90H 			//0073 	2A90
		ORG		0074H
		STR 	20H 			//0074 	01A0
		LDWI 	1H 			//0075 	2A01
		STR 	21H 			//0076 	01A1
		LDWI 	2H 			//0077 	2A02
		LCALL 	6C2H 			//0078 	36C2

		//;smartkey.C: 298: mtOldState = 0;
		CLRR 	4CH 			//0079 	014C

		//;smartkey.C: 300: }
		//;smartkey.C: 303: tmp8 = READ_EEPROM(0x40);
		LDWI 	40H 			//007A 	2A40
		LCALL 	6B5H 			//007B 	36B5
		ORG		007CH
		STR 	44H 			//007C 	01C4

		//;smartkey.C: 304: if(tmp8==8){
		XORWI 	8H 			//007D 	2608
		BTSS 	STATUS,2 		//007E 	1D03
		LJUMP 	A4H 			//007F 	38A4

		//;smartkey.C: 305: tmp8= READ_EEPROM(0x41);
		LDWI 	41H 			//0080 	2A41
		LCALL 	6B5H 			//0081 	36B5
		STR 	44H 			//0082 	01C4
		LDWI 	1EH 			//0083 	2A1E
		ORG		0084H

		//;smartkey.C: 306: beep(30,1);
		CLRR 	24H 			//0084 	0124
		INCR	24H,1 			//0085 	09A4
		LCALL 	637H 			//0086 	3637

		//;smartkey.C: 307: if((tmp8==1)||(tmp8==0xff)){
		DECR 	44H,0 			//0087 	0D44
		BTSC 	STATUS,2 		//0088 	1503
		LJUMP 	8EH 			//0089 	388E
		LDR 	44H,0 			//008A 	0844
		XORWI 	FFH 			//008B 	26FF
		ORG		008CH
		BTSS 	STATUS,2 		//008C 	1D03
		LJUMP 	91H 			//008D 	3891
		LDWI 	41H 			//008E 	2A41

		//;smartkey.C: 308: WRITE_EEPROM(0x41,0);
		CLRR 	20H 			//008F 	0120
		LJUMP 	94H 			//0090 	3894

		//;smartkey.C: 309: }
		LDWI 	41H 			//0091 	2A41

		//;smartkey.C: 310: else {
		//;smartkey.C: 311: WRITE_EEPROM(0x41,0x1);
		CLRR 	20H 			//0092 	0120
		INCR	20H,1 			//0093 	09A0
		ORG		0094H
		LCALL 	604H 			//0094 	3604
		LDWI 	40H 			//0095 	2A40

		//;smartkey.C: 313: }
		//;smartkey.C: 314: WRITE_EEPROM(0x40,0);
		BCR 	STATUS,5 		//0096 	1283
		CLRR 	20H 			//0097 	0120
		LCALL 	604H 			//0098 	3604

		//;smartkey.C: 316: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//0099 	2A82
		BCR 	STATUS,5 		//009A 	1283
		STR 	2DH 			//009B 	01AD
		ORG		009CH
		LDWI 	DDH 			//009C 	2ADD
		STR 	2CH 			//009D 	01AC
		DECRSZ 	2CH,1 		//009E 	0EAC
		LJUMP 	9EH 			//009F 	389E
		DECRSZ 	2DH,1 		//00A0 	0EAD
		LJUMP 	9EH 			//00A1 	389E
		LJUMP 	A3H 			//00A2 	38A3

		//;smartkey.C: 317: } else if(tmp8==0xff) WRITE_EEPROM(0x40,0);
		LJUMP 	ABH 			//00A3 	38AB
		ORG		00A4H
		LDR 	44H,0 			//00A4 	0844
		XORWI 	FFH 			//00A5 	26FF
		BTSS 	STATUS,2 		//00A6 	1D03
		LJUMP 	ABH 			//00A7 	38AB
		LDWI 	40H 			//00A8 	2A40
		CLRR 	20H 			//00A9 	0120
		LCALL 	604H 			//00AA 	3604

		//;smartkey.C: 320: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//00AB 	2A41
		ORG		00ACH
		LCALL 	6B5H 			//00AC 	36B5
		STR 	44H 			//00AD 	01C4

		//;smartkey.C: 321: if(tmp8==1){
		DECR 	44H,0 			//00AE 	0D44
		BTSS 	STATUS,2 		//00AF 	1D03
		LJUMP 	CDH 			//00B0 	38CD

		//;smartkey.C: 322: RC0 =1;RC1 =1;
		BSR 	7H,0 			//00B1 	1807
		BSR 	7H,1 			//00B2 	1887

		//;smartkey.C: 324: _delay((unsigned long)((1000)*(4000000/4000.0)));
		LDWI 	6H 			//00B3 	2A06
		ORG		00B4H
		BCR 	STATUS,5 		//00B4 	1283
		STR 	2EH 			//00B5 	01AE
		LDWI 	13H 			//00B6 	2A13
		STR 	2DH 			//00B7 	01AD
		LDWI 	B1H 			//00B8 	2AB1
		STR 	2CH 			//00B9 	01AC
		DECRSZ 	2CH,1 		//00BA 	0EAC
		LJUMP 	BAH 			//00BB 	38BA
		ORG		00BCH
		DECRSZ 	2DH,1 		//00BC 	0EAD
		LJUMP 	BAH 			//00BD 	38BA
		DECRSZ 	2EH,1 		//00BE 	0EAE
		LJUMP 	BAH 			//00BF 	38BA
		LJUMP 	C1H 			//00C0 	38C1

		//;smartkey.C: 325: if(timeTick >300) WRITE_EEPROM(0x40,0);
		LDWI 	1H 			//00C1 	2A01
		SUBWR 	71H,0 			//00C2 	0C71
		LDWI 	2DH 			//00C3 	2A2D
		ORG		00C4H
		BTSC 	STATUS,2 		//00C4 	1503
		SUBWR 	70H,0 			//00C5 	0C70
		BTSS 	STATUS,0 		//00C6 	1C03
		LJUMP 	B3H 			//00C7 	38B3
		LDWI 	40H 			//00C8 	2A40
		BCR 	STATUS,5 		//00C9 	1283
		CLRR 	20H 			//00CA 	0120
		LCALL 	604H 			//00CB 	3604
		ORG		00CCH
		LJUMP 	B3H 			//00CC 	38B3

		//;smartkey.C: 326: }
		//;smartkey.C: 327: }
		//;smartkey.C: 330: buf[0] = 0x08;
		LDWI 	8H 			//00CD 	2A08
		STR 	3AH 			//00CE 	01BA

		//;smartkey.C: 331: buf[1] = 0x4d;
		LDWI 	4DH 			//00CF 	2A4D
		STR 	3BH 			//00D0 	01BB

		//;smartkey.C: 333: if(AccWrite(0x10,(unsigned char)buf,2)==0) {
		LDWI 	3AH 			//00D1 	2A3A
		STR 	2CH 			//00D2 	01AC
		CLRR 	2DH 			//00D3 	012D
		ORG		00D4H
		STR 	23H 			//00D4 	01A3
		LDR 	2DH,0 			//00D5 	082D
		STR 	24H 			//00D6 	01A4
		LDWI 	2H 			//00D7 	2A02
		STR 	25H 			//00D8 	01A5
		LDWI 	10H 			//00D9 	2A10
		LCALL 	5A2H 			//00DA 	35A2
		IORWI 	0H 			//00DB 	2500
		ORG		00DCH

		//;smartkey.C: 334: mpuOk =1;
		BCR 	STATUS,5 		//00DC 	1283
		BTSS 	STATUS,2 		//00DD 	1D03
		LJUMP 	E2H 			//00DE 	38E2
		CLRR 	35H 			//00DF 	0135
		INCR	35H,1 			//00E0 	09B5

		//;smartkey.C: 335: }
		LJUMP 	E7H 			//00E1 	38E7

		//;smartkey.C: 336: else {
		//;smartkey.C: 337: mpuOk =0;
		LDWI 	2H 			//00E2 	2A02
		CLRR 	35H 			//00E3 	0135
		ORG		00E4H

		//;smartkey.C: 338: beep(10,2);
		STR 	24H 			//00E4 	01A4
		LDWI 	AH 			//00E5 	2A0A
		LCALL 	637H 			//00E6 	3637

		//;smartkey.C: 339: }
		//;smartkey.C: 345: tmp8= READ_EEPROM(0x40);
		LDWI 	40H 			//00E7 	2A40
		LCALL 	6B5H 			//00E8 	36B5
		STR 	44H 			//00E9 	01C4

		//;smartkey.C: 346: if(tmp8==6 && mpuOk ==1)
		XORWI 	6H 			//00EA 	2606
		BTSS 	STATUS,2 		//00EB 	1D03
		ORG		00ECH
		LJUMP 	19AH 			//00EC 	399A
		DECRSZ 	35H,0 		//00ED 	0E35
		LJUMP 	19AH 			//00EE 	399A
		LDWI 	3H 			//00EF 	2A03

		//;smartkey.C: 347: {
		//;smartkey.C: 348: tmp8=0; beep(10,3);
		CLRR 	44H 			//00F0 	0144
		STR 	24H 			//00F1 	01A4
		LDWI 	AH 			//00F2 	2A0A
		LCALL 	637H 			//00F3 	3637
		ORG		00F4H

		//;smartkey.C: 349: while((RA2 )&&(tmp8<11))
		LJUMP 	130H 			//00F4 	3930

		//;smartkey.C: 350: {
		//;smartkey.C: 351: if(AccRead(0x02,(unsigned char)buf,6)==0){
		LDWI 	3AH 			//00F5 	2A3A
		STR 	2CH 			//00F6 	01AC
		CLRR 	2DH 			//00F7 	012D
		STR 	24H 			//00F8 	01A4
		LDR 	2DH,0 			//00F9 	082D
		STR 	25H 			//00FA 	01A5
		LDWI 	6H 			//00FB 	2A06
		ORG		00FCH
		STR 	26H 			//00FC 	01A6
		LDWI 	2H 			//00FD 	2A02
		LCALL 	567H 			//00FE 	3567
		IORWI 	0H 			//00FF 	2500
		BTSS 	STATUS,2 		//0100 	1D03
		LJUMP 	122H 			//0101 	3922

		//;smartkey.C: 353: acXsum += buf[1];
		BCR 	STATUS,5 		//0102 	1283
		LDR 	3BH,0 			//0103 	083B
		ORG		0104H
		STR 	2CH 			//0104 	01AC
		CLRR 	2DH 			//0105 	012D
		BTSC 	2CH,7 			//0106 	17AC
		DECR 	2DH,1 			//0107 	0DAD
		ADDWR 	38H,1 			//0108 	0BB8
		BTSC 	STATUS,0 		//0109 	1403
		INCR	39H,1 			//010A 	09B9
		LDR 	2DH,0 			//010B 	082D
		ORG		010CH
		ADDWR 	39H,1 			//010C 	0BB9

		//;smartkey.C: 354: acYsum += buf[3];
		LDR 	3DH,0 			//010D 	083D
		STR 	2CH 			//010E 	01AC
		CLRR 	2DH 			//010F 	012D
		BTSC 	2CH,7 			//0110 	17AC
		DECR 	2DH,1 			//0111 	0DAD
		ADDWR 	36H,1 			//0112 	0BB6
		BTSC 	STATUS,0 		//0113 	1403
		ORG		0114H
		INCR	37H,1 			//0114 	09B7
		LDR 	2DH,0 			//0115 	082D
		ADDWR 	37H,1 			//0116 	0BB7

		//;smartkey.C: 355: tmp16 = (signed int)tmp16 + buf[5];
		LDR 	3FH,0 			//0117 	083F
		STR 	2CH 			//0118 	01AC
		CLRR 	2DH 			//0119 	012D
		BTSC 	2CH,7 			//011A 	17AC
		DECR 	2DH,1 			//011B 	0DAD
		ORG		011CH
		ADDWR 	42H,1 			//011C 	0BC2
		BTSC 	STATUS,0 		//011D 	1403
		INCR	43H,1 			//011E 	09C3
		LDR 	2DH,0 			//011F 	082D
		ADDWR 	43H,1 			//0120 	0BC3

		//;smartkey.C: 356: tmp8++;
		INCR	44H,1 			//0121 	09C4

		//;smartkey.C: 357: }
		//;smartkey.C: 358: _delay((unsigned long)((500)*(4000000/4000.0)));
		LDWI 	3H 			//0122 	2A03
		BCR 	STATUS,5 		//0123 	1283
		ORG		0124H
		STR 	2EH 			//0124 	01AE
		LDWI 	8AH 			//0125 	2A8A
		STR 	2DH 			//0126 	01AD
		LDWI 	56H 			//0127 	2A56
		STR 	2CH 			//0128 	01AC
		DECRSZ 	2CH,1 		//0129 	0EAC
		LJUMP 	129H 			//012A 	3929
		DECRSZ 	2DH,1 		//012B 	0EAD
		ORG		012CH
		LJUMP 	129H 			//012C 	3929
		DECRSZ 	2EH,1 		//012D 	0EAE
		LJUMP 	129H 			//012E 	3929
		LJUMP 	130H 			//012F 	3930
		BCR 	STATUS,5 		//0130 	1283
		BTSS 	5H,2 			//0131 	1D05
		LJUMP 	137H 			//0132 	3937
		LDWI 	BH 			//0133 	2A0B
		ORG		0134H
		SUBWR 	44H,0 			//0134 	0C44
		BTSS 	STATUS,0 		//0135 	1C03
		LJUMP 	F5H 			//0136 	38F5

		//;smartkey.C: 360: }
		//;smartkey.C: 362: if(tmp8==11){
		LDR 	44H,0 			//0137 	0844
		XORWI 	BH 			//0138 	260B
		BTSS 	STATUS,2 		//0139 	1D03
		LJUMP 	192H 			//013A 	3992

		//;smartkey.C: 363: acXsum =acXsum/10;
		LDWI 	AH 			//013B 	2A0A
		ORG		013CH
		STR 	20H 			//013C 	01A0
		CLRR 	21H 			//013D 	0121
		LDR 	39H,0 			//013E 	0839
		STR 	23H 			//013F 	01A3
		LDR 	38H,0 			//0140 	0838
		STR 	22H 			//0141 	01A2
		LCALL 	461H 			//0142 	3461
		LDR 	21H,0 			//0143 	0821
		ORG		0144H
		STR 	39H 			//0144 	01B9
		LDR 	20H,0 			//0145 	0820
		STR 	38H 			//0146 	01B8

		//;smartkey.C: 364: acYsum = acYsum/10;
		LDWI 	AH 			//0147 	2A0A
		STR 	20H 			//0148 	01A0
		CLRR 	21H 			//0149 	0121
		LDR 	37H,0 			//014A 	0837
		STR 	23H 			//014B 	01A3
		ORG		014CH
		LDR 	36H,0 			//014C 	0836
		STR 	22H 			//014D 	01A2
		LCALL 	461H 			//014E 	3461
		LDR 	21H,0 			//014F 	0821
		STR 	37H 			//0150 	01B7
		LDR 	20H,0 			//0151 	0820
		STR 	36H 			//0152 	01B6

		//;smartkey.C: 365: tmp16 = (signed int)tmp16/10;
		LDWI 	AH 			//0153 	2A0A
		ORG		0154H
		STR 	20H 			//0154 	01A0
		CLRR 	21H 			//0155 	0121
		LDR 	43H,0 			//0156 	0843
		STR 	23H 			//0157 	01A3
		LDR 	42H,0 			//0158 	0842
		STR 	22H 			//0159 	01A2
		LCALL 	461H 			//015A 	3461
		LDR 	21H,0 			//015B 	0821
		ORG		015CH
		STR 	43H 			//015C 	01C3
		LDR 	20H,0 			//015D 	0820
		STR 	42H 			//015E 	01C2

		//;smartkey.C: 367: if(((signed int)tmp16 > (-31)) && ((signed int)tmp16 < 31)){
		LDR 	43H,0 			//015F 	0843
		XORWI 	80H 			//0160 	2680
		STR 	7FH 			//0161 	01FF
		LDWI 	7FH 			//0162 	2A7F
		SUBWR 	7FH,0 			//0163 	0C7F
		ORG		0164H
		BTSS 	STATUS,2 		//0164 	1D03
		LJUMP 	168H 			//0165 	3968
		LDWI 	E2H 			//0166 	2AE2
		SUBWR 	42H,0 			//0167 	0C42
		BTSS 	STATUS,0 		//0168 	1C03
		LJUMP 	179H 			//0169 	3979
		BCR 	STATUS,5 		//016A 	1283
		LDR 	43H,0 			//016B 	0843
		ORG		016CH
		XORWI 	80H 			//016C 	2680
		STR 	7FH 			//016D 	01FF
		LDWI 	80H 			//016E 	2A80
		SUBWR 	7FH,0 			//016F 	0C7F
		BTSS 	STATUS,2 		//0170 	1D03
		LJUMP 	174H 			//0171 	3974
		LDWI 	1FH 			//0172 	2A1F
		SUBWR 	42H,0 			//0173 	0C42
		ORG		0174H
		BTSC 	STATUS,0 		//0174 	1403
		LJUMP 	179H 			//0175 	3979

		//;smartkey.C: 368: beep(10,2);
		LDWI 	2H 			//0176 	2A02
		BCR 	STATUS,5 		//0177 	1283
		LJUMP 	193H 			//0178 	3993

		//;smartkey.C: 369: }
		//;smartkey.C: 370: else
		//;smartkey.C: 372: {
		//;smartkey.C: 373: beep(10,3);
		LDWI 	3H 			//0179 	2A03
		BCR 	STATUS,5 		//017A 	1283
		STR 	24H 			//017B 	01A4
		ORG		017CH
		LDWI 	AH 			//017C 	2A0A
		LCALL 	637H 			//017D 	3637

		//;smartkey.C: 374: WRITE_EEPROM(0x10,(unsigned char)acXsum);
		LDR 	38H,0 			//017E 	0838
		STR 	20H 			//017F 	01A0
		LDWI 	10H 			//0180 	2A10
		LCALL 	604H 			//0181 	3604

		//;smartkey.C: 375: WRITE_EEPROM(0x11,(unsigned char)acYsum);
		BCR 	STATUS,5 		//0182 	1283
		LDR 	36H,0 			//0183 	0836
		ORG		0184H
		STR 	20H 			//0184 	01A0
		LDWI 	11H 			//0185 	2A11
		LCALL 	604H 			//0186 	3604

		//;smartkey.C: 376: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//0187 	2A82
		BCR 	STATUS,5 		//0188 	1283
		STR 	2DH 			//0189 	01AD
		LDWI 	DDH 			//018A 	2ADD
		STR 	2CH 			//018B 	01AC
		ORG		018CH
		DECRSZ 	2CH,1 		//018C 	0EAC
		LJUMP 	18CH 			//018D 	398C
		DECRSZ 	2DH,1 		//018E 	0EAD
		LJUMP 	18CH 			//018F 	398C
		LJUMP 	191H 			//0190 	3991
		LJUMP 	196H 			//0191 	3996

		//;smartkey.C: 380: beep(10,2);
		LDWI 	2H 			//0192 	2A02
		STR 	24H 			//0193 	01A4
		ORG		0194H
		LDWI 	AH 			//0194 	2A0A
		LCALL 	637H 			//0195 	3637
		LDWI 	40H 			//0196 	2A40

		//;smartkey.C: 381: }
		//;smartkey.C: 382: WRITE_EEPROM(0x40,0);
		BCR 	STATUS,5 		//0197 	1283
		CLRR 	20H 			//0198 	0120
		LCALL 	604H 			//0199 	3604

		//;smartkey.C: 384: }
		//;smartkey.C: 386: acXsum = (signed char)READ_EEPROM(0x10);
		LDWI 	10H 			//019A 	2A10
		LCALL 	6B5H 			//019B 	36B5
		ORG		019CH
		STR 	38H 			//019C 	01B8
		CLRR 	39H 			//019D 	0139
		BTSC 	38H,7 			//019E 	17B8
		DECR 	39H,1 			//019F 	0DB9

		//;smartkey.C: 387: acYsum = (signed char)READ_EEPROM(0x11);
		LDWI 	11H 			//01A0 	2A11
		LCALL 	6B5H 			//01A1 	36B5
		STR 	36H 			//01A2 	01B6
		CLRR 	37H 			//01A3 	0137
		ORG		01A4H
		BTSC 	36H,7 			//01A4 	17B6
		DECR 	37H,1 			//01A5 	0DB7

		//;smartkey.C: 389: timeTick = 0;
		CLRR 	70H 			//01A6 	0170
		CLRR 	71H 			//01A7 	0171

		//;smartkey.C: 398: if(mode_chek == 0)
		LDR 	73H,1 			//01A8 	08F3
		BTSC 	STATUS,2 		//01A9 	1503

		//;smartkey.C: 399: {
		//;smartkey.C: 401: if(RegStatus & 0x80)
		BTSS 	49H,7 			//01AA 	1FC9
		LJUMP 	279H 			//01AB 	3A79
		ORG		01ACH

		//;smartkey.C: 402: {
		//;smartkey.C: 403: PAIE = 0;
		BCR 	INTCON,3 		//01AC 	118B

		//;smartkey.C: 406: RegStatus &= (~0x80);
		BCR 	49H,7 			//01AD 	13C9

		//;smartkey.C: 418: {
		//;smartkey.C: 420: if ((RegStatus & 0x40) !=0){
		BTSC 	49H,6 			//01AE 	1749
		LJUMP 	22BH 			//01AF 	3A2B
		LJUMP 	270H 			//01B0 	3A70

		//;smartkey.C: 426: lostDetect =0;
		CLRR 	4BH 			//01B1 	014B
		LDWI 	28H 			//01B2 	2A28

		//;smartkey.C: 427: timeTick =0;
		CLRR 	70H 			//01B3 	0170
		ORG		01B4H
		CLRR 	71H 			//01B4 	0171

		//;smartkey.C: 428: tmp16 = 40;
		STR 	42H 			//01B5 	01C2
		CLRR 	43H 			//01B6 	0143

		//;smartkey.C: 429: break;
		LJUMP 	278H 			//01B7 	3A78

		//;smartkey.C: 432: if(timeTick >30){
		LDWI 	0H 			//01B8 	2A00
		SUBWR 	71H,0 			//01B9 	0C71
		LDWI 	1FH 			//01BA 	2A1F
		BTSC 	STATUS,2 		//01BB 	1503
		ORG		01BCH
		SUBWR 	70H,0 			//01BC 	0C70
		BTSS 	STATUS,0 		//01BD 	1C03
		LJUMP 	278H 			//01BE 	3A78
		LDWI 	8H 			//01BF 	2A08

		//;smartkey.C: 433: timeTick =0;
		CLRR 	70H 			//01C0 	0170
		CLRR 	71H 			//01C1 	0171

		//;smartkey.C: 435: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LCALL 	6B5H 			//01C2 	36B5
		XORWI 	CCH 			//01C3 	26CC
		ORG		01C4H
		BTSS 	STATUS,2 		//01C4 	1D03
		LJUMP 	1C9H 			//01C5 	39C9
		LDWI 	8H 			//01C6 	2A08
		CLRR 	20H 			//01C7 	0120
		LCALL 	604H 			//01C8 	3604

		//;smartkey.C: 437: if((mtOldState == 3)){
		BCR 	STATUS,5 		//01C9 	1283
		LDR 	4CH,0 			//01CA 	084C
		XORWI 	3H 			//01CB 	2603
		ORG		01CCH
		BTSS 	STATUS,2 		//01CC 	1D03
		LJUMP 	1DAH 			//01CD 	39DA

		//;smartkey.C: 438: beepOn();TMR2ON = 0; beep(10,1);
		LCALL 	6E3H 			//01CE 	36E3
		LDWI 	AH 			//01CF 	2A0A
		BCR 	STATUS,5 		//01D0 	1283
		BCR 	12H,2 			//01D1 	1112
		CLRR 	24H 			//01D2 	0124
		INCR	24H,1 			//01D3 	09A4
		ORG		01D4H
		LCALL 	637H 			//01D4 	3637

		//;smartkey.C: 439: if(reAlertOn)reAlertOn =0;
		LDR 	40H,0 			//01D5 	0840
		BTSC 	STATUS,2 		//01D6 	1503
		LJUMP 	278H 			//01D7 	3A78
		CLRR 	40H 			//01D8 	0140
		LJUMP 	278H 			//01D9 	3A78

		//;smartkey.C: 441: else if((mtOldState == 0)||(mtOldState == 4)){
		LDR 	4CH,0 			//01DA 	084C
		BTSC 	STATUS,2 		//01DB 	1503
		ORG		01DCH
		LJUMP 	1E1H 			//01DC 	39E1
		LDR 	4CH,0 			//01DD 	084C
		XORWI 	4H 			//01DE 	2604
		BTSS 	STATUS,2 		//01DF 	1D03
		LJUMP 	1FEH 			//01E0 	39FE
		LDWI 	ACH 			//01E1 	2AAC

		//;smartkey.C: 442: RegStatus |=(0x20);
		BSR 	49H,5 			//01E2 	1AC9

		//;smartkey.C: 443: setState(1,3500);
		STR 	20H 			//01E3 	01A0
		ORG		01E4H
		LDWI 	DH 			//01E4 	2A0D
		STR 	21H 			//01E5 	01A1
		LDWI 	1H 			//01E6 	2A01
		LCALL 	6C2H 			//01E7 	36C2

		//;smartkey.C: 444: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
		LDWI 	40H 			//01E8 	2A40
		LCALL 	6B5H 			//01E9 	36B5
		XORWI 	0H 			//01EA 	2600
		BTSC 	STATUS,2 		//01EB 	1503
		ORG		01ECH
		LJUMP 	1F0H 			//01EC 	39F0
		LDWI 	40H 			//01ED 	2A40
		CLRR 	20H 			//01EE 	0120
		LCALL 	604H 			//01EF 	3604

		//;smartkey.C: 445: tmp16 = timeTick+40;
		LDR 	71H,0 			//01F0 	0871
		BCR 	STATUS,5 		//01F1 	1283
		STR 	43H 			//01F2 	01C3
		LDR 	70H,0 			//01F3 	0870
		ORG		01F4H
		STR 	42H 			//01F4 	01C2
		LDWI 	28H 			//01F5 	2A28
		ADDWR 	42H,1 			//01F6 	0BC2
		BTSC 	STATUS,0 		//01F7 	1403
		INCR	43H,1 			//01F8 	09C3
		LDWI 	AH 			//01F9 	2A0A

		//;smartkey.C: 446: beep(10,1);
		CLRR 	24H 			//01FA 	0124
		INCR	24H,1 			//01FB 	09A4
		ORG		01FCH
		LCALL 	637H 			//01FC 	3637

		//;smartkey.C: 447: }
		LJUMP 	278H 			//01FD 	3A78

		//;smartkey.C: 448: else if((mtOldState == 1)){
		DECRSZ 	4CH,0 		//01FE 	0E4C
		LJUMP 	278H 			//01FF 	3A78
		LJUMP 	1D5H 			//0200 	39D5

		//;smartkey.C: 451: }
		//;smartkey.C: 452: }
		//;smartkey.C: 453: break;
		//;smartkey.C: 450: if(reAlertOn)reAlertOn =0;
		//;smartkey.C: 456: if(timeTick > 200)
		LDWI 	0H 			//0201 	2A00
		SUBWR 	71H,0 			//0202 	0C71
		LDWI 	C9H 			//0203 	2AC9
		ORG		0204H
		BTSC 	STATUS,2 		//0204 	1503
		SUBWR 	70H,0 			//0205 	0C70
		BTSS 	STATUS,0 		//0206 	1C03
		LJUMP 	278H 			//0207 	3A78

		//;smartkey.C: 457: {
		//;smartkey.C: 458: beepOff();
		LCALL 	6E8H 			//0208 	36E8

		//;smartkey.C: 459: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LDWI 	8H 			//0209 	2A08
		LCALL 	6B5H 			//020A 	36B5
		XORWI 	CCH 			//020B 	26CC
		ORG		020CH
		BTSS 	STATUS,2 		//020C 	1D03
		LJUMP 	211H 			//020D 	3A11
		LDWI 	8H 			//020E 	2A08
		CLRR 	20H 			//020F 	0120
		LCALL 	604H 			//0210 	3604
		LDWI 	ACH 			//0211 	2AAC

		//;smartkey.C: 460: RegStatus |=(0x20);
		BCR 	STATUS,5 		//0212 	1283
		BSR 	49H,5 			//0213 	1AC9
		ORG		0214H

		//;smartkey.C: 461: setState(1,3500);
		STR 	20H 			//0214 	01A0
		LDWI 	DH 			//0215 	2A0D
		STR 	21H 			//0216 	01A1
		LDWI 	1H 			//0217 	2A01
		LCALL 	6C2H 			//0218 	36C2

		//;smartkey.C: 463: tmp16 = timeTick+40;
		LDR 	71H,0 			//0219 	0871
		STR 	43H 			//021A 	01C3
		LDR 	70H,0 			//021B 	0870
		ORG		021CH
		STR 	42H 			//021C 	01C2
		LDWI 	28H 			//021D 	2A28
		ADDWR 	42H,1 			//021E 	0BC2
		BTSC 	STATUS,0 		//021F 	1403
		INCR	43H,1 			//0220 	09C3
		LJUMP 	278H 			//0221 	3A78

		//;smartkey.C: 469: beepOff();
		LCALL 	6E8H 			//0222 	36E8

		//;smartkey.C: 470: setState(2,300);
		LDWI 	2CH 			//0223 	2A2C
		ORG		0224H
		BCR 	STATUS,5 		//0224 	1283
		STR 	20H 			//0225 	01A0
		LDWI 	1H 			//0226 	2A01
		STR 	21H 			//0227 	01A1
		LDWI 	2H 			//0228 	2A02
		LCALL 	6C2H 			//0229 	36C2

		//;smartkey.C: 471: break;
		LJUMP 	278H 			//022A 	3A78
		LDR 	74H,0 			//022B 	0874
		ORG		022CH
		STR 	FSR 			//022C 	0184
		LDWI 	5H 			//022D 	2A05
		SUBWR 	FSR,0 			//022E 	0C04
		BTSC 	STATUS,0 		//022F 	1403
		LJUMP 	278H 			//0230 	3A78
		LDWI 	6H 			//0231 	2A06
		STR 	PCLATH 			//0232 	018A
		LDWI 	DEH 			//0233 	2ADE
		ORG		0234H
		ADDWR 	FSR,0 			//0234 	0B04
		STR 	PCL 			//0235 	0182

		//;smartkey.C: 488: {
		//;smartkey.C: 490: if(lostDetect==1 && timeTick< 1500)
		DECRSZ 	4BH,0 		//0236 	0E4B
		LJUMP 	25DH 			//0237 	3A5D
		LDWI 	5H 			//0238 	2A05
		SUBWR 	71H,0 			//0239 	0C71
		LDWI 	DCH 			//023A 	2ADC
		BTSC 	STATUS,2 		//023B 	1503
		ORG		023CH
		SUBWR 	70H,0 			//023C 	0C70
		BTSC 	STATUS,0 		//023D 	1403
		LJUMP 	25DH 			//023E 	3A5D

		//;smartkey.C: 491: {
		//;smartkey.C: 492: if(READ_EEPROM(0x08)==0x00) WRITE_EEPROM(0x08,0xcc);
		LDWI 	8H 			//023F 	2A08
		LCALL 	6B5H 			//0240 	36B5
		IORWI 	0H 			//0241 	2500
		BTSS 	STATUS,2 		//0242 	1D03
		LJUMP 	248H 			//0243 	3A48
		ORG		0244H
		LDWI 	CCH 			//0244 	2ACC
		STR 	20H 			//0245 	01A0
		LDWI 	8H 			//0246 	2A08
		LCALL 	604H 			//0247 	3604

		//;smartkey.C: 494: setState(3,1800);
		LDWI 	8H 			//0248 	2A08
		BCR 	STATUS,5 		//0249 	1283
		STR 	20H 			//024A 	01A0
		LDWI 	7H 			//024B 	2A07
		ORG		024CH
		STR 	21H 			//024C 	01A1
		LDWI 	3H 			//024D 	2A03
		LCALL 	6C2H 			//024E 	36C2

		//;smartkey.C: 495: cntTmp = timeTick+40;
		LDR 	71H,0 			//024F 	0871
		STR 	46H 			//0250 	01C6
		LDR 	70H,0 			//0251 	0870
		STR 	45H 			//0252 	01C5
		LDWI 	28H 			//0253 	2A28
		ORG		0254H
		ADDWR 	45H,1 			//0254 	0BC5
		BTSC 	STATUS,0 		//0255 	1403
		INCR	46H,1 			//0256 	09C6

		//;smartkey.C: 496: PR2L =20;
		LDWI 	14H 			//0257 	2A14
		BSR 	STATUS,5 		//0258 	1A83
		STR 	11H 			//0259 	0191

		//;smartkey.C: 497: beepOn();
		LCALL 	6E3H 			//025A 	36E3

		//;smartkey.C: 498: lostDetect =0;
		BCR 	STATUS,5 		//025B 	1283
		ORG		025CH
		LJUMP 	1B1H 			//025C 	39B1

		//;smartkey.C: 499: }
		//;smartkey.C: 500: else {
		//;smartkey.C: 501: lostDetect =1;
		CLRR 	4BH 			//025D 	014B
		INCR	4BH,1 			//025E 	09CB
		LJUMP 	1B2H 			//025F 	39B2

		//;smartkey.C: 504: }
		//;smartkey.C: 505: timeTick =0;
		//;smartkey.C: 511: {
		//;smartkey.C: 512: timeTick =0;
		CLRR 	70H 			//0260 	0170
		CLRR 	71H 			//0261 	0171

		//;smartkey.C: 513: beepOn();TMR2ON = 0;
		LCALL 	6E3H 			//0262 	36E3
		LDWI 	2H 			//0263 	2A02
		ORG		0264H
		BCR 	STATUS,5 		//0264 	1283
		BCR 	12H,2 			//0265 	1112

		//;smartkey.C: 514: beep(10,2);
		STR 	24H 			//0266 	01A4
		LDWI 	AH 			//0267 	2A0A
		LCALL 	637H 			//0268 	3637

		//;smartkey.C: 515: if(mtOldState == 3){reAlertOn =1;}
		LDR 	4CH,0 			//0269 	084C
		XORWI 	3H 			//026A 	2603
		BTSS 	STATUS,2 		//026B 	1D03
		ORG		026CH
		LJUMP 	278H 			//026C 	3A78
		CLRR 	40H 			//026D 	0140
		INCR	40H,1 			//026E 	09C0
		LJUMP 	278H 			//026F 	3A78
		LDR 	74H,0 			//0270 	0874
		XORWI 	1H 			//0271 	2601
		BTSC 	STATUS,2 		//0272 	1503
		LJUMP 	236H 			//0273 	3A36
		ORG		0274H
		XORWI 	3H 			//0274 	2603
		BTSC 	STATUS,2 		//0275 	1503
		LJUMP 	260H 			//0276 	3A60
		LJUMP 	278H 			//0277 	3A78

		//;smartkey.C: 519: }
		//;smartkey.C: 521: }
		//;smartkey.C: 523: PAIE = 1;
		BSR 	INTCON,3 		//0278 	198B

		//;smartkey.C: 524: }
		//;smartkey.C: 526: }
		//;smartkey.C: 530: {
		//;smartkey.C: 531: if((timeOut!=0)&&( timeTick >timeOut)){
		LDR 	48H,0 			//0279 	0848
		IORWR 	47H,0 			//027A 	0347
		BTSC 	STATUS,2 		//027B 	1503
		ORG		027CH
		LJUMP 	2EFH 			//027C 	3AEF
		LDR 	71H,0 			//027D 	0871
		SUBWR 	48H,0 			//027E 	0C48
		BTSS 	STATUS,2 		//027F 	1D03
		LJUMP 	283H 			//0280 	3A83
		LDR 	70H,0 			//0281 	0870
		SUBWR 	47H,0 			//0282 	0C47
		BTSS 	STATUS,0 		//0283 	1C03
		ORG		0284H
		LJUMP 	2E1H 			//0284 	3AE1
		LJUMP 	2EFH 			//0285 	3AEF

		//;smartkey.C: 542: beepOff();
		LCALL 	6E8H 			//0286 	36E8
		LDWI 	2CH 			//0287 	2A2C

		//;smartkey.C: 543: RegStatus &=(~0x20);
		BCR 	STATUS,5 		//0288 	1283
		BCR 	49H,5 			//0289 	12C9

		//;smartkey.C: 544: setState(2,300);
		STR 	20H 			//028A 	01A0
		LDWI 	1H 			//028B 	2A01
		ORG		028CH
		STR 	21H 			//028C 	01A1
		LDWI 	2H 			//028D 	2A02
		LCALL 	6C2H 			//028E 	36C2

		//;smartkey.C: 545: break;
		LJUMP 	2EFH 			//028F 	3AEF

		//;smartkey.C: 547: beepOff();
		LCALL 	6E8H 			//0290 	36E8

		//;smartkey.C: 548: delay_x10ms(20);
		LDWI 	14H 			//0291 	2A14
		BCR 	STATUS,5 		//0292 	1283
		STR 	20H 			//0293 	01A0
		ORG		0294H
		CLRR 	21H 			//0294 	0121
		LCALL 	676H 			//0295 	3676

		//;smartkey.C: 549: beepOn();TMR2ON = 0;reAlertOn =0;
		LCALL 	6E3H 			//0296 	36E3
		LDWI 	1EH 			//0297 	2A1E
		BCR 	STATUS,5 		//0298 	1283
		BCR 	12H,2 			//0299 	1112
		CLRR 	40H 			//029A 	0140
		CLRR 	24H 			//029B 	0124
		ORG		029CH
		INCR	24H,1 			//029C 	09A4
		LCALL 	637H 			//029D 	3637
		LDWI 	0H 			//029E 	2A00

		//;smartkey.C: 551: setState(0,0);
		CLRR 	20H 			//029F 	0120
		CLRR 	21H 			//02A0 	0121
		LCALL 	6C2H 			//02A1 	36C2

		//;smartkey.C: 553: tmp16 = timeTick+40;
		LDR 	71H,0 			//02A2 	0871
		STR 	43H 			//02A3 	01C3
		ORG		02A4H
		LDR 	70H,0 			//02A4 	0870
		STR 	42H 			//02A5 	01C2
		LDWI 	28H 			//02A6 	2A28
		ADDWR 	42H,1 			//02A7 	0BC2
		BTSC 	STATUS,0 		//02A8 	1403
		INCR	43H,1 			//02A9 	09C3

		//;smartkey.C: 554: break;
		LJUMP 	2EFH 			//02AA 	3AEF

		//;smartkey.C: 557: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LDWI 	8H 			//02AB 	2A08
		ORG		02ACH
		LCALL 	6B5H 			//02AC 	36B5
		XORWI 	CCH 			//02AD 	26CC
		BTSS 	STATUS,2 		//02AE 	1D03
		LJUMP 	2B3H 			//02AF 	3AB3
		LDWI 	8H 			//02B0 	2A08
		CLRR 	20H 			//02B1 	0120
		LCALL 	604H 			//02B2 	3604

		//;smartkey.C: 559: if(reAlertOn){
		BCR 	STATUS,5 		//02B3 	1283
		ORG		02B4H
		LDR 	40H,0 			//02B4 	0840
		BTSC 	STATUS,2 		//02B5 	1503
		LJUMP 	2CAH 			//02B6 	3ACA

		//;smartkey.C: 560: setState(4,6000);
		LDWI 	70H 			//02B7 	2A70
		STR 	20H 			//02B8 	01A0
		LDWI 	17H 			//02B9 	2A17
		STR 	21H 			//02BA 	01A1
		LDWI 	4H 			//02BB 	2A04
		ORG		02BCH
		LCALL 	6C2H 			//02BC 	36C2

		//;smartkey.C: 561: cntTmp = timeTick+40;
		LDR 	71H,0 			//02BD 	0871
		STR 	46H 			//02BE 	01C6
		LDR 	70H,0 			//02BF 	0870
		STR 	45H 			//02C0 	01C5
		LDWI 	28H 			//02C1 	2A28
		ADDWR 	45H,1 			//02C2 	0BC5
		BTSC 	STATUS,0 		//02C3 	1403
		ORG		02C4H
		INCR	46H,1 			//02C4 	09C6

		//;smartkey.C: 562: PR2L =20;
		LDWI 	14H 			//02C5 	2A14
		BSR 	STATUS,5 		//02C6 	1A83
		STR 	11H 			//02C7 	0191

		//;smartkey.C: 563: beepOn();
		LCALL 	6E3H 			//02C8 	36E3

		//;smartkey.C: 565: }else if(mtOldState == 0){
		LJUMP 	2EFH 			//02C9 	3AEF
		LDR 	4CH,1 			//02CA 	08CC
		BTSS 	STATUS,2 		//02CB 	1D03
		ORG		02CCH
		LJUMP 	296H 			//02CC 	3A96

		//;smartkey.C: 567: beep(10,5);
		LDWI 	5H 			//02CD 	2A05
		STR 	24H 			//02CE 	01A4
		LDWI 	AH 			//02CF 	2A0A
		LCALL 	637H 			//02D0 	3637
		LDWI 	40H 			//02D1 	2A40

		//;smartkey.C: 568: RegStatus |=(0x20);
		BSR 	49H,5 			//02D2 	1AC9

		//;smartkey.C: 571: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
		LCALL 	6B5H 			//02D3 	36B5
		ORG		02D4H
		XORWI 	0H 			//02D4 	2600
		BTSC 	STATUS,2 		//02D5 	1503
		LJUMP 	2DAH 			//02D6 	3ADA
		LDWI 	40H 			//02D7 	2A40
		CLRR 	20H 			//02D8 	0120
		LCALL 	604H 			//02D9 	3604

		//;smartkey.C: 573: setState(1,3500);
		LDWI 	ACH 			//02DA 	2AAC
		BCR 	STATUS,5 		//02DB 	1283
		ORG		02DCH
		STR 	20H 			//02DC 	01A0
		LDWI 	DH 			//02DD 	2A0D
		STR 	21H 			//02DE 	01A1
		LDWI 	1H 			//02DF 	2A01
		LJUMP 	2A1H 			//02E0 	3AA1

		//;smartkey.C: 580: setState(0,0);
		//;smartkey.C: 579: beep(30,1);
		//;smartkey.C: 578: reAlertOn =0;
		//;smartkey.C: 577: beepOn();TMR2ON = 0;
		LDR 	74H,0 			//02E1 	0874
		XORWI 	1H 			//02E2 	2601
		BTSC 	STATUS,2 		//02E3 	1503
		ORG		02E4H
		LJUMP 	2EFH 			//02E4 	3AEF
		XORWI 	3H 			//02E5 	2603
		BTSC 	STATUS,2 		//02E6 	1503
		LJUMP 	2ABH 			//02E7 	3AAB
		XORWI 	1H 			//02E8 	2601
		BTSC 	STATUS,2 		//02E9 	1503
		LJUMP 	286H 			//02EA 	3A86
		XORWI 	7H 			//02EB 	2607
		ORG		02ECH
		BTSC 	STATUS,2 		//02EC 	1503
		LJUMP 	290H 			//02ED 	3A90
		LJUMP 	2EFH 			//02EE 	3AEF

		//;smartkey.C: 586: }
		//;smartkey.C: 588: }
		//;smartkey.C: 590: if((timeTick>tmp16) && (mtState == 1) && mpuOk ==1){
		LDR 	71H,0 			//02EF 	0871
		BCR 	STATUS,5 		//02F0 	1283
		SUBWR 	43H,0 			//02F1 	0C43
		BTSS 	STATUS,2 		//02F2 	1D03
		LJUMP 	2F6H 			//02F3 	3AF6
		ORG		02F4H
		LDR 	70H,0 			//02F4 	0870
		SUBWR 	42H,0 			//02F5 	0C42
		BTSC 	STATUS,0 		//02F6 	1403
		LJUMP 	387H 			//02F7 	3B87
		DECRSZ 	74H,0 		//02F8 	0E74
		LJUMP 	387H 			//02F9 	3B87
		DECRSZ 	35H,0 		//02FA 	0E35
		LJUMP 	387H 			//02FB 	3B87
		ORG		02FCH

		//;smartkey.C: 591: tmp16 = timeTick+40;
		LDR 	71H,0 			//02FC 	0871
		STR 	43H 			//02FD 	01C3
		LDR 	70H,0 			//02FE 	0870
		STR 	42H 			//02FF 	01C2
		LDWI 	28H 			//0300 	2A28
		ADDWR 	42H,1 			//0301 	0BC2
		BTSC 	STATUS,0 		//0302 	1403
		INCR	43H,1 			//0303 	09C3
		ORG		0304H

		//;smartkey.C: 592: if(AccRead(0x02,buf,6)==0){
		LDWI 	3AH 			//0304 	2A3A
		STR 	24H 			//0305 	01A4
		LDWI 	0H 			//0306 	2A00
		STR 	25H 			//0307 	01A5
		LDWI 	6H 			//0308 	2A06
		STR 	26H 			//0309 	01A6
		LDWI 	2H 			//030A 	2A02
		LCALL 	567H 			//030B 	3567
		ORG		030CH
		IORWI 	0H 			//030C 	2500
		BTSS 	STATUS,2 		//030D 	1D03
		LJUMP 	387H 			//030E 	3B87

		//;smartkey.C: 594: if(compe(buf[1], (signed char)acXsum,5) && compe(buf[3], (signed char)
		//+                          acYsum,5)){
		BCR 	STATUS,5 		//030F 	1283
		LDR 	38H,0 			//0310 	0838
		STR 	20H 			//0311 	01A0
		LDWI 	5H 			//0312 	2A05
		STR 	21H 			//0313 	01A1
		ORG		0314H
		LDR 	3BH,0 			//0314 	083B
		LCALL 	4A6H 			//0315 	34A6
		XORWI 	0H 			//0316 	2600
		BCR 	STATUS,5 		//0317 	1283
		BTSC 	STATUS,2 		//0318 	1503
		LJUMP 	338H 			//0319 	3B38
		LDR 	36H,0 			//031A 	0836
		STR 	20H 			//031B 	01A0
		ORG		031CH
		LDWI 	5H 			//031C 	2A05
		STR 	21H 			//031D 	01A1
		LDR 	3DH,0 			//031E 	083D
		LCALL 	4A6H 			//031F 	34A6
		XORWI 	0H 			//0320 	2600

		//;smartkey.C: 597: isSw++;
		BCR 	STATUS,5 		//0321 	1283
		BTSC 	STATUS,2 		//0322 	1503
		LJUMP 	338H 			//0323 	3B38
		ORG		0324H
		LDWI 	2DH 			//0324 	2A2D
		INCR	41H,1 			//0325 	09C1

		//;smartkey.C: 598: if(isSw >44){
		SUBWR 	41H,0 			//0326 	0C41
		BTSS 	STATUS,0 		//0327 	1C03
		LJUMP 	32BH 			//0328 	3B2B

		//;smartkey.C: 599: isSw =0;
		CLRR 	41H 			//0329 	0141
		LJUMP 	35CH 			//032A 	3B5C

		//;smartkey.C: 606: }
		//;smartkey.C: 604: setState(2,300);
		//;smartkey.C: 603: RegStatus &=(~0x20);
		//;smartkey.C: 600: vibrateOn=1;
		//;smartkey.C: 607: else if(isSw > 25){
		LDWI 	1AH 			//032B 	2A1A
		ORG		032CH
		SUBWR 	41H,0 			//032C 	0C41
		BTSC 	STATUS,0 		//032D 	1403

		//;smartkey.C: 608: if(isSw%2==0){
		BTSC 	41H,0 			//032E 	1441
		LJUMP 	365H 			//032F 	3B65

		//;smartkey.C: 609: beepOn();TMR2ON = 0; beep(7,1);
		LCALL 	6E3H 			//0330 	36E3
		LDWI 	7H 			//0331 	2A07
		BCR 	STATUS,5 		//0332 	1283
		BCR 	12H,2 			//0333 	1112
		ORG		0334H
		CLRR 	24H 			//0334 	0124
		INCR	24H,1 			//0335 	09A4
		LCALL 	637H 			//0336 	3637
		LJUMP 	365H 			//0337 	3B65

		//;smartkey.C: 614: else{
		//;smartkey.C: 615: isSw =0;
		//;smartkey.C: 610: }
		//;smartkey.C: 611: }
		//;smartkey.C: 613: }
		CLRR 	41H 			//0338 	0141

		//;smartkey.C: 618: if(compe(buf[1], acXOld,2) && compe(buf[3], acYOld,2)){
		LDR 	34H,0 			//0339 	0834
		STR 	20H 			//033A 	01A0
		LDWI 	2H 			//033B 	2A02
		ORG		033CH
		STR 	21H 			//033C 	01A1
		LDR 	3BH,0 			//033D 	083B
		LCALL 	4A6H 			//033E 	34A6
		XORWI 	0H 			//033F 	2600
		BCR 	STATUS,5 		//0340 	1283
		BTSC 	STATUS,2 		//0341 	1503
		LJUMP 	366H 			//0342 	3B66
		LDR 	33H,0 			//0343 	0833
		ORG		0344H
		STR 	20H 			//0344 	01A0
		LDWI 	2H 			//0345 	2A02
		STR 	21H 			//0346 	01A1
		LDR 	3DH,0 			//0347 	083D
		LCALL 	4A6H 			//0348 	34A6
		XORWI 	0H 			//0349 	2600

		//;smartkey.C: 619: isWait++;
		BCR 	STATUS,5 		//034A 	1283
		BTSC 	STATUS,2 		//034B 	1503
		ORG		034CH
		LJUMP 	366H 			//034C 	3B66
		INCR	2FH,1 			//034D 	09AF
		BTSC 	STATUS,2 		//034E 	1503
		INCR	30H,1 			//034F 	09B0

		//;smartkey.C: 620: if(isWait==450){
		DECR 	30H,0 			//0350 	0D30
		LDWI 	C2H 			//0351 	2AC2
		BTSC 	STATUS,2 		//0352 	1503
		XORWR 	2FH,0 			//0353 	042F
		ORG		0354H
		BTSS 	STATUS,2 		//0354 	1D03
		LJUMP 	365H 			//0355 	3B65
		LDWI 	2H 			//0356 	2A02

		//;smartkey.C: 621: isWait = 0;
		CLRR 	2FH 			//0357 	012F
		CLRR 	30H 			//0358 	0130

		//;smartkey.C: 622: beep(7,2);
		STR 	24H 			//0359 	01A4
		LDWI 	7H 			//035A 	2A07
		LCALL 	637H 			//035B 	3637
		ORG		035CH
		LDWI 	2CH 			//035C 	2A2C

		//;smartkey.C: 623: vibrateOn=1;
		CLRR 	31H 			//035D 	0131
		INCR	31H,1 			//035E 	09B1

		//;smartkey.C: 624: RegStatus &=(~0x20);
		BCR 	49H,5 			//035F 	12C9

		//;smartkey.C: 625: setState(2,300);
		STR 	20H 			//0360 	01A0
		LDWI 	1H 			//0361 	2A01
		STR 	21H 			//0362 	01A1
		LDWI 	2H 			//0363 	2A02
		ORG		0364H
		LCALL 	6C2H 			//0364 	36C2

		//;smartkey.C: 626: }
		//;smartkey.C: 627: }
		//;smartkey.C: 629: }
		//;smartkey.C: 631: if( (buf[5] > -31) && (buf[5] < 31)) {
		BCR 	STATUS,5 		//0365 	1283
		LDR 	3FH,0 			//0366 	083F
		XORWI 	80H 			//0367 	2680
		ADDWI 	9EH 			//0368 	279E
		BTSS 	STATUS,0 		//0369 	1C03
		LJUMP 	382H 			//036A 	3B82
		LDR 	3FH,0 			//036B 	083F
		ORG		036CH
		XORWI 	80H 			//036C 	2680
		ADDWI 	61H 			//036D 	2761
		BTSC 	STATUS,0 		//036E 	1403
		LJUMP 	382H 			//036F 	3B82
		LDWI 	5H 			//0370 	2A05

		//;smartkey.C: 632: isFall++;
		INCR	32H,1 			//0371 	09B2

		//;smartkey.C: 633: if(isFall >4){
		SUBWR 	32H,0 			//0372 	0C32
		BTSS 	STATUS,0 		//0373 	1C03
		ORG		0374H
		LJUMP 	383H 			//0374 	3B83
		LDWI 	2H 			//0375 	2A02

		//;smartkey.C: 634: isFall =0;
		CLRR 	32H 			//0376 	0132

		//;smartkey.C: 635: beep(7,2);
		STR 	24H 			//0377 	01A4
		LDWI 	7H 			//0378 	2A07
		LCALL 	637H 			//0379 	3637
		LDWI 	2CH 			//037A 	2A2C

		//;smartkey.C: 636: RegStatus &=(~0x20);
		BCR 	49H,5 			//037B 	12C9
		ORG		037CH

		//;smartkey.C: 637: setState(2,300);
		STR 	20H 			//037C 	01A0
		LDWI 	1H 			//037D 	2A01
		STR 	21H 			//037E 	01A1
		LDWI 	2H 			//037F 	2A02
		LCALL 	6C2H 			//0380 	36C2
		LJUMP 	383H 			//0381 	3B83

		//;smartkey.C: 640: else{
		//;smartkey.C: 641: isFall=0;
		CLRR 	32H 			//0382 	0132

		//;smartkey.C: 642: }
		//;smartkey.C: 644: acYOld = buf[3];acXOld = buf[1];
		LDR 	3DH,0 			//0383 	083D
		ORG		0384H
		STR 	33H 			//0384 	01B3
		LDR 	3BH,0 			//0385 	083B
		STR 	34H 			//0386 	01B4

		//;smartkey.C: 645: }
		//;smartkey.C: 647: }
		//;smartkey.C: 650: if((timeTick>tmp16) && (mtState == 0 ) && mpuOk ==1){
		LDR 	71H,0 			//0387 	0871
		BCR 	STATUS,5 		//0388 	1283
		SUBWR 	43H,0 			//0389 	0C43
		BTSS 	STATUS,2 		//038A 	1D03
		LJUMP 	38EH 			//038B 	3B8E
		ORG		038CH
		LDR 	70H,0 			//038C 	0870
		SUBWR 	42H,0 			//038D 	0C42
		BTSC 	STATUS,0 		//038E 	1403
		LJUMP 	3D2H 			//038F 	3BD2
		LDR 	74H,1 			//0390 	08F4
		BTSS 	STATUS,2 		//0391 	1D03
		LJUMP 	3D2H 			//0392 	3BD2
		DECRSZ 	35H,0 		//0393 	0E35
		ORG		0394H
		LJUMP 	3D2H 			//0394 	3BD2

		//;smartkey.C: 652: if(timeTick >65000) timeTick =0;
		LDWI 	FDH 			//0395 	2AFD
		SUBWR 	71H,0 			//0396 	0C71
		LDWI 	E9H 			//0397 	2AE9
		BTSC 	STATUS,2 		//0398 	1503
		SUBWR 	70H,0 			//0399 	0C70
		BTSS 	STATUS,0 		//039A 	1C03
		LJUMP 	39EH 			//039B 	3B9E
		ORG		039CH
		CLRR 	70H 			//039C 	0170
		CLRR 	71H 			//039D 	0171

		//;smartkey.C: 653: tmp16 = timeTick+40;
		LDR 	71H,0 			//039E 	0871
		STR 	43H 			//039F 	01C3
		LDR 	70H,0 			//03A0 	0870
		STR 	42H 			//03A1 	01C2
		LDWI 	28H 			//03A2 	2A28
		ADDWR 	42H,1 			//03A3 	0BC2
		ORG		03A4H
		BTSC 	STATUS,0 		//03A4 	1403
		INCR	43H,1 			//03A5 	09C3

		//;smartkey.C: 655: if(AccRead(0x02,buf,6)==0){
		LDWI 	3AH 			//03A6 	2A3A
		STR 	24H 			//03A7 	01A4
		LDWI 	0H 			//03A8 	2A00
		STR 	25H 			//03A9 	01A5
		LDWI 	6H 			//03AA 	2A06
		STR 	26H 			//03AB 	01A6
		ORG		03ACH
		LDWI 	2H 			//03AC 	2A02
		LCALL 	567H 			//03AD 	3567
		IORWI 	0H 			//03AE 	2500

		//;smartkey.C: 657: if(vibrateOn==1){
		BCR 	STATUS,5 		//03AF 	1283
		BTSS 	STATUS,2 		//03B0 	1D03
		LJUMP 	3D3H 			//03B1 	3BD3
		DECRSZ 	31H,0 		//03B2 	0E31
		LJUMP 	3D2H 			//03B3 	3BD2
		ORG		03B4H

		//;smartkey.C: 658: if(compe(buf[1],acXOld ,3) && compe(buf[3],acYOld ,3)){
		LDR 	34H,0 			//03B4 	0834
		STR 	20H 			//03B5 	01A0
		LDWI 	3H 			//03B6 	2A03
		STR 	21H 			//03B7 	01A1
		LDR 	3BH,0 			//03B8 	083B
		LCALL 	4A6H 			//03B9 	34A6
		XORWI 	0H 			//03BA 	2600
		BCR 	STATUS,5 		//03BB 	1283
		ORG		03BCH
		BTSC 	STATUS,2 		//03BC 	1503
		LJUMP 	3CAH 			//03BD 	3BCA
		LDR 	33H,0 			//03BE 	0833
		STR 	20H 			//03BF 	01A0
		LDWI 	3H 			//03C0 	2A03
		STR 	21H 			//03C1 	01A1
		LDR 	3DH,0 			//03C2 	083D
		LCALL 	4A6H 			//03C3 	34A6
		ORG		03C4H
		XORWI 	0H 			//03C4 	2600

		//;smartkey.C: 660: isSw=0;
		BCR 	STATUS,5 		//03C5 	1283
		BTSC 	STATUS,2 		//03C6 	1503
		LJUMP 	3CAH 			//03C7 	3BCA
		CLRR 	41H 			//03C8 	0141

		//;smartkey.C: 663: }
		LJUMP 	3D2H 			//03C9 	3BD2

		//;smartkey.C: 664: else{
		//;smartkey.C: 665: isSw++;
		INCR	41H,1 			//03CA 	09C1

		//;smartkey.C: 668: {
		//;smartkey.C: 669: beepOn();TMR2ON = 0; beep(7,3);
		LCALL 	6E3H 			//03CB 	36E3
		ORG		03CCH
		LDWI 	3H 			//03CC 	2A03
		BCR 	STATUS,5 		//03CD 	1283
		BCR 	12H,2 			//03CE 	1112
		STR 	24H 			//03CF 	01A4
		LDWI 	7H 			//03D0 	2A07
		LCALL 	637H 			//03D1 	3637

		//;smartkey.C: 670: }
		//;smartkey.C: 671: }
		//;smartkey.C: 672: }
		//;smartkey.C: 674: }
		//;smartkey.C: 677: }
		//;smartkey.C: 679: if(RegStatus & 0x20) {RC0 =1;RC1 =1;}
		BCR 	STATUS,5 		//03D2 	1283
		BTSS 	49H,5 			//03D3 	1EC9
		ORG		03D4H
		LJUMP 	3D8H 			//03D4 	3BD8
		BSR 	7H,0 			//03D5 	1807
		BSR 	7H,1 			//03D6 	1887
		LJUMP 	1A8H 			//03D7 	39A8

		//;smartkey.C: 680: else {RC0 =0;RC1 =0;}
		BCR 	7H,0 			//03D8 	1007
		BCR 	7H,1 			//03D9 	1087
		LJUMP 	1A8H 			//03DA 	39A8

		//;smartkey.C: 42: if(PAIE&&PAIF){
		BTSC 	INTCON,3 		//03DB 	158B
		ORG		03DCH
		BTSS 	INTCON,0 		//03DC 	1C0B
		LJUMP 	3ECH 			//03DD 	3BEC

		//;smartkey.C: 44: tmp = PORTA;
		BCR 	STATUS,5 		//03DE 	1283
		LDR 	5H,0 			//03DF 	0805

		//;smartkey.C: 45: PAIF = 0;
		BCR 	INTCON,0 		//03E0 	100B

		//;smartkey.C: 47: if(RA5){
		BTSS 	5H,5 			//03E1 	1E85
		LJUMP 	3EBH 			//03E2 	3BEB

		//;smartkey.C: 49: if(mode_chek == 0){
		LDR 	73H,1 			//03E3 	08F3
		ORG		03E4H
		BTSS 	STATUS,2 		//03E4 	1D03
		LJUMP 	3ECH 			//03E5 	3BEC

		//;smartkey.C: 50: cntCyc = 0;
		CLRR 	72H 			//03E6 	0172

		//;smartkey.C: 51: cntOff = 0;
		CLRR 	4AH 			//03E7 	014A

		//;smartkey.C: 53: mode_chek = 1;
		CLRR 	73H 			//03E8 	0173
		INCR	73H,1 			//03E9 	09F3
		LJUMP 	3ECH 			//03EA 	3BEC

		//;smartkey.C: 58: else{
		//;smartkey.C: 59: cntOff = 0;
		CLRR 	4AH 			//03EB 	014A
		ORG		03ECH

		//;smartkey.C: 61: }
		//;smartkey.C: 63: }
		//;smartkey.C: 66: if(INTE&&INTF){
		BTSC 	INTCON,4 		//03EC 	160B
		BTSS 	INTCON,1 		//03ED 	1C8B
		LJUMP 	402H 			//03EE 	3C02

		//;smartkey.C: 67: unsigned char tmp;
		//;smartkey.C: 68: INTF = 0;
		BCR 	INTCON,1 		//03EF 	108B

		//;smartkey.C: 70: if( RA2==0){
		BCR 	STATUS,5 		//03F0 	1283
		BTSC 	5H,2 			//03F1 	1505
		LJUMP 	402H 			//03F2 	3C02

		//;smartkey.C: 72: if(timeTick <0x20){
		LDWI 	0H 			//03F3 	2A00
		ORG		03F4H
		SUBWR 	71H,0 			//03F4 	0C71
		LDWI 	20H 			//03F5 	2A20
		BTSC 	STATUS,2 		//03F6 	1503
		SUBWR 	70H,0 			//03F7 	0C70
		BTSC 	STATUS,0 		//03F8 	1403
		LJUMP 	401H 			//03F9 	3C01

		//;smartkey.C: 73: tmp = READ_EEPROM(0x40);
		LDWI 	40H 			//03FA 	2A40
		LCALL 	6D6H 			//03FB 	36D6
		ORG		03FCH
		STR 	79H 			//03FC 	01F9

		//;smartkey.C: 74: WRITE_EEPROM(0x40,tmp+1);
		INCR	79H,0 			//03FD 	0979
		STR 	75H 			//03FE 	01F5
		LDWI 	40H 			//03FF 	2A40
		LCALL 	61FH 			//0400 	361F
		LJUMP 	401H 			//0401 	3C01

		//;smartkey.C: 83: }
		//;smartkey.C: 85: }
		//;smartkey.C: 88: if (T0IE && T0IF) {
		BTSC 	INTCON,5 		//0402 	168B
		BTSS 	INTCON,2 		//0403 	1D0B
		ORG		0404H
		LJUMP 	451H 			//0404 	3C51
		LDWI 	B3H 			//0405 	2AB3

		//;smartkey.C: 89: T0IF = 0;
		BCR 	INTCON,2 		//0406 	110B

		//;smartkey.C: 90: TMR0 = 179;
		BCR 	STATUS,5 		//0407 	1283
		STR 	1H 			//0408 	0181

		//;smartkey.C: 96: if( mode_chek == 1){
		DECRSZ 	73H,0 		//0409 	0E73
		LJUMP 	423H 			//040A 	3C23

		//;smartkey.C: 98: cntCyc++;
		INCR	72H,1 			//040B 	09F2
		ORG		040CH

		//;smartkey.C: 100: if(RA5==0){
		BTSC 	5H,5 			//040C 	1685
		LJUMP 	423H 			//040D 	3C23
		LDWI 	10H 			//040E 	2A10

		//;smartkey.C: 102: cntOff++;
		INCR	4AH,1 			//040F 	09CA

		//;smartkey.C: 105: if(cntOff > 15){
		SUBWR 	4AH,0 			//0410 	0C4A
		BTSS 	STATUS,0 		//0411 	1C03
		LJUMP 	423H 			//0412 	3C23
		LDWI 	10H 			//0413 	2A10
		ORG		0414H

		//;smartkey.C: 107: mode_chek = 0;
		CLRR 	73H 			//0414 	0173

		//;smartkey.C: 109: if((cntCyc>15) &&(cntCyc<50)) {
		SUBWR 	72H,0 			//0415 	0C72
		LDWI 	32H 			//0416 	2A32
		BTSS 	STATUS,0 		//0417 	1C03
		LJUMP 	41FH 			//0418 	3C1F
		SUBWR 	72H,0 			//0419 	0C72
		BTSC 	STATUS,0 		//041A 	1403
		LJUMP 	41EH 			//041B 	3C1E
		ORG		041CH

		//;smartkey.C: 110: RegStatus |= (0x40);
		BSR 	49H,6 			//041C 	1B49

		//;smartkey.C: 111: } else if (cntCyc>=50){
		LJUMP 	422H 			//041D 	3C22
		LDWI 	32H 			//041E 	2A32
		SUBWR 	72H,0 			//041F 	0C72
		BTSC 	STATUS,0 		//0420 	1403

		//;smartkey.C: 112: RegStatus &= ~(0x40);
		BCR 	49H,6 			//0421 	1349

		//;smartkey.C: 113: }
		//;smartkey.C: 116: RegStatus |= 0x80;
		BSR 	49H,7 			//0422 	1BC9

		//;smartkey.C: 117: }
		//;smartkey.C: 119: }
		//;smartkey.C: 129: }
		//;smartkey.C: 132: timeTick++;
		INCR	70H,1 			//0423 	09F0
		ORG		0424H
		BTSC 	STATUS,2 		//0424 	1503
		INCR	71H,1 			//0425 	09F1

		//;smartkey.C: 134: if((mtState == 4)||(mtState == 3)){
		LDR 	74H,0 			//0426 	0874
		XORWI 	4H 			//0427 	2604
		BTSC 	STATUS,2 		//0428 	1503
		LJUMP 	42EH 			//0429 	3C2E
		LDR 	74H,0 			//042A 	0874
		XORWI 	3H 			//042B 	2603
		ORG		042CH
		BTSS 	STATUS,2 		//042C 	1D03
		LJUMP 	451H 			//042D 	3C51

		//;smartkey.C: 136: if(timeTick > cntTmp){
		LDR 	71H,0 			//042E 	0871
		SUBWR 	46H,0 			//042F 	0C46
		BTSS 	STATUS,2 		//0430 	1D03
		LJUMP 	434H 			//0431 	3C34
		LDR 	70H,0 			//0432 	0870
		SUBWR 	45H,0 			//0433 	0C45
		ORG		0434H
		BTSC 	STATUS,0 		//0434 	1403
		LJUMP 	451H 			//0435 	3C51

		//;smartkey.C: 137: cntTmp = timeTick+45;
		LDR 	71H,0 			//0436 	0871
		STR 	46H 			//0437 	01C6
		LDR 	70H,0 			//0438 	0870
		STR 	45H 			//0439 	01C5
		LDWI 	2DH 			//043A 	2A2D
		ADDWR 	45H,1 			//043B 	0BC5
		ORG		043CH
		BTSC 	STATUS,0 		//043C 	1403
		INCR	46H,1 			//043D 	09C6

		//;smartkey.C: 138: if(cntTmp<=timeOut)
		LDR 	46H,0 			//043E 	0846
		SUBWR 	48H,0 			//043F 	0C48
		BTSS 	STATUS,2 		//0440 	1D03
		LJUMP 	444H 			//0441 	3C44
		LDR 	45H,0 			//0442 	0845
		SUBWR 	47H,0 			//0443 	0C47
		ORG		0444H

		//;smartkey.C: 139: {
		//;smartkey.C: 140: TMR2IE = 0;
		BSR 	STATUS,5 		//0444 	1A83
		BTSS 	STATUS,0 		//0445 	1C03
		LJUMP 	452H 			//0446 	3C52
		BCR 	CH,1 			//0447 	108C

		//;smartkey.C: 142: if (PR2L == 20)
		LDR 	11H,0 			//0448 	0811
		XORWI 	14H 			//0449 	2614
		BTSS 	STATUS,2 		//044A 	1D03
		LJUMP 	44EH 			//044B 	3C4E
		ORG		044CH

		//;smartkey.C: 143: PR2L = 25;
		LDWI 	19H 			//044C 	2A19
		LJUMP 	44FH 			//044D 	3C4F

		//;smartkey.C: 144: else
		//;smartkey.C: 145: PR2L = 20;
		LDWI 	14H 			//044E 	2A14
		STR 	11H 			//044F 	0191

		//;smartkey.C: 146: TMR2IE = 1;
		BSR 	CH,1 			//0450 	188C

		//;smartkey.C: 147: }
		//;smartkey.C: 148: }
		//;smartkey.C: 149: }
		//;smartkey.C: 152: }
		//;smartkey.C: 155: if(TMR2IE&&TMR2IF)
		BSR 	STATUS,5 		//0451 	1A83
		BTSS 	CH,1 			//0452 	1C8C
		LJUMP 	45AH 			//0453 	3C5A
		ORG		0454H
		BCR 	STATUS,5 		//0454 	1283
		BTSS 	CH,1 			//0455 	1C8C
		LJUMP 	45AH 			//0456 	3C5A
		LDWI 	8H 			//0457 	2A08

		//;smartkey.C: 156: {
		//;smartkey.C: 157: TMR2IF = 0;
		BCR 	CH,1 			//0458 	108C

		//;smartkey.C: 158: RA3 =~ RA3;
		XORWR 	5H,1 			//0459 	0485
		LDR 	78H,0 			//045A 	0878
		STR 	PCLATH 			//045B 	018A
		ORG		045CH
		SWAPR 	77H,0 			//045C 	0777
		STR 	STATUS 			//045D 	0183
		SWAPR 	7EH,1 			//045E 	07FE
		SWAPR 	7EH,0 			//045F 	077E
		RETI		 			//0460 	0009
		CLRR 	25H 			//0461 	0125
		BTSS 	21H,7 			//0462 	1FA1
		LJUMP 	46BH 			//0463 	3C6B
		ORG		0464H
		COMR 	20H,1 			//0464 	0FA0
		COMR 	21H,1 			//0465 	0FA1
		INCR	20H,1 			//0466 	09A0
		BTSC 	STATUS,2 		//0467 	1503
		INCR	21H,1 			//0468 	09A1
		CLRR 	25H 			//0469 	0125
		INCR	25H,1 			//046A 	09A5
		BTSS 	23H,7 			//046B 	1FA3
		ORG		046CH
		LJUMP 	474H 			//046C 	3C74
		COMR 	22H,1 			//046D 	0FA2
		COMR 	23H,1 			//046E 	0FA3
		INCR	22H,1 			//046F 	09A2
		BTSC 	STATUS,2 		//0470 	1503
		INCR	23H,1 			//0471 	09A3
		LDWI 	1H 			//0472 	2A01
		XORWR 	25H,1 			//0473 	04A5
		ORG		0474H
		CLRR 	26H 			//0474 	0126
		CLRR 	27H 			//0475 	0127
		LDR 	21H,0 			//0476 	0821
		IORWR 	20H,0 			//0477 	0320
		BTSC 	STATUS,2 		//0478 	1503
		LJUMP 	499H 			//0479 	3C99
		CLRR 	24H 			//047A 	0124
		INCR	24H,1 			//047B 	09A4
		ORG		047CH
		BTSC 	21H,7 			//047C 	17A1
		LJUMP 	482H 			//047D 	3C82
		BCR 	STATUS,0 		//047E 	1003
		RLR 	20H,1 			//047F 	05A0
		RLR 	21H,1 			//0480 	05A1
		LJUMP 	47BH 			//0481 	3C7B
		BCR 	STATUS,0 		//0482 	1003
		RLR 	26H,1 			//0483 	05A6
		ORG		0484H
		RLR 	27H,1 			//0484 	05A7
		LDR 	21H,0 			//0485 	0821
		SUBWR 	23H,0 			//0486 	0C23
		BTSS 	STATUS,2 		//0487 	1D03
		LJUMP 	48BH 			//0488 	3C8B
		LDR 	20H,0 			//0489 	0820
		SUBWR 	22H,0 			//048A 	0C22
		BTSS 	STATUS,0 		//048B 	1C03
		ORG		048CH
		LJUMP 	495H 			//048C 	3C95
		LDR 	20H,0 			//048D 	0820
		SUBWR 	22H,1 			//048E 	0CA2
		LDR 	21H,0 			//048F 	0821
		BTSS 	STATUS,0 		//0490 	1C03
		DECR 	23H,1 			//0491 	0DA3
		SUBWR 	23H,1 			//0492 	0CA3
		BSR 	26H,0 			//0493 	1826
		ORG		0494H
		BCR 	STATUS,0 		//0494 	1003
		RRR	21H,1 			//0495 	06A1
		RRR	20H,1 			//0496 	06A0
		DECRSZ 	24H,1 		//0497 	0EA4
		LJUMP 	482H 			//0498 	3C82
		LDR 	25H,0 			//0499 	0825
		BTSC 	STATUS,2 		//049A 	1503
		LJUMP 	4A1H 			//049B 	3CA1
		ORG		049CH
		COMR 	26H,1 			//049C 	0FA6
		COMR 	27H,1 			//049D 	0FA7
		INCR	26H,1 			//049E 	09A6
		BTSC 	STATUS,2 		//049F 	1503
		INCR	27H,1 			//04A0 	09A7
		LDR 	27H,0 			//04A1 	0827
		STR 	21H 			//04A2 	01A1
		LDR 	26H,0 			//04A3 	0826
		ORG		04A4H
		STR 	20H 			//04A4 	01A0
		RET		 					//04A5 	0004
		STR 	27H 			//04A6 	01A7

		//;smartkey.C: 228: if(a>b){
		LDR 	20H,0 			//04A7 	0820
		XORWI 	80H 			//04A8 	2680
		STR 	22H 			//04A9 	01A2
		LDR 	27H,0 			//04AA 	0827
		XORWI 	80H 			//04AB 	2680
		ORG		04ACH
		SUBWR 	22H,1 			//04AC 	0CA2
		BTSC 	STATUS,0 		//04AD 	1403
		LJUMP 	4D2H 			//04AE 	3CD2

		//;smartkey.C: 229: if((a-b)<=dt) return 1;
		LDR 	20H,0 			//04AF 	0820
		SUBWR 	27H,0 			//04B0 	0C27
		STR 	22H 			//04B1 	01A2
		CLRR 	23H 			//04B2 	0123
		BTSS 	STATUS,0 		//04B3 	1C03
		ORG		04B4H
		DECR 	23H,1 			//04B4 	0DA3
		BTSC 	27H,7 			//04B5 	17A7
		DECR 	23H,1 			//04B6 	0DA3
		BTSC 	20H,7 			//04B7 	17A0
		INCR	23H,1 			//04B8 	09A3
		BCR 	STATUS,5 		//04B9 	1283
		LCALL 	4DFH 			//04BA 	34DF
		BTSS 	STATUS,2 		//04BB 	1D03
		ORG		04BCH
		LJUMP 	4BFH 			//04BC 	3CBF
		LDR 	22H,0 			//04BD 	0822
		SUBWR 	24H,0 			//04BE 	0C24
		BTSS 	STATUS,0 		//04BF 	1C03
		RETW 	0H 			//04C0 	2100
		RETW 	1H 			//04C1 	2101

		//;smartkey.C: 233: if((b-a)<=dt) return 1;
		SUBWR 	20H,0 			//04C2 	0C20
		STR 	22H 			//04C3 	01A2
		ORG		04C4H
		CLRR 	23H 			//04C4 	0123
		BTSS 	STATUS,0 		//04C5 	1C03
		DECR 	23H,1 			//04C6 	0DA3
		BTSC 	20H,7 			//04C7 	17A0
		DECR 	23H,1 			//04C8 	0DA3
		BTSC 	27H,7 			//04C9 	17A7
		INCR	23H,1 			//04CA 	09A3
		BCR 	STATUS,5 		//04CB 	1283
		ORG		04CCH
		LCALL 	4DFH 			//04CC 	34DF
		BTSS 	STATUS,2 		//04CD 	1D03
		LJUMP 	4BFH 			//04CE 	3CBF
		LDR 	22H,0 			//04CF 	0822
		SUBWR 	24H,0 			//04D0 	0C24
		LJUMP 	4BFH 			//04D1 	3CBF

		//;smartkey.C: 230: else return 0;
		//;smartkey.C: 232: else if(a<b){
		LDR 	27H,0 			//04D2 	0827
		XORWI 	80H 			//04D3 	2680
		ORG		04D4H
		STR 	22H 			//04D4 	01A2
		LDR 	20H,0 			//04D5 	0820
		XORWI 	80H 			//04D6 	2680
		SUBWR 	22H,1 			//04D7 	0CA2

		//;smartkey.C: 236: else if(a==b){
		LDR 	27H,0 			//04D8 	0827
		BTSS 	STATUS,0 		//04D9 	1C03
		LJUMP 	4C2H 			//04DA 	3CC2
		XORWR 	20H,0 			//04DB 	0420
		ORG		04DCH
		BTSC 	STATUS,2 		//04DC 	1503
		RETW 	1H 			//04DD 	2101
		RETW 	0H 			//04DE 	2100
		LDR 	21H,0 			//04DF 	0821
		STR 	24H 			//04E0 	01A4
		CLRR 	25H 			//04E1 	0125
		BTSC 	24H,7 			//04E2 	17A4
		DECR 	25H,1 			//04E3 	0DA5
		ORG		04E4H
		LDR 	25H,0 			//04E4 	0825
		XORWI 	80H 			//04E5 	2680
		STR 	26H 			//04E6 	01A6
		LDR 	23H,0 			//04E7 	0823
		XORWI 	80H 			//04E8 	2680
		SUBWR 	26H,0 			//04E9 	0C26
		RET		 					//04EA 	0004

		//;mpu6x.c: 24: else
		//;mpu6x.c: 25: return 1;
		//;mpu6x.c: 21: else
		//;mpu6x.c: 22: return 2;
		BCR 	STATUS,5 		//04EB 	1283
		ORG		04ECH
		STR 	21H 			//04EC 	01A1
		CLRR 	22H 			//04ED 	0122

		//;SWI2C.C: 115: RA7 = 0;
		BCR 	5H,7 			//04EE 	1385

		//;SWI2C.C: 116: TRISA |=0x40;;
		BSR 	STATUS,5 		//04EF 	1A83
		BSR 	5H,6 			//04F0 	1B05

		//;SWI2C.C: 117: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//04F1 	2A05
		BCR 	STATUS,5 		//04F2 	1283
		STR 	20H 			//04F3 	01A0
		ORG		04F4H
		DECRSZ 	20H,1 		//04F4 	0EA0
		LJUMP 	4F4H 			//04F5 	3CF4

		//;SWI2C.C: 118: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//04F6 	1283
		CLRR 	23H 			//04F7 	0123
		LDWI 	5H 			//04F8 	2A05

		//;SWI2C.C: 119: {
		//;SWI2C.C: 120: RA7 = 1;
		BSR 	5H,7 			//04F9 	1B85

		//;SWI2C.C: 121: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//04FA 	01A0
		DECRSZ 	20H,1 		//04FB 	0EA0
		ORG		04FCH
		LJUMP 	4FBH 			//04FC 	3CFB

		//;SWI2C.C: 122: dat = dat<<1 |(RA6 & 1 );
		LDWI 	0H 			//04FD 	2A00
		BCR 	STATUS,5 		//04FE 	1283
		BTSC 	5H,6 			//04FF 	1705
		LDWI 	1H 			//0500 	2A01
		ANDWI 	1H 			//0501 	2401
		STR 	20H 			//0502 	01A0
		BCR 	STATUS,0 		//0503 	1003
		ORG		0504H
		RLR 	22H,0 			//0504 	0522
		IORWR 	20H,0 			//0505 	0320
		STR 	22H 			//0506 	01A2
		LDWI 	5H 			//0507 	2A05

		//;SWI2C.C: 125: RA7 = 0;
		BCR 	5H,7 			//0508 	1385

		//;SWI2C.C: 126: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0509 	01A0
		DECRSZ 	20H,1 		//050A 	0EA0
		LJUMP 	50AH 			//050B 	3D0A
		ORG		050CH
		LDWI 	8H 			//050C 	2A08
		BCR 	STATUS,5 		//050D 	1283
		INCR	23H,1 			//050E 	09A3
		SUBWR 	23H,0 			//050F 	0C23
		BTSS 	STATUS,0 		//0510 	1C03
		LJUMP 	4F8H 			//0511 	3CF8

		//;SWI2C.C: 127: }
		//;SWI2C.C: 129: TRISA &=0xbf;;
		BSR 	STATUS,5 		//0512 	1A83
		BCR 	5H,6 			//0513 	1305
		ORG		0514H

		//;SWI2C.C: 131: RA6 = (Ack) ? 0 : 1;
		BCR 	STATUS,5 		//0514 	1283
		LDR 	21H,1 			//0515 	08A1
		BCR 	STATUS,5 		//0516 	1283
		BTSS 	STATUS,2 		//0517 	1D03
		LJUMP 	51BH 			//0518 	3D1B
		BSR 	5H,6 			//0519 	1B05
		LJUMP 	51CH 			//051A 	3D1C
		BCR 	5H,6 			//051B 	1305
		ORG		051CH
		LDWI 	5H 			//051C 	2A05

		//;SWI2C.C: 132: RA7 = 1;
		BSR 	5H,7 			//051D 	1B85

		//;SWI2C.C: 133: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//051E 	01A0
		DECRSZ 	20H,1 		//051F 	0EA0
		LJUMP 	51FH 			//0520 	3D1F
		LDWI 	5H 			//0521 	2A05

		//;SWI2C.C: 134: RA7 = 0;
		BCR 	STATUS,5 		//0522 	1283
		BCR 	5H,7 			//0523 	1385
		ORG		0524H

		//;SWI2C.C: 135: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0524 	01A0
		DECRSZ 	20H,1 		//0525 	0EA0
		LJUMP 	525H 			//0526 	3D25

		//;SWI2C.C: 136: return dat;
		BCR 	STATUS,5 		//0527 	1283
		LDR 	22H,0 			//0528 	0822
		RET		 					//0529 	0004
		BCR 	STATUS,5 		//052A 	1283
		STR 	21H 			//052B 	01A1
		ORG		052CH

		//;SWI2C.C: 89: TRISA &=0xbf;;
		BSR 	STATUS,5 		//052C 	1A83
		BCR 	5H,6 			//052D 	1305

		//;SWI2C.C: 90: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//052E 	2A05
		BCR 	STATUS,5 		//052F 	1283
		STR 	20H 			//0530 	01A0
		DECRSZ 	20H,1 		//0531 	0EA0
		LJUMP 	531H 			//0532 	3D31

		//;SWI2C.C: 91: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//0533 	1283
		ORG		0534H
		CLRR 	22H 			//0534 	0122

		//;SWI2C.C: 92: {
		//;SWI2C.C: 93: RA6 = (dat&0x80) ? 1:0;
		BTSS 	21H,7 			//0535 	1FA1
		LJUMP 	53AH 			//0536 	3D3A
		BCR 	STATUS,5 		//0537 	1283
		BSR 	5H,6 			//0538 	1B05
		LJUMP 	53CH 			//0539 	3D3C
		BCR 	STATUS,5 		//053A 	1283
		BCR 	5H,6 			//053B 	1305
		ORG		053CH
		LDWI 	5H 			//053C 	2A05

		//;SWI2C.C: 94: dat<<=1;
		BCR 	STATUS,0 		//053D 	1003
		RLR 	21H,1 			//053E 	05A1

		//;SWI2C.C: 95: RA7 = 1;
		BSR 	5H,7 			//053F 	1B85

		//;SWI2C.C: 96: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0540 	01A0
		DECRSZ 	20H,1 		//0541 	0EA0
		LJUMP 	541H 			//0542 	3D41
		LDWI 	5H 			//0543 	2A05
		ORG		0544H

		//;SWI2C.C: 97: RA7 = 0;
		BCR 	STATUS,5 		//0544 	1283
		BCR 	5H,7 			//0545 	1385

		//;SWI2C.C: 98: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0546 	01A0
		DECRSZ 	20H,1 		//0547 	0EA0
		LJUMP 	547H 			//0548 	3D47
		LDWI 	8H 			//0549 	2A08
		BCR 	STATUS,5 		//054A 	1283
		INCR	22H,1 			//054B 	09A2
		ORG		054CH
		SUBWR 	22H,0 			//054C 	0C22
		BTSS 	STATUS,0 		//054D 	1C03
		LJUMP 	535H 			//054E 	3D35

		//;SWI2C.C: 99: }
		//;SWI2C.C: 101: TRISA |=0x40;;
		BSR 	STATUS,5 		//054F 	1A83
		BSR 	5H,6 			//0550 	1B05

		//;SWI2C.C: 102: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0551 	2A05
		BCR 	STATUS,5 		//0552 	1283
		STR 	20H 			//0553 	01A0
		ORG		0554H
		DECRSZ 	20H,1 		//0554 	0EA0
		LJUMP 	554H 			//0555 	3D54
		LDWI 	5H 			//0556 	2A05

		//;SWI2C.C: 103: RA7 = 1;
		BCR 	STATUS,5 		//0557 	1283
		BSR 	5H,7 			//0558 	1B85

		//;SWI2C.C: 104: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0559 	01A0
		DECRSZ 	20H,1 		//055A 	0EA0
		LJUMP 	55AH 			//055B 	3D5A
		ORG		055CH

		//;SWI2C.C: 105: i= RA6;
		LDWI 	0H 			//055C 	2A00
		BCR 	STATUS,5 		//055D 	1283
		BTSC 	5H,6 			//055E 	1705
		LDWI 	1H 			//055F 	2A01
		STR 	22H 			//0560 	01A2

		//;SWI2C.C: 106: RA7 = 0;
		BCR 	5H,7 			//0561 	1385

		//;SWI2C.C: 107: TRISA &=0xbf;;
		BSR 	STATUS,5 		//0562 	1A83
		BCR 	5H,6 			//0563 	1305
		ORG		0564H

		//;SWI2C.C: 108: return i;
		BCR 	STATUS,5 		//0564 	1283
		LDR 	22H,0 			//0565 	0822
		RET		 					//0566 	0004
		STR 	2AH 			//0567 	01AA

		//;mpu6x.c: 32: unsigned char i;
		//;mpu6x.c: 34: swI2C_Start();
		LCALL 	663H 			//0568 	3663

		//;mpu6x.c: 36: if(swI2C_WriteByte(0x18<<1)== 0 )
		LDWI 	30H 			//0569 	2A30
		LCALL 	52AH 			//056A 	352A
		IORWI 	0H 			//056B 	2500
		ORG		056CH
		BTSS 	STATUS,2 		//056C 	1D03
		RETW 	1H 			//056D 	2101

		//;mpu6x.c: 37: {
		//;mpu6x.c: 38: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	2AH,0 			//056E 	082A
		LCALL 	52AH 			//056F 	352A
		IORWI 	0H 			//0570 	2500
		BTSS 	STATUS,2 		//0571 	1D03
		RETW 	2H 			//0572 	2102

		//;mpu6x.c: 39: {
		//;mpu6x.c: 40: swI2C_Start();
		LCALL 	663H 			//0573 	3663
		ORG		0574H

		//;mpu6x.c: 41: if(swI2C_WriteByte((0x18<<1)|1)== 0 ){
		LDWI 	31H 			//0574 	2A31
		LCALL 	52AH 			//0575 	352A
		IORWI 	0H 			//0576 	2500
		BTSS 	STATUS,2 		//0577 	1D03
		RETW 	1H 			//0578 	2101

		//;mpu6x.c: 43: for(i=0; i<(len-1);i++){
		CLRR 	2BH 			//0579 	012B
		LDR 	26H,0 			//057A 	0826
		ADDWI 	FFH 			//057B 	27FF
		ORG		057CH
		STR 	27H 			//057C 	01A7
		LDWI 	FFH 			//057D 	2AFF
		BTSC 	STATUS,0 		//057E 	1403
		LDWI 	0H 			//057F 	2A00
		STR 	28H 			//0580 	01A8
		XORWI 	80H 			//0581 	2680
		SUBWI 	80H 			//0582 	2880
		BTSS 	STATUS,2 		//0583 	1D03
		ORG		0584H
		LJUMP 	587H 			//0584 	3D87
		LDR 	27H,0 			//0585 	0827
		SUBWR 	2BH,0 			//0586 	0C2B

		//;mpu6x.c: 44: dat[i]=swI2C_ReadByte(1);
		LDWI 	1H 			//0587 	2A01
		BTSC 	STATUS,0 		//0588 	1403
		LJUMP 	58EH 			//0589 	3D8E
		LCALL 	4EBH 			//058A 	34EB
		LCALL 	592H 			//058B 	3592
		ORG		058CH
		INCR	2BH,1 			//058C 	09AB
		LJUMP 	57AH 			//058D 	3D7A

		//;mpu6x.c: 45: }
		//;mpu6x.c: 46: dat[i]=swI2C_ReadByte(1);
		LCALL 	4EBH 			//058E 	34EB
		LCALL 	592H 			//058F 	3592

		//;mpu6x.c: 47: swI2C_Stop();
		LCALL 	6A8H 			//0590 	36A8

		//;mpu6x.c: 48: return 0;
		RETW 	0H 			//0591 	2100

		//;mpu6x.c: 54: else
		//;mpu6x.c: 55: return 2;
		//;mpu6x.c: 51: else
		//;mpu6x.c: 52: return 1;
		STR 	27H 			//0592 	01A7
		LDR 	2BH,0 			//0593 	082B
		ORG		0594H
		ADDWR 	24H,0 			//0594 	0B24
		STR 	28H 			//0595 	01A8
		LDR 	25H,0 			//0596 	0825
		BTSC 	STATUS,0 		//0597 	1403
		ADDWI 	1H 			//0598 	2701
		STR 	29H 			//0599 	01A9
		LDR 	28H,0 			//059A 	0828
		STR 	FSR 			//059B 	0184
		ORG		059CH
		BCR 	STATUS,7 		//059C 	1383
		BTSC 	29H,0 			//059D 	1429
		BSR 	STATUS,7 		//059E 	1B83
		LDR 	27H,0 			//059F 	0827
		STR 	INDF 			//05A0 	0180
		RET		 					//05A1 	0004
		STR 	28H 			//05A2 	01A8

		//;mpu6x.c: 5: unsigned char i;
		//;mpu6x.c: 6: swI2C_Start();
		LCALL 	663H 			//05A3 	3663
		ORG		05A4H

		//;mpu6x.c: 8: if(swI2C_WriteByte(0x18<<1)== 0 )
		LDWI 	30H 			//05A4 	2A30
		LCALL 	52AH 			//05A5 	352A
		IORWI 	0H 			//05A6 	2500
		BTSS 	STATUS,2 		//05A7 	1D03
		RETW 	1H 			//05A8 	2101

		//;mpu6x.c: 9: {
		//;mpu6x.c: 10: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	28H,0 			//05A9 	0828
		LCALL 	52AH 			//05AA 	352A
		IORWI 	0H 			//05AB 	2500
		ORG		05ACH
		BTSS 	STATUS,2 		//05AC 	1D03
		RETW 	2H 			//05AD 	2102

		//;mpu6x.c: 11: {
		//;mpu6x.c: 12: for(i=0; i<len;i++){
		CLRR 	29H 			//05AE 	0129
		LDR 	25H,0 			//05AF 	0825
		SUBWR 	29H,0 			//05B0 	0C29
		BTSC 	STATUS,0 		//05B1 	1403
		LJUMP 	5C8H 			//05B2 	3DC8

		//;mpu6x.c: 13: if(swI2C_WriteByte(dat[i])==1 ){
		LDR 	29H,0 			//05B3 	0829
		ORG		05B4H
		ADDWR 	23H,0 			//05B4 	0B23
		STR 	26H 			//05B5 	01A6
		LDR 	24H,0 			//05B6 	0824
		BTSC 	STATUS,0 		//05B7 	1403
		ADDWI 	1H 			//05B8 	2701
		STR 	27H 			//05B9 	01A7
		LDR 	26H,0 			//05BA 	0826
		STR 	FSR 			//05BB 	0184
		ORG		05BCH
		BSR 	STATUS,7 		//05BC 	1B83
		BTSS 	27H,0 			//05BD 	1C27
		BCR 	STATUS,7 		//05BE 	1383
		LDR 	INDF,0 			//05BF 	0800
		LCALL 	52AH 			//05C0 	352A
		XORWI 	1H 			//05C1 	2601
		BTSS 	STATUS,2 		//05C2 	1D03
		LJUMP 	5C6H 			//05C3 	3DC6
		ORG		05C4H

		//;mpu6x.c: 14: swI2C_Stop();
		LCALL 	6A8H 			//05C4 	36A8

		//;mpu6x.c: 15: return 3;
		RETW 	3H 			//05C5 	2103
		INCR	29H,1 			//05C6 	09A9
		LJUMP 	5AFH 			//05C7 	3DAF

		//;mpu6x.c: 16: }
		//;mpu6x.c: 17: }
		//;mpu6x.c: 18: swI2C_Stop();
		LCALL 	6A8H 			//05C8 	36A8

		//;mpu6x.c: 19: return 0;
		RETW 	0H 			//05C9 	2100

		//;SWI2C.C: 10: TRISA &=0xbf;;
		BSR 	STATUS,5 		//05CA 	1A83
		BCR 	5H,6 			//05CB 	1305
		ORG		05CCH

		//;SWI2C.C: 11: TRISA &=0x7f;;
		BCR 	5H,7 			//05CC 	1385

		//;SWI2C.C: 12: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05CD 	2A05
		BCR 	STATUS,5 		//05CE 	1283
		STR 	20H 			//05CF 	01A0
		DECRSZ 	20H,1 		//05D0 	0EA0
		LJUMP 	5D0H 			//05D1 	3DD0
		LDWI 	5H 			//05D2 	2A05

		//;SWI2C.C: 13: RA7 = 1;
		BCR 	STATUS,5 		//05D3 	1283
		ORG		05D4H
		BSR 	5H,7 			//05D4 	1B85
		BSR 	5H,6 			//05D5 	1B05

		//;SWI2C.C: 15: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05D6 	01A0
		DECRSZ 	20H,1 		//05D7 	0EA0
		LJUMP 	5D7H 			//05D8 	3DD7

		//;SWI2C.C: 16: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05D9 	2A05
		BCR 	STATUS,5 		//05DA 	1283
		STR 	20H 			//05DB 	01A0
		ORG		05DCH
		DECRSZ 	20H,1 		//05DC 	0EA0
		LJUMP 	5DCH 			//05DD 	3DDC

		//;SWI2C.C: 17: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05DE 	2A05
		BCR 	STATUS,5 		//05DF 	1283
		STR 	20H 			//05E0 	01A0
		DECRSZ 	20H,1 		//05E1 	0EA0
		LJUMP 	5E1H 			//05E2 	3DE1

		//;SWI2C.C: 18: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05E3 	2A05
		ORG		05E4H
		BCR 	STATUS,5 		//05E4 	1283
		STR 	20H 			//05E5 	01A0
		DECRSZ 	20H,1 		//05E6 	0EA0
		LJUMP 	5E6H 			//05E7 	3DE6
		RET		 					//05E8 	0004

		//;sysinit.c: 88: INTCON = 0B00000000;
		CLRR 	INTCON 			//05E9 	010B

		//;sysinit.c: 89: PIE1 = 0B00000000;
		BSR 	STATUS,5 		//05EA 	1A83
		CLRR 	CH 			//05EB 	010C
		ORG		05ECH

		//;sysinit.c: 90: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//05EC 	1283
		CLRR 	CH 			//05ED 	010C

		//;sysinit.c: 92: IOCA5 = 1;
		BSR 	STATUS,5 		//05EE 	1A83
		BSR 	16H,5 			//05EF 	1A96

		//;sysinit.c: 93: tmp = PORTA;
		BCR 	STATUS,5 		//05F0 	1283
		LDR 	5H,0 			//05F1 	0805

		//;sysinit.c: 94: PAIF = 0;
		BCR 	INTCON,0 		//05F2 	100B

		//;sysinit.c: 95: PAIE = 0;
		BCR 	INTCON,3 		//05F3 	118B
		ORG		05F4H

		//;sysinit.c: 98: INTEDG = 0;
		BSR 	STATUS,5 		//05F4 	1A83
		BCR 	1H,6 			//05F5 	1301

		//;sysinit.c: 99: INTF = 0;
		BCR 	INTCON,1 		//05F6 	108B

		//;sysinit.c: 100: INTE = 1;
		BSR 	INTCON,4 		//05F7 	1A0B

		//;sysinit.c: 102: TMR2IF = 0;
		BCR 	STATUS,5 		//05F8 	1283
		BCR 	CH,1 			//05F9 	108C

		//;sysinit.c: 103: TMR2IE = 1;
		BSR 	STATUS,5 		//05FA 	1A83
		BSR 	CH,1 			//05FB 	188C
		ORG		05FCH

		//;sysinit.c: 104: TMR2ON = 0;
		BCR 	STATUS,5 		//05FC 	1283
		BCR 	12H,2 			//05FD 	1112

		//;sysinit.c: 110: T0IF = 0;
		BCR 	INTCON,2 		//05FE 	110B

		//;sysinit.c: 111: T0IE = 1;
		BSR 	INTCON,5 		//05FF 	1A8B

		//;sysinit.c: 112: T0ON = 1;
		BSR 	1FH,3 			//0600 	199F

		//;sysinit.c: 114: PEIE = 1;
		BSR 	INTCON,6 		//0601 	1B0B

		//;sysinit.c: 116: GIE = 1;
		BSR 	INTCON,7 		//0602 	1B8B
		RET		 					//0603 	0004
		ORG		0604H
		STR 	21H 			//0604 	01A1

		//;smartkey.C: 206: GIE = 0;
		BCR 	INTCON,7 		//0605 	138B

		//;smartkey.C: 207: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//0606 	1F8B
		LJUMP 	60AH 			//0607 	3E0A
		CLRWDT	 			//0608 	0001
		LJUMP 	606H 			//0609 	3E06

		//;smartkey.C: 208: EEADR = EEAddr;
		BCR 	STATUS,5 		//060A 	1283
		LDR 	21H,0 			//060B 	0821
		ORG		060CH
		BSR 	STATUS,5 		//060C 	1A83
		STR 	1BH 			//060D 	019B

		//;smartkey.C: 209: EEDAT = EEData;
		BCR 	STATUS,5 		//060E 	1283
		LDR 	20H,0 			//060F 	0820
		BSR 	STATUS,5 		//0610 	1A83
		STR 	1AH 			//0611 	019A
		LDWI 	34H 			//0612 	2A34

		//;smartkey.C: 210: EEIF = 0;
		BCR 	STATUS,5 		//0613 	1283
		ORG		0614H
		BCR 	CH,7 			//0614 	138C

		//;smartkey.C: 211: EECON1 = 0x34;
		BSR 	STATUS,5 		//0615 	1A83
		STR 	1CH 			//0616 	019C

		//;smartkey.C: 212: WR = 1;
		BSR 	1DH,0 			//0617 	181D

		//;smartkey.C: 213: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//0618 	1A83
		BTSS 	1DH,0 			//0619 	1C1D
		LJUMP 	61DH 			//061A 	3E1D
		CLRWDT	 			//061B 	0001
		ORG		061CH
		LJUMP 	618H 			//061C 	3E18

		//;smartkey.C: 215: GIE = 1;
		BSR 	INTCON,7 		//061D 	1B8B
		RET		 					//061E 	0004
		STR 	76H 			//061F 	01F6

		//;smartkey.C: 206: GIE = 0;
		BCR 	INTCON,7 		//0620 	138B

		//;smartkey.C: 207: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//0621 	1F8B
		LJUMP 	625H 			//0622 	3E25
		CLRWDT	 			//0623 	0001
		ORG		0624H
		LJUMP 	621H 			//0624 	3E21

		//;smartkey.C: 208: EEADR = EEAddr;
		LDR 	76H,0 			//0625 	0876
		BSR 	STATUS,5 		//0626 	1A83
		STR 	1BH 			//0627 	019B

		//;smartkey.C: 209: EEDAT = EEData;
		LDR 	75H,0 			//0628 	0875
		STR 	1AH 			//0629 	019A
		LDWI 	34H 			//062A 	2A34

		//;smartkey.C: 210: EEIF = 0;
		BCR 	STATUS,5 		//062B 	1283
		ORG		062CH
		BCR 	CH,7 			//062C 	138C

		//;smartkey.C: 211: EECON1 = 0x34;
		BSR 	STATUS,5 		//062D 	1A83
		STR 	1CH 			//062E 	019C

		//;smartkey.C: 212: WR = 1;
		BSR 	1DH,0 			//062F 	181D

		//;smartkey.C: 213: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//0630 	1A83
		BTSS 	1DH,0 			//0631 	1C1D
		LJUMP 	635H 			//0632 	3E35
		CLRWDT	 			//0633 	0001
		ORG		0634H
		LJUMP 	630H 			//0634 	3E30

		//;smartkey.C: 215: GIE = 1;
		BSR 	INTCON,7 		//0635 	1B8B
		RET		 					//0636 	0004
		STR 	25H 			//0637 	01A5

		//;smartkey.C: 177: {
		//;smartkey.C: 178: while(rep--){
		DECR 	24H,1 			//0638 	0DA4
		LDR 	24H,0 			//0639 	0824
		XORWI 	FFH 			//063A 	26FF
		BTSC 	STATUS,2 		//063B 	1503
		ORG		063CH
		RET		 					//063C 	0004
		LDWI 	CH 			//063D 	2A0C

		//;smartkey.C: 179: TMR2ON = 1;
		BSR 	12H,2 			//063E 	1912

		//;smartkey.C: 180: PR2L = 12;
		BSR 	STATUS,5 		//063F 	1A83
		STR 	11H 			//0640 	0191

		//;smartkey.C: 181: delay_x10ms(delay);
		BCR 	STATUS,5 		//0641 	1283
		LDR 	25H,0 			//0642 	0825
		STR 	20H 			//0643 	01A0
		ORG		0644H
		CLRR 	21H 			//0644 	0121
		LCALL 	676H 			//0645 	3676
		LDWI 	14H 			//0646 	2A14

		//;smartkey.C: 183: TMR2ON = 0;RA3 =0;
		BCR 	12H,2 			//0647 	1112
		BCR 	5H,3 			//0648 	1185

		//;smartkey.C: 184: delay_x10ms(20);
		STR 	20H 			//0649 	01A0
		CLRR 	21H 			//064A 	0121
		LCALL 	676H 			//064B 	3676
		ORG		064CH
		LJUMP 	638H 			//064C 	3E38

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//064D 	1283
		CLRR 	5H 			//064E 	0105

		//;sysinit.c: 35: TRISA = 0B00110111;
		LDWI 	37H 			//064F 	2A37
		BSR 	STATUS,5 		//0650 	1A83
		STR 	5H 			//0651 	0185

		//;sysinit.c: 36: WPUA = 0B11000000;
		LDWI 	C0H 			//0652 	2AC0
		STR 	15H 			//0653 	0195
		ORG		0654H

		//;sysinit.c: 38: PORTC = 0B00000000;
		BCR 	STATUS,5 		//0654 	1283
		CLRR 	7H 			//0655 	0107

		//;sysinit.c: 39: TRISC = 0B11111100;
		LDWI 	FCH 			//0656 	2AFC
		BSR 	STATUS,5 		//0657 	1A83
		STR 	7H 			//0658 	0187

		//;sysinit.c: 40: WPUC = 0B00000000;
		CLRR 	13H 			//0659 	0113

		//;sysinit.c: 42: PSRCA = 0B11111111;
		LDWI 	FFH 			//065A 	2AFF
		STR 	8H 			//065B 	0188
		ORG		065CH

		//;sysinit.c: 43: PSRCC = 0B11111111;
		STR 	14H 			//065C 	0194

		//;sysinit.c: 44: PSINKA = 0B11111111;
		STR 	17H 			//065D 	0197

		//;sysinit.c: 45: PSINKC = 0B11111111;
		STR 	1FH 			//065E 	019F

		//;sysinit.c: 47: MSCON = 0B00110000;
		LDWI 	30H 			//065F 	2A30
		BCR 	STATUS,5 		//0660 	1283
		STR 	1BH 			//0661 	019B
		RET		 					//0662 	0004
		LDWI 	5H 			//0663 	2A05
		ORG		0664H

		//;SWI2C.C: 24: RA7 = 1;
		BSR 	5H,7 			//0664 	1B85

		//;SWI2C.C: 26: RA6 = 1;
		BSR 	5H,6 			//0665 	1B05

		//;SWI2C.C: 27: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0666 	01A0
		DECRSZ 	20H,1 		//0667 	0EA0
		LJUMP 	667H 			//0668 	3E67
		LDWI 	5H 			//0669 	2A05

		//;SWI2C.C: 28: RA6 = 0;
		BCR 	STATUS,5 		//066A 	1283
		BCR 	5H,6 			//066B 	1305
		ORG		066CH

		//;SWI2C.C: 29: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//066C 	01A0
		DECRSZ 	20H,1 		//066D 	0EA0
		LJUMP 	66DH 			//066E 	3E6D
		LDWI 	5H 			//066F 	2A05

		//;SWI2C.C: 30: RA7 = 0;
		BCR 	STATUS,5 		//0670 	1283
		BCR 	5H,7 			//0671 	1385

		//;SWI2C.C: 31: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0672 	01A0
		DECRSZ 	20H,1 		//0673 	0EA0
		ORG		0674H
		LJUMP 	673H 			//0674 	3E73
		RET		 					//0675 	0004

		//;smartkey.C: 165: unsigned int set = t + timeTick;
		LDR 	21H,0 			//0676 	0821
		STR 	23H 			//0677 	01A3
		LDR 	20H,0 			//0678 	0820
		STR 	22H 			//0679 	01A2
		LDR 	70H,0 			//067A 	0870
		ADDWR 	22H,1 			//067B 	0BA2
		ORG		067CH
		BTSC 	STATUS,0 		//067C 	1403
		INCR	23H,1 			//067D 	09A3
		LDR 	71H,0 			//067E 	0871
		ADDWR 	23H,1 			//067F 	0BA3

		//;smartkey.C: 166: while(timeTick < set);
		LDR 	23H,0 			//0680 	0823
		SUBWR 	71H,0 			//0681 	0C71
		BTSS 	STATUS,2 		//0682 	1D03
		LJUMP 	686H 			//0683 	3E86
		ORG		0684H
		LDR 	22H,0 			//0684 	0822
		SUBWR 	70H,0 			//0685 	0C70
		BTSC 	STATUS,0 		//0686 	1403
		RET		 					//0687 	0004
		LJUMP 	680H 			//0688 	3E80

		//;sysinit.c: 60: T0CON0 = 0B00000000;
		CLRR 	1FH 			//0689 	011F

		//;sysinit.c: 61: OPTION = 0B00000111;
		LDWI 	7H 			//068A 	2A07
		BSR 	STATUS,5 		//068B 	1A83
		ORG		068CH
		STR 	1H 			//068C 	0181

		//;sysinit.c: 62: TMR0 = 179;
		LDWI 	B3H 			//068D 	2AB3
		BCR 	STATUS,5 		//068E 	1283
		STR 	1H 			//068F 	0181

		//;sysinit.c: 64: TMR2H = 0;
		CLRR 	13H 			//0690 	0113

		//;sysinit.c: 65: TMR2L = 0;
		CLRR 	11H 			//0691 	0111

		//;sysinit.c: 66: PR2H = 0;
		BSR 	STATUS,5 		//0692 	1A83
		CLRR 	12H 			//0693 	0112
		ORG		0694H

		//;sysinit.c: 67: PR2L =0;
		CLRR 	11H 			//0694 	0111

		//;sysinit.c: 68: T2CON0 = 0B00101001;
		LDWI 	29H 			//0695 	2A29
		BCR 	STATUS,5 		//0696 	1283
		STR 	12H 			//0697 	0192
		RET		 					//0698 	0004
		CLRR 	70H 			//0699 	0170
		CLRR 	71H 			//069A 	0171
		CLRR 	72H 			//069B 	0172
		ORG		069CH
		CLRR 	73H 			//069C 	0173
		CLRR 	74H 			//069D 	0174
		CLRR 	45H 			//069E 	0145
		CLRR 	46H 			//069F 	0146
		CLRR 	47H 			//06A0 	0147
		CLRR 	48H 			//06A1 	0148
		CLRR 	49H 			//06A2 	0149
		CLRR 	4AH 			//06A3 	014A
		ORG		06A4H
		CLRR 	4BH 			//06A4 	014B
		CLRR 	4CH 			//06A5 	014C
		CLRR 	STATUS 			//06A6 	0103
		LJUMP 	0BH 			//06A7 	380B
		LDWI 	5H 			//06A8 	2A05

		//;SWI2C.C: 37: RA6 = 0;
		BCR 	5H,6 			//06A9 	1305

		//;SWI2C.C: 38: RA7 = 1;
		BSR 	5H,7 			//06AA 	1B85

		//;SWI2C.C: 39: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//06AB 	01A0
		ORG		06ACH
		DECRSZ 	20H,1 		//06AC 	0EA0
		LJUMP 	6ACH 			//06AD 	3EAC
		LDWI 	5H 			//06AE 	2A05

		//;SWI2C.C: 40: RA6 = 1;
		BCR 	STATUS,5 		//06AF 	1283
		BSR 	5H,6 			//06B0 	1B05

		//;SWI2C.C: 41: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//06B1 	01A0
		DECRSZ 	20H,1 		//06B2 	0EA0
		LJUMP 	6B2H 			//06B3 	3EB2
		ORG		06B4H
		RET		 					//06B4 	0004
		BCR 	STATUS,5 		//06B5 	1283
		STR 	20H 			//06B6 	01A0

		//;smartkey.C: 195: unsigned char ReEepromData;
		//;smartkey.C: 197: EEADR = EEAddr;
		BSR 	STATUS,5 		//06B7 	1A83
		STR 	1BH 			//06B8 	019B

		//;smartkey.C: 198: RD = 1;
		BSR 	1CH,0 			//06B9 	181C

		//;smartkey.C: 199: ReEepromData = EEDAT;
		LDR 	1AH,0 			//06BA 	081A
		BCR 	STATUS,5 		//06BB 	1283
		ORG		06BCH
		STR 	21H 			//06BC 	01A1

		//;smartkey.C: 200: RD = 0;
		BSR 	STATUS,5 		//06BD 	1A83
		BCR 	1CH,0 			//06BE 	101C

		//;smartkey.C: 201: return ReEepromData;
		BCR 	STATUS,5 		//06BF 	1283
		LDR 	21H,0 			//06C0 	0821
		RET		 					//06C1 	0004
		STR 	22H 			//06C2 	01A2

		//;smartkey.C: 221: mtOldState = mtState;
		LDR 	74H,0 			//06C3 	0874
		ORG		06C4H
		STR 	4CH 			//06C4 	01CC

		//;smartkey.C: 222: mtState = stt;
		LDR 	22H,0 			//06C5 	0822
		STR 	74H 			//06C6 	01F4

		//;smartkey.C: 223: timeTick =0;
		CLRR 	70H 			//06C7 	0170
		CLRR 	71H 			//06C8 	0171

		//;smartkey.C: 224: timeOut = _tOut;
		LDR 	21H,0 			//06C9 	0821
		STR 	48H 			//06CA 	01C8
		LDR 	20H,0 			//06CB 	0820
		ORG		06CCH
		STR 	47H 			//06CC 	01C7
		RET		 					//06CD 	0004

		//;sysinit.c: 21: OSCCON = 0B01010001;
		LDWI 	51H 			//06CE 	2A51
		BSR 	STATUS,5 		//06CF 	1A83
		STR 	FH 			//06D0 	018F

		//;sysinit.c: 22: _nop();
		NOP		 					//06D1 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//06D2 	1A83
		BTSC 	FH,2 			//06D3 	150F
		ORG		06D4H
		RET		 					//06D4 	0004
		LJUMP 	6D2H 			//06D5 	3ED2
		STR 	75H 			//06D6 	01F5

		//;smartkey.C: 195: unsigned char ReEepromData;
		//;smartkey.C: 197: EEADR = EEAddr;
		BSR 	STATUS,5 		//06D7 	1A83
		STR 	1BH 			//06D8 	019B

		//;smartkey.C: 198: RD = 1;
		BSR 	1CH,0 			//06D9 	181C

		//;smartkey.C: 199: ReEepromData = EEDAT;
		LDR 	1AH,0 			//06DA 	081A
		STR 	76H 			//06DB 	01F6
		ORG		06DCH

		//;smartkey.C: 200: RD = 0;
		BCR 	1CH,0 			//06DC 	101C

		//;smartkey.C: 201: return ReEepromData;
		RET		 					//06DD 	0004
		LJUMP 	278H 			//06DE 	3A78
		LJUMP 	1B1H 			//06DF 	39B1
		LJUMP 	1B8H 			//06E0 	39B8
		LJUMP 	201H 			//06E1 	3A01
		LJUMP 	222H 			//06E2 	3A22

		//;smartkey.C: 173: TMR2ON = 1;
		BCR 	STATUS,5 		//06E3 	1283
		ORG		06E4H
		BSR 	12H,2 			//06E4 	1912

		//;smartkey.C: 174: TRISA &= 0xf7;
		BSR 	STATUS,5 		//06E5 	1A83
		BCR 	5H,3 			//06E6 	1185
		RET		 					//06E7 	0004

		//;smartkey.C: 170: TMR2ON = 0;RA3 =0;TRISA |= 0x08;
		BCR 	12H,2 			//06E8 	1112
		BCR 	5H,3 			//06E9 	1185
		BSR 	STATUS,5 		//06EA 	1A83
		BSR 	5H,3 			//06EB 	1985
		ORG		06ECH
		RET		 					//06EC 	0004
			END

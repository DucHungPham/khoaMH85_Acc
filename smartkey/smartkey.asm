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
		LJUMP 	402H 			//0009 	3C02
		LJUMP 	6C0H 			//000A 	3EC0

		//;smartkey.C: 251: unsigned char reAlertOn=0,tmp8,isSw=0,isFall=0,mpuOk=0,vibrateOn=0,acc
		//+                          Set=0;
		CLRR 	3BH 			//000B 	013B
		ORG		000CH
		CLRR 	41H 			//000C 	0141
		CLRR 	31H 			//000D 	0131
		CLRR 	34H 			//000E 	0134

		//;smartkey.C: 252: unsigned int isWait =0;
		CLRR 	2FH 			//000F 	012F
		CLRR 	30H 			//0010 	0130

		//;smartkey.C: 253: signed int acYsum=0,acXsum=0;
		CLRR 	3DH 			//0011 	013D
		CLRR 	3EH 			//0012 	013E
		CLRR 	3FH 			//0013 	013F
		ORG		0014H
		CLRR 	40H 			//0014 	0140

		//;smartkey.C: 254: unsigned int tmp16=0;
		CLRR 	42H 			//0015 	0142
		CLRR 	43H 			//0016 	0143
		CLRWDT	 			//0017 	0001

		//;smartkey.C: 260: sys_init();
		LCALL 	6F5H 			//0018 	36F5

		//;smartkey.C: 261: gpio_init();
		LCALL 	674H 			//0019 	3674

		//;smartkey.C: 262: timer_init();
		LCALL 	6B0H 			//001A 	36B0

		//;smartkey.C: 263: int_init();
		LCALL 	610H 			//001B 	3610
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
		LCALL 	5F1H 			//0028 	35F1
		LDWI 	0H 			//0029 	2A00

		//;smartkey.C: 277: setState(0,0);
		BCR 	STATUS,5 		//002A 	1283
		CLRR 	20H 			//002B 	0120
		ORG		002CH
		CLRR 	21H 			//002C 	0121
		LCALL 	6E9H 			//002D 	36E9

		//;smartkey.C: 279: WRITE_EEPROM(0xFF,0xAA);
		LDWI 	AAH 			//002E 	2AAA
		STR 	20H 			//002F 	01A0
		LDWI 	FFH 			//0030 	2AFF
		LCALL 	62BH 			//0031 	362B

		//;smartkey.C: 280: WRITE_EEPROM(0xFF,0xAA);
		LDWI 	AAH 			//0032 	2AAA
		BCR 	STATUS,5 		//0033 	1283
		ORG		0034H
		STR 	20H 			//0034 	01A0
		LDWI 	FFH 			//0035 	2AFF
		LCALL 	62BH 			//0036 	362B

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
		LCALL 	6DCH 			//0046 	36DC
		STR 	44H 			//0047 	01C4

		//;smartkey.C: 286: if(tmp8==0xff) {WRITE_EEPROM(0x08,0);_delay((unsigned long)((2)*(40000
		//+                          00/4000.0)));}
		XORWI 	FFH 			//0048 	26FF
		BTSS 	STATUS,2 		//0049 	1D03
		LJUMP 	58H 			//004A 	3858
		LDWI 	8H 			//004B 	2A08
		ORG		004CH
		CLRR 	20H 			//004C 	0120
		LCALL 	62BH 			//004D 	362B
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
		LCALL 	6E9H 			//0063 	36E9
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
		LCALL 	70AH 			//0071 	370A

		//;smartkey.C: 295: } else {
		LJUMP 	7AH 			//0072 	387A

		//;smartkey.C: 296: setState(2,400);
		LDWI 	90H 			//0073 	2A90
		ORG		0074H
		STR 	20H 			//0074 	01A0
		LDWI 	1H 			//0075 	2A01
		STR 	21H 			//0076 	01A1
		LDWI 	2H 			//0077 	2A02
		LCALL 	6E9H 			//0078 	36E9

		//;smartkey.C: 298: mtOldState = 0;
		CLRR 	4CH 			//0079 	014C

		//;smartkey.C: 300: }
		//;smartkey.C: 303: tmp8 = READ_EEPROM(0x40);
		LDWI 	40H 			//007A 	2A40
		LCALL 	6DCH 			//007B 	36DC
		ORG		007CH
		STR 	44H 			//007C 	01C4

		//;smartkey.C: 304: if(tmp8==8){
		XORWI 	8H 			//007D 	2608
		BTSS 	STATUS,2 		//007E 	1D03
		LJUMP 	A4H 			//007F 	38A4

		//;smartkey.C: 305: tmp8= READ_EEPROM(0x41);
		LDWI 	41H 			//0080 	2A41
		LCALL 	6DCH 			//0081 	36DC
		STR 	44H 			//0082 	01C4
		LDWI 	19H 			//0083 	2A19
		ORG		0084H

		//;smartkey.C: 306: beep(25,1);
		CLRR 	24H 			//0084 	0124
		INCR	24H,1 			//0085 	09A4
		LCALL 	65EH 			//0086 	365E

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
		LCALL 	62BH 			//0094 	362B
		LDWI 	40H 			//0095 	2A40

		//;smartkey.C: 313: }
		//;smartkey.C: 314: WRITE_EEPROM(0x40,0);
		BCR 	STATUS,5 		//0096 	1283
		CLRR 	20H 			//0097 	0120
		LCALL 	62BH 			//0098 	362B

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
		LCALL 	62BH 			//00AA 	362B

		//;smartkey.C: 320: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//00AB 	2A41
		ORG		00ACH
		LCALL 	6DCH 			//00AC 	36DC
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
		LCALL 	62BH 			//00CB 	362B
		ORG		00CCH
		LJUMP 	B3H 			//00CC 	38B3

		//;smartkey.C: 326: }
		//;smartkey.C: 327: }
		//;smartkey.C: 330: buf[0] = 0x28;
		LDWI 	28H 			//00CD 	2A28
		STR 	35H 			//00CE 	01B5

		//;smartkey.C: 331: buf[1] = 0x87;
		LDWI 	87H 			//00CF 	2A87
		STR 	36H 			//00D0 	01B6

		//;smartkey.C: 332: if(AccWrite(0x6b,(unsigned char)buf,2)==0)
		LDWI 	35H 			//00D1 	2A35
		STR 	2CH 			//00D2 	01AC
		CLRR 	2DH 			//00D3 	012D
		ORG		00D4H
		STR 	23H 			//00D4 	01A3
		LDR 	2DH,0 			//00D5 	082D
		STR 	24H 			//00D6 	01A4
		LDWI 	2H 			//00D7 	2A02
		STR 	25H 			//00D8 	01A5
		LDWI 	6BH 			//00D9 	2A6B
		LCALL 	5C9H 			//00DA 	35C9
		IORWI 	0H 			//00DB 	2500
		ORG		00DCH

		//;smartkey.C: 333: mpuOk =1;
		BCR 	STATUS,5 		//00DC 	1283
		BTSS 	STATUS,2 		//00DD 	1D03
		LJUMP 	E2H 			//00DE 	38E2
		CLRR 	3CH 			//00DF 	013C
		INCR	3CH,1 			//00E0 	09BC
		LJUMP 	E3H 			//00E1 	38E3

		//;smartkey.C: 334: else
		//;smartkey.C: 335: mpuOk =0;
		CLRR 	3CH 			//00E2 	013C

		//;smartkey.C: 337: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//00E3 	2A82
		ORG		00E4H
		STR 	2DH 			//00E4 	01AD
		LDWI 	DDH 			//00E5 	2ADD
		STR 	2CH 			//00E6 	01AC
		DECRSZ 	2CH,1 		//00E7 	0EAC
		LJUMP 	E7H 			//00E8 	38E7
		DECRSZ 	2DH,1 		//00E9 	0EAD
		LJUMP 	E7H 			//00EA 	38E7
		LJUMP 	ECH 			//00EB 	38EC
		ORG		00ECH

		//;smartkey.C: 339: if(mpuOk ==0){beep(10,2);}
		BCR 	STATUS,5 		//00EC 	1283
		LDR 	3CH,1 			//00ED 	08BC
		BTSS 	STATUS,2 		//00EE 	1D03
		LJUMP 	F4H 			//00EF 	38F4
		LDWI 	2H 			//00F0 	2A02
		STR 	24H 			//00F1 	01A4
		LDWI 	AH 			//00F2 	2A0A
		LCALL 	65EH 			//00F3 	365E
		ORG		00F4H

		//;smartkey.C: 345: tmp8= READ_EEPROM(0x40);
		LDWI 	40H 			//00F4 	2A40
		LCALL 	6DCH 			//00F5 	36DC
		STR 	44H 			//00F6 	01C4

		//;smartkey.C: 346: if(tmp8==6 && mpuOk ==1)
		XORWI 	6H 			//00F7 	2606
		BTSS 	STATUS,2 		//00F8 	1D03
		LJUMP 	1A7H 			//00F9 	39A7
		DECRSZ 	3CH,0 		//00FA 	0E3C
		LJUMP 	1A7H 			//00FB 	39A7
		ORG		00FCH
		LDWI 	3H 			//00FC 	2A03

		//;smartkey.C: 347: {
		//;smartkey.C: 348: tmp8=0; beep(10,3);
		CLRR 	44H 			//00FD 	0144
		STR 	24H 			//00FE 	01A4
		LDWI 	AH 			//00FF 	2A0A
		LCALL 	65EH 			//0100 	365E

		//;smartkey.C: 349: while((RA2 )&&(tmp8<11))
		LJUMP 	13DH 			//0101 	393D

		//;smartkey.C: 350: {
		//;smartkey.C: 351: if(AccRead(0x3b,(unsigned char)buf,6)==0){
		LDWI 	35H 			//0102 	2A35
		STR 	2CH 			//0103 	01AC
		ORG		0104H
		CLRR 	2DH 			//0104 	012D
		STR 	24H 			//0105 	01A4
		LDR 	2DH,0 			//0106 	082D
		STR 	25H 			//0107 	01A5
		LDWI 	6H 			//0108 	2A06
		STR 	26H 			//0109 	01A6
		LDWI 	3BH 			//010A 	2A3B
		LCALL 	58EH 			//010B 	358E
		ORG		010CH
		IORWI 	0H 			//010C 	2500
		BTSS 	STATUS,2 		//010D 	1D03
		LJUMP 	12FH 			//010E 	392F

		//;smartkey.C: 353: acXsum += buf[0];
		BCR 	STATUS,5 		//010F 	1283
		LDR 	35H,0 			//0110 	0835
		STR 	2CH 			//0111 	01AC
		CLRR 	2DH 			//0112 	012D
		BTSC 	2CH,7 			//0113 	17AC
		ORG		0114H
		DECR 	2DH,1 			//0114 	0DAD
		ADDWR 	3FH,1 			//0115 	0BBF
		BTSC 	STATUS,0 		//0116 	1403
		INCR	40H,1 			//0117 	09C0
		LDR 	2DH,0 			//0118 	082D
		ADDWR 	40H,1 			//0119 	0BC0

		//;smartkey.C: 354: acYsum += buf[2];
		LDR 	37H,0 			//011A 	0837
		STR 	2CH 			//011B 	01AC
		ORG		011CH
		CLRR 	2DH 			//011C 	012D
		BTSC 	2CH,7 			//011D 	17AC
		DECR 	2DH,1 			//011E 	0DAD
		ADDWR 	3DH,1 			//011F 	0BBD
		BTSC 	STATUS,0 		//0120 	1403
		INCR	3EH,1 			//0121 	09BE
		LDR 	2DH,0 			//0122 	082D
		ADDWR 	3EH,1 			//0123 	0BBE
		ORG		0124H

		//;smartkey.C: 355: tmp16 = (signed int)tmp16 + buf[4];
		LDR 	39H,0 			//0124 	0839
		STR 	2CH 			//0125 	01AC
		CLRR 	2DH 			//0126 	012D
		BTSC 	2CH,7 			//0127 	17AC
		DECR 	2DH,1 			//0128 	0DAD
		ADDWR 	42H,1 			//0129 	0BC2
		BTSC 	STATUS,0 		//012A 	1403
		INCR	43H,1 			//012B 	09C3
		ORG		012CH
		LDR 	2DH,0 			//012C 	082D
		ADDWR 	43H,1 			//012D 	0BC3

		//;smartkey.C: 356: tmp8++;
		INCR	44H,1 			//012E 	09C4

		//;smartkey.C: 357: }
		//;smartkey.C: 358: _delay((unsigned long)((500)*(4000000/4000.0)));
		LDWI 	3H 			//012F 	2A03
		BCR 	STATUS,5 		//0130 	1283
		STR 	2EH 			//0131 	01AE
		LDWI 	8AH 			//0132 	2A8A
		STR 	2DH 			//0133 	01AD
		ORG		0134H
		LDWI 	56H 			//0134 	2A56
		STR 	2CH 			//0135 	01AC
		DECRSZ 	2CH,1 		//0136 	0EAC
		LJUMP 	136H 			//0137 	3936
		DECRSZ 	2DH,1 		//0138 	0EAD
		LJUMP 	136H 			//0139 	3936
		DECRSZ 	2EH,1 		//013A 	0EAE
		LJUMP 	136H 			//013B 	3936
		ORG		013CH
		LJUMP 	13DH 			//013C 	393D
		BCR 	STATUS,5 		//013D 	1283
		BTSS 	5H,2 			//013E 	1D05
		LJUMP 	144H 			//013F 	3944
		LDWI 	BH 			//0140 	2A0B
		SUBWR 	44H,0 			//0141 	0C44
		BTSS 	STATUS,0 		//0142 	1C03
		LJUMP 	102H 			//0143 	3902
		ORG		0144H

		//;smartkey.C: 360: }
		//;smartkey.C: 362: if(tmp8==11){
		LDR 	44H,0 			//0144 	0844
		XORWI 	BH 			//0145 	260B
		BTSS 	STATUS,2 		//0146 	1D03
		LJUMP 	19FH 			//0147 	399F

		//;smartkey.C: 363: acXsum =acXsum/10;
		LDWI 	AH 			//0148 	2A0A
		STR 	20H 			//0149 	01A0
		CLRR 	21H 			//014A 	0121
		LDR 	40H,0 			//014B 	0840
		ORG		014CH
		STR 	23H 			//014C 	01A3
		LDR 	3FH,0 			//014D 	083F
		STR 	22H 			//014E 	01A2
		LCALL 	488H 			//014F 	3488
		LDR 	21H,0 			//0150 	0821
		STR 	40H 			//0151 	01C0
		LDR 	20H,0 			//0152 	0820
		STR 	3FH 			//0153 	01BF
		ORG		0154H

		//;smartkey.C: 364: acYsum = acYsum/10;
		LDWI 	AH 			//0154 	2A0A
		STR 	20H 			//0155 	01A0
		CLRR 	21H 			//0156 	0121
		LDR 	3EH,0 			//0157 	083E
		STR 	23H 			//0158 	01A3
		LDR 	3DH,0 			//0159 	083D
		STR 	22H 			//015A 	01A2
		LCALL 	488H 			//015B 	3488
		ORG		015CH
		LDR 	21H,0 			//015C 	0821
		STR 	3EH 			//015D 	01BE
		LDR 	20H,0 			//015E 	0820
		STR 	3DH 			//015F 	01BD

		//;smartkey.C: 365: tmp16 = (signed int)tmp16/10;
		LDWI 	AH 			//0160 	2A0A
		STR 	20H 			//0161 	01A0
		CLRR 	21H 			//0162 	0121
		LDR 	43H,0 			//0163 	0843
		ORG		0164H
		STR 	23H 			//0164 	01A3
		LDR 	42H,0 			//0165 	0842
		STR 	22H 			//0166 	01A2
		LCALL 	488H 			//0167 	3488
		LDR 	21H,0 			//0168 	0821
		STR 	43H 			//0169 	01C3
		LDR 	20H,0 			//016A 	0820
		STR 	42H 			//016B 	01C2
		ORG		016CH

		//;smartkey.C: 367: if(((signed int)tmp16 > (-31)) && ((signed int)tmp16 < 31)){
		LDR 	43H,0 			//016C 	0843
		XORWI 	80H 			//016D 	2680
		STR 	7FH 			//016E 	01FF
		LDWI 	7FH 			//016F 	2A7F
		SUBWR 	7FH,0 			//0170 	0C7F
		BTSS 	STATUS,2 		//0171 	1D03
		LJUMP 	175H 			//0172 	3975
		LDWI 	E2H 			//0173 	2AE2
		ORG		0174H
		SUBWR 	42H,0 			//0174 	0C42
		BTSS 	STATUS,0 		//0175 	1C03
		LJUMP 	186H 			//0176 	3986
		BCR 	STATUS,5 		//0177 	1283
		LDR 	43H,0 			//0178 	0843
		XORWI 	80H 			//0179 	2680
		STR 	7FH 			//017A 	01FF
		LDWI 	80H 			//017B 	2A80
		ORG		017CH
		SUBWR 	7FH,0 			//017C 	0C7F
		BTSS 	STATUS,2 		//017D 	1D03
		LJUMP 	181H 			//017E 	3981
		LDWI 	1FH 			//017F 	2A1F
		SUBWR 	42H,0 			//0180 	0C42
		BTSC 	STATUS,0 		//0181 	1403
		LJUMP 	186H 			//0182 	3986

		//;smartkey.C: 368: beep(10,2);
		LDWI 	2H 			//0183 	2A02
		ORG		0184H
		BCR 	STATUS,5 		//0184 	1283
		LJUMP 	1A0H 			//0185 	39A0

		//;smartkey.C: 369: }
		//;smartkey.C: 370: else
		//;smartkey.C: 372: {
		//;smartkey.C: 373: beep(10,3);
		LDWI 	3H 			//0186 	2A03
		BCR 	STATUS,5 		//0187 	1283
		STR 	24H 			//0188 	01A4
		LDWI 	AH 			//0189 	2A0A
		LCALL 	65EH 			//018A 	365E

		//;smartkey.C: 374: WRITE_EEPROM(0x10,(unsigned char)acXsum);
		LDR 	3FH,0 			//018B 	083F
		ORG		018CH
		STR 	20H 			//018C 	01A0
		LDWI 	10H 			//018D 	2A10
		LCALL 	62BH 			//018E 	362B

		//;smartkey.C: 375: WRITE_EEPROM(0x11,(unsigned char)acYsum);
		BCR 	STATUS,5 		//018F 	1283
		LDR 	3DH,0 			//0190 	083D
		STR 	20H 			//0191 	01A0
		LDWI 	11H 			//0192 	2A11
		LCALL 	62BH 			//0193 	362B
		ORG		0194H

		//;smartkey.C: 376: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//0194 	2A82
		BCR 	STATUS,5 		//0195 	1283
		STR 	2DH 			//0196 	01AD
		LDWI 	DDH 			//0197 	2ADD
		STR 	2CH 			//0198 	01AC
		DECRSZ 	2CH,1 		//0199 	0EAC
		LJUMP 	199H 			//019A 	3999
		DECRSZ 	2DH,1 		//019B 	0EAD
		ORG		019CH
		LJUMP 	199H 			//019C 	3999
		LJUMP 	19EH 			//019D 	399E
		LJUMP 	1A3H 			//019E 	39A3

		//;smartkey.C: 380: beep(10,2);
		LDWI 	2H 			//019F 	2A02
		STR 	24H 			//01A0 	01A4
		LDWI 	AH 			//01A1 	2A0A
		LCALL 	65EH 			//01A2 	365E
		LDWI 	40H 			//01A3 	2A40
		ORG		01A4H

		//;smartkey.C: 381: }
		//;smartkey.C: 382: WRITE_EEPROM(0x40,0);
		BCR 	STATUS,5 		//01A4 	1283
		CLRR 	20H 			//01A5 	0120
		LCALL 	62BH 			//01A6 	362B

		//;smartkey.C: 384: }
		//;smartkey.C: 386: acXsum = (signed char)READ_EEPROM(0x10);
		LDWI 	10H 			//01A7 	2A10
		LCALL 	6DCH 			//01A8 	36DC
		STR 	3FH 			//01A9 	01BF
		CLRR 	40H 			//01AA 	0140
		BTSC 	3FH,7 			//01AB 	17BF
		ORG		01ACH
		DECR 	40H,1 			//01AC 	0DC0

		//;smartkey.C: 387: acYsum = (signed char)READ_EEPROM(0x11);
		LDWI 	11H 			//01AD 	2A11
		LCALL 	6DCH 			//01AE 	36DC
		STR 	3DH 			//01AF 	01BD
		CLRR 	3EH 			//01B0 	013E
		BTSC 	3DH,7 			//01B1 	17BD
		DECR 	3EH,1 			//01B2 	0DBE

		//;smartkey.C: 389: timeTick = 0;
		CLRR 	70H 			//01B3 	0170
		ORG		01B4H
		CLRR 	71H 			//01B4 	0171

		//;smartkey.C: 398: if(mode_chek == 0)
		LDR 	73H,1 			//01B5 	08F3
		BTSC 	STATUS,2 		//01B6 	1503

		//;smartkey.C: 399: {
		//;smartkey.C: 401: if(RegStatus & 0x80)
		BTSS 	49H,7 			//01B7 	1FC9
		LJUMP 	286H 			//01B8 	3A86

		//;smartkey.C: 402: {
		//;smartkey.C: 403: PAIE = 0;
		BCR 	INTCON,3 		//01B9 	118B

		//;smartkey.C: 406: RegStatus &= (~0x80);
		BCR 	49H,7 			//01BA 	13C9

		//;smartkey.C: 418: {
		//;smartkey.C: 420: if ((RegStatus & 0x40) !=0){
		BTSC 	49H,6 			//01BB 	1749
		ORG		01BCH
		LJUMP 	238H 			//01BC 	3A38
		LJUMP 	27DH 			//01BD 	3A7D

		//;smartkey.C: 426: lostDetect =0;
		CLRR 	4BH 			//01BE 	014B
		LDWI 	28H 			//01BF 	2A28

		//;smartkey.C: 427: timeTick =0;
		CLRR 	70H 			//01C0 	0170
		CLRR 	71H 			//01C1 	0171

		//;smartkey.C: 428: tmp16 = 40;
		STR 	42H 			//01C2 	01C2
		CLRR 	43H 			//01C3 	0143
		ORG		01C4H

		//;smartkey.C: 429: break;
		LJUMP 	285H 			//01C4 	3A85

		//;smartkey.C: 432: if(timeTick >30){
		LDWI 	0H 			//01C5 	2A00
		SUBWR 	71H,0 			//01C6 	0C71
		LDWI 	1FH 			//01C7 	2A1F
		BTSC 	STATUS,2 		//01C8 	1503
		SUBWR 	70H,0 			//01C9 	0C70
		BTSS 	STATUS,0 		//01CA 	1C03
		LJUMP 	285H 			//01CB 	3A85
		ORG		01CCH
		LDWI 	8H 			//01CC 	2A08

		//;smartkey.C: 433: timeTick =0;
		CLRR 	70H 			//01CD 	0170
		CLRR 	71H 			//01CE 	0171

		//;smartkey.C: 435: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LCALL 	6DCH 			//01CF 	36DC
		XORWI 	CCH 			//01D0 	26CC
		BTSS 	STATUS,2 		//01D1 	1D03
		LJUMP 	1D6H 			//01D2 	39D6
		LDWI 	8H 			//01D3 	2A08
		ORG		01D4H
		CLRR 	20H 			//01D4 	0120
		LCALL 	62BH 			//01D5 	362B

		//;smartkey.C: 437: if((mtOldState == 3)){
		BCR 	STATUS,5 		//01D6 	1283
		LDR 	4CH,0 			//01D7 	084C
		XORWI 	3H 			//01D8 	2603
		BTSS 	STATUS,2 		//01D9 	1D03
		LJUMP 	1E7H 			//01DA 	39E7

		//;smartkey.C: 438: beepOn();TMR2ON = 0; beep(10,1);
		LCALL 	70AH 			//01DB 	370A
		ORG		01DCH
		LDWI 	AH 			//01DC 	2A0A
		BCR 	STATUS,5 		//01DD 	1283
		BCR 	12H,2 			//01DE 	1112
		CLRR 	24H 			//01DF 	0124
		INCR	24H,1 			//01E0 	09A4
		LCALL 	65EH 			//01E1 	365E

		//;smartkey.C: 439: if(reAlertOn)reAlertOn =0;
		LDR 	3BH,0 			//01E2 	083B
		BTSC 	STATUS,2 		//01E3 	1503
		ORG		01E4H
		LJUMP 	285H 			//01E4 	3A85
		CLRR 	3BH 			//01E5 	013B
		LJUMP 	285H 			//01E6 	3A85

		//;smartkey.C: 441: else if((mtOldState == 0)||(mtOldState == 4)){
		LDR 	4CH,0 			//01E7 	084C
		BTSC 	STATUS,2 		//01E8 	1503
		LJUMP 	1EEH 			//01E9 	39EE
		LDR 	4CH,0 			//01EA 	084C
		XORWI 	4H 			//01EB 	2604
		ORG		01ECH
		BTSS 	STATUS,2 		//01EC 	1D03
		LJUMP 	20BH 			//01ED 	3A0B
		LDWI 	ACH 			//01EE 	2AAC

		//;smartkey.C: 442: RegStatus |=(0x20);
		BSR 	49H,5 			//01EF 	1AC9

		//;smartkey.C: 443: setState(1,3500);
		STR 	20H 			//01F0 	01A0
		LDWI 	DH 			//01F1 	2A0D
		STR 	21H 			//01F2 	01A1
		LDWI 	1H 			//01F3 	2A01
		ORG		01F4H
		LCALL 	6E9H 			//01F4 	36E9

		//;smartkey.C: 444: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
		LDWI 	40H 			//01F5 	2A40
		LCALL 	6DCH 			//01F6 	36DC
		XORWI 	0H 			//01F7 	2600
		BTSC 	STATUS,2 		//01F8 	1503
		LJUMP 	1FDH 			//01F9 	39FD
		LDWI 	40H 			//01FA 	2A40
		CLRR 	20H 			//01FB 	0120
		ORG		01FCH
		LCALL 	62BH 			//01FC 	362B

		//;smartkey.C: 445: tmp16 = timeTick+40;
		LDR 	71H,0 			//01FD 	0871
		BCR 	STATUS,5 		//01FE 	1283
		STR 	43H 			//01FF 	01C3
		LDR 	70H,0 			//0200 	0870
		STR 	42H 			//0201 	01C2
		LDWI 	28H 			//0202 	2A28
		ADDWR 	42H,1 			//0203 	0BC2
		ORG		0204H
		BTSC 	STATUS,0 		//0204 	1403
		INCR	43H,1 			//0205 	09C3
		LDWI 	AH 			//0206 	2A0A

		//;smartkey.C: 446: beep(10,1);
		CLRR 	24H 			//0207 	0124
		INCR	24H,1 			//0208 	09A4
		LCALL 	65EH 			//0209 	365E

		//;smartkey.C: 447: }
		LJUMP 	285H 			//020A 	3A85

		//;smartkey.C: 448: else if((mtOldState == 1)){
		DECRSZ 	4CH,0 		//020B 	0E4C
		ORG		020CH
		LJUMP 	285H 			//020C 	3A85
		LJUMP 	1E2H 			//020D 	39E2

		//;smartkey.C: 451: }
		//;smartkey.C: 452: }
		//;smartkey.C: 453: break;
		//;smartkey.C: 450: if(reAlertOn)reAlertOn =0;
		//;smartkey.C: 456: if(timeTick > 200)
		LDWI 	0H 			//020E 	2A00
		SUBWR 	71H,0 			//020F 	0C71
		LDWI 	C9H 			//0210 	2AC9
		BTSC 	STATUS,2 		//0211 	1503
		SUBWR 	70H,0 			//0212 	0C70
		BTSS 	STATUS,0 		//0213 	1C03
		ORG		0214H
		LJUMP 	285H 			//0214 	3A85

		//;smartkey.C: 457: {
		//;smartkey.C: 458: beepOff();
		LCALL 	70FH 			//0215 	370F

		//;smartkey.C: 459: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LDWI 	8H 			//0216 	2A08
		LCALL 	6DCH 			//0217 	36DC
		XORWI 	CCH 			//0218 	26CC
		BTSS 	STATUS,2 		//0219 	1D03
		LJUMP 	21EH 			//021A 	3A1E
		LDWI 	8H 			//021B 	2A08
		ORG		021CH
		CLRR 	20H 			//021C 	0120
		LCALL 	62BH 			//021D 	362B
		LDWI 	ACH 			//021E 	2AAC

		//;smartkey.C: 460: RegStatus |=(0x20);
		BCR 	STATUS,5 		//021F 	1283
		BSR 	49H,5 			//0220 	1AC9

		//;smartkey.C: 461: setState(1,3500);
		STR 	20H 			//0221 	01A0
		LDWI 	DH 			//0222 	2A0D
		STR 	21H 			//0223 	01A1
		ORG		0224H
		LDWI 	1H 			//0224 	2A01
		LCALL 	6E9H 			//0225 	36E9

		//;smartkey.C: 463: tmp16 = timeTick+40;
		LDR 	71H,0 			//0226 	0871
		STR 	43H 			//0227 	01C3
		LDR 	70H,0 			//0228 	0870
		STR 	42H 			//0229 	01C2
		LDWI 	28H 			//022A 	2A28
		ADDWR 	42H,1 			//022B 	0BC2
		ORG		022CH
		BTSC 	STATUS,0 		//022C 	1403
		INCR	43H,1 			//022D 	09C3
		LJUMP 	285H 			//022E 	3A85

		//;smartkey.C: 469: beepOff();
		LCALL 	70FH 			//022F 	370F

		//;smartkey.C: 470: setState(2,300);
		LDWI 	2CH 			//0230 	2A2C
		BCR 	STATUS,5 		//0231 	1283
		STR 	20H 			//0232 	01A0
		LDWI 	1H 			//0233 	2A01
		ORG		0234H
		STR 	21H 			//0234 	01A1
		LDWI 	2H 			//0235 	2A02
		LCALL 	6E9H 			//0236 	36E9

		//;smartkey.C: 471: break;
		LJUMP 	285H 			//0237 	3A85
		LDR 	74H,0 			//0238 	0874
		STR 	FSR 			//0239 	0184
		LDWI 	5H 			//023A 	2A05
		SUBWR 	FSR,0 			//023B 	0C04
		ORG		023CH
		BTSC 	STATUS,0 		//023C 	1403
		LJUMP 	285H 			//023D 	3A85
		LDWI 	7H 			//023E 	2A07
		STR 	PCLATH 			//023F 	018A
		LDWI 	5H 			//0240 	2A05
		ADDWR 	FSR,0 			//0241 	0B04
		STR 	PCL 			//0242 	0182

		//;smartkey.C: 488: {
		//;smartkey.C: 490: if(lostDetect==1 && timeTick< 1500)
		DECRSZ 	4BH,0 		//0243 	0E4B
		ORG		0244H
		LJUMP 	26AH 			//0244 	3A6A
		LDWI 	5H 			//0245 	2A05
		SUBWR 	71H,0 			//0246 	0C71
		LDWI 	DCH 			//0247 	2ADC
		BTSC 	STATUS,2 		//0248 	1503
		SUBWR 	70H,0 			//0249 	0C70
		BTSC 	STATUS,0 		//024A 	1403
		LJUMP 	26AH 			//024B 	3A6A
		ORG		024CH

		//;smartkey.C: 491: {
		//;smartkey.C: 492: if(READ_EEPROM(0x08)==0x00) WRITE_EEPROM(0x08,0xcc);
		LDWI 	8H 			//024C 	2A08
		LCALL 	6DCH 			//024D 	36DC
		IORWI 	0H 			//024E 	2500
		BTSS 	STATUS,2 		//024F 	1D03
		LJUMP 	255H 			//0250 	3A55
		LDWI 	CCH 			//0251 	2ACC
		STR 	20H 			//0252 	01A0
		LDWI 	8H 			//0253 	2A08
		ORG		0254H
		LCALL 	62BH 			//0254 	362B

		//;smartkey.C: 494: setState(3,1800);
		LDWI 	8H 			//0255 	2A08
		BCR 	STATUS,5 		//0256 	1283
		STR 	20H 			//0257 	01A0
		LDWI 	7H 			//0258 	2A07
		STR 	21H 			//0259 	01A1
		LDWI 	3H 			//025A 	2A03
		LCALL 	6E9H 			//025B 	36E9
		ORG		025CH

		//;smartkey.C: 495: cntTmp = timeTick+40;
		LDR 	71H,0 			//025C 	0871
		STR 	46H 			//025D 	01C6
		LDR 	70H,0 			//025E 	0870
		STR 	45H 			//025F 	01C5
		LDWI 	28H 			//0260 	2A28
		ADDWR 	45H,1 			//0261 	0BC5
		BTSC 	STATUS,0 		//0262 	1403
		INCR	46H,1 			//0263 	09C6
		ORG		0264H

		//;smartkey.C: 496: PR2L =20;
		LDWI 	14H 			//0264 	2A14
		BSR 	STATUS,5 		//0265 	1A83
		STR 	11H 			//0266 	0191

		//;smartkey.C: 497: beepOn();
		LCALL 	70AH 			//0267 	370A

		//;smartkey.C: 498: lostDetect =0;
		BCR 	STATUS,5 		//0268 	1283
		LJUMP 	1BEH 			//0269 	39BE

		//;smartkey.C: 499: }
		//;smartkey.C: 500: else {
		//;smartkey.C: 501: lostDetect =1;
		CLRR 	4BH 			//026A 	014B
		INCR	4BH,1 			//026B 	09CB
		ORG		026CH
		LJUMP 	1BFH 			//026C 	39BF

		//;smartkey.C: 504: }
		//;smartkey.C: 505: timeTick =0;
		//;smartkey.C: 511: {
		//;smartkey.C: 512: timeTick =0;
		CLRR 	70H 			//026D 	0170
		CLRR 	71H 			//026E 	0171

		//;smartkey.C: 513: beepOn();TMR2ON = 0;
		LCALL 	70AH 			//026F 	370A
		LDWI 	2H 			//0270 	2A02
		BCR 	STATUS,5 		//0271 	1283
		BCR 	12H,2 			//0272 	1112

		//;smartkey.C: 514: beep(10,2);
		STR 	24H 			//0273 	01A4
		ORG		0274H
		LDWI 	AH 			//0274 	2A0A
		LCALL 	65EH 			//0275 	365E

		//;smartkey.C: 515: if(mtOldState == 3){reAlertOn =1;}
		LDR 	4CH,0 			//0276 	084C
		XORWI 	3H 			//0277 	2603
		BTSS 	STATUS,2 		//0278 	1D03
		LJUMP 	285H 			//0279 	3A85
		CLRR 	3BH 			//027A 	013B
		INCR	3BH,1 			//027B 	09BB
		ORG		027CH
		LJUMP 	285H 			//027C 	3A85
		LDR 	74H,0 			//027D 	0874
		XORWI 	1H 			//027E 	2601
		BTSC 	STATUS,2 		//027F 	1503
		LJUMP 	243H 			//0280 	3A43
		XORWI 	3H 			//0281 	2603
		BTSC 	STATUS,2 		//0282 	1503
		LJUMP 	26DH 			//0283 	3A6D
		ORG		0284H
		LJUMP 	285H 			//0284 	3A85

		//;smartkey.C: 519: }
		//;smartkey.C: 521: }
		//;smartkey.C: 523: PAIE = 1;
		BSR 	INTCON,3 		//0285 	198B

		//;smartkey.C: 524: }
		//;smartkey.C: 526: }
		//;smartkey.C: 530: {
		//;smartkey.C: 531: if((timeOut!=0)&&( timeTick >timeOut)){
		LDR 	48H,0 			//0286 	0848
		IORWR 	47H,0 			//0287 	0347
		BTSC 	STATUS,2 		//0288 	1503
		LJUMP 	2FCH 			//0289 	3AFC
		LDR 	71H,0 			//028A 	0871
		SUBWR 	48H,0 			//028B 	0C48
		ORG		028CH
		BTSS 	STATUS,2 		//028C 	1D03
		LJUMP 	290H 			//028D 	3A90
		LDR 	70H,0 			//028E 	0870
		SUBWR 	47H,0 			//028F 	0C47
		BTSS 	STATUS,0 		//0290 	1C03
		LJUMP 	2EEH 			//0291 	3AEE
		LJUMP 	2FCH 			//0292 	3AFC

		//;smartkey.C: 542: beepOff();
		LCALL 	70FH 			//0293 	370F
		ORG		0294H
		LDWI 	2CH 			//0294 	2A2C

		//;smartkey.C: 543: RegStatus &=(~0x20);
		BCR 	STATUS,5 		//0295 	1283
		BCR 	49H,5 			//0296 	12C9

		//;smartkey.C: 544: setState(2,300);
		STR 	20H 			//0297 	01A0
		LDWI 	1H 			//0298 	2A01
		STR 	21H 			//0299 	01A1
		LDWI 	2H 			//029A 	2A02
		LCALL 	6E9H 			//029B 	36E9
		ORG		029CH

		//;smartkey.C: 545: break;
		LJUMP 	2FCH 			//029C 	3AFC

		//;smartkey.C: 547: beepOff();
		LCALL 	70FH 			//029D 	370F

		//;smartkey.C: 548: delay_x10ms(20);
		LDWI 	14H 			//029E 	2A14
		BCR 	STATUS,5 		//029F 	1283
		STR 	20H 			//02A0 	01A0
		CLRR 	21H 			//02A1 	0121
		LCALL 	69DH 			//02A2 	369D

		//;smartkey.C: 549: beepOn();TMR2ON = 0;reAlertOn =0;
		LCALL 	70AH 			//02A3 	370A
		ORG		02A4H
		LDWI 	1EH 			//02A4 	2A1E
		BCR 	STATUS,5 		//02A5 	1283
		BCR 	12H,2 			//02A6 	1112
		CLRR 	3BH 			//02A7 	013B
		CLRR 	24H 			//02A8 	0124
		INCR	24H,1 			//02A9 	09A4
		LCALL 	65EH 			//02AA 	365E
		LDWI 	0H 			//02AB 	2A00
		ORG		02ACH

		//;smartkey.C: 551: setState(0,0);
		CLRR 	20H 			//02AC 	0120
		CLRR 	21H 			//02AD 	0121
		LCALL 	6E9H 			//02AE 	36E9

		//;smartkey.C: 553: tmp16 = timeTick+40;
		LDR 	71H,0 			//02AF 	0871
		STR 	43H 			//02B0 	01C3
		LDR 	70H,0 			//02B1 	0870
		STR 	42H 			//02B2 	01C2
		LDWI 	28H 			//02B3 	2A28
		ORG		02B4H
		ADDWR 	42H,1 			//02B4 	0BC2
		BTSC 	STATUS,0 		//02B5 	1403
		INCR	43H,1 			//02B6 	09C3

		//;smartkey.C: 554: break;
		LJUMP 	2FCH 			//02B7 	3AFC

		//;smartkey.C: 557: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LDWI 	8H 			//02B8 	2A08
		LCALL 	6DCH 			//02B9 	36DC
		XORWI 	CCH 			//02BA 	26CC
		BTSS 	STATUS,2 		//02BB 	1D03
		ORG		02BCH
		LJUMP 	2C0H 			//02BC 	3AC0
		LDWI 	8H 			//02BD 	2A08
		CLRR 	20H 			//02BE 	0120
		LCALL 	62BH 			//02BF 	362B

		//;smartkey.C: 559: if(reAlertOn){
		BCR 	STATUS,5 		//02C0 	1283
		LDR 	3BH,0 			//02C1 	083B
		BTSC 	STATUS,2 		//02C2 	1503
		LJUMP 	2D7H 			//02C3 	3AD7
		ORG		02C4H

		//;smartkey.C: 560: setState(4,6000);
		LDWI 	70H 			//02C4 	2A70
		STR 	20H 			//02C5 	01A0
		LDWI 	17H 			//02C6 	2A17
		STR 	21H 			//02C7 	01A1
		LDWI 	4H 			//02C8 	2A04
		LCALL 	6E9H 			//02C9 	36E9

		//;smartkey.C: 561: cntTmp = timeTick+40;
		LDR 	71H,0 			//02CA 	0871
		STR 	46H 			//02CB 	01C6
		ORG		02CCH
		LDR 	70H,0 			//02CC 	0870
		STR 	45H 			//02CD 	01C5
		LDWI 	28H 			//02CE 	2A28
		ADDWR 	45H,1 			//02CF 	0BC5
		BTSC 	STATUS,0 		//02D0 	1403
		INCR	46H,1 			//02D1 	09C6

		//;smartkey.C: 562: PR2L =20;
		LDWI 	14H 			//02D2 	2A14
		BSR 	STATUS,5 		//02D3 	1A83
		ORG		02D4H
		STR 	11H 			//02D4 	0191

		//;smartkey.C: 563: beepOn();
		LCALL 	70AH 			//02D5 	370A

		//;smartkey.C: 565: }else if(mtOldState == 0){
		LJUMP 	2FCH 			//02D6 	3AFC
		LDR 	4CH,1 			//02D7 	08CC
		BTSS 	STATUS,2 		//02D8 	1D03
		LJUMP 	2A3H 			//02D9 	3AA3

		//;smartkey.C: 567: beep(10,5);
		LDWI 	5H 			//02DA 	2A05
		STR 	24H 			//02DB 	01A4
		ORG		02DCH
		LDWI 	AH 			//02DC 	2A0A
		LCALL 	65EH 			//02DD 	365E
		LDWI 	40H 			//02DE 	2A40

		//;smartkey.C: 568: RegStatus |=(0x20);
		BSR 	49H,5 			//02DF 	1AC9

		//;smartkey.C: 571: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
		LCALL 	6DCH 			//02E0 	36DC
		XORWI 	0H 			//02E1 	2600
		BTSC 	STATUS,2 		//02E2 	1503
		LJUMP 	2E7H 			//02E3 	3AE7
		ORG		02E4H
		LDWI 	40H 			//02E4 	2A40
		CLRR 	20H 			//02E5 	0120
		LCALL 	62BH 			//02E6 	362B

		//;smartkey.C: 573: setState(1,3500);
		LDWI 	ACH 			//02E7 	2AAC
		BCR 	STATUS,5 		//02E8 	1283
		STR 	20H 			//02E9 	01A0
		LDWI 	DH 			//02EA 	2A0D
		STR 	21H 			//02EB 	01A1
		ORG		02ECH
		LDWI 	1H 			//02EC 	2A01
		LJUMP 	2AEH 			//02ED 	3AAE

		//;smartkey.C: 580: setState(0,0);
		//;smartkey.C: 579: beep(30,1);
		//;smartkey.C: 578: reAlertOn =0;
		//;smartkey.C: 577: beepOn();TMR2ON = 0;
		LDR 	74H,0 			//02EE 	0874
		XORWI 	1H 			//02EF 	2601
		BTSC 	STATUS,2 		//02F0 	1503
		LJUMP 	2FCH 			//02F1 	3AFC
		XORWI 	3H 			//02F2 	2603
		BTSC 	STATUS,2 		//02F3 	1503
		ORG		02F4H
		LJUMP 	2B8H 			//02F4 	3AB8
		XORWI 	1H 			//02F5 	2601
		BTSC 	STATUS,2 		//02F6 	1503
		LJUMP 	293H 			//02F7 	3A93
		XORWI 	7H 			//02F8 	2607
		BTSC 	STATUS,2 		//02F9 	1503
		LJUMP 	29DH 			//02FA 	3A9D
		LJUMP 	2FCH 			//02FB 	3AFC
		ORG		02FCH

		//;smartkey.C: 586: }
		//;smartkey.C: 588: }
		//;smartkey.C: 590: if((timeTick>tmp16) && (mtState == 1) && mpuOk ==1){
		LDR 	71H,0 			//02FC 	0871
		BCR 	STATUS,5 		//02FD 	1283
		SUBWR 	43H,0 			//02FE 	0C43
		BTSS 	STATUS,2 		//02FF 	1D03
		LJUMP 	303H 			//0300 	3B03
		LDR 	70H,0 			//0301 	0870
		SUBWR 	42H,0 			//0302 	0C42
		BTSC 	STATUS,0 		//0303 	1403
		ORG		0304H
		LJUMP 	396H 			//0304 	3B96
		DECRSZ 	74H,0 		//0305 	0E74
		LJUMP 	396H 			//0306 	3B96
		DECRSZ 	3CH,0 		//0307 	0E3C
		LJUMP 	396H 			//0308 	3B96

		//;smartkey.C: 591: tmp16 = timeTick+40;
		LDR 	71H,0 			//0309 	0871
		STR 	43H 			//030A 	01C3
		LDR 	70H,0 			//030B 	0870
		ORG		030CH
		STR 	42H 			//030C 	01C2
		LDWI 	28H 			//030D 	2A28
		ADDWR 	42H,1 			//030E 	0BC2
		BTSC 	STATUS,0 		//030F 	1403
		INCR	43H,1 			//0310 	09C3

		//;smartkey.C: 592: if(AccRead(0x3b,buf,6)==0){
		LDWI 	35H 			//0311 	2A35
		STR 	24H 			//0312 	01A4
		LDWI 	0H 			//0313 	2A00
		ORG		0314H
		STR 	25H 			//0314 	01A5
		LDWI 	6H 			//0315 	2A06
		STR 	26H 			//0316 	01A6
		LDWI 	3BH 			//0317 	2A3B
		LCALL 	58EH 			//0318 	358E
		IORWI 	0H 			//0319 	2500
		BTSS 	STATUS,2 		//031A 	1D03
		LJUMP 	396H 			//031B 	3B96
		ORG		031CH

		//;smartkey.C: 594: if(compe(buf[0], (signed char)acXsum,5) && compe(buf[2], (signed char)
		//+                          acYsum,5)){
		BCR 	STATUS,5 		//031C 	1283
		LDR 	3FH,0 			//031D 	083F
		STR 	20H 			//031E 	01A0
		LDWI 	5H 			//031F 	2A05
		STR 	21H 			//0320 	01A1
		LDR 	35H,0 			//0321 	0835
		LCALL 	4CDH 			//0322 	34CD
		XORWI 	0H 			//0323 	2600
		ORG		0324H
		BCR 	STATUS,5 		//0324 	1283
		BTSC 	STATUS,2 		//0325 	1503
		LJUMP 	347H 			//0326 	3B47
		LDR 	3DH,0 			//0327 	083D
		STR 	20H 			//0328 	01A0
		LDWI 	5H 			//0329 	2A05
		STR 	21H 			//032A 	01A1
		LDR 	37H,0 			//032B 	0837
		ORG		032CH
		LCALL 	4CDH 			//032C 	34CD
		XORWI 	0H 			//032D 	2600

		//;smartkey.C: 597: isSw++;
		BCR 	STATUS,5 		//032E 	1283
		BTSC 	STATUS,2 		//032F 	1503
		LJUMP 	347H 			//0330 	3B47
		LDWI 	2DH 			//0331 	2A2D
		INCR	41H,1 			//0332 	09C1

		//;smartkey.C: 598: if(isSw >44){
		SUBWR 	41H,0 			//0333 	0C41
		ORG		0334H
		BTSS 	STATUS,0 		//0334 	1C03
		LJUMP 	33AH 			//0335 	3B3A
		LDWI 	2H 			//0336 	2A02

		//;smartkey.C: 599: isSw =0;
		CLRR 	41H 			//0337 	0141

		//;smartkey.C: 600: vibrateOn=2;
		STR 	34H 			//0338 	01B4
		LJUMP 	36DH 			//0339 	3B6D

		//;smartkey.C: 606: }
		//;smartkey.C: 604: setState(2,300);
		//;smartkey.C: 603: RegStatus &=(~0x20);
		//;smartkey.C: 607: else if(isSw > 25){
		LDWI 	1AH 			//033A 	2A1A
		SUBWR 	41H,0 			//033B 	0C41
		ORG		033CH
		BTSC 	STATUS,0 		//033C 	1403

		//;smartkey.C: 608: if(isSw%2==0){
		BTSC 	41H,0 			//033D 	1441
		LJUMP 	374H 			//033E 	3B74

		//;smartkey.C: 609: beepOn();TMR2ON = 0; beep(7,1);
		LCALL 	70AH 			//033F 	370A
		LDWI 	7H 			//0340 	2A07
		BCR 	STATUS,5 		//0341 	1283
		BCR 	12H,2 			//0342 	1112
		CLRR 	24H 			//0343 	0124
		ORG		0344H
		INCR	24H,1 			//0344 	09A4
		LCALL 	65EH 			//0345 	365E
		LJUMP 	374H 			//0346 	3B74

		//;smartkey.C: 614: else{
		//;smartkey.C: 615: isSw =0;
		//;smartkey.C: 610: }
		//;smartkey.C: 611: }
		//;smartkey.C: 613: }
		CLRR 	41H 			//0347 	0141

		//;smartkey.C: 618: if(compe(buf[0], acXOld,2) && compe(buf[2], acYOld,2)){
		LDR 	33H,0 			//0348 	0833
		STR 	20H 			//0349 	01A0
		LDWI 	2H 			//034A 	2A02
		STR 	21H 			//034B 	01A1
		ORG		034CH
		LDR 	35H,0 			//034C 	0835
		LCALL 	4CDH 			//034D 	34CD
		XORWI 	0H 			//034E 	2600
		BCR 	STATUS,5 		//034F 	1283
		BTSC 	STATUS,2 		//0350 	1503
		LJUMP 	375H 			//0351 	3B75
		LDR 	32H,0 			//0352 	0832
		STR 	20H 			//0353 	01A0
		ORG		0354H
		LDWI 	2H 			//0354 	2A02
		STR 	21H 			//0355 	01A1
		LDR 	37H,0 			//0356 	0837
		LCALL 	4CDH 			//0357 	34CD
		XORWI 	0H 			//0358 	2600

		//;smartkey.C: 619: isWait++;
		BCR 	STATUS,5 		//0359 	1283
		BTSC 	STATUS,2 		//035A 	1503
		LJUMP 	375H 			//035B 	3B75
		ORG		035CH
		INCR	2FH,1 			//035C 	09AF
		BTSC 	STATUS,2 		//035D 	1503
		INCR	30H,1 			//035E 	09B0

		//;smartkey.C: 620: if(isWait==450){
		DECR 	30H,0 			//035F 	0D30
		LDWI 	C2H 			//0360 	2AC2
		BTSC 	STATUS,2 		//0361 	1503
		XORWR 	2FH,0 			//0362 	042F
		BTSS 	STATUS,2 		//0363 	1D03
		ORG		0364H
		LJUMP 	374H 			//0364 	3B74
		LDWI 	2H 			//0365 	2A02

		//;smartkey.C: 621: isWait = 0;
		CLRR 	2FH 			//0366 	012F
		CLRR 	30H 			//0367 	0130

		//;smartkey.C: 622: beep(7,2);
		STR 	24H 			//0368 	01A4
		LDWI 	7H 			//0369 	2A07
		LCALL 	65EH 			//036A 	365E

		//;smartkey.C: 623: vibrateOn=1;
		CLRR 	34H 			//036B 	0134
		ORG		036CH
		INCR	34H,1 			//036C 	09B4
		LDWI 	2CH 			//036D 	2A2C

		//;smartkey.C: 624: RegStatus &=(~0x20);
		BCR 	49H,5 			//036E 	12C9

		//;smartkey.C: 625: setState(2,300);
		STR 	20H 			//036F 	01A0
		LDWI 	1H 			//0370 	2A01
		STR 	21H 			//0371 	01A1
		LDWI 	2H 			//0372 	2A02
		LCALL 	6E9H 			//0373 	36E9
		ORG		0374H

		//;smartkey.C: 626: }
		//;smartkey.C: 627: }
		//;smartkey.C: 629: }
		//;smartkey.C: 631: if( (buf[4] > -31) && (buf[4] < 31)) {
		BCR 	STATUS,5 		//0374 	1283
		LDR 	39H,0 			//0375 	0839
		XORWI 	80H 			//0376 	2680
		ADDWI 	9EH 			//0377 	279E
		BTSS 	STATUS,0 		//0378 	1C03
		LJUMP 	391H 			//0379 	3B91
		LDR 	39H,0 			//037A 	0839
		XORWI 	80H 			//037B 	2680
		ORG		037CH
		ADDWI 	61H 			//037C 	2761
		BTSC 	STATUS,0 		//037D 	1403
		LJUMP 	391H 			//037E 	3B91
		LDWI 	5H 			//037F 	2A05

		//;smartkey.C: 632: isFall++;
		INCR	31H,1 			//0380 	09B1

		//;smartkey.C: 633: if(isFall >4){
		SUBWR 	31H,0 			//0381 	0C31
		BTSS 	STATUS,0 		//0382 	1C03
		LJUMP 	392H 			//0383 	3B92
		ORG		0384H
		LDWI 	2H 			//0384 	2A02

		//;smartkey.C: 634: isFall =0;
		CLRR 	31H 			//0385 	0131

		//;smartkey.C: 635: beep(7,2);
		STR 	24H 			//0386 	01A4
		LDWI 	7H 			//0387 	2A07
		LCALL 	65EH 			//0388 	365E
		LDWI 	2CH 			//0389 	2A2C

		//;smartkey.C: 636: RegStatus &=(~0x20);
		BCR 	49H,5 			//038A 	12C9

		//;smartkey.C: 637: setState(2,300);
		STR 	20H 			//038B 	01A0
		ORG		038CH
		LDWI 	1H 			//038C 	2A01
		STR 	21H 			//038D 	01A1
		LDWI 	2H 			//038E 	2A02
		LCALL 	6E9H 			//038F 	36E9
		LJUMP 	392H 			//0390 	3B92

		//;smartkey.C: 640: else{
		//;smartkey.C: 641: isFall=0;
		CLRR 	31H 			//0391 	0131

		//;smartkey.C: 642: }
		//;smartkey.C: 644: acYOld = buf[2];acXOld = buf[0];
		LDR 	37H,0 			//0392 	0837
		STR 	32H 			//0393 	01B2
		ORG		0394H
		LDR 	35H,0 			//0394 	0835
		STR 	33H 			//0395 	01B3

		//;smartkey.C: 645: }
		//;smartkey.C: 647: }
		//;smartkey.C: 650: if((timeTick>tmp16) && (mtState == 0 ) && mpuOk ==1){
		LDR 	71H,0 			//0396 	0871
		BCR 	STATUS,5 		//0397 	1283
		SUBWR 	43H,0 			//0398 	0C43
		BTSS 	STATUS,2 		//0399 	1D03
		LJUMP 	39DH 			//039A 	3B9D
		LDR 	70H,0 			//039B 	0870
		ORG		039CH
		SUBWR 	42H,0 			//039C 	0C42
		BTSC 	STATUS,0 		//039D 	1403
		LJUMP 	3F9H 			//039E 	3BF9
		LDR 	74H,1 			//039F 	08F4
		BTSS 	STATUS,2 		//03A0 	1D03
		LJUMP 	3F9H 			//03A1 	3BF9
		DECRSZ 	3CH,0 		//03A2 	0E3C
		LJUMP 	3F9H 			//03A3 	3BF9
		ORG		03A4H

		//;smartkey.C: 652: if(timeTick >65000) timeTick =0;
		LDWI 	FDH 			//03A4 	2AFD
		SUBWR 	71H,0 			//03A5 	0C71
		LDWI 	E9H 			//03A6 	2AE9
		BTSC 	STATUS,2 		//03A7 	1503
		SUBWR 	70H,0 			//03A8 	0C70
		BTSS 	STATUS,0 		//03A9 	1C03
		LJUMP 	3ADH 			//03AA 	3BAD
		CLRR 	70H 			//03AB 	0170
		ORG		03ACH
		CLRR 	71H 			//03AC 	0171

		//;smartkey.C: 653: tmp16 = timeTick+40;
		LDR 	71H,0 			//03AD 	0871
		STR 	43H 			//03AE 	01C3
		LDR 	70H,0 			//03AF 	0870
		STR 	42H 			//03B0 	01C2
		LDWI 	28H 			//03B1 	2A28
		ADDWR 	42H,1 			//03B2 	0BC2
		BTSC 	STATUS,0 		//03B3 	1403
		ORG		03B4H
		INCR	43H,1 			//03B4 	09C3

		//;smartkey.C: 655: if(AccRead(0x3b,buf,6)==0){
		LDWI 	35H 			//03B5 	2A35
		STR 	24H 			//03B6 	01A4
		LDWI 	0H 			//03B7 	2A00
		STR 	25H 			//03B8 	01A5
		LDWI 	6H 			//03B9 	2A06
		STR 	26H 			//03BA 	01A6
		LDWI 	3BH 			//03BB 	2A3B
		ORG		03BCH
		LCALL 	58EH 			//03BC 	358E
		IORWI 	0H 			//03BD 	2500

		//;smartkey.C: 657: if(vibrateOn==1){
		BCR 	STATUS,5 		//03BE 	1283
		BTSS 	STATUS,2 		//03BF 	1D03
		LJUMP 	3FAH 			//03C0 	3BFA
		DECRSZ 	34H,0 		//03C1 	0E34
		LJUMP 	3D9H 			//03C2 	3BD9

		//;smartkey.C: 658: if(compe(buf[0],acXOld ,2) && compe(buf[2],acYOld ,2)){
		LDR 	33H,0 			//03C3 	0833
		ORG		03C4H
		STR 	20H 			//03C4 	01A0
		LDWI 	2H 			//03C5 	2A02
		STR 	21H 			//03C6 	01A1
		LDR 	35H,0 			//03C7 	0835
		LCALL 	4CDH 			//03C8 	34CD
		XORWI 	0H 			//03C9 	2600
		BCR 	STATUS,5 		//03CA 	1283
		BTSC 	STATUS,2 		//03CB 	1503
		ORG		03CCH
		LJUMP 	3F1H 			//03CC 	3BF1
		LDR 	32H,0 			//03CD 	0832
		STR 	20H 			//03CE 	01A0
		LDWI 	2H 			//03CF 	2A02
		STR 	21H 			//03D0 	01A1
		LDR 	37H,0 			//03D1 	0837
		LCALL 	4CDH 			//03D2 	34CD
		XORWI 	0H 			//03D3 	2600
		ORG		03D4H
		BTSC 	STATUS,2 		//03D4 	1503
		LJUMP 	3F0H 			//03D5 	3BF0

		//;smartkey.C: 660: isSw=0;
		BCR 	STATUS,5 		//03D6 	1283
		CLRR 	41H 			//03D7 	0141

		//;smartkey.C: 663: }
		LJUMP 	3F9H 			//03D8 	3BF9

		//;smartkey.C: 668: {
		//;smartkey.C: 669: beepOn();TMR2ON = 0; beep(7,3);
		//;smartkey.C: 664: else{
		//;smartkey.C: 665: isSw++;
		//;smartkey.C: 673: else if(vibrateOn==2){
		LDR 	34H,0 			//03D9 	0834
		XORWI 	2H 			//03DA 	2602
		BTSS 	STATUS,2 		//03DB 	1D03
		ORG		03DCH
		LJUMP 	3F9H 			//03DC 	3BF9

		//;smartkey.C: 674: if(compe(buf[0],(signed char)acXsum ,5) && compe(buf[2],(signed char)a
		//+                          cYsum ,5)){
		LDR 	3FH,0 			//03DD 	083F
		STR 	20H 			//03DE 	01A0
		LDWI 	5H 			//03DF 	2A05
		STR 	21H 			//03E0 	01A1
		LDR 	35H,0 			//03E1 	0835
		LCALL 	4CDH 			//03E2 	34CD
		XORWI 	0H 			//03E3 	2600
		ORG		03E4H
		BCR 	STATUS,5 		//03E4 	1283
		BTSC 	STATUS,2 		//03E5 	1503
		LJUMP 	3F1H 			//03E6 	3BF1
		LDR 	3DH,0 			//03E7 	083D
		STR 	20H 			//03E8 	01A0
		LDWI 	5H 			//03E9 	2A05
		STR 	21H 			//03EA 	01A1
		LDR 	37H,0 			//03EB 	0837
		ORG		03ECH
		LCALL 	4CDH 			//03EC 	34CD
		XORWI 	0H 			//03ED 	2600
		BTSS 	STATUS,2 		//03EE 	1D03
		LJUMP 	3D6H 			//03EF 	3BD6

		//;smartkey.C: 680: else{
		//;smartkey.C: 681: isSw++;
		BCR 	STATUS,5 		//03F0 	1283
		INCR	41H,1 			//03F1 	09C1

		//;smartkey.C: 684: {
		//;smartkey.C: 685: beepOn();TMR2ON = 0; beep(7,3);
		LCALL 	70AH 			//03F2 	370A
		LDWI 	3H 			//03F3 	2A03
		ORG		03F4H
		BCR 	STATUS,5 		//03F4 	1283
		BCR 	12H,2 			//03F5 	1112
		STR 	24H 			//03F6 	01A4
		LDWI 	7H 			//03F7 	2A07
		LCALL 	65EH 			//03F8 	365E

		//;smartkey.C: 686: }
		//;smartkey.C: 687: }
		//;smartkey.C: 688: }
		//;smartkey.C: 690: }
		//;smartkey.C: 693: }
		//;smartkey.C: 695: if(RegStatus & 0x20) {RC0 =1;RC1 =1;}
		BCR 	STATUS,5 		//03F9 	1283
		BTSS 	49H,5 			//03FA 	1EC9
		LJUMP 	3FFH 			//03FB 	3BFF
		ORG		03FCH
		BSR 	7H,0 			//03FC 	1807
		BSR 	7H,1 			//03FD 	1887
		LJUMP 	1B5H 			//03FE 	39B5

		//;smartkey.C: 696: else {RC0 =0;RC1 =0;}
		BCR 	7H,0 			//03FF 	1007
		BCR 	7H,1 			//0400 	1087
		LJUMP 	1B5H 			//0401 	39B5

		//;smartkey.C: 42: if(PAIE&&PAIF){
		BTSC 	INTCON,3 		//0402 	158B
		BTSS 	INTCON,0 		//0403 	1C0B
		ORG		0404H
		LJUMP 	413H 			//0404 	3C13

		//;smartkey.C: 44: tmp = PORTA;
		BCR 	STATUS,5 		//0405 	1283
		LDR 	5H,0 			//0406 	0805

		//;smartkey.C: 45: PAIF = 0;
		BCR 	INTCON,0 		//0407 	100B

		//;smartkey.C: 47: if(RA5){
		BTSS 	5H,5 			//0408 	1E85
		LJUMP 	412H 			//0409 	3C12

		//;smartkey.C: 49: if(mode_chek == 0){
		LDR 	73H,1 			//040A 	08F3
		BTSS 	STATUS,2 		//040B 	1D03
		ORG		040CH
		LJUMP 	413H 			//040C 	3C13

		//;smartkey.C: 50: cntCyc = 0;
		CLRR 	72H 			//040D 	0172

		//;smartkey.C: 51: cntOff = 0;
		CLRR 	4AH 			//040E 	014A

		//;smartkey.C: 53: mode_chek = 1;
		CLRR 	73H 			//040F 	0173
		INCR	73H,1 			//0410 	09F3
		LJUMP 	413H 			//0411 	3C13

		//;smartkey.C: 58: else{
		//;smartkey.C: 59: cntOff = 0;
		CLRR 	4AH 			//0412 	014A

		//;smartkey.C: 61: }
		//;smartkey.C: 63: }
		//;smartkey.C: 66: if(INTE&&INTF){
		BTSC 	INTCON,4 		//0413 	160B
		ORG		0414H
		BTSS 	INTCON,1 		//0414 	1C8B
		LJUMP 	429H 			//0415 	3C29

		//;smartkey.C: 67: unsigned char tmp;
		//;smartkey.C: 68: INTF = 0;
		BCR 	INTCON,1 		//0416 	108B

		//;smartkey.C: 70: if( RA2==0){
		BCR 	STATUS,5 		//0417 	1283
		BTSC 	5H,2 			//0418 	1505
		LJUMP 	429H 			//0419 	3C29

		//;smartkey.C: 72: if(timeTick <0x20){
		LDWI 	0H 			//041A 	2A00
		SUBWR 	71H,0 			//041B 	0C71
		ORG		041CH
		LDWI 	20H 			//041C 	2A20
		BTSC 	STATUS,2 		//041D 	1503
		SUBWR 	70H,0 			//041E 	0C70
		BTSC 	STATUS,0 		//041F 	1403
		LJUMP 	428H 			//0420 	3C28

		//;smartkey.C: 73: tmp = READ_EEPROM(0x40);
		LDWI 	40H 			//0421 	2A40
		LCALL 	6FDH 			//0422 	36FD
		STR 	79H 			//0423 	01F9
		ORG		0424H

		//;smartkey.C: 74: WRITE_EEPROM(0x40,tmp+1);
		INCR	79H,0 			//0424 	0979
		STR 	75H 			//0425 	01F5
		LDWI 	40H 			//0426 	2A40
		LCALL 	646H 			//0427 	3646
		LJUMP 	428H 			//0428 	3C28

		//;smartkey.C: 83: }
		//;smartkey.C: 85: }
		//;smartkey.C: 88: if (T0IE && T0IF) {
		BTSC 	INTCON,5 		//0429 	168B
		BTSS 	INTCON,2 		//042A 	1D0B
		LJUMP 	478H 			//042B 	3C78
		ORG		042CH
		LDWI 	B3H 			//042C 	2AB3

		//;smartkey.C: 89: T0IF = 0;
		BCR 	INTCON,2 		//042D 	110B

		//;smartkey.C: 90: TMR0 = 179;
		BCR 	STATUS,5 		//042E 	1283
		STR 	1H 			//042F 	0181

		//;smartkey.C: 96: if( mode_chek == 1){
		DECRSZ 	73H,0 		//0430 	0E73
		LJUMP 	44AH 			//0431 	3C4A

		//;smartkey.C: 98: cntCyc++;
		INCR	72H,1 			//0432 	09F2

		//;smartkey.C: 100: if(RA5==0){
		BTSC 	5H,5 			//0433 	1685
		ORG		0434H
		LJUMP 	44AH 			//0434 	3C4A
		LDWI 	10H 			//0435 	2A10

		//;smartkey.C: 102: cntOff++;
		INCR	4AH,1 			//0436 	09CA

		//;smartkey.C: 105: if(cntOff > 15){
		SUBWR 	4AH,0 			//0437 	0C4A
		BTSS 	STATUS,0 		//0438 	1C03
		LJUMP 	44AH 			//0439 	3C4A
		LDWI 	10H 			//043A 	2A10

		//;smartkey.C: 107: mode_chek = 0;
		CLRR 	73H 			//043B 	0173
		ORG		043CH

		//;smartkey.C: 109: if((cntCyc>15) &&(cntCyc<50)) {
		SUBWR 	72H,0 			//043C 	0C72
		LDWI 	32H 			//043D 	2A32
		BTSS 	STATUS,0 		//043E 	1C03
		LJUMP 	446H 			//043F 	3C46
		SUBWR 	72H,0 			//0440 	0C72
		BTSC 	STATUS,0 		//0441 	1403
		LJUMP 	445H 			//0442 	3C45

		//;smartkey.C: 110: RegStatus |= (0x40);
		BSR 	49H,6 			//0443 	1B49
		ORG		0444H

		//;smartkey.C: 111: } else if (cntCyc>=50){
		LJUMP 	449H 			//0444 	3C49
		LDWI 	32H 			//0445 	2A32
		SUBWR 	72H,0 			//0446 	0C72
		BTSC 	STATUS,0 		//0447 	1403

		//;smartkey.C: 112: RegStatus &= ~(0x40);
		BCR 	49H,6 			//0448 	1349

		//;smartkey.C: 113: }
		//;smartkey.C: 116: RegStatus |= 0x80;
		BSR 	49H,7 			//0449 	1BC9

		//;smartkey.C: 117: }
		//;smartkey.C: 119: }
		//;smartkey.C: 129: }
		//;smartkey.C: 132: timeTick++;
		INCR	70H,1 			//044A 	09F0
		BTSC 	STATUS,2 		//044B 	1503
		ORG		044CH
		INCR	71H,1 			//044C 	09F1

		//;smartkey.C: 134: if((mtState == 4)||(mtState == 3)){
		LDR 	74H,0 			//044D 	0874
		XORWI 	4H 			//044E 	2604
		BTSC 	STATUS,2 		//044F 	1503
		LJUMP 	455H 			//0450 	3C55
		LDR 	74H,0 			//0451 	0874
		XORWI 	3H 			//0452 	2603
		BTSS 	STATUS,2 		//0453 	1D03
		ORG		0454H
		LJUMP 	478H 			//0454 	3C78

		//;smartkey.C: 136: if(timeTick > cntTmp){
		LDR 	71H,0 			//0455 	0871
		SUBWR 	46H,0 			//0456 	0C46
		BTSS 	STATUS,2 		//0457 	1D03
		LJUMP 	45BH 			//0458 	3C5B
		LDR 	70H,0 			//0459 	0870
		SUBWR 	45H,0 			//045A 	0C45
		BTSC 	STATUS,0 		//045B 	1403
		ORG		045CH
		LJUMP 	478H 			//045C 	3C78

		//;smartkey.C: 137: cntTmp = timeTick+45;
		LDR 	71H,0 			//045D 	0871
		STR 	46H 			//045E 	01C6
		LDR 	70H,0 			//045F 	0870
		STR 	45H 			//0460 	01C5
		LDWI 	2DH 			//0461 	2A2D
		ADDWR 	45H,1 			//0462 	0BC5
		BTSC 	STATUS,0 		//0463 	1403
		ORG		0464H
		INCR	46H,1 			//0464 	09C6

		//;smartkey.C: 138: if(cntTmp<=timeOut)
		LDR 	46H,0 			//0465 	0846
		SUBWR 	48H,0 			//0466 	0C48
		BTSS 	STATUS,2 		//0467 	1D03
		LJUMP 	46BH 			//0468 	3C6B
		LDR 	45H,0 			//0469 	0845
		SUBWR 	47H,0 			//046A 	0C47

		//;smartkey.C: 139: {
		//;smartkey.C: 140: TMR2IE = 0;
		BSR 	STATUS,5 		//046B 	1A83
		ORG		046CH
		BTSS 	STATUS,0 		//046C 	1C03
		LJUMP 	479H 			//046D 	3C79
		BCR 	CH,1 			//046E 	108C

		//;smartkey.C: 142: if (PR2L == 20)
		LDR 	11H,0 			//046F 	0811
		XORWI 	14H 			//0470 	2614
		BTSS 	STATUS,2 		//0471 	1D03
		LJUMP 	475H 			//0472 	3C75

		//;smartkey.C: 143: PR2L = 25;
		LDWI 	19H 			//0473 	2A19
		ORG		0474H
		LJUMP 	476H 			//0474 	3C76

		//;smartkey.C: 144: else
		//;smartkey.C: 145: PR2L = 20;
		LDWI 	14H 			//0475 	2A14
		STR 	11H 			//0476 	0191

		//;smartkey.C: 146: TMR2IE = 1;
		BSR 	CH,1 			//0477 	188C

		//;smartkey.C: 147: }
		//;smartkey.C: 148: }
		//;smartkey.C: 149: }
		//;smartkey.C: 152: }
		//;smartkey.C: 155: if(TMR2IE&&TMR2IF)
		BSR 	STATUS,5 		//0478 	1A83
		BTSS 	CH,1 			//0479 	1C8C
		LJUMP 	481H 			//047A 	3C81
		BCR 	STATUS,5 		//047B 	1283
		ORG		047CH
		BTSS 	CH,1 			//047C 	1C8C
		LJUMP 	481H 			//047D 	3C81
		LDWI 	8H 			//047E 	2A08

		//;smartkey.C: 156: {
		//;smartkey.C: 157: TMR2IF = 0;
		BCR 	CH,1 			//047F 	108C

		//;smartkey.C: 158: RA3 =~ RA3;
		XORWR 	5H,1 			//0480 	0485
		LDR 	78H,0 			//0481 	0878
		STR 	PCLATH 			//0482 	018A
		SWAPR 	77H,0 			//0483 	0777
		ORG		0484H
		STR 	STATUS 			//0484 	0183
		SWAPR 	7EH,1 			//0485 	07FE
		SWAPR 	7EH,0 			//0486 	077E
		RETI		 			//0487 	0009
		CLRR 	25H 			//0488 	0125
		BTSS 	21H,7 			//0489 	1FA1
		LJUMP 	492H 			//048A 	3C92
		COMR 	20H,1 			//048B 	0FA0
		ORG		048CH
		COMR 	21H,1 			//048C 	0FA1
		INCR	20H,1 			//048D 	09A0
		BTSC 	STATUS,2 		//048E 	1503
		INCR	21H,1 			//048F 	09A1
		CLRR 	25H 			//0490 	0125
		INCR	25H,1 			//0491 	09A5
		BTSS 	23H,7 			//0492 	1FA3
		LJUMP 	49BH 			//0493 	3C9B
		ORG		0494H
		COMR 	22H,1 			//0494 	0FA2
		COMR 	23H,1 			//0495 	0FA3
		INCR	22H,1 			//0496 	09A2
		BTSC 	STATUS,2 		//0497 	1503
		INCR	23H,1 			//0498 	09A3
		LDWI 	1H 			//0499 	2A01
		XORWR 	25H,1 			//049A 	04A5
		CLRR 	26H 			//049B 	0126
		ORG		049CH
		CLRR 	27H 			//049C 	0127
		LDR 	21H,0 			//049D 	0821
		IORWR 	20H,0 			//049E 	0320
		BTSC 	STATUS,2 		//049F 	1503
		LJUMP 	4C0H 			//04A0 	3CC0
		CLRR 	24H 			//04A1 	0124
		INCR	24H,1 			//04A2 	09A4
		BTSC 	21H,7 			//04A3 	17A1
		ORG		04A4H
		LJUMP 	4A9H 			//04A4 	3CA9
		BCR 	STATUS,0 		//04A5 	1003
		RLR 	20H,1 			//04A6 	05A0
		RLR 	21H,1 			//04A7 	05A1
		LJUMP 	4A2H 			//04A8 	3CA2
		BCR 	STATUS,0 		//04A9 	1003
		RLR 	26H,1 			//04AA 	05A6
		RLR 	27H,1 			//04AB 	05A7
		ORG		04ACH
		LDR 	21H,0 			//04AC 	0821
		SUBWR 	23H,0 			//04AD 	0C23
		BTSS 	STATUS,2 		//04AE 	1D03
		LJUMP 	4B2H 			//04AF 	3CB2
		LDR 	20H,0 			//04B0 	0820
		SUBWR 	22H,0 			//04B1 	0C22
		BTSS 	STATUS,0 		//04B2 	1C03
		LJUMP 	4BCH 			//04B3 	3CBC
		ORG		04B4H
		LDR 	20H,0 			//04B4 	0820
		SUBWR 	22H,1 			//04B5 	0CA2
		LDR 	21H,0 			//04B6 	0821
		BTSS 	STATUS,0 		//04B7 	1C03
		DECR 	23H,1 			//04B8 	0DA3
		SUBWR 	23H,1 			//04B9 	0CA3
		BSR 	26H,0 			//04BA 	1826
		BCR 	STATUS,0 		//04BB 	1003
		ORG		04BCH
		RRR	21H,1 			//04BC 	06A1
		RRR	20H,1 			//04BD 	06A0
		DECRSZ 	24H,1 		//04BE 	0EA4
		LJUMP 	4A9H 			//04BF 	3CA9
		LDR 	25H,0 			//04C0 	0825
		BTSC 	STATUS,2 		//04C1 	1503
		LJUMP 	4C8H 			//04C2 	3CC8
		COMR 	26H,1 			//04C3 	0FA6
		ORG		04C4H
		COMR 	27H,1 			//04C4 	0FA7
		INCR	26H,1 			//04C5 	09A6
		BTSC 	STATUS,2 		//04C6 	1503
		INCR	27H,1 			//04C7 	09A7
		LDR 	27H,0 			//04C8 	0827
		STR 	21H 			//04C9 	01A1
		LDR 	26H,0 			//04CA 	0826
		STR 	20H 			//04CB 	01A0
		ORG		04CCH
		RET		 					//04CC 	0004
		STR 	27H 			//04CD 	01A7

		//;smartkey.C: 228: if(a>b){
		LDR 	20H,0 			//04CE 	0820
		XORWI 	80H 			//04CF 	2680
		STR 	22H 			//04D0 	01A2
		LDR 	27H,0 			//04D1 	0827
		XORWI 	80H 			//04D2 	2680
		SUBWR 	22H,1 			//04D3 	0CA2
		ORG		04D4H
		BTSC 	STATUS,0 		//04D4 	1403
		LJUMP 	4F9H 			//04D5 	3CF9

		//;smartkey.C: 229: if((a-b)<=dt) return 1;
		LDR 	20H,0 			//04D6 	0820
		SUBWR 	27H,0 			//04D7 	0C27
		STR 	22H 			//04D8 	01A2
		CLRR 	23H 			//04D9 	0123
		BTSS 	STATUS,0 		//04DA 	1C03
		DECR 	23H,1 			//04DB 	0DA3
		ORG		04DCH
		BTSC 	27H,7 			//04DC 	17A7
		DECR 	23H,1 			//04DD 	0DA3
		BTSC 	20H,7 			//04DE 	17A0
		INCR	23H,1 			//04DF 	09A3
		BCR 	STATUS,5 		//04E0 	1283
		LCALL 	506H 			//04E1 	3506
		BTSS 	STATUS,2 		//04E2 	1D03
		LJUMP 	4E6H 			//04E3 	3CE6
		ORG		04E4H
		LDR 	22H,0 			//04E4 	0822
		SUBWR 	24H,0 			//04E5 	0C24
		BTSS 	STATUS,0 		//04E6 	1C03
		RETW 	0H 			//04E7 	2100
		RETW 	1H 			//04E8 	2101

		//;smartkey.C: 233: if((b-a)<=dt) return 1;
		SUBWR 	20H,0 			//04E9 	0C20
		STR 	22H 			//04EA 	01A2
		CLRR 	23H 			//04EB 	0123
		ORG		04ECH
		BTSS 	STATUS,0 		//04EC 	1C03
		DECR 	23H,1 			//04ED 	0DA3
		BTSC 	20H,7 			//04EE 	17A0
		DECR 	23H,1 			//04EF 	0DA3
		BTSC 	27H,7 			//04F0 	17A7
		INCR	23H,1 			//04F1 	09A3
		BCR 	STATUS,5 		//04F2 	1283
		LCALL 	506H 			//04F3 	3506
		ORG		04F4H
		BTSS 	STATUS,2 		//04F4 	1D03
		LJUMP 	4E6H 			//04F5 	3CE6
		LDR 	22H,0 			//04F6 	0822
		SUBWR 	24H,0 			//04F7 	0C24
		LJUMP 	4E6H 			//04F8 	3CE6

		//;smartkey.C: 230: else return 0;
		//;smartkey.C: 232: else if(a<b){
		LDR 	27H,0 			//04F9 	0827
		XORWI 	80H 			//04FA 	2680
		STR 	22H 			//04FB 	01A2
		ORG		04FCH
		LDR 	20H,0 			//04FC 	0820
		XORWI 	80H 			//04FD 	2680
		SUBWR 	22H,1 			//04FE 	0CA2

		//;smartkey.C: 236: else if(a==b){
		LDR 	27H,0 			//04FF 	0827
		BTSS 	STATUS,0 		//0500 	1C03
		LJUMP 	4E9H 			//0501 	3CE9
		XORWR 	20H,0 			//0502 	0420
		BTSC 	STATUS,2 		//0503 	1503
		ORG		0504H
		RETW 	1H 			//0504 	2101
		RETW 	0H 			//0505 	2100
		LDR 	21H,0 			//0506 	0821
		STR 	24H 			//0507 	01A4
		CLRR 	25H 			//0508 	0125
		BTSC 	24H,7 			//0509 	17A4
		DECR 	25H,1 			//050A 	0DA5
		LDR 	25H,0 			//050B 	0825
		ORG		050CH
		XORWI 	80H 			//050C 	2680
		STR 	26H 			//050D 	01A6
		LDR 	23H,0 			//050E 	0823
		XORWI 	80H 			//050F 	2680
		SUBWR 	26H,0 			//0510 	0C26
		RET		 					//0511 	0004

		//;mpu6x.c: 24: else
		//;mpu6x.c: 25: return 1;
		//;mpu6x.c: 21: else
		//;mpu6x.c: 22: return 2;
		BCR 	STATUS,5 		//0512 	1283
		STR 	21H 			//0513 	01A1
		ORG		0514H
		CLRR 	22H 			//0514 	0122

		//;SWI2C.C: 115: RA7 = 0;
		BCR 	5H,7 			//0515 	1385

		//;SWI2C.C: 116: TRISA |=0x40;;
		BSR 	STATUS,5 		//0516 	1A83
		BSR 	5H,6 			//0517 	1B05

		//;SWI2C.C: 117: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0518 	2A05
		BCR 	STATUS,5 		//0519 	1283
		STR 	20H 			//051A 	01A0
		DECRSZ 	20H,1 		//051B 	0EA0
		ORG		051CH
		LJUMP 	51BH 			//051C 	3D1B

		//;SWI2C.C: 118: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//051D 	1283
		CLRR 	23H 			//051E 	0123
		LDWI 	5H 			//051F 	2A05

		//;SWI2C.C: 119: {
		//;SWI2C.C: 120: RA7 = 1;
		BSR 	5H,7 			//0520 	1B85

		//;SWI2C.C: 121: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0521 	01A0
		DECRSZ 	20H,1 		//0522 	0EA0
		LJUMP 	522H 			//0523 	3D22
		ORG		0524H

		//;SWI2C.C: 122: dat = dat<<1 |(RA6 & 1 );
		LDWI 	0H 			//0524 	2A00
		BCR 	STATUS,5 		//0525 	1283
		BTSC 	5H,6 			//0526 	1705
		LDWI 	1H 			//0527 	2A01
		ANDWI 	1H 			//0528 	2401
		STR 	20H 			//0529 	01A0
		BCR 	STATUS,0 		//052A 	1003
		RLR 	22H,0 			//052B 	0522
		ORG		052CH
		IORWR 	20H,0 			//052C 	0320
		STR 	22H 			//052D 	01A2
		LDWI 	5H 			//052E 	2A05

		//;SWI2C.C: 125: RA7 = 0;
		BCR 	5H,7 			//052F 	1385

		//;SWI2C.C: 126: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0530 	01A0
		DECRSZ 	20H,1 		//0531 	0EA0
		LJUMP 	531H 			//0532 	3D31
		LDWI 	8H 			//0533 	2A08
		ORG		0534H
		BCR 	STATUS,5 		//0534 	1283
		INCR	23H,1 			//0535 	09A3
		SUBWR 	23H,0 			//0536 	0C23
		BTSS 	STATUS,0 		//0537 	1C03
		LJUMP 	51FH 			//0538 	3D1F

		//;SWI2C.C: 127: }
		//;SWI2C.C: 129: TRISA &=0xbf;;
		BSR 	STATUS,5 		//0539 	1A83
		BCR 	5H,6 			//053A 	1305

		//;SWI2C.C: 131: RA6 = (Ack) ? 0 : 1;
		BCR 	STATUS,5 		//053B 	1283
		ORG		053CH
		LDR 	21H,1 			//053C 	08A1
		BCR 	STATUS,5 		//053D 	1283
		BTSS 	STATUS,2 		//053E 	1D03
		LJUMP 	542H 			//053F 	3D42
		BSR 	5H,6 			//0540 	1B05
		LJUMP 	543H 			//0541 	3D43
		BCR 	5H,6 			//0542 	1305
		LDWI 	5H 			//0543 	2A05
		ORG		0544H

		//;SWI2C.C: 132: RA7 = 1;
		BSR 	5H,7 			//0544 	1B85

		//;SWI2C.C: 133: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0545 	01A0
		DECRSZ 	20H,1 		//0546 	0EA0
		LJUMP 	546H 			//0547 	3D46
		LDWI 	5H 			//0548 	2A05

		//;SWI2C.C: 134: RA7 = 0;
		BCR 	STATUS,5 		//0549 	1283
		BCR 	5H,7 			//054A 	1385

		//;SWI2C.C: 135: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//054B 	01A0
		ORG		054CH
		DECRSZ 	20H,1 		//054C 	0EA0
		LJUMP 	54CH 			//054D 	3D4C

		//;SWI2C.C: 136: return dat;
		BCR 	STATUS,5 		//054E 	1283
		LDR 	22H,0 			//054F 	0822
		RET		 					//0550 	0004
		BCR 	STATUS,5 		//0551 	1283
		STR 	21H 			//0552 	01A1

		//;SWI2C.C: 89: TRISA &=0xbf;;
		BSR 	STATUS,5 		//0553 	1A83
		ORG		0554H
		BCR 	5H,6 			//0554 	1305

		//;SWI2C.C: 90: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0555 	2A05
		BCR 	STATUS,5 		//0556 	1283
		STR 	20H 			//0557 	01A0
		DECRSZ 	20H,1 		//0558 	0EA0
		LJUMP 	558H 			//0559 	3D58

		//;SWI2C.C: 91: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//055A 	1283
		CLRR 	22H 			//055B 	0122
		ORG		055CH

		//;SWI2C.C: 92: {
		//;SWI2C.C: 93: RA6 = (dat&0x80) ? 1:0;
		BTSS 	21H,7 			//055C 	1FA1
		LJUMP 	561H 			//055D 	3D61
		BCR 	STATUS,5 		//055E 	1283
		BSR 	5H,6 			//055F 	1B05
		LJUMP 	563H 			//0560 	3D63
		BCR 	STATUS,5 		//0561 	1283
		BCR 	5H,6 			//0562 	1305
		LDWI 	5H 			//0563 	2A05
		ORG		0564H

		//;SWI2C.C: 94: dat<<=1;
		BCR 	STATUS,0 		//0564 	1003
		RLR 	21H,1 			//0565 	05A1

		//;SWI2C.C: 95: RA7 = 1;
		BSR 	5H,7 			//0566 	1B85

		//;SWI2C.C: 96: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0567 	01A0
		DECRSZ 	20H,1 		//0568 	0EA0
		LJUMP 	568H 			//0569 	3D68
		LDWI 	5H 			//056A 	2A05

		//;SWI2C.C: 97: RA7 = 0;
		BCR 	STATUS,5 		//056B 	1283
		ORG		056CH
		BCR 	5H,7 			//056C 	1385

		//;SWI2C.C: 98: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//056D 	01A0
		DECRSZ 	20H,1 		//056E 	0EA0
		LJUMP 	56EH 			//056F 	3D6E
		LDWI 	8H 			//0570 	2A08
		BCR 	STATUS,5 		//0571 	1283
		INCR	22H,1 			//0572 	09A2
		SUBWR 	22H,0 			//0573 	0C22
		ORG		0574H
		BTSS 	STATUS,0 		//0574 	1C03
		LJUMP 	55CH 			//0575 	3D5C

		//;SWI2C.C: 99: }
		//;SWI2C.C: 101: TRISA |=0x40;;
		BSR 	STATUS,5 		//0576 	1A83
		BSR 	5H,6 			//0577 	1B05

		//;SWI2C.C: 102: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0578 	2A05
		BCR 	STATUS,5 		//0579 	1283
		STR 	20H 			//057A 	01A0
		DECRSZ 	20H,1 		//057B 	0EA0
		ORG		057CH
		LJUMP 	57BH 			//057C 	3D7B
		LDWI 	5H 			//057D 	2A05

		//;SWI2C.C: 103: RA7 = 1;
		BCR 	STATUS,5 		//057E 	1283
		BSR 	5H,7 			//057F 	1B85

		//;SWI2C.C: 104: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0580 	01A0
		DECRSZ 	20H,1 		//0581 	0EA0
		LJUMP 	581H 			//0582 	3D81

		//;SWI2C.C: 105: i= RA6;
		LDWI 	0H 			//0583 	2A00
		ORG		0584H
		BCR 	STATUS,5 		//0584 	1283
		BTSC 	5H,6 			//0585 	1705
		LDWI 	1H 			//0586 	2A01
		STR 	22H 			//0587 	01A2

		//;SWI2C.C: 106: RA7 = 0;
		BCR 	5H,7 			//0588 	1385

		//;SWI2C.C: 107: TRISA &=0xbf;;
		BSR 	STATUS,5 		//0589 	1A83
		BCR 	5H,6 			//058A 	1305

		//;SWI2C.C: 108: return i;
		BCR 	STATUS,5 		//058B 	1283
		ORG		058CH
		LDR 	22H,0 			//058C 	0822
		RET		 					//058D 	0004
		STR 	2AH 			//058E 	01AA

		//;mpu6x.c: 32: unsigned char i;
		//;mpu6x.c: 34: swI2C_Start();
		LCALL 	68AH 			//058F 	368A

		//;mpu6x.c: 36: if(swI2C_WriteByte(0x68<<1)== 0 )
		LDWI 	D0H 			//0590 	2AD0
		LCALL 	551H 			//0591 	3551
		IORWI 	0H 			//0592 	2500
		BTSS 	STATUS,2 		//0593 	1D03
		ORG		0594H
		RETW 	1H 			//0594 	2101

		//;mpu6x.c: 37: {
		//;mpu6x.c: 38: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	2AH,0 			//0595 	082A
		LCALL 	551H 			//0596 	3551
		IORWI 	0H 			//0597 	2500
		BTSS 	STATUS,2 		//0598 	1D03
		RETW 	2H 			//0599 	2102

		//;mpu6x.c: 39: {
		//;mpu6x.c: 40: swI2C_Start();
		LCALL 	68AH 			//059A 	368A

		//;mpu6x.c: 41: if(swI2C_WriteByte((0x68<<1)|1)== 0 ){
		LDWI 	D1H 			//059B 	2AD1
		ORG		059CH
		LCALL 	551H 			//059C 	3551
		IORWI 	0H 			//059D 	2500
		BTSS 	STATUS,2 		//059E 	1D03
		RETW 	1H 			//059F 	2101

		//;mpu6x.c: 43: for(i=0; i<(len-1);i++){
		CLRR 	2BH 			//05A0 	012B
		LDR 	26H,0 			//05A1 	0826
		ADDWI 	FFH 			//05A2 	27FF
		STR 	27H 			//05A3 	01A7
		ORG		05A4H
		LDWI 	FFH 			//05A4 	2AFF
		BTSC 	STATUS,0 		//05A5 	1403
		LDWI 	0H 			//05A6 	2A00
		STR 	28H 			//05A7 	01A8
		XORWI 	80H 			//05A8 	2680
		SUBWI 	80H 			//05A9 	2880
		BTSS 	STATUS,2 		//05AA 	1D03
		LJUMP 	5AEH 			//05AB 	3DAE
		ORG		05ACH
		LDR 	27H,0 			//05AC 	0827
		SUBWR 	2BH,0 			//05AD 	0C2B

		//;mpu6x.c: 44: dat[i]=swI2C_ReadByte(1);
		LDWI 	1H 			//05AE 	2A01
		BTSC 	STATUS,0 		//05AF 	1403
		LJUMP 	5B5H 			//05B0 	3DB5
		LCALL 	512H 			//05B1 	3512
		LCALL 	5B9H 			//05B2 	35B9
		INCR	2BH,1 			//05B3 	09AB
		ORG		05B4H
		LJUMP 	5A1H 			//05B4 	3DA1

		//;mpu6x.c: 45: }
		//;mpu6x.c: 46: dat[i]=swI2C_ReadByte(1);
		LCALL 	512H 			//05B5 	3512
		LCALL 	5B9H 			//05B6 	35B9

		//;mpu6x.c: 47: swI2C_Stop();
		LCALL 	6CFH 			//05B7 	36CF

		//;mpu6x.c: 48: return 0;
		RETW 	0H 			//05B8 	2100

		//;mpu6x.c: 54: else
		//;mpu6x.c: 55: return 2;
		//;mpu6x.c: 51: else
		//;mpu6x.c: 52: return 1;
		STR 	27H 			//05B9 	01A7
		LDR 	2BH,0 			//05BA 	082B
		ADDWR 	24H,0 			//05BB 	0B24
		ORG		05BCH
		STR 	28H 			//05BC 	01A8
		LDR 	25H,0 			//05BD 	0825
		BTSC 	STATUS,0 		//05BE 	1403
		ADDWI 	1H 			//05BF 	2701
		STR 	29H 			//05C0 	01A9
		LDR 	28H,0 			//05C1 	0828
		STR 	FSR 			//05C2 	0184
		BCR 	STATUS,7 		//05C3 	1383
		ORG		05C4H
		BTSC 	29H,0 			//05C4 	1429
		BSR 	STATUS,7 		//05C5 	1B83
		LDR 	27H,0 			//05C6 	0827
		STR 	INDF 			//05C7 	0180
		RET		 					//05C8 	0004
		STR 	28H 			//05C9 	01A8

		//;mpu6x.c: 5: unsigned char i;
		//;mpu6x.c: 6: swI2C_Start();
		LCALL 	68AH 			//05CA 	368A

		//;mpu6x.c: 8: if(swI2C_WriteByte(0x68<<1)== 0 )
		LDWI 	D0H 			//05CB 	2AD0
		ORG		05CCH
		LCALL 	551H 			//05CC 	3551
		IORWI 	0H 			//05CD 	2500
		BTSS 	STATUS,2 		//05CE 	1D03
		RETW 	1H 			//05CF 	2101

		//;mpu6x.c: 9: {
		//;mpu6x.c: 10: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	28H,0 			//05D0 	0828
		LCALL 	551H 			//05D1 	3551
		IORWI 	0H 			//05D2 	2500
		BTSS 	STATUS,2 		//05D3 	1D03
		ORG		05D4H
		RETW 	2H 			//05D4 	2102

		//;mpu6x.c: 11: {
		//;mpu6x.c: 12: for(i=0; i<len;i++){
		CLRR 	29H 			//05D5 	0129
		LDR 	25H,0 			//05D6 	0825
		SUBWR 	29H,0 			//05D7 	0C29
		BTSC 	STATUS,0 		//05D8 	1403
		LJUMP 	5EFH 			//05D9 	3DEF

		//;mpu6x.c: 13: if(swI2C_WriteByte(dat[i])==1 ){
		LDR 	29H,0 			//05DA 	0829
		ADDWR 	23H,0 			//05DB 	0B23
		ORG		05DCH
		STR 	26H 			//05DC 	01A6
		LDR 	24H,0 			//05DD 	0824
		BTSC 	STATUS,0 		//05DE 	1403
		ADDWI 	1H 			//05DF 	2701
		STR 	27H 			//05E0 	01A7
		LDR 	26H,0 			//05E1 	0826
		STR 	FSR 			//05E2 	0184
		BSR 	STATUS,7 		//05E3 	1B83
		ORG		05E4H
		BTSS 	27H,0 			//05E4 	1C27
		BCR 	STATUS,7 		//05E5 	1383
		LDR 	INDF,0 			//05E6 	0800
		LCALL 	551H 			//05E7 	3551
		XORWI 	1H 			//05E8 	2601
		BTSS 	STATUS,2 		//05E9 	1D03
		LJUMP 	5EDH 			//05EA 	3DED

		//;mpu6x.c: 14: swI2C_Stop();
		LCALL 	6CFH 			//05EB 	36CF
		ORG		05ECH

		//;mpu6x.c: 15: return 3;
		RETW 	3H 			//05EC 	2103
		INCR	29H,1 			//05ED 	09A9
		LJUMP 	5D6H 			//05EE 	3DD6

		//;mpu6x.c: 16: }
		//;mpu6x.c: 17: }
		//;mpu6x.c: 18: swI2C_Stop();
		LCALL 	6CFH 			//05EF 	36CF

		//;mpu6x.c: 19: return 0;
		RETW 	0H 			//05F0 	2100

		//;SWI2C.C: 10: TRISA &=0xbf;;
		BSR 	STATUS,5 		//05F1 	1A83
		BCR 	5H,6 			//05F2 	1305

		//;SWI2C.C: 11: TRISA &=0x7f;;
		BCR 	5H,7 			//05F3 	1385
		ORG		05F4H

		//;SWI2C.C: 12: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05F4 	2A05
		BCR 	STATUS,5 		//05F5 	1283
		STR 	20H 			//05F6 	01A0
		DECRSZ 	20H,1 		//05F7 	0EA0
		LJUMP 	5F7H 			//05F8 	3DF7
		LDWI 	5H 			//05F9 	2A05

		//;SWI2C.C: 13: RA7 = 1;
		BCR 	STATUS,5 		//05FA 	1283
		BSR 	5H,7 			//05FB 	1B85
		ORG		05FCH
		BSR 	5H,6 			//05FC 	1B05

		//;SWI2C.C: 15: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05FD 	01A0
		DECRSZ 	20H,1 		//05FE 	0EA0
		LJUMP 	5FEH 			//05FF 	3DFE

		//;SWI2C.C: 16: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0600 	2A05
		BCR 	STATUS,5 		//0601 	1283
		STR 	20H 			//0602 	01A0
		DECRSZ 	20H,1 		//0603 	0EA0
		ORG		0604H
		LJUMP 	603H 			//0604 	3E03

		//;SWI2C.C: 17: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0605 	2A05
		BCR 	STATUS,5 		//0606 	1283
		STR 	20H 			//0607 	01A0
		DECRSZ 	20H,1 		//0608 	0EA0
		LJUMP 	608H 			//0609 	3E08

		//;SWI2C.C: 18: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//060A 	2A05
		BCR 	STATUS,5 		//060B 	1283
		ORG		060CH
		STR 	20H 			//060C 	01A0
		DECRSZ 	20H,1 		//060D 	0EA0
		LJUMP 	60DH 			//060E 	3E0D
		RET		 					//060F 	0004

		//;sysinit.c: 88: INTCON = 0B00000000;
		CLRR 	INTCON 			//0610 	010B

		//;sysinit.c: 89: PIE1 = 0B00000000;
		BSR 	STATUS,5 		//0611 	1A83
		CLRR 	CH 			//0612 	010C

		//;sysinit.c: 90: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//0613 	1283
		ORG		0614H
		CLRR 	CH 			//0614 	010C

		//;sysinit.c: 92: IOCA5 = 1;
		BSR 	STATUS,5 		//0615 	1A83
		BSR 	16H,5 			//0616 	1A96

		//;sysinit.c: 93: tmp = PORTA;
		BCR 	STATUS,5 		//0617 	1283
		LDR 	5H,0 			//0618 	0805

		//;sysinit.c: 94: PAIF = 0;
		BCR 	INTCON,0 		//0619 	100B

		//;sysinit.c: 95: PAIE = 0;
		BCR 	INTCON,3 		//061A 	118B

		//;sysinit.c: 98: INTEDG = 0;
		BSR 	STATUS,5 		//061B 	1A83
		ORG		061CH
		BCR 	1H,6 			//061C 	1301

		//;sysinit.c: 99: INTF = 0;
		BCR 	INTCON,1 		//061D 	108B

		//;sysinit.c: 100: INTE = 1;
		BSR 	INTCON,4 		//061E 	1A0B

		//;sysinit.c: 102: TMR2IF = 0;
		BCR 	STATUS,5 		//061F 	1283
		BCR 	CH,1 			//0620 	108C

		//;sysinit.c: 103: TMR2IE = 1;
		BSR 	STATUS,5 		//0621 	1A83
		BSR 	CH,1 			//0622 	188C

		//;sysinit.c: 104: TMR2ON = 0;
		BCR 	STATUS,5 		//0623 	1283
		ORG		0624H
		BCR 	12H,2 			//0624 	1112

		//;sysinit.c: 110: T0IF = 0;
		BCR 	INTCON,2 		//0625 	110B

		//;sysinit.c: 111: T0IE = 1;
		BSR 	INTCON,5 		//0626 	1A8B

		//;sysinit.c: 112: T0ON = 1;
		BSR 	1FH,3 			//0627 	199F

		//;sysinit.c: 114: PEIE = 1;
		BSR 	INTCON,6 		//0628 	1B0B

		//;sysinit.c: 116: GIE = 1;
		BSR 	INTCON,7 		//0629 	1B8B
		RET		 					//062A 	0004
		STR 	21H 			//062B 	01A1
		ORG		062CH

		//;smartkey.C: 206: GIE = 0;
		BCR 	INTCON,7 		//062C 	138B

		//;smartkey.C: 207: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//062D 	1F8B
		LJUMP 	631H 			//062E 	3E31
		CLRWDT	 			//062F 	0001
		LJUMP 	62DH 			//0630 	3E2D

		//;smartkey.C: 208: EEADR = EEAddr;
		BCR 	STATUS,5 		//0631 	1283
		LDR 	21H,0 			//0632 	0821
		BSR 	STATUS,5 		//0633 	1A83
		ORG		0634H
		STR 	1BH 			//0634 	019B

		//;smartkey.C: 209: EEDAT = EEData;
		BCR 	STATUS,5 		//0635 	1283
		LDR 	20H,0 			//0636 	0820
		BSR 	STATUS,5 		//0637 	1A83
		STR 	1AH 			//0638 	019A
		LDWI 	34H 			//0639 	2A34

		//;smartkey.C: 210: EEIF = 0;
		BCR 	STATUS,5 		//063A 	1283
		BCR 	CH,7 			//063B 	138C
		ORG		063CH

		//;smartkey.C: 211: EECON1 = 0x34;
		BSR 	STATUS,5 		//063C 	1A83
		STR 	1CH 			//063D 	019C

		//;smartkey.C: 212: WR = 1;
		BSR 	1DH,0 			//063E 	181D

		//;smartkey.C: 213: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//063F 	1A83
		BTSS 	1DH,0 			//0640 	1C1D
		LJUMP 	644H 			//0641 	3E44
		CLRWDT	 			//0642 	0001
		LJUMP 	63FH 			//0643 	3E3F
		ORG		0644H

		//;smartkey.C: 215: GIE = 1;
		BSR 	INTCON,7 		//0644 	1B8B
		RET		 					//0645 	0004
		STR 	76H 			//0646 	01F6

		//;smartkey.C: 206: GIE = 0;
		BCR 	INTCON,7 		//0647 	138B

		//;smartkey.C: 207: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//0648 	1F8B
		LJUMP 	64CH 			//0649 	3E4C
		CLRWDT	 			//064A 	0001
		LJUMP 	648H 			//064B 	3E48
		ORG		064CH

		//;smartkey.C: 208: EEADR = EEAddr;
		LDR 	76H,0 			//064C 	0876
		BSR 	STATUS,5 		//064D 	1A83
		STR 	1BH 			//064E 	019B

		//;smartkey.C: 209: EEDAT = EEData;
		LDR 	75H,0 			//064F 	0875
		STR 	1AH 			//0650 	019A
		LDWI 	34H 			//0651 	2A34

		//;smartkey.C: 210: EEIF = 0;
		BCR 	STATUS,5 		//0652 	1283
		BCR 	CH,7 			//0653 	138C
		ORG		0654H

		//;smartkey.C: 211: EECON1 = 0x34;
		BSR 	STATUS,5 		//0654 	1A83
		STR 	1CH 			//0655 	019C

		//;smartkey.C: 212: WR = 1;
		BSR 	1DH,0 			//0656 	181D

		//;smartkey.C: 213: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//0657 	1A83
		BTSS 	1DH,0 			//0658 	1C1D
		LJUMP 	65CH 			//0659 	3E5C
		CLRWDT	 			//065A 	0001
		LJUMP 	657H 			//065B 	3E57
		ORG		065CH

		//;smartkey.C: 215: GIE = 1;
		BSR 	INTCON,7 		//065C 	1B8B
		RET		 					//065D 	0004
		STR 	25H 			//065E 	01A5

		//;smartkey.C: 177: {
		//;smartkey.C: 178: while(rep--){
		DECR 	24H,1 			//065F 	0DA4
		LDR 	24H,0 			//0660 	0824
		XORWI 	FFH 			//0661 	26FF
		BTSC 	STATUS,2 		//0662 	1503
		RET		 					//0663 	0004
		ORG		0664H
		LDWI 	CH 			//0664 	2A0C

		//;smartkey.C: 179: TMR2ON = 1;
		BSR 	12H,2 			//0665 	1912

		//;smartkey.C: 180: PR2L = 12;
		BSR 	STATUS,5 		//0666 	1A83
		STR 	11H 			//0667 	0191

		//;smartkey.C: 181: delay_x10ms(delay);
		BCR 	STATUS,5 		//0668 	1283
		LDR 	25H,0 			//0669 	0825
		STR 	20H 			//066A 	01A0
		CLRR 	21H 			//066B 	0121
		ORG		066CH
		LCALL 	69DH 			//066C 	369D
		LDWI 	14H 			//066D 	2A14

		//;smartkey.C: 183: TMR2ON = 0;RA3 =0;
		BCR 	12H,2 			//066E 	1112
		BCR 	5H,3 			//066F 	1185

		//;smartkey.C: 184: delay_x10ms(20);
		STR 	20H 			//0670 	01A0
		CLRR 	21H 			//0671 	0121
		LCALL 	69DH 			//0672 	369D
		LJUMP 	65FH 			//0673 	3E5F
		ORG		0674H

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0674 	1283
		CLRR 	5H 			//0675 	0105

		//;sysinit.c: 35: TRISA = 0B00110111;
		LDWI 	37H 			//0676 	2A37
		BSR 	STATUS,5 		//0677 	1A83
		STR 	5H 			//0678 	0185

		//;sysinit.c: 36: WPUA = 0B11000000;
		LDWI 	C0H 			//0679 	2AC0
		STR 	15H 			//067A 	0195

		//;sysinit.c: 38: PORTC = 0B00000000;
		BCR 	STATUS,5 		//067B 	1283
		ORG		067CH
		CLRR 	7H 			//067C 	0107

		//;sysinit.c: 39: TRISC = 0B11111100;
		LDWI 	FCH 			//067D 	2AFC
		BSR 	STATUS,5 		//067E 	1A83
		STR 	7H 			//067F 	0187

		//;sysinit.c: 40: WPUC = 0B00000000;
		CLRR 	13H 			//0680 	0113

		//;sysinit.c: 42: PSRCA = 0B11111111;
		LDWI 	FFH 			//0681 	2AFF
		STR 	8H 			//0682 	0188

		//;sysinit.c: 43: PSRCC = 0B11111111;
		STR 	14H 			//0683 	0194
		ORG		0684H

		//;sysinit.c: 44: PSINKA = 0B11111111;
		STR 	17H 			//0684 	0197

		//;sysinit.c: 45: PSINKC = 0B11111111;
		STR 	1FH 			//0685 	019F

		//;sysinit.c: 47: MSCON = 0B00110000;
		LDWI 	30H 			//0686 	2A30
		BCR 	STATUS,5 		//0687 	1283
		STR 	1BH 			//0688 	019B
		RET		 					//0689 	0004
		LDWI 	5H 			//068A 	2A05

		//;SWI2C.C: 24: RA7 = 1;
		BSR 	5H,7 			//068B 	1B85
		ORG		068CH

		//;SWI2C.C: 26: RA6 = 1;
		BSR 	5H,6 			//068C 	1B05

		//;SWI2C.C: 27: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//068D 	01A0
		DECRSZ 	20H,1 		//068E 	0EA0
		LJUMP 	68EH 			//068F 	3E8E
		LDWI 	5H 			//0690 	2A05

		//;SWI2C.C: 28: RA6 = 0;
		BCR 	STATUS,5 		//0691 	1283
		BCR 	5H,6 			//0692 	1305

		//;SWI2C.C: 29: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0693 	01A0
		ORG		0694H
		DECRSZ 	20H,1 		//0694 	0EA0
		LJUMP 	694H 			//0695 	3E94
		LDWI 	5H 			//0696 	2A05

		//;SWI2C.C: 30: RA7 = 0;
		BCR 	STATUS,5 		//0697 	1283
		BCR 	5H,7 			//0698 	1385

		//;SWI2C.C: 31: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0699 	01A0
		DECRSZ 	20H,1 		//069A 	0EA0
		LJUMP 	69AH 			//069B 	3E9A
		ORG		069CH
		RET		 					//069C 	0004

		//;smartkey.C: 165: unsigned int set = t + timeTick;
		LDR 	21H,0 			//069D 	0821
		STR 	23H 			//069E 	01A3
		LDR 	20H,0 			//069F 	0820
		STR 	22H 			//06A0 	01A2
		LDR 	70H,0 			//06A1 	0870
		ADDWR 	22H,1 			//06A2 	0BA2
		BTSC 	STATUS,0 		//06A3 	1403
		ORG		06A4H
		INCR	23H,1 			//06A4 	09A3
		LDR 	71H,0 			//06A5 	0871
		ADDWR 	23H,1 			//06A6 	0BA3

		//;smartkey.C: 166: while(timeTick < set);
		LDR 	23H,0 			//06A7 	0823
		SUBWR 	71H,0 			//06A8 	0C71
		BTSS 	STATUS,2 		//06A9 	1D03
		LJUMP 	6ADH 			//06AA 	3EAD
		LDR 	22H,0 			//06AB 	0822
		ORG		06ACH
		SUBWR 	70H,0 			//06AC 	0C70
		BTSC 	STATUS,0 		//06AD 	1403
		RET		 					//06AE 	0004
		LJUMP 	6A7H 			//06AF 	3EA7

		//;sysinit.c: 60: T0CON0 = 0B00000000;
		CLRR 	1FH 			//06B0 	011F

		//;sysinit.c: 61: OPTION = 0B00000111;
		LDWI 	7H 			//06B1 	2A07
		BSR 	STATUS,5 		//06B2 	1A83
		STR 	1H 			//06B3 	0181
		ORG		06B4H

		//;sysinit.c: 62: TMR0 = 179;
		LDWI 	B3H 			//06B4 	2AB3
		BCR 	STATUS,5 		//06B5 	1283
		STR 	1H 			//06B6 	0181

		//;sysinit.c: 64: TMR2H = 0;
		CLRR 	13H 			//06B7 	0113

		//;sysinit.c: 65: TMR2L = 0;
		CLRR 	11H 			//06B8 	0111

		//;sysinit.c: 66: PR2H = 0;
		BSR 	STATUS,5 		//06B9 	1A83
		CLRR 	12H 			//06BA 	0112

		//;sysinit.c: 67: PR2L =0;
		CLRR 	11H 			//06BB 	0111
		ORG		06BCH

		//;sysinit.c: 68: T2CON0 = 0B00101001;
		LDWI 	29H 			//06BC 	2A29
		BCR 	STATUS,5 		//06BD 	1283
		STR 	12H 			//06BE 	0192
		RET		 					//06BF 	0004
		CLRR 	70H 			//06C0 	0170
		CLRR 	71H 			//06C1 	0171
		CLRR 	72H 			//06C2 	0172
		CLRR 	73H 			//06C3 	0173
		ORG		06C4H
		CLRR 	74H 			//06C4 	0174
		CLRR 	45H 			//06C5 	0145
		CLRR 	46H 			//06C6 	0146
		CLRR 	47H 			//06C7 	0147
		CLRR 	48H 			//06C8 	0148
		CLRR 	49H 			//06C9 	0149
		CLRR 	4AH 			//06CA 	014A
		CLRR 	4BH 			//06CB 	014B
		ORG		06CCH
		CLRR 	4CH 			//06CC 	014C
		CLRR 	STATUS 			//06CD 	0103
		LJUMP 	0BH 			//06CE 	380B
		LDWI 	5H 			//06CF 	2A05

		//;SWI2C.C: 37: RA6 = 0;
		BCR 	5H,6 			//06D0 	1305

		//;SWI2C.C: 38: RA7 = 1;
		BSR 	5H,7 			//06D1 	1B85

		//;SWI2C.C: 39: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//06D2 	01A0
		DECRSZ 	20H,1 		//06D3 	0EA0
		ORG		06D4H
		LJUMP 	6D3H 			//06D4 	3ED3
		LDWI 	5H 			//06D5 	2A05

		//;SWI2C.C: 40: RA6 = 1;
		BCR 	STATUS,5 		//06D6 	1283
		BSR 	5H,6 			//06D7 	1B05

		//;SWI2C.C: 41: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//06D8 	01A0
		DECRSZ 	20H,1 		//06D9 	0EA0
		LJUMP 	6D9H 			//06DA 	3ED9
		RET		 					//06DB 	0004
		ORG		06DCH
		BCR 	STATUS,5 		//06DC 	1283
		STR 	20H 			//06DD 	01A0

		//;smartkey.C: 195: unsigned char ReEepromData;
		//;smartkey.C: 197: EEADR = EEAddr;
		BSR 	STATUS,5 		//06DE 	1A83
		STR 	1BH 			//06DF 	019B

		//;smartkey.C: 198: RD = 1;
		BSR 	1CH,0 			//06E0 	181C

		//;smartkey.C: 199: ReEepromData = EEDAT;
		LDR 	1AH,0 			//06E1 	081A
		BCR 	STATUS,5 		//06E2 	1283
		STR 	21H 			//06E3 	01A1
		ORG		06E4H

		//;smartkey.C: 200: RD = 0;
		BSR 	STATUS,5 		//06E4 	1A83
		BCR 	1CH,0 			//06E5 	101C

		//;smartkey.C: 201: return ReEepromData;
		BCR 	STATUS,5 		//06E6 	1283
		LDR 	21H,0 			//06E7 	0821
		RET		 					//06E8 	0004
		STR 	22H 			//06E9 	01A2

		//;smartkey.C: 221: mtOldState = mtState;
		LDR 	74H,0 			//06EA 	0874
		STR 	4CH 			//06EB 	01CC
		ORG		06ECH

		//;smartkey.C: 222: mtState = stt;
		LDR 	22H,0 			//06EC 	0822
		STR 	74H 			//06ED 	01F4

		//;smartkey.C: 223: timeTick =0;
		CLRR 	70H 			//06EE 	0170
		CLRR 	71H 			//06EF 	0171

		//;smartkey.C: 224: timeOut = _tOut;
		LDR 	21H,0 			//06F0 	0821
		STR 	48H 			//06F1 	01C8
		LDR 	20H,0 			//06F2 	0820
		STR 	47H 			//06F3 	01C7
		ORG		06F4H
		RET		 					//06F4 	0004

		//;sysinit.c: 21: OSCCON = 0B01010001;
		LDWI 	51H 			//06F5 	2A51
		BSR 	STATUS,5 		//06F6 	1A83
		STR 	FH 			//06F7 	018F

		//;sysinit.c: 22: _nop();
		NOP		 					//06F8 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//06F9 	1A83
		BTSC 	FH,2 			//06FA 	150F
		RET		 					//06FB 	0004
		ORG		06FCH
		LJUMP 	6F9H 			//06FC 	3EF9
		STR 	75H 			//06FD 	01F5

		//;smartkey.C: 195: unsigned char ReEepromData;
		//;smartkey.C: 197: EEADR = EEAddr;
		BSR 	STATUS,5 		//06FE 	1A83
		STR 	1BH 			//06FF 	019B

		//;smartkey.C: 198: RD = 1;
		BSR 	1CH,0 			//0700 	181C

		//;smartkey.C: 199: ReEepromData = EEDAT;
		LDR 	1AH,0 			//0701 	081A
		STR 	76H 			//0702 	01F6

		//;smartkey.C: 200: RD = 0;
		BCR 	1CH,0 			//0703 	101C
		ORG		0704H

		//;smartkey.C: 201: return ReEepromData;
		RET		 					//0704 	0004
		LJUMP 	285H 			//0705 	3A85
		LJUMP 	1BEH 			//0706 	39BE
		LJUMP 	1C5H 			//0707 	39C5
		LJUMP 	20EH 			//0708 	3A0E
		LJUMP 	22FH 			//0709 	3A2F

		//;smartkey.C: 173: TMR2ON = 1;
		BCR 	STATUS,5 		//070A 	1283
		BSR 	12H,2 			//070B 	1912
		ORG		070CH

		//;smartkey.C: 174: TRISA &= 0xf7;
		BSR 	STATUS,5 		//070C 	1A83
		BCR 	5H,3 			//070D 	1185
		RET		 					//070E 	0004

		//;smartkey.C: 170: TMR2ON = 0;RA3 =0;TRISA |= 0x08;
		BCR 	12H,2 			//070F 	1112
		BCR 	5H,3 			//0710 	1185
		BSR 	STATUS,5 		//0711 	1A83
		BSR 	5H,3 			//0712 	1985
		RET		 					//0713 	0004
			END

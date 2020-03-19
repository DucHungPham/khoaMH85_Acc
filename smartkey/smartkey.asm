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
		LJUMP 	3E8H 			//0009 	3BE8
		LJUMP 	6A6H 			//000A 	3EA6

		//;smartkey.C: 251: unsigned char reAlertOn=0,tmp8,isSw=0,isFall=0,mpuOk=0,vibrateOn=0,acc
		//+                          Set=0;
		CLRR 	3FH 			//000B 	013F
		ORG		000CH
		CLRR 	40H 			//000C 	0140
		CLRR 	32H 			//000D 	0132
		CLRR 	31H 			//000E 	0131

		//;smartkey.C: 252: unsigned int isWait =0;
		CLRR 	2FH 			//000F 	012F
		CLRR 	30H 			//0010 	0130

		//;smartkey.C: 253: signed int acYsum=0,acXsum=0;
		CLRR 	3BH 			//0011 	013B
		CLRR 	3CH 			//0012 	013C
		CLRR 	3DH 			//0013 	013D
		ORG		0014H
		CLRR 	3EH 			//0014 	013E

		//;smartkey.C: 254: unsigned int tmp16=0;
		CLRR 	42H 			//0015 	0142
		CLRR 	43H 			//0016 	0143
		CLRWDT	 			//0017 	0001

		//;smartkey.C: 260: sys_init();
		LCALL 	6DBH 			//0018 	36DB

		//;smartkey.C: 261: gpio_init();
		LCALL 	65AH 			//0019 	365A

		//;smartkey.C: 262: timer_init();
		LCALL 	696H 			//001A 	3696

		//;smartkey.C: 263: int_init();
		LCALL 	5F6H 			//001B 	35F6
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
		LCALL 	5D7H 			//0028 	35D7
		LDWI 	0H 			//0029 	2A00

		//;smartkey.C: 277: setState(0,0);
		BCR 	STATUS,5 		//002A 	1283
		CLRR 	20H 			//002B 	0120
		ORG		002CH
		CLRR 	21H 			//002C 	0121
		LCALL 	6CFH 			//002D 	36CF

		//;smartkey.C: 279: WRITE_EEPROM(0xFF,0xAA);
		LDWI 	AAH 			//002E 	2AAA
		STR 	20H 			//002F 	01A0
		LDWI 	FFH 			//0030 	2AFF
		LCALL 	611H 			//0031 	3611

		//;smartkey.C: 280: WRITE_EEPROM(0xFF,0xAA);
		LDWI 	AAH 			//0032 	2AAA
		BCR 	STATUS,5 		//0033 	1283
		ORG		0034H
		STR 	20H 			//0034 	01A0
		LDWI 	FFH 			//0035 	2AFF
		LCALL 	611H 			//0036 	3611

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
		LCALL 	6C2H 			//0046 	36C2
		STR 	44H 			//0047 	01C4

		//;smartkey.C: 286: if(tmp8==0xff) {WRITE_EEPROM(0x08,0);_delay((unsigned long)((2)*(40000
		//+                          00/4000.0)));}
		XORWI 	FFH 			//0048 	26FF
		BTSS 	STATUS,2 		//0049 	1D03
		LJUMP 	58H 			//004A 	3858
		LDWI 	8H 			//004B 	2A08
		ORG		004CH
		CLRR 	20H 			//004C 	0120
		LCALL 	611H 			//004D 	3611
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
		LCALL 	6CFH 			//0063 	36CF
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
		LCALL 	6F0H 			//0071 	36F0

		//;smartkey.C: 295: } else {
		LJUMP 	7AH 			//0072 	387A

		//;smartkey.C: 296: setState(2,400);
		LDWI 	90H 			//0073 	2A90
		ORG		0074H
		STR 	20H 			//0074 	01A0
		LDWI 	1H 			//0075 	2A01
		STR 	21H 			//0076 	01A1
		LDWI 	2H 			//0077 	2A02
		LCALL 	6CFH 			//0078 	36CF

		//;smartkey.C: 298: mtOldState = 0;
		CLRR 	4CH 			//0079 	014C

		//;smartkey.C: 300: }
		//;smartkey.C: 303: tmp8 = READ_EEPROM(0x40);
		LDWI 	40H 			//007A 	2A40
		LCALL 	6C2H 			//007B 	36C2
		ORG		007CH
		STR 	44H 			//007C 	01C4

		//;smartkey.C: 304: if(tmp8==8){
		XORWI 	8H 			//007D 	2608
		BTSS 	STATUS,2 		//007E 	1D03
		LJUMP 	A4H 			//007F 	38A4

		//;smartkey.C: 305: tmp8= READ_EEPROM(0x41);
		LDWI 	41H 			//0080 	2A41
		LCALL 	6C2H 			//0081 	36C2
		STR 	44H 			//0082 	01C4
		LDWI 	19H 			//0083 	2A19
		ORG		0084H

		//;smartkey.C: 306: beep(25,1);
		CLRR 	24H 			//0084 	0124
		INCR	24H,1 			//0085 	09A4
		LCALL 	644H 			//0086 	3644

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
		LCALL 	611H 			//0094 	3611
		LDWI 	40H 			//0095 	2A40

		//;smartkey.C: 313: }
		//;smartkey.C: 314: WRITE_EEPROM(0x40,0);
		BCR 	STATUS,5 		//0096 	1283
		CLRR 	20H 			//0097 	0120
		LCALL 	611H 			//0098 	3611

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
		LCALL 	611H 			//00AA 	3611

		//;smartkey.C: 320: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//00AB 	2A41
		ORG		00ACH
		LCALL 	6C2H 			//00AC 	36C2
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
		LCALL 	611H 			//00CB 	3611
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
		LCALL 	5AFH 			//00DA 	35AF
		IORWI 	0H 			//00DB 	2500
		ORG		00DCH

		//;smartkey.C: 333: mpuOk =1;
		BCR 	STATUS,5 		//00DC 	1283
		BTSS 	STATUS,2 		//00DD 	1D03
		LJUMP 	E2H 			//00DE 	38E2
		CLRR 	41H 			//00DF 	0141
		INCR	41H,1 			//00E0 	09C1
		LJUMP 	E3H 			//00E1 	38E3

		//;smartkey.C: 334: else
		//;smartkey.C: 335: mpuOk =0;
		CLRR 	41H 			//00E2 	0141

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
		LDR 	41H,1 			//00ED 	08C1
		BTSS 	STATUS,2 		//00EE 	1D03
		LJUMP 	F4H 			//00EF 	38F4
		LDWI 	2H 			//00F0 	2A02
		STR 	24H 			//00F1 	01A4
		LDWI 	AH 			//00F2 	2A0A
		LCALL 	644H 			//00F3 	3644
		ORG		00F4H

		//;smartkey.C: 345: tmp8= READ_EEPROM(0x40);
		LDWI 	40H 			//00F4 	2A40
		LCALL 	6C2H 			//00F5 	36C2
		STR 	44H 			//00F6 	01C4

		//;smartkey.C: 346: if(tmp8==6 && mpuOk ==1)
		XORWI 	6H 			//00F7 	2606
		BTSS 	STATUS,2 		//00F8 	1D03
		LJUMP 	1A7H 			//00F9 	39A7
		DECRSZ 	41H,0 		//00FA 	0E41
		LJUMP 	1A7H 			//00FB 	39A7
		ORG		00FCH
		LDWI 	3H 			//00FC 	2A03

		//;smartkey.C: 347: {
		//;smartkey.C: 348: tmp8=0; beep(10,3);
		CLRR 	44H 			//00FD 	0144
		STR 	24H 			//00FE 	01A4
		LDWI 	AH 			//00FF 	2A0A
		LCALL 	644H 			//0100 	3644

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
		LCALL 	574H 			//010B 	3574
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
		ADDWR 	3DH,1 			//0115 	0BBD
		BTSC 	STATUS,0 		//0116 	1403
		INCR	3EH,1 			//0117 	09BE
		LDR 	2DH,0 			//0118 	082D
		ADDWR 	3EH,1 			//0119 	0BBE

		//;smartkey.C: 354: acYsum += buf[2];
		LDR 	37H,0 			//011A 	0837
		STR 	2CH 			//011B 	01AC
		ORG		011CH
		CLRR 	2DH 			//011C 	012D
		BTSC 	2CH,7 			//011D 	17AC
		DECR 	2DH,1 			//011E 	0DAD
		ADDWR 	3BH,1 			//011F 	0BBB
		BTSC 	STATUS,0 		//0120 	1403
		INCR	3CH,1 			//0121 	09BC
		LDR 	2DH,0 			//0122 	082D
		ADDWR 	3CH,1 			//0123 	0BBC
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
		LDR 	3EH,0 			//014B 	083E
		ORG		014CH
		STR 	23H 			//014C 	01A3
		LDR 	3DH,0 			//014D 	083D
		STR 	22H 			//014E 	01A2
		LCALL 	46EH 			//014F 	346E
		LDR 	21H,0 			//0150 	0821
		STR 	3EH 			//0151 	01BE
		LDR 	20H,0 			//0152 	0820
		STR 	3DH 			//0153 	01BD
		ORG		0154H

		//;smartkey.C: 364: acYsum = acYsum/10;
		LDWI 	AH 			//0154 	2A0A
		STR 	20H 			//0155 	01A0
		CLRR 	21H 			//0156 	0121
		LDR 	3CH,0 			//0157 	083C
		STR 	23H 			//0158 	01A3
		LDR 	3BH,0 			//0159 	083B
		STR 	22H 			//015A 	01A2
		LCALL 	46EH 			//015B 	346E
		ORG		015CH
		LDR 	21H,0 			//015C 	0821
		STR 	3CH 			//015D 	01BC
		LDR 	20H,0 			//015E 	0820
		STR 	3BH 			//015F 	01BB

		//;smartkey.C: 365: tmp16 = (signed int)tmp16/10;
		LDWI 	AH 			//0160 	2A0A
		STR 	20H 			//0161 	01A0
		CLRR 	21H 			//0162 	0121
		LDR 	43H,0 			//0163 	0843
		ORG		0164H
		STR 	23H 			//0164 	01A3
		LDR 	42H,0 			//0165 	0842
		STR 	22H 			//0166 	01A2
		LCALL 	46EH 			//0167 	346E
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
		LCALL 	644H 			//018A 	3644

		//;smartkey.C: 374: WRITE_EEPROM(0x10,(unsigned char)acXsum);
		LDR 	3DH,0 			//018B 	083D
		ORG		018CH
		STR 	20H 			//018C 	01A0
		LDWI 	10H 			//018D 	2A10
		LCALL 	611H 			//018E 	3611

		//;smartkey.C: 375: WRITE_EEPROM(0x11,(unsigned char)acYsum);
		BCR 	STATUS,5 		//018F 	1283
		LDR 	3BH,0 			//0190 	083B
		STR 	20H 			//0191 	01A0
		LDWI 	11H 			//0192 	2A11
		LCALL 	611H 			//0193 	3611
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
		LCALL 	644H 			//01A2 	3644
		LDWI 	40H 			//01A3 	2A40
		ORG		01A4H

		//;smartkey.C: 381: }
		//;smartkey.C: 382: WRITE_EEPROM(0x40,0);
		BCR 	STATUS,5 		//01A4 	1283
		CLRR 	20H 			//01A5 	0120
		LCALL 	611H 			//01A6 	3611

		//;smartkey.C: 384: }
		//;smartkey.C: 386: acXsum = (signed char)READ_EEPROM(0x10);
		LDWI 	10H 			//01A7 	2A10
		LCALL 	6C2H 			//01A8 	36C2
		STR 	3DH 			//01A9 	01BD
		CLRR 	3EH 			//01AA 	013E
		BTSC 	3DH,7 			//01AB 	17BD
		ORG		01ACH
		DECR 	3EH,1 			//01AC 	0DBE

		//;smartkey.C: 387: acYsum = (signed char)READ_EEPROM(0x11);
		LDWI 	11H 			//01AD 	2A11
		LCALL 	6C2H 			//01AE 	36C2
		STR 	3BH 			//01AF 	01BB
		CLRR 	3CH 			//01B0 	013C
		BTSC 	3BH,7 			//01B1 	17BB
		DECR 	3CH,1 			//01B2 	0DBC

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
		LCALL 	6C2H 			//01CF 	36C2
		XORWI 	CCH 			//01D0 	26CC
		BTSS 	STATUS,2 		//01D1 	1D03
		LJUMP 	1D6H 			//01D2 	39D6
		LDWI 	8H 			//01D3 	2A08
		ORG		01D4H
		CLRR 	20H 			//01D4 	0120
		LCALL 	611H 			//01D5 	3611

		//;smartkey.C: 437: if((mtOldState == 3)){
		BCR 	STATUS,5 		//01D6 	1283
		LDR 	4CH,0 			//01D7 	084C
		XORWI 	3H 			//01D8 	2603
		BTSS 	STATUS,2 		//01D9 	1D03
		LJUMP 	1E7H 			//01DA 	39E7

		//;smartkey.C: 438: beepOn();TMR2ON = 0; beep(10,1);
		LCALL 	6F0H 			//01DB 	36F0
		ORG		01DCH
		LDWI 	AH 			//01DC 	2A0A
		BCR 	STATUS,5 		//01DD 	1283
		BCR 	12H,2 			//01DE 	1112
		CLRR 	24H 			//01DF 	0124
		INCR	24H,1 			//01E0 	09A4
		LCALL 	644H 			//01E1 	3644

		//;smartkey.C: 439: if(reAlertOn)reAlertOn =0;
		LDR 	3FH,0 			//01E2 	083F
		BTSC 	STATUS,2 		//01E3 	1503
		ORG		01E4H
		LJUMP 	285H 			//01E4 	3A85
		CLRR 	3FH 			//01E5 	013F
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
		LCALL 	6CFH 			//01F4 	36CF

		//;smartkey.C: 444: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
		LDWI 	40H 			//01F5 	2A40
		LCALL 	6C2H 			//01F6 	36C2
		XORWI 	0H 			//01F7 	2600
		BTSC 	STATUS,2 		//01F8 	1503
		LJUMP 	1FDH 			//01F9 	39FD
		LDWI 	40H 			//01FA 	2A40
		CLRR 	20H 			//01FB 	0120
		ORG		01FCH
		LCALL 	611H 			//01FC 	3611

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
		LCALL 	644H 			//0209 	3644

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
		LCALL 	6F5H 			//0215 	36F5

		//;smartkey.C: 459: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LDWI 	8H 			//0216 	2A08
		LCALL 	6C2H 			//0217 	36C2
		XORWI 	CCH 			//0218 	26CC
		BTSS 	STATUS,2 		//0219 	1D03
		LJUMP 	21EH 			//021A 	3A1E
		LDWI 	8H 			//021B 	2A08
		ORG		021CH
		CLRR 	20H 			//021C 	0120
		LCALL 	611H 			//021D 	3611
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
		LCALL 	6CFH 			//0225 	36CF

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
		LCALL 	6F5H 			//022F 	36F5

		//;smartkey.C: 470: setState(2,300);
		LDWI 	2CH 			//0230 	2A2C
		BCR 	STATUS,5 		//0231 	1283
		STR 	20H 			//0232 	01A0
		LDWI 	1H 			//0233 	2A01
		ORG		0234H
		STR 	21H 			//0234 	01A1
		LDWI 	2H 			//0235 	2A02
		LCALL 	6CFH 			//0236 	36CF

		//;smartkey.C: 471: break;
		LJUMP 	285H 			//0237 	3A85
		LDR 	74H,0 			//0238 	0874
		STR 	FSR 			//0239 	0184
		LDWI 	5H 			//023A 	2A05
		SUBWR 	FSR,0 			//023B 	0C04
		ORG		023CH
		BTSC 	STATUS,0 		//023C 	1403
		LJUMP 	285H 			//023D 	3A85
		LDWI 	6H 			//023E 	2A06
		STR 	PCLATH 			//023F 	018A
		LDWI 	EBH 			//0240 	2AEB
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
		LCALL 	6C2H 			//024D 	36C2
		IORWI 	0H 			//024E 	2500
		BTSS 	STATUS,2 		//024F 	1D03
		LJUMP 	255H 			//0250 	3A55
		LDWI 	CCH 			//0251 	2ACC
		STR 	20H 			//0252 	01A0
		LDWI 	8H 			//0253 	2A08
		ORG		0254H
		LCALL 	611H 			//0254 	3611

		//;smartkey.C: 494: setState(3,1800);
		LDWI 	8H 			//0255 	2A08
		BCR 	STATUS,5 		//0256 	1283
		STR 	20H 			//0257 	01A0
		LDWI 	7H 			//0258 	2A07
		STR 	21H 			//0259 	01A1
		LDWI 	3H 			//025A 	2A03
		LCALL 	6CFH 			//025B 	36CF
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
		LCALL 	6F0H 			//0267 	36F0

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
		LCALL 	6F0H 			//026F 	36F0
		LDWI 	2H 			//0270 	2A02
		BCR 	STATUS,5 		//0271 	1283
		BCR 	12H,2 			//0272 	1112

		//;smartkey.C: 514: beep(10,2);
		STR 	24H 			//0273 	01A4
		ORG		0274H
		LDWI 	AH 			//0274 	2A0A
		LCALL 	644H 			//0275 	3644

		//;smartkey.C: 515: if(mtOldState == 3){reAlertOn =1;}
		LDR 	4CH,0 			//0276 	084C
		XORWI 	3H 			//0277 	2603
		BTSS 	STATUS,2 		//0278 	1D03
		LJUMP 	285H 			//0279 	3A85
		CLRR 	3FH 			//027A 	013F
		INCR	3FH,1 			//027B 	09BF
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
		LCALL 	6F5H 			//0293 	36F5
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
		LCALL 	6CFH 			//029B 	36CF
		ORG		029CH

		//;smartkey.C: 545: break;
		LJUMP 	2FCH 			//029C 	3AFC

		//;smartkey.C: 547: beepOff();
		LCALL 	6F5H 			//029D 	36F5

		//;smartkey.C: 548: delay_x10ms(20);
		LDWI 	14H 			//029E 	2A14
		BCR 	STATUS,5 		//029F 	1283
		STR 	20H 			//02A0 	01A0
		CLRR 	21H 			//02A1 	0121
		LCALL 	683H 			//02A2 	3683

		//;smartkey.C: 549: beepOn();TMR2ON = 0;reAlertOn =0;
		LCALL 	6F0H 			//02A3 	36F0
		ORG		02A4H
		LDWI 	1EH 			//02A4 	2A1E
		BCR 	STATUS,5 		//02A5 	1283
		BCR 	12H,2 			//02A6 	1112
		CLRR 	3FH 			//02A7 	013F
		CLRR 	24H 			//02A8 	0124
		INCR	24H,1 			//02A9 	09A4
		LCALL 	644H 			//02AA 	3644
		LDWI 	0H 			//02AB 	2A00
		ORG		02ACH

		//;smartkey.C: 551: setState(0,0);
		CLRR 	20H 			//02AC 	0120
		CLRR 	21H 			//02AD 	0121
		LCALL 	6CFH 			//02AE 	36CF

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
		LCALL 	6C2H 			//02B9 	36C2
		XORWI 	CCH 			//02BA 	26CC
		BTSS 	STATUS,2 		//02BB 	1D03
		ORG		02BCH
		LJUMP 	2C0H 			//02BC 	3AC0
		LDWI 	8H 			//02BD 	2A08
		CLRR 	20H 			//02BE 	0120
		LCALL 	611H 			//02BF 	3611

		//;smartkey.C: 559: if(reAlertOn){
		BCR 	STATUS,5 		//02C0 	1283
		LDR 	3FH,0 			//02C1 	083F
		BTSC 	STATUS,2 		//02C2 	1503
		LJUMP 	2D7H 			//02C3 	3AD7
		ORG		02C4H

		//;smartkey.C: 560: setState(4,6000);
		LDWI 	70H 			//02C4 	2A70
		STR 	20H 			//02C5 	01A0
		LDWI 	17H 			//02C6 	2A17
		STR 	21H 			//02C7 	01A1
		LDWI 	4H 			//02C8 	2A04
		LCALL 	6CFH 			//02C9 	36CF

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
		LCALL 	6F0H 			//02D5 	36F0

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
		LCALL 	644H 			//02DD 	3644
		LDWI 	40H 			//02DE 	2A40

		//;smartkey.C: 568: RegStatus |=(0x20);
		BSR 	49H,5 			//02DF 	1AC9

		//;smartkey.C: 571: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
		LCALL 	6C2H 			//02E0 	36C2
		XORWI 	0H 			//02E1 	2600
		BTSC 	STATUS,2 		//02E2 	1503
		LJUMP 	2E7H 			//02E3 	3AE7
		ORG		02E4H
		LDWI 	40H 			//02E4 	2A40
		CLRR 	20H 			//02E5 	0120
		LCALL 	611H 			//02E6 	3611

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
		LJUMP 	394H 			//0304 	3B94
		DECRSZ 	74H,0 		//0305 	0E74
		LJUMP 	394H 			//0306 	3B94
		DECRSZ 	41H,0 		//0307 	0E41
		LJUMP 	394H 			//0308 	3B94

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
		LCALL 	574H 			//0318 	3574
		IORWI 	0H 			//0319 	2500
		BTSS 	STATUS,2 		//031A 	1D03
		LJUMP 	394H 			//031B 	3B94
		ORG		031CH

		//;smartkey.C: 594: if(compe(buf[0], (signed char)acXsum,5) && compe(buf[2], (signed char)
		//+                          acYsum,5)){
		BCR 	STATUS,5 		//031C 	1283
		LDR 	3DH,0 			//031D 	083D
		STR 	20H 			//031E 	01A0
		LDWI 	5H 			//031F 	2A05
		STR 	21H 			//0320 	01A1
		LDR 	35H,0 			//0321 	0835
		LCALL 	4B3H 			//0322 	34B3
		XORWI 	0H 			//0323 	2600
		ORG		0324H
		BCR 	STATUS,5 		//0324 	1283
		BTSC 	STATUS,2 		//0325 	1503
		LJUMP 	345H 			//0326 	3B45
		LDR 	3BH,0 			//0327 	083B
		STR 	20H 			//0328 	01A0
		LDWI 	5H 			//0329 	2A05
		STR 	21H 			//032A 	01A1
		LDR 	37H,0 			//032B 	0837
		ORG		032CH
		LCALL 	4B3H 			//032C 	34B3
		XORWI 	0H 			//032D 	2600

		//;smartkey.C: 597: isSw++;
		BCR 	STATUS,5 		//032E 	1283
		BTSC 	STATUS,2 		//032F 	1503
		LJUMP 	345H 			//0330 	3B45
		LDWI 	2DH 			//0331 	2A2D
		INCR	40H,1 			//0332 	09C0

		//;smartkey.C: 598: if(isSw >44){
		SUBWR 	40H,0 			//0333 	0C40
		ORG		0334H
		BTSS 	STATUS,0 		//0334 	1C03
		LJUMP 	338H 			//0335 	3B38

		//;smartkey.C: 599: isSw =0;
		CLRR 	40H 			//0336 	0140
		LJUMP 	369H 			//0337 	3B69

		//;smartkey.C: 606: }
		//;smartkey.C: 604: setState(2,300);
		//;smartkey.C: 603: RegStatus &=(~0x20);
		//;smartkey.C: 600: vibrateOn=1;
		//;smartkey.C: 607: else if(isSw > 25){
		LDWI 	1AH 			//0338 	2A1A
		SUBWR 	40H,0 			//0339 	0C40
		BTSC 	STATUS,0 		//033A 	1403

		//;smartkey.C: 608: if(isSw%2==0){
		BTSC 	40H,0 			//033B 	1440
		ORG		033CH
		LJUMP 	372H 			//033C 	3B72

		//;smartkey.C: 609: beepOn();TMR2ON = 0; beep(7,1);
		LCALL 	6F0H 			//033D 	36F0
		LDWI 	7H 			//033E 	2A07
		BCR 	STATUS,5 		//033F 	1283
		BCR 	12H,2 			//0340 	1112
		CLRR 	24H 			//0341 	0124
		INCR	24H,1 			//0342 	09A4
		LCALL 	644H 			//0343 	3644
		ORG		0344H
		LJUMP 	372H 			//0344 	3B72

		//;smartkey.C: 614: else{
		//;smartkey.C: 615: isSw =0;
		//;smartkey.C: 610: }
		//;smartkey.C: 611: }
		//;smartkey.C: 613: }
		CLRR 	40H 			//0345 	0140

		//;smartkey.C: 618: if(compe(buf[0], acXOld,2) && compe(buf[2], acYOld,2)){
		LDR 	34H,0 			//0346 	0834
		STR 	20H 			//0347 	01A0
		LDWI 	2H 			//0348 	2A02
		STR 	21H 			//0349 	01A1
		LDR 	35H,0 			//034A 	0835
		LCALL 	4B3H 			//034B 	34B3
		ORG		034CH
		XORWI 	0H 			//034C 	2600
		BCR 	STATUS,5 		//034D 	1283
		BTSC 	STATUS,2 		//034E 	1503
		LJUMP 	373H 			//034F 	3B73
		LDR 	33H,0 			//0350 	0833
		STR 	20H 			//0351 	01A0
		LDWI 	2H 			//0352 	2A02
		STR 	21H 			//0353 	01A1
		ORG		0354H
		LDR 	37H,0 			//0354 	0837
		LCALL 	4B3H 			//0355 	34B3
		XORWI 	0H 			//0356 	2600

		//;smartkey.C: 619: isWait++;
		BCR 	STATUS,5 		//0357 	1283
		BTSC 	STATUS,2 		//0358 	1503
		LJUMP 	373H 			//0359 	3B73
		INCR	2FH,1 			//035A 	09AF
		BTSC 	STATUS,2 		//035B 	1503
		ORG		035CH
		INCR	30H,1 			//035C 	09B0

		//;smartkey.C: 620: if(isWait==450){
		DECR 	30H,0 			//035D 	0D30
		LDWI 	C2H 			//035E 	2AC2
		BTSC 	STATUS,2 		//035F 	1503
		XORWR 	2FH,0 			//0360 	042F
		BTSS 	STATUS,2 		//0361 	1D03
		LJUMP 	372H 			//0362 	3B72
		LDWI 	2H 			//0363 	2A02
		ORG		0364H

		//;smartkey.C: 621: isWait = 0;
		CLRR 	2FH 			//0364 	012F
		CLRR 	30H 			//0365 	0130

		//;smartkey.C: 622: beep(7,2);
		STR 	24H 			//0366 	01A4
		LDWI 	7H 			//0367 	2A07
		LCALL 	644H 			//0368 	3644
		LDWI 	2CH 			//0369 	2A2C

		//;smartkey.C: 623: vibrateOn=1;
		CLRR 	31H 			//036A 	0131
		INCR	31H,1 			//036B 	09B1
		ORG		036CH

		//;smartkey.C: 624: RegStatus &=(~0x20);
		BCR 	49H,5 			//036C 	12C9

		//;smartkey.C: 625: setState(2,300);
		STR 	20H 			//036D 	01A0
		LDWI 	1H 			//036E 	2A01
		STR 	21H 			//036F 	01A1
		LDWI 	2H 			//0370 	2A02
		LCALL 	6CFH 			//0371 	36CF

		//;smartkey.C: 626: }
		//;smartkey.C: 627: }
		//;smartkey.C: 629: }
		//;smartkey.C: 631: if( (buf[4] > -31) && (buf[4] < 31)) {
		BCR 	STATUS,5 		//0372 	1283
		LDR 	39H,0 			//0373 	0839
		ORG		0374H
		XORWI 	80H 			//0374 	2680
		ADDWI 	9EH 			//0375 	279E
		BTSS 	STATUS,0 		//0376 	1C03
		LJUMP 	38FH 			//0377 	3B8F
		LDR 	39H,0 			//0378 	0839
		XORWI 	80H 			//0379 	2680
		ADDWI 	61H 			//037A 	2761
		BTSC 	STATUS,0 		//037B 	1403
		ORG		037CH
		LJUMP 	38FH 			//037C 	3B8F
		LDWI 	5H 			//037D 	2A05

		//;smartkey.C: 632: isFall++;
		INCR	32H,1 			//037E 	09B2

		//;smartkey.C: 633: if(isFall >4){
		SUBWR 	32H,0 			//037F 	0C32
		BTSS 	STATUS,0 		//0380 	1C03
		LJUMP 	390H 			//0381 	3B90
		LDWI 	2H 			//0382 	2A02

		//;smartkey.C: 634: isFall =0;
		CLRR 	32H 			//0383 	0132
		ORG		0384H

		//;smartkey.C: 635: beep(7,2);
		STR 	24H 			//0384 	01A4
		LDWI 	7H 			//0385 	2A07
		LCALL 	644H 			//0386 	3644
		LDWI 	2CH 			//0387 	2A2C

		//;smartkey.C: 636: RegStatus &=(~0x20);
		BCR 	49H,5 			//0388 	12C9

		//;smartkey.C: 637: setState(2,300);
		STR 	20H 			//0389 	01A0
		LDWI 	1H 			//038A 	2A01
		STR 	21H 			//038B 	01A1
		ORG		038CH
		LDWI 	2H 			//038C 	2A02
		LCALL 	6CFH 			//038D 	36CF
		LJUMP 	390H 			//038E 	3B90

		//;smartkey.C: 640: else{
		//;smartkey.C: 641: isFall=0;
		CLRR 	32H 			//038F 	0132

		//;smartkey.C: 642: }
		//;smartkey.C: 644: acYOld = buf[2];acXOld = buf[0];
		LDR 	37H,0 			//0390 	0837
		STR 	33H 			//0391 	01B3
		LDR 	35H,0 			//0392 	0835
		STR 	34H 			//0393 	01B4
		ORG		0394H

		//;smartkey.C: 645: }
		//;smartkey.C: 647: }
		//;smartkey.C: 650: if((timeTick>tmp16) && (mtState == 0 ) && mpuOk ==1){
		LDR 	71H,0 			//0394 	0871
		BCR 	STATUS,5 		//0395 	1283
		SUBWR 	43H,0 			//0396 	0C43
		BTSS 	STATUS,2 		//0397 	1D03
		LJUMP 	39BH 			//0398 	3B9B
		LDR 	70H,0 			//0399 	0870
		SUBWR 	42H,0 			//039A 	0C42
		BTSC 	STATUS,0 		//039B 	1403
		ORG		039CH
		LJUMP 	3DFH 			//039C 	3BDF
		LDR 	74H,1 			//039D 	08F4
		BTSS 	STATUS,2 		//039E 	1D03
		LJUMP 	3DFH 			//039F 	3BDF
		DECRSZ 	41H,0 		//03A0 	0E41
		LJUMP 	3DFH 			//03A1 	3BDF

		//;smartkey.C: 652: if(timeTick >65000) timeTick =0;
		LDWI 	FDH 			//03A2 	2AFD
		SUBWR 	71H,0 			//03A3 	0C71
		ORG		03A4H
		LDWI 	E9H 			//03A4 	2AE9
		BTSC 	STATUS,2 		//03A5 	1503
		SUBWR 	70H,0 			//03A6 	0C70
		BTSS 	STATUS,0 		//03A7 	1C03
		LJUMP 	3ABH 			//03A8 	3BAB
		CLRR 	70H 			//03A9 	0170
		CLRR 	71H 			//03AA 	0171

		//;smartkey.C: 653: tmp16 = timeTick+40;
		LDR 	71H,0 			//03AB 	0871
		ORG		03ACH
		STR 	43H 			//03AC 	01C3
		LDR 	70H,0 			//03AD 	0870
		STR 	42H 			//03AE 	01C2
		LDWI 	28H 			//03AF 	2A28
		ADDWR 	42H,1 			//03B0 	0BC2
		BTSC 	STATUS,0 		//03B1 	1403
		INCR	43H,1 			//03B2 	09C3

		//;smartkey.C: 655: if(AccRead(0x3b,buf,6)==0){
		LDWI 	35H 			//03B3 	2A35
		ORG		03B4H
		STR 	24H 			//03B4 	01A4
		LDWI 	0H 			//03B5 	2A00
		STR 	25H 			//03B6 	01A5
		LDWI 	6H 			//03B7 	2A06
		STR 	26H 			//03B8 	01A6
		LDWI 	3BH 			//03B9 	2A3B
		LCALL 	574H 			//03BA 	3574
		IORWI 	0H 			//03BB 	2500
		ORG		03BCH

		//;smartkey.C: 657: if(vibrateOn==1){
		BCR 	STATUS,5 		//03BC 	1283
		BTSS 	STATUS,2 		//03BD 	1D03
		LJUMP 	3E0H 			//03BE 	3BE0
		DECRSZ 	31H,0 		//03BF 	0E31
		LJUMP 	3DFH 			//03C0 	3BDF

		//;smartkey.C: 658: if(compe(buf[0],acXOld ,3) && compe(buf[2],acYOld ,3)){
		LDR 	34H,0 			//03C1 	0834
		STR 	20H 			//03C2 	01A0
		LDWI 	3H 			//03C3 	2A03
		ORG		03C4H
		STR 	21H 			//03C4 	01A1
		LDR 	35H,0 			//03C5 	0835
		LCALL 	4B3H 			//03C6 	34B3
		XORWI 	0H 			//03C7 	2600
		BCR 	STATUS,5 		//03C8 	1283
		BTSC 	STATUS,2 		//03C9 	1503
		LJUMP 	3D7H 			//03CA 	3BD7
		LDR 	33H,0 			//03CB 	0833
		ORG		03CCH
		STR 	20H 			//03CC 	01A0
		LDWI 	3H 			//03CD 	2A03
		STR 	21H 			//03CE 	01A1
		LDR 	37H,0 			//03CF 	0837
		LCALL 	4B3H 			//03D0 	34B3
		XORWI 	0H 			//03D1 	2600

		//;smartkey.C: 660: isSw=0;
		BCR 	STATUS,5 		//03D2 	1283
		BTSC 	STATUS,2 		//03D3 	1503
		ORG		03D4H
		LJUMP 	3D7H 			//03D4 	3BD7
		CLRR 	40H 			//03D5 	0140

		//;smartkey.C: 663: }
		LJUMP 	3DFH 			//03D6 	3BDF

		//;smartkey.C: 664: else{
		//;smartkey.C: 665: isSw++;
		INCR	40H,1 			//03D7 	09C0

		//;smartkey.C: 668: {
		//;smartkey.C: 669: beepOn();TMR2ON = 0; beep(7,3);
		LCALL 	6F0H 			//03D8 	36F0
		LDWI 	3H 			//03D9 	2A03
		BCR 	STATUS,5 		//03DA 	1283
		BCR 	12H,2 			//03DB 	1112
		ORG		03DCH
		STR 	24H 			//03DC 	01A4
		LDWI 	7H 			//03DD 	2A07
		LCALL 	644H 			//03DE 	3644

		//;smartkey.C: 670: }
		//;smartkey.C: 671: }
		//;smartkey.C: 672: }
		//;smartkey.C: 674: }
		//;smartkey.C: 677: }
		//;smartkey.C: 679: if(RegStatus & 0x20) {RC0 =1;RC1 =1;}
		BCR 	STATUS,5 		//03DF 	1283
		BTSS 	49H,5 			//03E0 	1EC9
		LJUMP 	3E5H 			//03E1 	3BE5
		BSR 	7H,0 			//03E2 	1807
		BSR 	7H,1 			//03E3 	1887
		ORG		03E4H
		LJUMP 	1B5H 			//03E4 	39B5

		//;smartkey.C: 680: else {RC0 =0;RC1 =0;}
		BCR 	7H,0 			//03E5 	1007
		BCR 	7H,1 			//03E6 	1087
		LJUMP 	1B5H 			//03E7 	39B5

		//;smartkey.C: 42: if(PAIE&&PAIF){
		BTSC 	INTCON,3 		//03E8 	158B
		BTSS 	INTCON,0 		//03E9 	1C0B
		LJUMP 	3F9H 			//03EA 	3BF9

		//;smartkey.C: 44: tmp = PORTA;
		BCR 	STATUS,5 		//03EB 	1283
		ORG		03ECH
		LDR 	5H,0 			//03EC 	0805

		//;smartkey.C: 45: PAIF = 0;
		BCR 	INTCON,0 		//03ED 	100B

		//;smartkey.C: 47: if(RA5){
		BTSS 	5H,5 			//03EE 	1E85
		LJUMP 	3F8H 			//03EF 	3BF8

		//;smartkey.C: 49: if(mode_chek == 0){
		LDR 	73H,1 			//03F0 	08F3
		BTSS 	STATUS,2 		//03F1 	1D03
		LJUMP 	3F9H 			//03F2 	3BF9

		//;smartkey.C: 50: cntCyc = 0;
		CLRR 	72H 			//03F3 	0172
		ORG		03F4H

		//;smartkey.C: 51: cntOff = 0;
		CLRR 	4AH 			//03F4 	014A

		//;smartkey.C: 53: mode_chek = 1;
		CLRR 	73H 			//03F5 	0173
		INCR	73H,1 			//03F6 	09F3
		LJUMP 	3F9H 			//03F7 	3BF9

		//;smartkey.C: 58: else{
		//;smartkey.C: 59: cntOff = 0;
		CLRR 	4AH 			//03F8 	014A

		//;smartkey.C: 61: }
		//;smartkey.C: 63: }
		//;smartkey.C: 66: if(INTE&&INTF){
		BTSC 	INTCON,4 		//03F9 	160B
		BTSS 	INTCON,1 		//03FA 	1C8B
		LJUMP 	40FH 			//03FB 	3C0F
		ORG		03FCH

		//;smartkey.C: 67: unsigned char tmp;
		//;smartkey.C: 68: INTF = 0;
		BCR 	INTCON,1 		//03FC 	108B

		//;smartkey.C: 70: if( RA2==0){
		BCR 	STATUS,5 		//03FD 	1283
		BTSC 	5H,2 			//03FE 	1505
		LJUMP 	40FH 			//03FF 	3C0F

		//;smartkey.C: 72: if(timeTick <0x20){
		LDWI 	0H 			//0400 	2A00
		SUBWR 	71H,0 			//0401 	0C71
		LDWI 	20H 			//0402 	2A20
		BTSC 	STATUS,2 		//0403 	1503
		ORG		0404H
		SUBWR 	70H,0 			//0404 	0C70
		BTSC 	STATUS,0 		//0405 	1403
		LJUMP 	40EH 			//0406 	3C0E

		//;smartkey.C: 73: tmp = READ_EEPROM(0x40);
		LDWI 	40H 			//0407 	2A40
		LCALL 	6E3H 			//0408 	36E3
		STR 	79H 			//0409 	01F9

		//;smartkey.C: 74: WRITE_EEPROM(0x40,tmp+1);
		INCR	79H,0 			//040A 	0979
		STR 	75H 			//040B 	01F5
		ORG		040CH
		LDWI 	40H 			//040C 	2A40
		LCALL 	62CH 			//040D 	362C
		LJUMP 	40EH 			//040E 	3C0E

		//;smartkey.C: 83: }
		//;smartkey.C: 85: }
		//;smartkey.C: 88: if (T0IE && T0IF) {
		BTSC 	INTCON,5 		//040F 	168B
		BTSS 	INTCON,2 		//0410 	1D0B
		LJUMP 	45EH 			//0411 	3C5E
		LDWI 	B3H 			//0412 	2AB3

		//;smartkey.C: 89: T0IF = 0;
		BCR 	INTCON,2 		//0413 	110B
		ORG		0414H

		//;smartkey.C: 90: TMR0 = 179;
		BCR 	STATUS,5 		//0414 	1283
		STR 	1H 			//0415 	0181

		//;smartkey.C: 96: if( mode_chek == 1){
		DECRSZ 	73H,0 		//0416 	0E73
		LJUMP 	430H 			//0417 	3C30

		//;smartkey.C: 98: cntCyc++;
		INCR	72H,1 			//0418 	09F2

		//;smartkey.C: 100: if(RA5==0){
		BTSC 	5H,5 			//0419 	1685
		LJUMP 	430H 			//041A 	3C30
		LDWI 	10H 			//041B 	2A10
		ORG		041CH

		//;smartkey.C: 102: cntOff++;
		INCR	4AH,1 			//041C 	09CA

		//;smartkey.C: 105: if(cntOff > 15){
		SUBWR 	4AH,0 			//041D 	0C4A
		BTSS 	STATUS,0 		//041E 	1C03
		LJUMP 	430H 			//041F 	3C30
		LDWI 	10H 			//0420 	2A10

		//;smartkey.C: 107: mode_chek = 0;
		CLRR 	73H 			//0421 	0173

		//;smartkey.C: 109: if((cntCyc>15) &&(cntCyc<50)) {
		SUBWR 	72H,0 			//0422 	0C72
		LDWI 	32H 			//0423 	2A32
		ORG		0424H
		BTSS 	STATUS,0 		//0424 	1C03
		LJUMP 	42CH 			//0425 	3C2C
		SUBWR 	72H,0 			//0426 	0C72
		BTSC 	STATUS,0 		//0427 	1403
		LJUMP 	42BH 			//0428 	3C2B

		//;smartkey.C: 110: RegStatus |= (0x40);
		BSR 	49H,6 			//0429 	1B49

		//;smartkey.C: 111: } else if (cntCyc>=50){
		LJUMP 	42FH 			//042A 	3C2F
		LDWI 	32H 			//042B 	2A32
		ORG		042CH
		SUBWR 	72H,0 			//042C 	0C72
		BTSC 	STATUS,0 		//042D 	1403

		//;smartkey.C: 112: RegStatus &= ~(0x40);
		BCR 	49H,6 			//042E 	1349

		//;smartkey.C: 113: }
		//;smartkey.C: 116: RegStatus |= 0x80;
		BSR 	49H,7 			//042F 	1BC9

		//;smartkey.C: 117: }
		//;smartkey.C: 119: }
		//;smartkey.C: 129: }
		//;smartkey.C: 132: timeTick++;
		INCR	70H,1 			//0430 	09F0
		BTSC 	STATUS,2 		//0431 	1503
		INCR	71H,1 			//0432 	09F1

		//;smartkey.C: 134: if((mtState == 4)||(mtState == 3)){
		LDR 	74H,0 			//0433 	0874
		ORG		0434H
		XORWI 	4H 			//0434 	2604
		BTSC 	STATUS,2 		//0435 	1503
		LJUMP 	43BH 			//0436 	3C3B
		LDR 	74H,0 			//0437 	0874
		XORWI 	3H 			//0438 	2603
		BTSS 	STATUS,2 		//0439 	1D03
		LJUMP 	45EH 			//043A 	3C5E

		//;smartkey.C: 136: if(timeTick > cntTmp){
		LDR 	71H,0 			//043B 	0871
		ORG		043CH
		SUBWR 	46H,0 			//043C 	0C46
		BTSS 	STATUS,2 		//043D 	1D03
		LJUMP 	441H 			//043E 	3C41
		LDR 	70H,0 			//043F 	0870
		SUBWR 	45H,0 			//0440 	0C45
		BTSC 	STATUS,0 		//0441 	1403
		LJUMP 	45EH 			//0442 	3C5E

		//;smartkey.C: 137: cntTmp = timeTick+45;
		LDR 	71H,0 			//0443 	0871
		ORG		0444H
		STR 	46H 			//0444 	01C6
		LDR 	70H,0 			//0445 	0870
		STR 	45H 			//0446 	01C5
		LDWI 	2DH 			//0447 	2A2D
		ADDWR 	45H,1 			//0448 	0BC5
		BTSC 	STATUS,0 		//0449 	1403
		INCR	46H,1 			//044A 	09C6

		//;smartkey.C: 138: if(cntTmp<=timeOut)
		LDR 	46H,0 			//044B 	0846
		ORG		044CH
		SUBWR 	48H,0 			//044C 	0C48
		BTSS 	STATUS,2 		//044D 	1D03
		LJUMP 	451H 			//044E 	3C51
		LDR 	45H,0 			//044F 	0845
		SUBWR 	47H,0 			//0450 	0C47

		//;smartkey.C: 139: {
		//;smartkey.C: 140: TMR2IE = 0;
		BSR 	STATUS,5 		//0451 	1A83
		BTSS 	STATUS,0 		//0452 	1C03
		LJUMP 	45FH 			//0453 	3C5F
		ORG		0454H
		BCR 	CH,1 			//0454 	108C

		//;smartkey.C: 142: if (PR2L == 20)
		LDR 	11H,0 			//0455 	0811
		XORWI 	14H 			//0456 	2614
		BTSS 	STATUS,2 		//0457 	1D03
		LJUMP 	45BH 			//0458 	3C5B

		//;smartkey.C: 143: PR2L = 25;
		LDWI 	19H 			//0459 	2A19
		LJUMP 	45CH 			//045A 	3C5C

		//;smartkey.C: 144: else
		//;smartkey.C: 145: PR2L = 20;
		LDWI 	14H 			//045B 	2A14
		ORG		045CH
		STR 	11H 			//045C 	0191

		//;smartkey.C: 146: TMR2IE = 1;
		BSR 	CH,1 			//045D 	188C

		//;smartkey.C: 147: }
		//;smartkey.C: 148: }
		//;smartkey.C: 149: }
		//;smartkey.C: 152: }
		//;smartkey.C: 155: if(TMR2IE&&TMR2IF)
		BSR 	STATUS,5 		//045E 	1A83
		BTSS 	CH,1 			//045F 	1C8C
		LJUMP 	467H 			//0460 	3C67
		BCR 	STATUS,5 		//0461 	1283
		BTSS 	CH,1 			//0462 	1C8C
		LJUMP 	467H 			//0463 	3C67
		ORG		0464H
		LDWI 	8H 			//0464 	2A08

		//;smartkey.C: 156: {
		//;smartkey.C: 157: TMR2IF = 0;
		BCR 	CH,1 			//0465 	108C

		//;smartkey.C: 158: RA3 =~ RA3;
		XORWR 	5H,1 			//0466 	0485
		LDR 	78H,0 			//0467 	0878
		STR 	PCLATH 			//0468 	018A
		SWAPR 	77H,0 			//0469 	0777
		STR 	STATUS 			//046A 	0183
		SWAPR 	7EH,1 			//046B 	07FE
		ORG		046CH
		SWAPR 	7EH,0 			//046C 	077E
		RETI		 			//046D 	0009
		CLRR 	25H 			//046E 	0125
		BTSS 	21H,7 			//046F 	1FA1
		LJUMP 	478H 			//0470 	3C78
		COMR 	20H,1 			//0471 	0FA0
		COMR 	21H,1 			//0472 	0FA1
		INCR	20H,1 			//0473 	09A0
		ORG		0474H
		BTSC 	STATUS,2 		//0474 	1503
		INCR	21H,1 			//0475 	09A1
		CLRR 	25H 			//0476 	0125
		INCR	25H,1 			//0477 	09A5
		BTSS 	23H,7 			//0478 	1FA3
		LJUMP 	481H 			//0479 	3C81
		COMR 	22H,1 			//047A 	0FA2
		COMR 	23H,1 			//047B 	0FA3
		ORG		047CH
		INCR	22H,1 			//047C 	09A2
		BTSC 	STATUS,2 		//047D 	1503
		INCR	23H,1 			//047E 	09A3
		LDWI 	1H 			//047F 	2A01
		XORWR 	25H,1 			//0480 	04A5
		CLRR 	26H 			//0481 	0126
		CLRR 	27H 			//0482 	0127
		LDR 	21H,0 			//0483 	0821
		ORG		0484H
		IORWR 	20H,0 			//0484 	0320
		BTSC 	STATUS,2 		//0485 	1503
		LJUMP 	4A6H 			//0486 	3CA6
		CLRR 	24H 			//0487 	0124
		INCR	24H,1 			//0488 	09A4
		BTSC 	21H,7 			//0489 	17A1
		LJUMP 	48FH 			//048A 	3C8F
		BCR 	STATUS,0 		//048B 	1003
		ORG		048CH
		RLR 	20H,1 			//048C 	05A0
		RLR 	21H,1 			//048D 	05A1
		LJUMP 	488H 			//048E 	3C88
		BCR 	STATUS,0 		//048F 	1003
		RLR 	26H,1 			//0490 	05A6
		RLR 	27H,1 			//0491 	05A7
		LDR 	21H,0 			//0492 	0821
		SUBWR 	23H,0 			//0493 	0C23
		ORG		0494H
		BTSS 	STATUS,2 		//0494 	1D03
		LJUMP 	498H 			//0495 	3C98
		LDR 	20H,0 			//0496 	0820
		SUBWR 	22H,0 			//0497 	0C22
		BTSS 	STATUS,0 		//0498 	1C03
		LJUMP 	4A2H 			//0499 	3CA2
		LDR 	20H,0 			//049A 	0820
		SUBWR 	22H,1 			//049B 	0CA2
		ORG		049CH
		LDR 	21H,0 			//049C 	0821
		BTSS 	STATUS,0 		//049D 	1C03
		DECR 	23H,1 			//049E 	0DA3
		SUBWR 	23H,1 			//049F 	0CA3
		BSR 	26H,0 			//04A0 	1826
		BCR 	STATUS,0 		//04A1 	1003
		RRR	21H,1 			//04A2 	06A1
		RRR	20H,1 			//04A3 	06A0
		ORG		04A4H
		DECRSZ 	24H,1 		//04A4 	0EA4
		LJUMP 	48FH 			//04A5 	3C8F
		LDR 	25H,0 			//04A6 	0825
		BTSC 	STATUS,2 		//04A7 	1503
		LJUMP 	4AEH 			//04A8 	3CAE
		COMR 	26H,1 			//04A9 	0FA6
		COMR 	27H,1 			//04AA 	0FA7
		INCR	26H,1 			//04AB 	09A6
		ORG		04ACH
		BTSC 	STATUS,2 		//04AC 	1503
		INCR	27H,1 			//04AD 	09A7
		LDR 	27H,0 			//04AE 	0827
		STR 	21H 			//04AF 	01A1
		LDR 	26H,0 			//04B0 	0826
		STR 	20H 			//04B1 	01A0
		RET		 					//04B2 	0004
		STR 	27H 			//04B3 	01A7
		ORG		04B4H

		//;smartkey.C: 228: if(a>b){
		LDR 	20H,0 			//04B4 	0820
		XORWI 	80H 			//04B5 	2680
		STR 	22H 			//04B6 	01A2
		LDR 	27H,0 			//04B7 	0827
		XORWI 	80H 			//04B8 	2680
		SUBWR 	22H,1 			//04B9 	0CA2
		BTSC 	STATUS,0 		//04BA 	1403
		LJUMP 	4DFH 			//04BB 	3CDF
		ORG		04BCH

		//;smartkey.C: 229: if((a-b)<=dt) return 1;
		LDR 	20H,0 			//04BC 	0820
		SUBWR 	27H,0 			//04BD 	0C27
		STR 	22H 			//04BE 	01A2
		CLRR 	23H 			//04BF 	0123
		BTSS 	STATUS,0 		//04C0 	1C03
		DECR 	23H,1 			//04C1 	0DA3
		BTSC 	27H,7 			//04C2 	17A7
		DECR 	23H,1 			//04C3 	0DA3
		ORG		04C4H
		BTSC 	20H,7 			//04C4 	17A0
		INCR	23H,1 			//04C5 	09A3
		BCR 	STATUS,5 		//04C6 	1283
		LCALL 	4ECH 			//04C7 	34EC
		BTSS 	STATUS,2 		//04C8 	1D03
		LJUMP 	4CCH 			//04C9 	3CCC
		LDR 	22H,0 			//04CA 	0822
		SUBWR 	24H,0 			//04CB 	0C24
		ORG		04CCH
		BTSS 	STATUS,0 		//04CC 	1C03
		RETW 	0H 			//04CD 	2100
		RETW 	1H 			//04CE 	2101

		//;smartkey.C: 233: if((b-a)<=dt) return 1;
		SUBWR 	20H,0 			//04CF 	0C20
		STR 	22H 			//04D0 	01A2
		CLRR 	23H 			//04D1 	0123
		BTSS 	STATUS,0 		//04D2 	1C03
		DECR 	23H,1 			//04D3 	0DA3
		ORG		04D4H
		BTSC 	20H,7 			//04D4 	17A0
		DECR 	23H,1 			//04D5 	0DA3
		BTSC 	27H,7 			//04D6 	17A7
		INCR	23H,1 			//04D7 	09A3
		BCR 	STATUS,5 		//04D8 	1283
		LCALL 	4ECH 			//04D9 	34EC
		BTSS 	STATUS,2 		//04DA 	1D03
		LJUMP 	4CCH 			//04DB 	3CCC
		ORG		04DCH
		LDR 	22H,0 			//04DC 	0822
		SUBWR 	24H,0 			//04DD 	0C24
		LJUMP 	4CCH 			//04DE 	3CCC

		//;smartkey.C: 230: else return 0;
		//;smartkey.C: 232: else if(a<b){
		LDR 	27H,0 			//04DF 	0827
		XORWI 	80H 			//04E0 	2680
		STR 	22H 			//04E1 	01A2
		LDR 	20H,0 			//04E2 	0820
		XORWI 	80H 			//04E3 	2680
		ORG		04E4H
		SUBWR 	22H,1 			//04E4 	0CA2

		//;smartkey.C: 236: else if(a==b){
		LDR 	27H,0 			//04E5 	0827
		BTSS 	STATUS,0 		//04E6 	1C03
		LJUMP 	4CFH 			//04E7 	3CCF
		XORWR 	20H,0 			//04E8 	0420
		BTSC 	STATUS,2 		//04E9 	1503
		RETW 	1H 			//04EA 	2101
		RETW 	0H 			//04EB 	2100
		ORG		04ECH
		LDR 	21H,0 			//04EC 	0821
		STR 	24H 			//04ED 	01A4
		CLRR 	25H 			//04EE 	0125
		BTSC 	24H,7 			//04EF 	17A4
		DECR 	25H,1 			//04F0 	0DA5
		LDR 	25H,0 			//04F1 	0825
		XORWI 	80H 			//04F2 	2680
		STR 	26H 			//04F3 	01A6
		ORG		04F4H
		LDR 	23H,0 			//04F4 	0823
		XORWI 	80H 			//04F5 	2680
		SUBWR 	26H,0 			//04F6 	0C26
		RET		 					//04F7 	0004

		//;mpu6x.c: 24: else
		//;mpu6x.c: 25: return 1;
		//;mpu6x.c: 21: else
		//;mpu6x.c: 22: return 2;
		BCR 	STATUS,5 		//04F8 	1283
		STR 	21H 			//04F9 	01A1
		CLRR 	22H 			//04FA 	0122

		//;SWI2C.C: 115: RA7 = 0;
		BCR 	5H,7 			//04FB 	1385
		ORG		04FCH

		//;SWI2C.C: 116: TRISA |=0x40;;
		BSR 	STATUS,5 		//04FC 	1A83
		BSR 	5H,6 			//04FD 	1B05

		//;SWI2C.C: 117: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//04FE 	2A05
		BCR 	STATUS,5 		//04FF 	1283
		STR 	20H 			//0500 	01A0
		DECRSZ 	20H,1 		//0501 	0EA0
		LJUMP 	501H 			//0502 	3D01

		//;SWI2C.C: 118: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//0503 	1283
		ORG		0504H
		CLRR 	23H 			//0504 	0123
		LDWI 	5H 			//0505 	2A05

		//;SWI2C.C: 119: {
		//;SWI2C.C: 120: RA7 = 1;
		BSR 	5H,7 			//0506 	1B85

		//;SWI2C.C: 121: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0507 	01A0
		DECRSZ 	20H,1 		//0508 	0EA0
		LJUMP 	508H 			//0509 	3D08

		//;SWI2C.C: 122: dat = dat<<1 |(RA6 & 1 );
		LDWI 	0H 			//050A 	2A00
		BCR 	STATUS,5 		//050B 	1283
		ORG		050CH
		BTSC 	5H,6 			//050C 	1705
		LDWI 	1H 			//050D 	2A01
		ANDWI 	1H 			//050E 	2401
		STR 	20H 			//050F 	01A0
		BCR 	STATUS,0 		//0510 	1003
		RLR 	22H,0 			//0511 	0522
		IORWR 	20H,0 			//0512 	0320
		STR 	22H 			//0513 	01A2
		ORG		0514H
		LDWI 	5H 			//0514 	2A05

		//;SWI2C.C: 125: RA7 = 0;
		BCR 	5H,7 			//0515 	1385

		//;SWI2C.C: 126: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0516 	01A0
		DECRSZ 	20H,1 		//0517 	0EA0
		LJUMP 	517H 			//0518 	3D17
		LDWI 	8H 			//0519 	2A08
		BCR 	STATUS,5 		//051A 	1283
		INCR	23H,1 			//051B 	09A3
		ORG		051CH
		SUBWR 	23H,0 			//051C 	0C23
		BTSS 	STATUS,0 		//051D 	1C03
		LJUMP 	505H 			//051E 	3D05

		//;SWI2C.C: 127: }
		//;SWI2C.C: 129: TRISA &=0xbf;;
		BSR 	STATUS,5 		//051F 	1A83
		BCR 	5H,6 			//0520 	1305

		//;SWI2C.C: 131: RA6 = (Ack) ? 0 : 1;
		BCR 	STATUS,5 		//0521 	1283
		LDR 	21H,1 			//0522 	08A1
		BCR 	STATUS,5 		//0523 	1283
		ORG		0524H
		BTSS 	STATUS,2 		//0524 	1D03
		LJUMP 	528H 			//0525 	3D28
		BSR 	5H,6 			//0526 	1B05
		LJUMP 	529H 			//0527 	3D29
		BCR 	5H,6 			//0528 	1305
		LDWI 	5H 			//0529 	2A05

		//;SWI2C.C: 132: RA7 = 1;
		BSR 	5H,7 			//052A 	1B85

		//;SWI2C.C: 133: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//052B 	01A0
		ORG		052CH
		DECRSZ 	20H,1 		//052C 	0EA0
		LJUMP 	52CH 			//052D 	3D2C
		LDWI 	5H 			//052E 	2A05

		//;SWI2C.C: 134: RA7 = 0;
		BCR 	STATUS,5 		//052F 	1283
		BCR 	5H,7 			//0530 	1385

		//;SWI2C.C: 135: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0531 	01A0
		DECRSZ 	20H,1 		//0532 	0EA0
		LJUMP 	532H 			//0533 	3D32
		ORG		0534H

		//;SWI2C.C: 136: return dat;
		BCR 	STATUS,5 		//0534 	1283
		LDR 	22H,0 			//0535 	0822
		RET		 					//0536 	0004
		BCR 	STATUS,5 		//0537 	1283
		STR 	21H 			//0538 	01A1

		//;SWI2C.C: 89: TRISA &=0xbf;;
		BSR 	STATUS,5 		//0539 	1A83
		BCR 	5H,6 			//053A 	1305

		//;SWI2C.C: 90: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//053B 	2A05
		ORG		053CH
		BCR 	STATUS,5 		//053C 	1283
		STR 	20H 			//053D 	01A0
		DECRSZ 	20H,1 		//053E 	0EA0
		LJUMP 	53EH 			//053F 	3D3E

		//;SWI2C.C: 91: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//0540 	1283
		CLRR 	22H 			//0541 	0122

		//;SWI2C.C: 92: {
		//;SWI2C.C: 93: RA6 = (dat&0x80) ? 1:0;
		BTSS 	21H,7 			//0542 	1FA1
		LJUMP 	547H 			//0543 	3D47
		ORG		0544H
		BCR 	STATUS,5 		//0544 	1283
		BSR 	5H,6 			//0545 	1B05
		LJUMP 	549H 			//0546 	3D49
		BCR 	STATUS,5 		//0547 	1283
		BCR 	5H,6 			//0548 	1305
		LDWI 	5H 			//0549 	2A05

		//;SWI2C.C: 94: dat<<=1;
		BCR 	STATUS,0 		//054A 	1003
		RLR 	21H,1 			//054B 	05A1
		ORG		054CH

		//;SWI2C.C: 95: RA7 = 1;
		BSR 	5H,7 			//054C 	1B85

		//;SWI2C.C: 96: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//054D 	01A0
		DECRSZ 	20H,1 		//054E 	0EA0
		LJUMP 	54EH 			//054F 	3D4E
		LDWI 	5H 			//0550 	2A05

		//;SWI2C.C: 97: RA7 = 0;
		BCR 	STATUS,5 		//0551 	1283
		BCR 	5H,7 			//0552 	1385

		//;SWI2C.C: 98: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0553 	01A0
		ORG		0554H
		DECRSZ 	20H,1 		//0554 	0EA0
		LJUMP 	554H 			//0555 	3D54
		LDWI 	8H 			//0556 	2A08
		BCR 	STATUS,5 		//0557 	1283
		INCR	22H,1 			//0558 	09A2
		SUBWR 	22H,0 			//0559 	0C22
		BTSS 	STATUS,0 		//055A 	1C03
		LJUMP 	542H 			//055B 	3D42
		ORG		055CH

		//;SWI2C.C: 99: }
		//;SWI2C.C: 101: TRISA |=0x40;;
		BSR 	STATUS,5 		//055C 	1A83
		BSR 	5H,6 			//055D 	1B05

		//;SWI2C.C: 102: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//055E 	2A05
		BCR 	STATUS,5 		//055F 	1283
		STR 	20H 			//0560 	01A0
		DECRSZ 	20H,1 		//0561 	0EA0
		LJUMP 	561H 			//0562 	3D61
		LDWI 	5H 			//0563 	2A05
		ORG		0564H

		//;SWI2C.C: 103: RA7 = 1;
		BCR 	STATUS,5 		//0564 	1283
		BSR 	5H,7 			//0565 	1B85

		//;SWI2C.C: 104: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0566 	01A0
		DECRSZ 	20H,1 		//0567 	0EA0
		LJUMP 	567H 			//0568 	3D67

		//;SWI2C.C: 105: i= RA6;
		LDWI 	0H 			//0569 	2A00
		BCR 	STATUS,5 		//056A 	1283
		BTSC 	5H,6 			//056B 	1705
		ORG		056CH
		LDWI 	1H 			//056C 	2A01
		STR 	22H 			//056D 	01A2

		//;SWI2C.C: 106: RA7 = 0;
		BCR 	5H,7 			//056E 	1385

		//;SWI2C.C: 107: TRISA &=0xbf;;
		BSR 	STATUS,5 		//056F 	1A83
		BCR 	5H,6 			//0570 	1305

		//;SWI2C.C: 108: return i;
		BCR 	STATUS,5 		//0571 	1283
		LDR 	22H,0 			//0572 	0822
		RET		 					//0573 	0004
		ORG		0574H
		STR 	2AH 			//0574 	01AA

		//;mpu6x.c: 32: unsigned char i;
		//;mpu6x.c: 34: swI2C_Start();
		LCALL 	670H 			//0575 	3670

		//;mpu6x.c: 36: if(swI2C_WriteByte(0x68<<1)== 0 )
		LDWI 	D0H 			//0576 	2AD0
		LCALL 	537H 			//0577 	3537
		IORWI 	0H 			//0578 	2500
		BTSS 	STATUS,2 		//0579 	1D03
		RETW 	1H 			//057A 	2101

		//;mpu6x.c: 37: {
		//;mpu6x.c: 38: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	2AH,0 			//057B 	082A
		ORG		057CH
		LCALL 	537H 			//057C 	3537
		IORWI 	0H 			//057D 	2500
		BTSS 	STATUS,2 		//057E 	1D03
		RETW 	2H 			//057F 	2102

		//;mpu6x.c: 39: {
		//;mpu6x.c: 40: swI2C_Start();
		LCALL 	670H 			//0580 	3670

		//;mpu6x.c: 41: if(swI2C_WriteByte((0x68<<1)|1)== 0 ){
		LDWI 	D1H 			//0581 	2AD1
		LCALL 	537H 			//0582 	3537
		IORWI 	0H 			//0583 	2500
		ORG		0584H
		BTSS 	STATUS,2 		//0584 	1D03
		RETW 	1H 			//0585 	2101

		//;mpu6x.c: 43: for(i=0; i<(len-1);i++){
		CLRR 	2BH 			//0586 	012B
		LDR 	26H,0 			//0587 	0826
		ADDWI 	FFH 			//0588 	27FF
		STR 	27H 			//0589 	01A7
		LDWI 	FFH 			//058A 	2AFF
		BTSC 	STATUS,0 		//058B 	1403
		ORG		058CH
		LDWI 	0H 			//058C 	2A00
		STR 	28H 			//058D 	01A8
		XORWI 	80H 			//058E 	2680
		SUBWI 	80H 			//058F 	2880
		BTSS 	STATUS,2 		//0590 	1D03
		LJUMP 	594H 			//0591 	3D94
		LDR 	27H,0 			//0592 	0827
		SUBWR 	2BH,0 			//0593 	0C2B
		ORG		0594H

		//;mpu6x.c: 44: dat[i]=swI2C_ReadByte(1);
		LDWI 	1H 			//0594 	2A01
		BTSC 	STATUS,0 		//0595 	1403
		LJUMP 	59BH 			//0596 	3D9B
		LCALL 	4F8H 			//0597 	34F8
		LCALL 	59FH 			//0598 	359F
		INCR	2BH,1 			//0599 	09AB
		LJUMP 	587H 			//059A 	3D87

		//;mpu6x.c: 45: }
		//;mpu6x.c: 46: dat[i]=swI2C_ReadByte(1);
		LCALL 	4F8H 			//059B 	34F8
		ORG		059CH
		LCALL 	59FH 			//059C 	359F

		//;mpu6x.c: 47: swI2C_Stop();
		LCALL 	6B5H 			//059D 	36B5

		//;mpu6x.c: 48: return 0;
		RETW 	0H 			//059E 	2100

		//;mpu6x.c: 54: else
		//;mpu6x.c: 55: return 2;
		//;mpu6x.c: 51: else
		//;mpu6x.c: 52: return 1;
		STR 	27H 			//059F 	01A7
		LDR 	2BH,0 			//05A0 	082B
		ADDWR 	24H,0 			//05A1 	0B24
		STR 	28H 			//05A2 	01A8
		LDR 	25H,0 			//05A3 	0825
		ORG		05A4H
		BTSC 	STATUS,0 		//05A4 	1403
		ADDWI 	1H 			//05A5 	2701
		STR 	29H 			//05A6 	01A9
		LDR 	28H,0 			//05A7 	0828
		STR 	FSR 			//05A8 	0184
		BCR 	STATUS,7 		//05A9 	1383
		BTSC 	29H,0 			//05AA 	1429
		BSR 	STATUS,7 		//05AB 	1B83
		ORG		05ACH
		LDR 	27H,0 			//05AC 	0827
		STR 	INDF 			//05AD 	0180
		RET		 					//05AE 	0004
		STR 	28H 			//05AF 	01A8

		//;mpu6x.c: 5: unsigned char i;
		//;mpu6x.c: 6: swI2C_Start();
		LCALL 	670H 			//05B0 	3670

		//;mpu6x.c: 8: if(swI2C_WriteByte(0x68<<1)== 0 )
		LDWI 	D0H 			//05B1 	2AD0
		LCALL 	537H 			//05B2 	3537
		IORWI 	0H 			//05B3 	2500
		ORG		05B4H
		BTSS 	STATUS,2 		//05B4 	1D03
		RETW 	1H 			//05B5 	2101

		//;mpu6x.c: 9: {
		//;mpu6x.c: 10: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	28H,0 			//05B6 	0828
		LCALL 	537H 			//05B7 	3537
		IORWI 	0H 			//05B8 	2500
		BTSS 	STATUS,2 		//05B9 	1D03
		RETW 	2H 			//05BA 	2102

		//;mpu6x.c: 11: {
		//;mpu6x.c: 12: for(i=0; i<len;i++){
		CLRR 	29H 			//05BB 	0129
		ORG		05BCH
		LDR 	25H,0 			//05BC 	0825
		SUBWR 	29H,0 			//05BD 	0C29
		BTSC 	STATUS,0 		//05BE 	1403
		LJUMP 	5D5H 			//05BF 	3DD5

		//;mpu6x.c: 13: if(swI2C_WriteByte(dat[i])==1 ){
		LDR 	29H,0 			//05C0 	0829
		ADDWR 	23H,0 			//05C1 	0B23
		STR 	26H 			//05C2 	01A6
		LDR 	24H,0 			//05C3 	0824
		ORG		05C4H
		BTSC 	STATUS,0 		//05C4 	1403
		ADDWI 	1H 			//05C5 	2701
		STR 	27H 			//05C6 	01A7
		LDR 	26H,0 			//05C7 	0826
		STR 	FSR 			//05C8 	0184
		BSR 	STATUS,7 		//05C9 	1B83
		BTSS 	27H,0 			//05CA 	1C27
		BCR 	STATUS,7 		//05CB 	1383
		ORG		05CCH
		LDR 	INDF,0 			//05CC 	0800
		LCALL 	537H 			//05CD 	3537
		XORWI 	1H 			//05CE 	2601
		BTSS 	STATUS,2 		//05CF 	1D03
		LJUMP 	5D3H 			//05D0 	3DD3

		//;mpu6x.c: 14: swI2C_Stop();
		LCALL 	6B5H 			//05D1 	36B5

		//;mpu6x.c: 15: return 3;
		RETW 	3H 			//05D2 	2103
		INCR	29H,1 			//05D3 	09A9
		ORG		05D4H
		LJUMP 	5BCH 			//05D4 	3DBC

		//;mpu6x.c: 16: }
		//;mpu6x.c: 17: }
		//;mpu6x.c: 18: swI2C_Stop();
		LCALL 	6B5H 			//05D5 	36B5

		//;mpu6x.c: 19: return 0;
		RETW 	0H 			//05D6 	2100

		//;SWI2C.C: 10: TRISA &=0xbf;;
		BSR 	STATUS,5 		//05D7 	1A83
		BCR 	5H,6 			//05D8 	1305

		//;SWI2C.C: 11: TRISA &=0x7f;;
		BCR 	5H,7 			//05D9 	1385

		//;SWI2C.C: 12: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05DA 	2A05
		BCR 	STATUS,5 		//05DB 	1283
		ORG		05DCH
		STR 	20H 			//05DC 	01A0
		DECRSZ 	20H,1 		//05DD 	0EA0
		LJUMP 	5DDH 			//05DE 	3DDD
		LDWI 	5H 			//05DF 	2A05

		//;SWI2C.C: 13: RA7 = 1;
		BCR 	STATUS,5 		//05E0 	1283
		BSR 	5H,7 			//05E1 	1B85
		BSR 	5H,6 			//05E2 	1B05

		//;SWI2C.C: 15: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05E3 	01A0
		ORG		05E4H
		DECRSZ 	20H,1 		//05E4 	0EA0
		LJUMP 	5E4H 			//05E5 	3DE4

		//;SWI2C.C: 16: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05E6 	2A05
		BCR 	STATUS,5 		//05E7 	1283
		STR 	20H 			//05E8 	01A0
		DECRSZ 	20H,1 		//05E9 	0EA0
		LJUMP 	5E9H 			//05EA 	3DE9

		//;SWI2C.C: 17: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05EB 	2A05
		ORG		05ECH
		BCR 	STATUS,5 		//05EC 	1283
		STR 	20H 			//05ED 	01A0
		DECRSZ 	20H,1 		//05EE 	0EA0
		LJUMP 	5EEH 			//05EF 	3DEE

		//;SWI2C.C: 18: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05F0 	2A05
		BCR 	STATUS,5 		//05F1 	1283
		STR 	20H 			//05F2 	01A0
		DECRSZ 	20H,1 		//05F3 	0EA0
		ORG		05F4H
		LJUMP 	5F3H 			//05F4 	3DF3
		RET		 					//05F5 	0004

		//;sysinit.c: 88: INTCON = 0B00000000;
		CLRR 	INTCON 			//05F6 	010B

		//;sysinit.c: 89: PIE1 = 0B00000000;
		BSR 	STATUS,5 		//05F7 	1A83
		CLRR 	CH 			//05F8 	010C

		//;sysinit.c: 90: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//05F9 	1283
		CLRR 	CH 			//05FA 	010C

		//;sysinit.c: 92: IOCA5 = 1;
		BSR 	STATUS,5 		//05FB 	1A83
		ORG		05FCH
		BSR 	16H,5 			//05FC 	1A96

		//;sysinit.c: 93: tmp = PORTA;
		BCR 	STATUS,5 		//05FD 	1283
		LDR 	5H,0 			//05FE 	0805

		//;sysinit.c: 94: PAIF = 0;
		BCR 	INTCON,0 		//05FF 	100B

		//;sysinit.c: 95: PAIE = 0;
		BCR 	INTCON,3 		//0600 	118B

		//;sysinit.c: 98: INTEDG = 0;
		BSR 	STATUS,5 		//0601 	1A83
		BCR 	1H,6 			//0602 	1301

		//;sysinit.c: 99: INTF = 0;
		BCR 	INTCON,1 		//0603 	108B
		ORG		0604H

		//;sysinit.c: 100: INTE = 1;
		BSR 	INTCON,4 		//0604 	1A0B

		//;sysinit.c: 102: TMR2IF = 0;
		BCR 	STATUS,5 		//0605 	1283
		BCR 	CH,1 			//0606 	108C

		//;sysinit.c: 103: TMR2IE = 1;
		BSR 	STATUS,5 		//0607 	1A83
		BSR 	CH,1 			//0608 	188C

		//;sysinit.c: 104: TMR2ON = 0;
		BCR 	STATUS,5 		//0609 	1283
		BCR 	12H,2 			//060A 	1112

		//;sysinit.c: 110: T0IF = 0;
		BCR 	INTCON,2 		//060B 	110B
		ORG		060CH

		//;sysinit.c: 111: T0IE = 1;
		BSR 	INTCON,5 		//060C 	1A8B

		//;sysinit.c: 112: T0ON = 1;
		BSR 	1FH,3 			//060D 	199F

		//;sysinit.c: 114: PEIE = 1;
		BSR 	INTCON,6 		//060E 	1B0B

		//;sysinit.c: 116: GIE = 1;
		BSR 	INTCON,7 		//060F 	1B8B
		RET		 					//0610 	0004
		STR 	21H 			//0611 	01A1

		//;smartkey.C: 206: GIE = 0;
		BCR 	INTCON,7 		//0612 	138B

		//;smartkey.C: 207: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//0613 	1F8B
		ORG		0614H
		LJUMP 	617H 			//0614 	3E17
		CLRWDT	 			//0615 	0001
		LJUMP 	613H 			//0616 	3E13

		//;smartkey.C: 208: EEADR = EEAddr;
		BCR 	STATUS,5 		//0617 	1283
		LDR 	21H,0 			//0618 	0821
		BSR 	STATUS,5 		//0619 	1A83
		STR 	1BH 			//061A 	019B

		//;smartkey.C: 209: EEDAT = EEData;
		BCR 	STATUS,5 		//061B 	1283
		ORG		061CH
		LDR 	20H,0 			//061C 	0820
		BSR 	STATUS,5 		//061D 	1A83
		STR 	1AH 			//061E 	019A
		LDWI 	34H 			//061F 	2A34

		//;smartkey.C: 210: EEIF = 0;
		BCR 	STATUS,5 		//0620 	1283
		BCR 	CH,7 			//0621 	138C

		//;smartkey.C: 211: EECON1 = 0x34;
		BSR 	STATUS,5 		//0622 	1A83
		STR 	1CH 			//0623 	019C
		ORG		0624H

		//;smartkey.C: 212: WR = 1;
		BSR 	1DH,0 			//0624 	181D

		//;smartkey.C: 213: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//0625 	1A83
		BTSS 	1DH,0 			//0626 	1C1D
		LJUMP 	62AH 			//0627 	3E2A
		CLRWDT	 			//0628 	0001
		LJUMP 	625H 			//0629 	3E25

		//;smartkey.C: 215: GIE = 1;
		BSR 	INTCON,7 		//062A 	1B8B
		RET		 					//062B 	0004
		ORG		062CH
		STR 	76H 			//062C 	01F6

		//;smartkey.C: 206: GIE = 0;
		BCR 	INTCON,7 		//062D 	138B

		//;smartkey.C: 207: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//062E 	1F8B
		LJUMP 	632H 			//062F 	3E32
		CLRWDT	 			//0630 	0001
		LJUMP 	62EH 			//0631 	3E2E

		//;smartkey.C: 208: EEADR = EEAddr;
		LDR 	76H,0 			//0632 	0876
		BSR 	STATUS,5 		//0633 	1A83
		ORG		0634H
		STR 	1BH 			//0634 	019B

		//;smartkey.C: 209: EEDAT = EEData;
		LDR 	75H,0 			//0635 	0875
		STR 	1AH 			//0636 	019A
		LDWI 	34H 			//0637 	2A34

		//;smartkey.C: 210: EEIF = 0;
		BCR 	STATUS,5 		//0638 	1283
		BCR 	CH,7 			//0639 	138C

		//;smartkey.C: 211: EECON1 = 0x34;
		BSR 	STATUS,5 		//063A 	1A83
		STR 	1CH 			//063B 	019C
		ORG		063CH

		//;smartkey.C: 212: WR = 1;
		BSR 	1DH,0 			//063C 	181D

		//;smartkey.C: 213: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//063D 	1A83
		BTSS 	1DH,0 			//063E 	1C1D
		LJUMP 	642H 			//063F 	3E42
		CLRWDT	 			//0640 	0001
		LJUMP 	63DH 			//0641 	3E3D

		//;smartkey.C: 215: GIE = 1;
		BSR 	INTCON,7 		//0642 	1B8B
		RET		 					//0643 	0004
		ORG		0644H
		STR 	25H 			//0644 	01A5

		//;smartkey.C: 177: {
		//;smartkey.C: 178: while(rep--){
		DECR 	24H,1 			//0645 	0DA4
		LDR 	24H,0 			//0646 	0824
		XORWI 	FFH 			//0647 	26FF
		BTSC 	STATUS,2 		//0648 	1503
		RET		 					//0649 	0004
		LDWI 	CH 			//064A 	2A0C

		//;smartkey.C: 179: TMR2ON = 1;
		BSR 	12H,2 			//064B 	1912
		ORG		064CH

		//;smartkey.C: 180: PR2L = 12;
		BSR 	STATUS,5 		//064C 	1A83
		STR 	11H 			//064D 	0191

		//;smartkey.C: 181: delay_x10ms(delay);
		BCR 	STATUS,5 		//064E 	1283
		LDR 	25H,0 			//064F 	0825
		STR 	20H 			//0650 	01A0
		CLRR 	21H 			//0651 	0121
		LCALL 	683H 			//0652 	3683
		LDWI 	14H 			//0653 	2A14
		ORG		0654H

		//;smartkey.C: 183: TMR2ON = 0;RA3 =0;
		BCR 	12H,2 			//0654 	1112
		BCR 	5H,3 			//0655 	1185

		//;smartkey.C: 184: delay_x10ms(20);
		STR 	20H 			//0656 	01A0
		CLRR 	21H 			//0657 	0121
		LCALL 	683H 			//0658 	3683
		LJUMP 	645H 			//0659 	3E45

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//065A 	1283
		CLRR 	5H 			//065B 	0105
		ORG		065CH

		//;sysinit.c: 35: TRISA = 0B00110111;
		LDWI 	37H 			//065C 	2A37
		BSR 	STATUS,5 		//065D 	1A83
		STR 	5H 			//065E 	0185

		//;sysinit.c: 36: WPUA = 0B11000000;
		LDWI 	C0H 			//065F 	2AC0
		STR 	15H 			//0660 	0195

		//;sysinit.c: 38: PORTC = 0B00000000;
		BCR 	STATUS,5 		//0661 	1283
		CLRR 	7H 			//0662 	0107

		//;sysinit.c: 39: TRISC = 0B11111100;
		LDWI 	FCH 			//0663 	2AFC
		ORG		0664H
		BSR 	STATUS,5 		//0664 	1A83
		STR 	7H 			//0665 	0187

		//;sysinit.c: 40: WPUC = 0B00000000;
		CLRR 	13H 			//0666 	0113

		//;sysinit.c: 42: PSRCA = 0B11111111;
		LDWI 	FFH 			//0667 	2AFF
		STR 	8H 			//0668 	0188

		//;sysinit.c: 43: PSRCC = 0B11111111;
		STR 	14H 			//0669 	0194

		//;sysinit.c: 44: PSINKA = 0B11111111;
		STR 	17H 			//066A 	0197

		//;sysinit.c: 45: PSINKC = 0B11111111;
		STR 	1FH 			//066B 	019F
		ORG		066CH

		//;sysinit.c: 47: MSCON = 0B00110000;
		LDWI 	30H 			//066C 	2A30
		BCR 	STATUS,5 		//066D 	1283
		STR 	1BH 			//066E 	019B
		RET		 					//066F 	0004
		LDWI 	5H 			//0670 	2A05

		//;SWI2C.C: 24: RA7 = 1;
		BSR 	5H,7 			//0671 	1B85

		//;SWI2C.C: 26: RA6 = 1;
		BSR 	5H,6 			//0672 	1B05

		//;SWI2C.C: 27: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0673 	01A0
		ORG		0674H
		DECRSZ 	20H,1 		//0674 	0EA0
		LJUMP 	674H 			//0675 	3E74
		LDWI 	5H 			//0676 	2A05

		//;SWI2C.C: 28: RA6 = 0;
		BCR 	STATUS,5 		//0677 	1283
		BCR 	5H,6 			//0678 	1305

		//;SWI2C.C: 29: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0679 	01A0
		DECRSZ 	20H,1 		//067A 	0EA0
		LJUMP 	67AH 			//067B 	3E7A
		ORG		067CH
		LDWI 	5H 			//067C 	2A05

		//;SWI2C.C: 30: RA7 = 0;
		BCR 	STATUS,5 		//067D 	1283
		BCR 	5H,7 			//067E 	1385

		//;SWI2C.C: 31: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//067F 	01A0
		DECRSZ 	20H,1 		//0680 	0EA0
		LJUMP 	680H 			//0681 	3E80
		RET		 					//0682 	0004

		//;smartkey.C: 165: unsigned int set = t + timeTick;
		LDR 	21H,0 			//0683 	0821
		ORG		0684H
		STR 	23H 			//0684 	01A3
		LDR 	20H,0 			//0685 	0820
		STR 	22H 			//0686 	01A2
		LDR 	70H,0 			//0687 	0870
		ADDWR 	22H,1 			//0688 	0BA2
		BTSC 	STATUS,0 		//0689 	1403
		INCR	23H,1 			//068A 	09A3
		LDR 	71H,0 			//068B 	0871
		ORG		068CH
		ADDWR 	23H,1 			//068C 	0BA3

		//;smartkey.C: 166: while(timeTick < set);
		LDR 	23H,0 			//068D 	0823
		SUBWR 	71H,0 			//068E 	0C71
		BTSS 	STATUS,2 		//068F 	1D03
		LJUMP 	693H 			//0690 	3E93
		LDR 	22H,0 			//0691 	0822
		SUBWR 	70H,0 			//0692 	0C70
		BTSC 	STATUS,0 		//0693 	1403
		ORG		0694H
		RET		 					//0694 	0004
		LJUMP 	68DH 			//0695 	3E8D

		//;sysinit.c: 60: T0CON0 = 0B00000000;
		CLRR 	1FH 			//0696 	011F

		//;sysinit.c: 61: OPTION = 0B00000111;
		LDWI 	7H 			//0697 	2A07
		BSR 	STATUS,5 		//0698 	1A83
		STR 	1H 			//0699 	0181

		//;sysinit.c: 62: TMR0 = 179;
		LDWI 	B3H 			//069A 	2AB3
		BCR 	STATUS,5 		//069B 	1283
		ORG		069CH
		STR 	1H 			//069C 	0181

		//;sysinit.c: 64: TMR2H = 0;
		CLRR 	13H 			//069D 	0113

		//;sysinit.c: 65: TMR2L = 0;
		CLRR 	11H 			//069E 	0111

		//;sysinit.c: 66: PR2H = 0;
		BSR 	STATUS,5 		//069F 	1A83
		CLRR 	12H 			//06A0 	0112

		//;sysinit.c: 67: PR2L =0;
		CLRR 	11H 			//06A1 	0111

		//;sysinit.c: 68: T2CON0 = 0B00101001;
		LDWI 	29H 			//06A2 	2A29
		BCR 	STATUS,5 		//06A3 	1283
		ORG		06A4H
		STR 	12H 			//06A4 	0192
		RET		 					//06A5 	0004
		CLRR 	70H 			//06A6 	0170
		CLRR 	71H 			//06A7 	0171
		CLRR 	72H 			//06A8 	0172
		CLRR 	73H 			//06A9 	0173
		CLRR 	74H 			//06AA 	0174
		CLRR 	45H 			//06AB 	0145
		ORG		06ACH
		CLRR 	46H 			//06AC 	0146
		CLRR 	47H 			//06AD 	0147
		CLRR 	48H 			//06AE 	0148
		CLRR 	49H 			//06AF 	0149
		CLRR 	4AH 			//06B0 	014A
		CLRR 	4BH 			//06B1 	014B
		CLRR 	4CH 			//06B2 	014C
		CLRR 	STATUS 			//06B3 	0103
		ORG		06B4H
		LJUMP 	0BH 			//06B4 	380B
		LDWI 	5H 			//06B5 	2A05

		//;SWI2C.C: 37: RA6 = 0;
		BCR 	5H,6 			//06B6 	1305

		//;SWI2C.C: 38: RA7 = 1;
		BSR 	5H,7 			//06B7 	1B85

		//;SWI2C.C: 39: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//06B8 	01A0
		DECRSZ 	20H,1 		//06B9 	0EA0
		LJUMP 	6B9H 			//06BA 	3EB9
		LDWI 	5H 			//06BB 	2A05
		ORG		06BCH

		//;SWI2C.C: 40: RA6 = 1;
		BCR 	STATUS,5 		//06BC 	1283
		BSR 	5H,6 			//06BD 	1B05

		//;SWI2C.C: 41: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//06BE 	01A0
		DECRSZ 	20H,1 		//06BF 	0EA0
		LJUMP 	6BFH 			//06C0 	3EBF
		RET		 					//06C1 	0004
		BCR 	STATUS,5 		//06C2 	1283
		STR 	20H 			//06C3 	01A0
		ORG		06C4H

		//;smartkey.C: 195: unsigned char ReEepromData;
		//;smartkey.C: 197: EEADR = EEAddr;
		BSR 	STATUS,5 		//06C4 	1A83
		STR 	1BH 			//06C5 	019B

		//;smartkey.C: 198: RD = 1;
		BSR 	1CH,0 			//06C6 	181C

		//;smartkey.C: 199: ReEepromData = EEDAT;
		LDR 	1AH,0 			//06C7 	081A
		BCR 	STATUS,5 		//06C8 	1283
		STR 	21H 			//06C9 	01A1

		//;smartkey.C: 200: RD = 0;
		BSR 	STATUS,5 		//06CA 	1A83
		BCR 	1CH,0 			//06CB 	101C
		ORG		06CCH

		//;smartkey.C: 201: return ReEepromData;
		BCR 	STATUS,5 		//06CC 	1283
		LDR 	21H,0 			//06CD 	0821
		RET		 					//06CE 	0004
		STR 	22H 			//06CF 	01A2

		//;smartkey.C: 221: mtOldState = mtState;
		LDR 	74H,0 			//06D0 	0874
		STR 	4CH 			//06D1 	01CC

		//;smartkey.C: 222: mtState = stt;
		LDR 	22H,0 			//06D2 	0822
		STR 	74H 			//06D3 	01F4
		ORG		06D4H

		//;smartkey.C: 223: timeTick =0;
		CLRR 	70H 			//06D4 	0170
		CLRR 	71H 			//06D5 	0171

		//;smartkey.C: 224: timeOut = _tOut;
		LDR 	21H,0 			//06D6 	0821
		STR 	48H 			//06D7 	01C8
		LDR 	20H,0 			//06D8 	0820
		STR 	47H 			//06D9 	01C7
		RET		 					//06DA 	0004

		//;sysinit.c: 21: OSCCON = 0B01010001;
		LDWI 	51H 			//06DB 	2A51
		ORG		06DCH
		BSR 	STATUS,5 		//06DC 	1A83
		STR 	FH 			//06DD 	018F

		//;sysinit.c: 22: _nop();
		NOP		 					//06DE 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//06DF 	1A83
		BTSC 	FH,2 			//06E0 	150F
		RET		 					//06E1 	0004
		LJUMP 	6DFH 			//06E2 	3EDF
		STR 	75H 			//06E3 	01F5
		ORG		06E4H

		//;smartkey.C: 195: unsigned char ReEepromData;
		//;smartkey.C: 197: EEADR = EEAddr;
		BSR 	STATUS,5 		//06E4 	1A83
		STR 	1BH 			//06E5 	019B

		//;smartkey.C: 198: RD = 1;
		BSR 	1CH,0 			//06E6 	181C

		//;smartkey.C: 199: ReEepromData = EEDAT;
		LDR 	1AH,0 			//06E7 	081A
		STR 	76H 			//06E8 	01F6

		//;smartkey.C: 200: RD = 0;
		BCR 	1CH,0 			//06E9 	101C

		//;smartkey.C: 201: return ReEepromData;
		RET		 					//06EA 	0004
		LJUMP 	285H 			//06EB 	3A85
		ORG		06ECH
		LJUMP 	1BEH 			//06EC 	39BE
		LJUMP 	1C5H 			//06ED 	39C5
		LJUMP 	20EH 			//06EE 	3A0E
		LJUMP 	22FH 			//06EF 	3A2F

		//;smartkey.C: 173: TMR2ON = 1;
		BCR 	STATUS,5 		//06F0 	1283
		BSR 	12H,2 			//06F1 	1912

		//;smartkey.C: 174: TRISA &= 0xf7;
		BSR 	STATUS,5 		//06F2 	1A83
		BCR 	5H,3 			//06F3 	1185
		ORG		06F4H
		RET		 					//06F4 	0004

		//;smartkey.C: 170: TMR2ON = 0;RA3 =0;TRISA |= 0x08;
		BCR 	12H,2 			//06F5 	1112
		BCR 	5H,3 			//06F6 	1185
		BSR 	STATUS,5 		//06F7 	1A83
		BSR 	5H,3 			//06F8 	1985
		RET		 					//06F9 	0004
			END

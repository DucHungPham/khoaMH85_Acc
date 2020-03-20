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
		LJUMP 	3E6H 			//0009 	3BE6
		LJUMP 	6A4H 			//000A 	3EA4

		//;smartkey.C: 251: unsigned char reAlertOn=0,tmp8,isSw=0,isFall=0,mpuOk=0,vibrateOn=0,acc
		//+                          Set=0;
		CLRR 	40H 			//000B 	0140
		ORG		000CH
		CLRR 	41H 			//000C 	0141
		CLRR 	32H 			//000D 	0132
		CLRR 	2FH 			//000E 	012F

		//;smartkey.C: 252: unsigned int isWait =0;
		CLRR 	30H 			//000F 	0130
		CLRR 	31H 			//0010 	0131

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
		LCALL 	6D9H 			//0018 	36D9

		//;smartkey.C: 261: gpio_init();
		LCALL 	658H 			//0019 	3658

		//;smartkey.C: 262: timer_init();
		LCALL 	694H 			//001A 	3694

		//;smartkey.C: 263: int_init();
		LCALL 	5F4H 			//001B 	35F4
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
		LCALL 	5D5H 			//0028 	35D5
		LDWI 	0H 			//0029 	2A00

		//;smartkey.C: 277: setState(0,0);
		BCR 	STATUS,5 		//002A 	1283
		CLRR 	20H 			//002B 	0120
		ORG		002CH
		CLRR 	21H 			//002C 	0121
		LCALL 	6CDH 			//002D 	36CD

		//;smartkey.C: 279: WRITE_EEPROM(0xFF,0xAA);
		LDWI 	AAH 			//002E 	2AAA
		STR 	20H 			//002F 	01A0
		LDWI 	FFH 			//0030 	2AFF
		LCALL 	60FH 			//0031 	360F

		//;smartkey.C: 280: WRITE_EEPROM(0xFF,0xAA);
		LDWI 	AAH 			//0032 	2AAA
		BCR 	STATUS,5 		//0033 	1283
		ORG		0034H
		STR 	20H 			//0034 	01A0
		LDWI 	FFH 			//0035 	2AFF
		LCALL 	60FH 			//0036 	360F

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
		LCALL 	6C0H 			//0046 	36C0
		STR 	44H 			//0047 	01C4

		//;smartkey.C: 286: if(tmp8==0xff) {WRITE_EEPROM(0x08,0);_delay((unsigned long)((2)*(40000
		//+                          00/4000.0)));}
		XORWI 	FFH 			//0048 	26FF
		BTSS 	STATUS,2 		//0049 	1D03
		LJUMP 	58H 			//004A 	3858
		LDWI 	8H 			//004B 	2A08
		ORG		004CH
		CLRR 	20H 			//004C 	0120
		LCALL 	60FH 			//004D 	360F
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
		LCALL 	6CDH 			//0063 	36CD
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
		LCALL 	6EEH 			//0071 	36EE

		//;smartkey.C: 295: } else {
		LJUMP 	7AH 			//0072 	387A

		//;smartkey.C: 296: setState(2,400);
		LDWI 	90H 			//0073 	2A90
		ORG		0074H
		STR 	20H 			//0074 	01A0
		LDWI 	1H 			//0075 	2A01
		STR 	21H 			//0076 	01A1
		LDWI 	2H 			//0077 	2A02
		LCALL 	6CDH 			//0078 	36CD

		//;smartkey.C: 298: mtOldState = 0;
		CLRR 	4CH 			//0079 	014C

		//;smartkey.C: 300: }
		//;smartkey.C: 303: tmp8 = READ_EEPROM(0x40);
		LDWI 	40H 			//007A 	2A40
		LCALL 	6C0H 			//007B 	36C0
		ORG		007CH
		STR 	44H 			//007C 	01C4

		//;smartkey.C: 304: if(tmp8==8){
		XORWI 	8H 			//007D 	2608
		BTSS 	STATUS,2 		//007E 	1D03
		LJUMP 	A4H 			//007F 	38A4

		//;smartkey.C: 305: tmp8= READ_EEPROM(0x41);
		LDWI 	41H 			//0080 	2A41
		LCALL 	6C0H 			//0081 	36C0
		STR 	44H 			//0082 	01C4
		LDWI 	1EH 			//0083 	2A1E
		ORG		0084H

		//;smartkey.C: 306: beep(30,1);
		CLRR 	24H 			//0084 	0124
		INCR	24H,1 			//0085 	09A4
		LCALL 	642H 			//0086 	3642

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
		LCALL 	60FH 			//0094 	360F
		LDWI 	40H 			//0095 	2A40

		//;smartkey.C: 313: }
		//;smartkey.C: 314: WRITE_EEPROM(0x40,0);
		BCR 	STATUS,5 		//0096 	1283
		CLRR 	20H 			//0097 	0120
		LCALL 	60FH 			//0098 	360F

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
		LCALL 	60FH 			//00AA 	360F

		//;smartkey.C: 320: tmp8 = READ_EEPROM(0x41);
		LDWI 	41H 			//00AB 	2A41
		ORG		00ACH
		LCALL 	6C0H 			//00AC 	36C0
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
		LCALL 	60FH 			//00CB 	360F
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
		LCALL 	5ADH 			//00DA 	35AD
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
		LCALL 	642H 			//00E6 	3642

		//;smartkey.C: 339: }
		//;smartkey.C: 345: tmp8= READ_EEPROM(0x40);
		LDWI 	40H 			//00E7 	2A40
		LCALL 	6C0H 			//00E8 	36C0
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
		LCALL 	642H 			//00F3 	3642
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
		LCALL 	572H 			//00FE 	3572
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
		LCALL 	46CH 			//0142 	346C
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
		LCALL 	46CH 			//014E 	346C
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
		LCALL 	46CH 			//015A 	346C
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
		LCALL 	642H 			//017D 	3642

		//;smartkey.C: 374: WRITE_EEPROM(0x10,(unsigned char)acXsum);
		LDR 	38H,0 			//017E 	0838
		STR 	20H 			//017F 	01A0
		LDWI 	10H 			//0180 	2A10
		LCALL 	60FH 			//0181 	360F

		//;smartkey.C: 375: WRITE_EEPROM(0x11,(unsigned char)acYsum);
		BCR 	STATUS,5 		//0182 	1283
		LDR 	36H,0 			//0183 	0836
		ORG		0184H
		STR 	20H 			//0184 	01A0
		LDWI 	11H 			//0185 	2A11
		LCALL 	60FH 			//0186 	360F

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
		LCALL 	642H 			//0195 	3642
		LDWI 	40H 			//0196 	2A40

		//;smartkey.C: 381: }
		//;smartkey.C: 382: WRITE_EEPROM(0x40,0);
		BCR 	STATUS,5 		//0197 	1283
		CLRR 	20H 			//0198 	0120
		LCALL 	60FH 			//0199 	360F

		//;smartkey.C: 384: }
		//;smartkey.C: 386: acXsum = (signed char)READ_EEPROM(0x10);
		LDWI 	10H 			//019A 	2A10
		LCALL 	6C0H 			//019B 	36C0
		ORG		019CH
		STR 	38H 			//019C 	01B8
		CLRR 	39H 			//019D 	0139
		BTSC 	38H,7 			//019E 	17B8
		DECR 	39H,1 			//019F 	0DB9

		//;smartkey.C: 387: acYsum = (signed char)READ_EEPROM(0x11);
		LDWI 	11H 			//01A0 	2A11
		LCALL 	6C0H 			//01A1 	36C0
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
		LCALL 	6C0H 			//01C2 	36C0
		XORWI 	CCH 			//01C3 	26CC
		ORG		01C4H
		BTSS 	STATUS,2 		//01C4 	1D03
		LJUMP 	1C9H 			//01C5 	39C9
		LDWI 	8H 			//01C6 	2A08
		CLRR 	20H 			//01C7 	0120
		LCALL 	60FH 			//01C8 	360F

		//;smartkey.C: 437: if((mtOldState == 3)){
		BCR 	STATUS,5 		//01C9 	1283
		LDR 	4CH,0 			//01CA 	084C
		XORWI 	3H 			//01CB 	2603
		ORG		01CCH
		BTSS 	STATUS,2 		//01CC 	1D03
		LJUMP 	1DAH 			//01CD 	39DA

		//;smartkey.C: 438: beepOn();TMR2ON = 0; beep(10,1);
		LCALL 	6EEH 			//01CE 	36EE
		LDWI 	AH 			//01CF 	2A0A
		BCR 	STATUS,5 		//01D0 	1283
		BCR 	12H,2 			//01D1 	1112
		CLRR 	24H 			//01D2 	0124
		INCR	24H,1 			//01D3 	09A4
		ORG		01D4H
		LCALL 	642H 			//01D4 	3642

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
		LCALL 	6CDH 			//01E7 	36CD

		//;smartkey.C: 444: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
		LDWI 	40H 			//01E8 	2A40
		LCALL 	6C0H 			//01E9 	36C0
		XORWI 	0H 			//01EA 	2600
		BTSC 	STATUS,2 		//01EB 	1503
		ORG		01ECH
		LJUMP 	1F0H 			//01EC 	39F0
		LDWI 	40H 			//01ED 	2A40
		CLRR 	20H 			//01EE 	0120
		LCALL 	60FH 			//01EF 	360F

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
		LCALL 	642H 			//01FC 	3642

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
		LCALL 	6F3H 			//0208 	36F3

		//;smartkey.C: 459: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LDWI 	8H 			//0209 	2A08
		LCALL 	6C0H 			//020A 	36C0
		XORWI 	CCH 			//020B 	26CC
		ORG		020CH
		BTSS 	STATUS,2 		//020C 	1D03
		LJUMP 	211H 			//020D 	3A11
		LDWI 	8H 			//020E 	2A08
		CLRR 	20H 			//020F 	0120
		LCALL 	60FH 			//0210 	360F
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
		LCALL 	6CDH 			//0218 	36CD

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
		LCALL 	6F3H 			//0222 	36F3

		//;smartkey.C: 470: setState(2,300);
		LDWI 	2CH 			//0223 	2A2C
		ORG		0224H
		BCR 	STATUS,5 		//0224 	1283
		STR 	20H 			//0225 	01A0
		LDWI 	1H 			//0226 	2A01
		STR 	21H 			//0227 	01A1
		LDWI 	2H 			//0228 	2A02
		LCALL 	6CDH 			//0229 	36CD

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
		LDWI 	E9H 			//0233 	2AE9
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
		LCALL 	6C0H 			//0240 	36C0
		IORWI 	0H 			//0241 	2500
		BTSS 	STATUS,2 		//0242 	1D03
		LJUMP 	248H 			//0243 	3A48
		ORG		0244H
		LDWI 	CCH 			//0244 	2ACC
		STR 	20H 			//0245 	01A0
		LDWI 	8H 			//0246 	2A08
		LCALL 	60FH 			//0247 	360F

		//;smartkey.C: 494: setState(3,1800);
		LDWI 	8H 			//0248 	2A08
		BCR 	STATUS,5 		//0249 	1283
		STR 	20H 			//024A 	01A0
		LDWI 	7H 			//024B 	2A07
		ORG		024CH
		STR 	21H 			//024C 	01A1
		LDWI 	3H 			//024D 	2A03
		LCALL 	6CDH 			//024E 	36CD

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
		LCALL 	6EEH 			//025A 	36EE

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
		LCALL 	6EEH 			//0262 	36EE
		LDWI 	2H 			//0263 	2A02
		ORG		0264H
		BCR 	STATUS,5 		//0264 	1283
		BCR 	12H,2 			//0265 	1112

		//;smartkey.C: 514: beep(10,2);
		STR 	24H 			//0266 	01A4
		LDWI 	AH 			//0267 	2A0A
		LCALL 	642H 			//0268 	3642

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
		LCALL 	6F3H 			//0286 	36F3
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
		LCALL 	6CDH 			//028E 	36CD

		//;smartkey.C: 545: break;
		LJUMP 	2EFH 			//028F 	3AEF

		//;smartkey.C: 547: beepOff();
		LCALL 	6F3H 			//0290 	36F3

		//;smartkey.C: 548: delay_x10ms(20);
		LDWI 	14H 			//0291 	2A14
		BCR 	STATUS,5 		//0292 	1283
		STR 	20H 			//0293 	01A0
		ORG		0294H
		CLRR 	21H 			//0294 	0121
		LCALL 	681H 			//0295 	3681

		//;smartkey.C: 549: beepOn();TMR2ON = 0;reAlertOn =0;
		LCALL 	6EEH 			//0296 	36EE
		LDWI 	1EH 			//0297 	2A1E
		BCR 	STATUS,5 		//0298 	1283
		BCR 	12H,2 			//0299 	1112
		CLRR 	40H 			//029A 	0140
		CLRR 	24H 			//029B 	0124
		ORG		029CH
		INCR	24H,1 			//029C 	09A4
		LCALL 	642H 			//029D 	3642
		LDWI 	0H 			//029E 	2A00

		//;smartkey.C: 551: setState(0,0);
		CLRR 	20H 			//029F 	0120
		CLRR 	21H 			//02A0 	0121
		LCALL 	6CDH 			//02A1 	36CD

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
		LCALL 	6C0H 			//02AC 	36C0
		XORWI 	CCH 			//02AD 	26CC
		BTSS 	STATUS,2 		//02AE 	1D03
		LJUMP 	2B3H 			//02AF 	3AB3
		LDWI 	8H 			//02B0 	2A08
		CLRR 	20H 			//02B1 	0120
		LCALL 	60FH 			//02B2 	360F

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
		LCALL 	6CDH 			//02BC 	36CD

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
		LCALL 	6EEH 			//02C8 	36EE

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
		LCALL 	642H 			//02D0 	3642
		LDWI 	40H 			//02D1 	2A40

		//;smartkey.C: 568: RegStatus |=(0x20);
		BSR 	49H,5 			//02D2 	1AC9

		//;smartkey.C: 571: if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
		LCALL 	6C0H 			//02D3 	36C0
		ORG		02D4H
		XORWI 	0H 			//02D4 	2600
		BTSC 	STATUS,2 		//02D5 	1503
		LJUMP 	2DAH 			//02D6 	3ADA
		LDWI 	40H 			//02D7 	2A40
		CLRR 	20H 			//02D8 	0120
		LCALL 	60FH 			//02D9 	360F

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
		LJUMP 	392H 			//02F7 	3B92
		DECRSZ 	74H,0 		//02F8 	0E74
		LJUMP 	392H 			//02F9 	3B92
		DECRSZ 	35H,0 		//02FA 	0E35
		LJUMP 	392H 			//02FB 	3B92
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
		LCALL 	572H 			//030B 	3572
		ORG		030CH
		IORWI 	0H 			//030C 	2500
		BTSS 	STATUS,2 		//030D 	1D03
		LJUMP 	392H 			//030E 	3B92

		//;smartkey.C: 594: if(compe(buf[1], (signed char)acXsum,5) && compe(buf[3], (signed char)
		//+                          acYsum,5)){
		BCR 	STATUS,5 		//030F 	1283
		LDR 	38H,0 			//0310 	0838
		STR 	20H 			//0311 	01A0
		LDWI 	5H 			//0312 	2A05
		STR 	21H 			//0313 	01A1
		ORG		0314H
		LDR 	3BH,0 			//0314 	083B
		LCALL 	4B1H 			//0315 	34B1
		XORWI 	0H 			//0316 	2600
		BCR 	STATUS,5 		//0317 	1283
		BTSC 	STATUS,2 		//0318 	1503
		LJUMP 	341H 			//0319 	3B41
		LDR 	36H,0 			//031A 	0836
		STR 	20H 			//031B 	01A0
		ORG		031CH
		LDWI 	5H 			//031C 	2A05
		STR 	21H 			//031D 	01A1
		LDR 	3DH,0 			//031E 	083D
		LCALL 	4B1H 			//031F 	34B1
		XORWI 	0H 			//0320 	2600

		//;smartkey.C: 597: isSw++;
		BCR 	STATUS,5 		//0321 	1283
		BTSC 	STATUS,2 		//0322 	1503
		LJUMP 	341H 			//0323 	3B41
		ORG		0324H
		LDWI 	2DH 			//0324 	2A2D
		INCR	41H,1 			//0325 	09C1

		//;smartkey.C: 598: if(isSw >44){
		SUBWR 	41H,0 			//0326 	0C41
		BTSS 	STATUS,0 		//0327 	1C03
		LJUMP 	334H 			//0328 	3B34
		LDWI 	2CH 			//0329 	2A2C

		//;smartkey.C: 599: isSw =0;
		CLRR 	41H 			//032A 	0141

		//;smartkey.C: 600: vibrateOn=1;
		CLRR 	2FH 			//032B 	012F
		ORG		032CH
		INCR	2FH,1 			//032C 	09AF

		//;smartkey.C: 603: RegStatus &=(~0x20);
		BCR 	49H,5 			//032D 	12C9

		//;smartkey.C: 604: setState(2,300);
		STR 	20H 			//032E 	01A0
		LDWI 	1H 			//032F 	2A01
		STR 	21H 			//0330 	01A1
		LDWI 	2H 			//0331 	2A02
		LCALL 	6CDH 			//0332 	36CD

		//;smartkey.C: 606: }
		LJUMP 	371H 			//0333 	3B71
		ORG		0334H

		//;smartkey.C: 607: else if(isSw > 25){
		LDWI 	1AH 			//0334 	2A1A
		SUBWR 	41H,0 			//0335 	0C41
		BTSC 	STATUS,0 		//0336 	1403

		//;smartkey.C: 608: if(isSw%2==0){
		BTSC 	41H,0 			//0337 	1441
		LJUMP 	371H 			//0338 	3B71

		//;smartkey.C: 609: beepOn();TMR2ON = 0; beep(7,1);
		LCALL 	6EEH 			//0339 	36EE
		LDWI 	7H 			//033A 	2A07
		BCR 	STATUS,5 		//033B 	1283
		ORG		033CH
		BCR 	12H,2 			//033C 	1112
		CLRR 	24H 			//033D 	0124
		INCR	24H,1 			//033E 	09A4
		LCALL 	642H 			//033F 	3642
		LJUMP 	371H 			//0340 	3B71

		//;smartkey.C: 614: else{
		//;smartkey.C: 615: isSw =0;
		//;smartkey.C: 610: }
		//;smartkey.C: 611: }
		//;smartkey.C: 613: }
		CLRR 	41H 			//0341 	0141

		//;smartkey.C: 618: if(compe(buf[1], acXOld,1) && compe(buf[3], acYOld,1)){
		LDR 	34H,0 			//0342 	0834
		STR 	20H 			//0343 	01A0
		ORG		0344H
		CLRR 	21H 			//0344 	0121
		INCR	21H,1 			//0345 	09A1
		LDR 	3BH,0 			//0346 	083B
		LCALL 	4B1H 			//0347 	34B1
		XORWI 	0H 			//0348 	2600
		BCR 	STATUS,5 		//0349 	1283
		BTSC 	STATUS,2 		//034A 	1503
		LJUMP 	36FH 			//034B 	3B6F
		ORG		034CH
		LDR 	33H,0 			//034C 	0833
		STR 	20H 			//034D 	01A0
		CLRR 	21H 			//034E 	0121
		INCR	21H,1 			//034F 	09A1
		LDR 	3DH,0 			//0350 	083D
		LCALL 	4B1H 			//0351 	34B1
		XORWI 	0H 			//0352 	2600

		//;smartkey.C: 619: isWait++;
		BCR 	STATUS,5 		//0353 	1283
		ORG		0354H
		BTSC 	STATUS,2 		//0354 	1503
		LJUMP 	36FH 			//0355 	3B6F
		INCR	30H,1 			//0356 	09B0
		BTSC 	STATUS,2 		//0357 	1503
		INCR	31H,1 			//0358 	09B1

		//;smartkey.C: 620: if(isWait==450){
		DECR 	31H,0 			//0359 	0D31
		LDWI 	C2H 			//035A 	2AC2
		BTSC 	STATUS,2 		//035B 	1503
		ORG		035CH
		XORWR 	30H,0 			//035C 	0430
		BTSS 	STATUS,2 		//035D 	1D03
		LJUMP 	371H 			//035E 	3B71
		LDWI 	2H 			//035F 	2A02

		//;smartkey.C: 621: isWait = 0;
		CLRR 	30H 			//0360 	0130
		CLRR 	31H 			//0361 	0131

		//;smartkey.C: 622: beep(7,2);
		STR 	24H 			//0362 	01A4
		LDWI 	7H 			//0363 	2A07
		ORG		0364H
		LCALL 	642H 			//0364 	3642
		LDWI 	2CH 			//0365 	2A2C

		//;smartkey.C: 623: vibrateOn=1;
		CLRR 	2FH 			//0366 	012F
		INCR	2FH,1 			//0367 	09AF

		//;smartkey.C: 624: RegStatus &=(~0x20);
		BCR 	49H,5 			//0368 	12C9

		//;smartkey.C: 625: setState(2,300);
		STR 	20H 			//0369 	01A0
		LDWI 	1H 			//036A 	2A01
		STR 	21H 			//036B 	01A1
		ORG		036CH
		LDWI 	2H 			//036C 	2A02
		LCALL 	6CDH 			//036D 	36CD
		LJUMP 	371H 			//036E 	3B71

		//;smartkey.C: 628: else
		//;smartkey.C: 629: isWait=0;
		CLRR 	30H 			//036F 	0130
		CLRR 	31H 			//0370 	0131

		//;smartkey.C: 631: }
		//;smartkey.C: 633: if( (buf[5] > -31) && (buf[5] < 31)) {
		LDR 	3FH,0 			//0371 	083F
		XORWI 	80H 			//0372 	2680
		ADDWI 	9EH 			//0373 	279E
		ORG		0374H
		BTSS 	STATUS,0 		//0374 	1C03
		LJUMP 	38DH 			//0375 	3B8D
		LDR 	3FH,0 			//0376 	083F
		XORWI 	80H 			//0377 	2680
		ADDWI 	61H 			//0378 	2761
		BTSC 	STATUS,0 		//0379 	1403
		LJUMP 	38DH 			//037A 	3B8D
		LDWI 	5H 			//037B 	2A05
		ORG		037CH

		//;smartkey.C: 634: isFall++;
		INCR	32H,1 			//037C 	09B2

		//;smartkey.C: 635: if(isFall >4){
		SUBWR 	32H,0 			//037D 	0C32
		BTSS 	STATUS,0 		//037E 	1C03
		LJUMP 	38EH 			//037F 	3B8E
		LDWI 	2H 			//0380 	2A02

		//;smartkey.C: 636: isFall =0;
		CLRR 	32H 			//0381 	0132

		//;smartkey.C: 637: beep(7,2);
		STR 	24H 			//0382 	01A4
		LDWI 	7H 			//0383 	2A07
		ORG		0384H
		LCALL 	642H 			//0384 	3642
		LDWI 	2CH 			//0385 	2A2C

		//;smartkey.C: 638: RegStatus &=(~0x20);
		BCR 	49H,5 			//0386 	12C9

		//;smartkey.C: 639: setState(2,300);
		STR 	20H 			//0387 	01A0
		LDWI 	1H 			//0388 	2A01
		STR 	21H 			//0389 	01A1
		LDWI 	2H 			//038A 	2A02
		LCALL 	6CDH 			//038B 	36CD
		ORG		038CH
		LJUMP 	38EH 			//038C 	3B8E

		//;smartkey.C: 642: else{
		//;smartkey.C: 643: isFall=0;
		CLRR 	32H 			//038D 	0132

		//;smartkey.C: 644: }
		//;smartkey.C: 646: acYOld = buf[3];acXOld = buf[1];
		LDR 	3DH,0 			//038E 	083D
		STR 	33H 			//038F 	01B3
		LDR 	3BH,0 			//0390 	083B
		STR 	34H 			//0391 	01B4

		//;smartkey.C: 647: }
		//;smartkey.C: 649: }
		//;smartkey.C: 652: if((timeTick>tmp16) && (mtState == 0 ) && mpuOk ==1){
		LDR 	71H,0 			//0392 	0871
		BCR 	STATUS,5 		//0393 	1283
		ORG		0394H
		SUBWR 	43H,0 			//0394 	0C43
		BTSS 	STATUS,2 		//0395 	1D03
		LJUMP 	399H 			//0396 	3B99
		LDR 	70H,0 			//0397 	0870
		SUBWR 	42H,0 			//0398 	0C42
		BTSC 	STATUS,0 		//0399 	1403
		LJUMP 	3DDH 			//039A 	3BDD
		LDR 	74H,1 			//039B 	08F4
		ORG		039CH
		BTSS 	STATUS,2 		//039C 	1D03
		LJUMP 	3DDH 			//039D 	3BDD
		DECRSZ 	35H,0 		//039E 	0E35
		LJUMP 	3DDH 			//039F 	3BDD

		//;smartkey.C: 654: if(timeTick >65000) timeTick =0;
		LDWI 	FDH 			//03A0 	2AFD
		SUBWR 	71H,0 			//03A1 	0C71
		LDWI 	E9H 			//03A2 	2AE9
		BTSC 	STATUS,2 		//03A3 	1503
		ORG		03A4H
		SUBWR 	70H,0 			//03A4 	0C70
		BTSS 	STATUS,0 		//03A5 	1C03
		LJUMP 	3A9H 			//03A6 	3BA9
		CLRR 	70H 			//03A7 	0170
		CLRR 	71H 			//03A8 	0171

		//;smartkey.C: 655: tmp16 = timeTick+40;
		LDR 	71H,0 			//03A9 	0871
		STR 	43H 			//03AA 	01C3
		LDR 	70H,0 			//03AB 	0870
		ORG		03ACH
		STR 	42H 			//03AC 	01C2
		LDWI 	28H 			//03AD 	2A28
		ADDWR 	42H,1 			//03AE 	0BC2
		BTSC 	STATUS,0 		//03AF 	1403
		INCR	43H,1 			//03B0 	09C3

		//;smartkey.C: 657: if(AccRead(0x02,buf,6)==0){
		LDWI 	3AH 			//03B1 	2A3A
		STR 	24H 			//03B2 	01A4
		LDWI 	0H 			//03B3 	2A00
		ORG		03B4H
		STR 	25H 			//03B4 	01A5
		LDWI 	6H 			//03B5 	2A06
		STR 	26H 			//03B6 	01A6
		LDWI 	2H 			//03B7 	2A02
		LCALL 	572H 			//03B8 	3572
		IORWI 	0H 			//03B9 	2500

		//;smartkey.C: 659: if(vibrateOn==1){
		BCR 	STATUS,5 		//03BA 	1283
		BTSS 	STATUS,2 		//03BB 	1D03
		ORG		03BCH
		LJUMP 	3DEH 			//03BC 	3BDE
		DECRSZ 	2FH,0 		//03BD 	0E2F
		LJUMP 	3DDH 			//03BE 	3BDD

		//;smartkey.C: 660: if(compe(buf[1],acXOld ,3) && compe(buf[3],acYOld ,3)){
		LDR 	34H,0 			//03BF 	0834
		STR 	20H 			//03C0 	01A0
		LDWI 	3H 			//03C1 	2A03
		STR 	21H 			//03C2 	01A1
		LDR 	3BH,0 			//03C3 	083B
		ORG		03C4H
		LCALL 	4B1H 			//03C4 	34B1
		XORWI 	0H 			//03C5 	2600
		BCR 	STATUS,5 		//03C6 	1283
		BTSC 	STATUS,2 		//03C7 	1503
		LJUMP 	3D5H 			//03C8 	3BD5
		LDR 	33H,0 			//03C9 	0833
		STR 	20H 			//03CA 	01A0
		LDWI 	3H 			//03CB 	2A03
		ORG		03CCH
		STR 	21H 			//03CC 	01A1
		LDR 	3DH,0 			//03CD 	083D
		LCALL 	4B1H 			//03CE 	34B1
		XORWI 	0H 			//03CF 	2600

		//;smartkey.C: 662: isSw=0;
		BCR 	STATUS,5 		//03D0 	1283
		BTSC 	STATUS,2 		//03D1 	1503
		LJUMP 	3D5H 			//03D2 	3BD5
		CLRR 	41H 			//03D3 	0141
		ORG		03D4H

		//;smartkey.C: 665: }
		LJUMP 	3DDH 			//03D4 	3BDD

		//;smartkey.C: 666: else{
		//;smartkey.C: 667: isSw++;
		INCR	41H,1 			//03D5 	09C1

		//;smartkey.C: 670: {
		//;smartkey.C: 671: beepOn();TMR2ON = 0; beep(7,3);
		LCALL 	6EEH 			//03D6 	36EE
		LDWI 	3H 			//03D7 	2A03
		BCR 	STATUS,5 		//03D8 	1283
		BCR 	12H,2 			//03D9 	1112
		STR 	24H 			//03DA 	01A4
		LDWI 	7H 			//03DB 	2A07
		ORG		03DCH
		LCALL 	642H 			//03DC 	3642

		//;smartkey.C: 672: }
		//;smartkey.C: 673: }
		//;smartkey.C: 674: }
		//;smartkey.C: 676: }
		//;smartkey.C: 679: }
		//;smartkey.C: 681: if(RegStatus & 0x20) {RC0 =1;RC1 =1;}
		BCR 	STATUS,5 		//03DD 	1283
		BTSS 	49H,5 			//03DE 	1EC9
		LJUMP 	3E3H 			//03DF 	3BE3
		BSR 	7H,0 			//03E0 	1807
		BSR 	7H,1 			//03E1 	1887
		LJUMP 	1A8H 			//03E2 	39A8

		//;smartkey.C: 682: else {RC0 =0;RC1 =0;}
		BCR 	7H,0 			//03E3 	1007
		ORG		03E4H
		BCR 	7H,1 			//03E4 	1087
		LJUMP 	1A8H 			//03E5 	39A8

		//;smartkey.C: 42: if(PAIE&&PAIF){
		BTSC 	INTCON,3 		//03E6 	158B
		BTSS 	INTCON,0 		//03E7 	1C0B
		LJUMP 	3F7H 			//03E8 	3BF7

		//;smartkey.C: 44: tmp = PORTA;
		BCR 	STATUS,5 		//03E9 	1283
		LDR 	5H,0 			//03EA 	0805

		//;smartkey.C: 45: PAIF = 0;
		BCR 	INTCON,0 		//03EB 	100B
		ORG		03ECH

		//;smartkey.C: 47: if(RA5){
		BTSS 	5H,5 			//03EC 	1E85
		LJUMP 	3F6H 			//03ED 	3BF6

		//;smartkey.C: 49: if(mode_chek == 0){
		LDR 	73H,1 			//03EE 	08F3
		BTSS 	STATUS,2 		//03EF 	1D03
		LJUMP 	3F7H 			//03F0 	3BF7

		//;smartkey.C: 50: cntCyc = 0;
		CLRR 	72H 			//03F1 	0172

		//;smartkey.C: 51: cntOff = 0;
		CLRR 	4AH 			//03F2 	014A

		//;smartkey.C: 53: mode_chek = 1;
		CLRR 	73H 			//03F3 	0173
		ORG		03F4H
		INCR	73H,1 			//03F4 	09F3
		LJUMP 	3F7H 			//03F5 	3BF7

		//;smartkey.C: 58: else{
		//;smartkey.C: 59: cntOff = 0;
		CLRR 	4AH 			//03F6 	014A

		//;smartkey.C: 61: }
		//;smartkey.C: 63: }
		//;smartkey.C: 66: if(INTE&&INTF){
		BTSC 	INTCON,4 		//03F7 	160B
		BTSS 	INTCON,1 		//03F8 	1C8B
		LJUMP 	40DH 			//03F9 	3C0D

		//;smartkey.C: 67: unsigned char tmp;
		//;smartkey.C: 68: INTF = 0;
		BCR 	INTCON,1 		//03FA 	108B

		//;smartkey.C: 70: if( RA2==0){
		BCR 	STATUS,5 		//03FB 	1283
		ORG		03FCH
		BTSC 	5H,2 			//03FC 	1505
		LJUMP 	40DH 			//03FD 	3C0D

		//;smartkey.C: 72: if(timeTick <0x20){
		LDWI 	0H 			//03FE 	2A00
		SUBWR 	71H,0 			//03FF 	0C71
		LDWI 	20H 			//0400 	2A20
		BTSC 	STATUS,2 		//0401 	1503
		SUBWR 	70H,0 			//0402 	0C70
		BTSC 	STATUS,0 		//0403 	1403
		ORG		0404H
		LJUMP 	40CH 			//0404 	3C0C

		//;smartkey.C: 73: tmp = READ_EEPROM(0x40);
		LDWI 	40H 			//0405 	2A40
		LCALL 	6E1H 			//0406 	36E1
		STR 	79H 			//0407 	01F9

		//;smartkey.C: 74: WRITE_EEPROM(0x40,tmp+1);
		INCR	79H,0 			//0408 	0979
		STR 	75H 			//0409 	01F5
		LDWI 	40H 			//040A 	2A40
		LCALL 	62AH 			//040B 	362A
		ORG		040CH
		LJUMP 	40CH 			//040C 	3C0C

		//;smartkey.C: 83: }
		//;smartkey.C: 85: }
		//;smartkey.C: 88: if (T0IE && T0IF) {
		BTSC 	INTCON,5 		//040D 	168B
		BTSS 	INTCON,2 		//040E 	1D0B
		LJUMP 	45CH 			//040F 	3C5C
		LDWI 	B3H 			//0410 	2AB3

		//;smartkey.C: 89: T0IF = 0;
		BCR 	INTCON,2 		//0411 	110B

		//;smartkey.C: 90: TMR0 = 179;
		BCR 	STATUS,5 		//0412 	1283
		STR 	1H 			//0413 	0181
		ORG		0414H

		//;smartkey.C: 96: if( mode_chek == 1){
		DECRSZ 	73H,0 		//0414 	0E73
		LJUMP 	42EH 			//0415 	3C2E

		//;smartkey.C: 98: cntCyc++;
		INCR	72H,1 			//0416 	09F2

		//;smartkey.C: 100: if(RA5==0){
		BTSC 	5H,5 			//0417 	1685
		LJUMP 	42EH 			//0418 	3C2E
		LDWI 	10H 			//0419 	2A10

		//;smartkey.C: 102: cntOff++;
		INCR	4AH,1 			//041A 	09CA

		//;smartkey.C: 105: if(cntOff > 15){
		SUBWR 	4AH,0 			//041B 	0C4A
		ORG		041CH
		BTSS 	STATUS,0 		//041C 	1C03
		LJUMP 	42EH 			//041D 	3C2E
		LDWI 	10H 			//041E 	2A10

		//;smartkey.C: 107: mode_chek = 0;
		CLRR 	73H 			//041F 	0173

		//;smartkey.C: 109: if((cntCyc>15) &&(cntCyc<50)) {
		SUBWR 	72H,0 			//0420 	0C72
		LDWI 	32H 			//0421 	2A32
		BTSS 	STATUS,0 		//0422 	1C03
		LJUMP 	42AH 			//0423 	3C2A
		ORG		0424H
		SUBWR 	72H,0 			//0424 	0C72
		BTSC 	STATUS,0 		//0425 	1403
		LJUMP 	429H 			//0426 	3C29

		//;smartkey.C: 110: RegStatus |= (0x40);
		BSR 	49H,6 			//0427 	1B49

		//;smartkey.C: 111: } else if (cntCyc>=50){
		LJUMP 	42DH 			//0428 	3C2D
		LDWI 	32H 			//0429 	2A32
		SUBWR 	72H,0 			//042A 	0C72
		BTSC 	STATUS,0 		//042B 	1403
		ORG		042CH

		//;smartkey.C: 112: RegStatus &= ~(0x40);
		BCR 	49H,6 			//042C 	1349

		//;smartkey.C: 113: }
		//;smartkey.C: 116: RegStatus |= 0x80;
		BSR 	49H,7 			//042D 	1BC9

		//;smartkey.C: 117: }
		//;smartkey.C: 119: }
		//;smartkey.C: 129: }
		//;smartkey.C: 132: timeTick++;
		INCR	70H,1 			//042E 	09F0
		BTSC 	STATUS,2 		//042F 	1503
		INCR	71H,1 			//0430 	09F1

		//;smartkey.C: 134: if((mtState == 4)||(mtState == 3)){
		LDR 	74H,0 			//0431 	0874
		XORWI 	4H 			//0432 	2604
		BTSC 	STATUS,2 		//0433 	1503
		ORG		0434H
		LJUMP 	439H 			//0434 	3C39
		LDR 	74H,0 			//0435 	0874
		XORWI 	3H 			//0436 	2603
		BTSS 	STATUS,2 		//0437 	1D03
		LJUMP 	45CH 			//0438 	3C5C

		//;smartkey.C: 136: if(timeTick > cntTmp){
		LDR 	71H,0 			//0439 	0871
		SUBWR 	46H,0 			//043A 	0C46
		BTSS 	STATUS,2 		//043B 	1D03
		ORG		043CH
		LJUMP 	43FH 			//043C 	3C3F
		LDR 	70H,0 			//043D 	0870
		SUBWR 	45H,0 			//043E 	0C45
		BTSC 	STATUS,0 		//043F 	1403
		LJUMP 	45CH 			//0440 	3C5C

		//;smartkey.C: 137: cntTmp = timeTick+38;
		LDR 	71H,0 			//0441 	0871
		STR 	46H 			//0442 	01C6
		LDR 	70H,0 			//0443 	0870
		ORG		0444H
		STR 	45H 			//0444 	01C5
		LDWI 	26H 			//0445 	2A26
		ADDWR 	45H,1 			//0446 	0BC5
		BTSC 	STATUS,0 		//0447 	1403
		INCR	46H,1 			//0448 	09C6

		//;smartkey.C: 138: if(cntTmp<=timeOut)
		LDR 	46H,0 			//0449 	0846
		SUBWR 	48H,0 			//044A 	0C48
		BTSS 	STATUS,2 		//044B 	1D03
		ORG		044CH
		LJUMP 	44FH 			//044C 	3C4F
		LDR 	45H,0 			//044D 	0845
		SUBWR 	47H,0 			//044E 	0C47

		//;smartkey.C: 139: {
		//;smartkey.C: 140: TMR2IE = 0;
		BSR 	STATUS,5 		//044F 	1A83
		BTSS 	STATUS,0 		//0450 	1C03
		LJUMP 	45DH 			//0451 	3C5D
		BCR 	CH,1 			//0452 	108C

		//;smartkey.C: 142: if (PR2L == 20)
		LDR 	11H,0 			//0453 	0811
		ORG		0454H
		XORWI 	14H 			//0454 	2614
		BTSS 	STATUS,2 		//0455 	1D03
		LJUMP 	459H 			//0456 	3C59

		//;smartkey.C: 143: PR2L = 25;
		LDWI 	19H 			//0457 	2A19
		LJUMP 	45AH 			//0458 	3C5A

		//;smartkey.C: 144: else
		//;smartkey.C: 145: PR2L = 20;
		LDWI 	14H 			//0459 	2A14
		STR 	11H 			//045A 	0191

		//;smartkey.C: 146: TMR2IE = 1;
		BSR 	CH,1 			//045B 	188C
		ORG		045CH

		//;smartkey.C: 147: }
		//;smartkey.C: 148: }
		//;smartkey.C: 149: }
		//;smartkey.C: 152: }
		//;smartkey.C: 155: if(TMR2IE&&TMR2IF)
		BSR 	STATUS,5 		//045C 	1A83
		BTSS 	CH,1 			//045D 	1C8C
		LJUMP 	465H 			//045E 	3C65
		BCR 	STATUS,5 		//045F 	1283
		BTSS 	CH,1 			//0460 	1C8C
		LJUMP 	465H 			//0461 	3C65
		LDWI 	8H 			//0462 	2A08

		//;smartkey.C: 156: {
		//;smartkey.C: 157: TMR2IF = 0;
		BCR 	CH,1 			//0463 	108C
		ORG		0464H

		//;smartkey.C: 158: RA3 =~ RA3;
		XORWR 	5H,1 			//0464 	0485
		LDR 	78H,0 			//0465 	0878
		STR 	PCLATH 			//0466 	018A
		SWAPR 	77H,0 			//0467 	0777
		STR 	STATUS 			//0468 	0183
		SWAPR 	7EH,1 			//0469 	07FE
		SWAPR 	7EH,0 			//046A 	077E
		RETI		 			//046B 	0009
		ORG		046CH
		CLRR 	25H 			//046C 	0125
		BTSS 	21H,7 			//046D 	1FA1
		LJUMP 	476H 			//046E 	3C76
		COMR 	20H,1 			//046F 	0FA0
		COMR 	21H,1 			//0470 	0FA1
		INCR	20H,1 			//0471 	09A0
		BTSC 	STATUS,2 		//0472 	1503
		INCR	21H,1 			//0473 	09A1
		ORG		0474H
		CLRR 	25H 			//0474 	0125
		INCR	25H,1 			//0475 	09A5
		BTSS 	23H,7 			//0476 	1FA3
		LJUMP 	47FH 			//0477 	3C7F
		COMR 	22H,1 			//0478 	0FA2
		COMR 	23H,1 			//0479 	0FA3
		INCR	22H,1 			//047A 	09A2
		BTSC 	STATUS,2 		//047B 	1503
		ORG		047CH
		INCR	23H,1 			//047C 	09A3
		LDWI 	1H 			//047D 	2A01
		XORWR 	25H,1 			//047E 	04A5
		CLRR 	26H 			//047F 	0126
		CLRR 	27H 			//0480 	0127
		LDR 	21H,0 			//0481 	0821
		IORWR 	20H,0 			//0482 	0320
		BTSC 	STATUS,2 		//0483 	1503
		ORG		0484H
		LJUMP 	4A4H 			//0484 	3CA4
		CLRR 	24H 			//0485 	0124
		INCR	24H,1 			//0486 	09A4
		BTSC 	21H,7 			//0487 	17A1
		LJUMP 	48DH 			//0488 	3C8D
		BCR 	STATUS,0 		//0489 	1003
		RLR 	20H,1 			//048A 	05A0
		RLR 	21H,1 			//048B 	05A1
		ORG		048CH
		LJUMP 	486H 			//048C 	3C86
		BCR 	STATUS,0 		//048D 	1003
		RLR 	26H,1 			//048E 	05A6
		RLR 	27H,1 			//048F 	05A7
		LDR 	21H,0 			//0490 	0821
		SUBWR 	23H,0 			//0491 	0C23
		BTSS 	STATUS,2 		//0492 	1D03
		LJUMP 	496H 			//0493 	3C96
		ORG		0494H
		LDR 	20H,0 			//0494 	0820
		SUBWR 	22H,0 			//0495 	0C22
		BTSS 	STATUS,0 		//0496 	1C03
		LJUMP 	4A0H 			//0497 	3CA0
		LDR 	20H,0 			//0498 	0820
		SUBWR 	22H,1 			//0499 	0CA2
		LDR 	21H,0 			//049A 	0821
		BTSS 	STATUS,0 		//049B 	1C03
		ORG		049CH
		DECR 	23H,1 			//049C 	0DA3
		SUBWR 	23H,1 			//049D 	0CA3
		BSR 	26H,0 			//049E 	1826
		BCR 	STATUS,0 		//049F 	1003
		RRR	21H,1 			//04A0 	06A1
		RRR	20H,1 			//04A1 	06A0
		DECRSZ 	24H,1 		//04A2 	0EA4
		LJUMP 	48DH 			//04A3 	3C8D
		ORG		04A4H
		LDR 	25H,0 			//04A4 	0825
		BTSC 	STATUS,2 		//04A5 	1503
		LJUMP 	4ACH 			//04A6 	3CAC
		COMR 	26H,1 			//04A7 	0FA6
		COMR 	27H,1 			//04A8 	0FA7
		INCR	26H,1 			//04A9 	09A6
		BTSC 	STATUS,2 		//04AA 	1503
		INCR	27H,1 			//04AB 	09A7
		ORG		04ACH
		LDR 	27H,0 			//04AC 	0827
		STR 	21H 			//04AD 	01A1
		LDR 	26H,0 			//04AE 	0826
		STR 	20H 			//04AF 	01A0
		RET		 					//04B0 	0004
		STR 	27H 			//04B1 	01A7

		//;smartkey.C: 228: if(a>b){
		LDR 	20H,0 			//04B2 	0820
		XORWI 	80H 			//04B3 	2680
		ORG		04B4H
		STR 	22H 			//04B4 	01A2
		LDR 	27H,0 			//04B5 	0827
		XORWI 	80H 			//04B6 	2680
		SUBWR 	22H,1 			//04B7 	0CA2
		BTSC 	STATUS,0 		//04B8 	1403
		LJUMP 	4DDH 			//04B9 	3CDD

		//;smartkey.C: 229: if((a-b)<=dt) return 1;
		LDR 	20H,0 			//04BA 	0820
		SUBWR 	27H,0 			//04BB 	0C27
		ORG		04BCH
		STR 	22H 			//04BC 	01A2
		CLRR 	23H 			//04BD 	0123
		BTSS 	STATUS,0 		//04BE 	1C03
		DECR 	23H,1 			//04BF 	0DA3
		BTSC 	27H,7 			//04C0 	17A7
		DECR 	23H,1 			//04C1 	0DA3
		BTSC 	20H,7 			//04C2 	17A0
		INCR	23H,1 			//04C3 	09A3
		ORG		04C4H
		BCR 	STATUS,5 		//04C4 	1283
		LCALL 	4EAH 			//04C5 	34EA
		BTSS 	STATUS,2 		//04C6 	1D03
		LJUMP 	4CAH 			//04C7 	3CCA
		LDR 	22H,0 			//04C8 	0822
		SUBWR 	24H,0 			//04C9 	0C24
		BTSS 	STATUS,0 		//04CA 	1C03
		RETW 	0H 			//04CB 	2100
		ORG		04CCH
		RETW 	1H 			//04CC 	2101

		//;smartkey.C: 233: if((b-a)<=dt) return 1;
		SUBWR 	20H,0 			//04CD 	0C20
		STR 	22H 			//04CE 	01A2
		CLRR 	23H 			//04CF 	0123
		BTSS 	STATUS,0 		//04D0 	1C03
		DECR 	23H,1 			//04D1 	0DA3
		BTSC 	20H,7 			//04D2 	17A0
		DECR 	23H,1 			//04D3 	0DA3
		ORG		04D4H
		BTSC 	27H,7 			//04D4 	17A7
		INCR	23H,1 			//04D5 	09A3
		BCR 	STATUS,5 		//04D6 	1283
		LCALL 	4EAH 			//04D7 	34EA
		BTSS 	STATUS,2 		//04D8 	1D03
		LJUMP 	4CAH 			//04D9 	3CCA
		LDR 	22H,0 			//04DA 	0822
		SUBWR 	24H,0 			//04DB 	0C24
		ORG		04DCH
		LJUMP 	4CAH 			//04DC 	3CCA

		//;smartkey.C: 230: else return 0;
		//;smartkey.C: 232: else if(a<b){
		LDR 	27H,0 			//04DD 	0827
		XORWI 	80H 			//04DE 	2680
		STR 	22H 			//04DF 	01A2
		LDR 	20H,0 			//04E0 	0820
		XORWI 	80H 			//04E1 	2680
		SUBWR 	22H,1 			//04E2 	0CA2

		//;smartkey.C: 236: else if(a==b){
		LDR 	27H,0 			//04E3 	0827
		ORG		04E4H
		BTSS 	STATUS,0 		//04E4 	1C03
		LJUMP 	4CDH 			//04E5 	3CCD
		XORWR 	20H,0 			//04E6 	0420
		BTSC 	STATUS,2 		//04E7 	1503
		RETW 	1H 			//04E8 	2101
		RETW 	0H 			//04E9 	2100
		LDR 	21H,0 			//04EA 	0821
		STR 	24H 			//04EB 	01A4
		ORG		04ECH
		CLRR 	25H 			//04EC 	0125
		BTSC 	24H,7 			//04ED 	17A4
		DECR 	25H,1 			//04EE 	0DA5
		LDR 	25H,0 			//04EF 	0825
		XORWI 	80H 			//04F0 	2680
		STR 	26H 			//04F1 	01A6
		LDR 	23H,0 			//04F2 	0823
		XORWI 	80H 			//04F3 	2680
		ORG		04F4H
		SUBWR 	26H,0 			//04F4 	0C26
		RET		 					//04F5 	0004

		//;mpu6x.c: 24: else
		//;mpu6x.c: 25: return 1;
		//;mpu6x.c: 21: else
		//;mpu6x.c: 22: return 2;
		BCR 	STATUS,5 		//04F6 	1283
		STR 	21H 			//04F7 	01A1
		CLRR 	22H 			//04F8 	0122

		//;SWI2C.C: 115: RA7 = 0;
		BCR 	5H,7 			//04F9 	1385

		//;SWI2C.C: 116: TRISA |=0x40;;
		BSR 	STATUS,5 		//04FA 	1A83
		BSR 	5H,6 			//04FB 	1B05
		ORG		04FCH

		//;SWI2C.C: 117: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//04FC 	2A05
		BCR 	STATUS,5 		//04FD 	1283
		STR 	20H 			//04FE 	01A0
		DECRSZ 	20H,1 		//04FF 	0EA0
		LJUMP 	4FFH 			//0500 	3CFF

		//;SWI2C.C: 118: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//0501 	1283
		CLRR 	23H 			//0502 	0123
		LDWI 	5H 			//0503 	2A05
		ORG		0504H

		//;SWI2C.C: 119: {
		//;SWI2C.C: 120: RA7 = 1;
		BSR 	5H,7 			//0504 	1B85

		//;SWI2C.C: 121: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0505 	01A0
		DECRSZ 	20H,1 		//0506 	0EA0
		LJUMP 	506H 			//0507 	3D06

		//;SWI2C.C: 122: dat = dat<<1 |(RA6 & 1 );
		LDWI 	0H 			//0508 	2A00
		BCR 	STATUS,5 		//0509 	1283
		BTSC 	5H,6 			//050A 	1705
		LDWI 	1H 			//050B 	2A01
		ORG		050CH
		ANDWI 	1H 			//050C 	2401
		STR 	20H 			//050D 	01A0
		BCR 	STATUS,0 		//050E 	1003
		RLR 	22H,0 			//050F 	0522
		IORWR 	20H,0 			//0510 	0320
		STR 	22H 			//0511 	01A2
		LDWI 	5H 			//0512 	2A05

		//;SWI2C.C: 125: RA7 = 0;
		BCR 	5H,7 			//0513 	1385
		ORG		0514H

		//;SWI2C.C: 126: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0514 	01A0
		DECRSZ 	20H,1 		//0515 	0EA0
		LJUMP 	515H 			//0516 	3D15
		LDWI 	8H 			//0517 	2A08
		BCR 	STATUS,5 		//0518 	1283
		INCR	23H,1 			//0519 	09A3
		SUBWR 	23H,0 			//051A 	0C23
		BTSS 	STATUS,0 		//051B 	1C03
		ORG		051CH
		LJUMP 	503H 			//051C 	3D03

		//;SWI2C.C: 127: }
		//;SWI2C.C: 129: TRISA &=0xbf;;
		BSR 	STATUS,5 		//051D 	1A83
		BCR 	5H,6 			//051E 	1305

		//;SWI2C.C: 131: RA6 = (Ack) ? 0 : 1;
		BCR 	STATUS,5 		//051F 	1283
		LDR 	21H,1 			//0520 	08A1
		BCR 	STATUS,5 		//0521 	1283
		BTSS 	STATUS,2 		//0522 	1D03
		LJUMP 	526H 			//0523 	3D26
		ORG		0524H
		BSR 	5H,6 			//0524 	1B05
		LJUMP 	527H 			//0525 	3D27
		BCR 	5H,6 			//0526 	1305
		LDWI 	5H 			//0527 	2A05

		//;SWI2C.C: 132: RA7 = 1;
		BSR 	5H,7 			//0528 	1B85

		//;SWI2C.C: 133: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0529 	01A0
		DECRSZ 	20H,1 		//052A 	0EA0
		LJUMP 	52AH 			//052B 	3D2A
		ORG		052CH
		LDWI 	5H 			//052C 	2A05

		//;SWI2C.C: 134: RA7 = 0;
		BCR 	STATUS,5 		//052D 	1283
		BCR 	5H,7 			//052E 	1385

		//;SWI2C.C: 135: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//052F 	01A0
		DECRSZ 	20H,1 		//0530 	0EA0
		LJUMP 	530H 			//0531 	3D30

		//;SWI2C.C: 136: return dat;
		BCR 	STATUS,5 		//0532 	1283
		LDR 	22H,0 			//0533 	0822
		ORG		0534H
		RET		 					//0534 	0004
		BCR 	STATUS,5 		//0535 	1283
		STR 	21H 			//0536 	01A1

		//;SWI2C.C: 89: TRISA &=0xbf;;
		BSR 	STATUS,5 		//0537 	1A83
		BCR 	5H,6 			//0538 	1305

		//;SWI2C.C: 90: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//0539 	2A05
		BCR 	STATUS,5 		//053A 	1283
		STR 	20H 			//053B 	01A0
		ORG		053CH
		DECRSZ 	20H,1 		//053C 	0EA0
		LJUMP 	53CH 			//053D 	3D3C

		//;SWI2C.C: 91: for(i=0;i<8;i++)
		BCR 	STATUS,5 		//053E 	1283
		CLRR 	22H 			//053F 	0122

		//;SWI2C.C: 92: {
		//;SWI2C.C: 93: RA6 = (dat&0x80) ? 1:0;
		BTSS 	21H,7 			//0540 	1FA1
		LJUMP 	545H 			//0541 	3D45
		BCR 	STATUS,5 		//0542 	1283
		BSR 	5H,6 			//0543 	1B05
		ORG		0544H
		LJUMP 	547H 			//0544 	3D47
		BCR 	STATUS,5 		//0545 	1283
		BCR 	5H,6 			//0546 	1305
		LDWI 	5H 			//0547 	2A05

		//;SWI2C.C: 94: dat<<=1;
		BCR 	STATUS,0 		//0548 	1003
		RLR 	21H,1 			//0549 	05A1

		//;SWI2C.C: 95: RA7 = 1;
		BSR 	5H,7 			//054A 	1B85

		//;SWI2C.C: 96: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//054B 	01A0
		ORG		054CH
		DECRSZ 	20H,1 		//054C 	0EA0
		LJUMP 	54CH 			//054D 	3D4C
		LDWI 	5H 			//054E 	2A05

		//;SWI2C.C: 97: RA7 = 0;
		BCR 	STATUS,5 		//054F 	1283
		BCR 	5H,7 			//0550 	1385

		//;SWI2C.C: 98: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0551 	01A0
		DECRSZ 	20H,1 		//0552 	0EA0
		LJUMP 	552H 			//0553 	3D52
		ORG		0554H
		LDWI 	8H 			//0554 	2A08
		BCR 	STATUS,5 		//0555 	1283
		INCR	22H,1 			//0556 	09A2
		SUBWR 	22H,0 			//0557 	0C22
		BTSS 	STATUS,0 		//0558 	1C03
		LJUMP 	540H 			//0559 	3D40

		//;SWI2C.C: 99: }
		//;SWI2C.C: 101: TRISA |=0x40;;
		BSR 	STATUS,5 		//055A 	1A83
		BSR 	5H,6 			//055B 	1B05
		ORG		055CH

		//;SWI2C.C: 102: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//055C 	2A05
		BCR 	STATUS,5 		//055D 	1283
		STR 	20H 			//055E 	01A0
		DECRSZ 	20H,1 		//055F 	0EA0
		LJUMP 	55FH 			//0560 	3D5F
		LDWI 	5H 			//0561 	2A05

		//;SWI2C.C: 103: RA7 = 1;
		BCR 	STATUS,5 		//0562 	1283
		BSR 	5H,7 			//0563 	1B85
		ORG		0564H

		//;SWI2C.C: 104: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0564 	01A0
		DECRSZ 	20H,1 		//0565 	0EA0
		LJUMP 	565H 			//0566 	3D65

		//;SWI2C.C: 105: i= RA6;
		LDWI 	0H 			//0567 	2A00
		BCR 	STATUS,5 		//0568 	1283
		BTSC 	5H,6 			//0569 	1705
		LDWI 	1H 			//056A 	2A01
		STR 	22H 			//056B 	01A2
		ORG		056CH

		//;SWI2C.C: 106: RA7 = 0;
		BCR 	5H,7 			//056C 	1385

		//;SWI2C.C: 107: TRISA &=0xbf;;
		BSR 	STATUS,5 		//056D 	1A83
		BCR 	5H,6 			//056E 	1305

		//;SWI2C.C: 108: return i;
		BCR 	STATUS,5 		//056F 	1283
		LDR 	22H,0 			//0570 	0822
		RET		 					//0571 	0004
		STR 	2AH 			//0572 	01AA

		//;mpu6x.c: 32: unsigned char i;
		//;mpu6x.c: 34: swI2C_Start();
		LCALL 	66EH 			//0573 	366E
		ORG		0574H

		//;mpu6x.c: 36: if(swI2C_WriteByte(0x18<<1)== 0 )
		LDWI 	30H 			//0574 	2A30
		LCALL 	535H 			//0575 	3535
		IORWI 	0H 			//0576 	2500
		BTSS 	STATUS,2 		//0577 	1D03
		RETW 	1H 			//0578 	2101

		//;mpu6x.c: 37: {
		//;mpu6x.c: 38: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	2AH,0 			//0579 	082A
		LCALL 	535H 			//057A 	3535
		IORWI 	0H 			//057B 	2500
		ORG		057CH
		BTSS 	STATUS,2 		//057C 	1D03
		RETW 	2H 			//057D 	2102

		//;mpu6x.c: 39: {
		//;mpu6x.c: 40: swI2C_Start();
		LCALL 	66EH 			//057E 	366E

		//;mpu6x.c: 41: if(swI2C_WriteByte((0x18<<1)|1)== 0 ){
		LDWI 	31H 			//057F 	2A31
		LCALL 	535H 			//0580 	3535
		IORWI 	0H 			//0581 	2500
		BTSS 	STATUS,2 		//0582 	1D03
		RETW 	1H 			//0583 	2101
		ORG		0584H

		//;mpu6x.c: 43: for(i=0; i<(len-1);i++){
		CLRR 	2BH 			//0584 	012B
		LDR 	26H,0 			//0585 	0826
		ADDWI 	FFH 			//0586 	27FF
		STR 	27H 			//0587 	01A7
		LDWI 	FFH 			//0588 	2AFF
		BTSC 	STATUS,0 		//0589 	1403
		LDWI 	0H 			//058A 	2A00
		STR 	28H 			//058B 	01A8
		ORG		058CH
		XORWI 	80H 			//058C 	2680
		SUBWI 	80H 			//058D 	2880
		BTSS 	STATUS,2 		//058E 	1D03
		LJUMP 	592H 			//058F 	3D92
		LDR 	27H,0 			//0590 	0827
		SUBWR 	2BH,0 			//0591 	0C2B

		//;mpu6x.c: 44: dat[i]=swI2C_ReadByte(1);
		LDWI 	1H 			//0592 	2A01
		BTSC 	STATUS,0 		//0593 	1403
		ORG		0594H
		LJUMP 	599H 			//0594 	3D99
		LCALL 	4F6H 			//0595 	34F6
		LCALL 	59DH 			//0596 	359D
		INCR	2BH,1 			//0597 	09AB
		LJUMP 	585H 			//0598 	3D85

		//;mpu6x.c: 45: }
		//;mpu6x.c: 46: dat[i]=swI2C_ReadByte(1);
		LCALL 	4F6H 			//0599 	34F6
		LCALL 	59DH 			//059A 	359D

		//;mpu6x.c: 47: swI2C_Stop();
		LCALL 	6B3H 			//059B 	36B3
		ORG		059CH

		//;mpu6x.c: 48: return 0;
		RETW 	0H 			//059C 	2100

		//;mpu6x.c: 54: else
		//;mpu6x.c: 55: return 2;
		//;mpu6x.c: 51: else
		//;mpu6x.c: 52: return 1;
		STR 	27H 			//059D 	01A7
		LDR 	2BH,0 			//059E 	082B
		ADDWR 	24H,0 			//059F 	0B24
		STR 	28H 			//05A0 	01A8
		LDR 	25H,0 			//05A1 	0825
		BTSC 	STATUS,0 		//05A2 	1403
		ADDWI 	1H 			//05A3 	2701
		ORG		05A4H
		STR 	29H 			//05A4 	01A9
		LDR 	28H,0 			//05A5 	0828
		STR 	FSR 			//05A6 	0184
		BCR 	STATUS,7 		//05A7 	1383
		BTSC 	29H,0 			//05A8 	1429
		BSR 	STATUS,7 		//05A9 	1B83
		LDR 	27H,0 			//05AA 	0827
		STR 	INDF 			//05AB 	0180
		ORG		05ACH
		RET		 					//05AC 	0004
		STR 	28H 			//05AD 	01A8

		//;mpu6x.c: 5: unsigned char i;
		//;mpu6x.c: 6: swI2C_Start();
		LCALL 	66EH 			//05AE 	366E

		//;mpu6x.c: 8: if(swI2C_WriteByte(0x18<<1)== 0 )
		LDWI 	30H 			//05AF 	2A30
		LCALL 	535H 			//05B0 	3535
		IORWI 	0H 			//05B1 	2500
		BTSS 	STATUS,2 		//05B2 	1D03
		RETW 	1H 			//05B3 	2101
		ORG		05B4H

		//;mpu6x.c: 9: {
		//;mpu6x.c: 10: if(swI2C_WriteByte(rAdd)==0 )
		LDR 	28H,0 			//05B4 	0828
		LCALL 	535H 			//05B5 	3535
		IORWI 	0H 			//05B6 	2500
		BTSS 	STATUS,2 		//05B7 	1D03
		RETW 	2H 			//05B8 	2102

		//;mpu6x.c: 11: {
		//;mpu6x.c: 12: for(i=0; i<len;i++){
		CLRR 	29H 			//05B9 	0129
		LDR 	25H,0 			//05BA 	0825
		SUBWR 	29H,0 			//05BB 	0C29
		ORG		05BCH
		BTSC 	STATUS,0 		//05BC 	1403
		LJUMP 	5D3H 			//05BD 	3DD3

		//;mpu6x.c: 13: if(swI2C_WriteByte(dat[i])==1 ){
		LDR 	29H,0 			//05BE 	0829
		ADDWR 	23H,0 			//05BF 	0B23
		STR 	26H 			//05C0 	01A6
		LDR 	24H,0 			//05C1 	0824
		BTSC 	STATUS,0 		//05C2 	1403
		ADDWI 	1H 			//05C3 	2701
		ORG		05C4H
		STR 	27H 			//05C4 	01A7
		LDR 	26H,0 			//05C5 	0826
		STR 	FSR 			//05C6 	0184
		BSR 	STATUS,7 		//05C7 	1B83
		BTSS 	27H,0 			//05C8 	1C27
		BCR 	STATUS,7 		//05C9 	1383
		LDR 	INDF,0 			//05CA 	0800
		LCALL 	535H 			//05CB 	3535
		ORG		05CCH
		XORWI 	1H 			//05CC 	2601
		BTSS 	STATUS,2 		//05CD 	1D03
		LJUMP 	5D1H 			//05CE 	3DD1

		//;mpu6x.c: 14: swI2C_Stop();
		LCALL 	6B3H 			//05CF 	36B3

		//;mpu6x.c: 15: return 3;
		RETW 	3H 			//05D0 	2103
		INCR	29H,1 			//05D1 	09A9
		LJUMP 	5BAH 			//05D2 	3DBA

		//;mpu6x.c: 16: }
		//;mpu6x.c: 17: }
		//;mpu6x.c: 18: swI2C_Stop();
		LCALL 	6B3H 			//05D3 	36B3
		ORG		05D4H

		//;mpu6x.c: 19: return 0;
		RETW 	0H 			//05D4 	2100

		//;SWI2C.C: 10: TRISA &=0xbf;;
		BSR 	STATUS,5 		//05D5 	1A83
		BCR 	5H,6 			//05D6 	1305

		//;SWI2C.C: 11: TRISA &=0x7f;;
		BCR 	5H,7 			//05D7 	1385

		//;SWI2C.C: 12: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05D8 	2A05
		BCR 	STATUS,5 		//05D9 	1283
		STR 	20H 			//05DA 	01A0
		DECRSZ 	20H,1 		//05DB 	0EA0
		ORG		05DCH
		LJUMP 	5DBH 			//05DC 	3DDB
		LDWI 	5H 			//05DD 	2A05

		//;SWI2C.C: 13: RA7 = 1;
		BCR 	STATUS,5 		//05DE 	1283
		BSR 	5H,7 			//05DF 	1B85
		BSR 	5H,6 			//05E0 	1B05

		//;SWI2C.C: 15: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//05E1 	01A0
		DECRSZ 	20H,1 		//05E2 	0EA0
		LJUMP 	5E2H 			//05E3 	3DE2
		ORG		05E4H

		//;SWI2C.C: 16: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05E4 	2A05
		BCR 	STATUS,5 		//05E5 	1283
		STR 	20H 			//05E6 	01A0
		DECRSZ 	20H,1 		//05E7 	0EA0
		LJUMP 	5E7H 			//05E8 	3DE7

		//;SWI2C.C: 17: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05E9 	2A05
		BCR 	STATUS,5 		//05EA 	1283
		STR 	20H 			//05EB 	01A0
		ORG		05ECH
		DECRSZ 	20H,1 		//05EC 	0EA0
		LJUMP 	5ECH 			//05ED 	3DEC

		//;SWI2C.C: 18: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		LDWI 	5H 			//05EE 	2A05
		BCR 	STATUS,5 		//05EF 	1283
		STR 	20H 			//05F0 	01A0
		DECRSZ 	20H,1 		//05F1 	0EA0
		LJUMP 	5F1H 			//05F2 	3DF1
		RET		 					//05F3 	0004
		ORG		05F4H

		//;sysinit.c: 88: INTCON = 0B00000000;
		CLRR 	INTCON 			//05F4 	010B

		//;sysinit.c: 89: PIE1 = 0B00000000;
		BSR 	STATUS,5 		//05F5 	1A83
		CLRR 	CH 			//05F6 	010C

		//;sysinit.c: 90: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//05F7 	1283
		CLRR 	CH 			//05F8 	010C

		//;sysinit.c: 92: IOCA5 = 1;
		BSR 	STATUS,5 		//05F9 	1A83
		BSR 	16H,5 			//05FA 	1A96

		//;sysinit.c: 93: tmp = PORTA;
		BCR 	STATUS,5 		//05FB 	1283
		ORG		05FCH
		LDR 	5H,0 			//05FC 	0805

		//;sysinit.c: 94: PAIF = 0;
		BCR 	INTCON,0 		//05FD 	100B

		//;sysinit.c: 95: PAIE = 0;
		BCR 	INTCON,3 		//05FE 	118B

		//;sysinit.c: 98: INTEDG = 0;
		BSR 	STATUS,5 		//05FF 	1A83
		BCR 	1H,6 			//0600 	1301

		//;sysinit.c: 99: INTF = 0;
		BCR 	INTCON,1 		//0601 	108B

		//;sysinit.c: 100: INTE = 1;
		BSR 	INTCON,4 		//0602 	1A0B

		//;sysinit.c: 102: TMR2IF = 0;
		BCR 	STATUS,5 		//0603 	1283
		ORG		0604H
		BCR 	CH,1 			//0604 	108C

		//;sysinit.c: 103: TMR2IE = 1;
		BSR 	STATUS,5 		//0605 	1A83
		BSR 	CH,1 			//0606 	188C

		//;sysinit.c: 104: TMR2ON = 0;
		BCR 	STATUS,5 		//0607 	1283
		BCR 	12H,2 			//0608 	1112

		//;sysinit.c: 110: T0IF = 0;
		BCR 	INTCON,2 		//0609 	110B

		//;sysinit.c: 111: T0IE = 1;
		BSR 	INTCON,5 		//060A 	1A8B

		//;sysinit.c: 112: T0ON = 1;
		BSR 	1FH,3 			//060B 	199F
		ORG		060CH

		//;sysinit.c: 114: PEIE = 1;
		BSR 	INTCON,6 		//060C 	1B0B

		//;sysinit.c: 116: GIE = 1;
		BSR 	INTCON,7 		//060D 	1B8B
		RET		 					//060E 	0004
		STR 	21H 			//060F 	01A1

		//;smartkey.C: 206: GIE = 0;
		BCR 	INTCON,7 		//0610 	138B

		//;smartkey.C: 207: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//0611 	1F8B
		LJUMP 	615H 			//0612 	3E15
		CLRWDT	 			//0613 	0001
		ORG		0614H
		LJUMP 	611H 			//0614 	3E11

		//;smartkey.C: 208: EEADR = EEAddr;
		BCR 	STATUS,5 		//0615 	1283
		LDR 	21H,0 			//0616 	0821
		BSR 	STATUS,5 		//0617 	1A83
		STR 	1BH 			//0618 	019B

		//;smartkey.C: 209: EEDAT = EEData;
		BCR 	STATUS,5 		//0619 	1283
		LDR 	20H,0 			//061A 	0820
		BSR 	STATUS,5 		//061B 	1A83
		ORG		061CH
		STR 	1AH 			//061C 	019A
		LDWI 	34H 			//061D 	2A34

		//;smartkey.C: 210: EEIF = 0;
		BCR 	STATUS,5 		//061E 	1283
		BCR 	CH,7 			//061F 	138C

		//;smartkey.C: 211: EECON1 = 0x34;
		BSR 	STATUS,5 		//0620 	1A83
		STR 	1CH 			//0621 	019C

		//;smartkey.C: 212: WR = 1;
		BSR 	1DH,0 			//0622 	181D

		//;smartkey.C: 213: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//0623 	1A83
		ORG		0624H
		BTSS 	1DH,0 			//0624 	1C1D
		LJUMP 	628H 			//0625 	3E28
		CLRWDT	 			//0626 	0001
		LJUMP 	623H 			//0627 	3E23

		//;smartkey.C: 215: GIE = 1;
		BSR 	INTCON,7 		//0628 	1B8B
		RET		 					//0629 	0004
		STR 	76H 			//062A 	01F6

		//;smartkey.C: 206: GIE = 0;
		BCR 	INTCON,7 		//062B 	138B
		ORG		062CH

		//;smartkey.C: 207: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//062C 	1F8B
		LJUMP 	630H 			//062D 	3E30
		CLRWDT	 			//062E 	0001
		LJUMP 	62CH 			//062F 	3E2C

		//;smartkey.C: 208: EEADR = EEAddr;
		LDR 	76H,0 			//0630 	0876
		BSR 	STATUS,5 		//0631 	1A83
		STR 	1BH 			//0632 	019B

		//;smartkey.C: 209: EEDAT = EEData;
		LDR 	75H,0 			//0633 	0875
		ORG		0634H
		STR 	1AH 			//0634 	019A
		LDWI 	34H 			//0635 	2A34

		//;smartkey.C: 210: EEIF = 0;
		BCR 	STATUS,5 		//0636 	1283
		BCR 	CH,7 			//0637 	138C

		//;smartkey.C: 211: EECON1 = 0x34;
		BSR 	STATUS,5 		//0638 	1A83
		STR 	1CH 			//0639 	019C

		//;smartkey.C: 212: WR = 1;
		BSR 	1DH,0 			//063A 	181D

		//;smartkey.C: 213: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//063B 	1A83
		ORG		063CH
		BTSS 	1DH,0 			//063C 	1C1D
		LJUMP 	640H 			//063D 	3E40
		CLRWDT	 			//063E 	0001
		LJUMP 	63BH 			//063F 	3E3B

		//;smartkey.C: 215: GIE = 1;
		BSR 	INTCON,7 		//0640 	1B8B
		RET		 					//0641 	0004
		STR 	25H 			//0642 	01A5

		//;smartkey.C: 177: {
		//;smartkey.C: 178: while(rep--){
		DECR 	24H,1 			//0643 	0DA4
		ORG		0644H
		LDR 	24H,0 			//0644 	0824
		XORWI 	FFH 			//0645 	26FF
		BTSC 	STATUS,2 		//0646 	1503
		RET		 					//0647 	0004
		LDWI 	CH 			//0648 	2A0C

		//;smartkey.C: 179: TMR2ON = 1;
		BSR 	12H,2 			//0649 	1912

		//;smartkey.C: 180: PR2L = 12;
		BSR 	STATUS,5 		//064A 	1A83
		STR 	11H 			//064B 	0191
		ORG		064CH

		//;smartkey.C: 181: delay_x10ms(delay);
		BCR 	STATUS,5 		//064C 	1283
		LDR 	25H,0 			//064D 	0825
		STR 	20H 			//064E 	01A0
		CLRR 	21H 			//064F 	0121
		LCALL 	681H 			//0650 	3681
		LDWI 	14H 			//0651 	2A14

		//;smartkey.C: 183: TMR2ON = 0;RA3 =0;
		BCR 	12H,2 			//0652 	1112
		BCR 	5H,3 			//0653 	1185
		ORG		0654H

		//;smartkey.C: 184: delay_x10ms(20);
		STR 	20H 			//0654 	01A0
		CLRR 	21H 			//0655 	0121
		LCALL 	681H 			//0656 	3681
		LJUMP 	643H 			//0657 	3E43

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0658 	1283
		CLRR 	5H 			//0659 	0105

		//;sysinit.c: 35: TRISA = 0B00110111;
		LDWI 	37H 			//065A 	2A37
		BSR 	STATUS,5 		//065B 	1A83
		ORG		065CH
		STR 	5H 			//065C 	0185

		//;sysinit.c: 36: WPUA = 0B11000000;
		LDWI 	C0H 			//065D 	2AC0
		STR 	15H 			//065E 	0195

		//;sysinit.c: 38: PORTC = 0B00000000;
		BCR 	STATUS,5 		//065F 	1283
		CLRR 	7H 			//0660 	0107

		//;sysinit.c: 39: TRISC = 0B11111100;
		LDWI 	FCH 			//0661 	2AFC
		BSR 	STATUS,5 		//0662 	1A83
		STR 	7H 			//0663 	0187
		ORG		0664H

		//;sysinit.c: 40: WPUC = 0B00000000;
		CLRR 	13H 			//0664 	0113

		//;sysinit.c: 42: PSRCA = 0B11111111;
		LDWI 	FFH 			//0665 	2AFF
		STR 	8H 			//0666 	0188

		//;sysinit.c: 43: PSRCC = 0B11111111;
		STR 	14H 			//0667 	0194

		//;sysinit.c: 44: PSINKA = 0B11111111;
		STR 	17H 			//0668 	0197

		//;sysinit.c: 45: PSINKC = 0B11111111;
		STR 	1FH 			//0669 	019F

		//;sysinit.c: 47: MSCON = 0B00110000;
		LDWI 	30H 			//066A 	2A30
		BCR 	STATUS,5 		//066B 	1283
		ORG		066CH
		STR 	1BH 			//066C 	019B
		RET		 					//066D 	0004
		LDWI 	5H 			//066E 	2A05

		//;SWI2C.C: 24: RA7 = 1;
		BSR 	5H,7 			//066F 	1B85

		//;SWI2C.C: 26: RA6 = 1;
		BSR 	5H,6 			//0670 	1B05

		//;SWI2C.C: 27: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0671 	01A0
		DECRSZ 	20H,1 		//0672 	0EA0
		LJUMP 	672H 			//0673 	3E72
		ORG		0674H
		LDWI 	5H 			//0674 	2A05

		//;SWI2C.C: 28: RA6 = 0;
		BCR 	STATUS,5 		//0675 	1283
		BCR 	5H,6 			//0676 	1305

		//;SWI2C.C: 29: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//0677 	01A0
		DECRSZ 	20H,1 		//0678 	0EA0
		LJUMP 	678H 			//0679 	3E78
		LDWI 	5H 			//067A 	2A05

		//;SWI2C.C: 30: RA7 = 0;
		BCR 	STATUS,5 		//067B 	1283
		ORG		067CH
		BCR 	5H,7 			//067C 	1385

		//;SWI2C.C: 31: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//067D 	01A0
		DECRSZ 	20H,1 		//067E 	0EA0
		LJUMP 	67EH 			//067F 	3E7E
		RET		 					//0680 	0004

		//;smartkey.C: 165: unsigned int set = t + timeTick;
		LDR 	21H,0 			//0681 	0821
		STR 	23H 			//0682 	01A3
		LDR 	20H,0 			//0683 	0820
		ORG		0684H
		STR 	22H 			//0684 	01A2
		LDR 	70H,0 			//0685 	0870
		ADDWR 	22H,1 			//0686 	0BA2
		BTSC 	STATUS,0 		//0687 	1403
		INCR	23H,1 			//0688 	09A3
		LDR 	71H,0 			//0689 	0871
		ADDWR 	23H,1 			//068A 	0BA3

		//;smartkey.C: 166: while(timeTick < set);
		LDR 	23H,0 			//068B 	0823
		ORG		068CH
		SUBWR 	71H,0 			//068C 	0C71
		BTSS 	STATUS,2 		//068D 	1D03
		LJUMP 	691H 			//068E 	3E91
		LDR 	22H,0 			//068F 	0822
		SUBWR 	70H,0 			//0690 	0C70
		BTSC 	STATUS,0 		//0691 	1403
		RET		 					//0692 	0004
		LJUMP 	68BH 			//0693 	3E8B
		ORG		0694H

		//;sysinit.c: 60: T0CON0 = 0B00000000;
		CLRR 	1FH 			//0694 	011F

		//;sysinit.c: 61: OPTION = 0B00000111;
		LDWI 	7H 			//0695 	2A07
		BSR 	STATUS,5 		//0696 	1A83
		STR 	1H 			//0697 	0181

		//;sysinit.c: 62: TMR0 = 179;
		LDWI 	B3H 			//0698 	2AB3
		BCR 	STATUS,5 		//0699 	1283
		STR 	1H 			//069A 	0181

		//;sysinit.c: 64: TMR2H = 0;
		CLRR 	13H 			//069B 	0113
		ORG		069CH

		//;sysinit.c: 65: TMR2L = 0;
		CLRR 	11H 			//069C 	0111

		//;sysinit.c: 66: PR2H = 0;
		BSR 	STATUS,5 		//069D 	1A83
		CLRR 	12H 			//069E 	0112

		//;sysinit.c: 67: PR2L =0;
		CLRR 	11H 			//069F 	0111

		//;sysinit.c: 68: T2CON0 = 0B00101001;
		LDWI 	29H 			//06A0 	2A29
		BCR 	STATUS,5 		//06A1 	1283
		STR 	12H 			//06A2 	0192
		RET		 					//06A3 	0004
		ORG		06A4H
		CLRR 	70H 			//06A4 	0170
		CLRR 	71H 			//06A5 	0171
		CLRR 	72H 			//06A6 	0172
		CLRR 	73H 			//06A7 	0173
		CLRR 	74H 			//06A8 	0174
		CLRR 	45H 			//06A9 	0145
		CLRR 	46H 			//06AA 	0146
		CLRR 	47H 			//06AB 	0147
		ORG		06ACH
		CLRR 	48H 			//06AC 	0148
		CLRR 	49H 			//06AD 	0149
		CLRR 	4AH 			//06AE 	014A
		CLRR 	4BH 			//06AF 	014B
		CLRR 	4CH 			//06B0 	014C
		CLRR 	STATUS 			//06B1 	0103
		LJUMP 	0BH 			//06B2 	380B
		LDWI 	5H 			//06B3 	2A05
		ORG		06B4H

		//;SWI2C.C: 37: RA6 = 0;
		BCR 	5H,6 			//06B4 	1305

		//;SWI2C.C: 38: RA7 = 1;
		BSR 	5H,7 			//06B5 	1B85

		//;SWI2C.C: 39: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//06B6 	01A0
		DECRSZ 	20H,1 		//06B7 	0EA0
		LJUMP 	6B7H 			//06B8 	3EB7
		LDWI 	5H 			//06B9 	2A05

		//;SWI2C.C: 40: RA6 = 1;
		BCR 	STATUS,5 		//06BA 	1283
		BSR 	5H,6 			//06BB 	1B05
		ORG		06BCH

		//;SWI2C.C: 41: _delay((unsigned long)((16)*(4000000/4000000.0)));;
		STR 	20H 			//06BC 	01A0
		DECRSZ 	20H,1 		//06BD 	0EA0
		LJUMP 	6BDH 			//06BE 	3EBD
		RET		 					//06BF 	0004
		BCR 	STATUS,5 		//06C0 	1283
		STR 	20H 			//06C1 	01A0

		//;smartkey.C: 195: unsigned char ReEepromData;
		//;smartkey.C: 197: EEADR = EEAddr;
		BSR 	STATUS,5 		//06C2 	1A83
		STR 	1BH 			//06C3 	019B
		ORG		06C4H

		//;smartkey.C: 198: RD = 1;
		BSR 	1CH,0 			//06C4 	181C

		//;smartkey.C: 199: ReEepromData = EEDAT;
		LDR 	1AH,0 			//06C5 	081A
		BCR 	STATUS,5 		//06C6 	1283
		STR 	21H 			//06C7 	01A1

		//;smartkey.C: 200: RD = 0;
		BSR 	STATUS,5 		//06C8 	1A83
		BCR 	1CH,0 			//06C9 	101C

		//;smartkey.C: 201: return ReEepromData;
		BCR 	STATUS,5 		//06CA 	1283
		LDR 	21H,0 			//06CB 	0821
		ORG		06CCH
		RET		 					//06CC 	0004
		STR 	22H 			//06CD 	01A2

		//;smartkey.C: 221: mtOldState = mtState;
		LDR 	74H,0 			//06CE 	0874
		STR 	4CH 			//06CF 	01CC

		//;smartkey.C: 222: mtState = stt;
		LDR 	22H,0 			//06D0 	0822
		STR 	74H 			//06D1 	01F4

		//;smartkey.C: 223: timeTick =0;
		CLRR 	70H 			//06D2 	0170
		CLRR 	71H 			//06D3 	0171
		ORG		06D4H

		//;smartkey.C: 224: timeOut = _tOut;
		LDR 	21H,0 			//06D4 	0821
		STR 	48H 			//06D5 	01C8
		LDR 	20H,0 			//06D6 	0820
		STR 	47H 			//06D7 	01C7
		RET		 					//06D8 	0004

		//;sysinit.c: 21: OSCCON = 0B01010001;
		LDWI 	51H 			//06D9 	2A51
		BSR 	STATUS,5 		//06DA 	1A83
		STR 	FH 			//06DB 	018F
		ORG		06DCH

		//;sysinit.c: 22: _nop();
		NOP		 					//06DC 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//06DD 	1A83
		BTSC 	FH,2 			//06DE 	150F
		RET		 					//06DF 	0004
		LJUMP 	6DDH 			//06E0 	3EDD
		STR 	75H 			//06E1 	01F5

		//;smartkey.C: 195: unsigned char ReEepromData;
		//;smartkey.C: 197: EEADR = EEAddr;
		BSR 	STATUS,5 		//06E2 	1A83
		STR 	1BH 			//06E3 	019B
		ORG		06E4H

		//;smartkey.C: 198: RD = 1;
		BSR 	1CH,0 			//06E4 	181C

		//;smartkey.C: 199: ReEepromData = EEDAT;
		LDR 	1AH,0 			//06E5 	081A
		STR 	76H 			//06E6 	01F6

		//;smartkey.C: 200: RD = 0;
		BCR 	1CH,0 			//06E7 	101C

		//;smartkey.C: 201: return ReEepromData;
		RET		 					//06E8 	0004
		LJUMP 	278H 			//06E9 	3A78
		LJUMP 	1B1H 			//06EA 	39B1
		LJUMP 	1B8H 			//06EB 	39B8
		ORG		06ECH
		LJUMP 	201H 			//06EC 	3A01
		LJUMP 	222H 			//06ED 	3A22

		//;smartkey.C: 173: TMR2ON = 1;
		BCR 	STATUS,5 		//06EE 	1283
		BSR 	12H,2 			//06EF 	1912

		//;smartkey.C: 174: TRISA &= 0xf7;
		BSR 	STATUS,5 		//06F0 	1A83
		BCR 	5H,3 			//06F1 	1185
		RET		 					//06F2 	0004

		//;smartkey.C: 170: TMR2ON = 0;RA3 =0;TRISA |= 0x08;
		BCR 	12H,2 			//06F3 	1112
		ORG		06F4H
		BCR 	5H,3 			//06F4 	1185
		BSR 	STATUS,5 		//06F5 	1A83
		BSR 	5H,3 			//06F6 	1985
		RET		 					//06F7 	0004
			END

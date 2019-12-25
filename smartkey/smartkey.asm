//Deviec:MS82Fxx02
//-----------------------Variable---------------------------------
		_mode_chek		EQU		46H
		_timeOut		EQU		40H
		_timeTick		EQU		7AH
		_cntTmp		EQU		3EH
		_cntCyc		EQU		43H
		_cntOff		EQU		44H
		_lostDetect		EQU		45H
		_mtState		EQU		48H
		_mtOldState		EQU		47H
		_RegStatus		EQU		42H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	3CAH 			//0009 	3BCA
		LJUMP 	641H 			//000A 	3E41
		LDWI 	7H 			//000B 	2A07
		ORG		000CH
		STR 	19H 			//000C 	0199

		//;smartkey.C: 257: unsigned char reAlertOn=0,tmp8,isSw=0,isFall=0,mpuOk=0,vibrateOn=0;
		BCR 	STATUS,5 		//000D 	1283
		BCR 	STATUS,6 		//000E 	1303
		CLRR 	34H 			//000F 	0134
		CLRR 	3BH 			//0010 	013B
		CLRR 	2AH 			//0011 	012A
		CLRR 	2DH 			//0012 	012D

		//;smartkey.C: 258: unsigned int isWait =0;
		CLRR 	28H 			//0013 	0128
		ORG		0014H
		CLRR 	29H 			//0014 	0129

		//;smartkey.C: 259: signed int acYsum=0,acXsum=0;
		CLRR 	37H 			//0015 	0137
		CLRR 	38H 			//0016 	0138
		CLRR 	39H 			//0017 	0139
		CLRR 	3AH 			//0018 	013A

		//;smartkey.C: 260: unsigned int tmp16=0;
		CLRR 	3CH 			//0019 	013C
		CLRR 	3DH 			//001A 	013D
		CLRWDT	 			//001B 	0001
		ORG		001CH

		//;smartkey.C: 266: sys_init();
		LCALL 	68AH 			//001C 	368A

		//;smartkey.C: 267: gpio_init();
		LCALL 	66EH 			//001D 	366E

		//;smartkey.C: 268: int_init();
		LCALL 	5CCH 			//001E 	35CC

		//;smartkey.C: 269: timer_init();
		LCALL 	65FH 			//001F 	365F

		//;smartkey.C: 271: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//0020 	2A82
		STR 	26H 			//0021 	01A6
		LDWI 	DDH 			//0022 	2ADD
		STR 	25H 			//0023 	01A5
		ORG		0024H
		DECRSZ 	25H,1 		//0024 	0EA5
		LJUMP 	24H 			//0025 	3824
		DECRSZ 	26H,1 		//0026 	0EA6
		LJUMP 	24H 			//0027 	3824
		LJUMP 	29H 			//0028 	3829
		LDWI 	82H 			//0029 	2A82

		//;smartkey.C: 272: RA7 =1;
		BCR 	STATUS,5 		//002A 	1283
		BCR 	STATUS,6 		//002B 	1303
		ORG		002CH
		BSR 	5H,7 			//002C 	1B85

		//;smartkey.C: 273: _delay((unsigned long)((100)*(4000000/4000.0)));
		STR 	26H 			//002D 	01A6
		LDWI 	DDH 			//002E 	2ADD
		STR 	25H 			//002F 	01A5
		DECRSZ 	25H,1 		//0030 	0EA5
		LJUMP 	30H 			//0031 	3830
		DECRSZ 	26H,1 		//0032 	0EA6
		LJUMP 	30H 			//0033 	3830
		ORG		0034H
		LJUMP 	35H 			//0034 	3835

		//;smartkey.C: 275: PAIE = 1;
		BSR 	INTCON,3 		//0035 	198B

		//;smartkey.C: 277: RegStatus = 0;
		BCR 	STATUS,5 		//0036 	1283
		BCR 	STATUS,6 		//0037 	1303
		CLRR 	42H 			//0038 	0142

		//;smartkey.C: 279: swI2C_Init();
		LCALL 	5B0H 			//0039 	35B0
		LDWI 	0H 			//003A 	2A00

		//;smartkey.C: 282: setState(0,0);
		CLRR 	72H 			//003B 	0172
		ORG		003CH
		CLRR 	73H 			//003C 	0173
		LCALL 	67CH 			//003D 	367C

		//;smartkey.C: 284: WRITE_EEPROM(0x7F,0xAA);
		LDWI 	AAH 			//003E 	2AAA
		STR 	72H 			//003F 	01F2
		LDWI 	7FH 			//0040 	2A7F
		LCALL 	5E6H 			//0041 	35E6

		//;smartkey.C: 285: WRITE_EEPROM(0x7F,0xAA);
		LDWI 	AAH 			//0042 	2AAA
		STR 	72H 			//0043 	01F2
		ORG		0044H
		LDWI 	7FH 			//0044 	2A7F
		LCALL 	5E6H 			//0045 	35E6

		//;smartkey.C: 289: _delay((unsigned long)((200)*(4000000/4000.0)));
		LDWI 	2H 			//0046 	2A02
		BCR 	STATUS,5 		//0047 	1283
		STR 	27H 			//0048 	01A7
		LDWI 	4H 			//0049 	2A04
		STR 	26H 			//004A 	01A6
		LDWI 	BAH 			//004B 	2ABA
		ORG		004CH
		STR 	25H 			//004C 	01A5
		DECRSZ 	25H,1 		//004D 	0EA5
		LJUMP 	4DH 			//004E 	384D
		DECRSZ 	26H,1 		//004F 	0EA6
		LJUMP 	4DH 			//0050 	384D
		DECRSZ 	27H,1 		//0051 	0EA7
		LJUMP 	4DH 			//0052 	384D
		CLRWDT	 			//0053 	0001
		ORG		0054H

		//;smartkey.C: 291: tmp8= READ_EEPROM(0x08);
		LDWI 	8H 			//0054 	2A08
		LCALL 	694H 			//0055 	3694
		BCR 	STATUS,5 		//0056 	1283
		STR 	35H 			//0057 	01B5

		//;smartkey.C: 292: if(tmp8==0xff) {WRITE_EEPROM(0x08,0);_delay((unsigned long)((2)*(40000
		//+                          00/4000.0)));}
		XORWI 	FFH 			//0058 	26FF
		BTSS 	STATUS,2 		//0059 	1D03
		LJUMP 	68H 			//005A 	3868
		LDWI 	8H 			//005B 	2A08
		ORG		005CH
		CLRR 	72H 			//005C 	0172
		LCALL 	5E6H 			//005D 	35E6
		LDWI 	3H 			//005E 	2A03
		BCR 	STATUS,5 		//005F 	1283
		STR 	26H 			//0060 	01A6
		LDWI 	97H 			//0061 	2A97
		STR 	25H 			//0062 	01A5
		DECRSZ 	25H,1 		//0063 	0EA5
		ORG		0064H
		LJUMP 	63H 			//0064 	3863
		DECRSZ 	26H,1 		//0065 	0EA6
		LJUMP 	63H 			//0066 	3863
		LJUMP 	68H 			//0067 	3868

		//;smartkey.C: 294: if(tmp8==0xcc){
		BCR 	STATUS,5 		//0068 	1283
		BCR 	STATUS,6 		//0069 	1303
		LDR 	35H,0 			//006A 	0835
		XORWI 	CCH 			//006B 	26CC
		ORG		006CH
		BTSS 	STATUS,2 		//006C 	1D03
		LJUMP 	84H 			//006D 	3884
		LDWI 	8H 			//006E 	2A08

		//;smartkey.C: 295: RegStatus &=~(0x20);
		BCR 	42H,5 			//006F 	12C2

		//;smartkey.C: 296: setState(3,1800);
		STR 	72H 			//0070 	01F2
		LDWI 	7H 			//0071 	2A07
		STR 	73H 			//0072 	01F3
		LDWI 	3H 			//0073 	2A03
		ORG		0074H
		LCALL 	67CH 			//0074 	367C

		//;smartkey.C: 297: mtOldState = 1;
		CLRR 	47H 			//0075 	0147
		INCR	47H,1 			//0076 	09C7

		//;smartkey.C: 298: cntTmp = timeTick+50;
		LDR 	7BH,0 			//0077 	087B
		STR 	3FH 			//0078 	01BF
		LDR 	7AH,0 			//0079 	087A
		STR 	3EH 			//007A 	01BE
		LDWI 	32H 			//007B 	2A32
		ORG		007CH
		ADDWR 	3EH,1 			//007C 	0BBE
		BTSC 	STATUS,0 		//007D 	1403
		INCR	3FH,1 			//007E 	09BF

		//;smartkey.C: 299: PR2 =12;
		LDWI 	CH 			//007F 	2A0C
		BSR 	STATUS,5 		//0080 	1A83
		STR 	12H 			//0081 	0192

		//;smartkey.C: 300: beepOn();
		LCALL 	6A2H 			//0082 	36A2

		//;smartkey.C: 301: } else {
		LJUMP 	8BH 			//0083 	388B
		ORG		0084H

		//;smartkey.C: 302: setState(2,400);
		LDWI 	90H 			//0084 	2A90
		STR 	72H 			//0085 	01F2
		LDWI 	1H 			//0086 	2A01
		STR 	73H 			//0087 	01F3
		LDWI 	2H 			//0088 	2A02
		LCALL 	67CH 			//0089 	367C

		//;smartkey.C: 304: mtOldState = 0;
		CLRR 	47H 			//008A 	0147

		//;smartkey.C: 308: }
		//;smartkey.C: 327: {
		//;smartkey.C: 328: buf[0] = 0x28;
		LDWI 	28H 			//008B 	2A28
		ORG		008CH
		BCR 	STATUS,5 		//008C 	1283
		STR 	2EH 			//008D 	01AE

		//;smartkey.C: 329: buf[1] = 0x87;
		LDWI 	87H 			//008E 	2A87
		STR 	2FH 			//008F 	01AF

		//;smartkey.C: 330: if(AccWrite(0x6b,(unsigned char)buf,2)==0) mpuOk =1;
		LDWI 	2EH 			//0090 	2A2E
		STR 	25H 			//0091 	01A5
		CLRR 	26H 			//0092 	0126
		STR 	75H 			//0093 	01F5
		ORG		0094H
		LDR 	26H,0 			//0094 	0826
		STR 	76H 			//0095 	01F6
		LDWI 	2H 			//0096 	2A02
		STR 	77H 			//0097 	01F7
		LDWI 	6BH 			//0098 	2A6B
		LCALL 	585H 			//0099 	3585
		IORWI 	0H 			//009A 	2500
		BCR 	STATUS,5 		//009B 	1283
		ORG		009CH
		BCR 	STATUS,6 		//009C 	1303
		BTSS 	STATUS,2 		//009D 	1D03
		LJUMP 	A2H 			//009E 	38A2
		CLRR 	36H 			//009F 	0136
		INCR	36H,1 			//00A0 	09B6
		LJUMP 	A3H 			//00A1 	38A3

		//;smartkey.C: 331: else mpuOk =0;
		CLRR 	36H 			//00A2 	0136

		//;smartkey.C: 333: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//00A3 	2A82
		ORG		00A4H
		STR 	26H 			//00A4 	01A6
		LDWI 	DDH 			//00A5 	2ADD
		STR 	25H 			//00A6 	01A5
		DECRSZ 	25H,1 		//00A7 	0EA5
		LJUMP 	A7H 			//00A8 	38A7
		DECRSZ 	26H,1 		//00A9 	0EA6
		LJUMP 	A7H 			//00AA 	38A7
		LJUMP 	ACH 			//00AB 	38AC
		ORG		00ACH

		//;smartkey.C: 334: }
		//;smartkey.C: 335: if(mpuOk ==0){beep(10,2);}
		BCR 	STATUS,5 		//00AC 	1283
		BCR 	STATUS,6 		//00AD 	1303
		LDR 	36H,1 			//00AE 	08B6
		BTSS 	STATUS,2 		//00AF 	1D03
		LJUMP 	B5H 			//00B0 	38B5
		LDWI 	2H 			//00B1 	2A02
		STR 	76H 			//00B2 	01F6
		LDWI 	AH 			//00B3 	2A0A
		ORG		00B4H
		LCALL 	600H 			//00B4 	3600

		//;smartkey.C: 339: if(RC1 && mpuOk ==1)
		BCR 	STATUS,5 		//00B5 	1283
		BCR 	STATUS,6 		//00B6 	1303
		BTSS 	7H,1 			//00B7 	1C87
		LJUMP 	160H 			//00B8 	3960
		DECRSZ 	36H,0 		//00B9 	0E36
		LJUMP 	160H 			//00BA 	3960

		//;smartkey.C: 340: {
		//;smartkey.C: 341: tmp8=0;
		CLRR 	35H 			//00BB 	0135
		ORG		00BCH

		//;smartkey.C: 342: while((RC1 )&&(tmp8<11))
		LJUMP 	FAH 			//00BC 	38FA

		//;smartkey.C: 343: {
		//;smartkey.C: 344: if(AccRead(0x3b,(unsigned char)buf,6)==0){
		LDWI 	2EH 			//00BD 	2A2E
		STR 	25H 			//00BE 	01A5
		CLRR 	26H 			//00BF 	0126
		STR 	76H 			//00C0 	01F6
		LDR 	26H,0 			//00C1 	0826
		STR 	77H 			//00C2 	01F7
		LDWI 	6H 			//00C3 	2A06
		ORG		00C4H
		STR 	78H 			//00C4 	01F8
		LDWI 	3BH 			//00C5 	2A3B
		LCALL 	508H 			//00C6 	3508
		IORWI 	0H 			//00C7 	2500
		BTSS 	STATUS,2 		//00C8 	1D03
		LJUMP 	EBH 			//00C9 	38EB

		//;smartkey.C: 346: acXsum += buf[0];
		BCR 	STATUS,5 		//00CA 	1283
		BCR 	STATUS,6 		//00CB 	1303
		ORG		00CCH
		LDR 	2EH,0 			//00CC 	082E
		STR 	25H 			//00CD 	01A5
		CLRR 	26H 			//00CE 	0126
		BTSC 	25H,7 			//00CF 	17A5
		DECR 	26H,1 			//00D0 	0DA6
		ADDWR 	39H,1 			//00D1 	0BB9
		BTSC 	STATUS,0 		//00D2 	1403
		INCR	3AH,1 			//00D3 	09BA
		ORG		00D4H
		LDR 	26H,0 			//00D4 	0826
		ADDWR 	3AH,1 			//00D5 	0BBA

		//;smartkey.C: 347: acYsum += buf[2];
		LDR 	30H,0 			//00D6 	0830
		STR 	25H 			//00D7 	01A5
		CLRR 	26H 			//00D8 	0126
		BTSC 	25H,7 			//00D9 	17A5
		DECR 	26H,1 			//00DA 	0DA6
		ADDWR 	37H,1 			//00DB 	0BB7
		ORG		00DCH
		BTSC 	STATUS,0 		//00DC 	1403
		INCR	38H,1 			//00DD 	09B8
		LDR 	26H,0 			//00DE 	0826
		ADDWR 	38H,1 			//00DF 	0BB8

		//;smartkey.C: 348: tmp16 = (signed int)tmp16 + buf[4];
		LDR 	32H,0 			//00E0 	0832
		STR 	25H 			//00E1 	01A5
		CLRR 	26H 			//00E2 	0126
		BTSC 	25H,7 			//00E3 	17A5
		ORG		00E4H
		DECR 	26H,1 			//00E4 	0DA6
		ADDWR 	3CH,1 			//00E5 	0BBC
		BTSC 	STATUS,0 		//00E6 	1403
		INCR	3DH,1 			//00E7 	09BD
		LDR 	26H,0 			//00E8 	0826
		ADDWR 	3DH,1 			//00E9 	0BBD

		//;smartkey.C: 349: tmp8++;
		INCR	35H,1 			//00EA 	09B5

		//;smartkey.C: 350: }
		//;smartkey.C: 351: _delay((unsigned long)((500)*(4000000/4000.0)));
		LDWI 	3H 			//00EB 	2A03
		ORG		00ECH
		BCR 	STATUS,5 		//00EC 	1283
		BCR 	STATUS,6 		//00ED 	1303
		STR 	27H 			//00EE 	01A7
		LDWI 	8AH 			//00EF 	2A8A
		STR 	26H 			//00F0 	01A6
		LDWI 	56H 			//00F1 	2A56
		STR 	25H 			//00F2 	01A5
		DECRSZ 	25H,1 		//00F3 	0EA5
		ORG		00F4H
		LJUMP 	F3H 			//00F4 	38F3
		DECRSZ 	26H,1 		//00F5 	0EA6
		LJUMP 	F3H 			//00F6 	38F3
		DECRSZ 	27H,1 		//00F7 	0EA7
		LJUMP 	F3H 			//00F8 	38F3
		LJUMP 	FAH 			//00F9 	38FA
		BCR 	STATUS,5 		//00FA 	1283
		BCR 	STATUS,6 		//00FB 	1303
		ORG		00FCH
		BTSS 	7H,1 			//00FC 	1C87
		LJUMP 	102H 			//00FD 	3902
		LDWI 	BH 			//00FE 	2A0B
		SUBWR 	35H,0 			//00FF 	0C35
		BTSS 	STATUS,0 		//0100 	1C03
		LJUMP 	BDH 			//0101 	38BD

		//;smartkey.C: 353: }
		//;smartkey.C: 355: if(tmp8==11){
		LDR 	35H,0 			//0102 	0835
		XORWI 	BH 			//0103 	260B
		ORG		0104H
		BTSS 	STATUS,2 		//0104 	1D03
		LJUMP 	15CH 			//0105 	395C

		//;smartkey.C: 356: acXsum =acXsum/10;
		LDWI 	AH 			//0106 	2A0A
		STR 	72H 			//0107 	01F2
		CLRR 	73H 			//0108 	0173
		LDR 	3AH,0 			//0109 	083A
		STR 	75H 			//010A 	01F5
		LDR 	39H,0 			//010B 	0839
		ORG		010CH
		STR 	74H 			//010C 	01F4
		LCALL 	43EH 			//010D 	343E
		LDR 	73H,0 			//010E 	0873
		STR 	3AH 			//010F 	01BA
		LDR 	72H,0 			//0110 	0872
		STR 	39H 			//0111 	01B9

		//;smartkey.C: 357: acYsum = acYsum/10;
		LDWI 	AH 			//0112 	2A0A
		STR 	72H 			//0113 	01F2
		ORG		0114H
		CLRR 	73H 			//0114 	0173
		LDR 	38H,0 			//0115 	0838
		STR 	75H 			//0116 	01F5
		LDR 	37H,0 			//0117 	0837
		STR 	74H 			//0118 	01F4
		LCALL 	43EH 			//0119 	343E
		LDR 	73H,0 			//011A 	0873
		STR 	38H 			//011B 	01B8
		ORG		011CH
		LDR 	72H,0 			//011C 	0872
		STR 	37H 			//011D 	01B7

		//;smartkey.C: 358: tmp16 = (signed int)tmp16/10;
		LDWI 	AH 			//011E 	2A0A
		STR 	72H 			//011F 	01F2
		CLRR 	73H 			//0120 	0173
		LDR 	3DH,0 			//0121 	083D
		STR 	75H 			//0122 	01F5
		LDR 	3CH,0 			//0123 	083C
		ORG		0124H
		STR 	74H 			//0124 	01F4
		LCALL 	43EH 			//0125 	343E
		LDR 	73H,0 			//0126 	0873
		STR 	3DH 			//0127 	01BD
		LDR 	72H,0 			//0128 	0872
		STR 	3CH 			//0129 	01BC

		//;smartkey.C: 360: if(((signed int)tmp16 > (-31)) && ((signed int)tmp16 < 31)){
		LDR 	3DH,0 			//012A 	083D
		XORWI 	80H 			//012B 	2680
		ORG		012CH
		STR 	7FH 			//012C 	01FF
		LDWI 	7FH 			//012D 	2A7F
		SUBWR 	7FH,0 			//012E 	0C7F
		BTSS 	STATUS,2 		//012F 	1D03
		LJUMP 	133H 			//0130 	3933
		LDWI 	E2H 			//0131 	2AE2
		SUBWR 	3CH,0 			//0132 	0C3C
		BTSS 	STATUS,0 		//0133 	1C03
		ORG		0134H
		LJUMP 	142H 			//0134 	3942
		BCR 	STATUS,5 		//0135 	1283
		BCR 	STATUS,6 		//0136 	1303
		LDR 	3DH,0 			//0137 	083D
		XORWI 	80H 			//0138 	2680
		STR 	7FH 			//0139 	01FF
		LDWI 	80H 			//013A 	2A80
		SUBWR 	7FH,0 			//013B 	0C7F
		ORG		013CH
		BTSS 	STATUS,2 		//013C 	1D03
		LJUMP 	140H 			//013D 	3940
		LDWI 	1FH 			//013E 	2A1F
		SUBWR 	3CH,0 			//013F 	0C3C
		BTSS 	STATUS,0 		//0140 	1C03
		LJUMP 	15CH 			//0141 	395C

		//;smartkey.C: 362: }
		//;smartkey.C: 361: beep(10,2);
		//;smartkey.C: 363: else
		//;smartkey.C: 365: {
		//;smartkey.C: 366: beep(10,3);
		LDWI 	3H 			//0142 	2A03
		STR 	76H 			//0143 	01F6
		ORG		0144H
		LDWI 	AH 			//0144 	2A0A
		LCALL 	600H 			//0145 	3600

		//;smartkey.C: 367: WRITE_EEPROM(0x10,(unsigned char)acXsum);
		BCR 	STATUS,5 		//0146 	1283
		BCR 	STATUS,6 		//0147 	1303
		LDR 	39H,0 			//0148 	0839
		STR 	72H 			//0149 	01F2
		LDWI 	10H 			//014A 	2A10
		LCALL 	5E6H 			//014B 	35E6
		ORG		014CH

		//;smartkey.C: 368: WRITE_EEPROM(0x11,(unsigned char)acYsum);
		BCR 	STATUS,5 		//014C 	1283
		LDR 	37H,0 			//014D 	0837
		STR 	72H 			//014E 	01F2
		LDWI 	11H 			//014F 	2A11
		LCALL 	5E6H 			//0150 	35E6

		//;smartkey.C: 369: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//0151 	2A82
		BCR 	STATUS,5 		//0152 	1283
		STR 	26H 			//0153 	01A6
		ORG		0154H
		LDWI 	DDH 			//0154 	2ADD
		STR 	25H 			//0155 	01A5
		DECRSZ 	25H,1 		//0156 	0EA5
		LJUMP 	156H 			//0157 	3956
		DECRSZ 	26H,1 		//0158 	0EA6
		LJUMP 	156H 			//0159 	3956
		LJUMP 	15BH 			//015A 	395B
		LJUMP 	160H 			//015B 	3960
		ORG		015CH

		//;smartkey.C: 373: beep(10,2);
		LDWI 	2H 			//015C 	2A02
		STR 	76H 			//015D 	01F6
		LDWI 	AH 			//015E 	2A0A
		LCALL 	600H 			//015F 	3600

		//;smartkey.C: 374: }
		//;smartkey.C: 375: }
		//;smartkey.C: 377: acXsum = (signed char)READ_EEPROM(0x10);
		LDWI 	10H 			//0160 	2A10
		LCALL 	694H 			//0161 	3694
		BCR 	STATUS,5 		//0162 	1283
		STR 	39H 			//0163 	01B9
		ORG		0164H
		CLRR 	3AH 			//0164 	013A
		BTSC 	39H,7 			//0165 	17B9
		DECR 	3AH,1 			//0166 	0DBA

		//;smartkey.C: 378: acYsum = (signed char)READ_EEPROM(0x11);
		LDWI 	11H 			//0167 	2A11
		LCALL 	694H 			//0168 	3694
		BCR 	STATUS,5 		//0169 	1283
		STR 	37H 			//016A 	01B7
		CLRR 	38H 			//016B 	0138
		ORG		016CH
		BTSC 	37H,7 			//016C 	17B7
		DECR 	38H,1 			//016D 	0DB8

		//;smartkey.C: 380: timeTick = 0;
		CLRR 	7AH 			//016E 	017A
		CLRR 	7BH 			//016F 	017B

		//;smartkey.C: 385: RC0 =RA6;
		BTSS 	5H,6 			//0170 	1F05
		LJUMP 	176H 			//0171 	3976
		BCR 	STATUS,5 		//0172 	1283
		BCR 	STATUS,6 		//0173 	1303
		ORG		0174H
		BSR 	7H,0 			//0174 	1807
		LJUMP 	179H 			//0175 	3979
		BCR 	STATUS,5 		//0176 	1283
		BCR 	STATUS,6 		//0177 	1303
		BCR 	7H,0 			//0178 	1007

		//;smartkey.C: 389: if(mode_chek == 0)
		LDR 	46H,1 			//0179 	08C6
		BTSC 	STATUS,2 		//017A 	1503

		//;smartkey.C: 390: {
		//;smartkey.C: 392: if(RegStatus & 0x80)
		BTSS 	42H,7 			//017B 	1FC2
		ORG		017CH
		LJUMP 	243H 			//017C 	3A43

		//;smartkey.C: 393: {
		//;smartkey.C: 394: PAIE = 0;
		BCR 	INTCON,3 		//017D 	118B

		//;smartkey.C: 397: RegStatus &= (~0x80);
		BCR 	42H,7 			//017E 	13C2

		//;smartkey.C: 409: {
		//;smartkey.C: 411: if ((RegStatus & 0x40) !=0){
		BTSC 	42H,6 			//017F 	1742
		LJUMP 	1F4H 			//0180 	39F4
		LJUMP 	23AH 			//0181 	3A3A

		//;smartkey.C: 417: lostDetect =0;
		CLRR 	45H 			//0182 	0145
		LDWI 	28H 			//0183 	2A28
		ORG		0184H

		//;smartkey.C: 418: timeTick =0;
		CLRR 	7AH 			//0184 	017A
		CLRR 	7BH 			//0185 	017B

		//;smartkey.C: 419: tmp16 = 40;
		STR 	3CH 			//0186 	01BC
		CLRR 	3DH 			//0187 	013D

		//;smartkey.C: 420: break;
		LJUMP 	242H 			//0188 	3A42

		//;smartkey.C: 423: if(timeTick >30){
		LDWI 	0H 			//0189 	2A00
		SUBWR 	7BH,0 			//018A 	0C7B
		LDWI 	1FH 			//018B 	2A1F
		ORG		018CH
		BTSC 	STATUS,2 		//018C 	1503
		SUBWR 	7AH,0 			//018D 	0C7A
		BTSS 	STATUS,0 		//018E 	1C03
		LJUMP 	242H 			//018F 	3A42
		LDWI 	8H 			//0190 	2A08

		//;smartkey.C: 424: timeTick =0;
		CLRR 	7AH 			//0191 	017A
		CLRR 	7BH 			//0192 	017B

		//;smartkey.C: 426: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LCALL 	694H 			//0193 	3694
		ORG		0194H
		XORWI 	CCH 			//0194 	26CC
		BTSS 	STATUS,2 		//0195 	1D03
		LJUMP 	19AH 			//0196 	399A
		LDWI 	8H 			//0197 	2A08
		CLRR 	72H 			//0198 	0172
		LCALL 	5E6H 			//0199 	35E6

		//;smartkey.C: 428: if((mtOldState == 3)){
		BCR 	STATUS,5 		//019A 	1283
		LDR 	47H,0 			//019B 	0847
		ORG		019CH
		XORWI 	3H 			//019C 	2603
		BTSS 	STATUS,2 		//019D 	1D03
		LJUMP 	1ADH 			//019E 	39AD

		//;smartkey.C: 429: beepOn();TMR2ON = 0; beep(10,1);
		LCALL 	6A2H 			//019F 	36A2
		LDWI 	AH 			//01A0 	2A0A
		BCR 	STATUS,5 		//01A1 	1283
		BCR 	12H,2 			//01A2 	1112
		CLRR 	76H 			//01A3 	0176
		ORG		01A4H
		INCR	76H,1 			//01A4 	09F6
		LCALL 	600H 			//01A5 	3600

		//;smartkey.C: 430: if(reAlertOn)reAlertOn =0;
		BCR 	STATUS,5 		//01A6 	1283
		BCR 	STATUS,6 		//01A7 	1303
		LDR 	34H,0 			//01A8 	0834
		BTSC 	STATUS,2 		//01A9 	1503
		LJUMP 	242H 			//01AA 	3A42
		CLRR 	34H 			//01AB 	0134
		ORG		01ACH
		LJUMP 	242H 			//01AC 	3A42

		//;smartkey.C: 432: else if((mtOldState == 0)||(mtOldState == 4)){
		LDR 	47H,0 			//01AD 	0847
		BTSC 	STATUS,2 		//01AE 	1503
		LJUMP 	1B4H 			//01AF 	39B4
		LDR 	47H,0 			//01B0 	0847
		XORWI 	4H 			//01B1 	2604
		BTSS 	STATUS,2 		//01B2 	1D03
		LJUMP 	1C8H 			//01B3 	39C8
		ORG		01B4H
		LDWI 	ACH 			//01B4 	2AAC

		//;smartkey.C: 433: RegStatus |=(0x20);
		BSR 	42H,5 			//01B5 	1AC2

		//;smartkey.C: 434: setState(1,3500);
		STR 	72H 			//01B6 	01F2
		LDWI 	DH 			//01B7 	2A0D
		STR 	73H 			//01B8 	01F3
		LDWI 	1H 			//01B9 	2A01
		LCALL 	67CH 			//01BA 	367C

		//;smartkey.C: 435: tmp16 = timeTick+40;
		LDR 	7BH,0 			//01BB 	087B
		ORG		01BCH
		STR 	3DH 			//01BC 	01BD
		LDR 	7AH,0 			//01BD 	087A
		STR 	3CH 			//01BE 	01BC
		LDWI 	28H 			//01BF 	2A28
		ADDWR 	3CH,1 			//01C0 	0BBC
		BTSC 	STATUS,0 		//01C1 	1403
		INCR	3DH,1 			//01C2 	09BD
		LDWI 	AH 			//01C3 	2A0A
		ORG		01C4H

		//;smartkey.C: 436: beep(10,1);
		CLRR 	76H 			//01C4 	0176
		INCR	76H,1 			//01C5 	09F6
		LCALL 	600H 			//01C6 	3600

		//;smartkey.C: 437: }
		LJUMP 	242H 			//01C7 	3A42

		//;smartkey.C: 438: else if((mtOldState == 1)){
		DECRSZ 	47H,0 		//01C8 	0E47
		LJUMP 	242H 			//01C9 	3A42
		LJUMP 	1A8H 			//01CA 	39A8

		//;smartkey.C: 441: }
		//;smartkey.C: 442: }
		//;smartkey.C: 443: break;
		//;smartkey.C: 440: if(reAlertOn)reAlertOn =0;
		//;smartkey.C: 446: if(timeTick > 200)
		LDWI 	0H 			//01CB 	2A00
		ORG		01CCH
		SUBWR 	7BH,0 			//01CC 	0C7B
		LDWI 	C9H 			//01CD 	2AC9
		BTSC 	STATUS,2 		//01CE 	1503
		SUBWR 	7AH,0 			//01CF 	0C7A
		BTSS 	STATUS,0 		//01D0 	1C03
		LJUMP 	242H 			//01D1 	3A42

		//;smartkey.C: 447: {
		//;smartkey.C: 448: beepOff();
		LCALL 	6A7H 			//01D2 	36A7

		//;smartkey.C: 449: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LDWI 	8H 			//01D3 	2A08
		ORG		01D4H
		LCALL 	694H 			//01D4 	3694
		XORWI 	CCH 			//01D5 	26CC
		BTSS 	STATUS,2 		//01D6 	1D03
		LJUMP 	1DBH 			//01D7 	39DB
		LDWI 	8H 			//01D8 	2A08
		CLRR 	72H 			//01D9 	0172
		LCALL 	5E6H 			//01DA 	35E6
		LDWI 	ACH 			//01DB 	2AAC
		ORG		01DCH

		//;smartkey.C: 450: RegStatus |=(0x20);
		BCR 	STATUS,5 		//01DC 	1283
		BSR 	42H,5 			//01DD 	1AC2

		//;smartkey.C: 451: setState(1,3500);
		STR 	72H 			//01DE 	01F2
		LDWI 	DH 			//01DF 	2A0D
		STR 	73H 			//01E0 	01F3
		LDWI 	1H 			//01E1 	2A01
		LCALL 	67CH 			//01E2 	367C

		//;smartkey.C: 452: tmp16 = timeTick+40;
		LDR 	7BH,0 			//01E3 	087B
		ORG		01E4H
		STR 	3DH 			//01E4 	01BD
		LDR 	7AH,0 			//01E5 	087A
		STR 	3CH 			//01E6 	01BC
		LDWI 	28H 			//01E7 	2A28
		ADDWR 	3CH,1 			//01E8 	0BBC
		BTSC 	STATUS,0 		//01E9 	1403
		INCR	3DH,1 			//01EA 	09BD
		LJUMP 	242H 			//01EB 	3A42
		ORG		01ECH

		//;smartkey.C: 458: beepOff();
		LCALL 	6A7H 			//01EC 	36A7

		//;smartkey.C: 459: setState(2,300);
		LDWI 	2CH 			//01ED 	2A2C
		STR 	72H 			//01EE 	01F2
		LDWI 	1H 			//01EF 	2A01
		STR 	73H 			//01F0 	01F3
		LDWI 	2H 			//01F1 	2A02
		LCALL 	67CH 			//01F2 	367C

		//;smartkey.C: 460: break;
		LJUMP 	242H 			//01F3 	3A42
		ORG		01F4H
		LDR 	48H,0 			//01F4 	0848
		STR 	FSR 			//01F5 	0184
		LDWI 	5H 			//01F6 	2A05
		SUBWR 	FSR,0 			//01F7 	0C04
		BTSC 	STATUS,0 		//01F8 	1403
		LJUMP 	242H 			//01F9 	3A42
		LDWI 	6H 			//01FA 	2A06
		STR 	PCLATH 			//01FB 	018A
		ORG		01FCH
		LDWI 	9DH 			//01FC 	2A9D
		ADDWR 	FSR,0 			//01FD 	0B04
		STR 	PCL 			//01FE 	0182

		//;smartkey.C: 477: {
		//;smartkey.C: 479: if(lostDetect==1 && timeTick< 1500)
		DECRSZ 	45H,0 		//01FF 	0E45
		LJUMP 	225H 			//0200 	3A25
		LDWI 	5H 			//0201 	2A05
		SUBWR 	7BH,0 			//0202 	0C7B
		LDWI 	DCH 			//0203 	2ADC
		ORG		0204H
		BTSC 	STATUS,2 		//0204 	1503
		SUBWR 	7AH,0 			//0205 	0C7A
		BTSC 	STATUS,0 		//0206 	1403
		LJUMP 	225H 			//0207 	3A25

		//;smartkey.C: 480: {
		//;smartkey.C: 481: if(READ_EEPROM(0x08)==0x00) WRITE_EEPROM(0x08,0xcc);
		LDWI 	8H 			//0208 	2A08
		LCALL 	694H 			//0209 	3694
		IORWI 	0H 			//020A 	2500
		BTSS 	STATUS,2 		//020B 	1D03
		ORG		020CH
		LJUMP 	211H 			//020C 	3A11
		LDWI 	CCH 			//020D 	2ACC
		STR 	72H 			//020E 	01F2
		LDWI 	8H 			//020F 	2A08
		LCALL 	5E6H 			//0210 	35E6

		//;smartkey.C: 483: setState(3,1800);
		LDWI 	8H 			//0211 	2A08
		STR 	72H 			//0212 	01F2
		LDWI 	7H 			//0213 	2A07
		ORG		0214H
		STR 	73H 			//0214 	01F3
		LDWI 	3H 			//0215 	2A03
		LCALL 	67CH 			//0216 	367C

		//;smartkey.C: 484: cntTmp = timeTick+40;
		LDR 	7BH,0 			//0217 	087B
		STR 	3FH 			//0218 	01BF
		LDR 	7AH,0 			//0219 	087A
		STR 	3EH 			//021A 	01BE
		LDWI 	28H 			//021B 	2A28
		ORG		021CH
		ADDWR 	3EH,1 			//021C 	0BBE
		BTSC 	STATUS,0 		//021D 	1403
		INCR	3FH,1 			//021E 	09BF

		//;smartkey.C: 485: PR2 =11;
		LDWI 	BH 			//021F 	2A0B
		BSR 	STATUS,5 		//0220 	1A83
		STR 	12H 			//0221 	0192

		//;smartkey.C: 486: beepOn();
		LCALL 	6A2H 			//0222 	36A2

		//;smartkey.C: 487: lostDetect =0;
		BCR 	STATUS,5 		//0223 	1283
		ORG		0224H
		LJUMP 	182H 			//0224 	3982

		//;smartkey.C: 488: }
		//;smartkey.C: 489: else {
		//;smartkey.C: 490: lostDetect =1;
		CLRR 	45H 			//0225 	0145
		INCR	45H,1 			//0226 	09C5
		LJUMP 	183H 			//0227 	3983

		//;smartkey.C: 493: }
		//;smartkey.C: 494: timeTick =0;
		//;smartkey.C: 500: {
		//;smartkey.C: 501: timeTick =0;
		CLRR 	7AH 			//0228 	017A
		CLRR 	7BH 			//0229 	017B

		//;smartkey.C: 502: beepOn();TMR2ON = 0;
		LCALL 	6A2H 			//022A 	36A2
		LDWI 	2H 			//022B 	2A02
		ORG		022CH
		BCR 	STATUS,5 		//022C 	1283
		BCR 	12H,2 			//022D 	1112

		//;smartkey.C: 503: beep(10,2);
		STR 	76H 			//022E 	01F6
		LDWI 	AH 			//022F 	2A0A
		LCALL 	600H 			//0230 	3600

		//;smartkey.C: 504: if(mtOldState == 3){reAlertOn =1;}
		BCR 	STATUS,5 		//0231 	1283
		BCR 	STATUS,6 		//0232 	1303
		LDR 	47H,0 			//0233 	0847
		ORG		0234H
		XORWI 	3H 			//0234 	2603
		BTSS 	STATUS,2 		//0235 	1D03
		LJUMP 	242H 			//0236 	3A42
		CLRR 	34H 			//0237 	0134
		INCR	34H,1 			//0238 	09B4
		LJUMP 	242H 			//0239 	3A42
		LDR 	48H,0 			//023A 	0848
		XORWI 	1H 			//023B 	2601
		ORG		023CH
		BTSC 	STATUS,2 		//023C 	1503
		LJUMP 	1FFH 			//023D 	39FF
		XORWI 	3H 			//023E 	2603
		BTSC 	STATUS,2 		//023F 	1503
		LJUMP 	228H 			//0240 	3A28
		LJUMP 	242H 			//0241 	3A42

		//;smartkey.C: 508: }
		//;smartkey.C: 510: }
		//;smartkey.C: 512: PAIE = 1;
		BSR 	INTCON,3 		//0242 	198B

		//;smartkey.C: 513: }
		//;smartkey.C: 515: }
		//;smartkey.C: 519: {
		//;smartkey.C: 520: if((timeOut!=0)&&( timeTick >timeOut)){
		BCR 	STATUS,5 		//0243 	1283
		ORG		0244H
		BCR 	STATUS,6 		//0244 	1303
		LDR 	41H,0 			//0245 	0841
		IORWR 	40H,0 			//0246 	0340
		BTSC 	STATUS,2 		//0247 	1503
		LJUMP 	2B5H 			//0248 	3AB5
		LDR 	7BH,0 			//0249 	087B
		SUBWR 	41H,0 			//024A 	0C41
		BTSS 	STATUS,2 		//024B 	1D03
		ORG		024CH
		LJUMP 	24FH 			//024C 	3A4F
		LDR 	7AH,0 			//024D 	087A
		SUBWR 	40H,0 			//024E 	0C40
		BTSS 	STATUS,0 		//024F 	1C03
		LJUMP 	2A7H 			//0250 	3AA7
		LJUMP 	2B5H 			//0251 	3AB5

		//;smartkey.C: 531: beepOff();
		LCALL 	6A7H 			//0252 	36A7
		LDWI 	2CH 			//0253 	2A2C
		ORG		0254H

		//;smartkey.C: 532: RegStatus &=(~0x20);
		BCR 	STATUS,5 		//0254 	1283
		BCR 	42H,5 			//0255 	12C2

		//;smartkey.C: 533: setState(2,300);
		STR 	72H 			//0256 	01F2
		LDWI 	1H 			//0257 	2A01
		STR 	73H 			//0258 	01F3
		LDWI 	2H 			//0259 	2A02
		LCALL 	67CH 			//025A 	367C

		//;smartkey.C: 534: break;
		LJUMP 	2B5H 			//025B 	3AB5
		ORG		025CH

		//;smartkey.C: 536: beepOff();
		LCALL 	6A7H 			//025C 	36A7

		//;smartkey.C: 537: delay_x10ms(20);
		LDWI 	14H 			//025D 	2A14
		STR 	72H 			//025E 	01F2
		CLRR 	73H 			//025F 	0173
		LCALL 	62EH 			//0260 	362E

		//;smartkey.C: 538: beepOn();TMR2ON = 0;reAlertOn =0;
		LCALL 	6A2H 			//0261 	36A2
		LDWI 	1EH 			//0262 	2A1E
		BCR 	STATUS,5 		//0263 	1283
		ORG		0264H
		BCR 	12H,2 			//0264 	1112
		CLRR 	34H 			//0265 	0134
		CLRR 	76H 			//0266 	0176
		INCR	76H,1 			//0267 	09F6
		LCALL 	600H 			//0268 	3600
		LDWI 	0H 			//0269 	2A00

		//;smartkey.C: 540: setState(0,0);
		CLRR 	72H 			//026A 	0172
		CLRR 	73H 			//026B 	0173
		ORG		026CH
		LCALL 	67CH 			//026C 	367C

		//;smartkey.C: 541: RA7 =0;
		BCR 	5H,7 			//026D 	1385

		//;smartkey.C: 542: tmp16 = timeTick+40;
		LDR 	7BH,0 			//026E 	087B
		STR 	3DH 			//026F 	01BD
		LDR 	7AH,0 			//0270 	087A
		STR 	3CH 			//0271 	01BC
		LDWI 	28H 			//0272 	2A28
		ADDWR 	3CH,1 			//0273 	0BBC
		ORG		0274H
		BTSC 	STATUS,0 		//0274 	1403
		INCR	3DH,1 			//0275 	09BD

		//;smartkey.C: 543: break;
		LJUMP 	2B5H 			//0276 	3AB5

		//;smartkey.C: 546: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LDWI 	8H 			//0277 	2A08
		LCALL 	694H 			//0278 	3694
		XORWI 	CCH 			//0279 	26CC
		BTSS 	STATUS,2 		//027A 	1D03
		LJUMP 	27FH 			//027B 	3A7F
		ORG		027CH
		LDWI 	8H 			//027C 	2A08
		CLRR 	72H 			//027D 	0172
		LCALL 	5E6H 			//027E 	35E6

		//;smartkey.C: 548: if(reAlertOn){
		BCR 	STATUS,5 		//027F 	1283
		LDR 	34H,0 			//0280 	0834
		BTSC 	STATUS,2 		//0281 	1503
		LJUMP 	296H 			//0282 	3A96

		//;smartkey.C: 549: setState(4,6000);
		LDWI 	70H 			//0283 	2A70
		ORG		0284H
		STR 	72H 			//0284 	01F2
		LDWI 	17H 			//0285 	2A17
		STR 	73H 			//0286 	01F3
		LDWI 	4H 			//0287 	2A04
		LCALL 	67CH 			//0288 	367C

		//;smartkey.C: 550: cntTmp = timeTick+40;
		LDR 	7BH,0 			//0289 	087B
		STR 	3FH 			//028A 	01BF
		LDR 	7AH,0 			//028B 	087A
		ORG		028CH
		STR 	3EH 			//028C 	01BE
		LDWI 	28H 			//028D 	2A28
		ADDWR 	3EH,1 			//028E 	0BBE
		BTSC 	STATUS,0 		//028F 	1403
		INCR	3FH,1 			//0290 	09BF

		//;smartkey.C: 551: PR2 =11;
		LDWI 	BH 			//0291 	2A0B
		BSR 	STATUS,5 		//0292 	1A83
		STR 	12H 			//0293 	0192
		ORG		0294H

		//;smartkey.C: 552: beepOn();
		LCALL 	6A2H 			//0294 	36A2

		//;smartkey.C: 554: }else if(mtOldState == 0){
		LJUMP 	2B5H 			//0295 	3AB5
		LDR 	47H,1 			//0296 	08C7
		BTSS 	STATUS,2 		//0297 	1D03
		LJUMP 	261H 			//0298 	3A61

		//;smartkey.C: 556: beep(10,5);
		LDWI 	5H 			//0299 	2A05
		STR 	76H 			//029A 	01F6
		LDWI 	AH 			//029B 	2A0A
		ORG		029CH
		LCALL 	600H 			//029C 	3600
		LDWI 	ACH 			//029D 	2AAC

		//;smartkey.C: 557: RegStatus |=(0x20);
		BCR 	STATUS,5 		//029E 	1283
		BCR 	STATUS,6 		//029F 	1303
		BSR 	42H,5 			//02A0 	1AC2

		//;smartkey.C: 559: setState(1,3500);
		STR 	72H 			//02A1 	01F2
		LDWI 	DH 			//02A2 	2A0D
		STR 	73H 			//02A3 	01F3
		ORG		02A4H
		LDWI 	1H 			//02A4 	2A01
		LCALL 	67CH 			//02A5 	367C
		LJUMP 	26EH 			//02A6 	3A6E

		//;smartkey.C: 566: setState(0,0);
		//;smartkey.C: 565: beep(30,1);
		//;smartkey.C: 564: reAlertOn =0;
		//;smartkey.C: 563: beepOn();TMR2ON = 0;
		LDR 	48H,0 			//02A7 	0848
		XORWI 	1H 			//02A8 	2601
		BTSC 	STATUS,2 		//02A9 	1503
		LJUMP 	2B5H 			//02AA 	3AB5
		XORWI 	3H 			//02AB 	2603
		ORG		02ACH
		BTSC 	STATUS,2 		//02AC 	1503
		LJUMP 	277H 			//02AD 	3A77
		XORWI 	1H 			//02AE 	2601
		BTSC 	STATUS,2 		//02AF 	1503
		LJUMP 	252H 			//02B0 	3A52
		XORWI 	7H 			//02B1 	2607
		BTSC 	STATUS,2 		//02B2 	1503
		LJUMP 	25CH 			//02B3 	3A5C
		ORG		02B4H
		LJUMP 	2B5H 			//02B4 	3AB5

		//;smartkey.C: 572: }
		//;smartkey.C: 574: }
		//;smartkey.C: 576: if((timeTick>tmp16) && (mtState == 1) && mpuOk ==1){
		LDR 	7BH,0 			//02B5 	087B
		BCR 	STATUS,5 		//02B6 	1283
		SUBWR 	3DH,0 			//02B7 	0C3D
		BTSS 	STATUS,2 		//02B8 	1D03
		LJUMP 	2BCH 			//02B9 	3ABC
		LDR 	7AH,0 			//02BA 	087A
		SUBWR 	3CH,0 			//02BB 	0C3C
		ORG		02BCH
		BTSC 	STATUS,0 		//02BC 	1403
		LJUMP 	358H 			//02BD 	3B58
		DECRSZ 	48H,0 		//02BE 	0E48
		LJUMP 	358H 			//02BF 	3B58
		DECRSZ 	36H,0 		//02C0 	0E36
		LJUMP 	358H 			//02C1 	3B58

		//;smartkey.C: 577: tmp16 = timeTick+40;
		LDR 	7BH,0 			//02C2 	087B
		STR 	3DH 			//02C3 	01BD
		ORG		02C4H
		LDR 	7AH,0 			//02C4 	087A
		STR 	3CH 			//02C5 	01BC
		LDWI 	28H 			//02C6 	2A28
		ADDWR 	3CH,1 			//02C7 	0BBC
		BTSC 	STATUS,0 		//02C8 	1403
		INCR	3DH,1 			//02C9 	09BD

		//;smartkey.C: 578: if(AccRead(0x3b,buf,6)==0){
		LDWI 	2EH 			//02CA 	2A2E
		STR 	76H 			//02CB 	01F6
		ORG		02CCH
		LDWI 	6H 			//02CC 	2A06
		CLRR 	77H 			//02CD 	0177
		STR 	78H 			//02CE 	01F8
		LDWI 	3BH 			//02CF 	2A3B
		LCALL 	508H 			//02D0 	3508
		IORWI 	0H 			//02D1 	2500
		BTSS 	STATUS,2 		//02D2 	1D03
		LJUMP 	358H 			//02D3 	3B58
		ORG		02D4H

		//;smartkey.C: 580: if(compe(buf[0], (signed char)acXsum,5) && compe(buf[2], (signed char)
		//+                          acYsum,5)){
		BCR 	STATUS,5 		//02D4 	1283
		BCR 	STATUS,6 		//02D5 	1303
		LDR 	39H,0 			//02D6 	0839
		STR 	72H 			//02D7 	01F2
		LDWI 	5H 			//02D8 	2A05
		STR 	73H 			//02D9 	01F3
		LDR 	2EH,0 			//02DA 	082E
		LCALL 	483H 			//02DB 	3483
		ORG		02DCH
		XORWI 	0H 			//02DC 	2600
		BCR 	STATUS,5 		//02DD 	1283
		BCR 	STATUS,6 		//02DE 	1303
		BTSC 	STATUS,2 		//02DF 	1503
		LJUMP 	302H 			//02E0 	3B02
		LDR 	37H,0 			//02E1 	0837
		STR 	72H 			//02E2 	01F2
		LDWI 	5H 			//02E3 	2A05
		ORG		02E4H
		STR 	73H 			//02E4 	01F3
		LDR 	30H,0 			//02E5 	0830
		LCALL 	483H 			//02E6 	3483
		XORWI 	0H 			//02E7 	2600

		//;smartkey.C: 582: isSw++;
		BCR 	STATUS,5 		//02E8 	1283
		BCR 	STATUS,6 		//02E9 	1303
		BTSC 	STATUS,2 		//02EA 	1503
		LJUMP 	302H 			//02EB 	3B02
		ORG		02ECH
		LDWI 	2DH 			//02EC 	2A2D
		INCR	3BH,1 			//02ED 	09BB

		//;smartkey.C: 583: if(isSw >44){
		SUBWR 	3BH,0 			//02EE 	0C3B
		BTSS 	STATUS,0 		//02EF 	1C03
		LJUMP 	2F5H 			//02F0 	3AF5
		LDWI 	2H 			//02F1 	2A02

		//;smartkey.C: 584: isSw =0;
		CLRR 	3BH 			//02F2 	013B

		//;smartkey.C: 585: vibrateOn=2;
		STR 	2DH 			//02F3 	01AD
		ORG		02F4H
		LJUMP 	32CH 			//02F4 	3B2C

		//;smartkey.C: 588: }
		//;smartkey.C: 587: setState(2,300);
		//;smartkey.C: 586: RegStatus &=(~0x20);
		//;smartkey.C: 589: else if(isSw > 25){
		LDWI 	1AH 			//02F5 	2A1A
		SUBWR 	3BH,0 			//02F6 	0C3B
		BTSC 	STATUS,0 		//02F7 	1403

		//;smartkey.C: 590: if(isSw%2==0){
		BTSC 	3BH,0 			//02F8 	143B
		LJUMP 	333H 			//02F9 	3B33

		//;smartkey.C: 591: beepOn();TMR2ON = 0; beep(7,1);
		LCALL 	6A2H 			//02FA 	36A2
		LDWI 	7H 			//02FB 	2A07
		ORG		02FCH
		BCR 	STATUS,5 		//02FC 	1283
		BCR 	12H,2 			//02FD 	1112
		CLRR 	76H 			//02FE 	0176
		INCR	76H,1 			//02FF 	09F6
		LCALL 	600H 			//0300 	3600
		LJUMP 	333H 			//0301 	3B33

		//;smartkey.C: 596: else{
		//;smartkey.C: 597: isSw =0;
		//;smartkey.C: 592: }
		//;smartkey.C: 593: }
		//;smartkey.C: 595: }
		CLRR 	3BH 			//0302 	013B

		//;smartkey.C: 600: if(compe(buf[0], acXOld,2) && compe(buf[2], acYOld,2)){
		LDR 	2CH,0 			//0303 	082C
		ORG		0304H
		STR 	72H 			//0304 	01F2
		LDWI 	2H 			//0305 	2A02
		STR 	73H 			//0306 	01F3
		LDR 	2EH,0 			//0307 	082E
		LCALL 	483H 			//0308 	3483
		XORWI 	0H 			//0309 	2600
		BCR 	STATUS,5 		//030A 	1283
		BCR 	STATUS,6 		//030B 	1303
		ORG		030CH
		BTSC 	STATUS,2 		//030C 	1503
		LJUMP 	335H 			//030D 	3B35
		LDR 	2BH,0 			//030E 	082B
		STR 	72H 			//030F 	01F2
		LDWI 	2H 			//0310 	2A02
		STR 	73H 			//0311 	01F3
		LDR 	30H,0 			//0312 	0830
		LCALL 	483H 			//0313 	3483
		ORG		0314H
		XORWI 	0H 			//0314 	2600

		//;smartkey.C: 601: isWait++;
		BCR 	STATUS,5 		//0315 	1283
		BCR 	STATUS,6 		//0316 	1303
		BTSC 	STATUS,2 		//0317 	1503
		LJUMP 	335H 			//0318 	3B35
		INCR	28H,1 			//0319 	09A8
		BTSC 	STATUS,2 		//031A 	1503
		INCR	29H,1 			//031B 	09A9
		ORG		031CH

		//;smartkey.C: 602: if(isWait==450){
		DECR 	29H,0 			//031C 	0D29
		LDWI 	C2H 			//031D 	2AC2
		BTSC 	STATUS,2 		//031E 	1503
		XORWR 	28H,0 			//031F 	0428
		BTSS 	STATUS,2 		//0320 	1D03
		LJUMP 	333H 			//0321 	3B33
		LDWI 	2H 			//0322 	2A02

		//;smartkey.C: 603: isWait = 0;
		CLRR 	28H 			//0323 	0128
		ORG		0324H
		CLRR 	29H 			//0324 	0129

		//;smartkey.C: 604: beep(7,2);
		STR 	76H 			//0325 	01F6
		LDWI 	7H 			//0326 	2A07
		LCALL 	600H 			//0327 	3600

		//;smartkey.C: 605: vibrateOn=1;
		BCR 	STATUS,5 		//0328 	1283
		BCR 	STATUS,6 		//0329 	1303
		CLRR 	2DH 			//032A 	012D
		INCR	2DH,1 			//032B 	09AD
		ORG		032CH
		LDWI 	2CH 			//032C 	2A2C

		//;smartkey.C: 606: RegStatus &=(~0x20);
		BCR 	42H,5 			//032D 	12C2

		//;smartkey.C: 607: setState(2,300);
		STR 	72H 			//032E 	01F2
		LDWI 	1H 			//032F 	2A01
		STR 	73H 			//0330 	01F3
		LDWI 	2H 			//0331 	2A02
		LCALL 	67CH 			//0332 	367C

		//;smartkey.C: 608: }
		//;smartkey.C: 609: }
		//;smartkey.C: 611: }
		//;smartkey.C: 613: if( (buf[4] > -31) && (buf[4] < 31)) {
		BCR 	STATUS,5 		//0333 	1283
		ORG		0334H
		BCR 	STATUS,6 		//0334 	1303
		LDR 	32H,0 			//0335 	0832
		XORWI 	80H 			//0336 	2680
		ADDWI 	9EH 			//0337 	279E
		BTSS 	STATUS,0 		//0338 	1C03
		LJUMP 	353H 			//0339 	3B53
		LDR 	32H,0 			//033A 	0832
		XORWI 	80H 			//033B 	2680
		ORG		033CH
		ADDWI 	61H 			//033C 	2761
		BTSC 	STATUS,0 		//033D 	1403
		LJUMP 	353H 			//033E 	3B53
		LDWI 	5H 			//033F 	2A05

		//;smartkey.C: 614: isFall++;
		INCR	2AH,1 			//0340 	09AA

		//;smartkey.C: 615: if(isFall >4){
		SUBWR 	2AH,0 			//0341 	0C2A
		BTSS 	STATUS,0 		//0342 	1C03
		LJUMP 	354H 			//0343 	3B54
		ORG		0344H
		LDWI 	2H 			//0344 	2A02

		//;smartkey.C: 616: isFall =0;
		CLRR 	2AH 			//0345 	012A

		//;smartkey.C: 617: beep(7,2);
		STR 	76H 			//0346 	01F6
		LDWI 	7H 			//0347 	2A07
		LCALL 	600H 			//0348 	3600
		LDWI 	2CH 			//0349 	2A2C

		//;smartkey.C: 618: RegStatus &=(~0x20);
		BCR 	STATUS,5 		//034A 	1283
		BCR 	STATUS,6 		//034B 	1303
		ORG		034CH
		BCR 	42H,5 			//034C 	12C2

		//;smartkey.C: 619: setState(2,300);
		STR 	72H 			//034D 	01F2
		LDWI 	1H 			//034E 	2A01
		STR 	73H 			//034F 	01F3
		LDWI 	2H 			//0350 	2A02
		LCALL 	67CH 			//0351 	367C
		LJUMP 	354H 			//0352 	3B54

		//;smartkey.C: 622: else{
		//;smartkey.C: 623: isFall=0;
		CLRR 	2AH 			//0353 	012A
		ORG		0354H

		//;smartkey.C: 624: }
		//;smartkey.C: 626: acYOld = buf[2];acXOld = buf[0];
		LDR 	30H,0 			//0354 	0830
		STR 	2BH 			//0355 	01AB
		LDR 	2EH,0 			//0356 	082E
		STR 	2CH 			//0357 	01AC

		//;smartkey.C: 627: }
		//;smartkey.C: 629: }
		//;smartkey.C: 632: if((timeTick>tmp16) && (mtState == 0 ) && mpuOk ==1){
		LDR 	7BH,0 			//0358 	087B
		BCR 	STATUS,5 		//0359 	1283
		BCR 	STATUS,6 		//035A 	1303
		SUBWR 	3DH,0 			//035B 	0C3D
		ORG		035CH
		BTSS 	STATUS,2 		//035C 	1D03
		LJUMP 	360H 			//035D 	3B60
		LDR 	7AH,0 			//035E 	087A
		SUBWR 	3CH,0 			//035F 	0C3C
		BTSC 	STATUS,0 		//0360 	1403
		LJUMP 	3C0H 			//0361 	3BC0
		LDR 	48H,1 			//0362 	08C8
		BTSS 	STATUS,2 		//0363 	1D03
		ORG		0364H
		LJUMP 	3C0H 			//0364 	3BC0
		DECRSZ 	36H,0 		//0365 	0E36
		LJUMP 	3C0H 			//0366 	3BC0

		//;smartkey.C: 634: if(timeTick >65000) timeTick =0;
		LDWI 	FDH 			//0367 	2AFD
		SUBWR 	7BH,0 			//0368 	0C7B
		LDWI 	E9H 			//0369 	2AE9
		BTSC 	STATUS,2 		//036A 	1503
		SUBWR 	7AH,0 			//036B 	0C7A
		ORG		036CH
		BTSS 	STATUS,0 		//036C 	1C03
		LJUMP 	370H 			//036D 	3B70
		CLRR 	7AH 			//036E 	017A
		CLRR 	7BH 			//036F 	017B

		//;smartkey.C: 635: tmp16 = timeTick+40;
		LDR 	7BH,0 			//0370 	087B
		STR 	3DH 			//0371 	01BD
		LDR 	7AH,0 			//0372 	087A
		STR 	3CH 			//0373 	01BC
		ORG		0374H
		LDWI 	28H 			//0374 	2A28
		ADDWR 	3CH,1 			//0375 	0BBC
		BTSC 	STATUS,0 		//0376 	1403
		INCR	3DH,1 			//0377 	09BD

		//;smartkey.C: 637: if(AccRead(0x3b,buf,6)==0){
		LDWI 	2EH 			//0378 	2A2E
		STR 	76H 			//0379 	01F6
		LDWI 	6H 			//037A 	2A06
		CLRR 	77H 			//037B 	0177
		ORG		037CH
		STR 	78H 			//037C 	01F8
		LDWI 	3BH 			//037D 	2A3B
		LCALL 	508H 			//037E 	3508
		IORWI 	0H 			//037F 	2500

		//;smartkey.C: 638: if(vibrateOn==1){
		BCR 	STATUS,5 		//0380 	1283
		BCR 	STATUS,6 		//0381 	1303
		BTSS 	STATUS,2 		//0382 	1D03
		LJUMP 	3C2H 			//0383 	3BC2
		ORG		0384H
		DECRSZ 	2DH,0 		//0384 	0E2D
		LJUMP 	39EH 			//0385 	3B9E

		//;smartkey.C: 639: if(compe(buf[0],acXOld ,2) && compe(buf[2],acYOld ,2)){
		LDR 	2CH,0 			//0386 	082C
		STR 	72H 			//0387 	01F2
		LDWI 	2H 			//0388 	2A02
		STR 	73H 			//0389 	01F3
		LDR 	2EH,0 			//038A 	082E
		LCALL 	483H 			//038B 	3483
		ORG		038CH
		XORWI 	0H 			//038C 	2600
		BCR 	STATUS,5 		//038D 	1283
		BCR 	STATUS,6 		//038E 	1303
		BTSC 	STATUS,2 		//038F 	1503
		LJUMP 	3B8H 			//0390 	3BB8
		LDR 	2BH,0 			//0391 	082B
		STR 	72H 			//0392 	01F2
		LDWI 	2H 			//0393 	2A02
		ORG		0394H
		STR 	73H 			//0394 	01F3
		LDR 	30H,0 			//0395 	0830
		LCALL 	483H 			//0396 	3483
		XORWI 	0H 			//0397 	2600
		BTSC 	STATUS,2 		//0398 	1503
		LJUMP 	3B6H 			//0399 	3BB6

		//;smartkey.C: 641: isSw=0;
		BCR 	STATUS,5 		//039A 	1283
		BCR 	STATUS,6 		//039B 	1303
		ORG		039CH
		CLRR 	3BH 			//039C 	013B

		//;smartkey.C: 644: }
		LJUMP 	3C0H 			//039D 	3BC0

		//;smartkey.C: 649: {
		//;smartkey.C: 650: beepOn();TMR2ON = 0; beep(7,3);
		//;smartkey.C: 645: else{
		//;smartkey.C: 646: isSw++;
		//;smartkey.C: 654: else if(vibrateOn==2){
		LDR 	2DH,0 			//039E 	082D
		XORWI 	2H 			//039F 	2602
		BTSS 	STATUS,2 		//03A0 	1D03
		LJUMP 	3C0H 			//03A1 	3BC0

		//;smartkey.C: 655: if(compe(buf[0],(signed char)acXsum ,5) && compe(buf[2],(signed char)a
		//+                          cYsum ,5)){
		LDR 	39H,0 			//03A2 	0839
		STR 	72H 			//03A3 	01F2
		ORG		03A4H
		LDWI 	5H 			//03A4 	2A05
		STR 	73H 			//03A5 	01F3
		LDR 	2EH,0 			//03A6 	082E
		LCALL 	483H 			//03A7 	3483
		XORWI 	0H 			//03A8 	2600
		BCR 	STATUS,5 		//03A9 	1283
		BCR 	STATUS,6 		//03AA 	1303
		BTSC 	STATUS,2 		//03AB 	1503
		ORG		03ACH
		LJUMP 	3B8H 			//03AC 	3BB8
		LDR 	37H,0 			//03AD 	0837
		STR 	72H 			//03AE 	01F2
		LDWI 	5H 			//03AF 	2A05
		STR 	73H 			//03B0 	01F3
		LDR 	30H,0 			//03B1 	0830
		LCALL 	483H 			//03B2 	3483
		XORWI 	0H 			//03B3 	2600
		ORG		03B4H
		BTSS 	STATUS,2 		//03B4 	1D03
		LJUMP 	39AH 			//03B5 	3B9A

		//;smartkey.C: 661: else{
		//;smartkey.C: 662: isSw++;
		BCR 	STATUS,5 		//03B6 	1283
		BCR 	STATUS,6 		//03B7 	1303
		INCR	3BH,1 			//03B8 	09BB

		//;smartkey.C: 665: {
		//;smartkey.C: 666: beepOn();TMR2ON = 0; beep(7,3);
		LCALL 	6A2H 			//03B9 	36A2
		LDWI 	3H 			//03BA 	2A03
		BCR 	STATUS,5 		//03BB 	1283
		ORG		03BCH
		BCR 	12H,2 			//03BC 	1112
		STR 	76H 			//03BD 	01F6
		LDWI 	7H 			//03BE 	2A07
		LCALL 	600H 			//03BF 	3600

		//;smartkey.C: 667: }
		//;smartkey.C: 668: }
		//;smartkey.C: 669: }
		//;smartkey.C: 671: }
		//;smartkey.C: 674: }
		//;smartkey.C: 676: if(RegStatus & 0x20) {RC4 =1;RC2 =1;}
		BCR 	STATUS,5 		//03C0 	1283
		BCR 	STATUS,6 		//03C1 	1303
		BTSS 	42H,5 			//03C2 	1EC2
		LJUMP 	3C7H 			//03C3 	3BC7
		ORG		03C4H
		BSR 	7H,4 			//03C4 	1A07
		BSR 	7H,2 			//03C5 	1907
		LJUMP 	170H 			//03C6 	3970

		//;smartkey.C: 677: else {RC4 =0;RC2 =0;}
		BCR 	7H,4 			//03C7 	1207
		BCR 	7H,2 			//03C8 	1107
		LJUMP 	170H 			//03C9 	3970

		//;smartkey.C: 50: if(PAIE&&PAIF){
		BTSC 	INTCON,3 		//03CA 	158B
		BTSS 	INTCON,0 		//03CB 	1C0B
		ORG		03CCH
		LJUMP 	3DCH 			//03CC 	3BDC

		//;smartkey.C: 53: tmp = PORTA;
		BCR 	STATUS,5 		//03CD 	1283
		BCR 	STATUS,6 		//03CE 	1303
		LDR 	5H,0 			//03CF 	0805

		//;smartkey.C: 54: PAIF = 0;
		BCR 	INTCON,0 		//03D0 	100B

		//;smartkey.C: 56: if(RA6){
		BTSS 	5H,6 			//03D1 	1F05
		LJUMP 	3DBH 			//03D2 	3BDB

		//;smartkey.C: 58: if(mode_chek == 0){
		LDR 	46H,1 			//03D3 	08C6
		ORG		03D4H
		BTSS 	STATUS,2 		//03D4 	1D03
		LJUMP 	3DCH 			//03D5 	3BDC

		//;smartkey.C: 59: cntCyc = 0;
		CLRR 	43H 			//03D6 	0143

		//;smartkey.C: 60: cntOff = 0;
		CLRR 	44H 			//03D7 	0144

		//;smartkey.C: 62: mode_chek = 1;
		CLRR 	46H 			//03D8 	0146
		INCR	46H,1 			//03D9 	09C6
		LJUMP 	3DCH 			//03DA 	3BDC

		//;smartkey.C: 67: else{
		//;smartkey.C: 68: cntOff = 0;
		CLRR 	44H 			//03DB 	0144
		ORG		03DCH

		//;smartkey.C: 71: }
		//;smartkey.C: 73: }
		//;smartkey.C: 94: if(TMR1IE&&TMR1IF){
		BSR 	STATUS,5 		//03DC 	1A83
		BCR 	STATUS,6 		//03DD 	1303
		BTSS 	CH,0 			//03DE 	1C0C
		LJUMP 	42EH 			//03DF 	3C2E
		BCR 	STATUS,5 		//03E0 	1283
		BTSS 	CH,0 			//03E1 	1C0C
		LJUMP 	42EH 			//03E2 	3C2E
		LDWI 	ECH 			//03E3 	2AEC
		ORG		03E4H

		//;smartkey.C: 96: TMR1IF = 0;
		BCR 	CH,0 			//03E4 	100C

		//;smartkey.C: 98: TMR1H = -5000>>8;
		STR 	FH 			//03E5 	018F

		//;smartkey.C: 99: TMR1L = -5000;
		LDWI 	78H 			//03E6 	2A78
		STR 	EH 			//03E7 	018E

		//;smartkey.C: 105: if( mode_chek == 1){
		DECRSZ 	46H,0 		//03E8 	0E46
		LJUMP 	402H 			//03E9 	3C02

		//;smartkey.C: 107: cntCyc++;
		INCR	43H,1 			//03EA 	09C3

		//;smartkey.C: 109: if(RA6==0){
		BTSC 	5H,6 			//03EB 	1705
		ORG		03ECH
		LJUMP 	402H 			//03EC 	3C02
		LDWI 	10H 			//03ED 	2A10

		//;smartkey.C: 111: cntOff++;
		INCR	44H,1 			//03EE 	09C4

		//;smartkey.C: 114: if(cntOff > 15){
		SUBWR 	44H,0 			//03EF 	0C44
		BTSS 	STATUS,0 		//03F0 	1C03
		LJUMP 	402H 			//03F1 	3C02
		LDWI 	10H 			//03F2 	2A10

		//;smartkey.C: 116: mode_chek = 0;
		CLRR 	46H 			//03F3 	0146
		ORG		03F4H

		//;smartkey.C: 118: if((cntCyc>15) &&(cntCyc<50)) {
		SUBWR 	43H,0 			//03F4 	0C43
		LDWI 	32H 			//03F5 	2A32
		BTSS 	STATUS,0 		//03F6 	1C03
		LJUMP 	3FEH 			//03F7 	3BFE
		SUBWR 	43H,0 			//03F8 	0C43
		BTSC 	STATUS,0 		//03F9 	1403
		LJUMP 	3FDH 			//03FA 	3BFD

		//;smartkey.C: 119: RegStatus |= (0x40);
		BSR 	42H,6 			//03FB 	1B42
		ORG		03FCH

		//;smartkey.C: 120: } else if (cntCyc>=50){
		LJUMP 	401H 			//03FC 	3C01
		LDWI 	32H 			//03FD 	2A32
		SUBWR 	43H,0 			//03FE 	0C43
		BTSC 	STATUS,0 		//03FF 	1403

		//;smartkey.C: 121: RegStatus &= ~(0x40);
		BCR 	42H,6 			//0400 	1342

		//;smartkey.C: 122: }
		//;smartkey.C: 125: RegStatus |= 0x80;
		BSR 	42H,7 			//0401 	1BC2

		//;smartkey.C: 126: }
		//;smartkey.C: 128: }
		//;smartkey.C: 138: }
		//;smartkey.C: 141: timeTick++;
		INCR	7AH,1 			//0402 	09FA
		BTSC 	STATUS,2 		//0403 	1503
		ORG		0404H
		INCR	7BH,1 			//0404 	09FB

		//;smartkey.C: 143: if((mtState == 4)||(mtState == 3)){
		LDR 	48H,0 			//0405 	0848
		XORWI 	4H 			//0406 	2604
		BTSC 	STATUS,2 		//0407 	1503
		LJUMP 	40DH 			//0408 	3C0D
		LDR 	48H,0 			//0409 	0848
		XORWI 	3H 			//040A 	2603
		BTSS 	STATUS,2 		//040B 	1D03
		ORG		040CH
		LJUMP 	42EH 			//040C 	3C2E

		//;smartkey.C: 145: if(timeTick > cntTmp){
		LDR 	7BH,0 			//040D 	087B
		SUBWR 	3FH,0 			//040E 	0C3F
		BTSS 	STATUS,2 		//040F 	1D03
		LJUMP 	413H 			//0410 	3C13
		LDR 	7AH,0 			//0411 	087A
		SUBWR 	3EH,0 			//0412 	0C3E
		BTSC 	STATUS,0 		//0413 	1403
		ORG		0414H
		LJUMP 	42EH 			//0414 	3C2E

		//;smartkey.C: 146: cntTmp = timeTick+40;
		LDR 	7BH,0 			//0415 	087B
		STR 	3FH 			//0416 	01BF
		LDR 	7AH,0 			//0417 	087A
		STR 	3EH 			//0418 	01BE
		LDWI 	28H 			//0419 	2A28
		ADDWR 	3EH,1 			//041A 	0BBE
		BTSC 	STATUS,0 		//041B 	1403
		ORG		041CH
		INCR	3FH,1 			//041C 	09BF

		//;smartkey.C: 147: if(cntTmp<=timeOut)
		LDR 	3FH,0 			//041D 	083F
		SUBWR 	41H,0 			//041E 	0C41
		BTSS 	STATUS,2 		//041F 	1D03
		LJUMP 	423H 			//0420 	3C23
		LDR 	3EH,0 			//0421 	083E
		SUBWR 	40H,0 			//0422 	0C40

		//;smartkey.C: 148: {
		//;smartkey.C: 149: if(PR2 == 11)
		BSR 	STATUS,5 		//0423 	1A83
		ORG		0424H
		BTSS 	STATUS,0 		//0424 	1C03
		LJUMP 	42FH 			//0425 	3C2F
		LDR 	12H,0 			//0426 	0812
		XORWI 	BH 			//0427 	260B
		BTSS 	STATUS,2 		//0428 	1D03
		LJUMP 	42CH 			//0429 	3C2C

		//;smartkey.C: 150: PR2 = 30;
		LDWI 	1EH 			//042A 	2A1E
		LJUMP 	42DH 			//042B 	3C2D
		ORG		042CH

		//;smartkey.C: 151: else
		//;smartkey.C: 152: PR2 = 11;
		LDWI 	BH 			//042C 	2A0B
		STR 	12H 			//042D 	0192

		//;smartkey.C: 153: }
		//;smartkey.C: 154: }
		//;smartkey.C: 155: }
		//;smartkey.C: 158: }
		//;smartkey.C: 161: if(TMR2IE&&TMR2IF)
		BSR 	STATUS,5 		//042E 	1A83
		BTSS 	CH,1 			//042F 	1C8C
		LJUMP 	437H 			//0430 	3C37
		BCR 	STATUS,5 		//0431 	1283
		BTSS 	CH,1 			//0432 	1C8C
		LJUMP 	437H 			//0433 	3C37
		ORG		0434H
		LDWI 	10H 			//0434 	2A10

		//;smartkey.C: 162: {
		//;smartkey.C: 163: TMR2IF = 0;
		BCR 	CH,1 			//0435 	108C

		//;smartkey.C: 164: RA4 =~ RA4;
		XORWR 	5H,1 			//0436 	0485
		LDR 	71H,0 			//0437 	0871
		STR 	PCLATH 			//0438 	018A
		SWAPR 	70H,0 			//0439 	0770
		STR 	STATUS 			//043A 	0183
		SWAPR 	7EH,1 			//043B 	07FE
		ORG		043CH
		SWAPR 	7EH,0 			//043C 	077E
		RETI		 			//043D 	0009
		CLRR 	77H 			//043E 	0177
		BTSS 	73H,7 			//043F 	1FF3
		LJUMP 	448H 			//0440 	3C48
		COMR 	72H,1 			//0441 	0FF2
		COMR 	73H,1 			//0442 	0FF3
		INCR	72H,1 			//0443 	09F2
		ORG		0444H
		BTSC 	STATUS,2 		//0444 	1503
		INCR	73H,1 			//0445 	09F3
		CLRR 	77H 			//0446 	0177
		INCR	77H,1 			//0447 	09F7
		BTSS 	75H,7 			//0448 	1FF5
		LJUMP 	451H 			//0449 	3C51
		COMR 	74H,1 			//044A 	0FF4
		COMR 	75H,1 			//044B 	0FF5
		ORG		044CH
		INCR	74H,1 			//044C 	09F4
		BTSC 	STATUS,2 		//044D 	1503
		INCR	75H,1 			//044E 	09F5
		LDWI 	1H 			//044F 	2A01
		XORWR 	77H,1 			//0450 	04F7
		CLRR 	78H 			//0451 	0178
		CLRR 	79H 			//0452 	0179
		LDR 	73H,0 			//0453 	0873
		ORG		0454H
		IORWR 	72H,0 			//0454 	0372
		BTSC 	STATUS,2 		//0455 	1503
		LJUMP 	476H 			//0456 	3C76
		CLRR 	76H 			//0457 	0176
		INCR	76H,1 			//0458 	09F6
		BTSC 	73H,7 			//0459 	17F3
		LJUMP 	45FH 			//045A 	3C5F
		BCR 	STATUS,0 		//045B 	1003
		ORG		045CH
		RLR 	72H,1 			//045C 	05F2
		RLR 	73H,1 			//045D 	05F3
		LJUMP 	458H 			//045E 	3C58
		BCR 	STATUS,0 		//045F 	1003
		RLR 	78H,1 			//0460 	05F8
		RLR 	79H,1 			//0461 	05F9
		LDR 	73H,0 			//0462 	0873
		SUBWR 	75H,0 			//0463 	0C75
		ORG		0464H
		BTSS 	STATUS,2 		//0464 	1D03
		LJUMP 	468H 			//0465 	3C68
		LDR 	72H,0 			//0466 	0872
		SUBWR 	74H,0 			//0467 	0C74
		BTSS 	STATUS,0 		//0468 	1C03
		LJUMP 	472H 			//0469 	3C72
		LDR 	72H,0 			//046A 	0872
		SUBWR 	74H,1 			//046B 	0CF4
		ORG		046CH
		LDR 	73H,0 			//046C 	0873
		BTSS 	STATUS,0 		//046D 	1C03
		DECR 	75H,1 			//046E 	0DF5
		SUBWR 	75H,1 			//046F 	0CF5
		BSR 	78H,0 			//0470 	1878
		BCR 	STATUS,0 		//0471 	1003
		RRR	73H,1 			//0472 	06F3
		RRR	72H,1 			//0473 	06F2
		ORG		0474H
		DECRSZ 	76H,1 		//0474 	0EF6
		LJUMP 	45FH 			//0475 	3C5F
		LDR 	77H,0 			//0476 	0877
		BTSC 	STATUS,2 		//0477 	1503
		LJUMP 	47EH 			//0478 	3C7E
		COMR 	78H,1 			//0479 	0FF8
		COMR 	79H,1 			//047A 	0FF9
		INCR	78H,1 			//047B 	09F8
		ORG		047CH
		BTSC 	STATUS,2 		//047C 	1503
		INCR	79H,1 			//047D 	09F9
		LDR 	79H,0 			//047E 	0879
		STR 	73H 			//047F 	01F3
		LDR 	78H,0 			//0480 	0878
		STR 	72H 			//0481 	01F2
		RET		 					//0482 	0004
		STR 	79H 			//0483 	01F9
		ORG		0484H

		//;smartkey.C: 235: if(a>b){
		LDR 	72H,0 			//0484 	0872
		XORWI 	80H 			//0485 	2680
		STR 	74H 			//0486 	01F4
		LDR 	79H,0 			//0487 	0879
		XORWI 	80H 			//0488 	2680
		SUBWR 	74H,1 			//0489 	0CF4
		BTSC 	STATUS,0 		//048A 	1403
		LJUMP 	4AFH 			//048B 	3CAF
		ORG		048CH

		//;smartkey.C: 236: if((a-b)<=dt) return 1;
		LDR 	72H,0 			//048C 	0872
		SUBWR 	79H,0 			//048D 	0C79
		STR 	74H 			//048E 	01F4
		CLRR 	75H 			//048F 	0175
		BTSS 	STATUS,0 		//0490 	1C03
		DECR 	75H,1 			//0491 	0DF5
		BTSC 	79H,7 			//0492 	17F9
		DECR 	75H,1 			//0493 	0DF5
		ORG		0494H
		BTSC 	72H,7 			//0494 	17F2
		INCR	75H,1 			//0495 	09F5
		LDR 	73H,0 			//0496 	0873
		LCALL 	4BCH 			//0497 	34BC
		BTSS 	STATUS,2 		//0498 	1D03
		LJUMP 	49CH 			//0499 	3C9C
		LDR 	74H,0 			//049A 	0874
		SUBWR 	76H,0 			//049B 	0C76
		ORG		049CH
		BTSS 	STATUS,0 		//049C 	1C03
		RETW 	0H 			//049D 	2100
		RETW 	1H 			//049E 	2101

		//;smartkey.C: 240: if((b-a)<=dt) return 1;
		SUBWR 	72H,0 			//049F 	0C72
		STR 	74H 			//04A0 	01F4
		CLRR 	75H 			//04A1 	0175
		BTSS 	STATUS,0 		//04A2 	1C03
		DECR 	75H,1 			//04A3 	0DF5
		ORG		04A4H
		BTSC 	72H,7 			//04A4 	17F2
		DECR 	75H,1 			//04A5 	0DF5
		BTSC 	79H,7 			//04A6 	17F9
		INCR	75H,1 			//04A7 	09F5
		LDR 	73H,0 			//04A8 	0873
		LCALL 	4BCH 			//04A9 	34BC
		BTSS 	STATUS,2 		//04AA 	1D03
		LJUMP 	49CH 			//04AB 	3C9C
		ORG		04ACH
		LDR 	74H,0 			//04AC 	0874
		SUBWR 	76H,0 			//04AD 	0C76
		LJUMP 	49CH 			//04AE 	3C9C

		//;smartkey.C: 237: else return 0;
		//;smartkey.C: 239: else if(a<b){
		LDR 	79H,0 			//04AF 	0879
		XORWI 	80H 			//04B0 	2680
		STR 	74H 			//04B1 	01F4
		LDR 	72H,0 			//04B2 	0872
		XORWI 	80H 			//04B3 	2680
		ORG		04B4H
		SUBWR 	74H,1 			//04B4 	0CF4

		//;smartkey.C: 243: else if(a==b){
		LDR 	79H,0 			//04B5 	0879
		BTSS 	STATUS,0 		//04B6 	1C03
		LJUMP 	49FH 			//04B7 	3C9F
		XORWR 	72H,0 			//04B8 	0472
		BTSC 	STATUS,2 		//04B9 	1503
		RETW 	1H 			//04BA 	2101
		RETW 	0H 			//04BB 	2100
		ORG		04BCH
		STR 	76H 			//04BC 	01F6
		CLRR 	77H 			//04BD 	0177
		BTSC 	76H,7 			//04BE 	17F6
		DECR 	77H,1 			//04BF 	0DF7
		LDR 	77H,0 			//04C0 	0877
		XORWI 	80H 			//04C1 	2680
		STR 	78H 			//04C2 	01F8
		LDR 	75H,0 			//04C3 	0875
		ORG		04C4H
		XORWI 	80H 			//04C4 	2680
		SUBWR 	78H,0 			//04C5 	0C78
		RET		 					//04C6 	0004

		//;mpu6x.c: 24: else
		//;mpu6x.c: 25: return 1;
		//;mpu6x.c: 21: else
		//;mpu6x.c: 22: return 2;
		STR 	73H 			//04C7 	01F3
		CLRR 	74H 			//04C8 	0174

		//;SWI2C.C: 115: RA0 = 0;
		BCR 	STATUS,5 		//04C9 	1283
		BCR 	STATUS,6 		//04CA 	1303
		BCR 	5H,0 			//04CB 	1005
		ORG		04CCH

		//;SWI2C.C: 116: TRISA |=0x02;;
		BSR 	STATUS,5 		//04CC 	1A83
		BSR 	5H,1 			//04CD 	1885

		//;SWI2C.C: 117: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	4CFH 			//04CE 	3CCF
		LJUMP 	4D0H 			//04CF 	3CD0
		LJUMP 	4D1H 			//04D0 	3CD1
		LJUMP 	4D2H 			//04D1 	3CD2

		//;SWI2C.C: 118: for(i=0;i<8;i++)
		CLRR 	75H 			//04D2 	0175

		//;SWI2C.C: 119: {
		//;SWI2C.C: 120: RA0 = 1;
		BCR 	STATUS,5 		//04D3 	1283
		ORG		04D4H
		BCR 	STATUS,6 		//04D4 	1303
		BSR 	5H,0 			//04D5 	1805

		//;SWI2C.C: 121: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	4D7H 			//04D6 	3CD7
		LJUMP 	4D8H 			//04D7 	3CD8
		LJUMP 	4D9H 			//04D8 	3CD9
		LJUMP 	4DAH 			//04D9 	3CDA

		//;SWI2C.C: 122: dat = dat<<1 |(RA1 & 1 );
		LDWI 	0H 			//04DA 	2A00
		BCR 	STATUS,5 		//04DB 	1283
		ORG		04DCH
		BCR 	STATUS,6 		//04DC 	1303
		BTSC 	5H,1 			//04DD 	1485
		LDWI 	1H 			//04DE 	2A01
		ANDWI 	1H 			//04DF 	2401
		STR 	72H 			//04E0 	01F2
		BCR 	STATUS,0 		//04E1 	1003
		RLR 	74H,0 			//04E2 	0574
		IORWR 	72H,0 			//04E3 	0372
		ORG		04E4H
		STR 	74H 			//04E4 	01F4

		//;SWI2C.C: 125: RA0 = 0;
		BCR 	5H,0 			//04E5 	1005

		//;SWI2C.C: 126: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	4E7H 			//04E6 	3CE7
		LJUMP 	4E8H 			//04E7 	3CE8
		LJUMP 	4E9H 			//04E8 	3CE9
		LJUMP 	4EAH 			//04E9 	3CEA
		LDWI 	8H 			//04EA 	2A08
		INCR	75H,1 			//04EB 	09F5
		ORG		04ECH
		SUBWR 	75H,0 			//04EC 	0C75
		BTSS 	STATUS,0 		//04ED 	1C03
		LJUMP 	4D3H 			//04EE 	3CD3

		//;SWI2C.C: 127: }
		//;SWI2C.C: 129: TRISA &=0xfD;;
		BSR 	STATUS,5 		//04EF 	1A83
		BCR 	STATUS,6 		//04F0 	1303
		BCR 	5H,1 			//04F1 	1085

		//;SWI2C.C: 131: RA1 = (Ack) ? 0 : 1;
		LDR 	73H,1 			//04F2 	08F3
		BCR 	STATUS,5 		//04F3 	1283
		ORG		04F4H
		BCR 	STATUS,6 		//04F4 	1303
		BTSS 	STATUS,2 		//04F5 	1D03
		LJUMP 	4F9H 			//04F6 	3CF9
		BSR 	5H,1 			//04F7 	1885
		LJUMP 	4FAH 			//04F8 	3CFA
		BCR 	5H,1 			//04F9 	1085

		//;SWI2C.C: 132: RA0 = 1;
		BSR 	5H,0 			//04FA 	1805

		//;SWI2C.C: 133: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	4FCH 			//04FB 	3CFC
		ORG		04FCH
		LJUMP 	4FDH 			//04FC 	3CFD
		LJUMP 	4FEH 			//04FD 	3CFE
		LJUMP 	4FFH 			//04FE 	3CFF

		//;SWI2C.C: 134: RA0 = 0;
		BCR 	STATUS,5 		//04FF 	1283
		BCR 	STATUS,6 		//0500 	1303
		BCR 	5H,0 			//0501 	1005

		//;SWI2C.C: 135: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	503H 			//0502 	3D03
		LJUMP 	504H 			//0503 	3D04
		ORG		0504H
		LJUMP 	505H 			//0504 	3D05
		LJUMP 	506H 			//0505 	3D06

		//;SWI2C.C: 136: return dat;
		LDR 	74H,0 			//0506 	0874
		RET		 					//0507 	0004
		STR 	23H 			//0508 	01A3

		//;mpu6x.c: 32: unsigned char i;
		//;mpu6x.c: 34: swI2C_Start();
		LCALL 	618H 			//0509 	3618

		//;mpu6x.c: 36: if(swI2C_WriteByte(0x68<<1)== 0 )
		LDWI 	D0H 			//050A 	2AD0
		LCALL 	547H 			//050B 	3547
		ORG		050CH
		IORWI 	0H 			//050C 	2500
		BTSS 	STATUS,2 		//050D 	1D03
		RETW 	1H 			//050E 	2101

		//;mpu6x.c: 37: {
		//;mpu6x.c: 38: if(swI2C_WriteByte(rAdd)==0 )
		BCR 	STATUS,5 		//050F 	1283
		LDR 	23H,0 			//0510 	0823
		LCALL 	547H 			//0511 	3547
		IORWI 	0H 			//0512 	2500
		BTSS 	STATUS,2 		//0513 	1D03
		ORG		0514H
		RETW 	2H 			//0514 	2102

		//;mpu6x.c: 39: {
		//;mpu6x.c: 40: swI2C_Start();
		LCALL 	618H 			//0515 	3618

		//;mpu6x.c: 41: if(swI2C_WriteByte((0x68<<1)|1)== 0 ){
		LDWI 	D1H 			//0516 	2AD1
		LCALL 	547H 			//0517 	3547
		IORWI 	0H 			//0518 	2500
		BTSS 	STATUS,2 		//0519 	1D03
		RETW 	1H 			//051A 	2101

		//;mpu6x.c: 43: for(i=0; i<(len-1);i++){
		BCR 	STATUS,5 		//051B 	1283
		ORG		051CH
		CLRR 	24H 			//051C 	0124
		LDR 	78H,0 			//051D 	0878
		ADDWI 	FFH 			//051E 	27FF
		STR 	20H 			//051F 	01A0
		LDWI 	FFH 			//0520 	2AFF
		BTSC 	STATUS,0 		//0521 	1403
		LDWI 	0H 			//0522 	2A00
		STR 	21H 			//0523 	01A1
		ORG		0524H
		XORWI 	80H 			//0524 	2680
		SUBWI 	80H 			//0525 	2880
		BTSS 	STATUS,2 		//0526 	1D03
		LJUMP 	52AH 			//0527 	3D2A
		LDR 	20H,0 			//0528 	0820
		SUBWR 	24H,0 			//0529 	0C24

		//;mpu6x.c: 44: dat[i]=swI2C_ReadByte(1);
		LDWI 	1H 			//052A 	2A01
		BTSC 	STATUS,0 		//052B 	1403
		ORG		052CH
		LJUMP 	531H 			//052C 	3D31
		LCALL 	4C7H 			//052D 	34C7
		LCALL 	535H 			//052E 	3535
		INCR	24H,1 			//052F 	09A4
		LJUMP 	51DH 			//0530 	3D1D

		//;mpu6x.c: 45: }
		//;mpu6x.c: 46: dat[i]=swI2C_ReadByte(1);
		LCALL 	4C7H 			//0531 	34C7
		LCALL 	535H 			//0532 	3535

		//;mpu6x.c: 47: swI2C_Stop();
		LCALL 	650H 			//0533 	3650
		ORG		0534H

		//;mpu6x.c: 48: return 0;
		RETW 	0H 			//0534 	2100

		//;mpu6x.c: 54: else
		//;mpu6x.c: 55: return 2;
		//;mpu6x.c: 51: else
		//;mpu6x.c: 52: return 1;
		BCR 	STATUS,5 		//0535 	1283
		BCR 	STATUS,6 		//0536 	1303
		STR 	20H 			//0537 	01A0
		LDR 	24H,0 			//0538 	0824
		ADDWR 	76H,0 			//0539 	0B76
		STR 	21H 			//053A 	01A1
		LDR 	77H,0 			//053B 	0877
		ORG		053CH
		BTSC 	STATUS,0 		//053C 	1403
		ADDWI 	1H 			//053D 	2701
		STR 	22H 			//053E 	01A2
		LDR 	21H,0 			//053F 	0821
		STR 	FSR 			//0540 	0184
		BCR 	STATUS,7 		//0541 	1383
		BTSC 	22H,0 			//0542 	1422
		BSR 	STATUS,7 		//0543 	1B83
		ORG		0544H
		LDR 	20H,0 			//0544 	0820
		STR 	INDF 			//0545 	0180
		RET		 					//0546 	0004
		STR 	73H 			//0547 	01F3

		//;SWI2C.C: 89: TRISA &=0xfD;;
		BSR 	STATUS,5 		//0548 	1A83
		BCR 	STATUS,6 		//0549 	1303
		BCR 	5H,1 			//054A 	1085

		//;SWI2C.C: 90: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	54CH 			//054B 	3D4C
		ORG		054CH
		LJUMP 	54DH 			//054C 	3D4D
		LJUMP 	54EH 			//054D 	3D4E
		LJUMP 	54FH 			//054E 	3D4F

		//;SWI2C.C: 91: for(i=0;i<8;i++)
		CLRR 	74H 			//054F 	0174

		//;SWI2C.C: 92: {
		//;SWI2C.C: 93: RA1 = (dat&0x80) ? 1:0;
		BTSS 	73H,7 			//0550 	1FF3
		LJUMP 	556H 			//0551 	3D56
		BCR 	STATUS,5 		//0552 	1283
		BCR 	STATUS,6 		//0553 	1303
		ORG		0554H
		BSR 	5H,1 			//0554 	1885
		LJUMP 	559H 			//0555 	3D59
		BCR 	STATUS,5 		//0556 	1283
		BCR 	STATUS,6 		//0557 	1303
		BCR 	5H,1 			//0558 	1085

		//;SWI2C.C: 94: dat<<=1;
		BCR 	STATUS,0 		//0559 	1003
		RLR 	73H,1 			//055A 	05F3

		//;SWI2C.C: 95: RA0 = 1;
		BSR 	5H,0 			//055B 	1805
		ORG		055CH

		//;SWI2C.C: 96: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	55DH 			//055C 	3D5D
		LJUMP 	55EH 			//055D 	3D5E
		LJUMP 	55FH 			//055E 	3D5F
		LJUMP 	560H 			//055F 	3D60

		//;SWI2C.C: 97: RA0 = 0;
		BCR 	STATUS,5 		//0560 	1283
		BCR 	STATUS,6 		//0561 	1303
		BCR 	5H,0 			//0562 	1005

		//;SWI2C.C: 98: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	564H 			//0563 	3D64
		ORG		0564H
		LJUMP 	565H 			//0564 	3D65
		LJUMP 	566H 			//0565 	3D66
		LJUMP 	567H 			//0566 	3D67
		LDWI 	8H 			//0567 	2A08
		INCR	74H,1 			//0568 	09F4
		SUBWR 	74H,0 			//0569 	0C74
		BTSS 	STATUS,0 		//056A 	1C03
		LJUMP 	550H 			//056B 	3D50
		ORG		056CH

		//;SWI2C.C: 99: }
		//;SWI2C.C: 101: TRISA |=0x02;;
		BSR 	STATUS,5 		//056C 	1A83
		BCR 	STATUS,6 		//056D 	1303
		BSR 	5H,1 			//056E 	1885

		//;SWI2C.C: 102: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	570H 			//056F 	3D70
		LJUMP 	571H 			//0570 	3D71
		LJUMP 	572H 			//0571 	3D72
		LJUMP 	573H 			//0572 	3D73

		//;SWI2C.C: 103: RA0 = 1;
		BCR 	STATUS,5 		//0573 	1283
		ORG		0574H
		BCR 	STATUS,6 		//0574 	1303
		BSR 	5H,0 			//0575 	1805

		//;SWI2C.C: 104: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	577H 			//0576 	3D77
		LJUMP 	578H 			//0577 	3D78
		LJUMP 	579H 			//0578 	3D79
		LJUMP 	57AH 			//0579 	3D7A

		//;SWI2C.C: 105: i= RA1;
		LDWI 	0H 			//057A 	2A00
		BCR 	STATUS,5 		//057B 	1283
		ORG		057CH
		BCR 	STATUS,6 		//057C 	1303
		BTSC 	5H,1 			//057D 	1485
		LDWI 	1H 			//057E 	2A01
		STR 	74H 			//057F 	01F4

		//;SWI2C.C: 106: RA0 = 0;
		BCR 	5H,0 			//0580 	1005

		//;SWI2C.C: 107: TRISA &=0xfD;;
		BSR 	STATUS,5 		//0581 	1A83
		BCR 	5H,1 			//0582 	1085

		//;SWI2C.C: 108: return i;
		LDR 	74H,0 			//0583 	0874
		ORG		0584H
		RET		 					//0584 	0004
		STR 	20H 			//0585 	01A0

		//;mpu6x.c: 5: unsigned char i;
		//;mpu6x.c: 6: swI2C_Start();
		LCALL 	618H 			//0586 	3618

		//;mpu6x.c: 8: if(swI2C_WriteByte(0x68<<1)== 0 )
		LDWI 	D0H 			//0587 	2AD0
		LCALL 	547H 			//0588 	3547
		IORWI 	0H 			//0589 	2500
		BTSS 	STATUS,2 		//058A 	1D03
		RETW 	1H 			//058B 	2101
		ORG		058CH

		//;mpu6x.c: 9: {
		//;mpu6x.c: 10: if(swI2C_WriteByte(rAdd)==0 )
		BCR 	STATUS,5 		//058C 	1283
		LDR 	20H,0 			//058D 	0820
		LCALL 	547H 			//058E 	3547
		IORWI 	0H 			//058F 	2500
		BTSS 	STATUS,2 		//0590 	1D03
		RETW 	2H 			//0591 	2102

		//;mpu6x.c: 11: {
		//;mpu6x.c: 12: for(i=0; i<len;i++){
		BCR 	STATUS,5 		//0592 	1283
		CLRR 	21H 			//0593 	0121
		ORG		0594H
		LDR 	77H,0 			//0594 	0877
		SUBWR 	21H,0 			//0595 	0C21
		BTSC 	STATUS,0 		//0596 	1403
		LJUMP 	5AEH 			//0597 	3DAE

		//;mpu6x.c: 13: if(swI2C_WriteByte(dat[i])==1 ){
		LDR 	21H,0 			//0598 	0821
		ADDWR 	75H,0 			//0599 	0B75
		STR 	78H 			//059A 	01F8
		LDR 	76H,0 			//059B 	0876
		ORG		059CH
		BTSC 	STATUS,0 		//059C 	1403
		ADDWI 	1H 			//059D 	2701
		STR 	79H 			//059E 	01F9
		LDR 	78H,0 			//059F 	0878
		STR 	FSR 			//05A0 	0184
		BSR 	STATUS,7 		//05A1 	1B83
		BTSS 	79H,0 			//05A2 	1C79
		BCR 	STATUS,7 		//05A3 	1383
		ORG		05A4H
		LDR 	INDF,0 			//05A4 	0800
		LCALL 	547H 			//05A5 	3547
		XORWI 	1H 			//05A6 	2601
		BTSS 	STATUS,2 		//05A7 	1D03
		LJUMP 	5ABH 			//05A8 	3DAB

		//;mpu6x.c: 14: swI2C_Stop();
		LCALL 	650H 			//05A9 	3650

		//;mpu6x.c: 15: return 3;
		RETW 	3H 			//05AA 	2103
		BCR 	STATUS,5 		//05AB 	1283
		ORG		05ACH
		INCR	21H,1 			//05AC 	09A1
		LJUMP 	594H 			//05AD 	3D94

		//;mpu6x.c: 16: }
		//;mpu6x.c: 17: }
		//;mpu6x.c: 18: swI2C_Stop();
		LCALL 	650H 			//05AE 	3650

		//;mpu6x.c: 19: return 0;
		RETW 	0H 			//05AF 	2100

		//;SWI2C.C: 10: TRISA &=0xfD;;
		BSR 	STATUS,5 		//05B0 	1A83
		BCR 	5H,1 			//05B1 	1085

		//;SWI2C.C: 11: TRISA &=0xfe;;
		BCR 	5H,0 			//05B2 	1005

		//;SWI2C.C: 12: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	5B4H 			//05B3 	3DB4
		ORG		05B4H
		LJUMP 	5B5H 			//05B4 	3DB5
		LJUMP 	5B6H 			//05B5 	3DB6
		LJUMP 	5B7H 			//05B6 	3DB7

		//;SWI2C.C: 13: RA0 = 1;
		BCR 	STATUS,5 		//05B7 	1283
		BCR 	STATUS,6 		//05B8 	1303
		BSR 	5H,0 			//05B9 	1805

		//;SWI2C.C: 14: RA1 = 1;
		BSR 	5H,1 			//05BA 	1885

		//;SWI2C.C: 15: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	5BCH 			//05BB 	3DBC
		ORG		05BCH
		LJUMP 	5BDH 			//05BC 	3DBD
		LJUMP 	5BEH 			//05BD 	3DBE
		LJUMP 	5BFH 			//05BE 	3DBF

		//;SWI2C.C: 16: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	5C0H 			//05BF 	3DC0
		LJUMP 	5C1H 			//05C0 	3DC1
		LJUMP 	5C2H 			//05C1 	3DC2
		LJUMP 	5C3H 			//05C2 	3DC3

		//;SWI2C.C: 17: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	5C4H 			//05C3 	3DC4
		ORG		05C4H
		LJUMP 	5C5H 			//05C4 	3DC5
		LJUMP 	5C6H 			//05C5 	3DC6
		LJUMP 	5C7H 			//05C6 	3DC7

		//;SWI2C.C: 18: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	5C8H 			//05C7 	3DC8
		LJUMP 	5C9H 			//05C8 	3DC9
		LJUMP 	5CAH 			//05C9 	3DCA
		LJUMP 	5CBH 			//05CA 	3DCB
		RET		 					//05CB 	0004
		ORG		05CCH

		//;sysinit.c: 72: INTCON = 0B00000000;
		CLRR 	INTCON 			//05CC 	010B

		//;sysinit.c: 73: PIE1 = 0B00000000;
		CLRR 	CH 			//05CD 	010C

		//;sysinit.c: 74: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//05CE 	1283
		CLRR 	CH 			//05CF 	010C

		//;sysinit.c: 76: IOCA6 = 1;
		BSR 	STATUS,5 		//05D0 	1A83
		BSR 	16H,6 			//05D1 	1B16

		//;sysinit.c: 77: tmp = PORTA;
		BCR 	STATUS,5 		//05D2 	1283
		LDR 	5H,0 			//05D3 	0805
		ORG		05D4H

		//;sysinit.c: 78: PAIF = 0;
		BCR 	INTCON,0 		//05D4 	100B

		//;sysinit.c: 79: PAIE = 0;
		BCR 	INTCON,3 		//05D5 	118B

		//;sysinit.c: 82: INTEDG = 0;
		BSR 	STATUS,5 		//05D6 	1A83
		BCR 	1H,6 			//05D7 	1301

		//;sysinit.c: 83: INTF = 0;
		BCR 	INTCON,1 		//05D8 	108B

		//;sysinit.c: 84: INTE = 0;
		BCR 	INTCON,4 		//05D9 	120B

		//;sysinit.c: 86: TMR2IF = 0;
		BCR 	STATUS,5 		//05DA 	1283
		BCR 	CH,1 			//05DB 	108C
		ORG		05DCH

		//;sysinit.c: 87: TMR2IE = 1;
		BSR 	STATUS,5 		//05DC 	1A83
		BSR 	CH,1 			//05DD 	188C

		//;sysinit.c: 88: TMR2ON = 0;
		BCR 	STATUS,5 		//05DE 	1283
		BCR 	12H,2 			//05DF 	1112

		//;sysinit.c: 90: TMR1IF = 0;
		BCR 	CH,0 			//05E0 	100C

		//;sysinit.c: 91: TMR1IE = 1;
		BSR 	STATUS,5 		//05E1 	1A83
		BSR 	CH,0 			//05E2 	180C

		//;sysinit.c: 94: PEIE = 1;
		BSR 	INTCON,6 		//05E3 	1B0B
		ORG		05E4H

		//;sysinit.c: 96: GIE = 1;
		BSR 	INTCON,7 		//05E4 	1B8B
		RET		 					//05E5 	0004
		STR 	73H 			//05E6 	01F3

		//;smartkey.C: 213: GIE = 0;
		BCR 	INTCON,7 		//05E7 	138B

		//;smartkey.C: 214: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//05E8 	1F8B
		LJUMP 	5ECH 			//05E9 	3DEC
		CLRWDT	 			//05EA 	0001
		LJUMP 	5E8H 			//05EB 	3DE8
		ORG		05ECH

		//;smartkey.C: 215: EEADR = EEAddr;
		LDR 	73H,0 			//05EC 	0873
		BSR 	STATUS,5 		//05ED 	1A83
		BCR 	STATUS,6 		//05EE 	1303
		STR 	1BH 			//05EF 	019B

		//;smartkey.C: 216: EEDAT = EEData;
		LDR 	72H,0 			//05F0 	0872
		STR 	1AH 			//05F1 	019A
		LDWI 	34H 			//05F2 	2A34

		//;smartkey.C: 217: EEIF = 0;
		BCR 	STATUS,5 		//05F3 	1283
		ORG		05F4H
		BCR 	CH,7 			//05F4 	138C

		//;smartkey.C: 218: EECON1 = 0x34;
		BSR 	STATUS,5 		//05F5 	1A83
		STR 	1CH 			//05F6 	019C

		//;smartkey.C: 219: WR = 1;
		BSR 	1DH,0 			//05F7 	181D

		//;smartkey.C: 220: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//05F8 	1A83
		BCR 	STATUS,6 		//05F9 	1303
		BTSS 	1DH,0 			//05FA 	1C1D
		LJUMP 	5FEH 			//05FB 	3DFE
		ORG		05FCH
		CLRWDT	 			//05FC 	0001
		LJUMP 	5F8H 			//05FD 	3DF8

		//;smartkey.C: 222: GIE = 1;
		BSR 	INTCON,7 		//05FE 	1B8B
		RET		 					//05FF 	0004
		STR 	77H 			//0600 	01F7

		//;smartkey.C: 185: {
		//;smartkey.C: 187: while(rep--){
		DECR 	76H,1 			//0601 	0DF6
		LDR 	76H,0 			//0602 	0876
		XORWI 	FFH 			//0603 	26FF
		ORG		0604H
		BTSC 	STATUS,2 		//0604 	1503
		RET		 					//0605 	0004
		LDWI 	CH 			//0606 	2A0C

		//;smartkey.C: 188: TMR2ON = 1;
		BCR 	STATUS,5 		//0607 	1283
		BCR 	STATUS,6 		//0608 	1303
		BSR 	12H,2 			//0609 	1912

		//;smartkey.C: 189: PR2 = 12;
		BSR 	STATUS,5 		//060A 	1A83
		STR 	12H 			//060B 	0192
		ORG		060CH

		//;smartkey.C: 190: delay_x10ms(delay);
		LDR 	77H,0 			//060C 	0877
		STR 	72H 			//060D 	01F2
		CLRR 	73H 			//060E 	0173
		LCALL 	62EH 			//060F 	362E
		LDWI 	14H 			//0610 	2A14

		//;smartkey.C: 191: TMR2ON = 0;RA4 =0;
		BCR 	STATUS,5 		//0611 	1283
		BCR 	12H,2 			//0612 	1112
		BCR 	5H,4 			//0613 	1205
		ORG		0614H

		//;smartkey.C: 192: delay_x10ms(20);
		STR 	72H 			//0614 	01F2
		CLRR 	73H 			//0615 	0173
		LCALL 	62EH 			//0616 	362E
		LJUMP 	601H 			//0617 	3E01

		//;SWI2C.C: 24: RA0 = 1;
		BCR 	STATUS,5 		//0618 	1283
		BSR 	5H,0 			//0619 	1805

		//;SWI2C.C: 26: RA1 = 1;
		BSR 	5H,1 			//061A 	1885

		//;SWI2C.C: 27: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	61CH 			//061B 	3E1C
		ORG		061CH
		LJUMP 	61DH 			//061C 	3E1D
		LJUMP 	61EH 			//061D 	3E1E
		LJUMP 	61FH 			//061E 	3E1F

		//;SWI2C.C: 28: RA1 = 0;
		BCR 	STATUS,5 		//061F 	1283
		BCR 	STATUS,6 		//0620 	1303
		BCR 	5H,1 			//0621 	1085

		//;SWI2C.C: 29: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	623H 			//0622 	3E23
		LJUMP 	624H 			//0623 	3E24
		ORG		0624H
		LJUMP 	625H 			//0624 	3E25
		LJUMP 	626H 			//0625 	3E26

		//;SWI2C.C: 30: RA0 = 0;
		BCR 	STATUS,5 		//0626 	1283
		BCR 	STATUS,6 		//0627 	1303
		BCR 	5H,0 			//0628 	1005

		//;SWI2C.C: 31: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	62AH 			//0629 	3E2A
		LJUMP 	62BH 			//062A 	3E2B
		LJUMP 	62CH 			//062B 	3E2C
		ORG		062CH
		LJUMP 	62DH 			//062C 	3E2D
		RET		 					//062D 	0004

		//;smartkey.C: 171: unsigned int set = t + timeTick;
		LDR 	73H,0 			//062E 	0873
		STR 	75H 			//062F 	01F5
		LDR 	72H,0 			//0630 	0872
		STR 	74H 			//0631 	01F4
		LDR 	7AH,0 			//0632 	087A
		ADDWR 	74H,1 			//0633 	0BF4
		ORG		0634H
		BTSC 	STATUS,0 		//0634 	1403
		INCR	75H,1 			//0635 	09F5
		LDR 	7BH,0 			//0636 	087B
		ADDWR 	75H,1 			//0637 	0BF5

		//;smartkey.C: 172: while(timeTick < set);
		LDR 	75H,0 			//0638 	0875
		SUBWR 	7BH,0 			//0639 	0C7B
		BTSS 	STATUS,2 		//063A 	1D03
		LJUMP 	63EH 			//063B 	3E3E
		ORG		063CH
		LDR 	74H,0 			//063C 	0874
		SUBWR 	7AH,0 			//063D 	0C7A
		BTSC 	STATUS,0 		//063E 	1403
		RET		 					//063F 	0004
		LJUMP 	638H 			//0640 	3E38
		CLRR 	7AH 			//0641 	017A
		CLRR 	7BH 			//0642 	017B
		CLRR 	3EH 			//0643 	013E
		ORG		0644H
		CLRR 	3FH 			//0644 	013F
		CLRR 	40H 			//0645 	0140
		CLRR 	41H 			//0646 	0141
		CLRR 	42H 			//0647 	0142
		CLRR 	43H 			//0648 	0143
		CLRR 	44H 			//0649 	0144
		CLRR 	45H 			//064A 	0145
		CLRR 	46H 			//064B 	0146
		ORG		064CH
		CLRR 	47H 			//064C 	0147
		CLRR 	48H 			//064D 	0148
		CLRR 	STATUS 			//064E 	0103
		LJUMP 	0BH 			//064F 	380B

		//;SWI2C.C: 37: RA1 = 0;
		BCR 	STATUS,5 		//0650 	1283
		BCR 	5H,1 			//0651 	1085

		//;SWI2C.C: 38: RA0 = 1;
		BSR 	5H,0 			//0652 	1805

		//;SWI2C.C: 39: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	654H 			//0653 	3E54
		ORG		0654H
		LJUMP 	655H 			//0654 	3E55
		LJUMP 	656H 			//0655 	3E56
		LJUMP 	657H 			//0656 	3E57

		//;SWI2C.C: 40: RA1 = 1;
		BCR 	STATUS,5 		//0657 	1283
		BCR 	STATUS,6 		//0658 	1303
		BSR 	5H,1 			//0659 	1885

		//;SWI2C.C: 41: _delay((unsigned long)((8)*(4000000/4000000.0)));;
		LJUMP 	65BH 			//065A 	3E5B
		LJUMP 	65CH 			//065B 	3E5C
		ORG		065CH
		LJUMP 	65DH 			//065C 	3E5D
		LJUMP 	65EH 			//065D 	3E5E
		RET		 					//065E 	0004

		//;sysinit.c: 55: TMR2 = 0;
		BCR 	STATUS,5 		//065F 	1283
		CLRR 	11H 			//0660 	0111

		//;sysinit.c: 56: PR2 = 0;
		BSR 	STATUS,5 		//0661 	1A83
		CLRR 	12H 			//0662 	0112

		//;sysinit.c: 57: T2CON = 0B00101001;
		LDWI 	29H 			//0663 	2A29
		ORG		0664H
		BCR 	STATUS,5 		//0664 	1283
		STR 	12H 			//0665 	0192

		//;sysinit.c: 60: TMR1H = -5000>>8;
		LDWI 	ECH 			//0666 	2AEC
		STR 	FH 			//0667 	018F

		//;sysinit.c: 61: TMR1L = -5000;
		LDWI 	78H 			//0668 	2A78
		STR 	EH 			//0669 	018E

		//;sysinit.c: 62: T1CON = 0B00100001;
		LDWI 	21H 			//066A 	2A21
		STR 	10H 			//066B 	0190
		ORG		066CH

		//;sysinit.c: 63: TMR1ON = 1;
		BSR 	10H,0 			//066C 	1810
		RET		 					//066D 	0004

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//066E 	1283
		CLRR 	5H 			//066F 	0105

		//;sysinit.c: 35: TRISA = 0B01101110;
		LDWI 	6EH 			//0670 	2A6E
		BSR 	STATUS,5 		//0671 	1A83
		STR 	5H 			//0672 	0185

		//;sysinit.c: 36: WPUA = 0B10000000;
		LDWI 	80H 			//0673 	2A80
		ORG		0674H
		STR 	15H 			//0674 	0195

		//;sysinit.c: 38: PORTC = 0B00000000;
		BCR 	STATUS,5 		//0675 	1283
		CLRR 	7H 			//0676 	0107

		//;sysinit.c: 39: TRISC = 0B11101011;
		LDWI 	EBH 			//0677 	2AEB
		BSR 	STATUS,5 		//0678 	1A83
		STR 	7H 			//0679 	0187

		//;sysinit.c: 40: WPUC = 0B00000000;
		CLRR 	8H 			//067A 	0108
		RET		 					//067B 	0004
		ORG		067CH
		STR 	74H 			//067C 	01F4

		//;smartkey.C: 228: mtOldState = mtState;
		BCR 	STATUS,5 		//067D 	1283
		BCR 	STATUS,6 		//067E 	1303
		LDR 	48H,0 			//067F 	0848
		STR 	47H 			//0680 	01C7

		//;smartkey.C: 229: mtState = stt;
		LDR 	74H,0 			//0681 	0874
		STR 	48H 			//0682 	01C8

		//;smartkey.C: 230: timeTick =0;
		CLRR 	7AH 			//0683 	017A
		ORG		0684H
		CLRR 	7BH 			//0684 	017B

		//;smartkey.C: 231: timeOut = _tOut;
		LDR 	73H,0 			//0685 	0873
		STR 	41H 			//0686 	01C1
		LDR 	72H,0 			//0687 	0872
		STR 	40H 			//0688 	01C0
		RET		 					//0689 	0004

		//;sysinit.c: 21: OSCCON = 0B01010001;
		LDWI 	51H 			//068A 	2A51
		BSR 	STATUS,5 		//068B 	1A83
		ORG		068CH
		BCR 	STATUS,6 		//068C 	1303
		STR 	FH 			//068D 	018F

		//;sysinit.c: 22: _nop();
		NOP		 					//068E 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//068F 	1A83
		BCR 	STATUS,6 		//0690 	1303
		BTSC 	FH,2 			//0691 	150F
		RET		 					//0692 	0004
		LJUMP 	68FH 			//0693 	3E8F
		ORG		0694H
		STR 	72H 			//0694 	01F2

		//;smartkey.C: 202: unsigned char ReEepromData;
		//;smartkey.C: 204: EEADR = EEAddr;
		BSR 	STATUS,5 		//0695 	1A83
		BCR 	STATUS,6 		//0696 	1303
		STR 	1BH 			//0697 	019B

		//;smartkey.C: 205: RD = 1;
		BSR 	1CH,0 			//0698 	181C

		//;smartkey.C: 206: ReEepromData = EEDAT;
		LDR 	1AH,0 			//0699 	081A
		STR 	73H 			//069A 	01F3

		//;smartkey.C: 207: RD = 0;
		BCR 	1CH,0 			//069B 	101C
		ORG		069CH

		//;smartkey.C: 208: return ReEepromData;
		RET		 					//069C 	0004
		LJUMP 	242H 			//069D 	3A42
		LJUMP 	182H 			//069E 	3982
		LJUMP 	189H 			//069F 	3989
		LJUMP 	1CBH 			//06A0 	39CB
		LJUMP 	1ECH 			//06A1 	39EC

		//;smartkey.C: 179: TMR2ON = 1;
		BCR 	STATUS,5 		//06A2 	1283
		BSR 	12H,2 			//06A3 	1912
		ORG		06A4H

		//;smartkey.C: 180: TRISA &= 0xef;
		BSR 	STATUS,5 		//06A4 	1A83
		BCR 	5H,4 			//06A5 	1205
		RET		 					//06A6 	0004

		//;smartkey.C: 176: TMR2ON = 0;RA4 =0;TRISA |= 0x10;
		BCR 	12H,2 			//06A7 	1112
		BCR 	5H,4 			//06A8 	1205
		BSR 	STATUS,5 		//06A9 	1A83
		BSR 	5H,4 			//06AA 	1A05
		RET		 					//06AB 	0004
			END

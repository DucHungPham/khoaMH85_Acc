#include 	"main.h";
#include 	"sysInit.H"

#define voice1	20
#define voice2	25

#define Status			RegStatus.byte
#define reAlertOn 		RegStatus.bits.b7
#define accEna 		RegStatus.bits.b6
#define vibrateOn 	RegStatus.bits.b5
#define antenSkip 	RegStatus.bits.b4
#define mode_chek 	RegStatus.bits.b3
#define keyfob 			RegStatus.bits.b2
#define keyUpd 		RegStatus.bits.b1
#define bitPwOn		RegStatus.bits.b0

unsigned char cntCyc = 0, cntOff = 0; //
unsigned int timeOut = 0, timeTick = 0, cntTmp = 0;
unsigned char  mtState = _Ide, mtOldState = _Ide; // che do trong qua trinh hoat dong cua xe

volatile regType RegStatus;

unsigned char READ_EEPROM(unsigned char EEAddr);
void WRITE_EEPROM(unsigned char EEAddr, unsigned char EEData);
//===========================================================
//Variable definition
//===========================================================

/*
V1: Ðo mu'c 16ms < H < 80ms  và L > 130ms - trong truong hop khong co nhieu(N)
Phat hien suon len trong trang thai nghi-> start-> do muc H
Doi suon xuong, do muc L
V2: Ðo độ rộng mức L kết hợp với suon len dau tien


T + N_____||||||__________________
	      ______
T    _____|	   |__________________

F + N_____||||||_____||||||_____||||||_____||||||__________________
	      ______ 	 ______     ______     ______
F    _____|	   |_____|     |____|    |_____|    |__________

*/

void interrupt ISR(void) {
	unsigned char tmp = 0;
//=============
//PortA Interrup --> keyfob detect
	if (PAIE && PAIF) {
		tmp = PORTA;		//
		PAIF = 0;          //clear flag
		//righting egde
		if (keyDetect) {
			if (mode_chek == md_ckIDE) {
				cntCyc = 0;
				cntOff = 0;
				//TMR2IE = 0;
				mode_chek = md_ckStart;
			}
		} 
		else {//falling edge
			cntOff = 0;
		}
	}
//====================
	if (INTE && INTF) {
		INTF = 0;
		if ( swPwOn == 0) { //(keyUpd)==0 && mtState ==_Ide &&
			if (timeTick < 32) { // < 32*10ms
				tmp = READ_EEPROM(_adCt);
				WRITE_EEPROM(_adCt, tmp + 1);
			}
			while (swPwOn == 0); // doi tu xa  - or while(1)?
		}
	}
//====================
//Timer0 Interrup
	if (T0IE && T0IF) {
		T0IF = 0;
		TMR0 = 179;

		// time out 10ms
		// 'Verify' : 20ms <'0'< 50ms -> 'F' -> 'Busy' -> 'IDE'
		// 'Verify' : '0' > 50ms -> 'T' -> 'IDE'

		if ( mode_chek == md_ckStart) {
			//count cycle time(inlude noise)
			cntCyc++;
			if (keyDetect == 0) {
				//cout dead time
				cntOff++;
				//time out
				if (cntOff > 15) { //110
					//TMR2IE = 1;
					mode_chek = md_ckIDE;
					//90 - 500ms
					if ((cntCyc > 15) && (cntCyc < 50)) { //2-> 16=>15
						keyfob =1;
					} else if (cntCyc >= 50) {
						keyfob =0;
					}
					keyUpd = 1;
				}
			}
		}
		//
		timeTick++;

		if ((mtState == _rAlert) || (mtState == _Alert)) {
			if (timeTick > cntTmp) {
				cntTmp = timeTick + 38;
				if (cntTmp <= timeOut)
				{
					TMR2IE = 0;
					if (PR2L == voice1)
						PR2L = voice2;//30 35
					else
						PR2L = voice1;//11 30
					TMR2IE = 1;
				}
			}
		}
	}
//====================
// Timer2 ->> buzzer
	if (TMR2IE && TMR2IF)
	{
		TMR2IF = 0;
		buzzer = ~ buzzer;			//
	}
}

void delay_x10ms(unsigned int t) {
	unsigned int set = t + timeTick;
	while (timeTick < set);
}

void beepOff() {
	TMR2ON = 0; buzzer = 0; TRISA |= 0x08;
}
void beepOn() {
	TMR2ON = 1;
	TRISA &= 0xf7;
}
void beep(unsigned char delay, unsigned char rep) {
	{
		while (rep--) {
			TMR2ON = 1;
			PR2L = 12; //12
			delay_x10ms(delay);
			//__delay_ms(400);
			TMR2ON = 0; buzzer = 0;
			delay_x10ms(20);
			//__delay_ms(400);
		}
	}

}
/*====================================================*/
unsigned char READ_EEPROM(unsigned char EEAddr)
{
	unsigned char ReEepromData;
	EEADR = EEAddr;
	RD = 1;
	ReEepromData = EEDAT;
	RD = 0;
	return ReEepromData;
}

void WRITE_EEPROM(unsigned char EEAddr, unsigned char EEData)
{
	GIE = 0;
	while (GIE) CLRWDT();
	EEADR = EEAddr;
	EEDAT = EEData;
	EEIF = 0;
	EECON1 = 0x34;
	WR = 1;
	while (WR) CLRWDT();
	GIE = 1;
}
/*====================================================*/
void setState(unsigned char stt, unsigned int _tOut) {
	mtOldState = mtState;
	mtState = stt;
	timeTick = 0;
	timeOut = _tOut;
}
unsigned char compe(signed char a, signed char b, unsigned char dt) {

	if (a > b) {
		if ((a - b) <= dt) return 1;
		else return 0;
	}
	else if (a < b) {
		if ((b - a) <= dt) return 1;
		else return 0;
	}
	else if (a == b) {
		return 1;
	}
	return 0;
}

void main(void) {

	unsigned char  tmp8, isSw = 0, isFall = 0, lostDetect = 0;
	unsigned int isWait = 0;
	signed int  acYsum = 0, acXsum = 0;
	unsigned int tmp16 = 0;
	signed char acYOld, acXOld;
	unsigned char buf[6];
    
	Status =0x00;
	accEna = 1;

	CLRWDT();

	sys_init();
	gpio_init();
	timer_init();
	int_init();


	__delay_ms(100);

	PAIE = 1;

	swI2C_Init();

	setState(_Ide, 0);
//=================
	WRITE_EEPROM(0xFF, 0xAA);			//
	WRITE_EEPROM(0xFF, 0xAA);			//
//=================
	__delay_ms(100);


	tmp8 = READ_EEPROM(_adsSk);
	if (tmp8 > 3) {WRITE_EEPROM(_adsSk, 0); __delay_ms(2);}

//timeTick = 0;
//kiem tra trang thai canh bao khi bat nguon
	tmp8 = READ_EEPROM(add_Alert);
	if (tmp8 == 0xff) {WRITE_EEPROM(add_Alert, 0); __delay_ms(2);}
	if (tmp8 == 0xcc) {		//
		bitPwOn = 0;
		setState(_Alert, tOut_Alert);
		mtOldState = _Open;
		cntTmp = timeTick + 50;
		PR2L = 12;
		beepOn();
	} else {
		setState(_rCheck, 400); // timout 4s cho thoi gian mo may, check tin hieu chia
		mtOldState = _Ide;
	}


//BMA250 config

	buf[0] = 0x08;
	if ((AccWrite(0x10,buf, 1) == 0)) {// (unsigned char)
		//accEna =1;
	}
	else {
		//accEna =0;
		beep(10, 2); // bao loi giao tiep mpu
	}
    

// vao che do cai 
	tmp8 = READ_EEPROM(_adCt);
	if (tmp8 == _Set) {
		tmp8 = 0;
		WRITE_EEPROM(_adCt, 0);
		while ( swPwOn) {
			__delay_ms(1500);
			tmp8++;
			if (tmp8 > 20) {
				__delay_ms(10000);
				WRITE_EEPROM(_adMd, 0);
			}
			else if ( swPwOn) {
				WRITE_EEPROM(_adMd, tmp8);
				beep(10, 1);
			}
		}
		while (swPwOn == 0) {}; // doi tu xa
	}

//kiem tra gia tri nhap vao
	tmp8 = READ_EEPROM(_adMd);
	switch (tmp8) {
	// Vao cai dat che do luu goc nghieng
	case _sAcc:
		tmp8 = 0; beep(10, 3);
		while ((tmp8 < 11)) {
			if (AccRead(0x02, buf, 6) == 0) {
				acXsum += (signed char)buf[1];
				acYsum += (signed char)buf[3];
                if ( ((signed char)buf[5] > -15) && ((signed char)buf[5] <15))  break;
				tmp8++;
			} else
				break;
			__delay_ms(500);
		}

		if (tmp8 == 11) {
			acXsum = acXsum / 10;
			acYsum = acYsum / 10;  
			// Luu gia tri goc nghieng vao eeprom
			WRITE_EEPROM(_adsX, acXsum);//(unsigned char) - k can ep kieu - trinh dich tu gan byte thap
			WRITE_EEPROM(_adsY, acYsum);//(unsigned char)
			beep(10, 3);

		} else {
			beep(10, 2);
		}

		break;

// Vao cai dat che do Huy tinh nang anten
	case _sAll:
		tmp8 = READ_EEPROM(_adsSk); // dia chi luu
		if (tmp8 & SkipAll) {
            tmp8 &= ~SkipAll;
		}
		else {
            tmp8 |= SkipAll;
		}
        WRITE_EEPROM(_adsSk, tmp8);
		beep(50, 1);
		break;

	// Vao cai dat che do Huy tinh nang bo khoa
	case _sAtn:
		tmp8 = READ_EEPROM(_adsSk); // dia chi luu
		if (tmp8 & SkipAtena) {
            tmp8 &= ~SkipAtena;
		}
		else {
            tmp8 |= SkipAtena;	
		}
        WRITE_EEPROM(_adsSk, tmp8);
		beep(10, 1);
		break;
	}

// kiem tra che do Huy
	tmp8 = READ_EEPROM(_adsSk);
    if (tmp8 >0 && tmp8<4 ) {
        bitPwOn = 1;
		setState(_Open, tOut_Open);
		antenSkip = 1;
           
		if (tmp8 & SkipAll) {	
			accEna = 0;
		}
		else if (tmp8 & SkipAtena) {
			tmp16 = timeTick + 40;
			beep(10, 1);
		}
	}
    
	// Doc gia tri goc
	acXsum = (signed int)READ_EEPROM(_adsX);// (signed char) ????
	acYsum  = (signed int)READ_EEPROM(_adsY);
    
	timeTick = 0;

//================
	while (1) {
//swTx =keyDetect;
/// keyfob update  ===============
		if ( antenSkip == 0) {
			if (mode_chek == md_ckIDE) {
				if (keyUpd) {

					PAIE = 0;
					//indicator ? notifi
					keyUpd = 0;

					// test time out  chan detect 125khz?
					// co chia -> tao TimeOut
					if (keyfob) {
						//beep(10,1);
						switch (mtState) {
						case _Open:
							lostDetect = 0;
							timeTick = 0; //open->open
							tmp16 = 40;// thoi gian lay mau gia tri goc
							break;

						case _rCheck:
							if (timeTick > 30) {
								timeTick = 0;
								//Xoa trang thai canh bao khi ve reCheck
								if (READ_EEPROM(add_Alert) == 0xcc) WRITE_EEPROM(add_Alert, 0);

								if ((mtOldState == _Alert)) {
									beepOn(); TMR2ON = 0; beep(10, 1);
									if (reAlertOn)reAlertOn = 0;
								}
								else if ((mtOldState == _Ide) || (mtOldState == _rAlert)) {
									bitPwOn = 1;
									setState(_Open, tOut_Open);
									if (READ_EEPROM(_adMd))WRITE_EEPROM(_adMd, 0);
									tmp16 = timeTick + 40;
									beep(10, 1);
								}
								else if ((mtOldState == _Open)) {
									//beepOn();TMR2ON = 0; beep(10,1);// nhac quen chia
									if (reAlertOn)reAlertOn = 0;
								}
							}
							break;

						case _Alert:
							if (timeTick > 200) {
								// xoa canh bao khi dang bao
								beepOff();
								if (READ_EEPROM(add_Alert) == 0xcc) WRITE_EEPROM(add_Alert, 0);
								bitPwOn = 1;
								setState(_Open, tOut_Open);

								tmp16 = timeTick + 40;
							}
							//timeTick =0;
							break;

						case _rAlert:
							beepOff();
							setState(_rCheck, tOut_rCheck);
							break;
						case _Ide:
							// Bo mo may nhanh
							//setState(_rCheck,tOut_rCheck);
							break;
						}
					}
					// mat chia
					else {
						//beep(10,2);
						switch (mtState) {

						case _Open:
							/// Da chong canh, ? mat chia => uu tien ?
							// vision moi lan nhan nut de, -> check chia
							if ((lostDetect == 1) && (timeTick < 1500) && (timeTick > 700)) // check lan 2 <=> = 20 -> alert 20s -> den smart key sang!  =>      alert =18s
							{
								if (READ_EEPROM(add_Alert) == 0x00) WRITE_EEPROM(add_Alert, 0xcc);

								setState(_Alert, tOut_Alert);
								cntTmp = timeTick + 40; // kiem tra lai
								PR2L = voice1;
								beepOn();
								lostDetect = 0;
							}
							else {
								lostDetect = 1;//lostDetect++;
								//beepOn();TMR2ON = 0;
								//beep(10,2);
							}
							timeTick = 0;
							tmp16 = 40;
							break;
						case _rCheck:
							//if(timeTick >30){
							timeTick = 0;
							beepOn(); TMR2ON = 0;
							beep(10, 2);
							if (mtOldState == _Alert) {reAlertOn = 1;}
							break;
						}
					}
					PAIE = 1;
				}
			}
		}
/// Time Out
//if(mode_chek == md_ckIDE)
		if ((timeOut != 0) && ( timeTick > timeOut)) {

			switch (mtState) {
			case _Open:
            //timeTick = 0; //open->open
			//tmp16 = 40;// thoi gian lay mau gia tri goc
				break;
			case _Alert:
				beepOff();
				bitPwOn = 0;
				setState(_rCheck, tOut_rCheck);
				break;
			case _rAlert:
				beepOff();
				delay_x10ms(20);
				beepOn(); TMR2ON = 0; reAlertOn = 0;
				beep(30, 1);
				vibrateOn = 1;
				setState(_Ide, tOut_Ide);
				//enaDetect =0;
				tmp16 = timeTick + 40;
				break;
			case _rCheck:
				// xoa canh bao
				if (READ_EEPROM(add_Alert) == 0xcc) WRITE_EEPROM(add_Alert, 0);
				if (reAlertOn) {	///???reAlertOn
					setState(_rAlert, tOut_rAlert);
					cntTmp = timeTick + 40;
					PR2L = voice1;
					beepOn();

				} else if (mtOldState == _Ide) {
					// bao anten hong
					beep(10, 5);
					bitPwOn = 1;
					if (READ_EEPROM(_adMd))WRITE_EEPROM(_adMd, 0);///
					setState(_Open, tOut_Open);
					tmp16 = timeTick + 40;

				} else {
					beepOn(); TMR2ON = 0;
					reAlertOn = 0;
					beep(30, 1);
					setState(_Ide, tOut_Ide);
					//enaDetect =0;
					vibrateOn = 1; // kiem tra
					tmp16 = timeTick + 40;
				}
				break;
			}
		}
// Lay gia tri goc(gia toc)
		if ((timeTick > tmp16) && (accEna == 1)) {
			if (timeTick > 65000) timeTick = 0;//kiem tra
			tmp16 = timeTick + 40;
            
			if (AccRead(0x02,buf, 6) == 0) {
				//open
				if((mtState == _Open) ){//||(mtState == _rCheck)
					// kiem tra da chong
                    
					if (compe((signed char)buf[1], (signed char)acXsum, 4) && compe((signed char)buf[3], (signed char)acYsum, 4)) {
						//beep(10,1);
						isSw++;
						if (isSw > 44) {
							isSw = 0;
							vibrateOn = 1; // bat che do chong rung
							// lay vi tri chinh xac tai thoi diem da chong, truoc khi chuyen sang che do chong rung
							//acYOld = (signed char)buf[3]; acXOld = (signed char)buf[1]; // co the bo vi o che do rCheck van lay gia tri
							bitPwOn = 0;
							setState(_rCheck, tOut_rCheck);
                            tmp16 = timeTick + 40;///----
						}
						else if (isSw > 25) { //0.4*20=8s
							if (isSw % 2 == 0) {
								beepOn(); TMR2ON = 0; beep(7, 1);
							}
						}
					}
					// kiem tra trang thai tinh~
					else 
                    
                    {
						isSw = 0;
						// khi xe khong chuyen dong, o trang thai tinh lien tuc 3m => dua ve che do bao ve
						// >>>>test thuc te ok <<<<<<
						if (compe((signed char)buf[1],acXOld,1 ) && compe((signed char)buf[3],acYOld,1)) {
							isWait++;
							if (isWait == 450) { //3min 450
								isWait = 0;
								beep(7, 2);
								vibrateOn = 1; // bat che do chong rung (1)
								bitPwOn = 0;
								setState(_rCheck, tOut_rCheck);
							}
						}
						else
							{isWait = 0;}         ///
					}
                    
					// kiem tra trang thai do xe (bo khoa vuong goc voi mat dat)
					if ( ((signed char)buf[5] > -15) && ((signed char)buf[5] < 15)) {
						isFall++;
						if (isFall > 4) {//4
							isFall = 0;
							beep(7, 2);
							bitPwOn = 0;
							setState(_rCheck, tOut_rCheck);
						}
					}
					else {
						isFall = 0;
					}

					// Luu gia tri goc
					acYOld =(signed char)buf[3]; acXOld = (signed char)buf[1];

				//Ide
				}
				else if(mtState== _Ide){
					// chong rung, chong dat khi may nghi
					if (vibrateOn) {
						if (compe((signed char)buf[1],acXOld , 3) && compe((signed char)buf[3],acYOld , 3)) { 
							//beep(10,1);
							isSw = 0;
						}
						else {
							isSw++;
							beepOn(); TMR2ON = 0; beep(7, 3);
						}
					}
				}
                // Luu gia tri goc
				//acYOld =(signed char)buf[3]; acXOld = (signed char)buf[1];
			}
		}
		// Thuc thi lenh dieu khien
		if (bitPwOn) {swMainOut = 1; swMainOut2 = 1;}
		else {swMainOut = 0; swMainOut2 = 0;}

		// timeout xoa gia tri nhap vao sau 5s
        if (timeTick > 500){
			if (READ_EEPROM(_adCt)) WRITE_EEPROM(_adCt, 0);
			if (READ_EEPROM(_adMd)) WRITE_EEPROM(_adMd, 0);
        }
	}
}
//===========================================================

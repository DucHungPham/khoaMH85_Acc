#include 	"main.h";
#include 	"sysInit.H"

#define voice1	20
#define voice2	25

unsigned char mode_chek = md_ckIDE ;
unsigned int timeOut =0,timeTick=0,cntTmp=0;
unsigned char cntCyc = 0,cntOff =0,lostDetect =0;//test_t=0,
unsigned char  mtState = _Ide,mtOldState=_Ide;//
//unsigned char serNum[9]={0};
unsigned char RegStatus = 0;

unsigned char READ_EEPROM(unsigned char EEAddr);
void WRITE_EEPROM(unsigned char EEAddr,unsigned char EEData);
//===========================================================
//Variable definition
//===========================================================

/*
V1: Ðo mu'c 16ms < H < 80ms  và L > 130ms - trong truong hop khong co nhieu
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

void interrupt ISR(void)
{
	unsigned char tmp=0;
//=============
//PortA Interrup --> keyfob detect   
	if(PAIE&&PAIF){
		
		tmp = PORTA;		//
		PAIF = 0;          //clear flag       
		//righting egde
		if(keyDetect){
    
			if(mode_chek == md_ckIDE){	
				cntCyc = 0;
				cntOff = 0; 
				//TMR2IE = 0;
				mode_chek = md_ckStart;
                
            }
		
		} //falling edge
        else{
        	cntOff = 0;
        	// init timer          			
		}   

	}
 
//====================
if(INTE&&INTF){
    unsigned char tmp;
		INTF = 0;
        
        if( swPwOn==0){//(RegStatus & keyUpd)==0 && mtState ==_Ide && 
                     
            if(timeTick <0x20){
                tmp = READ_EEPROM(0x40);
                WRITE_EEPROM(0x40,tmp+1);
                
                
			}//timeTick =0;
            //WRITE_EEPROM(0x40,timeTick>>8);
            //WRITE_EEPROM(0x41,timeTick);
            
			//timeTick =0;
            while(1);
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
    
        if( mode_chek == md_ckStart){
			//count cycle time(inlude noise)
			cntCyc++;
            
			if(keyDetect==0){
				//cout dead time
            cntOff++;
                
				//time out 
				if(cntOff > 15){ //110
					//TMR2IE = 1;
					mode_chek = md_ckIDE;
                    	//90 - 500ms
					if((cntCyc>15) &&(cntCyc<50)) {//2-> 16=>15
						RegStatus |= (keyfob);				
                    } else if (cntCyc>=50){
                        RegStatus &= ~(keyfob);                       
                    }
                    //swUartSendString("keyUpd\n");
                    
					RegStatus |= keyUpd;
                }
                
			}
           /* 
			if( cntCyc==0){
                mode_chek = md_ckIDE;
                RegStatus &= ~(keyfob);  
				RegStatus |= keyUpd;
				test_t=1;
			}
            */
            
		}
        
        //
		timeTick++;
        
		if((mtState == _rAlert)||(mtState == _Alert)){

			if(timeTick > cntTmp){
	            cntTmp = timeTick+45;
	            if(cntTmp<=timeOut)
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
	if(TMR2IE&&TMR2IF)
		{
			TMR2IF = 0;
			buzzer =~ buzzer;			//
		}
    
}


void delay_x10ms(unsigned int t){
unsigned int set = t + timeTick; 
        while(timeTick < set); 
}

void beepOff(){
    TMR2ON = 0;buzzer =0;TRISA |= 0x08;
}
void beepOn(){
    TMR2ON = 1;
    TRISA &= 0xf7;
}
void beep(unsigned char delay,unsigned char rep){
    {	       
		while(rep--){
            TMR2ON = 1;
			PR2L = 12; //12
			delay_x10ms(delay);
            //__delay_ms(400);
            TMR2ON = 0;buzzer =0;
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

void WRITE_EEPROM(unsigned char EEAddr,unsigned char EEData)
{
	GIE = 0;           
	while(GIE) CLRWDT();
	EEADR = EEAddr;
	EEDAT = EEData;
	EEIF = 0;
	EECON1 = 0x34;
	WR = 1;
	while(WR) CLRWDT();	
                       
	GIE = 1;
}

/*====================================================*/

void setState(unsigned char stt, unsigned int _tOut){
    mtOldState = mtState;
	mtState = stt;
	timeTick =0;
	timeOut = _tOut;
}
unsigned char compe(signed char a,signed char b, signed char dt){
		
        if(a>b){
				if((a-b)<=dt) return 1;
                else return 0;
            }
		else if(a<b){
			if((b-a)<=dt) return 1;
			else return 0;
			}
		else if(a==b){
			return 1;
			}
			return 0;
}

void main(void)
{
	// clear WDT
    /*
#asm
	MOVLW		0x07			//
	MOVWF		0x19			//
#endasm
*/
unsigned char reAlertOn=0,tmp8,isSw=0,isFall=0,mpuOk=0,vibrateOn=0,accSet=0;
unsigned int isWait =0;
signed int  acYsum=0,acXsum=0;
unsigned int tmp16=0;
signed char acYOld,acXOld;
signed char buf[6];

	CLRWDT();
    
	sys_init();
	gpio_init();
    timer_init();
     int_init();   
    

    __delay_ms(100); 
 	//enaDetect =1;
    //__delay_ms(100);
    
	PAIE = 1;    
	
	RegStatus = 0;

     	swI2C_Init();
    //mtOldState = _Ide;
  
    setState(_Ide,0);
 //================= 
	WRITE_EEPROM(0xFF,0xAA);			//
	WRITE_EEPROM(0xFF,0xAA);			//
 //=================   
	   
     __delay_ms(200);
 //timeTick = 0;   
tmp8= READ_EEPROM(add_Alert);
    if(tmp8==0xff) {WRITE_EEPROM(add_Alert,0);__delay_ms(2);}
    
     if(tmp8==0xcc){		//
		RegStatus &=~(bitPwOn);
		setState(_Alert,tOut_Alert);
		mtOldState = _Open;
		cntTmp = timeTick+50;
		PR2L =12;
		beepOn();
    } else {
		setState(_rCheck,400);// timout 4s cho thoi gian mo may, check tin hieu chia

		mtOldState = _Ide;
		
	}

 
tmp8    = READ_EEPROM(0x40);// dia chi luu gia tri so lan on/off
if(tmp8==8){
    tmp8= READ_EEPROM(0x41);// che do? bo qua chuc nang bo^. khoa
    beep(25,1);
    if((tmp8==1)||(tmp8==0xff)){
        WRITE_EEPROM(0x41,0);
    }
    else {
        WRITE_EEPROM(0x41,0x1);

    } 
   WRITE_EEPROM(0x40,0);
    tmp8=0;
    __delay_ms(100);
} else if(tmp8==0xff) WRITE_EEPROM(0x40,0);
	
  
tmp8    = READ_EEPROM(0x41);
 if(tmp8==1){
		 swMainOut =1;swMainOut2 =1;
        while(1){
            __delay_ms(1000);
            if(timeTick >300)  WRITE_EEPROM(0x40,0);
		}
}


    buf[0] = 0x28; //Acc only
    buf[1] = 0x87;
    if(AccWrite(0x6b,(unsigned char)buf,2)==0) 
		mpuOk =1;
    else 
    mpuOk =0;
    //SendNum(AccWrite(0x6b,(unsigned char *)buf,1));
   __delay_ms(100);

if(mpuOk ==0){beep(10,2);}// bao loi giao tiep mpu



// Luu gia tri goc nghieng vao eeprom
//
tmp8= READ_EEPROM(0x40);//che do? bo qua chuc nang bo^. khoa
	if(tmp8==6 && mpuOk ==1)   
	{
		tmp8=0; beep(10,3); 
		while((swPwOn )&&(tmp8<11))
		 {
				if(AccRead(0x3b,(unsigned char)buf,6)==0){
			
		acXsum += buf[0];
		acYsum += buf[2];
        tmp16 = (signed int)tmp16 + buf[4];
		tmp8++;
			 }
		__delay_ms(500);

		}

		if(tmp8==11){
		acXsum =acXsum/10;
		acYsum = acYsum/10;
        tmp16 = (signed int)tmp16/10;
        
		if(((signed int)tmp16 > (-31)) && ((signed int)tmp16 < 31)){ 
			beep(10,2);
        }
        else
        
        { 
			beep(10,3);
            WRITE_EEPROM(0x10,(unsigned char)acXsum);
            WRITE_EEPROM(0x11,(unsigned char)acYsum);
            __delay_ms(100);
			}

		}else{
			beep(10,2);
		}
       WRITE_EEPROM(0x40,0);
       tmp8=0; 
	}
     
	acXsum = (signed char)READ_EEPROM(0x10);
    acYsum  = (signed char)READ_EEPROM(0x11);
   
timeTick = 0;

//=================
	while(1){

//swTx =keyDetect;
 
  
/// keyfob update  ===============    
        if(mode_chek == md_ckIDE)
        {
        	
			if(RegStatus & keyUpd)
            {
				PAIE = 0;
                
				//indicator ? notifi				                
				RegStatus &= (~keyUpd);
              /*  			
				if(test_t ){
                    if(mtOldState == _Ide){
                    //test_t=0;
                    beep(10,3);
					RegStatus |=(bitPwOn); 
					setState(_Norl,tOut_Norl);
                    }
                    }
                else
                */
                {
	        	// co chia -> tao TimeOut
				if ((RegStatus & keyfob) !=0){
					//beep(10,1);	
                    	
					switch (mtState){					                                                 
                        case _Open:
						
                            lostDetect =0;
                            timeTick =0;//open->open
                            tmp16 = 40;
							break; 
                                                         
                        case _rCheck:
                        if(timeTick >30){                         
							timeTick =0;
                            
                            if(READ_EEPROM(add_Alert)==0xcc) WRITE_EEPROM(add_Alert,0);
                            
							if((mtOldState == _Alert)){
									beepOn();TMR2ON = 0; beep(10,1);
                                    if(reAlertOn)reAlertOn =0;
							}                           
                            else if((mtOldState == _Ide)||(mtOldState == _rAlert)){
								RegStatus |=(bitPwOn);
								setState(_Open,tOut_Open);
                                 if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
                                tmp16 = timeTick+40;
                                beep(10,1);
                            }
                            else if((mtOldState == _Open)){
									//beepOn();TMR2ON = 0; beep(10,1);// nhac quen chia
                                    if(reAlertOn)reAlertOn =0;
							}   	
                        }			     				 
							break;
                            
                        case _Alert:                   
							if(timeTick > 200)
                            {
								beepOff();
								if(READ_EEPROM(add_Alert)==0xcc) WRITE_EEPROM(add_Alert,0);
                                RegStatus |=(bitPwOn);		                         
								setState(_Open,tOut_Open);
                                
                                tmp16 = timeTick+40;
                            }
                            //timeTick =0;
							break;
                            
						case _rAlert:
							beepOff();                        
							setState(_rCheck,tOut_rCheck);
							break;  	
						case _Ide:
							// Bo mo may nhanh
                            //setState(_rCheck,tOut_rCheck);
							break; 
                        
					}
                    
	        	}
                // mat chia
                else{
					//beep(10,2);
                     switch (mtState){

                            case _Open:
                            /// Da chong canh, ? mat chia => uu tien ?

                                 {
								 	// vision moi lan nhan nut de, -> check chia
                                    if(lostDetect==1 && timeTick< 1500) // check lan 2 <=> = 20 -> alert 20s -> den smart key sang!  =>      alert =18s                           
                                    {
										if(READ_EEPROM(add_Alert)==0x00) WRITE_EEPROM(add_Alert,0xcc);
                                        
										setState(_Alert,tOut_Alert);
	                                    cntTmp = timeTick+40;// kiem tra lai 
										PR2L =voice1;
										beepOn();
	                                    lostDetect =0;
                                    }
                                    else {
										lostDetect =1;
                                        //beepOn();TMR2ON = 0;
										//beep(10,2);
                                    }
                                    timeTick =0;
                                    tmp16 = 40;
								 }                                               
								break;
                            case _rCheck:
                             //if(timeTick >30)
                             {
								timeTick =0;
                                beepOn();TMR2ON = 0;
                                beep(10,2);
                                if(mtOldState == _Alert){reAlertOn =1;}  
                             }                            
								break;
                     }  
				}
                
                }// test time out  chan detect 125khz
				
				PAIE = 1;
			}
        	
        }
	
/// Time Out
 //if(mode_chek == md_ckIDE)
{
		if((timeOut!=0)&&( timeTick >timeOut)){
              		
			switch (mtState){
             
                case _Open:
                // da chong (khong nhan duoc tin hieu)
			        //beepOn();TMR2ON = 0;
			        //RegStatus &=(~bitPwOn);            
					//setState(_rCheck,tOut_rCheck);		
					break;
			    case _Alert:
					beepOff();     
			        RegStatus &=(~bitPwOn);            
					setState(_rCheck,tOut_rCheck);		
					break;
				case _rAlert:
                    beepOff();
                    delay_x10ms(20);
                    beepOn();TMR2ON = 0;reAlertOn =0;         
                    beep(30,1);
					setState(_Ide,tOut_Ide);
                    //enaDetect =0;
                    tmp16 = timeTick+40;
                    break;
				case _rCheck:
                    // xoa canh bao
                    if(READ_EEPROM(add_Alert)==0xcc) WRITE_EEPROM(add_Alert,0);
                    
					if(reAlertOn){	///???reAlertOn						
							setState(_rAlert,tOut_rAlert);
							cntTmp = timeTick+40;
							PR2L =voice1;
							beepOn();
                            
                    }else if(mtOldState == _Ide){							
                            // bao anten hong
                            beep(10,5);
                            RegStatus |=(bitPwOn); 
							//setState(_Norl,tOut_Norl);
                            
                            if(READ_EEPROM(0x40))WRITE_EEPROM(0x40,0);
                            
                            setState(_Open,tOut_Open);
                            tmp16 = timeTick+40;
                            
						}else{
                            beepOn();TMR2ON = 0; 
                            reAlertOn =0;          
							beep(30,1);						
							setState(_Ide,tOut_Ide);
                            //enaDetect =0;
                            tmp16 = timeTick+40;
						}
				break;
			 }
		}

} 
     
		if((timeTick>tmp16) && (mtState == _Open) && mpuOk ==1){
			tmp16 = timeTick+40;
			if(AccRead(0x3b,buf,6)==0){

				if(compe(buf[0], (signed char)acXsum,5) && compe(buf[2], (signed char)acYsum,5)){
				//beep(10,1);
                // phat hien da chong
					isSw++;
					if(isSw >44){
						isSw =0;
                        vibrateOn=2; // bat che do chong rung 2
                        // lay vi tri chinh xac tai thoi diem da chong, truoc khi chuyen sang che do chong rung
                        //==========> accOld
						RegStatus &=(~bitPwOn);
						setState(_rCheck,tOut_rCheck);
                        //
					}
					else if(isSw > 25){ //0.4*20=8s
						if(isSw%2==0){					 
			                     beepOn();TMR2ON = 0; beep(7,1);
						}	
					}

            	}
            	else{ 
						isSw =0;
                         // khi xe khong chuyen dong, o trang thai tinh lien tuc 3m => dua ve che do bao ve
                         
                        if(compe(buf[0], acXOld,2) && compe(buf[2], acYOld,2)){
                            isWait++;
                            if(isWait==450){
                                isWait = 0;
								beep(7,2);
                                vibrateOn=1; // bat che do chong rung (1)
								RegStatus &=(~bitPwOn);
								setState(_rCheck,tOut_rCheck);
                            }
                        }                                                 
						     
				}
                
				if( (buf[4] > -31) && (buf[4] < 31)) {
                    isFall++;
                    if(isFall >4){
						isFall =0;
                        beep(7,2);
						RegStatus &=(~bitPwOn);
						setState(_rCheck,tOut_rCheck);
					}
				}
                else{
						isFall=0;
				}
                
				acYOld = buf[2];acXOld = buf[0];
            }	
            
		}  		
///     
 // chong rung, chong dat 
if((timeTick>tmp16) && (mtState == _Ide ) && mpuOk ==1){//|| mtState == _rCheck
			
			if(timeTick >65000) timeTick =0;
			tmp16 = timeTick+40;
           
			if(AccRead(0x3b,buf,6)==0){
                //So sanh vi tri truoc khi chuyen sang che do chong rung
				if(vibrateOn==1){
					if(compe(buf[0],acXOld ,2) && compe(buf[2],acYOld ,2)){//(signed char)acXsum  (signed char)acYsum
					//beep(10,1);
						isSw=0;
						

					}
					else{ 
							isSw++;    
						   
							//if(isSw%2==0)
							{					 
									 beepOn();TMR2ON = 0; beep(7,3);
							}	
					}
                }
                else if(vibrateOn==2){
                    if(compe(buf[0],(signed char)acXsum ,5) && compe(buf[2],(signed char)acYsum ,5)){//  (signed char)acYsum
					//beep(10,1);
						isSw=0;
						

					}
					else{ 
							isSw++;    
						   
							//if(isSw%2==0)
							{					 
									 beepOn();TMR2ON = 0; beep(7,3);
							}	
					}
				}
				
            }	
            

		}   		
  ///      
		if(RegStatus & bitPwOn) {swMainOut =1;swMainOut2 =1;}
        else {swMainOut =0;swMainOut2 =0;}
        

	}   

}
//===========================================================

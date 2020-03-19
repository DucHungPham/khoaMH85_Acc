#include 	"sysInit.h";

void sys_init(void){
	
	//---register config CFG - UCFG
	//-> config by sofware programer
	// CPB  = ; --(Code protect)
	// MCLKE = ; --(Master clear enable)
	// PWRTEB = ; --(Power-on timer enable)
	// WDTE = 0; --(Watchdog timer enable)
	// FOSC = INTOSCIO;
	// CSUMEN= ;
	// TSEL= 2T;
	// FCMEN= ; --(Clock fault monitoring enabled)
	// IESO= ; --(Two-speed clock enable)
	// RDCTRL= ; --(Read port control output mode)
	// LVREN= ;	--(Low voltage reset selection)
	// LVRS= ; --(Low voltage leve)
	 
	//---clock config	
	OSCCON = 0B01010001;
    NOP();  
	//LFMOD = 0; // LF 32K
	//IRCF = 0B101; //4MHz
	//HTS = 0;	// hight speed internal read only
	//LTS = 0;	// low speed internal read only
	//SCS = 1;	// system clock enable
	while(HTS==0); // wait  HFINTOSC is ready

}

void gpio_init(void){

	PORTA = 0B00000000;
	TRISA =  0B00110111;  //RA7 RA4 -out
	WPUA =  0B11000000;   //
    
	PORTC = 0B00000000;
	TRISC =  0B11111100;  //RC0 RC4 -out
	WPUC =  0B00000000;   //
    
	PSRCA  = 0B11111111;	
	PSRCC  = 0B11111111;
	PSINKA = 0B11111111;	
	PSINKC = 0B11111111;
    
	MSCON  = 0B00110000;//?
}


void timer_init(void){
	// Timer0
	//OPTION = 0B00000001; //bit7=0,bit 0 =1: timer0 enable
	//nPAPU = 0;
    //T0CS = 0; // internal clock
    //T0SE = 0;
    //PSA = 0;//select clock for timer0
    //PS2 = 0;PS2 = 0;PS2 = 1; // chia tan 256=> 4M/256=1M -> Ftimer0  
	//T2CON = 0b00000011;
	T0CON0 = 0B00000000;
	OPTION = 0B00000111;            //Bit4=0 TIMER0 MODE,PS=001=1:4 TIMER0 RATE
	TMR0 = 179;
    
	TMR2H = 0;
    TMR2L = 0;
	PR2H = 0;
    PR2L =0;
	T2CON0 = 0B00101001;
	//TMR2 = 0;
	//PR2 = 0;
	//T2CON = 0B00101001;
    
	// Timer1
    /*
	TMR1H = _Timer1>>8;
    TMR1L = _Timer1;                  //Timer1 = 0x3CAF=15535
	T1CON = 0B00100001;	//  01=1/4 =>Tcnt = (2*4)/Fosc=2us Timer1 interrup = Fosc/2/4 * 50000 = 100ms 
	TMR1ON = 1;
    */
}


void int_init(void){
	
	unsigned char tmp=0;
	
	// peripheral interrupt
	INTCON = 0B00000000; //ÔÝ½ûÖ¹ËùÓÐÖÐ¶Ï
	PIE1 = 0B00000000;
	PIR1 = 0B00000000;
// PortA
	IOCA5 = 1; //
	tmp = PORTA;	//
	PAIF = 0;
	PAIE = 0;

// cha INT
    INTEDG = 0;		
	INTF = 0;
	INTE = 1;
 //Timer2   
	TMR2IF = 0;
	TMR2IE = 1;
	TMR2ON = 0;
 //Timer1   
//	TMR1IF = 0;                      
//	TMR1IE = 1;                       
  
//Timer0
	T0IF = 0;                       
	T0IE = 1;                      
	T0ON = 1;	
      
    PEIE = 1;	// Peripharal Interrupt Enable 
    
	GIE = 1;	// Global Interrupt Enable
}

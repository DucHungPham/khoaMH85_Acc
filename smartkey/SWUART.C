#include 	"swuart.h";



void SendNum(unsigned char num){
    unsigned char nib = num>>4;
    swUartSendByte(nib <10 ? (nib+'0') :(nib+'A'-10));
    nib = num&0x0f;
    swUartSendByte(nib <10 ? (nib+'0') :(nib+'A'-10));
}

void swUartDelay(unsigned int t){
    
}

void swUartInit(void){
    
}

void swUartSendByte(unsigned char dat){
    unsigned char i;
    
	swTx = 0;
    //swUartDelay(StartBit);
    __delay_us(swDelayBit);
    for(i=0;i<8;i++){
			swTx = (dat&1);
            dat=dat>>1;
            //swUartDelay(DataBit);
            __delay_us(swDelayBit);
	}
    //parity bit
    //swTx = 0;
    //swUartDelay(DataBit);
    //__delay_us(swDelayBit);
    swTx = 1;
    //swUartDelay(StopBit); 
    __delay_us(swDelayBit);
     
}

void swUartSendString(char *str){
		while(*str){
			swUartSendByte((char)*str);
            str++;
        }
}
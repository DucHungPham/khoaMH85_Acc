#include "mpu6x.h"

unsigned char AccWrite(unsigned char rAdd,unsigned char *dat, unsigned char len)
{ 
 unsigned char i;
swI2C_Start();
  
  if(swI2C_WriteByte(AccAdd<<1)== swI2C_ACK )//ack by mcp ACK =0, NACK=1
  {
		if(swI2C_WriteByte(rAdd)==swI2C_ACK )//ack by mcp
	  {
			for(i=0; i<len;i++){
              if(swI2C_WriteByte(dat[i])==swI2C_NACK ){
                  swI2C_Stop();
				return 3;// write error
              }
            }
			swI2C_Stop();
			return 0; // no error			
	  }
      else
		return 2; //device busy
  }
  else
	return 1; // communication error
  
}


unsigned char AccRead(unsigned char rAdd,unsigned char *dat, unsigned char len)
{
  unsigned char i;
  
  swI2C_Start();
  
  if(swI2C_WriteByte(AccAdd<<1)== swI2C_ACK )
  {
		if(swI2C_WriteByte(rAdd)==swI2C_ACK )
	  {		
			swI2C_Start();
            if(swI2C_WriteByte((AccAdd<<1)|1)== swI2C_ACK ){
                
				for(i=0; i<(len-1);i++){
					dat[i]=swI2C_ReadByte(swI2C_NACK);//??
				}
                dat[i]=swI2C_ReadByte(swI2C_NACK);
				swI2C_Stop();
				return 0;
                 
            }
			else
				return 1;			
	  }
      else
		return 2; //       
  }
  else
	return 1; //
}

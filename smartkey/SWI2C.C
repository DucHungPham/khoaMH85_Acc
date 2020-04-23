#include "swi2c.h"

/*
sau moi xung SCL = 0
*/

//==============================================================================
void swI2C_Init(void){
  //bus readly
swSDA_DDRO;
swSCL_DDRO;
  I2C_delay;
  swSCL = 1;
  swSDA_O = 1;
  I2C_delay;
  I2C_delay;
  I2C_delay;
  I2C_delay;
}
//==============================================================================
void swI2C_Start(void)
{ 
  // start
  swSCL = 1; 
  //I2C_delay;
  swSDA_O = 1;
  I2C_delay;
  swSDA_O = 0;
  I2C_delay;     
  swSCL = 0; 
  I2C_delay;
}
//==============================================================================
void swI2C_Stop(void)
{     
  // stop
  swSDA_O = 0;
  swSCL = 1; 
  I2C_delay;
  swSDA_O = 1;
  I2C_delay;     
}

//==============================================================================
void swI2C_Scanner(void){
 /*    byte error, address;
  int nDevices;

  Serial.println("Scanning...");
 
  nDevices = 0;
  for(address = 1; address < 127; address++ )
  {
    // The i2c_scanner uses the return value of
    // the Write.endTransmisstion to see if
    // a device did acknowledge to the address.
    Wire.beginTransmission(address);
    error = Wire.endTransmission();
 
    if (error == 0)
    {
      Serial.print("I2C device found at address 0x");
      if (address<16)
        Serial.print("0");
      Serial.print(address,HEX);
      Serial.println("  !");
 
      nDevices++;
    }
    else if (error==4)
    {
      Serial.print("Unknown error at address 0x");
      if (address<16)
        Serial.print("0");
      Serial.println(address,HEX);
    }    
  }
  if (nDevices == 0)
    Serial.println("No I2C devices found\n");
  else
    Serial.println("done\n");
 */
}
//==============================================================================
unsigned char swI2C_WriteByte( unsigned char dat)
{       
  unsigned char i=0;
  
swSDA_DDRO;
I2C_delay;
  for(i=0;i<8;i++)
  {
    swSDA_O = (dat&0x80) ? 1:0;  
    dat<<=1;
    swSCL = 1;
    I2C_delay;
    swSCL = 0;
    I2C_delay;
  } 
// read ack
  swSDA_DDRI;
  I2C_delay;
  swSCL = 1;
  I2C_delay;
  i= swSDA_I;
  swSCL = 0;
swSDA_DDRO;   
  return i;
}
//==============================================================================
unsigned char swI2C_ReadByte(unsigned char Ack)// read 1 byte data
{
  
  unsigned char i=0, dat=0;
  swSCL = 0;
  swSDA_DDRI;
I2C_delay;
  for(i=0;i<8;i++)
  {  
    swSCL = 1;
    I2C_delay;
    dat = dat<<1 |(swSDA_I & 1 );  //swSDA_I)
	//dat = dat<<1;
	//if (swSDA_I & 1 ) dat|=1;
    swSCL = 0;
    I2C_delay;
  }
  
  swSDA_DDRO;
  
  swSDA_O = (Ack) ? 1 : 0;
  swSCL = 1;
  I2C_delay;
  swSCL = 0;
  I2C_delay;
  return dat;
}

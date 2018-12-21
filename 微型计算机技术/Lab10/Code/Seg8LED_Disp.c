#include "Seg8LED_Disp.h"
#include "STC12C5A60S2.h"

sbit SM_G1 = P2^0;
sbit SM_G2 = P2^1;
sbit SM_G3 = P2^2;
sbit SM_G4 = P2^3;

unsigned short LEDNum[10] = {0x03, 0x9F, 0x25, 0x0d, 0x99, 0x49, 0x41, 0x1F, 0x01, 0x09};

static void ShowEachBit(unsigned char LEDbit, unsigned char num);

static void ShowEachBit(unsigned char LEDbit, unsigned char num)
{
  switch(LEDbit)
  {
    case 4:
      SM_G1 = 0;
      SM_G2 = 1;
      SM_G3 = 1;
      SM_G4 = 1;
      break;
    case 3:
      SM_G1 = 1;
      SM_G2 = 0;
      SM_G3 = 1;
      SM_G4 = 1;
      break;
    case 2:
      SM_G1 = 1;
      SM_G2 = 1;
      SM_G3 = 0;
      SM_G4 = 1;
      break;
    case 1:
      SM_G1 = 1;
      SM_G2 = 1;
      SM_G3 = 1;
      SM_G4 = 0;
      break;
    default:
      break;
  }
  
  P0 = LEDNum[num];
}

void ShowNum(unsigned int num)
{
  unsigned long int i;
  unsigned char bit1, bit2, bit3, bit4;

  if(num > 9999)
  {
  	num = 9999;
  }
  
  bit4 = num / 1000;
  bit3 = (num % 1000) / 100;
  bit2 = (num % 100) / 10;
  bit1 = num % 10;
  
  ShowEachBit(4, bit4);
  for(i = 0; i < 50; i++);
  ShowEachBit(3, bit3);
  for(i = 0; i < 50; i++);
  ShowEachBit(2, bit2);
  for(i = 0; i < 50; i++);
  ShowEachBit(1, bit1);	 
  for(i = 0; i < 50; i++);
}
#include "ADC.h"

#define ADC_POWER   0x80
#define ADC_FLAG    0x10
#define ADC_START   0x08
#define ADC_SPEEDHH 0x60
#define ADC_CHANNEL 0x01

static void setRst();

static WORD result = 0;

void InitADC()
{
  P1ASF = 0x02;
  ADC_RES = 0;
  ADC_CONTR = ADC_POWER | ADC_SPEEDHH | ADC_START | ADC_CHANNEL;
  Delay(2);
  IE = 0xA0;
}

void Delay(WORD n)
{
  WORD x;
  
  while(n--)
  {
    x = 5000;
    while(x--);
  }
}

void adc_isr()interrupt 5 using 1
{
  ADC_CONTR &= !ADC_FLAG;
  
  SendData(ADC_RES);
  SendData(ADC_RESL);
  setRst();
}

static void setRst()
{
  result = ADC_RES * 4 + ADC_RESL;
}

WORD getRst()
{
  return result;
}
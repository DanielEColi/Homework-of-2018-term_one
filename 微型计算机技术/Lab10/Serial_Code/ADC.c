#include "ADC.h"

static WORD result = 0;

void InitADC()
{
  P1ASF = 0x02;
  ADC_RES = 0;
  ADC_RESL = 0;
  AUXR1 &= ~ADRJ_;
  ADC_CONTR = ADC_POWER | ADC_SPEEDHH | ADC_START | ADC_CHANNEL;
  Delay(2);
  EADC = 1;
}

void Delay(WORD n)
{
  WORD i, j, k;
  
  for(k = 0; k < n; k++)
    for(j = 0; j < 78; j++)
      for(i = 0; i < 25; i++);
}

void adc_isr()interrupt 5
{
  if(ADC_CONTR & ADC_FLAG)
  {
    ADC_RESL &= 0x03;
    result = ADC_RES * 4 + ADC_RESL;
    SBUF = ADC_RES;
    while(!TI);
    TI = 0;
    Delay(5);
    ADC_CONTR = ADC_POWER | ADC_SPEEDHH | ADC_START | ADC_CHANNEL;
  }
}

WORD getRst()
{
  return result;
}
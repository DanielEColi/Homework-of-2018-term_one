//ADC.c
#include "ADC.h"

static WORD result = 0;

void InitADC()
{
  P1ASF = 0x02;   //配置AD的端口，此处为P1.1
  ADC_RES = 0;    //初始化存放高8位的寄存器
  ADC_RESL = 0;   //初始化存放低2位的寄存器
  AUXR1 &= ~ADRJ_;//设置高8位存在RES，低2位存放在RESL
  //ADC配置寄存器
  ADC_CONTR = ADC_POWER | ADC_SPEEDHH | ADC_START | ADC_CHANNEL;
  //延时20ms
  Delay(2);
  //打开AD中断开关
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
    //将结果转换为16位的值
    result = ADC_RES * 4 + ADC_RESL;
//    SBUF = ADC_RES;
//    while(!TI);
//    TI = 0;
//    Delay(5);
    ADC_CONTR = ADC_POWER | ADC_SPEEDHH | ADC_START | ADC_CHANNEL;
  }
}

WORD getRst()
{
  return (WORD)(result/1024.0*5.0*100.0);
}
//main.c
#include "Uart.h"
#include "ADC.h"
#include "Seg8LED_Disp.h"

void main()
{
  InitUart();  //初始化串口
  InitADC();   //初始化ADC
  
  while(1)
  {
    ShowNum(getRst());  //扫描八段数码管
  }
}

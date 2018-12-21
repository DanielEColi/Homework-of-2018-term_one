#include "STC12C5A60S2.h"
#include "Uart.h"
#include "ADC.h"
#include "Seg8LED_Disp.h"

void main()
{
  InitUart();
  InitADC();
  
  while(1)
  {
    ShowNum(getRst());
  }
}

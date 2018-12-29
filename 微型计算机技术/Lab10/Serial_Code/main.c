#include "Uart.h"
#include "ADC.h"

void main()
{
  InitUart();
  InitADC();
  
  while(1)
  {
    LED = !LED;
    Delay(100);
  }
}

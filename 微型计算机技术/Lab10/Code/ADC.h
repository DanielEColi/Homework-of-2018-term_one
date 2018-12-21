#ifndef _ADC_H_
#define _ADC_H_

#include "STC12C5A60S2.h"
#include "Uart.h"

void InitADC();
void Delay(WORD n);
WORD getRst();

#endif
//ADC.h
#ifndef _ADC_H_
#define _ADC_H_

#include "STC12C5A60S2.h"
#include "Uart.h"

#define ADC_POWER   0x80
#define ADC_FLAG    0x10
#define ADC_START   0x08
#define ADC_SPEEDHH 0x60
#define ADC_CHANNEL 0x01
#define ADRJ_       0x04

sbit LED = P2^4;

void InitADC();     //初始化ADC
void Delay(WORD n); //延时n个10ms
WORD getRst();      //获取转换的值

#endif
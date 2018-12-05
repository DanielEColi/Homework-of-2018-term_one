//main.c

#include "STC12C5A60S2.h"
#include "Uart.h"

void main()
{
	Uart1_Init(); //初始化串口
	while(1);     //循环等待中断
}
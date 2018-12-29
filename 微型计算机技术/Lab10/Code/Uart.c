//Uart.c
#include "STC12C5A60S2.h"
#include "Uart.h"

#define BRTR_OPEN    0x10
#define S1BRS_BRT_ON 0x01

static void __Uart1_Send_ISR();
static void __Uart1_Recv_ISR();

void InitUart()
{
  SCON = 0x50;        //串口配置寄存器
  AUXR = BRTR_OPEN | S1BRS_BRT_ON; //独立波特率发生器寄存器
  BRT = 0xFD;         //独立波特率发生器的自动重装载值
  EA = 1;             //开启系统中断
  ES = 1;             //开启串口中断
}

void Uart1_ISR() interrupt 4    //串口中断服务函数
{
	if(TI == 1)   //需要发送
	{
		TI = 0;     //清除标志位
		__Uart1_Send_ISR();
	}
	else if(RI == 1) //需要接收
	{
		RI = 0;     //清除标志位
		__Uart1_Recv_ISR();
	}
}

static void __Uart1_Send_ISR()
{
	
}

static void __Uart1_Recv_ISR()
{
	BYTE Uart_Tmp;
  Uart_Tmp = SBUF;
	SBUF = Uart_Tmp;
}
#include "STC12C5A60S2.h"
#include "Uart.h"

#define BRTR_OPEN    0x10
#define S1BRS_BRT_ON 0x01

static void __Uart1_Send_ISR();
static void __Uart1_Recv_ISR();

void InitUart()
{
  SCON = 0x50;
  AUXR = BRTR_OPEN | S1BRS_BRT_ON;
  BRT = 0xFD;
  EA = 1;
  ES = 1;
}

void Uart1_ISR() interrupt 4
{
	if(TI == 1)
	{
		TI = 0;
		__Uart1_Send_ISR();
	}
	else if(RI == 1)
	{
		RI = 0;
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
//Uart.c

#include "STC12C5A60S2.h"
#include "Uart.h"

static void __Uart1_Send_ISR();//串口发送中断服务函数
static void __Uart1_Recv_ISR();//串口接收中断服务函数

void Uart1_ISR() interrupt 4
{
  if(TI == 1)           //需要发送字符
  {
    TI = 0;             //将发送标志位清零
    __Uart1_Send_ISR(); //调用发送中断服务函数
  }
  else if(RI == 1)      //接收到字符
  { 
    RI = 0;             //将接收标志位清零
    __Uart1_Recv_ISR(); //调用结束中断服务函数
  }
}

static void __Uart1_Send_ISR()
{
  
}

static void __Uart1_Recv_ISR()
{
  uint8 Uart_Tmp;     //收发缓冲器
  
  Uart_Tmp = SBUF;    //获取接收到的字符
  SBUF = Uart_Tmp + 5;//将字符加上5后再次发送
}

void Uart1_Init()
{
  REN = 1;    //允许接收控制位置1
  SM0 = 0;    //设置UART工作方式
  SM1 = 1;
  TR1 = 1;    //启动定时器
  TMOD = 0x20;//设置定时器方式
  TH1 = 0xfd; //设置波特率
  TL1 = 0xfd;
  ES = 1;     //开启串口中断
  PS = 0;     //设置串口中断优先级
  EA = 1;     //开启CPU中断总开关
}
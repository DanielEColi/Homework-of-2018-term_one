#include "STC12C5A60S2.h"

typedef unsigned char uint8;  //定义uint8为无符号8位数据类型

void Delay_ms(int DelayTimes);//延时函数
void Uart1_Init();            //初始化串口函数

void main()
{
  Uart1_Init();     //初始化串口

  while(1)
  {
    SBUF = 0x5A;    //串口发送0x5A

    while(TI == 0)  //等待发送结束时，TI标志位自动置1
    {
      TI = 0;       //将标志位清零
    }
    
    Delay_ms(500);  //延时500ms
  }
}

void Delay_ms(int DelayTimes)
{
  int cnt;
  
  //循环直至DelayTimes递减为0
  for(cnt = 1000; DelayTimes > 0; DelayTimes--)
  {
    for(; cnt > 0; cnt--);  //循环直至cnt递减为0
  }
}

void Uart1_Init()
{
  REN = 1;      //允许接收控制位置1
  SM0 = 0;      //设置UART工作方式
  SM1 = 1;      
  TR1 = 1;      //启动定时器
  TMOD = 0x20;  //设置定时器的方式
  TH1 = 0xfd;   //设置波特率
  TL1 = 0xfd;   
}

#include "STC12C5A60S2.h"

typedef unsigned char uint8;//定义uint8为无符号8位数据类型

void Uart1_Init();      //初始化串口函数
    
void main()   
{   
  uint8 Uart_Tmp;       //收发缓存器
  Uart1_Init();         //初始化串口
    
  while(1)    
  {   
    while(RI == 0)      //循环等待接收到字符
    {   
          
    }   
    RI = 0;             //将标志位清零
    Uart_Tmp = SBUF;    //接收串口接收到的数据
    SBUF = Uart_Tmp + 5;//将数据加上5后再次发送
    
    while(TI == 0)      //等待发送结束
    {
      
    }
    TI = 0;             //将标志位清零
  }
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
}

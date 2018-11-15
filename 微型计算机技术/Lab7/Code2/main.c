#include "STC12C5A60S2.h"

sbit SM_G4 = P2^3;     

unsigned char Seg7Disp[10] = {0x03, 0x9F, 0x25, 0x0d, 0x99, 0x49, 0x41, 0x1F, 0x01, 0x09};

void INIT_SEG7()
{
  SM_G4 = 0;          //打开最后一个数码管显示
  P0 = 0xFF;          //数码管熄灭
}
void INIT_TIMER()     //初始化定时器
{ 

     
  EA = 1;       //打开中断允许总控制  
  ET0 = 1;      //打开定时器0中断
  TMOD = 0x01;  //设置定时器模式为16位定时器
  TF0 = 0;      //清楚标志
  TH0 = 0xDC;   //定时器0的高八位
  TL0 = 0x00;   //定时器0的低八位
  TR0 = 1;      //开始计时
}

void Timer0() interrupt 1           //定时器0中断
{
  static unsigned char counter = 0; //静态变量counter
  static unsigned char i = 0;       //静态变量i

  TF0 = 0;                  //清楚标志
  TH0 = 0xDC;               //定时器0的高八位
  TL0 = 0x00;               //定时器0的低八位
  TR0 = 1;                  //开始计时

  counter++;                //计时器加1
  if(counter >= 100)        //计数器加到100
  {
    P0 = Seg7Disp[i];       //点亮七段数码管
    i++;                    //i递增
    if(i >= 10)             //当i大于或等于10的时候
    {
      i = 0;                //将i清零
    }
    counter = 0;            //计数器counter清零
  }
}

void main()       //主函数
{
  INIT_SEG7();    //初始化七段数码管
  INIT_TIMER();   //初始化定时器
  
  while(1)        //死循环
  {

  } 
}
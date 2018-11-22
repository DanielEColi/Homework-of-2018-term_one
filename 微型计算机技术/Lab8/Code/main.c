#include "STC12C5A60S2.h"

sbit LED1 =  P2^4;    //定义LED1的引脚P2.4
sbit LED2 =  P2^5;    //定义LED2的引脚P2.5
sbit LED3 =  P2^6;    //定义LED3的引脚P2.6
sbit LED4 =  P2^7;    //定义LED4的引脚P2.7
sbit Beep =  P1^0;    //定义Beep的引脚P1.0

void PERIPHERAL_Init()
{
  P1M0 = 0x01;  //蜂鸣器推挽输出
  LED1 = 1;     //LED1灭
  LED2 = 1;     //LED2灭
  LED3 = 1;     //LED3灭
  LED4 = 1;     //LED4灭
  Beep = 0;     //蜂鸣器不响
}

void ISR_Init()
{
  IT0 = 0;    //触发方式：电平触发
  PX0 = 0;    //外部中断优先级设置
  EX0 = 1;    //打开外部中断0
  EA =  1;    //打开中断允许总控制
}

void TIMER_Init()    //初始化定时器中断
{
  EA = 1;       //打开中断允许总控制  
  ET0 = 1;      //打开定时器0中断
  PT0 = 0;      //定时器中断优先级设置
  TMOD = 0x01;  //设置定时器模式为16位定时器
  TF0 = 0;      //清楚标志
  TH0 = 0xDC;   //定时器0的高八位
  TL0 = 0x00;   //定时器0的低八位
  TR0 = 1;      //开始计时
}

void LED_RUN()
{
  static unsigned char status = 0;  //函数内部静态变量用来存放状态

  switch(status)
  {
    case 0:
      LED1 = ~LED1;   //LED1取反
      break;
    case 1:
      LED2 = ~LED2;   //LED2取反
      break;
    case 2:           
      LED3 = ~LED3;   //LED3取反
      break;
    case 3:
      LED4 = ~LED4;    //LED4取反
      break;
  }

  status++;      //状态加1
  
  if(status > 3)  //如果状态溢出
  {
    status = 0; //重置状态
  }
}

void INT0_ISR()interrupt 0
{
  unsigned long int i;

  Beep = 0;
  for(i = 0; i < 50000; i++);//软件延时
  Beep = 1;   //蜂鸣器响
  for(i = 0; i < 50000; i++);//软件延时
  Beep = 0;
  for(i = 0; i < 50000; i++);//软件延时
  Beep = 1;   //蜂鸣器响
  for(i = 0; i < 50000; i++);//软件延时
  Beep = 0;
}

void INT1_TIMER0() interrupt 1        //定时器0中断
{
  static unsigned char counter = 0;   //静态变量counter

  TF0 = 0;                    //清除标志
  TH0 = 0xDC;                 //定时器0的高八位
  TL0 = 0x00;                 //定时器0的低八位
  TR0 = 1;                    //开始计时

  counter++;                  //计时器加1
  if(counter >= 100)          //计数器加到100
  {
    LED_RUN();                //调用跑马灯函数
    counter = 0;              //计数器counter清零
  }
}

void main()
{
  PERIPHERAL_Init();//初始化外设
  ISR_Init();       //初始化外部中断0
  TIMER_Init();     //初始化定时器0中断
  
  while(1)          //循环等待中断
  {
  } 
}
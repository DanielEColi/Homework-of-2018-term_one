#include "STC12C5A60S2.h"

sbit LED1 = P2^4;   //设置LED1的引脚为P2.4
sbit LED2 =	P2^5;   //设置LED2的引脚为P2.5
sbit LED3 =	P2^6;   //设置LED3的引脚为P2.6
sbit LED4 =	P2^7;   //设置LED4的引脚为P2.7
sbit Beep =	P1^0;   //设置Beep的引脚为P1.0

void INT0_ISR()interrupt 0  //外部中断服务函数0
{
	unsigned long int i;  //定义延时变量i

	Beep = 1;  //蜂鸣器响
  for(i = 0; i < 50000; i++);//延时
  Beep = 0;  //蜂鸣器不响
  for(i = 0; i < 50000; i++);//延时
  Beep = 1;   //蜂鸣器响
  for(i = 0; i < 50000; i++);//延时
  Beep = 0;   //蜂鸣器不响
  for(i = 0; i < 50000; i++);//延时
  Beep = 1;   //蜂鸣器响
  for(i = 0; i < 50000; i++);//延时
  Beep = 0;   //蜂鸣器不响
}

void ISR_Init() //中断初始化函数
{
	IT0 = 0;    //设置电平触发
	PX0 = 0;    //设置优先级
	EX0 = 1;    //设置外部中断使能
	EA = 1;     //中断总开关
}

void main()             //主函数
{
	unsigned long int i;          //延时变量i
	unsigned int j;               //状态变量j
	P1M0 = 0x01;                  //推挽输出
	Beep = 0;                     //蜂鸣器不响
                                
	ISR_Init();                   //调用中断初始化函数
	while(1)                      //死循环执行跑马灯
	{
		for(i = 0; i < 50000; i++); //延时
		switch(j)
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
				LED4 = ~LED4;   //LED4取反
				break;
		}
		if(j >= 3)
		{
			j = 0;
		}
		else
		j++;
	}
}



#include "STC12C5A60S2.h"
sbit LED1 = P2^4; 	  //定义LED1的引脚P2.4
sbit LED2 =	P2^5;	  //定义LED2的引脚P2.5
sbit LED3 =	P2^6;	  //定义LED3的引脚P2.6
sbit LED4 =	P2^7;	  //定义LED4的引脚P2.7

void INIT_TIMER()	  //初始化定时器
{
	TMOD = 0x01;      //设置定时器模式为16位定时器
}

void TIM_Delay10Ms(unsigned char cnt)	//延时10ms函数
{
	TH0 = 0xDC;	   //定时器0的高八位
	TL0 = 0x00;	   //定时器0的低八位
	TR0 = 1;       //开始计时
		
	while(cnt != 0)	   		//当倒计时还未到0时
	{
		if(TF0)			    //如果定时器0溢出
		{
			TF0 = 0;		//清楚标志
			TH0 = 0xDC;		//定时器0的高八位
			TL0 = 0x00;	    //定时器0的低八位
			TR0 = 1;	    //开始计时
			cnt--;		    //倒计时递减
		}			
	}
}

void LED_RUN()
{
	static unsigned char status = 0;	//函数内部静态变量用来存放状态

	switch(status)
	{
		case 0:
			LED1 = ~LED1;	 //LED1取反
			break;
		case 1:
			LED2 = ~LED2;	 //LED2取反
			break;
		case 2:			     
			LED3 = ~LED3;	 //LED3取反
			break;
		case 3:
			LED4 = ~LED4;    //LED4取反
			break;
	}

	status++;	  	//状态加1
	
	if(status > 3)  //如果状态溢出
	{
		status = 0; //重置状态
	}
}

void main()
{
	INIT_TIMER();  //初始化定时器
	
	while(1)   	   //死循环
	{
		TIM_Delay10Ms(100);	//延时1s
		LED_RUN();		    //调用流水灯函数
	} 
}
#include <STC12C5A60S2.h>		//加入STC的头文件

sbit LED1 = P2^4;   //定义LED1的引脚P2.4
sbit LED2 = P2^5;   //定义LED2的引脚P2.5
sbit LED3 = P2^6;   //定义LED3的引脚P2.6
sbit LED4 = P2^7;   //定义LED4的引脚P2.7

sbit BEEP = P1^0;   //定义蜂鸣器的引脚P1.0

void main()                 //主函数
{
	int i = 0;                //用于控制状态 
	unsigned long int delay;  //声明延时计数器delay
	P1M0 = 0x01;              //设置P1.0为推挽输出，这样蜂鸣器才会响
	
	while(1)                  //循环执行以下步骤
	{
		switch(i)
		{
			case 0:
				LED1 = ~LED1;       //对LED1状态取反
				BEEP = 0;           //蜂鸣器不响
				break;              //跳出switch
			case 1:
				LED2 = ~LED2;       //对LED2状态取反
        BEEP = 1;           //蜂鸣器响
				break;              //跳出switch
			case 2:
				LED3 = ~LED3;       //对LED3状态取反
				BEEP = 0;           //蜂鸣器不响
				break;              //跳出switch
			case 3:
				LED4 = ~LED4;       //对LED4状态取反
        BEEP = 1;           //蜂鸣器响
				break;              //跳出switch
		}
		
		if(i < 3)               //状态改变
		{
			i++;                  
		}
		else
		{
			i = 0;                
		}
		
		for(delay = 0; delay < 50000; delay++);//延时
	}
}

#include <STC12C5A60S2.h> //加入STC的头文件

sbit Key1 = P3^2;   //定义Key1的引脚P3.2
sbit Key2 = P3^4;   //定义Key2的引脚P3.4

sbit SM_G1 = P2^0;  //定义数码管1的控制引脚P2.0
sbit SM_G2 = P2^1;  //定义数码管2的控制引脚P2.1
sbit SM_G3 = P2^2;  //定义数码管3的控制引脚P2.2
sbit SM_G4 = P2^3;  //定义数码管4的控制引脚P2.3

sbit BEEP = P1^0;   //定义蜂鸣器的引脚P1.0

//控制数码管显示相应的数字
unsigned short LEDNum[10] = {0x03, 0x9F, 0x25, 0x0d, 0x99, 0x49, 0x41, 0x1F, 0x01, 0x09};

void main()     //主函数
{
	unsigned long int i = 0;          //延时器
	unsigned int num1 = 0, num2 = 0;  //计数器
	
  P1M0 = 0x01;              //设置P1.0为推挽输出，这样蜂鸣器才会响
  
	while(1)                  //循环执行以下步骤
	{
		if(Key1 == 0)           //当Key1按下时
		{
      SM_G1 = 1;            //熄灭数码管1
      SM_G2 = 1;            //熄灭数码管2
      SM_G3 = 1;            //熄灭数码管3
      SM_G4 = 0;            //点亮数码管4
      BEEP = 1;             //蜂鸣器响
      
			P0 = LEDNum[num1];    //以相应的数字点亮数码管
			num1++;
      
			if(num1 > 9)          //如果数字超过9
			{   
				num1 = 0;           //重新将数字置0
			}
			for(i = 0; i < 50000; i++); //延时
		}
		else
		{
			num1 = 0;           //重新将数字置0
			P0 = 0xFF;          //熄灭数码管
      BEEP = 0;           //蜂鸣器不响
		}
    
    if(Key2 == 0)         //如果Key2按下
    {
      SM_G1 = 1;            //熄灭数码管1
      SM_G2 = 1;            //熄灭数码管2
      SM_G3 = 0;            //点亮数码管3
      SM_G4 = 1;            //熄灭数码管4
      BEEP = 1;             //蜂鸣器响
      
      P0 = LEDNum[num2];    //以相应的数字点亮数码管
			num2++;               //数字递增
      
			if(num2 > 9)          //如果数字超过9
			{
				num2 = 0;           //重新将数字置0
			}
			for(i = 0; i < 50000; i++);   //延时
    }
    else
    {
      num2 = 0;             //重新将数字置0
			P0 = 0xFF;            //熄灭数码管
      BEEP = 0;             //蜂鸣器不响
    }
	}
}

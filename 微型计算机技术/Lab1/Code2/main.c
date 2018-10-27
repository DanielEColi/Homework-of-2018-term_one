#include <STC12C5A60S2.h>
sbit LED1 = P2^4; 
sbit LED2 =	P2^5;
sbit LED3 =	P2^6;
sbit LED4 =	P2^7;
sbit Beep =	P1^0;

void main()
{
	unsigned long int i;
	unsigned int j;
	P1M0 = 0x01;

	while(1)
	{
		for(i = 0; i < 50000; i++);
		switch(j)
		{
			case 0:
				LED1 = ~LED1;
				Beep = 0;
				break;
			case 1:
				LED2 = ~LED2;
				Beep = 1;
				break;
			case 2:
				LED3 = ~LED3;
				Beep = 0;
				break;
			case 3:
				LED4 = ~LED4;
				Beep = 1;
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
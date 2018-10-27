#include <STC12C5A60S2.h>
sbit LED1 = P2^4; 
sbit LED2 =	P2^5;
sbit LED3 =	P2^6;
sbit LED4 =	P2^7;

void main()
{
	unsigned long int i;
	unsigned int j;

	while(1)
	{
		for(i = 0; i < 50000; i++);
		switch(j)
		{
			case 0:
				LED1 = 1;
				LED2 = 1;
				LED3 = 1;
				LED4 = 1;
				break;
			case 1:
				LED1 = 0;
				LED2 = 1;
				LED3 = 1;
				LED4 = 1;
				break;
			case 2:
				LED1 = 0;
				LED2 = 0;
				LED3 = 1;
				LED4 = 1;
				break;
			case 3:
				LED1 = 0;
				LED2 = 0;
				LED3 = 0;
				LED4 = 1;
				Beep = 0;
				break;
			case 4:
				LED1 = 0;
				LED2 = 0;
				LED3 = 0;
				break;
		}
		if(j >= 4)
		{
			j = 0;
		}
		else
		j++;
	}
}
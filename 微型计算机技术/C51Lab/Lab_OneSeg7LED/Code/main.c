#include <STC12C5A60S2.h>

sbit Key1 = P3^2;

sbit SM_G1 = P2^0;
sbit SM_G2 = P2^1;
sbit SM_G3 = P2^2;
sbit SM_G4 = P2^3;

unsigned short LEDNum[10] = {0x03, 0x9F, 0x25, 0x0d, 0x99, 0x49, 0x41, 0x1F, 0x01, 0x09};

void main()
{
	unsigned long int i = 0;
	unsigned int num = 0;
	SM_G4 = 0;
	
	while(1)
	{
		if(Key1 == 0)
		{
			P0 = LEDNum[num];
			num++;
			if(num > 9)
			{
				num = 0;
			}
			for(i = 0; i < 50000; i++);
		}
		else
		{
			num = 0;
			P0 = 0xFF;
		}
	}
}

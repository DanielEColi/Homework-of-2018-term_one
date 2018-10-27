#include <STC12C5A60S2.h>

sbit Key1 = P3^2;

sbit SM_G1 = P2^0;
sbit SM_G2 = P2^1;
sbit SM_G3 = P2^2;
sbit SM_G4 = P2^3;

void main()
{
	unsigned long int i = 0;
	unsigned int num = 0;
	SM_G4 = 0;
	
	while(1)
	{
		if(Key1 == 0)
		{
			switch(num)
			{
				case 0:
					P0 = 0x03;
					break;
				case 1:
					P0 = 0x9F;
					break;
				case 2:
					P0 = 0x25;
					break;
				case 3:
					P0 = 0x0d;
					break;
				case 4:
					P0 = 0x99;
					break;
				case 5:
					P0 = 0x49;
					break;
				case 6:
					P0 = 0x41;
					break;
				case 7:
					P0 = 0x1F;
					break;
				case 8:
					P0 = 0x01;
					break;
				case 9:
					P0 = 0x09;
					break;
			}	
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

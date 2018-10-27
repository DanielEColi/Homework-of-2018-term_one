#include <STC12C5A60S2.h>

sbit Key1 = P3^2;

sbit SM_G1 = P2^0;
sbit SM_G2 = P2^1;
sbit SM_G3 = P2^2;
sbit SM_G4 = P2^3;

sbit SM_DP 	= P0^0;
sbit SM_G 	= P0^1;
sbit SM_F 	= P0^2;
sbit SM_E 	= P0^3;
sbit SM_D 	= P0^4;
sbit SM_C 	= P0^5;
sbit SM_B 	= P0^6;
sbit SM_A 	= P0^7;


void showNum(int n)
{
	switch(n)
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
			P0 = 0xc9;
			break;
		case 5:
			P0 = 0x19;
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
}

void main()
{
	int i = 0;
	int delay = 0;
	SM_G4 = 0;
	
	while(1)
	{
		showNum(i);
		i++;
		if(i >= 9)
		{
			i = 0;
		}
		for(delay = 0; delay >=50000; delay++);
	}		
}
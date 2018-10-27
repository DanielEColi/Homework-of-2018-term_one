#include <STC12C5A60S2.h>		//����STC��ͷ�ļ�

sbit LED1 = P2^4;   //����LED1������P2.4
sbit LED2 = P2^5;   //����LED2������P2.5
sbit LED3 = P2^6;   //����LED3������P2.6
sbit LED4 = P2^7;   //����LED4������P2.7

sbit BEEP = P1^0;   //���������������P1.0

void main()                 //������
{
	int i = 0;                //���ڿ���״̬ 
	unsigned long int delay;  //������ʱ������delay
	P1M0 = 0x01;              //����P1.0Ϊ��������������������Ż���
	
	while(1)                  //ѭ��ִ�����²���
	{
		switch(i)
		{
			case 0:
				LED1 = ~LED1;       //��LED1״̬ȡ��
				BEEP = 0;           //����������
				break;              //����switch
			case 1:
				LED2 = ~LED2;       //��LED2״̬ȡ��
        BEEP = 1;           //��������
				break;              //����switch
			case 2:
				LED3 = ~LED3;       //��LED3״̬ȡ��
				BEEP = 0;           //����������
				break;              //����switch
			case 3:
				LED4 = ~LED4;       //��LED4״̬ȡ��
        BEEP = 1;           //��������
				break;              //����switch
		}
		
		if(i < 3)               //״̬�ı�
		{
			i++;                  
		}
		else
		{
			i = 0;                
		}
		
		for(delay = 0; delay < 50000; delay++);//��ʱ
	}
}

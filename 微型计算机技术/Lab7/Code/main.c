#include "STC12C5A60S2.h"
sbit LED1 = P2^4; 	  //����LED1������P2.4
sbit LED2 =	P2^5;	  //����LED2������P2.5
sbit LED3 =	P2^6;	  //����LED3������P2.6
sbit LED4 =	P2^7;	  //����LED4������P2.7

void INIT_TIMER()	  //��ʼ����ʱ��
{
	TMOD = 0x01;      //���ö�ʱ��ģʽΪ16λ��ʱ��
}

void TIM_Delay10Ms(unsigned char cnt)	//��ʱ10ms����
{
	TH0 = 0xDC;	   //��ʱ��0�ĸ߰�λ
	TL0 = 0x00;	   //��ʱ��0�ĵͰ�λ
	TR0 = 1;       //��ʼ��ʱ
		
	while(cnt != 0)	   		//������ʱ��δ��0ʱ
	{
		if(TF0)			    //�����ʱ��0���
		{
			TF0 = 0;		//�����־
			TH0 = 0xDC;		//��ʱ��0�ĸ߰�λ
			TL0 = 0x00;	    //��ʱ��0�ĵͰ�λ
			TR0 = 1;	    //��ʼ��ʱ
			cnt--;		    //����ʱ�ݼ�
		}			
	}
}

void LED_RUN()
{
	static unsigned char status = 0;	//�����ڲ���̬�����������״̬

	switch(status)
	{
		case 0:
			LED1 = ~LED1;	 //LED1ȡ��
			break;
		case 1:
			LED2 = ~LED2;	 //LED2ȡ��
			break;
		case 2:			     
			LED3 = ~LED3;	 //LED3ȡ��
			break;
		case 3:
			LED4 = ~LED4;    //LED4ȡ��
			break;
	}

	status++;	  	//״̬��1
	
	if(status > 3)  //���״̬���
	{
		status = 0; //����״̬
	}
}

void main()
{
	INIT_TIMER();  //��ʼ����ʱ��
	
	while(1)   	   //��ѭ��
	{
		TIM_Delay10Ms(100);	//��ʱ1s
		LED_RUN();		    //������ˮ�ƺ���
	} 
}
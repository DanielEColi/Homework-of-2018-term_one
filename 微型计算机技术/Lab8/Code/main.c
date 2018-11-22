#include "STC12C5A60S2.h"

sbit LED1 =  P2^4;    //����LED1������P2.4
sbit LED2 =  P2^5;    //����LED2������P2.5
sbit LED3 =  P2^6;    //����LED3������P2.6
sbit LED4 =  P2^7;    //����LED4������P2.7
sbit Beep =  P1^0;    //����Beep������P1.0

void PERIPHERAL_Init()
{
  P1M0 = 0x01;  //�������������
  LED1 = 1;     //LED1��
  LED2 = 1;     //LED2��
  LED3 = 1;     //LED3��
  LED4 = 1;     //LED4��
  Beep = 0;     //����������
}

void ISR_Init()
{
  IT0 = 0;    //������ʽ����ƽ����
  PX0 = 0;    //�ⲿ�ж����ȼ�����
  EX0 = 1;    //���ⲿ�ж�0
  EA =  1;    //���ж������ܿ���
}

void TIMER_Init()    //��ʼ����ʱ���ж�
{
  EA = 1;       //���ж������ܿ���  
  ET0 = 1;      //�򿪶�ʱ��0�ж�
  PT0 = 0;      //��ʱ���ж����ȼ�����
  TMOD = 0x01;  //���ö�ʱ��ģʽΪ16λ��ʱ��
  TF0 = 0;      //�����־
  TH0 = 0xDC;   //��ʱ��0�ĸ߰�λ
  TL0 = 0x00;   //��ʱ��0�ĵͰ�λ
  TR0 = 1;      //��ʼ��ʱ
}

void LED_RUN()
{
  static unsigned char status = 0;  //�����ڲ���̬�����������״̬

  switch(status)
  {
    case 0:
      LED1 = ~LED1;   //LED1ȡ��
      break;
    case 1:
      LED2 = ~LED2;   //LED2ȡ��
      break;
    case 2:           
      LED3 = ~LED3;   //LED3ȡ��
      break;
    case 3:
      LED4 = ~LED4;    //LED4ȡ��
      break;
  }

  status++;      //״̬��1
  
  if(status > 3)  //���״̬���
  {
    status = 0; //����״̬
  }
}

void INT0_ISR()interrupt 0
{
  unsigned long int i;

  Beep = 0;
  for(i = 0; i < 50000; i++);//�����ʱ
  Beep = 1;   //��������
  for(i = 0; i < 50000; i++);//�����ʱ
  Beep = 0;
  for(i = 0; i < 50000; i++);//�����ʱ
  Beep = 1;   //��������
  for(i = 0; i < 50000; i++);//�����ʱ
  Beep = 0;
}

void INT1_TIMER0() interrupt 1        //��ʱ��0�ж�
{
  static unsigned char counter = 0;   //��̬����counter

  TF0 = 0;                    //�����־
  TH0 = 0xDC;                 //��ʱ��0�ĸ߰�λ
  TL0 = 0x00;                 //��ʱ��0�ĵͰ�λ
  TR0 = 1;                    //��ʼ��ʱ

  counter++;                  //��ʱ����1
  if(counter >= 100)          //�������ӵ�100
  {
    LED_RUN();                //��������ƺ���
    counter = 0;              //������counter����
  }
}

void main()
{
  PERIPHERAL_Init();//��ʼ������
  ISR_Init();       //��ʼ���ⲿ�ж�0
  TIMER_Init();     //��ʼ����ʱ��0�ж�
  
  while(1)          //ѭ���ȴ��ж�
  {
  } 
}
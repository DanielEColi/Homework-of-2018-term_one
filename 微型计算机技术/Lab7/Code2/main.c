#include "STC12C5A60S2.h"

sbit SM_G4 = P2^3;     

unsigned char Seg7Disp[10] = {0x03, 0x9F, 0x25, 0x0d, 0x99, 0x49, 0x41, 0x1F, 0x01, 0x09};

void INIT_SEG7()
{
  SM_G4 = 0;          //�����һ���������ʾ
  P0 = 0xFF;          //�����Ϩ��
}
void INIT_TIMER()     //��ʼ����ʱ��
{ 

     
  EA = 1;       //���ж������ܿ���  
  ET0 = 1;      //�򿪶�ʱ��0�ж�
  TMOD = 0x01;  //���ö�ʱ��ģʽΪ16λ��ʱ��
  TF0 = 0;      //�����־
  TH0 = 0xDC;   //��ʱ��0�ĸ߰�λ
  TL0 = 0x00;   //��ʱ��0�ĵͰ�λ
  TR0 = 1;      //��ʼ��ʱ
}

void Timer0() interrupt 1           //��ʱ��0�ж�
{
  static unsigned char counter = 0; //��̬����counter
  static unsigned char i = 0;       //��̬����i

  TF0 = 0;                  //�����־
  TH0 = 0xDC;               //��ʱ��0�ĸ߰�λ
  TL0 = 0x00;               //��ʱ��0�ĵͰ�λ
  TR0 = 1;                  //��ʼ��ʱ

  counter++;                //��ʱ����1
  if(counter >= 100)        //�������ӵ�100
  {
    P0 = Seg7Disp[i];       //�����߶������
    i++;                    //i����
    if(i >= 10)             //��i���ڻ����10��ʱ��
    {
      i = 0;                //��i����
    }
    counter = 0;            //������counter����
  }
}

void main()       //������
{
  INIT_SEG7();    //��ʼ���߶������
  INIT_TIMER();   //��ʼ����ʱ��
  
  while(1)        //��ѭ��
  {

  } 
}
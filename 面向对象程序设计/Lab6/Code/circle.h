//circle.h

#ifndef _CIRCLE_H_
#define _CIRCLE_H_

#define PI 3.1415926  //����Բ���ʵĴ�С

class CCircle				
{
private:
	float radius;					 //�뾶
	float point_x, point_y; //Բ��
	float area;				    //���
	char *name;					//����
	static int num;				//Բ�ĸ���
	static float allArea;		//Բ�������
public:
	CCircle();						//�޲ι��캯��
	CCircle(float i_radius, float i_px, float i_py, const char *i_name);//�вι��캯��
	CCircle(const CCircle &i_circle);	//�������캯��
	~CCircle();					//��������
	void printCircle(void);	//��ӡԲ����Ϣ
	float getArea(void);		//��ȡԲ�����
	void move(float offset_x, float offset_y);	//ƽ��
	bool zoom(float ratio);	//����
	float getOverlapArea(const CCircle &i_circle);	//��������Բ���ص����
	char* getName();			//��ȡԲ������
	static float getAverageArea(void);	//��ȡƽ�����
};

#endif
//circle.cpp

#include <iostream>
#include <math.h>
#include "circle.h"
using namespace std;

#define max(a,b) (((a) > (b)) ? (a) : (b))	//�����ֵ����

int CCircle::num = 0;				//��ʼ����̬����num
float CCircle::allArea = 0;		//��ʼ����̬����allArea

CCircle::CCircle()
{
	radius = 1;								//Ĭ�ϰ뾶Ϊ1
	point_x = 0;							//Ĭ��Բ����ԭ��
	point_y = 0;
	area = radius * radius * PI;	//������
	name = new char[strlen("default") + 1];	//�����ڴ�ռ�
	strcpy(name, "default");							//�����ַ���
	num++;									//Բ����Ŀ��1
	allArea += area;					//���������
}

CCircle::CCircle(float i_radius, float i_px, float i_py, const char *i_name)
{
	radius = i_radius;					//�뾶
	point_x = i_px;						//Բ��
	point_y = i_py;
	name = new char [strlen(i_name) + 1];	//�����ڴ�ռ�
	strcpy(name, i_name);			//�����ַ���
	area = radius * radius * PI;	//������
	num++;									//Բ����Ŀ��1
	allArea += area;					//���������
}

CCircle::CCircle(const CCircle &i_circle)
{
	char cpyName[20] = "COPY_";		//��ʼ���ַ���ǰ׺

	radius = i_circle.radius;				//�뾶
	point_x = i_circle.point_x;			//Բ��
	point_y = i_circle.point_y;
	strcat(cpyName, i_circle.name);	//�ַ���ƴ��
	name = new char [strlen(cpyName) + 1];	//�����ڴ�ռ�
	strcpy(name, cpyName);				//�����ַ�����name
	area = radius * radius * PI;			//������
	num++;											//Բ����Ŀ��1
	allArea += area;							//���������
}

CCircle::~CCircle()
{
	num--;					//Բ����Ŀ��1
	allArea -= area;	//���������
	delete[]name;		//�ͷ�ָ��
}

void CCircle::printCircle()
{
	cout << "------------------------------" << endl;
	cout << "���֣�" << name << endl;
	cout << "�뾶��" << radius << endl;
	cout << "Բ�ģ�[" << point_x << ", " << point_y << "]" << endl;
	cout << "�����" << area << endl;
	cout << "------------------------------" << endl;
}

float CCircle::getArea(void)
{
	return area;		//���������ֵ
}

void CCircle::move(float offet_x, float offset_y)
{
	point_x += offet_x;		//x����ƫ����
	point_y += offset_y;	//y����ƫ����
}

bool CCircle::zoom(float ratio)
{
	if(ratio <= 0)					//������С��0ʱ
	{
		cout << "���ű���С��0������" << endl;//��ӡ����
		return false;				//���ش���
	}

	allArea -= area;			//�ȼ�ȥԭ�������
	radius = radius * ratio;	//�԰뾶��������
	area = radius * radius * PI;	//������
	allArea += area;			//�����µ����

	return true;					//������ȷ
}

float CCircle::getOverlapArea(const CCircle &i_circle)
{
	float S_overlap = 0;
	float centerDistance;

	//��Բ�ľ�
	centerDistance = sqrt(pow(point_x - i_circle.point_x, 2) + pow(point_y - i_circle.point_y, 2));

	if (centerDistance >= radius + i_circle.radius)	//������ཻ
	{
		cout << name << " �� " << i_circle.name << " ���ཻ" << endl;
		S_overlap = 0;
		return 0;
	}
	else if (centerDistance <= abs(radius - i_circle.radius))	//����໥����
	{
		if (radius < i_circle.radius)		//�뾶С�ı�����
		{
			cout << name << " ������ "  << i_circle.name << endl;
			S_overlap = area;
		}
		else if (radius > i_circle.radius)
		{
			cout << i_circle.name << " ������ " << name << endl;
			S_overlap = i_circle.area;
		}
		else if (radius == i_circle.radius)		//�뾶��ȼ��ص�
		{
			cout << name << " �� " << i_circle.name << " �պ��غ�" << endl;
			S_overlap = area;
		}
	}
	else //�ཻ
	{
		float height1 = radius * radius + centerDistance * centerDistance - i_circle.radius*i_circle.radius;
		float height2 = i_circle.radius*i_circle.radius + centerDistance * centerDistance - radius * radius;
		float thita1 = 2 * acos(height1 / (2 * radius*centerDistance));
		float thita2 = 2 * acos(height2 / (2 * i_circle.radius*centerDistance));

		float S_arch1 = radius * radius * (thita1 / 2 - sin(thita1) / 2);
		float S_arch2 = i_circle.radius * i_circle.radius * (thita2 / 2 - sin(thita2) / 2);

		S_overlap = S_arch1 + S_arch2;
		cout << name << " �� " << i_circle.name << " �ཻ" << endl;
	}	

	return S_overlap;
}

char* CCircle::getName()
{
	return name;					//����nameָ��
}

 float CCircle::getAverageArea(void)
{
	 return allArea / num;		//����ƽ�����
}
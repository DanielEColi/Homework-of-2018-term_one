//main.cpp

#include <iostream>
#include "circle.h"
using namespace std;

int main()
{
	CCircle a, b(2.5,0,0,"circle1"), c(1, 1, 0, "circle2");
	CCircle d(c);			//����c����d

	a.getArea();
	b.getArea();
	c.getArea();
	d.getArea();

	//a.printCircle();		//��ӡԲa�����
	//b.printCircle();		//��ӡԲb�����
	//c.printCircle();		//��ӡԲc�����
	//d.printCircle();		//��ӡԲd�����
	//cout << endl << "ƽ�����: " << CCircle::getAverageArea() << endl << endl;		//��ӡƽ�����
	//cout << a.getName() << "��" <<  b.getName() << " ���ص����:" << a.getOverlapArea(b) << endl << endl;
	//cout << a.getName() << "��" << c.getName() << " ���ص����:" << a.getOverlapArea(c) << endl << endl;
	//cout << a.getName() << "��" << d.getName() << " ���ص����:" << a.getOverlapArea(d) << endl << endl;
	//cout << b.getName() << "��" << c.getName() << " ���ص����:" << b.getOverlapArea(c) << endl << endl;
	//cout << b.getName() << "��" << d.getName() << " ���ص����:" << b.getOverlapArea(d) << endl << endl;
	//cout << c.getName() << "��" << d.getName() << " ���ص����:" << c.getOverlapArea(d) << endl << endl;

	//cout << "-----------------------------------------------------------" << endl;
	//a.move(1, 1);		//ƽ��Բa
	//b.zoom(2);		//����Բb
	//c.move(-1, -3);	//ƽ��Բc
	//d.zoom(0.5);		//����Բd

	//a.printCircle();		//��ӡԲa�����
	//b.printCircle();		//��ӡԲb�����
	//c.printCircle();		//��ӡԲc�����
	//d.printCircle();		//��ӡԲd�����
	//cout << endl << "ƽ�����: " << CCircle::getAverageArea() << endl << endl;	//��ӡƽ�����
	//cout << a.getName() << "��" << b.getName() << " ���ص����:" << a.getOverlapArea(b) << endl << endl;
	//cout << a.getName() << "��" << c.getName() << " ���ص����:" << a.getOverlapArea(c) << endl << endl;
	//cout << a.getName() << "��" << d.getName() << " ���ص����:" << a.getOverlapArea(d) << endl << endl;
	//cout << b.getName() << "��" << c.getName() << " ���ص����:" << b.getOverlapArea(c) << endl << endl;
	//cout << b.getName() << "��" << d.getName() << " ���ص����:" << b.getOverlapArea(d) << endl << endl;
	//cout << c.getName() << "��" << d.getName() << " ���ص����:" << c.getOverlapArea(d) << endl << endl;

	return 0;
}
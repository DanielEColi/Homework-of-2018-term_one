//main.cpp

#include <iostream>
#include "circle.h"
using namespace std;

int main()
{
	CCircle a, b(2.5,0,0,"circle1"), c(1, 1, 0, "circle2");
	CCircle d(c);			//拷贝c构造d

	a.getArea();
	b.getArea();
	c.getArea();
	d.getArea();

	//a.printCircle();		//打印圆a的面积
	//b.printCircle();		//打印圆b的面积
	//c.printCircle();		//打印圆c的面积
	//d.printCircle();		//打印圆d的面积
	//cout << endl << "平均面积: " << CCircle::getAverageArea() << endl << endl;		//打印平均面积
	//cout << a.getName() << "和" <<  b.getName() << " 的重叠面积:" << a.getOverlapArea(b) << endl << endl;
	//cout << a.getName() << "和" << c.getName() << " 的重叠面积:" << a.getOverlapArea(c) << endl << endl;
	//cout << a.getName() << "和" << d.getName() << " 的重叠面积:" << a.getOverlapArea(d) << endl << endl;
	//cout << b.getName() << "和" << c.getName() << " 的重叠面积:" << b.getOverlapArea(c) << endl << endl;
	//cout << b.getName() << "和" << d.getName() << " 的重叠面积:" << b.getOverlapArea(d) << endl << endl;
	//cout << c.getName() << "和" << d.getName() << " 的重叠面积:" << c.getOverlapArea(d) << endl << endl;

	//cout << "-----------------------------------------------------------" << endl;
	//a.move(1, 1);		//平移圆a
	//b.zoom(2);		//缩放圆b
	//c.move(-1, -3);	//平移圆c
	//d.zoom(0.5);		//缩放圆d

	//a.printCircle();		//打印圆a的面积
	//b.printCircle();		//打印圆b的面积
	//c.printCircle();		//打印圆c的面积
	//d.printCircle();		//打印圆d的面积
	//cout << endl << "平均面积: " << CCircle::getAverageArea() << endl << endl;	//打印平均面积
	//cout << a.getName() << "和" << b.getName() << " 的重叠面积:" << a.getOverlapArea(b) << endl << endl;
	//cout << a.getName() << "和" << c.getName() << " 的重叠面积:" << a.getOverlapArea(c) << endl << endl;
	//cout << a.getName() << "和" << d.getName() << " 的重叠面积:" << a.getOverlapArea(d) << endl << endl;
	//cout << b.getName() << "和" << c.getName() << " 的重叠面积:" << b.getOverlapArea(c) << endl << endl;
	//cout << b.getName() << "和" << d.getName() << " 的重叠面积:" << b.getOverlapArea(d) << endl << endl;
	//cout << c.getName() << "和" << d.getName() << " 的重叠面积:" << c.getOverlapArea(d) << endl << endl;

	return 0;
}
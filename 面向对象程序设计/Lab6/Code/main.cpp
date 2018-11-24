#include <iostream>
#include "circle.h"
using namespace std;

int main()
{
	CCircle a, b(2.5,0,0,"circle1"), c(1, 1, 0, "circle2");
	CCircle d(c);
	b.printCircle();
	c.printCircle();
	cout << "重叠面积:" << b.getOverlapArea(c) << endl;
	cout << "平均面积: " << CCircle::getAverageArea() << endl;

	return 0;
}
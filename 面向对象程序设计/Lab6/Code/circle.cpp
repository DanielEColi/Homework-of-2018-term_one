#include <iostream>
#include <math.h>
#include "circle.h"
using namespace std;

#define max(a,b) (((a) > (b)) ? (a) : (b))

int CCircle::num = 0;
float CCircle::allArea = 0;

CCircle::CCircle()
{
	radius = 1;
	point_x = 0;
	point_y = 0;
	area = radius * radius * PI;
	name = new char[strlen("default") + 1];
	strcpy(name, "default");
	num++;
	allArea += area;
}

CCircle::CCircle(float i_radius, float i_px, float i_py, const char *i_name)
{
	radius = i_radius;
	point_x = i_px;
	point_y = i_py;
	name = new char [strlen(i_name) + 1];
	strcpy(name, i_name);
	area = radius * radius * PI;
	num++;
	allArea += area;
}

CCircle::CCircle(const CCircle &i_circle)
{
	radius = i_circle.radius;
	point_x = i_circle.point_x;
	point_y = i_circle.point_y;
	name = new char [strlen(i_circle.name) + 1];
	strcpy(name, i_circle.name);
	area = radius * radius * PI;
	num++;
	allArea += area;
}

CCircle::~CCircle()
{
	num--;
	allArea -= area;
	delete[]name;
}

void CCircle::printCircle()
{
	cout << "------------------------------" << endl;
	cout << "名字：" << name << endl;
	cout << "半径：" << radius << endl;
	cout << "圆心：[" << point_x << ", " << point_y << "]" << endl;
	cout << "面积：" << area << endl;
	cout << "------------------------------" << endl;
}

float CCircle::getArea(void)
{
	return area;
}

bool CCircle::move(float offet_x, float offset_y)
{
	point_x += offet_x;
	point_y += offset_y;

	return true;
}

bool CCircle::zoom(float ratio)
{
	if(ratio <= 0)
	{
		cout << "缩放比例小于0，错误！" << endl;
		return false;
	}

	allArea -= area;
	radius = radius * ratio;
	area = radius * radius * PI;
	allArea += area;

	return true;
}

float CCircle::getOverlapArea(const CCircle &i_circle)
{
	float S_overlap = 0;
	float centerDistance;

	centerDistance = sqrt(pow(point_x - i_circle.point_x, 2) + pow(point_y - i_circle.point_y, 2));

	if (centerDistance >= radius + i_circle.radius)
	{
		//cout << name << " 和 " << i_circle.name << " 不相交" << endl;
		//cout << "重叠面积为：0" << endl;
		S_overlap = 0;
		return 0;
	}
	else if (centerDistance <= abs(radius - i_circle.radius))
	{
		if (radius < i_circle.radius)
		{
			//cout << name << " 包含于 "  << i_circle.name << endl;
			//cout << "重叠面积为：" << area << endl;
			S_overlap = area;
		}
		else if (radius > i_circle.radius)
		{
			//cout << i_circle.name << " 包含于 " << name << endl;
			//cout << "重叠面积为：" << i_circle.area << endl;
			S_overlap = i_circle.area;
		}
		else if (radius == i_circle.radius)
		{
			//cout << name << " 和 " << i_circle.name << " 刚好重合" << endl;
			//cout << "重叠面积为：" << area << endl;
			S_overlap = area;
		}
	}
	else 
	{
		float height1 = radius * radius + centerDistance * centerDistance - i_circle.radius*i_circle.radius;
		float height2 = i_circle.radius*i_circle.radius + centerDistance * centerDistance - radius * radius;
		float thita1 = 2 * acos(height1 / (2 * radius*centerDistance));
		float thita2 = 2 * acos(height2 / (2 * i_circle.radius*centerDistance));

		//cout << "thita1:" << (thita1 * 180 / PI) << endl;
		//cout << "thita2:" << (thita2 * 180 / PI) << endl;

		float S_arch1 = radius * radius * (thita1 / 2 - sin(thita1) / 2);
		float S_arch2 = i_circle.radius * i_circle.radius * (thita2 / 2 - sin(thita2) / 2);

		//cout << "S_arch1:" << S_arch1 << endl;
		//cout << "S_arch2:" << S_arch2 << endl;

		S_overlap = S_arch1 + S_arch2;
		//cout << name << " 和 " << i_circle.name << " 相交" << endl;
		//cout << "重叠面积：" << S_arch1 + S_arch2 << endl;	
	}	

	return S_overlap;
}

 float CCircle::getAverageArea(void)
{
	 return allArea / num;
}
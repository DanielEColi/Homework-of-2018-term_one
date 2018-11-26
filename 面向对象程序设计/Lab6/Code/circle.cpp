//circle.cpp

#include <iostream>
#include <math.h>
#include "circle.h"
using namespace std;

#define max(a,b) (((a) > (b)) ? (a) : (b))	//求最大值函数

int CCircle::num = 0;				//初始化静态变量num
float CCircle::allArea = 0;		//初始化静态变量allArea

CCircle::CCircle()
{
	radius = 1;								//默认半径为1
	point_x = 0;							//默认圆心在原点
	point_y = 0;
	area = radius * radius * PI;	//求得面积
	name = new char[strlen("default") + 1];	//申请内存空间
	strcpy(name, "default");							//复制字符串
	num++;									//圆的数目加1
	allArea += area;					//更新总面积
}

CCircle::CCircle(float i_radius, float i_px, float i_py, const char *i_name)
{
	radius = i_radius;					//半径
	point_x = i_px;						//圆心
	point_y = i_py;
	name = new char [strlen(i_name) + 1];	//申请内存空间
	strcpy(name, i_name);			//复制字符串
	area = radius * radius * PI;	//求得面积
	num++;									//圆的数目加1
	allArea += area;					//更新总面积
}

CCircle::CCircle(const CCircle &i_circle)
{
	char cpyName[20] = "COPY_";		//初始化字符串前缀

	radius = i_circle.radius;				//半径
	point_x = i_circle.point_x;			//圆心
	point_y = i_circle.point_y;
	strcat(cpyName, i_circle.name);	//字符串拼接
	name = new char [strlen(cpyName) + 1];	//申请内存空间
	strcpy(name, cpyName);				//复制字符串到name
	area = radius * radius * PI;			//求得面积
	num++;											//圆的数目加1
	allArea += area;							//更新总面积
}

CCircle::~CCircle()
{
	num--;					//圆的数目减1
	allArea -= area;	//更新总面积
	delete[]name;		//释放指针
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
	return area;		//返回面积的值
}

void CCircle::move(float offet_x, float offset_y)
{
	point_x += offet_x;		//x加上偏移量
	point_y += offset_y;	//y加上偏移量
}

bool CCircle::zoom(float ratio)
{
	if(ratio <= 0)					//当比例小于0时
	{
		cout << "缩放比例小于0，错误！" << endl;//打印错误
		return false;				//返回错误
	}

	allArea -= area;			//先减去原来的面积
	radius = radius * ratio;	//对半径进行缩放
	area = radius * radius * PI;	//求得面积
	allArea += area;			//加上新的面积

	return true;					//返回正确
}

float CCircle::getOverlapArea(const CCircle &i_circle)
{
	float S_overlap = 0;
	float centerDistance;

	//求圆心距
	centerDistance = sqrt(pow(point_x - i_circle.point_x, 2) + pow(point_y - i_circle.point_y, 2));

	if (centerDistance >= radius + i_circle.radius)	//如果不相交
	{
		cout << name << " 和 " << i_circle.name << " 不相交" << endl;
		S_overlap = 0;
		return 0;
	}
	else if (centerDistance <= abs(radius - i_circle.radius))	//如果相互包含
	{
		if (radius < i_circle.radius)		//半径小的被包含
		{
			cout << name << " 包含于 "  << i_circle.name << endl;
			S_overlap = area;
		}
		else if (radius > i_circle.radius)
		{
			cout << i_circle.name << " 包含于 " << name << endl;
			S_overlap = i_circle.area;
		}
		else if (radius == i_circle.radius)		//半径相等即重叠
		{
			cout << name << " 和 " << i_circle.name << " 刚好重合" << endl;
			S_overlap = area;
		}
	}
	else //相交
	{
		float height1 = radius * radius + centerDistance * centerDistance - i_circle.radius*i_circle.radius;
		float height2 = i_circle.radius*i_circle.radius + centerDistance * centerDistance - radius * radius;
		float thita1 = 2 * acos(height1 / (2 * radius*centerDistance));
		float thita2 = 2 * acos(height2 / (2 * i_circle.radius*centerDistance));

		float S_arch1 = radius * radius * (thita1 / 2 - sin(thita1) / 2);
		float S_arch2 = i_circle.radius * i_circle.radius * (thita2 / 2 - sin(thita2) / 2);

		S_overlap = S_arch1 + S_arch2;
		cout << name << " 和 " << i_circle.name << " 相交" << endl;
	}	

	return S_overlap;
}

char* CCircle::getName()
{
	return name;					//返回name指针
}

 float CCircle::getAverageArea(void)
{
	 return allArea / num;		//返回平均面积
}
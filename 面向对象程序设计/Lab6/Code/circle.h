//circle.h

#ifndef _CIRCLE_H_
#define _CIRCLE_H_

#define PI 3.1415926  //定义圆周率的大小

class CCircle				
{
private:
	float radius;					 //半径
	float point_x, point_y; //圆心
	float area;				    //面积
	char *name;					//名字
	static int num;				//圆的个数
	static float allArea;		//圆的总面积
public:
	CCircle();						//无参构造函数
	CCircle(float i_radius, float i_px, float i_py, const char *i_name);//有参构造函数
	CCircle(const CCircle &i_circle);	//拷贝构造函数
	~CCircle();					//析构函数
	void printCircle(void);	//打印圆的信息
	float getArea(void);		//获取圆的面积
	void move(float offset_x, float offset_y);	//平移
	bool zoom(float ratio);	//缩放
	float getOverlapArea(const CCircle &i_circle);	//计算两个圆的重叠面积
	char* getName();			//获取圆的名字
	static float getAverageArea(void);	//获取平均面积
};

#endif
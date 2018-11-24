#ifndef _CIRCLE_H_
#define _CIRCLE_H_

#define PI 3.1415926

class CCircle
{
private:
	float radius;
	float point_x, point_y;
	float area;
	char *name;
	static int num;
	static float allArea;
public:
	CCircle();
	CCircle(float i_radius, float i_px, float i_py, const char *i_name);
	CCircle(const CCircle &i_circle);
	~CCircle();
	void printCircle(void);
	float getArea(void);
	bool move(float offset_x, float offset_y);
	bool zoom(float ratio);
	float getOverlapArea(const CCircle &i_circle);
	static float getAverageArea(void);
};

#endif
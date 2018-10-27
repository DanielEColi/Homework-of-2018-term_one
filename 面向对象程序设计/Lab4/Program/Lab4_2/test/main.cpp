#include <iostream>
using namespace std;

int method0(int *a, int &b)
{
	int c;

	c = (*a)*(*a)+b*b;

	return c;
}

int method1(int a, int b)
{
	int c;

	c = a*a+b*b;

	return c;
}

int method2(int &a, int &b)
{
	int c;

	c = a*a+b*b;

	return c;
}

int method3(int *a, int *b)
{
	int c;

	c = (*a)*(*a)+(*b)*(*b);

	return c;
}

int method4(int a, int &b)
{
	int c;

	c = a*a+b*b;

	return c;
}

int method5(int a, int *b)
{
	int c;

	c = a*a+(*b)*(*b);

	return c;
}

int &method5(int a, int b)
{
	int c;

	c = a*a+b*b;

	return c;
}

int *method6(int a, int b)
{
	int c;

	c = a*a+b*b;

	return &c;
}

void method7(int a, int b, int &c)
{
	c = a*a+b*b;
}

void method8(int &a, int &b, int &c)
{
	c = a*a+b*b;
}

void method9(int a, int b, int *c)
{
	*c = a*a+b*b;
}

void method10(int *a, int *b, int *c)
{
	*c = (*a)*(*a)+(*b)*(*b);
}

void method11(int a, int &b, int *c)
{
	*c = a*a+b*b;
}

int main()
{
	int a = 2, b = 5, c;
	int &q_a = a, &q_b = b, &q_c = c;
	int *p_a = &a, *p_b = &b, *p_c = &c;

	p_c = method6(a, b);

	cout << *p_c << endl;

	return 0;
}

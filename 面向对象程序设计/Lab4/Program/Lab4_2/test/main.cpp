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

int &method6(int &a, int &b)
{
	int c;

	c = a*a+b*b;

	return c;
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

  c = method0(p_a, b);
  cout << "method0: c = " << c << endl;
  c = method1(a, b);
  cout << "method1: c = " << c << endl;
  c = method2(a, b);
  cout << "method2: c = " << c << endl;
  c = method3(p_a, p_b);
  cout << "method3: c = " << c << endl;
  c = method4(a, b);
  cout << "method4: c = " << c << endl;
  c = method5(a, b);
  cout << "method5: c = " << c << endl;
  c = method6(a, b);
  cout << "method6: c = " << c << endl;
  method7(a, b, c);
  cout << "method7: c = " << c << endl;
  method8(a, b, c);
  cout << "method8: c = " << c << endl;
  method9(a, b, p_c);
  cout << "method9: c = " << c << endl;
  method10(p_a, p_b, p_c);
  cout << "method10: c = " << c << endl;
  method11(a, b, p_c);
  cout << "method11: c = " << c << endl;

  system("pause");
	return 0;
}

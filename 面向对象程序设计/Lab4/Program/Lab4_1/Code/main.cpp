#include <iostream>
using namespace std;

int *Square(int a)
{
	int b;
	b = a * a;
	
	return &b;
}

int main()
{
	int c = 10;
	int *p;
	
	p = Square(c);
	
	cout << *p << endl;
  cout << *p << endl;
  cout << *p << endl;

  return 0;
}

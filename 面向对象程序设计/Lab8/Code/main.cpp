//main.cpp
#include <iostream>
#include "MyString.h"
using namespace std; //使用命名空间std

int main()
{
	CMyString a("abc"), b("def"), c; //声明对象
	c = a + b;    //使用符号“+”和“=”
	a += b;       //使用符号“+=”
	
	cout << "a : ";
	a.printStr(); //打印字符串a
	cout << endl << "b : ";
	b.printStr(); //打印字符串b
	cout << endl << "c : ";
	c.printStr(); //打印字符串c
	cout << endl;

	return 0;
}
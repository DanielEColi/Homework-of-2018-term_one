//MyString.cpp
#include <iostream>   
#include "MyString.h" //包含对应的头文件
using namespace std;  //使用命名空间std

CMyString::CMyString() //无参构造函数
{
	mystr = NULL;        //默认字符串为空
	length = 0;          //默认长度为0
}

CMyString::CMyString(const char* i_string) //有参构造函数
{	
	length = strlen(i_string);    //长度为传入字字符串的长度
	mystr = new char[length + 1]; //申请足够的内存空间
	
	if (mystr)                    //如果申请成功
	{
		strcpy(mystr, i_string);    //调用拷贝字符串函数
	}
}

CMyString::CMyString(const CMyString &copy) //拷贝构造函数
{
	length = strlen(copy.mystr);  //长度为拷贝对象的字符串的长度
	mystr = new char[length + 1]; //申请足够的内存空间
	
	if (mystr)                    //如果申请成功
	{
		strcpy(mystr, copy.mystr);  //调用拷贝字符串函数
	}
}

CMyString::~CMyString()         //析构函数
{
	delete[]mystr;                //释放内存空间
}

CMyString CMyString::operator= (const CMyString &operand) //重载运算符“=”
{	
	length = strlen(operand.mystr); //长度为赋值对象的字符串的长度
	mystr = new char[length + 1];   //申请足够的内存空间
	
	if (mystr)                      //如果申请成功
	{
		strcpy(mystr, operand.mystr); //调用拷贝字符串函数
	}
	
	return *this;                   //返回自身
}

CMyString CMyString::operator+ (const CMyString &operand) //重载运算符“+”
{
	CMyString tmp;     //用来存放相加的结果
	
	tmp.length = this->length + operand.length; //长度为原长度加上另一个对象的字符串的长度的值
	tmp.mystr = new char[tmp.length + 1];       //申请足够的内存空间
	
	if (tmp.mystr)                              //如果申请成功
	{
		strcpy(tmp.mystr, this->mystr);           //先拷贝
		strcat(tmp.mystr, operand.mystr);         //再拼接
	}
	
	return tmp;        //返回相加的结果
}

CMyString CMyString::operator+= (const CMyString &operand) //重载运算符“+=”
{
	CMyString tmp(*this); //拷贝构造一个临时对象
	delete[]mystr;        //释放原来的内存空间
	length += strlen(operand.mystr);  //长度为原长度加上另一个对象的字符串的长度的值
	mystr = new char[length + 1];     //申请足够的内存空间
	
	if (mystr)                        //如果申请成功
	{
		strcpy(mystr, tmp.mystr);       //先拷贝
		strcat(mystr, operand.mystr);   //再拼接
	}
	
	return *this;         //返回自身
}

void CMyString::printStr()
{
	cout << mystr;   //打印
}
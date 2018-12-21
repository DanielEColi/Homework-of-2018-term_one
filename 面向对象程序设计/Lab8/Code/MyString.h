//MyString.h
#ifndef _MY_STRING_H_
#define _MY_STRING_H_

class CMyString
{
private:
	char *mystr;   //字符串指针
	int length;    //字符串长度
public:
	CMyString();   //无参构造函数
	CMyString(const char* i_string);  //有参构造函数
	CMyString(const CMyString &copy); //拷贝构造函数
	~CMyString();  //析构函数
	CMyString operator= (const CMyString &operand); //重载运算符“=”
	CMyString operator+ (const CMyString &operand); //重载运算符“+”
	CMyString operator+= (const CMyString &operand);//重载运算符“+=”
	void printStr();  //打印
};

#endif
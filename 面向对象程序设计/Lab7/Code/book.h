#ifndef  _BOOK_H_
#define _BOOK_H_

#include <iostream>
using namespace std;

class CBook
{
protected:
	static int book_num;
	char *book_name;
	float price;
	
public:
	CBook();
	CBook(const char *i_name, float i_price);
	CBook(const CBook &copy_c);
	~CBook();
	void printInfo(void);
	static void printAllNum(void);
};



#endif
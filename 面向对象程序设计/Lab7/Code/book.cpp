#include "book.h"

int CBook::book_num = 0;


CBook::CBook()
{
	book_name = NULL;
	price = 0;
	book_num++;
}

CBook::CBook(const char *i_name, float i_price)
{
	book_name = new char[strlen(i_name) + 1];
	if (book_name != NULL)
	{
		strcpy(book_name, i_name);
	}
	price = i_price;
	book_num++;
}

CBook::CBook(const CBook &copy_c)
{
	book_name = new char[strlen(copy_c.book_name) + 1];
	if (book_name != NULL)
	{
		strcpy(book_name, copy_c.book_name);
	}
	price = copy_c.price;
	book_num++;
}

CBook::~CBook()
{
	cout << "Deconstruct Basic:" << book_name << endl;
	if(book_name != NULL)
	{
		delete []book_name;
	}
	book_num--;
}

void CBook::printInfo(void)
{
	cout << "书名：" << book_name << endl;
	cout << "价格：" << price << endl;
}

void CBook::printAllNum(void)
{
	cout << "书的总数目为：" << book_num << endl;
}

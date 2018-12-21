#include "book.h"

int CBook::book_num = 0;


CBook::CBook()
{
	book_name = NULL;
	price = 0;
	book_num++;
	cout << "Base nil para construct! " << endl;
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
	cout << "Base para construct "  << book_name << endl;
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
	cout << "Base copy construct " << book_name << endl;
}

CBook::~CBook()
{
	cout << "Deconstruct base:" << book_name << endl;
	if(book_name != NULL)
	{
		delete[]book_name;
	}
	book_num--;
	cout << "Base deconstruct! " << endl;
}

void CBook::changeBookName(void)
{
	char name_srting[20];
	cout << "书的原名为：" << book_name << endl;
	cout << "请输入新的书名：";
	cin >> name_srting;
	delete[]book_name;
	book_name = new char[strlen(name_srting) + 1];
	if (book_name != NULL)
	{
		strcpy(book_name, name_srting);
	}
	cout << "新的数目情况为：" << endl;
	printInfo();
}

void CBook::printInfo(void)
{
	cout << "-------------------------------------" << endl;
	cout << "书名：" << book_name << endl;
	cout << "价格：" << price << endl;
	cout << "-------------------------------------" << endl;
}

void CBook::printAllNum(void)
{
	cout << "书的总数目为：" << book_num << endl;
}

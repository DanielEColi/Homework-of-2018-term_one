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
	cout << "���ԭ��Ϊ��" << book_name << endl;
	cout << "�������µ�������";
	cin >> name_srting;
	delete[]book_name;
	book_name = new char[strlen(name_srting) + 1];
	if (book_name != NULL)
	{
		strcpy(book_name, name_srting);
	}
	cout << "�µ���Ŀ���Ϊ��" << endl;
	printInfo();
}

void CBook::printInfo(void)
{
	cout << "-------------------------------------" << endl;
	cout << "������" << book_name << endl;
	cout << "�۸�" << price << endl;
	cout << "-------------------------------------" << endl;
}

void CBook::printAllNum(void)
{
	cout << "�������ĿΪ��" << book_num << endl;
}

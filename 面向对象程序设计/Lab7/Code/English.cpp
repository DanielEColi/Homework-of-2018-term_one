#include "English.h"

int CEnglish::English_num = 0;

CEnglish::CEnglish() :CBook()
{
	English_num++;
}

CEnglish::CEnglish(const CEnglish &copy_c)
{
	book_name = new char[strlen(copy_c.book_name) + 1];
	if (book_name != NULL)
	{
		strcpy(book_name, copy_c.book_name);
	}
	price = copy_c.price;
	book_num++;
	English_num++;
}

CEnglish::CEnglish(const char *i_name, float i_price) : CBook(i_name, i_price)
{
	English_num++;
}

CEnglish::~CEnglish()
{
	cout << "Deconstruct: " << book_name << endl;
	English_num--;
}

void CEnglish::printEnglishNum(void)
{
	cout << "Ó¢ÓïÊéÊýÄ¿£º" << English_num << endl;
}
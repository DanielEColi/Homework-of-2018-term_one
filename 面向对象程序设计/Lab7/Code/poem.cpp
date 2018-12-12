#include "poem.h"

int CPoem::poem_num = 0;

CPoem::CPoem() :CBook()
{
	poem_num++;
}

CPoem::CPoem(const char *i_name, float i_price) :CBook(i_name, i_price)
{
	poem_num++;
}

CPoem::CPoem(const CPoem &copy_c)
{
	book_name = new char[strlen(copy_c.book_name) + 1];
	if (book_name != NULL)
	{
		strcpy(book_name, copy_c.book_name);
	}
	price = copy_c.price;
	book_num++;
	poem_num++;
}

CPoem::~CPoem()
{
	cout << "Deconstruct: " << book_name << endl;
	poem_num--;
}

void CPoem::printPoemNum(void)
{
	cout << "Ê«¼¯ÊýÄ¿£º" << poem_num << endl;
}
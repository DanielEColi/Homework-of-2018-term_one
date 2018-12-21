//poem.cpp
#include "poem.h"

int CPoem::poem_num = 0;

CPoem::CPoem() :CBook()
{
	author = NULL;
	poem_num++;
	cout << "Poem nil para construct!" << endl;
}

CPoem::CPoem(const char *i_name, float i_price, const char *i_author) :CBook(i_name, i_price)
{
	author = new char[strlen(i_author) + 1];
	if (author != NULL)
	{
		strcpy(author, i_author);
	}
	poem_num++;
	cout << "Poem para construct " << book_name << endl;
}

CPoem::CPoem(const CPoem &copy_c)  :CBook(copy_c)
{
	author = new char[strlen(copy_c.author) + 1];
	if (author != NULL)
	{
		strcpy(author, copy_c.author);
	}
	poem_num++;
	cout << "Poem copy construct " << book_name << endl;
}

CPoem::~CPoem()
{
	cout << "Poem deconstruct: " << book_name << endl;
	poem_num--;
}

void CPoem::printPoemNum(void)
{
	cout << "Ê«¼¯ÊýÄ¿£º" << poem_num << endl;
}
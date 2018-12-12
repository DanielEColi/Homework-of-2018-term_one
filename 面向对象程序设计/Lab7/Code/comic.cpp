#include "comic.h"

int CComic::comic_num = 0;

CComic::CComic() :CBook()
{

	comic_num++;
}

CComic::CComic(const char *i_name, float i_price) :CBook(i_name, i_price)
{
	comic_num++;
}

CComic::CComic(const CComic &copy_c)
{
	book_name = new char[strlen(copy_c.book_name) + 1];
	if (book_name != NULL)
	{
		strcpy(book_name, copy_c.book_name);
	}
	price = copy_c.price;
	book_num++;
	comic_num++;
}

CComic::~CComic()
{
	cout << "Deconstruct: " << book_name << endl;
	comic_num--;
}

void CComic::printComicNum(void)
{
	cout << "Âþ»­ÊéÊýÄ¿£º" << comic_num << endl;
}
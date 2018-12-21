//comic.cpp
#include "comic.h"

int CComic::comic_num = 0;

CComic::CComic() :CBook()
{
	popularity = UNSOUGHT;
	comic_num++;
	cout << "Comic nil para construct!" << endl;
}

CComic::CComic(const char *i_name, float i_price, int i_pop) :CBook(i_name, i_price)
{
	popularity = i_pop;
	comic_num++;
	cout << "Comic para construct " << book_name << endl;

}

CComic::CComic(const CComic &copy_c) :CBook(copy_c)
{
	popularity = copy_c.popularity;
	comic_num++;
	cout << "Comic copy construct " << book_name << endl;
}

CComic::~CComic()
{
	cout << "Comic deconstruct: " << book_name << endl;
	comic_num--;
}

void CComic::printComicNum(void)
{
	cout << "Âþ»­ÊéÊýÄ¿£º" << comic_num << endl;
}
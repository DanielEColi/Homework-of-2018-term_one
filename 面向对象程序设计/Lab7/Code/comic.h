#ifndef _COMIC_H_
#define _COMIC_H_

#include "book.h"

class CComic :public CBook
{
private:
	static int comic_num;
public:
	CComic();
	CComic(const char *i_name, float i_price);
	CComic(const CComic &copy_c);
	~CComic();
	void printComicNum(void);
};

#endif

//comic.h
#ifndef _COMIC_H_
#define _COMIC_H_

#include "book.h"

typedef enum
{
	UNSOUGHT,
	COMMON,
	HOT
}Popularity_grade;

class CComic :public CBook
{
private:
	static int comic_num;
	int popularity;
public:
	CComic();
	CComic(const char *i_name, float i_price, int i_pop);
	CComic(const CComic &copy_c);
	~CComic();
	void printComicNum(void);
};

#endif

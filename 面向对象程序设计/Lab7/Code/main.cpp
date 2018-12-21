//main.cpp
#include "book.h"
#include "comic.h"
#include "English.h"
#include "poem.h"

int main()
{
	CBook a("C++面向对象程序设计", 10.0);
	CComic b("火影", 10.0, HOT);
	CEnglish c("三年级英语", 12.0, EASY);
	CPoem d("唐诗三百首", 100.0, "唐代众多诗人");
	a.printInfo();
	b.printInfo();
	b.changeBookName();
	c.printInfo();
	d.printInfo();
	d.printPoemNum();
	c.printEnglishNum();
	b.printComicNum();
	CBook::printAllNum();


	return 0;
}
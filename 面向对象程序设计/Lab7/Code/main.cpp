//main.cpp
#include "book.h"
#include "comic.h"
#include "English.h"
#include "poem.h"

int main()
{
	CBook a("C++�������������", 10.0);
	CComic b("��Ӱ", 10.0, HOT);
	CEnglish c("���꼶Ӣ��", 12.0, EASY);
	CPoem d("��ʫ������", 100.0, "�ƴ��ڶ�ʫ��");
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
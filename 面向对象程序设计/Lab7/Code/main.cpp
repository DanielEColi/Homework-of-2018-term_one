#include "book.h"
#include "comic.h"
#include "English.h"
#include "poem.h"

int main()
{
	CBook a("C++�������������", 10.0);
	CComic b("ggggg", 10.0);
	CEnglish c("���꼶Ӣ��", 12.0);
	CPoem d("��ʫ������", 100.0);
	a.printInfo();
	b.printInfo();
	c.printInfo();
	d.printInfo();
	d.printPoemNum();
	c.printEnglishNum();
	b.printComicNum();
	CBook::printAllNum();


	return 0;
}
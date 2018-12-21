//English.cpp
#include "English.h"

int CEnglish::English_num = 0;

CEnglish::CEnglish() :CBook()
{
	complexity = EASY;
	English_num++;
	cout << "English nil para construct!" << endl;
}

CEnglish::CEnglish(const CEnglish &copy_c) : CBook(copy_c)
{
	complexity = copy_c.complexity;
	English_num++;
	cout << "English copy construct " << book_name << endl;
}

CEnglish::CEnglish(const char *i_name, float i_price, int level) : CBook(i_name, i_price)
{
	complexity = level;
	English_num++;
	cout << "English para construct " << book_name << endl;
}

CEnglish::~CEnglish()
{
	cout << "English deconstruct: " << book_name << endl;
	English_num--;
}

void CEnglish::printEnglishNum(void)
{
	cout << "Ó¢ÓïÊéÊýÄ¿£º" << English_num << endl;
}
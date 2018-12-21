//English.h
#ifndef _ENGLISH_H_
#define _ENGLISH_H_

#include "book.h"

typedef enum
{
	EASY,
	MEDIUM,
	DIFFICULT
}Complexity_grade;

class CEnglish :public CBook
{
private:
	static int English_num;
	int complexity;
public:
	CEnglish();
	CEnglish(const char *i_name, float i_price, int level);
	CEnglish(const CEnglish &copy_c);
	~CEnglish();
	void printEnglishNum(void);
};

#endif

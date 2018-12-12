#ifndef _ENGLISH_H_
#define _ENGLISH_H_

#include "book.h"

class CEnglish :public CBook
{
private:
	static int English_num;
public:
	CEnglish();
	CEnglish(const char *i_name, float i_price);
	CEnglish(const CEnglish &copy_c);
	~CEnglish();
	void printEnglishNum(void);
};

#endif

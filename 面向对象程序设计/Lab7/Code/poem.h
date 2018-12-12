#ifndef _POEM_H_
#define _POEM_H_

#include "book.h"

class CPoem :public CBook
{
private:
	static int poem_num;
public:
	CPoem();
	CPoem(const char *i_name, float i_price);
	CPoem(const CPoem &copy_c);
	~CPoem();
	void printPoemNum(void);
};

#endif

#include <iostream>
#include "student.h"
#include "service.h"

using namespace std;

int main()			//主函数
{
	int getChoice;						//变量用于获取用户的选择
	CStudent *p_stu = NULL;		//初始化CStudent指针

	while (1)
	{
		getChoice = showService();			//显示服务菜单并获取用户选择
		processChoice(getChoice, p_stu);//处理用户选择
	}

	return 0;											//程序执行结束，返回0
}


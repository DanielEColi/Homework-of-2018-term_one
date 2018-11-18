#ifndef _SERVICE_H_
#define _SERVICE_H_

#include "student.h"

typedef enum {
	REGISTER,			//注册
	LOGIN,				//登录
	DINE,					//用餐
	LOGOUT,				//注销
	RECHARGE,			//充值
	LOCK_UNLOCK,	//挂失&解挂
	SEARCH,				//查询
	CHANGE_INFO,	//更改信息
	LEAVE,					//离开
	SERVICE_MAX	//枚举最大值
}ServiceList;

typedef enum {
	RICE,				//米饭
	TARO,				//芋头
	EXIT,				//退出
	MENU_LIST	//枚举最大值
}MenuList;

int showMenu(void);			//显示菜单
int showService(void);		//显示服务
void processChoice(int choice, CStudent *&object);	//处理用户选项

#endif // !_SERVICE_H_


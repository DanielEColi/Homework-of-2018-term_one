#include <iostream>
#include "student.h"

using namespace std;

typedef enum {
	REGISTER,			//注册
	LOGIN,				//登录
	DINE,					//用餐
	LOGOUT,				//注销
	RECHARGE,			//充值
	LOCK_UNLOCK,	//挂失&解挂
	SEARCH,				//查询
	CHANGE_INFO,	//更改信息
	SERVICE_MAX	//枚举最大值
}ServiceList;

typedef enum {
	RICE,				//米饭
	TARO,				//芋头
	EXIT,				//退出
	MENU_LIST	//枚举最大值
}MenuList;

CStudent *stu = new CStudent[10];	//生成CStudent类型的对象数组

int showMenu(void);			//显示菜单
int showService(void);		//显示服务
void processChoice(int choice, CStudent *&object);	//处理用户选项

int main()			//主函数
{
	int getChoice;						//变量用于获取用户的选择
	CStudent *p_stu = NULL;		//初始化CStudent指针

	while (1)
	{
		getChoice = showService();			//显示服务菜单并获取用户选择
		processChoice(getChoice, p_stu);//处理用户选择
	}

	return 0;											
}

int showMenu(void)			//显示食堂菜单
{
	int choice;					//变量用于获取用户选择

	cout << "------------------------- MENU --------------------------" << endl << endl;
	cout << "  ***************" << endl;
	cout << "  |本餐厅提供： |" << endl;
	cout << "  |1.米饭 2.5/两|" << endl;
	cout << "  |2.芋头 3.0/个|" << endl;
	cout << "  |3.退出       |"<< endl;
	cout << "  ***************" << endl << endl;
	cout << "请选择---";

	cin >> choice;
	choice--;
	while (choice >= MENU_LIST)
	{
		cout << "错误，请重新输入!" << endl;
		cin >> choice;
	}

	cout << endl << endl;
	return choice;
}

int showService(void)
{
	int choice;

	cout << "-------------------------- SERVICE -------------------------" << endl;
	cout << "请选择服务：" << endl;
	cout << "1.注册" << endl;
	cout << "2.登录" << endl;
	cout << "3.用餐" << endl;
	cout << "4.注销" << endl;
	cout << "5.充值" << endl;
	cout << "6.挂失/解挂" << endl;
	cout << "7.查询" << endl;
	cout << "8.修改信息" << endl;
	cout << "请选择---";

	cin >> choice;
	choice--;
	while (choice >= SERVICE_MAX)
	{
		cout << "错误，请重新输入!" << endl;
		cin >> choice;
	}

	cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;

	return choice;
}

void processChoice(int choice, CStudent *&object)
{
	static bool s_loaded = ERROR;
	bool result = ERROR;
	char c;
	int getChoice;
	int i;

	switch (choice)
	{
	case REGISTER:
		cout << "-------------------------- REGISTER -------------------------" << endl;
		int num;
		num = CStudent::getUserNum();
		stu[num].registerUser();
		cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
		break;
	case LOGIN:
		cout << "-------------------------- LOGIN -------------------------" << endl;
		if (s_loaded == OK)
		{
			cout << "您已经登录，请先注销登录!" << endl;
			cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
			break;
		}

		char getcardID[10];
		char getpassword[10];

		cout << "提示：如果您还未拥有账号，请先退出，注册账号!" << endl;
		cout << "请输入您的卡号 (六位数字) : ";
		cin >> getcardID;
		cout << "请输入您的密码  (六位数字) : ";
		cin >> getpassword;
		getChoice = CStudent::login(getcardID, getpassword);

		if (getChoice > LOGIN_FAILED)
		{
			cout << "登录成功!" << endl;
			s_loaded = OK;
			object = &stu[getChoice];
		}
		else
		{
			cout << "登录失败，请重新尝试" << endl;
			object = NULL;
			s_loaded = ERROR;
		}
		cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;

		break;
	case DINE:
		cout << "-------------------------- DINE -------------------------" << endl;
		if (s_loaded == ERROR)
		{
			cout << "请先登录，谢谢!" << endl;
			cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
			break;
		}
		result = OK;
		while (result)
		{
			getChoice = showMenu();
			result = object->eating(getChoice);
		}
		cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
		break;
	case LOGOUT:
		cout << "-------------------------- LOGOUT -------------------------" << endl;
		if (s_loaded == ERROR)
		{
			cout << "您还未登录账号!" << endl;
			cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
			break;
		}

		cout << "您确定要注销账号吗? (y/n) ";
		cin >> c;
		while (cin.fail())          //输入引发cin异常
		{
			cout << "错误，请重新输入: ";  //输出错误信息
			cin.clear();                            //先清除异常状态
			cin.ignore(999, '\n');                  //再清理缓冲区，清理999个字符或者碰到'\n'

			cin >> c;                 //再次接受新元素
		}
		cin.ignore(999, '\n');                  //再清理缓冲区，清理999个字符或者碰到'\n'

		if (c == 'y')
		{
			cout << "已注销." << endl;
			s_loaded = ERROR;
			object = NULL;
		}
		else
		{
			cout << "您已放弃注销账号!" << endl;
		}
		cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
		break;
	case RECHARGE:
		cout << "-------------------------- RECHAGER -------------------------" << endl;
		if (s_loaded == ERROR)
		{
			cout << "请先登录，谢谢!" << endl;
			cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
			break;
		}
		float money;
		cout << "请输入您的充值金额? ";
		cin >> money;
		object->cardRecharge(money);
		cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
		break;
	case LOCK_UNLOCK:
		cout << "-------------------------- LOCK_UNLOCK -------------------------" << endl;
		char c;
		char getString[10];
		cout << "请输入您的卡号 : ";
		cin >> getString;

		i = CStudent::searchAccount(getString);

		if (i == LOGIN_FAILED)
		{
			break;
			cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
		}

		object = &stu[i];
		result = object->getcardStatus();
		if (result == LOCK)
		{
			cout << "您的卡处于挂失，是否解挂? (y/n) ";
		}
		else
		{
			cout << "您的卡处于解挂状态，是否挂失? (y/n) ";
		}

		cin >> c;

		while (cin.fail())          //输入引发cin异常
		{
			cout << "错误，请重新输入: ";  //输出错误信息
			cin.clear();                            //先清除异常状态
			cin.ignore(999, '\n');                  //再清理缓冲区，清理999个字符或者碰到'\n'

			cin >> c;                 //再次接受新元素
		}
		cin.ignore(999, '\n');                  //再清理缓冲区，清理999个字符或者碰到'\n'

		if (c == 'y' && result == LOCK)
		{
			object->unlockCard();
		}
		else if (c == 'y' && result == UNLOCK)
		{
			object->lockCard();
		}
		else
		{
			cout << "Exit" << endl;
		}
		cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
		break;
	case SEARCH:
		cout << "-------------------------- SEARCH -------------------------" << endl;
		if (s_loaded == ERROR)
		{
			cout << "您尚未登录!" << endl;
			cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
			break;
		}
		object->showInfo();
		cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;

		break;
	case CHANGE_INFO:
		cout << "-------------------------- CHANGE_INFO -------------------------" << endl;

		if (s_loaded == ERROR)
		{
			cout << "您尚未登录!" << endl;
			cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
			break;
		}
		object->changeInfo();
		cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
		break;
	default:
		break;
	}
}

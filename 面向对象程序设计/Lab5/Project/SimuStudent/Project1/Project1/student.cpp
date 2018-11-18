#include <iostream>
#include <stdlib.h>
#include "student.h"

using namespace std;

#define random(x)  (rand()%x)

typedef struct 
{
	char food[20];
	float price;
}FoodNode;

FoodNode foodList[3] = { {"一两米饭", 2.5}, {"一个芋头", 3.0}, {"退出", 0} };

int CStudent::s_userNum = 0;
int CStudent::s_userMax = 0;
User CStudent::s_registry[20] = { {"000000", "000000"} };

CStudent::CStudent()
{
	int match = OK;

	strcpy(name, "默认");
	id = random(70) + 2016222000;
	balance = 0.0;
	cardStatus = UNLOCK;
	randString('0', '9', cardID, 6);

	while (1)
	{
		for (int i = 0; match != ERROR && i < s_userMax; i++)
		{
			match = strcmp(cardID, s_registry[i].l_cardID);
		}

		if (match == ERROR)
		{
			randString('0', '9', cardID, 6);
		}
		else
		{
			break;
		}
	}
	
	strcpy(password, "000000");
	tableNumber = s_userMax;
	writeRegisty();
	s_userMax++;
}

CStudent::CStudent(const char *i_name, const int i_id, const char *i_cardID, const char *i_password)
{
	strcpy(name, i_name);
	id = i_id;
	balance = 0.0;
	cardStatus = UNLOCK;
	strcpy(cardID, i_cardID);
	strcpy(password, i_password);
	tableNumber = s_userMax;
	writeRegisty();
	s_userMax++;
}

bool CStudent::registerUser(void)
{
	if (s_userNum >= s_userMax)
	{
		cout << "用户已饱和" << endl;
		return ERROR;
	}

	tableNumber = s_userNum;
	changeInfo();
	s_userNum++;

	cout << endl << "现在，您的账户信息如下 : " << endl;
	showInfo();
	cout << "请务必牢记! " << endl;

	return OK;
}

bool CStudent::changeInfo(void)
{
	if (cardStatus == LOCK)
	{
		cout << "您的卡已挂失!" << endl;
		return ERROR;
	}

	char c = 'y';
	char newString[20];
	int times = 5;

	while (c == 'y')
	{
		cout << "你的名字是 " << name << " , 是否进行修改? (y/n)" << endl;
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
			cout << "请输入您的新名字 : ";
			cin >> name;
		}
		else
		{
			break;
		}
	}

	c = 'y';

	while (c == 'y')
	{
		cout << "您的学号为 " << id << " , 是否进行修改? (y/n)" << endl;
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
			cout << "请输入您的新学号 : ";
			cin >> id;
		}
		else
		{
			break;
		}
	}

	c = 'y';
	while (c == 'y' && times > 0)
	{
		cout << "是否要修改您的校园卡密码? (y/n)" << endl;
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
			cout << "请输入您的原始密码 : " << endl;
			cout << "提示：如果这是您第一次修改密码，则原始密码为000000" << endl;
			cin >> newString;
			bool match = strcmp(password, newString);
			if (match != true) //匹配成功
			{
				cout << "请输入您的新密码 : ";
				cin >> password;
				writeRegisty();//这里需要修改一下
			}
			else
			{
				cout << "密码错误，您只剩下 " << --times << " 次尝试的机会了！" << endl;
			}
		}
	}
	writeRegisty();

	return OK;
}

int CStudent::login(char *i_cardID, char *i_password)
{
	int match = cmpPassword(i_cardID, i_password);

	if (match > LOGIN_FAILED)
	{
		return match;
	}
	else
	{
		return LOGIN_FAILED;
	}
}

int CStudent::searchAccount(char *i_cardID)
{
	for (int i = 0; i < s_userNum; i++)
	{
		if (!strcmp(i_cardID, s_registry[i].l_cardID))
		{
			return i;
		}
	}
	cout << "未注册的用户！" << endl;

	return LOGIN_FAILED;
}

int CStudent::cmpPassword(char *i_cardID, char *i_cardPassword)
{
	int i = searchAccount(i_cardID);

	if (i < 0)
	{
		return LOGIN_FAILED;
	}
	
	if (!strcmp(i_cardPassword, s_registry[i].l_cardPassword))
	{
		cout << "成功!" << endl;
		return i;
	}
	else
	{
		cout << "密码错误!" << endl;
		return LOGIN_FAILED;
	}

	return ERROR;
}

void CStudent::showInfo()
{
	cout << "**********************" << endl;
	cout << "*  姓名: " << name << endl << "*  学号: " << id << endl;
	cout << "*  余额: " << balance << endl ;
	cout << "*  卡号: " << cardID << endl;
	cout << "**********************" << endl;
}

bool CStudent::writeRegisty(void)
{
	strcpy(s_registry[tableNumber].l_cardID, cardID);
	strcpy(s_registry[tableNumber].l_cardPassword, password);

	return 0;
}

bool CStudent::cardRecharge(float amount)
{
	if (cardStatus == LOCK)
	{
		cout << "您的卡已挂失!" << endl;
		return ERROR;
	}

	char c;
	cout << "确定要充值 " << amount << " 元?(y/n) " << endl;
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
		balance += amount;
		cout << "充值成功!" << endl;
		cout << "您当前的余额为 " << balance << " 元." << endl;
		return OK;
	}
	else
	{
		cout << "放弃充值!" << endl;
		return ERROR;
	}
}

bool CStudent::eating(int choice)
{
	char c;

	if (cardStatus == LOCK)
	{
		cout << "您的卡已挂失!" << endl;
		return ERROR;
	}

	cout << "您选择 ";
	cout << foodList[choice].food << endl;
	cout << "确定？(y/n)";
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
		if (foodList[choice].price == 0)
		{
			cout << "退出" << endl;
			return ERROR;
		}
		if (balance < foodList[choice].price)
		{
			cout << "余额不足，请充值! " << endl;
		}
		else
		{
			balance -= foodList[choice].price;
			cout << "您购买了 " << foodList[choice].food << " , 花费 " << foodList[choice].price << " 元" << endl;
			cout << "您的余额还剩 " << balance << " 元." << endl;
		}
		return OK;
	}
	else
	{
		cout << "已放弃 " << foodList[choice].food << " ." << endl;
	}

	return OK;
}

bool CStudent::consumption()
{
	if (cardStatus == LOCK)
	{
		cout << "您的卡已挂失!" << endl;
		return ERROR;
	}
	return OK;
}

bool CStudent::lockCard()
{
	char newString[20];

	cout << "请输入密码 : ";
	cin >> newString;

	while (cin.fail())          //输入引发cin异常
	{
		cout << "错误，请重新输入: ";  //输出错误信息
		cin.clear();                            //先清除异常状态
		cin.ignore(999, '\n');                  //再清理缓冲区，清理999个字符或者碰到'\n'

		cin >> newString;                 //再次接受新元素
	}
	cin.ignore(999, '\n');                  //再清理缓冲区，清理999个字符或者碰到'\n'

	int match = strcmp(password, newString);

	if (match == 0)
	{
		cardStatus = LOCK;
		cout << "您的卡已挂失.  " << endl;
		return OK;
	}
	else
	{
		cout << "密码错误!" << endl;
		return ERROR;
	}
}

bool CStudent::unlockCard()
{
	char newString[20];

	cout << "请输入密码 : ";
	cin >> newString;

	while (cin.fail())          //输入引发cin异常
	{
		cout << "错误，请重新输入: ";  //输出错误信息
		cin.clear();                            //先清除异常状态
		cin.ignore(999, '\n');                  //再清理缓冲区，清理999个字符或者碰到'\n'

		cin >> newString;                 //再次接受新元素
	}
	cin.ignore(999, '\n');                  //再清理缓冲区，清理999个字符或者碰到'\n'

	int match = strcmp(password, newString);

	if (match == 0)
	{
		cardStatus = UNLOCK;
		cout << "您的卡已解挂!" << endl;
		return OK;
	}
	else
	{
		cout << "密码错误!" << endl;
		return ERROR;
	}
}

bool CStudent::getcardStatus(void)
{
	return cardStatus;
}

int   CStudent::getUserNum(void)
{
	return s_userNum;
}


bool randString(char starting_c, char ending_c, char *i_string, int s_length)
{
	char c;
	int i;

	if (ending_c <= starting_c)
	{
		cout << "发生错误!" << endl;
		return ERROR;
	}

	for (i = 0; i < s_length; i++)
	{
		c = (char)(((double)rand() / RAND_MAX)*(ending_c - starting_c) + starting_c);
		i_string[i] = c;
	}

	i_string[i] = '\0';

	return OK;
}
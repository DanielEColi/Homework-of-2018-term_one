//student.cpp

#include <iostream>
#include <stdlib.h>
#include "student.h"

using namespace std;

#define random(x)  (rand()%x)		//产生一个随机数

typedef struct 
{
	char food[20];				//菜名
	float price;					//价格
}FoodNode;

FoodNode foodList[3] = { {"一两米饭", 2.5}, {"一个芋头", 3.0}, {"退出", 0} };	//菜单

int CStudent::s_userNum = 0;		//初始化用户数目
int CStudent::s_userMax = 0;		//初始化最大用户数目
User CStudent::s_registry[20] = { {"000000", "000000"} };	//初始化注册表

CStudent::CStudent()			//无参构造函数
{
	int sizeofname = 0;			//声明用来存放姓名长度的变量
	int match = OK;				//声明用来标记匹配的变量

	sizeofname = strlen("默认");				//默认初始化名称为默认
	name = new char[sizeofname + 1];		//申请内存空间
	if (name == NULL)							//申请失败
	{
		cout << "申请内存空间失败" << endl;	//打印信息
		exit(0);												//终止程序
	}
	strcpy(name, "默认");							//复制字符串到成员变量name
	id = random(70) + 2016222000;			//生成随机的学号
	balance = 0.0;										//初始余额为0
	cardStatus = UNLOCK;							//卡的状态为解挂
	randString('0', '9', cardID, 6);			//生成随机的卡号

	while (1)
	{
		for (int i = 0; match != ERROR && i < s_userMax; i++) //查询注册表
		{
			match = strcmp(cardID, s_registry[i].l_cardID);	  //新生成的学号与注册表比较
		}

		if (match == ERROR)						//如果生成的卡号在注册表中已有
		{
			randString('0', '9', cardID, 6);	//再次生成一个随机的卡号，继续比较
		}
		else
		{
			break;											//跳出循环
		}
	}
	
	strcpy(password, "000000");				//默认初始密码为000000
	tableNumber = s_userMax;					//注册表序号
	writeRegisty();										//更新注册表
	s_userMax++;										//注册表最大容量加1
}
//有参构造函数
CStudent::CStudent(const char *i_name, const int i_id, const char *i_cardID, const char *i_password)
{
	int sizeofname = 0;

	sizeofname = strlen(i_name);			//获取姓名的长度
	name = new char[sizeofname + 1];		//申请内存空间
	if (name == NULL)							//申请失败
	{
		cout << "申请内存空间失败" << endl;	//打印信息
		exit(0);												//终止程序
	}
	strcpy(name, i_name);					//拷贝姓名到成员变量
	id = i_id;										//拷贝学号到成员变量
	balance = 0.0;								//初始余额为0
	cardStatus = UNLOCK;					//卡的状态为解挂
	strcpy(cardID, i_cardID);			//拷贝卡号到成员变量
	strcpy(password, i_password);		//拷贝密码到成员变量
	tableNumber = s_userMax;			//注册表序号
	writeRegisty();								//更新注册表
	s_userMax++;								//注册表最大容量加1
}

CStudent::~CStudent()					//析构函数
{	
	delete[] name;								//释放指针name
}

bool CStudent::registerUser(void)	//注册用户
{
	if (s_userNum >= s_userMax)		//如果用户数大于最大允许值
	{
		cout << "用户已饱和" << endl;		//打印信息
		return ERROR;							//返回错误
	}

	tableNumber = s_userNum;			//确定用户序号
	changeInfo();								//修改用户信息
	s_userNum++;								//用户数加1

	cout << endl << "注册后的账户信息如下 : " << endl;	
	showInfo();									//显示注册后的用户信息
	cout << "请务必牢记! " << endl;

	return OK;									//返回正确
}

bool CStudent::changeInfo(void)		//修改用户信息
{
	if (cardStatus == LOCK)				//如果卡已挂失
	{
		cout << "您的卡已挂失!" << endl;//打印信息
		return ERROR;							//返回错误
	}

	char c = 'y';									//赋值为'y'
	char newString[20];						
	int times = 5;								//可以尝试5次

	while (c == 'y')								//当c的值为'y'时
	{
		cout << "你的名字是 " << name << " , 是否进行修改? (y/n)" << endl; //打印信息
		cin >> c;										//接收用户输入

		while (cin.fail())						//输入引发cin异常
		{
			cout << "错误，请重新输入: ";		//输出错误信息
			cin.clear();								//先清除异常状态
			cin.ignore(999, '\n');               //再清理缓冲区，清理999个字符或者碰到'\n'

			cin >> c;										//再次接受新元素
		}
		cin.ignore(999, '\n');					//再清理缓冲区，清理999个字符或者碰到'\n'

		if (c == 'y')								//如果c的值为'y'
		{
			int sizeofname;						//声明变量存放姓名的长度
			char i_name[20];					//声明变量接收用户姓名
			cout << "请输入您的新名字 : ";		//打印信息
			cin >> i_name;								//输入
			sizeofname = strlen(i_name);		//获取姓名的长度
			delete [] name;								//释放name所占的内存空间
			name = new char[sizeofname + 1];		//重新申请一块新的内存空间
			if (name == NULL)									//申请失败
			{
				cout << "申请内存空间失败" << endl;		//打印错误
				exit(0);													//终止程序
			}
			strcpy(name, i_name);								//拷贝字符串到成员变量
		}
		else
		{
			break;											//跳出循环
		}
	}

	c = 'y';						//赋值为'y'，才能进入循环	

	while (c == 'y')			//循环，直至用户输入'n'
	{
		cout << "您的学号为 " << id << " , 是否进行修改? (y/n)" << endl;
		cin >> c;

		while (cin.fail())          //输入引发cin异常
		{
			cout << "错误，请重新输入: ";		//输出错误信息
			cin.clear();								//先清除异常状态
			cin.ignore(999, '\n');				//再清理缓冲区，清理999个字符或者碰到'\n'

			cin >> c;										//再次接受新元素
		}
		cin.ignore(999, '\n');					//再清理缓冲区，清理999个字符或者碰到'\n'

		if (c == 'y')									//用户输入'y'
		{
			cout << "请输入您的新学号 : ";	//打印信息
			cin >> id;									//接收学号
		}
		else
		{
			break;										//跳出循环
		}
	}

	c = 'y';												//赋值为'y'，才能进入循环	
	while (c == 'y' && times >= 0)				//跳出循环条件：用户输入'n'或者可尝试次数为0
	{
		cout << "是否要修改您的校园卡密码? (y/n)" << endl;		//打印信息
		cin >> c;											//接收用户输入

		while (cin.fail())							//输入引发cin异常
		{
			cout << "错误，请重新输入: ";		//输出错误信息
			cin.clear();								//先清除异常状态
			cin.ignore(999, '\n');				//再清理缓冲区，清理999个字符或者碰到'\n'

			cin >> c;										//再次接受新元素
		}
		cin.ignore(999, '\n');					//再清理缓冲区，清理999个字符或者碰到'\n'

		if (c == 'y')									//如果用户输入'y'
		{
			cout << "请输入您的原始密码 : " << endl;
			cout << "提示：如果这是您第一次修改密码，则原始密码为000000" << endl;
			cin >> newString;						//接收用户输入
			bool match = strcmp(password, newString);		//与密码进行匹配
			if (match != true)						//匹配成功
			{
				cout << "请输入您的新密码 : ";
				cin >> password;					//输入新的密码
				writeRegisty();						//这里需要修改一下
			}
			else
			{
				cout << "密码错误，您只剩下 " << --times << " 次尝试的机会了！" << endl;
			}
		}
	}
	writeRegisty();		//更新注册表

	return OK;
}

int CStudent::login(char *i_cardID, char *i_password)	//登录
{
	int match = cmpPassword(i_cardID, i_password);		//匹配密码

	if (match > LOGIN_FAILED)		//匹配成功
	{
		return match;							//返回匹配到的序号
	}
	else
	{
		return LOGIN_FAILED;			//返回失败
	}
}

int CStudent::searchAccount(char *i_cardID)				//查询账户
{
	for (int i = 0; i < s_userNum; i++)								//注册表中逐项查找
	{
		if (!strcmp(i_cardID, s_registry[i].l_cardID))		//如果找到匹配的
		{
			return i;			//返回序号
		}
	}
	cout << "未注册的用户！" << endl;		//为匹配到，打印信息

	return LOGIN_FAILED;					//返回失败
}

int CStudent::cmpPassword(char *i_cardID, char *i_cardPassword)	//匹配密码
{
	int i = searchAccount(i_cardID);		//查询账户

	if (i <= LOGIN_FAILED)					//如果账户不存在
	{
		return LOGIN_FAILED;				//返回失败
	}
	
	if (!strcmp(i_cardPassword, s_registry[i].l_cardPassword))		//比较密码是否相匹配
	{
		cout << "成功!" << endl;			//打印信息
		return i;								//返回序号
	}
	else
	{
		cout << "密码错误!" << endl;	//密码错误
		return LOGIN_FAILED;		//返回失败
	}
}

inline void CStudent::showInfo()			//打印用户信息
{
	cout << "**********************" << endl;
	cout << "*  姓名: " << name << endl << "*  学号: " << id << endl;
	cout << "*  余额: " << balance << endl ;
	cout << "*  卡号: " << cardID << endl;
	cout << "**********************" << endl;
}

inline void CStudent::writeRegisty(void)	//更新注册表
{
	strcpy(s_registry[tableNumber].l_cardID, cardID);
	strcpy(s_registry[tableNumber].l_cardPassword, password);
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
		cout << "错误，请重新输入: ";		//输出错误信息
		cin.clear();								//先清除异常状态
		cin.ignore(999, '\n');				//再清理缓冲区，清理999个字符或者碰到'\n'

		cin >> c;										//再次接受新元素
	}
	cin.ignore(999, '\n');					//再清理缓冲区，清理999个字符或者碰到'\n'

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

bool CStudent::eating(int choice)			//用餐
{
	char c;									//声明字符变量

	if (cardStatus == LOCK)		//若卡已挂失
	{
		cout << "您的卡已挂失!" << endl;	//打印信息
		return ERROR;					//返回错误
	}

	cout << "您选择 ";	
	cout << foodList[choice].food << endl;	//输出用户选择的菜名
	cout << "确定？(y/n)" << endl;					//打印
	cin >> c;													//由用户确定

	while (cin.fail())							//输入引发cin异常
	{
		cout << "错误，请重新输入: ";		//输出错误信息
		cin.clear();								//先清除异常状态
		cin.ignore(999, '\n');				//再清理缓冲区，清理999个字符或者碰到'\n'

		cin >> c;										//再次接受新元素
	}
	cin.ignore(999, '\n');					//再清理缓冲区，清理999个字符或者碰到'\n'

	if (c == 'y')									//用户确定
	{
		if (foodList[choice].price == 0)	//如果选择退出
		{
			cout << "退出" << endl;
			return ERROR;						//返回错误
		}
		if (balance < foodList[choice].price)	//如果余额不足
		{
			cout << "余额不足，请充值! " << endl;	//打印结果
		}
		else
		{
			balance -= foodList[choice].price;		//扣除余额
			//打印消费信息
			cout << "您购买了 " << foodList[choice].food << " , 花费 " << foodList[choice].price << " 元" << endl;
			cout << "您的余额还剩 " << balance << " 元." << endl;
		}
		return OK;	//返回成功
	}
	else
	{
		cout << "已放弃 " << foodList[choice].food << " ." << endl;
		return OK;	//返回成功
	}
}

bool CStudent::lockCard()
{
	char newString[20];

	cout << "请输入密码 : ";
	cin >> newString;							//输入密码

	while (cin.fail())							//输入引发cin异常
	{
		cout << "错误，请重新输入: ";		//输出错误信息
		cin.clear();								//先清除异常状态
		cin.ignore(999, '\n');				//再清理缓冲区，清理999个字符或者碰到'\n'

		cin >> newString;						//再次接受新元素
	}
	cin.ignore(999, '\n');					//再清理缓冲区，清理999个字符或者碰到'\n'

	int match = strcmp(password, newString);		//比较密码

	if (match == 0)								//密码正确
	{
		cardStatus = LOCK;					//挂失
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
	char newString[20];						//声明字符串数组

	cout << "请输入密码 : ";
	cin >> newString;							//输入密码

	while (cin.fail())							 //输入引发cin异常
	{
		cout << "错误，请重新输入: ";		//输出错误信息
		cin.clear();								//先清除异常状态
		cin.ignore(999, '\n');				//再清理缓冲区，清理999个字符或者碰到'\n'

		cin >> newString;						//再次接受新元素
	}
	cin.ignore(999, '\n');					//再清理缓冲区，清理999个字符或者碰到'\n'

	int match = strcmp(password, newString);	//比较密码

	if (match == 0)								//密码正确
	{
		cardStatus = UNLOCK;				//解挂
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
	return cardStatus;		//返回卡状态
}

int   CStudent::getUserNum(void)
{
	return s_userNum;		//返回当前用户数目
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
		//随机生成一个字符
		c = (char)(((double)rand() / RAND_MAX)*(ending_c - starting_c) + starting_c);
		i_string[i] = c;
	}

	i_string[i] = '\0';	//结尾加上结束符

	return OK;
}
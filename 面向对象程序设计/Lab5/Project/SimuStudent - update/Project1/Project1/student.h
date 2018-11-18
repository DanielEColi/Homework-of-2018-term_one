#ifndef _STUDENT_H_
#define _STUDENT_H_

#define LOGIN_FAILED -1  //定义登录失败时函数的返回值

typedef struct						//定义用户注册表的节点
{
	char l_cardID[7];				//注册的卡号
	char l_cardPassword[7];  //注册的卡号对应的密码
}User;

typedef enum
{
	ERROR,	//定义错误为0
	OK			//定义正确为1
}Status;		//枚举：操作结果

typedef enum
{
	LOCK,				//挂失
	UNLOCK			//解挂
}e_cardStatus;		//枚举：卡的状态

class CStudent
{
private:
	//私有静态变量
	static User s_registry[20];		//生成一个静态的用户注册表数组
	static int s_userMax;				//最大支持的用户数量
	static int s_userNum;				//已有的用户数量
	//私有变量
	char  *name;								//用户名
	unsigned long   id;						//学号
	float balance;							//余额
	char  cardID[7];						//校园卡号
	char  password[7];					//密码
	int tableNumber;						//对应的注册表序号
	bool cardStatus;						//卡的状态（挂失/解挂）
	//私有函数
	static int cmpPassword(char *i_cardID, char *i_cardPassword);	//核对密码函数
	void writeRegisty(void);																//写注册表函数
public:
	CStudent();			//无参构造函数
	//带形参的构造函数
	CStudent(const char *i_name, const int i_id, const char *i_cardID, const char *i_password);
	~CStudent();		//析构函数
	
	static int searchAccount(char *i_cardID);				//查询用户是否已注册
	static int login(char *i_cardID, char *i_password);	//用户登录
	static int getUserNum(void);									//获取已注册用户的数目

	bool registerUser(void);						//注册用户
	void showInfo(void);								//显示用户信息
	bool changeInfo(void);							//更改用户信息
	bool cardRecharge(float amount);		//充值
	bool eating(int choice);							//用餐
	bool lockCard(void);								//挂失
	bool unlockCard(void);							//解挂
	bool getcardStatus(void);						//获取卡的状态
};

bool randString(char starting_c, char ending_c, char *i_string,  int s_length);	//生成随机字符串

#endif
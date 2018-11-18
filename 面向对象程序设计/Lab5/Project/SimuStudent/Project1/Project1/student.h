#ifndef _STUDENT_H_
#define _STUDENT_H_

#define LOGIN_FAILED -1
typedef struct 
{
	char l_cardID[7];
	char l_cardPassword[7];
}User;

typedef enum
{
	ERROR,
	OK
}Status;

typedef enum
{
	LOCK,
	UNLOCK
}e_cardStatus;

class CStudent
{
private:
	//私有静态变量
	static User s_registry[20];
	static int s_userMax;
	static int s_userNum;
	//私有变量
	char  name[20];
	unsigned long   id;
	float balance;
	char  cardID[7];
	char  password[7];
	int tableNumber;
	bool cardStatus;
	//私有函数
	static int cmpPassword(char *i_cardID, char *i_cardPassword);
	bool writeRegisty(void);
public:
	CStudent();
	CStudent(const char *i_name, const int i_id, const char *i_cardID, const char *i_password);
	
	static int searchAccount(char *i_cardID);
	static int login(char *i_cardID, char *i_password);
	static int getUserNum(void);

	bool registerUser(void);
	void showInfo(void);
	bool changeInfo(void);
	bool cardRecharge(float amount);
	bool eating(int choice);
	bool consumption(void);
	bool lockCard(void);
	bool unlockCard(void);
	bool getcardStatus(void);
};

bool randString(char starting_c, char ending_c, char *i_string,  int s_length);

#endif
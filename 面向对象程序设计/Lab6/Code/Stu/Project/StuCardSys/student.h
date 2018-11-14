#ifndef _STUDENT_H_
#define _STUDENT_H_

#define OK    1
#define ERROR 0

class CStudent
{
private:
	char  name[20];
	int   id;
	float balance;
	char  cardID[7];
	char  password[7];
public:
	CStudent();
	CStudent(const char *i_name, const int i_id, const char *i_cardID, const char *i_password);
	void showInfo(void);
	bool cardRecharge(float amount);
	bool eating(void);
	bool consumption(void);
	bool loseCard(void);
	bool regainCard(void);
};

#endif
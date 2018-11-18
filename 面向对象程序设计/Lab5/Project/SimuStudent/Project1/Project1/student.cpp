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

FoodNode foodList[3] = { {"һ���׷�", 2.5}, {"һ����ͷ", 3.0}, {"�˳�", 0} };

int CStudent::s_userNum = 0;
int CStudent::s_userMax = 0;
User CStudent::s_registry[20] = { {"000000", "000000"} };

CStudent::CStudent()
{
	int match = OK;

	strcpy(name, "Ĭ��");
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
		cout << "�û��ѱ���" << endl;
		return ERROR;
	}

	tableNumber = s_userNum;
	changeInfo();
	s_userNum++;

	cout << endl << "���ڣ������˻���Ϣ���� : " << endl;
	showInfo();
	cout << "������μ�! " << endl;

	return OK;
}

bool CStudent::changeInfo(void)
{
	if (cardStatus == LOCK)
	{
		cout << "���Ŀ��ѹ�ʧ!" << endl;
		return ERROR;
	}

	char c = 'y';
	char newString[20];
	int times = 5;

	while (c == 'y')
	{
		cout << "��������� " << name << " , �Ƿ�����޸�? (y/n)" << endl;
		cin >> c;

		while (cin.fail())          //��������cin�쳣
		{
			cout << "��������������: ";  //���������Ϣ
			cin.clear();                            //������쳣״̬
			cin.ignore(999, '\n');                  //����������������999���ַ���������'\n'

			cin >> c;                 //�ٴν�����Ԫ��
		}
		cin.ignore(999, '\n');                  //����������������999���ַ���������'\n'

		if (c == 'y')
		{
			cout << "���������������� : ";
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
		cout << "����ѧ��Ϊ " << id << " , �Ƿ�����޸�? (y/n)" << endl;
		cin >> c;

		while (cin.fail())          //��������cin�쳣
		{
			cout << "��������������: ";  //���������Ϣ
			cin.clear();                            //������쳣״̬
			cin.ignore(999, '\n');                  //����������������999���ַ���������'\n'

			cin >> c;                 //�ٴν�����Ԫ��
		}
		cin.ignore(999, '\n');                  //����������������999���ַ���������'\n'

		if (c == 'y')
		{
			cout << "������������ѧ�� : ";
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
		cout << "�Ƿ�Ҫ�޸�����У԰������? (y/n)" << endl;
		cin >> c;

		while (cin.fail())          //��������cin�쳣
		{
			cout << "��������������: ";  //���������Ϣ
			cin.clear();                            //������쳣״̬
			cin.ignore(999, '\n');                  //����������������999���ַ���������'\n'

			cin >> c;                 //�ٴν�����Ԫ��
		}
		cin.ignore(999, '\n');                  //����������������999���ַ���������'\n'

		if (c == 'y')
		{
			cout << "����������ԭʼ���� : " << endl;
			cout << "��ʾ�������������һ���޸����룬��ԭʼ����Ϊ000000" << endl;
			cin >> newString;
			bool match = strcmp(password, newString);
			if (match != true) //ƥ��ɹ�
			{
				cout << "���������������� : ";
				cin >> password;
				writeRegisty();//������Ҫ�޸�һ��
			}
			else
			{
				cout << "���������ֻʣ�� " << --times << " �γ��ԵĻ����ˣ�" << endl;
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
	cout << "δע����û���" << endl;

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
		cout << "�ɹ�!" << endl;
		return i;
	}
	else
	{
		cout << "�������!" << endl;
		return LOGIN_FAILED;
	}

	return ERROR;
}

void CStudent::showInfo()
{
	cout << "**********************" << endl;
	cout << "*  ����: " << name << endl << "*  ѧ��: " << id << endl;
	cout << "*  ���: " << balance << endl ;
	cout << "*  ����: " << cardID << endl;
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
		cout << "���Ŀ��ѹ�ʧ!" << endl;
		return ERROR;
	}

	char c;
	cout << "ȷ��Ҫ��ֵ " << amount << " Ԫ?(y/n) " << endl;
	cin >> c;

	while (cin.fail())          //��������cin�쳣
	{
		cout << "��������������: ";  //���������Ϣ
		cin.clear();                            //������쳣״̬
		cin.ignore(999, '\n');                  //����������������999���ַ���������'\n'

		cin >> c;                 //�ٴν�����Ԫ��
	}
	cin.ignore(999, '\n');                  //����������������999���ַ���������'\n'

	if (c == 'y')
	{
		balance += amount;
		cout << "��ֵ�ɹ�!" << endl;
		cout << "����ǰ�����Ϊ " << balance << " Ԫ." << endl;
		return OK;
	}
	else
	{
		cout << "������ֵ!" << endl;
		return ERROR;
	}
}

bool CStudent::eating(int choice)
{
	char c;

	if (cardStatus == LOCK)
	{
		cout << "���Ŀ��ѹ�ʧ!" << endl;
		return ERROR;
	}

	cout << "��ѡ�� ";
	cout << foodList[choice].food << endl;
	cout << "ȷ����(y/n)";
	cin >> c;

	while (cin.fail())          //��������cin�쳣
	{
		cout << "��������������: ";  //���������Ϣ
		cin.clear();                            //������쳣״̬
		cin.ignore(999, '\n');                  //����������������999���ַ���������'\n'

		cin >> c;                 //�ٴν�����Ԫ��
	}
	cin.ignore(999, '\n');                  //����������������999���ַ���������'\n'

	if (c == 'y')
	{
		if (foodList[choice].price == 0)
		{
			cout << "�˳�" << endl;
			return ERROR;
		}
		if (balance < foodList[choice].price)
		{
			cout << "���㣬���ֵ! " << endl;
		}
		else
		{
			balance -= foodList[choice].price;
			cout << "�������� " << foodList[choice].food << " , ���� " << foodList[choice].price << " Ԫ" << endl;
			cout << "������ʣ " << balance << " Ԫ." << endl;
		}
		return OK;
	}
	else
	{
		cout << "�ѷ��� " << foodList[choice].food << " ." << endl;
	}

	return OK;
}

bool CStudent::consumption()
{
	if (cardStatus == LOCK)
	{
		cout << "���Ŀ��ѹ�ʧ!" << endl;
		return ERROR;
	}
	return OK;
}

bool CStudent::lockCard()
{
	char newString[20];

	cout << "���������� : ";
	cin >> newString;

	while (cin.fail())          //��������cin�쳣
	{
		cout << "��������������: ";  //���������Ϣ
		cin.clear();                            //������쳣״̬
		cin.ignore(999, '\n');                  //����������������999���ַ���������'\n'

		cin >> newString;                 //�ٴν�����Ԫ��
	}
	cin.ignore(999, '\n');                  //����������������999���ַ���������'\n'

	int match = strcmp(password, newString);

	if (match == 0)
	{
		cardStatus = LOCK;
		cout << "���Ŀ��ѹ�ʧ.  " << endl;
		return OK;
	}
	else
	{
		cout << "�������!" << endl;
		return ERROR;
	}
}

bool CStudent::unlockCard()
{
	char newString[20];

	cout << "���������� : ";
	cin >> newString;

	while (cin.fail())          //��������cin�쳣
	{
		cout << "��������������: ";  //���������Ϣ
		cin.clear();                            //������쳣״̬
		cin.ignore(999, '\n');                  //����������������999���ַ���������'\n'

		cin >> newString;                 //�ٴν�����Ԫ��
	}
	cin.ignore(999, '\n');                  //����������������999���ַ���������'\n'

	int match = strcmp(password, newString);

	if (match == 0)
	{
		cardStatus = UNLOCK;
		cout << "���Ŀ��ѽ��!" << endl;
		return OK;
	}
	else
	{
		cout << "�������!" << endl;
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
		cout << "��������!" << endl;
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
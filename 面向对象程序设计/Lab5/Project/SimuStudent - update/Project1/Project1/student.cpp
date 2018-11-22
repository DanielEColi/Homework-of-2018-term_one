//student.cpp

#include <iostream>
#include <stdlib.h>
#include "student.h"

using namespace std;

#define random(x)  (rand()%x)		//����һ�������

typedef struct 
{
	char food[20];				//����
	float price;					//�۸�
}FoodNode;

FoodNode foodList[3] = { {"һ���׷�", 2.5}, {"һ����ͷ", 3.0}, {"�˳�", 0} };	//�˵�

int CStudent::s_userNum = 0;		//��ʼ���û���Ŀ
int CStudent::s_userMax = 0;		//��ʼ������û���Ŀ
User CStudent::s_registry[20] = { {"000000", "000000"} };	//��ʼ��ע���

CStudent::CStudent()			//�޲ι��캯��
{
	int sizeofname = 0;			//������������������ȵı���
	int match = OK;				//�����������ƥ��ı���

	sizeofname = strlen("Ĭ��");				//Ĭ�ϳ�ʼ������ΪĬ��
	name = new char[sizeofname + 1];		//�����ڴ�ռ�
	if (name == NULL)							//����ʧ��
	{
		cout << "�����ڴ�ռ�ʧ��" << endl;	//��ӡ��Ϣ
		exit(0);												//��ֹ����
	}
	strcpy(name, "Ĭ��");							//�����ַ�������Ա����name
	id = random(70) + 2016222000;			//���������ѧ��
	balance = 0.0;										//��ʼ���Ϊ0
	cardStatus = UNLOCK;							//����״̬Ϊ���
	randString('0', '9', cardID, 6);			//��������Ŀ���

	while (1)
	{
		for (int i = 0; match != ERROR && i < s_userMax; i++) //��ѯע���
		{
			match = strcmp(cardID, s_registry[i].l_cardID);	  //�����ɵ�ѧ����ע���Ƚ�
		}

		if (match == ERROR)						//������ɵĿ�����ע���������
		{
			randString('0', '9', cardID, 6);	//�ٴ�����һ������Ŀ��ţ������Ƚ�
		}
		else
		{
			break;											//����ѭ��
		}
	}
	
	strcpy(password, "000000");				//Ĭ�ϳ�ʼ����Ϊ000000
	tableNumber = s_userMax;					//ע������
	writeRegisty();										//����ע���
	s_userMax++;										//ע������������1
}
//�вι��캯��
CStudent::CStudent(const char *i_name, const int i_id, const char *i_cardID, const char *i_password)
{
	int sizeofname = 0;

	sizeofname = strlen(i_name);			//��ȡ�����ĳ���
	name = new char[sizeofname + 1];		//�����ڴ�ռ�
	if (name == NULL)							//����ʧ��
	{
		cout << "�����ڴ�ռ�ʧ��" << endl;	//��ӡ��Ϣ
		exit(0);												//��ֹ����
	}
	strcpy(name, i_name);					//������������Ա����
	id = i_id;										//����ѧ�ŵ���Ա����
	balance = 0.0;								//��ʼ���Ϊ0
	cardStatus = UNLOCK;					//����״̬Ϊ���
	strcpy(cardID, i_cardID);			//�������ŵ���Ա����
	strcpy(password, i_password);		//�������뵽��Ա����
	tableNumber = s_userMax;			//ע������
	writeRegisty();								//����ע���
	s_userMax++;								//ע������������1
}

CStudent::~CStudent()					//��������
{	
	delete[] name;								//�ͷ�ָ��name
}

bool CStudent::registerUser(void)	//ע���û�
{
	if (s_userNum >= s_userMax)		//����û��������������ֵ
	{
		cout << "�û��ѱ���" << endl;		//��ӡ��Ϣ
		return ERROR;							//���ش���
	}

	tableNumber = s_userNum;			//ȷ���û����
	changeInfo();								//�޸��û���Ϣ
	s_userNum++;								//�û�����1

	cout << endl << "ע�����˻���Ϣ���� : " << endl;	
	showInfo();									//��ʾע�����û���Ϣ
	cout << "������μ�! " << endl;

	return OK;									//������ȷ
}

bool CStudent::changeInfo(void)		//�޸��û���Ϣ
{
	if (cardStatus == LOCK)				//������ѹ�ʧ
	{
		cout << "���Ŀ��ѹ�ʧ!" << endl;//��ӡ��Ϣ
		return ERROR;							//���ش���
	}

	char c = 'y';									//��ֵΪ'y'
	char newString[20];						
	int times = 5;								//���Գ���5��

	while (c == 'y')								//��c��ֵΪ'y'ʱ
	{
		cout << "��������� " << name << " , �Ƿ�����޸�? (y/n)" << endl; //��ӡ��Ϣ
		cin >> c;										//�����û�����

		while (cin.fail())						//��������cin�쳣
		{
			cout << "��������������: ";		//���������Ϣ
			cin.clear();								//������쳣״̬
			cin.ignore(999, '\n');               //����������������999���ַ���������'\n'

			cin >> c;										//�ٴν�����Ԫ��
		}
		cin.ignore(999, '\n');					//����������������999���ַ���������'\n'

		if (c == 'y')								//���c��ֵΪ'y'
		{
			int sizeofname;						//����������������ĳ���
			char i_name[20];					//�������������û�����
			cout << "���������������� : ";		//��ӡ��Ϣ
			cin >> i_name;								//����
			sizeofname = strlen(i_name);		//��ȡ�����ĳ���
			delete [] name;								//�ͷ�name��ռ���ڴ�ռ�
			name = new char[sizeofname + 1];		//��������һ���µ��ڴ�ռ�
			if (name == NULL)									//����ʧ��
			{
				cout << "�����ڴ�ռ�ʧ��" << endl;		//��ӡ����
				exit(0);													//��ֹ����
			}
			strcpy(name, i_name);								//�����ַ�������Ա����
		}
		else
		{
			break;											//����ѭ��
		}
	}

	c = 'y';						//��ֵΪ'y'�����ܽ���ѭ��	

	while (c == 'y')			//ѭ����ֱ���û�����'n'
	{
		cout << "����ѧ��Ϊ " << id << " , �Ƿ�����޸�? (y/n)" << endl;
		cin >> c;

		while (cin.fail())          //��������cin�쳣
		{
			cout << "��������������: ";		//���������Ϣ
			cin.clear();								//������쳣״̬
			cin.ignore(999, '\n');				//����������������999���ַ���������'\n'

			cin >> c;										//�ٴν�����Ԫ��
		}
		cin.ignore(999, '\n');					//����������������999���ַ���������'\n'

		if (c == 'y')									//�û�����'y'
		{
			cout << "������������ѧ�� : ";	//��ӡ��Ϣ
			cin >> id;									//����ѧ��
		}
		else
		{
			break;										//����ѭ��
		}
	}

	c = 'y';												//��ֵΪ'y'�����ܽ���ѭ��	
	while (c == 'y' && times >= 0)				//����ѭ���������û�����'n'���߿ɳ��Դ���Ϊ0
	{
		cout << "�Ƿ�Ҫ�޸�����У԰������? (y/n)" << endl;		//��ӡ��Ϣ
		cin >> c;											//�����û�����

		while (cin.fail())							//��������cin�쳣
		{
			cout << "��������������: ";		//���������Ϣ
			cin.clear();								//������쳣״̬
			cin.ignore(999, '\n');				//����������������999���ַ���������'\n'

			cin >> c;										//�ٴν�����Ԫ��
		}
		cin.ignore(999, '\n');					//����������������999���ַ���������'\n'

		if (c == 'y')									//����û�����'y'
		{
			cout << "����������ԭʼ���� : " << endl;
			cout << "��ʾ�������������һ���޸����룬��ԭʼ����Ϊ000000" << endl;
			cin >> newString;						//�����û�����
			bool match = strcmp(password, newString);		//���������ƥ��
			if (match != true)						//ƥ��ɹ�
			{
				cout << "���������������� : ";
				cin >> password;					//�����µ�����
				writeRegisty();						//������Ҫ�޸�һ��
			}
			else
			{
				cout << "���������ֻʣ�� " << --times << " �γ��ԵĻ����ˣ�" << endl;
			}
		}
	}
	writeRegisty();		//����ע���

	return OK;
}

int CStudent::login(char *i_cardID, char *i_password)	//��¼
{
	int match = cmpPassword(i_cardID, i_password);		//ƥ������

	if (match > LOGIN_FAILED)		//ƥ��ɹ�
	{
		return match;							//����ƥ�䵽�����
	}
	else
	{
		return LOGIN_FAILED;			//����ʧ��
	}
}

int CStudent::searchAccount(char *i_cardID)				//��ѯ�˻�
{
	for (int i = 0; i < s_userNum; i++)								//ע������������
	{
		if (!strcmp(i_cardID, s_registry[i].l_cardID))		//����ҵ�ƥ���
		{
			return i;			//�������
		}
	}
	cout << "δע����û���" << endl;		//Ϊƥ�䵽����ӡ��Ϣ

	return LOGIN_FAILED;					//����ʧ��
}

int CStudent::cmpPassword(char *i_cardID, char *i_cardPassword)	//ƥ������
{
	int i = searchAccount(i_cardID);		//��ѯ�˻�

	if (i <= LOGIN_FAILED)					//����˻�������
	{
		return LOGIN_FAILED;				//����ʧ��
	}
	
	if (!strcmp(i_cardPassword, s_registry[i].l_cardPassword))		//�Ƚ������Ƿ���ƥ��
	{
		cout << "�ɹ�!" << endl;			//��ӡ��Ϣ
		return i;								//�������
	}
	else
	{
		cout << "�������!" << endl;	//�������
		return LOGIN_FAILED;		//����ʧ��
	}
}

inline void CStudent::showInfo()			//��ӡ�û���Ϣ
{
	cout << "**********************" << endl;
	cout << "*  ����: " << name << endl << "*  ѧ��: " << id << endl;
	cout << "*  ���: " << balance << endl ;
	cout << "*  ����: " << cardID << endl;
	cout << "**********************" << endl;
}

inline void CStudent::writeRegisty(void)	//����ע���
{
	strcpy(s_registry[tableNumber].l_cardID, cardID);
	strcpy(s_registry[tableNumber].l_cardPassword, password);
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
		cout << "��������������: ";		//���������Ϣ
		cin.clear();								//������쳣״̬
		cin.ignore(999, '\n');				//����������������999���ַ���������'\n'

		cin >> c;										//�ٴν�����Ԫ��
	}
	cin.ignore(999, '\n');					//����������������999���ַ���������'\n'

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

bool CStudent::eating(int choice)			//�ò�
{
	char c;									//�����ַ�����

	if (cardStatus == LOCK)		//�����ѹ�ʧ
	{
		cout << "���Ŀ��ѹ�ʧ!" << endl;	//��ӡ��Ϣ
		return ERROR;					//���ش���
	}

	cout << "��ѡ�� ";	
	cout << foodList[choice].food << endl;	//����û�ѡ��Ĳ���
	cout << "ȷ����(y/n)" << endl;					//��ӡ
	cin >> c;													//���û�ȷ��

	while (cin.fail())							//��������cin�쳣
	{
		cout << "��������������: ";		//���������Ϣ
		cin.clear();								//������쳣״̬
		cin.ignore(999, '\n');				//����������������999���ַ���������'\n'

		cin >> c;										//�ٴν�����Ԫ��
	}
	cin.ignore(999, '\n');					//����������������999���ַ���������'\n'

	if (c == 'y')									//�û�ȷ��
	{
		if (foodList[choice].price == 0)	//���ѡ���˳�
		{
			cout << "�˳�" << endl;
			return ERROR;						//���ش���
		}
		if (balance < foodList[choice].price)	//�������
		{
			cout << "���㣬���ֵ! " << endl;	//��ӡ���
		}
		else
		{
			balance -= foodList[choice].price;		//�۳����
			//��ӡ������Ϣ
			cout << "�������� " << foodList[choice].food << " , ���� " << foodList[choice].price << " Ԫ" << endl;
			cout << "������ʣ " << balance << " Ԫ." << endl;
		}
		return OK;	//���سɹ�
	}
	else
	{
		cout << "�ѷ��� " << foodList[choice].food << " ." << endl;
		return OK;	//���سɹ�
	}
}

bool CStudent::lockCard()
{
	char newString[20];

	cout << "���������� : ";
	cin >> newString;							//��������

	while (cin.fail())							//��������cin�쳣
	{
		cout << "��������������: ";		//���������Ϣ
		cin.clear();								//������쳣״̬
		cin.ignore(999, '\n');				//����������������999���ַ���������'\n'

		cin >> newString;						//�ٴν�����Ԫ��
	}
	cin.ignore(999, '\n');					//����������������999���ַ���������'\n'

	int match = strcmp(password, newString);		//�Ƚ�����

	if (match == 0)								//������ȷ
	{
		cardStatus = LOCK;					//��ʧ
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
	char newString[20];						//�����ַ�������

	cout << "���������� : ";
	cin >> newString;							//��������

	while (cin.fail())							 //��������cin�쳣
	{
		cout << "��������������: ";		//���������Ϣ
		cin.clear();								//������쳣״̬
		cin.ignore(999, '\n');				//����������������999���ַ���������'\n'

		cin >> newString;						//�ٴν�����Ԫ��
	}
	cin.ignore(999, '\n');					//����������������999���ַ���������'\n'

	int match = strcmp(password, newString);	//�Ƚ�����

	if (match == 0)								//������ȷ
	{
		cardStatus = UNLOCK;				//���
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
	return cardStatus;		//���ؿ�״̬
}

int   CStudent::getUserNum(void)
{
	return s_userNum;		//���ص�ǰ�û���Ŀ
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
		//�������һ���ַ�
		c = (char)(((double)rand() / RAND_MAX)*(ending_c - starting_c) + starting_c);
		i_string[i] = c;
	}

	i_string[i] = '\0';	//��β���Ͻ�����

	return OK;
}
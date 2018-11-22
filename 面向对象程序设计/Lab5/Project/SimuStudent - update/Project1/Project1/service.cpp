//service.cpp

#include "service.h"
#include <iostream>

using namespace std;

CStudent *stu = new CStudent[10];	//����CStudent���͵Ķ�������

int showMenu(void)			//��ʾʳ�ò˵�
{
	int choice;					//�������ڻ�ȡ�û�ѡ��

	cout << "------------------------- MENU --------------------------" << endl << endl;
	cout << "  ***************" << endl;
	cout << "  |�������ṩ�� |" << endl;
	cout << "  |1.�׷� 2.5/��|" << endl;
	cout << "  |2.��ͷ 3.0/��|" << endl;
	cout << "  |3.�˳�       |" << endl;
	cout << "  ***************" << endl << endl;
	cout << "��ѡ��---";

	cin >> choice;
	choice--;
	while (choice >= MENU_LIST)				//���û��������ֵ������Χʱ
	{
		cout << "��������������!" << endl;	//��ʾ����
		cin >> choice;										//��������
	}

	cout << endl << endl;
	return choice;		//�����û���ѡ��
}

int showService(void)		//��ʾ����˵�
{
	int choice;					//�������ڻ�ȡ�û�ѡ��

	cout << "-------------------------- SERVICE -------------------------" << endl;
	cout << "��ѡ�����" << endl;
	cout << "1.ע��" << endl;
	cout << "2.��¼" << endl;
	cout << "3.�ò�" << endl;
	cout << "4.ע��" << endl;
	cout << "5.��ֵ" << endl;
	cout << "6.��ʧ/���" << endl;
	cout << "7.��ѯ" << endl;
	cout << "8.�޸���Ϣ" << endl;
	cout << "9.�˳�" << endl;
	cout << "��ѡ��---";

	cin >> choice;		
	choice--;
	while (choice >= SERVICE_MAX)				//���û��������ֵ������Χʱ
	{
		cout << "��������������!" << endl;		//��ʾ����
		cin >> choice;											//��������
	}

	cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;

	return choice;		//�����û���ѡ��
}

void processChoice(int choice, CStudent *&object)
{
	static bool s_loaded = ERROR;		//����û��Ƿ��¼
	bool result = ERROR;					//���ո��෵�ؽ��
	char c;											//�����û�������
	int getChoice;								//�����û���ʳ�ò˵���ѡ��
	int i;												//��¼�û������

	switch (choice)								
	{
	case REGISTER:
		cout << "-------------------------- REGISTER -------------------------" << endl;
		if (s_loaded == OK)
		{
			cout << "�����˳���¼!" << endl;
			cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
			break;
		}
		int num;
		num = CStudent::getUserNum();
		result = stu[num].registerUser();
		if (result == ERROR)
		{
			cout << "����" << endl;
		}
		cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
		break;
	case LOGIN:
		cout << "-------------------------- LOGIN -------------------------" << endl;
		if (s_loaded == OK)
		{
			cout << "���Ѿ���¼������ע����¼!" << endl;
			cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
			break;
		}

		char getcardID[10];
		char getpassword[10];

		cout << "��ʾ���������δӵ���˺ţ������˳���ע���˺�!" << endl;
		cout << "���������Ŀ��� (��λ����) : ";
		cin >> getcardID;
		cout << "��������������  (��λ����) : ";
		cin >> getpassword;
		i = CStudent::login(getcardID, getpassword);

		if (i > LOGIN_FAILED)
		{
			cout << "��¼�ɹ�!" << endl;
			s_loaded = OK;
			object = &stu[i];
		}
		else
		{
			cout << "��¼ʧ�ܣ������³���" << endl;
			object = NULL;
			s_loaded = ERROR;
		}
		cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;

		break;
	case DINE:
		cout << "-------------------------- DINE -------------------------" << endl;
		if (s_loaded == ERROR)
		{
			cout << "���ȵ�¼��лл!" << endl;
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
			cout << "����δ��¼�˺�!" << endl;
			cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
			break;
		}

		cout << "��ȷ��Ҫע���˺���? (y/n) ";
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
			cout << "��ע��." << endl;
			s_loaded = ERROR;
			object = NULL;
		}
		else
		{
			cout << "���ѷ���ע���˺�!" << endl;
		}
		cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
		break;
	case RECHARGE:
		cout << "-------------------------- RECHAGER -------------------------" << endl;
		if (s_loaded == ERROR)
		{
			cout << "���ȵ�¼��лл!" << endl;
			cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
			break;
		}
		float money;
		cout << "���������ĳ�ֵ���? ";
		cin >> money;
		object->cardRecharge(money);
		cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
		break;
	case LOCK_UNLOCK:
		cout << "-------------------------- LOCK_UNLOCK -------------------------" << endl;
		char c;
		char getString[10];
		cout << "���������Ŀ��� : ";
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
			cout << "���Ŀ����ڹ�ʧ���Ƿ���? (y/n) ";
		}
		else
		{
			cout << "���Ŀ����ڽ��״̬���Ƿ��ʧ? (y/n) ";
		}

		cin >> c;

		while (cin.fail())          //��������cin�쳣
		{
			cout << "��������������: ";  //���������Ϣ
			cin.clear();                            //������쳣״̬
			cin.ignore(999, '\n');                  //����������������999���ַ���������'\n'

			cin >> c;                 //�ٴν�����Ԫ��
		}
		cin.ignore(999, '\n');                  //����������������999���ַ���������'\n'

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
			cout << "�˳�" << endl;
		}
		cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
		break;
	case SEARCH:
		cout << "-------------------------- SEARCH -------------------------" << endl;
		if (s_loaded == ERROR)
		{
			cout << "����δ��¼!" << endl;
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
			cout << "����δ��¼!" << endl;
			cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
			break;
		}
		object->changeInfo();
		cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
		break;
	case LEAVE:
		cout << "-------------------------- LEAVE -------------------------" << endl;
		cout << "��ȷ��Ҫ�˳���?(y/n)" << endl;
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
			cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
			exit(0);
		}
		else
		{
			cout << "-------------------------- FINISH --------------------------" << endl << endl << endl;
			break;
		}
	default:
		break;
	}
}

#include <iostream>
#include "student.h"

using namespace std;

void showMenu(void)
{
	cout << "----------------------" << endl;
	cout << "�������ṩ��" << endl;
	cout << "1.�׷� 2.5/��" << endl;
	cout << "2.��ͷ 3.0/��" << endl;
	cout << "3.�ѳԱ����˳�" << endl;
	cout << "4.��ֵ" << endl;
	cout << "5.��ʧ/���" << endl;
	cout << "6.��ѯ" << endl;
	cout << "��ѡ��---";
}

int main()
{
	int choice;
	CStudent stu1("����", 2016222000, "123456", "147258");
	stu1.showInfo();
	stu1.cardRecharge(10);
	showMenu();
	cin >> choice;
	
	return 0;
}
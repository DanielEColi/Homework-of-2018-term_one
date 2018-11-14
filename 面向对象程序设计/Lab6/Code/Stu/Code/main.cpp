#include <iostream>
#include "student.h"

using namespace std;

void showMenu(void)
{
	cout << "----------------------" << endl;
	cout << "本餐厅提供：" << endl;
	cout << "1.米饭 2.5/两" << endl;
	cout << "2.芋头 3.0/个" << endl;
	cout << "3.已吃饱，退出" << endl;
	cout << "4.充值" << endl;
	cout << "5.挂失/解挂" << endl;
	cout << "6.查询" << endl;
	cout << "请选择---";
}

int main()
{
	int choice;
	CStudent stu1("狗蛋", 2016222000, "123456", "147258");
	stu1.showInfo();
	stu1.cardRecharge(10);
	showMenu();
	cin >> choice;
	
	return 0;
}
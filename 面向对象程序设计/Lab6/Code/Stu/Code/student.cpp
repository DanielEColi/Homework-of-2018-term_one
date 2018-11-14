#include <iostream>
#include "student.h"

using namespace std;

CStudent::CStudent()
{
	strcpy(name, "default");
	id = 2016222000;
	balance = 0.0;
	strcpy(cardID, "000000");
	strcpy(password, "000000");
}

CStudent::CStudent(const char *i_name, const int i_id, const char *i_cardID, const char *i_password)
{
	strcpy(name, i_name);
	id = i_id;
	balance = 0.0;
	strcpy(cardID, i_cardID);
	cardID[6] = '\0';
	strcpy(password, i_password);
}

void CStudent::showInfo()
{
	cout << "NAME: " << name << endl << "ID: " << id << endl;
	cout << "BALANCE: " << balance << endl << "CARDID: " << cardID << endl;
}

bool CStudent::cardRecharge(float amount)
{
	cout << "³äÖµ " << amount << "Ôª" << endl;
	balance = amount;
	return OK;
}

bool CStudent::eating(void)
{
	return 0;
}

bool CStudent::consumption()
{

	return OK;
}

bool CStudent::loseCard()
{
	return OK;
}

bool CStudent::regainCard()
{
	return OK;
}
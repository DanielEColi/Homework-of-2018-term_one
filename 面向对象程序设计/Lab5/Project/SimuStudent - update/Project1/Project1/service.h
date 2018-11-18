#ifndef _SERVICE_H_
#define _SERVICE_H_

#include "student.h"

typedef enum {
	REGISTER,			//ע��
	LOGIN,				//��¼
	DINE,					//�ò�
	LOGOUT,				//ע��
	RECHARGE,			//��ֵ
	LOCK_UNLOCK,	//��ʧ&���
	SEARCH,				//��ѯ
	CHANGE_INFO,	//������Ϣ
	LEAVE,					//�뿪
	SERVICE_MAX	//ö�����ֵ
}ServiceList;

typedef enum {
	RICE,				//�׷�
	TARO,				//��ͷ
	EXIT,				//�˳�
	MENU_LIST	//ö�����ֵ
}MenuList;

int showMenu(void);			//��ʾ�˵�
int showService(void);		//��ʾ����
void processChoice(int choice, CStudent *&object);	//�����û�ѡ��

#endif // !_SERVICE_H_


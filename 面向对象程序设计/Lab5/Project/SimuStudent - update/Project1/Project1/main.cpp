#include <iostream>
#include "student.h"
#include "service.h"

using namespace std;

int main()			//������
{
	int getChoice;						//�������ڻ�ȡ�û���ѡ��
	CStudent *p_stu = NULL;		//��ʼ��CStudentָ��

	while (1)
	{
		getChoice = showService();			//��ʾ����˵�����ȡ�û�ѡ��
		processChoice(getChoice, p_stu);//�����û�ѡ��
	}

	return 0;											//����ִ�н���������0
}


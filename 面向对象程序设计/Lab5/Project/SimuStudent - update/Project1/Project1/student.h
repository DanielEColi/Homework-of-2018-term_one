#ifndef _STUDENT_H_
#define _STUDENT_H_

#define LOGIN_FAILED -1  //�����¼ʧ��ʱ�����ķ���ֵ

typedef struct						//�����û�ע���Ľڵ�
{
	char l_cardID[7];				//ע��Ŀ���
	char l_cardPassword[7];  //ע��Ŀ��Ŷ�Ӧ������
}User;

typedef enum
{
	ERROR,	//�������Ϊ0
	OK			//������ȷΪ1
}Status;		//ö�٣��������

typedef enum
{
	LOCK,				//��ʧ
	UNLOCK			//���
}e_cardStatus;		//ö�٣�����״̬

class CStudent
{
private:
	//˽�о�̬����
	static User s_registry[20];		//����һ����̬���û�ע�������
	static int s_userMax;				//���֧�ֵ��û�����
	static int s_userNum;				//���е��û�����
	//˽�б���
	char  *name;								//�û���
	unsigned long   id;						//ѧ��
	float balance;							//���
	char  cardID[7];						//У԰����
	char  password[7];					//����
	int tableNumber;						//��Ӧ��ע������
	bool cardStatus;						//����״̬����ʧ/��ң�
	//˽�к���
	static int cmpPassword(char *i_cardID, char *i_cardPassword);	//�˶����뺯��
	void writeRegisty(void);																//дע�����
public:
	CStudent();			//�޲ι��캯��
	//���βεĹ��캯��
	CStudent(const char *i_name, const int i_id, const char *i_cardID, const char *i_password);
	~CStudent();		//��������
	
	static int searchAccount(char *i_cardID);				//��ѯ�û��Ƿ���ע��
	static int login(char *i_cardID, char *i_password);	//�û���¼
	static int getUserNum(void);									//��ȡ��ע���û�����Ŀ

	bool registerUser(void);						//ע���û�
	void showInfo(void);								//��ʾ�û���Ϣ
	bool changeInfo(void);							//�����û���Ϣ
	bool cardRecharge(float amount);		//��ֵ
	bool eating(int choice);							//�ò�
	bool lockCard(void);								//��ʧ
	bool unlockCard(void);							//���
	bool getcardStatus(void);						//��ȡ����״̬
};

bool randString(char starting_c, char ending_c, char *i_string,  int s_length);	//��������ַ���

#endif
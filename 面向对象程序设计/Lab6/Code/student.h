#ifndef _STUDENT_H_
#define _STUDENT_H_

class CStudent
{
private:
  char name[20];
  int  id;
  float balance;
public:
  CStudent();
  CStudent(char *pname, int nid, float nbalance);

};
#endif

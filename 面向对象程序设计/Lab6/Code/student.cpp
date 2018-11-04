#include "student.h"
#include <string.h>

CStudent::CStudent()
{
  strcpy(name, "Default User");
  id = 2016222000;
  balance = 0;
}

CStudent::CStudent(char *pname, int nid, float nbalance)
{
  strcpy(name, pname);
  id = nid;
  balance = nbalance;
}

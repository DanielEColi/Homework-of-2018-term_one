#include <iostream>
using namespace std;

int main()
{
  short choice;

  cout << "本餐厅提供：" << endl;
  cout << "1、米饭 2.5/两" << endl;
  cout << "2、芋头 3.0/个" << endl;
  cout << "3、已吃饱，退出" << endl;
  cout << "请选择——";
  cin >> choice;
  cout << choice << endl;

  system("pause");
  return 0;
}

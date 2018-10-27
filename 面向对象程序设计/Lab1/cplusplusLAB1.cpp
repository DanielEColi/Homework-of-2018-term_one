/*********************************************************************************************************
* 												头文件及命名空间
*********************************************************************************************************/
#include <iostream>
using namespace std;
/*********************************************************************************************************
* 												宏定义
*********************************************************************************************************/
#define ARRAY_SIZE 100    //定义数组的大小

/*********************************************************************************************************
* 												函数声明
*********************************************************************************************************/
void bubbleSortArray(int *array, int len);          //冒泡排序
void selectSortArray(int *array, int len);          //选择排序
void quickSortArray(int *array, int low, int high); //快速排序
void shellSortArray(int *array, int len);           //希尔排序
void insertSortArray(int *array, int len);          //插入排序

/*********************************************************************************************************
* 												 类定义
*********************************************************************************************************/
class MyArray{
	friend ostream& operator << (ostream &out, MyArray &obj);//重载流插入运算符
	friend istream& operator >> (istream &in, MyArray &obj); //重载流提取运算符
public:
	int seq[ARRAY_SIZE]; //对象的数组，数组长度为ARRAY_SIZE
	int len;             //数组已使用长度

	MyArray()            //构造函数
	{
		for (int i = 0; i < ARRAY_SIZE; i++)  //利用循环对数组所有元素进行初始化
		{
			this->seq[i] = 0; 
		}
		len = 0;                              //初始化后使用长度为0
	}

  void clearArray(void)
  {
		for (int i = 0; i < this->len; i++)  //利用循环对数组所有元素进行初始化
		{
			this->seq[i] = 0; 
		}
		len = 0;                              //初始化后使用长度为0
  }
};

ostream& operator << (ostream &out, MyArray &obj) //重载流插入运算符
{
	if (obj.len == 0)       //如果对象数组里面并没有内容
	{
		out << "There is nothing in the array!" << endl;  //输出错误信息
		return out;           //返回
	}

	for (int i = 0; i < obj.len; i++) //逐个输出对象中的成员数组的元素
	{
		out << obj.seq[i] << " ";	
	}

	return out;             //返回
}

istream& operator >> (istream &in, MyArray &obj)  //重载流提取运算符
{
	in >> obj.seq[obj.len]; //将新元素加入对象数组中
  while(cin.fail())          //输入引发cin异常
  {
    cout << "Error. Please input again: ";  //输出错误信息
    cin.clear();                            //先清除异常状态
    cin.ignore(999, '\n');                  //再清理缓冲区，清理999个字符或者碰到'\n'

	  in >> obj.seq[obj.len];                 //再次接受新元素
  }
  cin.ignore(999, '\n');                  //再清理缓冲区，清理999个字符或者碰到'\n'

	obj.len++;              //数组长度加1
	
	return in;
}

/*********************************************************************************************************
* 函数名称: main
* 函数功能: 主函数
* 输入参数: void 
* 输出参数: void
* 返 回 值: int
*********************************************************************************************************/
int main()
{
	MyArray test;         //声明一个MyArray对象test
	char code;            //用于接收是否放弃输入元素的标志（y为继续输入，n为结束输入）
    char keepon;

  do{
    do{
      cout << "Please enter a integer:";
      cin >> test;
      cout << "Now there are " << test.len << " in the array";
      cout << endl << "Do you still want to write?(y/n)   ";
      cin >> code;
      cin.ignore(999, '\n');                  //清理缓冲区，清理999个字符或者碰到'\n'
      while(code != 'y' && code != 'n')
      {
        cout << "Wrong command, Please input again(y/n):   ";
        cin >> code;
      }
    }while(code == 'y');  //如果用户输入y，继续等待用户的输入

    cout << "The Array is like this: ";
    cout << test << endl;                         //输出用户输入结束后的数组元素
	  //int a[] = {9,8,7,6,5,4,3,2,1};
	  //quickSortArray(test.seq, 0, test.len - 1);  //快速排序
	  shellSortArray(test.seq, test.len);           //希尔排序
	  //insertSortArray(test.seq, test.len);        //插入排序
	  //bubbleSortArray(test.seq, test.len);        //冒泡排序
	  //selectSortArray(test.seq, test.len);        //选择排序

	  cout << "The length of the array is " << test.len << " in the end" << endl;  //输出最终数组的长度
    cout << "The array after sorting is : "<< test << endl;                   //输出排序后的数组元素

    test.clearArray();

    cout << "Do you want to creat a new array?(y/n)   ";
    cin >> keepon;
  }while(keepon == 'y');

  cout << "Thank you!";

  return 0;
}
/*********************************************************************************************************
* 												函数实现
*********************************************************************************************************/
/*********************************************************************************************************
* 函数名称: bubbleSortArray
* 函数功能: 冒泡排序
* 输入参数: array：数组；len：数组长度
* 输出参数: void
* 返 回 值: void 
*********************************************************************************************************/
void bubbleSortArray(int *array, int len)
{
	for(int i = 0; i < len - 1; i++)
	{
		int change = 1;   //是否已具有顺序的标志

		for (int j = 0; j < len -1 - i; j++)
		{
			if (*(array+j) > *(array+j+1))  //小数往上（前）浮，大数往下（后）沉
			{
				change = 0;                   //发生过交换，表明元素还没排好序
				int temp = *(array+j);
				*(array+j) = *(array+j+1);
				*(array+j+1) = temp;
			}
		}

		if(change)    //如果循环中没有发生交换了，证明已有序，跳出循环
		{
			break;
		}
	}
}

/*********************************************************************************************************
* 函数名称: selectSortArray
* 函数功能: 选择排序
* 输入参数: array：数组；len：数组长度 
* 输出参数: void
* 返 回 值: void
*********************************************************************************************************/
void selectSortArray(int *array, int len)
{
	for(int i = 0; i < len - 1; i++)
	{
		int mini = 0;
    //从第i个开始，在第i个后面寻找最小值
		for(int j = i + 1, mini = i; j < len; j++) 
		{
			if(*(array + j) < *(array + mini))
			{
        //找到更小的值了，将索引赋给mini
				mini = j;
			}
		}
    //如果第i个元素后面有比i更小的值，即mini不等于i
		if(mini != i)
		{
      //将更小的值和第i个元素值交换
			int temp = *(array + i);
			*(array + i) =  *(array + mini);
			*(array + mini) = temp;
		}
	}
}

/*********************************************************************************************************
* 函数名称: quickSortArray
* 函数功能: 快速排序
* 输入参数: array：数组；low：较小的索引；high：较大的索引
* 输出参数: void
* 返 回 值: void
*********************************************************************************************************/
void quickSortArray(int *array, int low, int high)
{
	if (low >= high)
	{
		return;
	}

	int first = low;
	int last = high;
	int key = array[first];

	while (first < last)
	{
		while(first < last && array[last] >= key)
		{
			--last;
		}

		array[first] = array[last];

		while(first < last && array[first] <= key)
		{
			++first;
		}

		array[last] = array[first];
	}

	array[first] = key;
	quickSortArray(array, low, first - 1);
	quickSortArray(array, first + 1, high);
}

/*********************************************************************************************************
* 函数名称: shellSortArray
* 函数功能: 希尔排序
* 输入参数: array：数组；len：数组长度
* 输出参数: void
* 返 回 值: void
*********************************************************************************************************/
void shellSortArray(int *array, int len)
{
	if(len <= 1 || array == NULL)
	{
		return;   //如果数组的长度小于等于1或者数组空了，返回
	}

	for (int div = len / 2; div >= 1; div = div / 2) //每次都将数组长度减半，进行分组
	{
		for(int i = 0; i < div; i++)                  //对所分的每个组进行排序
    {
			for(int j = i; j < len - div; j += div)
			{
				for(int k = j; k < len; k += div)
				{
					if (array[j] > array[k])
					{
						int temp = array[j];
						array[j] = array[k];
						array[k] = temp;
					}
				}
			}
		}//当div等于1时，跳出循环

	}
}

/*********************************************************************************************************
* 函数名称: insertSortArray
* 函数功能: 插入排序
* 输入参数: array：数组；len：数组长度
* 输出参数: void
* 返 回 值: void
*********************************************************************************************************/
void insertSortArray(int *array, int len)
{
  int temp;

	for (int i = 1; i < len; i++)
	{
    int j;
    temp = array[i];                                //取出数组中第i个元素

    for(j = i - 1; j >= 0 && temp < array[j]; j--)  //找到更大的数，在它之前插入
    {
      array[j + 1] = array[j];                      //元素后移，挪出适合temp的位置
    }
    array[j + 1] = temp;                            //将值插入适当的位置
	}
}

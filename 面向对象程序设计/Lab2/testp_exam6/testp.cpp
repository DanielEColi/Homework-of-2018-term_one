// testp.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

#include "stdlib.h"
int main(int argc, char* argv[])
{
	printf("/*------------------ please run all test and say why  -------------------- */\n");
	{


	printf("/*------------------ test  1-------------------- */\n");
	
	int i = 0;

	
	int * p = &i;  

	*p = 0x02;

	printf(" i = 0x%x\n" , i );

	*p = 0x0102;

	printf(" i = 0x%x\n" , i );
	printf(" p = 0x%x, *p = 0x%x, i = 0x%x\n" ,p, *p , i);

	printf("/*------------------ exam  1-------------------- */\n");

	int * p1;
	p1 = p;
	* p1 = 0x3;

	printf(" p1 = 0x%x, *p1 = 0x%x, i = 0x%x\n" ,p1, *p1,  i );
	printf(" p = 0x%x, *p = 0x%x, i = 0x%x\n" ,p, *p , i);
	}

	{
	
	printf("/*------------------ test  2-------------------- */\n");

	int i = 0x01020304;

	char * p1 = (char *)&i;  

	*p1++ = 0x3;

	printf(" i = 0x%x\n" , i );

	printf("/*------------------ exam  2-------------------- */\n");
	

	unsigned char *pc;
	pc = (unsigned char *) &i;

	*pc++ = 0x90;
	*pc++ = 0x03;

	printf(" i = 0x%x\n" , i );
	printf(" pc[0] = 0x%x, pc[1] = 0x%x\n" , pc[0],pc[1] );

	}


	{

	printf("/*------------------ test  3-------------------- */\n");

	
	struct node{

		int a;

		int b;
	};

	struct node n;

	int i = 0x02;

	int * p1 = (int *)&i;  
		
	n.a = 0x01;
	n.b = * p1; 
	printf(" n.a = 0x%x n.b = 0x%x\n" , n.a, n.b );		

	int * pa = & n.a;
	int * pb = & n.b;

	*pa = 0x5;
	*pb = *pa + 1;
	printf(" n.a = 0x%x n.b = 0x%x\n" , n.a, n.b );

	printf("/*------------------ exam  3-------------------- */\n");

	*pa++ = 0x7;
	*pa++ = 0x8;
	printf(" n.a = 0x%x n.b = 0x%x\n" , n.a, n.b );
	*pb++ = 0x9;
	*pb++ = 0xa;
	printf(" n.a = 0x%x n.b = 0x%x\n" , n.a, n.b );

	}



		{	
	printf("/*------------------ ÀºøºÃ‚-------------------- */\n");

	struct node{
		char a;
		int b;
		short c;
	};
	struct node n;	
	n.a = 0x12345;    
	n.b = 0x23456;
	n.c = 0x34567;

	short *p = (short *)((int)&n + 1);

	* ++p = 1;
	* ++p = 10;
	* p++ = 20;
	printf(" n.a = 0x%x n.b = 0x%x n.c = 0x%x\n" , n.a, n.b, n.c );
	
	}	



	/*------------------ END test  -------------------- */
	printf("\n\n\t\tYou are the best now!\n\n\n");

	return 0;
}


n1=-3:5;
x1=impseq(0,-3,5);
n2=0:8;
x2=impseq(2,0,8);
[y,n]=sigadd(x1,n1,x2,n2);
stem(n,y);

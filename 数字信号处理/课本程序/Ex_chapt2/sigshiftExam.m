x=impseq(0,-5,5);
m=-5:5;
[y,n]=sigshift(x,m,-3);
stem(n,y);
function [xe,xo,m] = evenodd(x,n)
y = fliplr(x);
n1 = -fliplr(n);
[xe,m] = sigadd(0.5*x,n,0.5*y,n1);
[xo,m] = sigadd(0.5*x,n,-0.5*y,n1);
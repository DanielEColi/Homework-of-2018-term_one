% 第四章: 例 4.4:
%  用 ztrans 求 X(z)
%   x(n) = (n-2)(0.5)^(n-2)cos[pi*(n-2)/3]u(n-2)
x = 'n*((0.5)^n)*cos(pi*n/3)';
X = ztrans(x);
[nX,dX] = numden(X);
nX=expand(nX) 
dX = symmul(dX,'z^2'); dX=expand(dX)


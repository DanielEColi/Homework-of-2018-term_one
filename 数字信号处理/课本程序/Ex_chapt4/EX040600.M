% ������: �� 4.4:
%  �� ztrans �� X(z)
%   x(n) = (n-2)(0.5)^(n-2)cos[pi*(n-2)/3]u(n-2)
x = 'n*((0.5)^n)*cos(pi*n/3)';
X = ztrans(x);
[nX,dX] = numden(X);
nX=expand(nX) 
dX = symmul(dX,'z^2'); dX=expand(dX)


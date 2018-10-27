% 第四章: 例 4.10:
%  求不带复数的z反变换
%
b = [1,0.4*sqrt(2)]; a=[1,-0.8*sqrt(2),0.64];
[R,p,C] = residuez(b,a)
Mp=abs(p')   % 极点的幅度
Ap=angle(p')/pi   % 极点相角以 pi为单位 
[delta,n]=impseq(0,0,6)
x=filter(b,a,delta)
x=((0.8).^n).*(cos(pi*n/4)+2*sin(pi*n/4))

% 第五章: 例5.9: 循环对称性质
%
subplot(1,1,1)
% a) 画x((-n))N的图
n = 0:10; x = 10*(0.8) .^ n;
y = x(mod(-n,11)+1);
subplot(2,1,1); stem(n,x); title('初始序列')
ylabel('x(n)'); axis([-0.5,10.5,-1,11]);text(10.8,-1,'n')
subplot(2,1,2); stem(n,y); title('循环折叠序列')
ylabel('x(-n mod 11)'); axis([-0.5,10.5,-1,11]);text(10.8,-1,'n')
pause;
%print -deps2 me0509a.eps
%
% b) 验证性质
X = dft(x,11); Y = dft(y,11);
subplot(2,2,1); stem(n,real(X)); axis([-0.5,10.5,-5,50])
title('{DFT[x(n)]}的实部'); text(10.8,-5,'k')
subplot(2,2,2); stem(n,imag(X)); axis([-0.5,10.5,-20,20])
title('{DFT[x(n)]}的虚部');text(10.8,-20,'k')
subplot(2,2,3); stem(n,real(Y)); axis([-0.5,10.5,-5,50])
title('{DFT[x((-n))11]}的实部'); text(10.8,-5,'k')
subplot(2,2,4); stem(n,imag(Y)); axis([-0.5,10.5,-20,20])
title('{DFT[x((-n))11]}的虚部'); text(10.8,-20,'k')
%print -deps2 me0509b.eps

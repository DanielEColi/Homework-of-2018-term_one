% 第五章: 例5.10: 循环偶/奇性质
%
subplot(1,1,1)
% a) 画出xec(n) 和xoc(n)的图
n = 0:10; x = 10*(0.8) .^ n;
[xec,xoc] = circevod(x);
subplot(2,1,1); stem(n,xec); title('循环偶分量')
ylabel('xec(n)'); axis([-0.5,10.5,-1,11]);text(10.8,-1,'n')
subplot(2,1,2); stem(n,xoc); title('循环奇分量')
ylabel('xoc(n)'); axis([-0.5,10.5,-4,4]);text(10.8,-4,'n')
pause;
%print -deps2 me0510a.eps
%
% b) 验证性质
X = dft(x,11); Xec = dft(xec,11); Xoc = dft(xoc,11);
subplot(2,2,1); stem(n,real(X)); axis([-0.5,10.5,-5,50])
title('{DFT[x(n)]}的实部'); text(10.8,-5,'k')
subplot(2,2,2); stem(n,imag(X)); axis([-0.5,10.5,-20,20])
title('{DFT[x(n)]}的虚部'); text(10.8,-20,'k')
subplot(2,2,3); stem(n,real(Xec)); axis([-0.5,10.5,-5,50])
title('DFT[xec(n)]'); text(10.8,-5,'k')
subplot(2,2,4); stem(n,imag(Xoc)); axis([-0.5,10.5,-20,20])
title('DFT[xoc(n)]'); text(10.8,-20,'k')
%print -deps2 me0510b.eps

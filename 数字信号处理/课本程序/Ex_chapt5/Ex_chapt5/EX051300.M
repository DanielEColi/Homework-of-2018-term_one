% 第五章: 例5.12: 循环移位举例
%
subplot(1,1,1)
% a) 画x((n-6))15的图
n = 0:10; x = 10*(0.8) .^ n;
y = cirshftt(x,6,15); 
n = 0:14; x = [x, zeros(1,4)];
subplot(2,1,1); stem(n,x); title('初始序列')
xlabel('n'); ylabel('x(n)'); axis([-1,15,-1,11])
subplot(2,1,2); stem(n,y); 
title('循环移位序列, N=15')
xlabel('n'); ylabel('x((n-6) mod 15)'); 
axis([-1,15,-1,11])
pause; print -deps2 me0512.eps
% Example 2.5
%
% x(n)=[u(n)-u(n-10]; h(n)=(0.9)^n*u(n)
% y(n)=10*(1-(0.9)^(n+1))*(u(n)-u(n-10))+
%       (10*(1-(0.9)^10)*(0.9)^(n-9))*u(n-10)
clear;
close all;
n = -5:50;
u1 = stepseq(0,-5,50); u2=stepseq(10,-5,50);
% input x(n)
x = u1-u2;
% 脉冲响应 h(n)
h = ((0.9).^n).*u1;
subplot(1,1,1)
subplot(2,1,1); stem(n,x); axis([-5,50,0,2])
title('输入序列')
ylabel('x(n)');text(52,0,'n')
subplot(2,1,2); stem(n,h); axis([-5,50,0,2])
title('脉冲响应')
ylabel('h(n)'); text(52,0,'n');pause
print -djpeg ex0205a.jpg
% 输出响应
y = (10*(1-(0.9).^(n+1))).*(u1-u2)+(10*(1-(0.9)^10)*(0.9).^(n-9)).*u2;
clg,subplot(2,1,2); stem(n,y); axis([-5,50,0,8])
title('输出序列')
ylabel('y(n)');text(52,0,'n')
print -djpeg ex0205b.jpg

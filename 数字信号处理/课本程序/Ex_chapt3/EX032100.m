% 第三章 : 例 3.21
%             利用stairs和plot函数进行重构
%
figure(1); clf
% 离散时间信号 x1(n) : Ts = 0.0002
Ts = 0.0002; n = -25:1:25; nTs = n*Ts;
x = exp(-1000*abs(nTs));
% 利用stairs重构模拟信号
subplot(2,1,1); stairs(nTs*1000,x);
a=axis;text(a(2)+.2,a(3),'t 毫秒'); ylabel('xa(t)')
title('利用零阶保持器重构信号'); hold on
stem(n*Ts*1000,x); hold off
%
% 利用plot函数重构模拟信号
subplot(2,1,2); plot(nTs*1000,x);
xlabel('t 毫秒'); ylabel('xa(t)')
title('利用一阶保持器重构信号'); hold on
stem(n*Ts*1000,x); hold off
grid on;

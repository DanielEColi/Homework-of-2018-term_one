% 第三章: 例 3.23
% 利用三此插值函数进行重构和混叠
%
% 离散时间信号x2(n)
Ts = 0.001; n = -5:1:5; nTs = n*Ts;
x = exp(-1000*abs(nTs));
% 模拟信号重构
Dt = 0.00005;
t = -0.005:Dt:0.005;
xa = spline(nTs,x,t);
% check
error = max(abs(xa - exp(-1000*abs(t))))
% Plots
subplot(1,1,1)
subplot(2,1,2);plot(t*1000,xa);
xlabel('t 毫秒'); ylabel('xa(t)')
title('由x2(n)重构信号'); hold on
stem(n*Ts*1000,x); hold off


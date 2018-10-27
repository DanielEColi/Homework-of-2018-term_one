% 第三章: 例 3.22
%             
%
figure(1); clf
% a)离散时间信号 x1(n): Ts = 0.0002
Ts = 0.0002; n = -25:1:25; nTs = n*Ts;
x = exp(-1000*abs(nTs));
% 
Dt = 0.00005;
t = -0.005:Dt:0.005;
xa = spline(nTs,x,t);
% check
error = max(abs(xa - exp(-1000*abs(t))))
% Plots
subplot(2,1,1);plot(t*1000,xa);
a=axis;text(a(2)+.2,a(3),'t 毫秒'); ylabel('xa(t)')
title('利用三次插值函数由x1(n)重构信号'); hold on
stem(n*Ts*1000,x); hold off
%
% 离散时间信号x2(n): Ts = 0.001
Ts = 0.001; n = -5:1:5; nTs = n*Ts;
x = exp(-1000*abs(nTs));
%模拟信号重构 
Dt = 0.00005;
t = -0.005:Dt:0.005;
xa = spline(nTs,x,t);
% check
error = max(abs(xa - exp(-1000*abs(t))))
% Plots
subplot(2,1,2);plot(t*1000,xa);
xlabel('t 毫秒'); ylabel('xa(t)')
title('利用三次插值函数由x2(n)重构信号'); hold on
stem(n*Ts*1000,x); hold off

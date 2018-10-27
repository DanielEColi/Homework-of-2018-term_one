% 第三章: 例 3.19
%             用sinc函数重构信号
%
% 离散时间信号 x1(n)
Ts = 0.0002; Fs = 1/Ts; n = -25:1:25; nTs = n*Ts;
x = exp(-1000*abs(nTs));
% 模拟信号重构
Dt = 0.00005;
t = -0.005:Dt:0.005;
xa = x * sinc(Fs*(ones(length(nTs),1)*t-nTs'*ones(1,length(t))));
% 校验
error = max(abs(xa - exp(-1000*abs(t))))
% 绘图
subplot(1,1,1)
subplot(2,1,2);plot(t*1000,xa);
xlabel('t 毫秒'); ylabel('xa(t)')
title('用sinc函数由x1(n)重构信号'); hold on
stem(n*Ts*1000,x);
plot(t*1000,exp(-1000*abs(t)),'r');
hold off


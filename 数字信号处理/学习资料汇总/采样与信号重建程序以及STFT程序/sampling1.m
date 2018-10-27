clear all
clc
% 模拟信号采样
Ts = 0.0002;% sampling interval = 0.0002 or 0.001
Fs = 1/Ts; % sampling frequency
nTs = -0.005:Ts:0.005;
x = exp(-1000*abs(nTs));
% 利用样本重建信号
Dt = 0.00005;
t = -0.005:Dt:0.005;
real_xa = exp(-1000*abs(t));
xa = x * sinc(Fs*(ones(length(nTs),1)*t-nTs'*ones(1,length(t))));
% 重建误差
error = max(abs(xa - exp(-1000*abs(t))))
% 结果显示
figure(1);
plot(t*1000,real_xa,'r');
xlabel('t 毫秒'); 
hold on
plot(t*1000,xa,'g');
hold on
stem(nTs*1000,x,'b');
legend({'real xa','reconstructed xa','samples'},'Location','NorthEast');
title('sampling and reconstruction');
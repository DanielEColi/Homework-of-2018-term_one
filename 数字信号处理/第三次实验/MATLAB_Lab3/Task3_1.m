clc; close all; clear;
Ts = 0.001;
%模拟信号
Dt = 0.00005; 
t = -0.005:Dt:0.005;
xa = exp(-1000 * abs(t));
%样本
n = -(0.005/Ts):1:(0.005/Ts);
nTs = n * Ts;
x = exp(-1000 * abs(nTs));
%重建信号
Fs = 1/Ts;
xre = x* sinc(Fs * (ones(length(n), 1) * t - nTs' * ones(1, length(t))));
%画图
plot(t*1000,xa,'color','b');
xlabel('t in msec.');
ylabel('x(n)');
title('Analog signal,sampling and reconstruction');
hold on
stem(nTs*1000,x);
plot(t*1000,xre,'--','color','r');
legend('Original Signal','Sample','Reconstructon signal');
if Ts == 0.001
    gtext('Ts = 1msec');
elseif Ts == 0.0002
    gtext('Ts = 0.2msec');
end




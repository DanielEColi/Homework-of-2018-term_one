clc;clear;close all;
Fs = 800;
Ts = 1/Fs;
%模拟信号
f = 100;
t=0:0.00001:0.02;
xa=sin(2 * pi * f * t);                   
% subplot(311)
% plot(t,xa,'r');                    
%采样
n = 0:1:0.02/Ts;
nTs = n* Ts;
x=sin(2 * pi * f * nTs);
% subplot(312)
% stem(nTs,x);
%重建信号
Fs = 1/Ts;
xre = x* sinc(Fs * (ones(length(n), 1) * t - nTs' * ones(1, length(t))));
% subplot(313);
% plot(t,xre)
% axis([0 0.02 -1 1]);

plot(t * 100, xa , 'color','b' );
xlabel('t in msec.');
ylabel('x(n)');
title('Analog signal, sampling and reconstruction');
hold on
stem(nTs*100, x);
plot(t * 100, xre,'--','color','r');
legend('Original Signal','Sample','Reconstructoin signal');
if Fs == 200
    gtext('Fs = 200Hz');
elseif Fs == 400
    gtext('Fs = 400Hz');
elseif Fs == 800
    gtext('Fs = 800Hz');
end


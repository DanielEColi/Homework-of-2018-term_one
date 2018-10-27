clc; clear all; close all;
Ts = 0.0002;
Fs = 1/Ts;
n = -25: 1 : 25;
nTs = n*Ts;
x = exp(-1000 * abs(nTs));
Dt = 0.00005;
t = -0.005:Dt:0.005;
xa = x* sinc(Fs * (ones(length(n), 1) * t - nTs' * ones(1, length(t))));
plot(t*1000, xa);
error = max(abs(xa - exp(-1000 * abs(t))))
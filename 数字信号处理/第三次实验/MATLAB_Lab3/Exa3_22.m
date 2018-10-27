clc; clear; close all;

Ts = 0.001;
Fs = 1/Ts;
n = -5 : 1 : 5;
nTs = n * Ts;
x = exp(-1000 * abs(nTs));
Dt = 0.00005;
t = -0.005 : Dt : 0.005;
xa = x * sinc (Fs * (ones(length(n), 1) * t - nTs' * ones(1, length(t))));
error = max(abs(xa -exp(-1000 * abs(t))))
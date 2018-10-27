clc; close all; clear;

fs = 10;
Ts = 1/fs;
t = [0:Ts:102.4];
f1 = 2;
f2 = 2.02;
f3 = 2.07;
x = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t);
N = 1024;
n1 = [0:Ts:N/10];
y1 = x(1:1:N+1);
subplot(211);
plot(n1,y1);
title('signal x(n), 0<=n<=100');
xlabel('n')

Y1 = fft(y1, N);
magY1 = abs(Y1(1:1:N/2+1));
k1 = 0:1:N/2;
w1 = 2*pi/N*k1;
subplot(212);
plot(w1/pi, magY1);
title('Samples of DTFT Magnitude');
xlabel('frequency in pi units')
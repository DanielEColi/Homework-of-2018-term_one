clc; clear; close all;

n = [0:1:99];
x = cos(0.48 * pi * n) + cos(0.52 * pi * n);

subplot(211);
stem(n,x);
title('signal x(n)_, 0<=n<=99');
xlabel('n')

X = dft(x,100);
magX = abs(X(1:1:51));
k = 0:1:50;
w = 2*pi/100*k;
subplot(212);
plot(w/pi, magX);
title('DTFT Magnitude');
xlabel('frequency in pi units')
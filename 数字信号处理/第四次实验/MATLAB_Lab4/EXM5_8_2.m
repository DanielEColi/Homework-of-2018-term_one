clc; close all; clear;

n = [0:1:99];
x = cos(0.48 * pi * n) + cos(0.52 * pi * n);
n2 = [0:1:99];
y2 = [x(1:1:10) zeros(1,90)];
subplot(211);
stem(n2, y2);
title('signal x(n),0<=n<=9+90 zeros');
xlabel('n');
Y2 = dft(y2, 100);
magY2 = abs(Y2(1:1:51));
k2 = 0:1:50;
w2 = 2 * pi / 100 * k2;
subplot(212);
plot(w2 / pi, magY2);
title('DTFT Magnitude');
xlabel('frequency in pi units')
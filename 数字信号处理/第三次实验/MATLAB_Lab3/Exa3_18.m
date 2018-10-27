clc; clear all; close all;

Dt = 0.00005; 
t = -0.005:Dt:0.005;
xa = exp(-1000 * abs(t));
Wmax = 2*pi*2000;
K = 500;
k = 0:1:K;
W = k * Wmax / K;
Xa = xa * exp(-j * t' * W) * Dt;
Xa = real(Xa);
W = [-fliplr(W), W(2:501)];
Xa = [fliplr(Xa), Xa(2:501)];
subplot(211);
plot(t * 1000, xa);
xlabel('t in msec.');
ylabel('xa(t)')
title('Analog Signal')
subplot(212);
plot(W/(2*pi*1000), Xa * 1000);
xlabel('Frequency in KHz');
ylabel('Xa(jW) * 1000')
title('Countinuous-time Fourier Transform')
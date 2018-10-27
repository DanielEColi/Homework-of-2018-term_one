clear all
clc
fs = 1000;
T = 1/fs;
t = 0:T:1;
x = sin(2*pi*50*t)+sin(2*pi*100*t);
subplot(3,1,1);
plot(1000*t(1:500),x(1:500));
title('Signal');
xlabel('time (milliseconds)');
%
N = 512;
XK1 = fft(x,N);
f = 1000*(0:N/2)/N;
% w = 2*pi*(0:N/2)/N;
subplot(3,1,2);
stem(f,abs(XK1(1:N/2+1)));
title('Amplitued spectrum');
xlabel('frequency (Hz)');
%
N = 1000;
XK2 = fft(x,N);
f = 1000*(0:N/2)/N;
% w = 2*pi*(0:N/2)/N;
subplot(3,1,3);
stem(f,abs(XK2(1:N/2+1)));
title('Amplitued spectrum');
xlabel('frequency (Hz)');
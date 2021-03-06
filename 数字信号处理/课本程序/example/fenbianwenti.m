fs=10;%Hz
Ts=1/fs;
t = 0:Ts:102.4;
f1=2;%Hz
f2=2.02;%Hz
f3=2.07;%Hz
x = sin(2*pi*f1*t)+sin(2*pi*f2*t)+sin(2*pi*f3*t);
%y = x + 1*randn(size(t));
y=x;
subplot(3,1,1);
plot(1000*t(1:50),y(1:50));
title('Signal Corrupted with Zero-Mean Random Noise');
xlabel('time (milliseconds)');
N = 256;
Y = fft(y,N);
Pyy = Y.* conj(Y) / N;
f = fs*(0:N/2)/N;
subplot(3,1,2);
plot(f,Pyy(1:N/2+1));
title('Frequency content of y');
xlabel('frequency (Hz)');
%1024��fft
Z = fft(y,1024);
Py = Z.* conj(Z) / 1024;
f2 = fs*(0:512)/1024;
subplot(3,1,3);
plot(f2,Py(1:513));
title('Frequency content of y');
xlabel('frequency (Hz)');
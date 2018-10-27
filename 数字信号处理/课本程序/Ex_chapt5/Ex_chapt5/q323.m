t = 0:0.001:1;
x = sin(2*pi*50*t)+sin(2*pi*120*t);
y = x + 1*randn(size(t));
subplot(3,1,1);
plot(1000*t(1:50),y(1:50));
title('Signal Corrupted with Zero-Mean Random Noise');
xlabel('time (milliseconds)');
Y = fft(y,512);
Pyy = Y.* conj(Y) / 512;
f = 1000*(0:256)/512;
subplot(3,1,2);
plot(f,Pyy(1:257));
title('Frequency content of y');
xlabel('frequency (Hz)');
%1024µãfft
Z = fft(y,1024);
Py = Z.* conj(Z) / 1024;
f2 = 1000*(0:512)/1024;
subplot(3,1,3);
plot(f2,Py(1:513));
title('Frequency content of y');
xlabel('frequency (Hz)');


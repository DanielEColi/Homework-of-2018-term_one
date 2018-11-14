clc;clear;close all;

load ALine.mat;
N = length(x);

fs = 40e6;
T  = 1/fs;
t  = 0:T:T*(N-1);
plot(t*1e6,x);
title('Supersonic echo wave')
xlabel('t/(us)');
hold on
gtext('Frequence:40MHz');
hold off;

f = fs * (0:N/2)/N;
X = fft(x);
mag_X = abs(X);
figure
subplot(2,1,1);
plot(f/1e6, mag_X(1:length(f)));
title('Magnitude Part');
xlabel('f/(MHz)');
ylabel('Magnitude |X(k)|');

ang_X = angle(X);
subplot(2,1,2);
plot(f/1e6, ang_X(1:length(f)));
title('Angle Part');
xlabel('f/(MHz)');
ylabel('Radians $${\langle}X(k)$$','Interpreter','latex');



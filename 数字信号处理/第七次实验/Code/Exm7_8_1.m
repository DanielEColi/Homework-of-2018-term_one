clc; clear; close all;

load('Num2.mat');

wp = 0.2*pi;
ws = 0.3*pi;
M = length(Num2);
n = 1:M;
[db, mag, pha, grd, w] = freqz_m(Num2, [1]);
delta_w = 2*pi/1000;
Rp = -(min(db(1:1:wp/delta_w+1)))
As = -round(max(db(ws/delta_w+1:1:501)))

figure(1)
stem(n,Num2);
title('Actual Impulse Response');
axis([0 M-1 -0.1 0.3]);
xlabel('n');
ylabel('h(n)');

figure(2);
plot(w/pi,db);
title('Magnitude Response(dB)');
grid on;
axis([0 1 -80 0]);
xlabel('Normalized Frequency( $${\times}{\pi}$$ rad/sample)','Interpreter','latex');
ylabel('Magnitude(dB)');

figure(3);
plot(w/pi,pha);
title('Phase Response(dB)');
grid on;
xlabel('Normalized Frequency( $${\times}{\pi}$$ rad/sample)','Interpreter','latex');
ylabel('Phase(radians)');
clc;clear;close all

fs = 100;
n = 0:1:fs-1;
t =  0.01*n;
xa = 2*sin(4*pi*t)+5*cos(8*pi*t);
figure;
plot(t*100,xa);
title('$x(n)=2sin4{\pi}t+5cos8{\pi}t$','Interpreter','latex');
xlabel('t/(ms)');

N = 60;
n = 0:N-1;
Xa = fft(xa, N);
Mag_Xa = abs(Xa);
f = fs*(0:N/2)/N;
figure;
stem(f, Mag_Xa(1:N/2+1));
xlabel('f/(Hz)')
ylabel('·ù¶ÈÆ×|X(k)|');
hold on
if N == 40
    gtext('N=40');
elseif N == 50
    gtext('N=50');
elseif N == 60
    gtext('N=60');
end
hold off;
real_Xa = real(Xa);
imag_Xa = imag(Xa);
figure
subplot(2,1,1);
plot(f,real_Xa(1:N/2+1));
title('Real Part');
xlabel('frequency /Hz');
ylabel('Real');

subplot(2,1,2);
plot(f,imag_Xa(1:N/2+1));
title('Imaginary Part');
xlabel('frequency /Hz');
ylabel('Imaginary');

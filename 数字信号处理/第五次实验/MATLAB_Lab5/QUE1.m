clear all
clc
fs = 1000;% sampling frequency
T =1/fs;
t = 0:T:1;
%N= 256;
%N = 512;% data length for FFT 
%N = 1024;
%N = 1000;
N=2048;
x = sin(2*pi*50*t)+sin(2*pi*100*t)+0.5*randn(size(t));
plot(1000*t(1:200),x(1:200));
%title('$y=e^{-at}$', 'fontsize',16,'interpreter', 'latex');
title('$x(n)=sin100{\pi}t+sin200{\pi}t+noise$','Interpreter','latex');
xlabel('t/(ms)');
X = fft(x,N);
Mag_X = abs(X);
f = fs*(0:N/2)/N;
figure;
plot(f,Mag_X(1:N/2+1));
title('对x(n)做傅里叶变换');
xlabel('f/(Hz)');
ylabel('幅度谱|X(k)|');
hold on
if N == 256
    gtext('N=256');
elseif N ==512
    gtext('N=512');
elseif N==1024
    gtext('N=1024');
elseif N==1000
    gtext('N=1000');
elseif N==2048
    gtext('N=2048');
end

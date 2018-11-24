clf;
clear all;
%设置初值
T=0.001;  %采样间隔
fs=1/T;   %采样频率
NLen=1000;%记录数据的长度
n=0:NLen-1;%自变量
x=sin(2*pi*50*n*T)+0.3*sin(2*pi*100*n*T) + sin(2*pi*5*n*T);%采样结果

figure(1);
%计算并绘制信号 x 的幅度谱，要求以 Hz 为单位，用 stem 绘制
subplot(211);
plot(n*T*1000, x);  %画出采样到的信号图像
title('$x(n)=sin0.1{\pi}n+0,3sin0.2{\pi}n+sin0.01{\pi}n$','Interpreter','latex');
xlabel('time /ms')
ylabel('x');

X = fft(x,1000);    %对采样到的数据做傅里叶变换
magX = abs(X);      %求出幅度
k = 0:1:length(n)/2;%要显示的长度
f0 = k*fs/NLen;     %转换为频率
subplot(212);
plot(f0, magX(1:length(f0)));%画出幅度谱
title('x的幅度谱');
xlabel('f/Hz');
ylabel('X(f)');

%陷波器1的设计，去除信号 x 中的频率为 50Hz 的成分
f_filter1 = 50;     %去除信号频率为50Hz
w_filter1 = 2*pi*f_filter1/fs;  
r = 0.96;
b = [1, -2*cos(w_filter1), 1];
a = [1, -2*r*cos(w_filter1), r*r];
figure(2);
freqz(b,a,NLen,fs);%陷波器1特性显示
title('50Hz陷波器特性')
y1 = filter(b,a,x);%对x信号滤波得到y1
figure(3);
zplane(b,a);    
title('50Hz陷波器的零极点图');
figure(4)
%计算并绘制信号 y1 的幅度谱，要求以 Hz 为单位，用 stem 绘制
Y1 = fft(y1);       %对y1做傅里叶变换
magY1 = abs(Y1);    %求幅度
f =(0:(NLen-1)/2)*fs/NLen;  %频率
stem(f, magY1(1:length(f)));%绘制出幅度谱
title('y1的幅度谱');
xlabel('f/Hz');
ylabel('Y1(f)');
 
%陷波器2的设计，去除信号 y1 中的频率为 100Hz 的成分
f_filter2 = 100;        %去除信号频率为50Hz
w_filter2 = 2*pi*f_filter2/fs;
r = 0.94;
b2 = [1, -2*cos(w_filter2), 1];
a2 = [1, -2*r*cos(w_filter2), r*r];

figure(5);
% 陷波器2特性显示
freqz(b2,a2,NLen,fs);%陷波器2特性显示
title('100Hz陷波器特性');
y2 = filter(b2,a2,y1);
figure(6);
zplane(b2,a2);
title('100Hz陷波器的零极点图');
figure(7)
%计算并绘制信号 y2 的幅度谱，要求以 Hz 为单位，用 stem 绘制
Y2 = fft(y2);       %对y2做傅里叶变换
magY2 = abs(Y2);    %求幅度
f =(0:(NLen-1)/2)*fs/NLen;
stem(f, magY2(1:length(f)));%绘制出幅度谱
title('y2的幅度谱');
xlabel('f/Hz');
ylabel('Y2(f)');

% result
figure(8);
subplot(311), plot(n*T*1000,x);title('org');
subplot(312), plot(n*T*1000,y1);title('filter @ 50 Hz'); 
subplot(313), plot(n*T*1000,y2);title('filter @ 50 Hz & 100 Hz');
xlabel('time /ms')

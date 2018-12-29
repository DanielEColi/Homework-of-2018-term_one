%clear all
clc
%a =  'powerLineInterference2.xls';
a =  'powerInterference.xls';
b = xlsread(a);
%[row,~] = size(b);
%x = b(:,5);
%figure;
%plot(b(1e4+500:1e4+1000,5));

%去除工频干扰的程序
fs = 500;           %采样频率为500Hz
T = 1/fs;           %采样周期为0.002s
N = 1000;           %采样数
n = 0:T:N*T;        %时间向量
sample_signal = b(1e4+500:1e4+500+N,5); %从原始信号中抽取N个样本
figure(1);
plot(n, sample_signal);  %绘制出样本的时域波形
xlabel('time/s');
title('Sample ECG Signal');

f = fs/N*(0:N);     %频率向量
X = fft(sample_signal);  %对样本作傅里叶变换
abs_X = abs(X);     %求幅度
figure(2);
plot(f, abs_X);     %绘制出样本的幅度谱
xlabel('f/Hz');
title('Amplitude Spectrum of Sample ECG Signal');

f_filter = 50;      %需要去除的频率为50Hz
w_filter = 2*pi*f_filter/fs;
r = 0.96;
b = [1, -2*cos(w_filter), 1];     %陷波器参数
a = [1, -2*r*cos(w_filter), r*r];
figure(3);
freqz(b, a, N, fs); %陷波器的特性图像

y = filter(b, a, sample_signal);  %对样本进行滤波
figure(4);    
plot(n, y);         %绘制出滤波后信号的时域波形
xlabel('time/s');
title('Filtered ECG Signal');

Y = fft(y);         %对滤波后的信号作傅里叶变换
abs_Y = abs(Y);     %求幅度
figure(5);
plot(f, abs_Y);     %绘制幅度谱
xlabel('f/Hz');
title('Amplitude Spectrum of Filtered ECG Signal');


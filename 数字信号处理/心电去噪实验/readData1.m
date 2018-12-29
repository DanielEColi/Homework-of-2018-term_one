%clear all
close all;

load('filter_test1.mat');
load('filter_test2.mat');
load('filter_test3.mat');
load('filter_test4.mat');

a =  'baseLineShift.xls';
b = xlsread(a);
% 读入变量b中的数据有5列，其中第5列为有明显基线漂移
%plot(b(1.5e4:1.5e4+1000,5));
x=b(1.5e4:1.5e4+2000,5);%截取了部分数据
%去除基线漂移的程序
% 设计一个低通滤波器，去除基线漂移
N = 2000;
fs = 500;
T = 1/fs;
n = 0:T:N*T;
original_signal = b(1.5e4:1.5e4+N,5);
figure(1);
plot(n, original_signal);
xlabel('t/s');

figure(2);
f = fs/N*(0:N);
ori_X = fft(original_signal);
abs_ori_X = abs(ori_X);
plot(f, abs_ori_X);

Wp = 1.4*2/fs;  %通带截止频率
Ws = 0.6*2/fs;  %阻带截止频率
devel = 0.005;  %通带波纹

Rp = 20*log10((1+devel)/(1-devel));  %通带波纹系数
Rs = 20;                             %阻带衰减
[N, Wn] = ellipord(Wp, Ws, Rp, Rs, 's'); %求椭圆滤波器的阶次
[b, a] = ellip(N, Rp, Rs, Wn, 'high');   %求椭圆滤波器的系数
y = filter(b, a, original_signal);

%y = original_signal*Num4;
figure(3);
plot(n, y);

figure(4);
Y = fft(y);
abs_Y = abs(Y);
plot(f, abs_Y);

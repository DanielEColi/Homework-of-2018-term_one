clc; clear; close all; %清理现场

load('G.mat');  %导入参数G
load('SOS.mat');%导入参数SOS

[b, a] = sos2tf(SOS, G); %将参数SOS和G转换成滤波器系数b,a

N = 200;        %采样数
n = 0:1:N-1;    
x = sin(0.1*pi*n)+sin(0.5*pi*n); %原信号
figure(1);
plot(n, x);     %绘制原信号的图像
xlabel('n');    
ylabel('x')
title('$$x(n)=sin0.1{\pi}n+sin0.5{\pi}n$$','Interpreter','latex');    

f = (0:N/2)/(N/2);  %频率

X = fft(x);         %对原信号作傅里叶变换
abs_X = abs(X);     %取绝对值
figure(2);
plot(f, abs_X(1:length(f))); %绘制
xlabel('rad/s');
ylabel('X');
title('x的频域图像');

y = filter(b, a, x);%对原信号滤波
figure(3);
plot(n, y)          %绘制滤波后的信号
axis([0, N, -1, 1]);%调整坐标轴
xlabel('n');    
ylabel('y');
title('滤波后的信号')

Y = fft(y);         %对滤波后的信号作傅里叶变换
abs_Y = abs(Y);     %取绝对值
figure(4);      
plot(f, abs_Y(1:length(f)));    %绘制图像
xlabel('rad/s');
ylabel('Y');
title('y的频域图像');

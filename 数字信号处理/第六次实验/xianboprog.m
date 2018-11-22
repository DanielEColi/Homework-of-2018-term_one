clf;
clear all;
%设置初值
T=0.001;  %采样间隔
fs=1/T;   %采样频率
NLen=1000;%记录数据的长度
n=0:NLen-1;
x=sin(2*pi*50*n*T)+0.3*sin(2*pi*100*n*T) + sin(2*pi*5*n*T);
figure(1)
%计算并绘制信号 x 的幅度谱，要求以 Hz 为单位，用 stem 绘制



%陷波器1的设计，去除信号 x 中的频率为 50Hz 的成分
b =
a =
freqz(b,a,NLen,fs);%陷波器1特性显示
y1=filter(b,a,x);
zplane(b,a);
figure(3)
%计算并绘制信号 y1 的幅度谱，要求以 Hz 为单位，用 stem 绘制
 
 

%陷波器2的设计，去除信号 y1 中的频率为 100Hz 的成分



% 陷波器2特性显示


%计算并绘制信号 y2 的幅度谱，要求以 Hz 为单位，用 stem 绘制

 
% result
figure(6);
subplot(311), title('org'); plot(n*T*1000,x);
subplot(312), title('filter @ 50 Hz'); plot(n*T*1000,y1);
subplot(313), title('filter @ 50 Hz & 100 Hz'); plot(n*T*1000,y2);
xlabel('time ms')

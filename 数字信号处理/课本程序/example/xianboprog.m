clf;clear all;
%设置初值
f0=50;
Ts=0.001;
fs=1/Ts;
NLen=1000;
n=0:NLen-1;
x=sin(2*pi*50*n*Ts)+0.3*sin(2*pi*100*n*Ts) + sin(2*pi*2.5*n*Ts);
%原信号 
%陷波器1的设计
apha=-2*cos(2*pi*f0*Ts);
beta=0.96;
b=[1 apha 1];
%a=[1 apha*beta beta^2];
a=[1];
figure(1);
freqz(b,a,NLen,fs);%陷波器特性显示
%y1=dlsim(b,a,x);%陷波器1滤波处理
 y1=filter(b,a,x);
%陷波器2的设计
figure(2);
freqz(b,a,NLen,fs);%陷波器1特性显示
hold on
apha=-2*cos(2*pi*2*f0*Ts);
beta=0.96;
b=[1 apha 1];
a=[1 apha*beta beta^2];
freqz(b,a,NLen,fs);% 陷波器2特性显示
%y2=dlsim(b,a,y1);% 陷波器2滤波处理
y2=filter(b,a,y1);
hold off
 
% result
figure(3);
subplot(311), title('org'); plot(x)
subplot(312), title('filter @ 50 Hz'); plot(y1)
subplot(313), title('filter @ 50 Hz & 100 Hz'); plot(y2)

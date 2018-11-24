clf;
clear all;
%���ó�ֵ
T=0.001;  %�������
fs=1/T;   %����Ƶ��
NLen=1000;%��¼���ݵĳ���
n=0:NLen-1;%�Ա���
x=sin(2*pi*50*n*T)+0.3*sin(2*pi*100*n*T) + sin(2*pi*5*n*T);%�������

figure(1);
%���㲢�����ź� x �ķ����ף�Ҫ���� Hz Ϊ��λ���� stem ����
subplot(211);
plot(n*T*1000, x);  %�������������ź�ͼ��
title('$x(n)=sin0.1{\pi}n+0,3sin0.2{\pi}n+sin0.01{\pi}n$','Interpreter','latex');
xlabel('time /ms')
ylabel('x');

X = fft(x,1000);    %�Բ�����������������Ҷ�任
magX = abs(X);      %�������
k = 0:1:length(n)/2;%Ҫ��ʾ�ĳ���
f0 = k*fs/NLen;     %ת��ΪƵ��
subplot(212);
plot(f0, magX(1:length(f0)));%����������
title('x�ķ�����');
xlabel('f/Hz');
ylabel('X(f)');

%�ݲ���1����ƣ�ȥ���ź� x �е�Ƶ��Ϊ 50Hz �ĳɷ�
f_filter1 = 50;     %ȥ���ź�Ƶ��Ϊ50Hz
w_filter1 = 2*pi*f_filter1/fs;  
r = 0.96;
b = [1, -2*cos(w_filter1), 1];
a = [1, -2*r*cos(w_filter1), r*r];
figure(2);
freqz(b,a,NLen,fs);%�ݲ���1������ʾ
title('50Hz�ݲ�������')
y1 = filter(b,a,x);%��x�ź��˲��õ�y1
figure(3);
zplane(b,a);    
title('50Hz�ݲ������㼫��ͼ');
figure(4)
%���㲢�����ź� y1 �ķ����ף�Ҫ���� Hz Ϊ��λ���� stem ����
Y1 = fft(y1);       %��y1������Ҷ�任
magY1 = abs(Y1);    %�����
f =(0:(NLen-1)/2)*fs/NLen;  %Ƶ��
stem(f, magY1(1:length(f)));%���Ƴ�������
title('y1�ķ�����');
xlabel('f/Hz');
ylabel('Y1(f)');
 
%�ݲ���2����ƣ�ȥ���ź� y1 �е�Ƶ��Ϊ 100Hz �ĳɷ�
f_filter2 = 100;        %ȥ���ź�Ƶ��Ϊ50Hz
w_filter2 = 2*pi*f_filter2/fs;
r = 0.94;
b2 = [1, -2*cos(w_filter2), 1];
a2 = [1, -2*r*cos(w_filter2), r*r];

figure(5);
% �ݲ���2������ʾ
freqz(b2,a2,NLen,fs);%�ݲ���2������ʾ
title('100Hz�ݲ�������');
y2 = filter(b2,a2,y1);
figure(6);
zplane(b2,a2);
title('100Hz�ݲ������㼫��ͼ');
figure(7)
%���㲢�����ź� y2 �ķ����ף�Ҫ���� Hz Ϊ��λ���� stem ����
Y2 = fft(y2);       %��y2������Ҷ�任
magY2 = abs(Y2);    %�����
f =(0:(NLen-1)/2)*fs/NLen;
stem(f, magY2(1:length(f)));%���Ƴ�������
title('y2�ķ�����');
xlabel('f/Hz');
ylabel('Y2(f)');

% result
figure(8);
subplot(311), plot(n*T*1000,x);title('org');
subplot(312), plot(n*T*1000,y1);title('filter @ 50 Hz'); 
subplot(313), plot(n*T*1000,y2);title('filter @ 50 Hz & 100 Hz');
xlabel('time /ms')

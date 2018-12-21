clc; clear; close all; %�����ֳ�

load('G.mat');  %�������G
load('SOS.mat');%�������SOS

[b, a] = sos2tf(SOS, G); %������SOS��Gת�����˲���ϵ��b,a

N = 200;        %������
n = 0:1:N-1;    
x = sin(0.1*pi*n)+sin(0.5*pi*n); %ԭ�ź�
figure(1);
plot(n, x);     %����ԭ�źŵ�ͼ��
xlabel('n');    
ylabel('x')
title('$$x(n)=sin0.1{\pi}n+sin0.5{\pi}n$$','Interpreter','latex');    

f = (0:N/2)/(N/2);  %Ƶ��

X = fft(x);         %��ԭ�ź�������Ҷ�任
abs_X = abs(X);     %ȡ����ֵ
figure(2);
plot(f, abs_X(1:length(f))); %����
xlabel('rad/s');
ylabel('X');
title('x��Ƶ��ͼ��');

y = filter(b, a, x);%��ԭ�ź��˲�
figure(3);
plot(n, y)          %�����˲�����ź�
axis([0, N, -1, 1]);%����������
xlabel('n');    
ylabel('y');
title('�˲�����ź�')

Y = fft(y);         %���˲�����ź�������Ҷ�任
abs_Y = abs(Y);     %ȡ����ֵ
figure(4);      
plot(f, abs_Y(1:length(f)));    %����ͼ��
xlabel('rad/s');
ylabel('Y');
title('y��Ƶ��ͼ��');

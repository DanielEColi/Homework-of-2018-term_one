%clear all
close all;

load('filter_test1.mat');
load('filter_test2.mat');
load('filter_test3.mat');
load('filter_test4.mat');

a =  'baseLineShift.xls';
b = xlsread(a);
% �������b�е�������5�У����е�5��Ϊ�����Ի���Ư��
%plot(b(1.5e4:1.5e4+1000,5));
x=b(1.5e4:1.5e4+2000,5);%��ȡ�˲�������
%ȥ������Ư�Ƶĳ���
% ���һ����ͨ�˲�����ȥ������Ư��
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

Wp = 1.4*2/fs;  %ͨ����ֹƵ��
Ws = 0.6*2/fs;  %�����ֹƵ��
devel = 0.005;  %ͨ������

Rp = 20*log10((1+devel)/(1-devel));  %ͨ������ϵ��
Rs = 20;                             %���˥��
[N, Wn] = ellipord(Wp, Ws, Rp, Rs, 's'); %����Բ�˲����Ľ״�
[b, a] = ellip(N, Rp, Rs, Wn, 'high');   %����Բ�˲�����ϵ��
y = filter(b, a, original_signal);

%y = original_signal*Num4;
figure(3);
plot(n, y);

figure(4);
Y = fft(y);
abs_Y = abs(Y);
plot(f, abs_Y);

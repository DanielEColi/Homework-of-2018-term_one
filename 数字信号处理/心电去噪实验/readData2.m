%clear all
clc
%a =  'powerLineInterference2.xls';
a =  'powerInterference.xls';
b = xlsread(a);
%[row,~] = size(b);
%x = b(:,5);
%figure;
%plot(b(1e4+500:1e4+1000,5));

%ȥ����Ƶ���ŵĳ���
fs = 500;           %����Ƶ��Ϊ500Hz
T = 1/fs;           %��������Ϊ0.002s
N = 1000;           %������
n = 0:T:N*T;        %ʱ������
sample_signal = b(1e4+500:1e4+500+N,5); %��ԭʼ�ź��г�ȡN������
figure(1);
plot(n, sample_signal);  %���Ƴ�������ʱ����
xlabel('time/s');
title('Sample ECG Signal');

f = fs/N*(0:N);     %Ƶ������
X = fft(sample_signal);  %������������Ҷ�任
abs_X = abs(X);     %�����
figure(2);
plot(f, abs_X);     %���Ƴ������ķ�����
xlabel('f/Hz');
title('Amplitude Spectrum of Sample ECG Signal');

f_filter = 50;      %��Ҫȥ����Ƶ��Ϊ50Hz
w_filter = 2*pi*f_filter/fs;
r = 0.96;
b = [1, -2*cos(w_filter), 1];     %�ݲ�������
a = [1, -2*r*cos(w_filter), r*r];
figure(3);
freqz(b, a, N, fs); %�ݲ���������ͼ��

y = filter(b, a, sample_signal);  %�����������˲�
figure(4);    
plot(n, y);         %���Ƴ��˲����źŵ�ʱ����
xlabel('time/s');
title('Filtered ECG Signal');

Y = fft(y);         %���˲�����ź�������Ҷ�任
abs_Y = abs(Y);     %�����
figure(5);
plot(f, abs_Y);     %���Ʒ�����
xlabel('f/Hz');
title('Amplitude Spectrum of Filtered ECG Signal');


clf;
clear all;
%���ó�ֵ
T=0.001;  %�������
fs=1/T;   %����Ƶ��
NLen=1000;%��¼���ݵĳ���
n=0:NLen-1;
x=sin(2*pi*50*n*T)+0.3*sin(2*pi*100*n*T) + sin(2*pi*5*n*T);
figure(1)
%���㲢�����ź� x �ķ����ף�Ҫ���� Hz Ϊ��λ���� stem ����



%�ݲ���1����ƣ�ȥ���ź� x �е�Ƶ��Ϊ 50Hz �ĳɷ�
b =
a =
freqz(b,a,NLen,fs);%�ݲ���1������ʾ
y1=filter(b,a,x);
zplane(b,a);
figure(3)
%���㲢�����ź� y1 �ķ����ף�Ҫ���� Hz Ϊ��λ���� stem ����
 
 

%�ݲ���2����ƣ�ȥ���ź� y1 �е�Ƶ��Ϊ 100Hz �ĳɷ�



% �ݲ���2������ʾ


%���㲢�����ź� y2 �ķ����ף�Ҫ���� Hz Ϊ��λ���� stem ����

 
% result
figure(6);
subplot(311), title('org'); plot(n*T*1000,x);
subplot(312), title('filter @ 50 Hz'); plot(n*T*1000,y1);
subplot(313), title('filter @ 50 Hz & 100 Hz'); plot(n*T*1000,y2);
xlabel('time ms')

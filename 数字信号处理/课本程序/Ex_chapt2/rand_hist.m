%�������ȷֲ��İ������źţ������䲨�Σ�������ֲ����
%ex_rand.m
clear
N=50000;
u=rand(1,N);
u_mean=mean(u);
power_u=var(u);%����
subplot(211);
plot(u(1:100));grid on;
ylabel('u(n)');
xlabel('n');
subplot(212);
hist(u,50);grid on;
%��u(n)��ֱ��ͼ��������ֲ���50�Ƕ�u(n)��ȡֵ��Χ��0~1�����ֽ��ϸ������
ylabel('histogram of u(n)');
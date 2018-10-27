%产生均匀分布的白噪声信号，画出其波形，并检验分布情况
%ex_rand.m
clear
N=50000;
u=rand(1,N);
u_mean=mean(u);
power_u=var(u);%方差
subplot(211);
plot(u(1:100));grid on;
ylabel('u(n)');
xlabel('n');
subplot(212);
hist(u,50);grid on;
%对u(n)作直方图，检验其分布，50是对u(n)的取值范围（0~1）所分解的细胞数。
ylabel('histogram of u(n)');
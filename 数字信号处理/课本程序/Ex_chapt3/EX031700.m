% 模拟信号
Dt = 0.00005;
t = -0.005:Dt:0.005;
xa = exp(-1000*abs(t));
%
% 连续时间付利叶变换
Wmax = 2*pi*2000;
K = 500; k = 0:1:K;
W = k*Wmax/K;
Xa = xa * exp(-j*t'*W) * Dt;
Xa = real(Xa);
W = [-fliplr(W), W(2:K+1)]; % 频率从-Wmax to Wmax
Xa = [fliplr(Xa), Xa(2:K+1)];
subplot(1,1,1)
subplot(2,1,1);plot(t*1000,xa);
a=axis;text(a(2)+0.2,a(3),'t 毫秒'); ylabel('xa(t)')
title('模拟信号')
subplot(2,1,2);plot(W/(2*pi*1000),Xa*1000);
xlabel('以KHz为单位的频率'); ylabel('Xa(jW)*1000')
title('连续时间付利叶变换')


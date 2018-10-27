% 第三章: 例 3.18b:
%
% 模拟信号
Dt = 0.00005;
t = -0.005:Dt:0.005;
xa = exp(-1000*abs(t));
% 离散时间信号
Ts = 0.001; n = -5:1:5;
x = exp(-1000*abs(n*Ts));
% 离散时间付利叶变换
K = 500; k = 0:1:K;
w = pi*k/K;
X = x * exp(-j*n'*w);
X = real(X);
w = [-fliplr(w), w(2:K+1)];
X = [fliplr(X), X(2:K+1)];
subplot(1,1,1)
subplot(2,1,1);plot(t*1000,xa);
a=axis;text(a(2)+.2,a(3),'t 毫秒'); ylabel('x2(n)')
title('离散信号'); hold on
stem(n*Ts*1000,x); gtext('Ts=1 msec'); hold off
subplot(2,1,2);plot(w/pi,X);
xlabel('以pi为单位的频率'); ylabel('X2(w)')
title('离散时间付利叶变换')


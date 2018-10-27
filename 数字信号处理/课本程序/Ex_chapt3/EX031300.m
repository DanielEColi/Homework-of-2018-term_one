% 第三章: 例 3.13:
%
w = [0:1:500]*pi/500;  % 把[0, pi]轴分为501个点
X = exp(j*w) ./ (exp(j*w) - 0.9*ones(1,501));
magX = abs(X); angX = angle(X);
subplot(2,1,1); plot(w/pi,magX); grid; axis([0,1,0,10])
xlabel(''); ylabel('|H|');
title('振幅特性');
subplot(2,1,2); plot(w/pi,angX/pi); grid
xlabel('频率(以pi为单位)'); ylabel('相位(以pi弧度为单位)');
title('相位特性');

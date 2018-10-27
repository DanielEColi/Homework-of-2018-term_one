% 第三章: 例 3.12:
%
n = -5:10; x = sin(pi*n/2);
k = -100:100; w = (pi/100)*k;        % -pi和+pi之间的频率
X = x * (exp(-j*pi/100)).^(n'*k);    % x的DTFT
% 信号分解
[xe,xo,m] = evenodd(x,n);            % 偶部和奇部
XE = xe * (exp(-j*pi/100)).^(m'*k);  % xe的DTFT
XO = xo * (exp(-j*pi/100)).^(m'*k);  % xo的DTFT
% 校验
XR = real(X);                        % X的实部
error1 = max(abs(XE-XR))             % 差值
XI = imag(X);                        % X的虚部
error2 = max(abs(XO-j*XI))           % 差值
% 图形校验
subplot(1,1,1)
subplot(2,2,1); plot(w/pi,XR); grid; axis([-1,1,-2,2])
xlabel(''); ylabel('Re(X)');
title('X的实部')
subplot(2,2,2); plot(w/pi,XI); grid; axis([-1,1,-10,10])
xlabel(''); ylabel('Im(X)');
title('X的虚部')
subplot(2,2,3); plot(w/pi,real(XE)); grid; axis([-1,1,-2,2])
xlabel('以pi为单位的频率'); ylabel('XE');
title('偶部的变换')
subplot(2,2,4); plot(w/pi,imag(XO)); grid; axis([-1,1,-10,10])
xlabel('以pi为单位的频率'); ylabel('XO');
title('奇部的变换')

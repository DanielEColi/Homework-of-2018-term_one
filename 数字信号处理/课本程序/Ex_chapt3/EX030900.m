% 第三章: 例 3.9:
%
n = 0:100; x = cos(pi*n/2);
k = -100:100; w = (pi/100)*k;        % 把 -pi 到 +pi 分为201点
X = x * (exp(-j*pi/100)).^(n'*k);    % x 的 DTFT 
%
y = exp(j*pi*n/4).*x;                % 把信号乘以 exp(j*pi*n/4)
Y = y * (exp(-j*pi/100)).^(n'*k);    % y 的 DTFT
% 图形校验
subplot(1,1,1)
subplot(2,2,1); plot(w/pi,abs(X)); grid; axis([-1,1,0,60])
xlabel(''); ylabel('|X|')
title('X 的模值')
subplot(2,2,2); plot(w/pi,angle(X)/pi); grid; axis([-1,1,-1,1])
xlabel(''); ylabel('弧度/pi')
title('X 的相角')
subplot(2,2,3); plot(w/pi,abs(Y)); grid; axis([-1,1,0,60])
xlabel('以pi为单位的频率'); ylabel('|Y|')
title('Y 的模值')
subplot(2,2,4); plot(w/pi,angle(Y)/pi); grid; axis([-1,1,-1,1])
xlabel('以pi为单位的频率'); ylabel('弧度/pi')
title('Y 的相角')


% 第三章: 例 3.10:
%
n = -5:10; x = rand(1,length(n)) + j*rand(1,length(n));
k = -100:100; w = (pi/100)*k;        % -pi 和 +pi 之间的频率
X = x * (exp(-j*pi/100)).^(n'*k);    % DTFT of x
% 共轭特性
y = conj(x);                         % 信号共轭
Y = y * (exp(-j*pi/100)).^(n'*k);    % DTFT of y
% 校验
Y_check = conj(fliplr(X));           % conj(X(-w))
error = max(abs(Y-Y_check))          % 差值

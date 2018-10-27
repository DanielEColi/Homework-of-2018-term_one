% 第三章: 例 3.11:
%
n = -5:10; x = rand(1,length(n));
k = -100:100; w = (pi/100)*k;        % -pi和+pi之间的频率
X = x * (exp(-j*pi/100)).^(n'*k);    % DTFT of x
% 折叠特性
y = fliplr(x); m = -fliplr(n);       % 信号折叠
Y = y * (exp(-j*pi/100)).^(m'*k);    % DTFT of y
% 校验
Y_check = fliplr(X);                 % X(-w)
error = max(abs(Y-Y_check))          % 差值
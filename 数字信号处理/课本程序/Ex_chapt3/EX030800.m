% 第三章: 例 3.8:
%
x = rand(1,11); n = 0:10;
k = 0:500; w = (pi/500)*k;
X = x * (exp(-j*pi/500)).^(n'*k);    % x 的 DTFT 
% 信号移位两个样本点
y = x; m = n+2;
Y = y * (exp(-j*pi/500)).^(m'*k);    % y 的 DTFT 
% 校验
Y_check = (exp(-j*2).^w).*X;         % 乘以 exp(-j2w)
error = max(abs(Y-Y_check))          % 差值

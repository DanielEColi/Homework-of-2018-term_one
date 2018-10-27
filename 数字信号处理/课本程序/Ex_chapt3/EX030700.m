% 第三章: 例 3.7:
%
x1 = rand(1,11); x2 = rand(1,11); n = 0:10;
alpha = 2; beta = 3;
k = 0:500; w = (pi/500)*k;
X1 = x1 * (exp(-j*pi/500)).^(n'*k);  % x1 的 DTFT
X2 = x2 * (exp(-j*pi/500)).^(n'*k);  % x2 的 DTFT
x = alpha*x1 + beta*x2;              % x1 和 x2 的线性组合
X = x * (exp(-j*pi/500)).^(n'*k);    % x 的 DTFT
% 校验
X_check = alpha*X1 + beta*X2;        % X1 和 X2 的线性组合
error = max(abs(X-X_check))          % 差值

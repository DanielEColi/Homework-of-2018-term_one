%第三章: 例3.4:
%  用矩阵-向量乘法求有限长序列的DTFT
%
n = -1:3; x = 1:5;                  % x(n)序列
k = 0:500; w = (pi/500)*k;          % [0, pi] 轴分为501点.
%X = x * (exp(-j*pi/500)) .^ (n'*k); % 用矩阵-向量乘法求DTFT
X=dtft(x,n,w);
magX = abs(X); angX = angle(X);
realX = real(X); imagX = imag(X);
subplot(2,2,1); plot(w/pi,magX); grid
xlabel(''); title('模值部分'); ylabel('模值')
subplot(2,2,3); plot(w/pi,angX); grid
xlabel('以pi为单位的频率'); title('相角部分'); ylabel('弧度')
subplot(2,2,2); plot(w/pi,realX); grid
xlabel(''); title('实部'); ylabel('实部')
subplot(2,2,4); plot(w/pi,imagX); grid
xlabel('以pi为单位的频率'); title('虚部'); ylabel('虚部')
%print -deps ex030400.eps

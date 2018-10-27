% 第三章: 例 3.3:
%
w = [0:1:500]*pi/500;  % 把[0, pi] 轴分为501点.
X = exp(j*w) ./ (exp(j*w) -0.5*ones(1,501));
magX = abs(X); angX = angle(X);
realX = real(X); imagX = imag(X);
subplot(2,2,1); plot(w/pi,magX); grid
xlabel(''); title('幅度部分'); ylabel('幅值')
subplot(2,2,3); plot(w/pi,angX); grid
xlabel('以pi为单位的频率'); title('相角部分'); ylabel('弧度')
subplot(2,2,2); plot(w/pi,realX); grid
xlabel(''); title('实部'); ylabel('实部')
subplot(2,2,4); plot(w/pi,imagX); grid
xlabel('以pi为单位的频率'); title('虚部'); ylabel('虚部')

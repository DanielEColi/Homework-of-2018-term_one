% 第三章: 例 3.16:
%
b = [0.0181,  0.0543, 0.0543,  0.0181];
a = [1.0000, -1.7600, 1.1829, -0.2781];
m = 0:length(b)-1; l = 0:length(a)-1;
K = 500; k = 1:1:K;
w = pi*k/K;  % [0, pi] 分成501个点.
num = b * exp(-j*m'*w); % 分子计算
den = a * exp(-j*l'*w); % 分母计算
H = num ./ den;
magH = abs(H); angH = angle(H);
subplot(1,1,1);
subplot(2,1,1); plot(w/pi,magH); grid; axis([0,1,0,1])
xlabel(''); ylabel('|H|');
title('幅度响应');
subplot(2,1,2); plot(w/pi,angH/pi); grid on; axis([0,1,-1,1])
xlabel('以pi为单位的频率'); ylabel('以pi弧度为单位的相位');
title('相位响应');

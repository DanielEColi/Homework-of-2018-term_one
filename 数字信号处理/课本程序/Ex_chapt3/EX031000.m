% ������: �� 3.10:
%
n = -5:10; x = rand(1,length(n)) + j*rand(1,length(n));
k = -100:100; w = (pi/100)*k;        % -pi �� +pi ֮���Ƶ��
X = x * (exp(-j*pi/100)).^(n'*k);    % DTFT of x
% ��������
y = conj(x);                         % �źŹ���
Y = y * (exp(-j*pi/100)).^(n'*k);    % DTFT of y
% У��
Y_check = conj(fliplr(X));           % conj(X(-w))
error = max(abs(Y-Y_check))          % ��ֵ

% ������: �� 3.11:
%
n = -5:10; x = rand(1,length(n));
k = -100:100; w = (pi/100)*k;        % -pi��+pi֮���Ƶ��
X = x * (exp(-j*pi/100)).^(n'*k);    % DTFT of x
% �۵�����
y = fliplr(x); m = -fliplr(n);       % �ź��۵�
Y = y * (exp(-j*pi/100)).^(m'*k);    % DTFT of y
% У��
Y_check = fliplr(X);                 % X(-w)
error = max(abs(Y-Y_check))          % ��ֵ
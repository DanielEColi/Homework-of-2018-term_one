% ������: �� 3.8:
%
x = rand(1,11); n = 0:10;
k = 0:500; w = (pi/500)*k;
X = x * (exp(-j*pi/500)).^(n'*k);    % x �� DTFT 
% �ź���λ����������
y = x; m = n+2;
Y = y * (exp(-j*pi/500)).^(m'*k);    % y �� DTFT 
% У��
Y_check = (exp(-j*2).^w).*X;         % ���� exp(-j2w)
error = max(abs(Y-Y_check))          % ��ֵ

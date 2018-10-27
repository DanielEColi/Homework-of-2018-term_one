% ������: �� 3.9:
%
n = 0:100; x = cos(pi*n/2);
k = -100:100; w = (pi/100)*k;        % �� -pi �� +pi ��Ϊ201��
X = x * (exp(-j*pi/100)).^(n'*k);    % x �� DTFT 
%
y = exp(j*pi*n/4).*x;                % ���źų��� exp(j*pi*n/4)
Y = y * (exp(-j*pi/100)).^(n'*k);    % y �� DTFT
% ͼ��У��
subplot(1,1,1)
subplot(2,2,1); plot(w/pi,abs(X)); grid; axis([-1,1,0,60])
xlabel(''); ylabel('|X|')
title('X ��ģֵ')
subplot(2,2,2); plot(w/pi,angle(X)/pi); grid; axis([-1,1,-1,1])
xlabel(''); ylabel('����/pi')
title('X �����')
subplot(2,2,3); plot(w/pi,abs(Y)); grid; axis([-1,1,0,60])
xlabel('��piΪ��λ��Ƶ��'); ylabel('|Y|')
title('Y ��ģֵ')
subplot(2,2,4); plot(w/pi,angle(Y)/pi); grid; axis([-1,1,-1,1])
xlabel('��piΪ��λ��Ƶ��'); ylabel('����/pi')
title('Y �����')


% ������: �� 3.13:
%
w = [0:1:500]*pi/500;  % ��[0, pi]���Ϊ501����
X = exp(j*w) ./ (exp(j*w) - 0.9*ones(1,501));
magX = abs(X); angX = angle(X);
subplot(2,1,1); plot(w/pi,magX); grid; axis([0,1,0,10])
xlabel(''); ylabel('|H|');
title('�������');
subplot(2,1,2); plot(w/pi,angX/pi); grid
xlabel('Ƶ��(��piΪ��λ)'); ylabel('��λ(��pi����Ϊ��λ)');
title('��λ����');

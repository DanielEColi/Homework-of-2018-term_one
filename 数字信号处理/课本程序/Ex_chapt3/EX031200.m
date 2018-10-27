% ������: �� 3.12:
%
n = -5:10; x = sin(pi*n/2);
k = -100:100; w = (pi/100)*k;        % -pi��+pi֮���Ƶ��
X = x * (exp(-j*pi/100)).^(n'*k);    % x��DTFT
% �źŷֽ�
[xe,xo,m] = evenodd(x,n);            % ż�����沿
XE = xe * (exp(-j*pi/100)).^(m'*k);  % xe��DTFT
XO = xo * (exp(-j*pi/100)).^(m'*k);  % xo��DTFT
% У��
XR = real(X);                        % X��ʵ��
error1 = max(abs(XE-XR))             % ��ֵ
XI = imag(X);                        % X���鲿
error2 = max(abs(XO-j*XI))           % ��ֵ
% ͼ��У��
subplot(1,1,1)
subplot(2,2,1); plot(w/pi,XR); grid; axis([-1,1,-2,2])
xlabel(''); ylabel('Re(X)');
title('X��ʵ��')
subplot(2,2,2); plot(w/pi,XI); grid; axis([-1,1,-10,10])
xlabel(''); ylabel('Im(X)');
title('X���鲿')
subplot(2,2,3); plot(w/pi,real(XE)); grid; axis([-1,1,-2,2])
xlabel('��piΪ��λ��Ƶ��'); ylabel('XE');
title('ż���ı任')
subplot(2,2,4); plot(w/pi,imag(XO)); grid; axis([-1,1,-10,10])
xlabel('��piΪ��λ��Ƶ��'); ylabel('XO');
title('�沿�ı任')

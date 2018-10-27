%������: ��3.4:
%  �þ���-�����˷������޳����е�DTFT
%
n = -1:3; x = 1:5;                  % x(n)����
k = 0:500; w = (pi/500)*k;          % [0, pi] ���Ϊ501��.
%X = x * (exp(-j*pi/500)) .^ (n'*k); % �þ���-�����˷���DTFT
X=dtft(x,n,w);
magX = abs(X); angX = angle(X);
realX = real(X); imagX = imag(X);
subplot(2,2,1); plot(w/pi,magX); grid
xlabel(''); title('ģֵ����'); ylabel('ģֵ')
subplot(2,2,3); plot(w/pi,angX); grid
xlabel('��piΪ��λ��Ƶ��'); title('��ǲ���'); ylabel('����')
subplot(2,2,2); plot(w/pi,realX); grid
xlabel(''); title('ʵ��'); ylabel('ʵ��')
subplot(2,2,4); plot(w/pi,imagX); grid
xlabel('��piΪ��λ��Ƶ��'); title('�鲿'); ylabel('�鲿')
%print -deps ex030400.eps

% ������: �������źŲ���
%
subplot(1,1,1)
f=100;
fs=200;
delt=1/fs;
t=0:delt:0.1;
n=0:(length(t)-1);
x = sin(2*pi*f*t);
k = -200:200; w = (pi/100)*k;
X = x * (exp(-j*pi/100)) .^ (n'*k);
magX = abs(X); angX =angle(X);
subplot(2,1,1); plot(w/pi,magX);grid
axis([-2,2,0,8])
ylabel('|X|')
title('���Ȳ���')
subplot(2,1,2); plot(w/pi,angX/pi);grid
axis([-2,2,-1,1])
xlabel('��piΪ��λ��Ƶ��'); ylabel('����/pi')
title('��ǲ���')
% ������: �� 3.3:
%
w = [0:1:500]*pi/500;  % ��[0, pi] ���Ϊ501��.
X = exp(j*w) ./ (exp(j*w) -0.5*ones(1,501));
magX = abs(X); angX = angle(X);
realX = real(X); imagX = imag(X);
subplot(2,2,1); plot(w/pi,magX); grid
xlabel(''); title('���Ȳ���'); ylabel('��ֵ')
subplot(2,2,3); plot(w/pi,angX); grid
xlabel('��piΪ��λ��Ƶ��'); title('��ǲ���'); ylabel('����')
subplot(2,2,2); plot(w/pi,realX); grid
xlabel(''); title('ʵ��'); ylabel('ʵ��')
subplot(2,2,4); plot(w/pi,imagX); grid
xlabel('��piΪ��λ��Ƶ��'); title('�鲿'); ylabel('�鲿')

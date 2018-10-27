% ������: ��3.20
%             ��sinc�������ع��źźͻ��
%
% ��ɢʱ���ź� x2(n)
Ts = 0.001; Fs = 1/Ts; n = -5:1:5; nTs = n*Ts;
x = exp(-1000*abs(nTs));
% ģ���ź��ع�
Dt = 0.00005;
t = -0.005:Dt:0.005;
xa = x * sinc(Fs*(ones(length(nTs),1)*t-nTs'*ones(1,length(t))));
% У��
error = max(abs(xa - exp(-1000*abs(t))))
% ��ͼ
subplot(1,1,1)
subplot(2,1,2);plot(t*1000,xa);
xlabel('t ����'); ylabel('xa(t)')
title('��sinc������x1(n)�ع��źźͻ��'); hold on
stem(n*Ts*1000,x); 
plot(t*1000,exp(-1000*abs(t)),'r');
hold off

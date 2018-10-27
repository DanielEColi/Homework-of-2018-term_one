% ������: �� 3.22
%             
%
figure(1); clf
% a)��ɢʱ���ź� x1(n): Ts = 0.0002
Ts = 0.0002; n = -25:1:25; nTs = n*Ts;
x = exp(-1000*abs(nTs));
% 
Dt = 0.00005;
t = -0.005:Dt:0.005;
xa = spline(nTs,x,t);
% check
error = max(abs(xa - exp(-1000*abs(t))))
% Plots
subplot(2,1,1);plot(t*1000,xa);
a=axis;text(a(2)+.2,a(3),'t ����'); ylabel('xa(t)')
title('�������β�ֵ������x1(n)�ع��ź�'); hold on
stem(n*Ts*1000,x); hold off
%
% ��ɢʱ���ź�x2(n): Ts = 0.001
Ts = 0.001; n = -5:1:5; nTs = n*Ts;
x = exp(-1000*abs(nTs));
%ģ���ź��ع� 
Dt = 0.00005;
t = -0.005:Dt:0.005;
xa = spline(nTs,x,t);
% check
error = max(abs(xa - exp(-1000*abs(t))))
% Plots
subplot(2,1,2);plot(t*1000,xa);
xlabel('t ����'); ylabel('xa(t)')
title('�������β�ֵ������x2(n)�ع��ź�'); hold on
stem(n*Ts*1000,x); hold off

% ������ : �� 3.21
%             ����stairs��plot���������ع�
%
figure(1); clf
% ��ɢʱ���ź� x1(n) : Ts = 0.0002
Ts = 0.0002; n = -25:1:25; nTs = n*Ts;
x = exp(-1000*abs(nTs));
% ����stairs�ع�ģ���ź�
subplot(2,1,1); stairs(nTs*1000,x);
a=axis;text(a(2)+.2,a(3),'t ����'); ylabel('xa(t)')
title('������ױ������ع��ź�'); hold on
stem(n*Ts*1000,x); hold off
%
% ����plot�����ع�ģ���ź�
subplot(2,1,2); plot(nTs*1000,x);
xlabel('t ����'); ylabel('xa(t)')
title('����һ�ױ������ع��ź�'); hold on
stem(n*Ts*1000,x); hold off
grid on;

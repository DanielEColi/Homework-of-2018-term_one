% ������: ��4.11:
%   z-ƽ�溯��:
% a)
b = [1,0]; a = [1, -0.9];
%pzplotz(b,a);
zplane(b,a);
title('����-���ͼ');
text(0.85,-0.1,'0.9');text(0.01,-0.1,'0');
pause,
print -djpeg tu1.jpg
% b)
[H,w]=freqz(b,a,100);
magH = abs(H);phaH = angle(H);
subplot(2,1,1),plot(w/pi,magH);grid
xlabel('');ylabel('����');
title('������Ӧ')
subplot(2,1,2);plot(w/pi,phaH/pi);grid
xlabel('Ƶ�� (��λ:pi)');ylabel('��λ (��λ:pi)');
title('��λ��Ӧ'),
print -djpeg tu2.jpg



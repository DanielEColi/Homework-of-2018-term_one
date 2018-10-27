% 第四章: 例4.11:
%   z-平面函数:
% a)
b = [1,0]; a = [1, -0.9];
%pzplotz(b,a);
zplane(b,a);
title('极点-零点图');
text(0.85,-0.1,'0.9');text(0.01,-0.1,'0');
pause,
print -djpeg tu1.jpg
% b)
[H,w]=freqz(b,a,100);
magH = abs(H);phaH = angle(H);
subplot(2,1,1),plot(w/pi,magH);grid
xlabel('');ylabel('幅度');
title('幅度响应')
subplot(2,1,2);plot(w/pi,phaH/pi);grid
xlabel('频率 (单位:pi)');ylabel('相位 (单位:pi)');
title('相位响应'),
print -djpeg tu2.jpg



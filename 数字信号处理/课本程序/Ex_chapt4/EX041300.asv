% 第四章: 例4.13:
%   z-平面函数:
% b)
b = [1,0,-1]; a = [1,0,-0.81];
[R,p,C] = residuez(b,a);
% d)
w = [0:500]*pi/500;
[H]=freqz(b,a,w);
magH = abs(H);phaH = angle(H);
subplot(2,1,1),plot(w/pi,mag H);grid
xlabel('');ylabel('幅度');
title('幅度响应')
subplot(2,1,2);plot(w/pi,phaH/pi);grid
xlabel('频率 (单位:pi)');ylabel('相位 (单位:pi)');
title('相位响应')
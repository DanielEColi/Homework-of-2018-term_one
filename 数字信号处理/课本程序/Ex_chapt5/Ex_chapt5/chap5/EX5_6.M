% 第五章: 例 5.6: 简单DFT的实例
%
clear all;
x = [1,1,1,1];
n=0:3;
subplot(1,1,1);
%
% a) DTFT
k1=[0:1:500];
w = k1*2*pi/500;
Xejw=x*((exp(-j*2*pi/500)).^(n'*k1));
mag_Xejw = abs(Xejw); pha_Xejw = angle(Xejw); %phaH(126)=-47.5841*pi/180;
subplot(2,1,1); plot(w/pi,mag_Xejw); grid
xlabel('');
ylabel('|X|'); title(' DTFT的幅度')
subplot(2,1,2); plot(w/pi,pha_Xejw/pi*180); grid
xlabel('以pi为单位的频率');
ylabel('度'); title('DTFT的相角')
%print -deps2 me0506a.eps
pause;subplot(1,1,1)
%
% b) 4-point DFT
N = 4; w1 = 2*pi/N; k = 0:N-1;
X = dfs(x,N);%dft(x,N)
magX = abs(X), phaX = angle(X)*180/pi
subplot(2,1,1);plot(w*N/(2*pi),mag_Xejw,'--'); 
axis([-0.1,4.1,-1,5]); hold on
stem(k,magX);
ylabel('|X(k)|'); title('DFT的幅度: N=4');text(4.3,-1,'k')
hold off
subplot(2,1,2);plot(w*N/(2*pi),pha_Xejw*180/pi,'--');
axis([-0.1,4.1,-200,200]); hold on
stem(k,phaX);
ylabel('度'); title('DFT相角: N=4');text(4.3,-200,'k')
%print -deps2 me0506b.eps

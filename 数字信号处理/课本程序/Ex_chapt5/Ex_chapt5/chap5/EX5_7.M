% 第五章: 例 5.7:填补零点的实例
%
subplot(1,1,1);

% a) DTFT
n=0:3;
x = [1,1,1,1];
k1=[0:1:500];
w = k1*2*pi/500;
Xejw=x*((exp(-j*2*pi/500)).^(n'*k1));
mag_Xejw = abs(Xejw); pha_Xejw = angle(Xejw); 
subplot(2,1,1); plot(w/pi,mag_Xejw); grid

% b) 8-point DFT
N = 8; w1 = 2*pi/N; k = 0:N-1;
x = [x, zeros(1,4)];
X = dfs(x,N);
magX = abs(X), phaX = angle(X)*180/pi
subplot(2,1,1);plot(w*N/(2*pi),mag_Xejw,'--'); 
axis([-0.1,8.1,-1,5]); hold on
stem(k,magX);
text(8.2,-1,'k');
ylabel('|X(k)|'); title('DFT的幅值: N=8')
hold off
subplot(2,1,2);plot(w*N/(2*pi),pha_Xejw*180/pi,'--');
axis([-0.1,8.1,-200,200]); hold on
stem(k,phaX);
text(8.2,-200,'k');
ylabel('度'); title('DFT的相角: N=8');pause
%print -deps2 me0507a.eps
% c) 16-point DFT
subplot(1,1,1)
N = 16; w1 = 2*pi/N; k = 0:N-1;
x = [x, zeros(1,8)];
X = dfs(x,N);
magX = abs(X), phaX = angle(X)*180/pi
subplot(2,1,1);plot(w*N/(2*pi),mag_Xejw,'--'); 
axis([-0.1,16.1,-1,5]); hold on
stem(k,magX);
text(16.2,-1,'k');
ylabel('|X(k)|'); title(' DFT的幅值: N=16')
hold off
subplot(2,1,2);plot(w*N/(2*pi),pha_Xejw*180/pi,'--');
axis([-0.1,16.1,-200,200]); hold on
stem(k,phaX);
text(16.2,-200,'k');
ylabel('度'); title('DFT的相角: N=16')
%print -deps2 me0507b.eps

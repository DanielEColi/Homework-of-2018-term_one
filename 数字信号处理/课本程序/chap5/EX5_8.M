% 第五章: 例5.8: 高分辨率频谱
%
% 基于信号x(n)的100个样本的高分辨率频谱
subplot(1,1,1)
n=[0:1:99];
x=cos(0.48*pi*n)+cos(0.52*pi*n);
subplot(2,1,1);stem(n,x);title('信号x(n), 0 <= n <= 99');
axis([0,100,-2.5,2.5]);text(101,-2.5,'n')
X=fft(x);magX=abs(X(1:1:51));
k=0:1:50;w=2*pi/100*k;
subplot(2,1,2);plot(w/pi,magX);title('DTFT 幅值');xlabel('以pi为单位的频率')
axis([0,1,0,60])
disp('Press RETURN to continue');pause;
%print -deps2 me0508c.eps; subplot
%
% 基于x(n)前十个样本的频谱
n1=[0:1:9];y1=x(1:1:10);
subplot(2,1,1);stem(n1,y1);title('信号x(n), 0 <= n <= 9');
axis([0,10,-2.5,2.5]);text(10.2,-2.5,'n')
Y1=fft(y1);magY1=abs(Y1(1:1:6));
k1=0:1:5;w1=2*pi/10*k1;
subplot(2,1,2);stem(w1/pi,magY1);title('DTFT 幅度的样本');
xlabel('以pi为单位的频率')
axis([0,1,0,10])
disp('Press RETURN to continue');pause;
%print -deps2 me0508a.eps; subplot
%
%基于x(n)前10个样本的高分辨率频谱（50个样本）
n2=[0:1:49];y2=[x(1:1:10) zeros(1,40)];
subplot(2,1,1);stem(n2,y2);title('信号x(n), 0 <= n <= 9 + 40 zeros');
axis([0,50,-2.5,2.5]);text(51,-2.5,'n')
Y2=fft(y2);magY2=abs(Y2(1:1:26));
k2=0:1:25;w2=2*pi/50*k2;
subplot(2,1,2);plot(w2/pi,magY2);title('DTFT 幅度');xlabel('以pi为单位的频率')
axis([0,1,0,10])
disp('Press RETURN to continue');pause; subplot
%
% 基于x(n)前10个样本的高分辨率频谱（100个样本）
n3=[0:1:99];y3=[x(1:1:10) zeros(1,90)];
subplot(2,1,1);stem(n3,y3);title('信号 x(n), 0 <= n <= 9 + 90 zeros');
axis([0,100,-2.5,2.5]);text(102,-2.5,'n')
Y3=fft(y3);magY3=abs(Y3(1:1:51));
k3=0:1:50;w3=2*pi/100*k3;
subplot(2,1,2);plot(w3/pi,magY3);title('DTFT 幅度');xlabel('以pi为单位的频率')
axis([0,1,0,10])
disp('Press RETURN to continue');pause;
%print -deps2 me0508b.eps; subplot


clc;
t = 0:0.001:1.023;
N =1024;
%产生两个chirp信号并相加
y1 = chirp(t,0,1,350);
y2 = chirp(t,350,1,0);
y = y1+y2;
subplot(211);plot(t,y1);
ylabel('Chirp signal y1');
subplot(212);plot(t,y2);
ylabel('Chirp signal y2');
%求y的短时傅立叶变换
[S,F,T]=specgram(y,127,1,hanning(127),126);
figure
surf(T/1000,F,abs(S).^2);
view(-80,30);
shading flat;
colormap(cool);
xlabel('Time');ylabel('Frequency');zlabel('spectrogram');

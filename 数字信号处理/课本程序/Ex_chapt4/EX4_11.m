 b=[1 0 -1];
a=[1,0,-0.81];
%[H,w]=freqz(b,a,100);
[H,w]=freqz(b,a,500,'whole');
magH=abs(H);
phaH=angle(H);
subplot(2,2,1); plot(w/pi,magH); grid
xlabel(''); title('模值部分'); ylabel('模值')
subplot(2,2,3); plot(w/pi,phaH); grid
xlabel('以pi为单位的频率'); title('相角部分'); ylabel('弧度')

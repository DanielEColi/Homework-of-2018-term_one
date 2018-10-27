% 第三章: 例 3.99:
%
w = [-100:100]*pi/100; % -pi and +pi之间的频率
N = 5;
X1 = sin((w+eps)*N/2)./sin((w+eps)/2);
N = 15;
X2 = sin((w+eps)*N/2)./sin((w+eps)/2);
N = 25;
X3 = sin((w+eps)*N/2)./sin((w+eps)/2);
N = 100;
X4 = sin((w+eps)*N/2)./sin((w+eps)/2);
subplot(1,1,1);
subplot(2,2,1);plot(w/pi,X1);grid
xlabel('以pi为单位的频率');title('N=5')
subplot(2,2,2);plot(w/pi,X2);grid
xlabel('以pi为单位的频率');title('N=15')
subplot(2,2,3);plot(w/pi,X3);grid
xlabel('以pi为单位的频率');title('N=25')
subplot(2,2,4);plot(w/pi,X4);grid
xlabel('以pi为单位的频率');title('N=100')

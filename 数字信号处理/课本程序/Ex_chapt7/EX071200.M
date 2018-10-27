% 第七章: 例7.12 差分器设计 - 哈明窗
%
M = 21; alpha = (M-1)/2;
n = 0:M-1;
hd = (cos(pi*(n-alpha)))./(n-alpha); hd(alpha+1)=0;
w_ham = (hamming(M))';
h = hd .* w_ham;
[Hr,w,P,L] = Hr_Type3(h);
% plots
subplot(1,1,1);
subplot(2,2,1); stem(n,hd); title('理想脉冲响应')
axis([-1 M -1.2 1.2]);  ylabel('hd(n)');text(M+1,-1.2,'n')
subplot(2,2,2); stem(n,w_ham);title('哈明窗')
axis([-1 M 0 1.2]); ylabel('w(n)');text(M+1,0,'n')
subplot(2,2,3); stem(n,h);title('实际脉冲响应')
axis([-1 M -1.2 1.2]); xlabel('n'); ylabel('h(n)')
subplot(2,2,4);plot(w/pi,Hr/pi); title('振幅响应');grid;
xlabel('频率（单位：pi）'); ylabel('斜率（单位：pi）')
axis([0 1 0 1]); 
set(gca,'XTickMode','manual','XTick',[0,0.2,0.4,0.6,0.8,1])
set(gca,'YTickMode','manual','YTick',[0,0.2,0.4,0.6,0.8,1])
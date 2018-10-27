% Chapter 02: Example 02.01: Signal Synthesis
disp('例题2。1：画出以下各序列在给定区间的波形图')
disp('a. x(n)=2*delta(n+2)-delta(n-4).  -5<=n<=5')
disp('b. x(n)=n*(u(n)-u(n-10))+10*exp(-0.3*(n-10))*(u(n-10)-u(n-20)). 0<=n<=20')
disp('c. x(n)=cos(0.04*pi*n)+0.2*w(n)). 0<=n<=50')
disp('d. x(n)=[...,5,4,3,2,1,5,4,3,2,1,5,4,3,2,1...]. -10<=n<=9')
%
figure(1); clf
% a) x(n) = 2*delta(n+2) - delta(n-4), -5<=n<=5
n = [-5:5];
x = 2*impseq(-2,-5,5)-impseq(4,-5,5);
subplot(2,2,1); stem(n,x); title('例 2.1a 的序列图')
 ylabel('x(n)'); axis([-5,5,-2,3]);text(5.5,-2,'n')
%
% b) x(n) = n[u(n)-u(n-10)]+10*exp(-0.3(n-10))(u(n-10)-u(n-20)); 0<=n<=20
n = [0:20];
x1 = n.*(stepseq(0,0,20)-stepseq(10,0,20));
x2 = 10*exp(-0.3*(n-10)).*(stepseq(10,0,20)-stepseq(20,0,20));
x = x1+x2;
subplot(2,2,2);stem(n,x);
title('例 2.1b 的序列图')
ylabel('x(n)');axis([0,20,-1,11]);text(21,-1,'n')
%
% c) x(n) = cos(0.04*pi*n) + 0.2*w(n); 0<=n<=50, w(n): Gaussian (0,1)
n = [0:50];
x = cos(0.04*pi*n)+0.2*randn(size(n));
subplot(2,2,3);stem(n,x);title('例 2.1c 的序列图')
ylabel('x(n)');axis([0,50,-1.4,1.4]);text(53,-1.4,'n')
%
% d) x(n) = {...,5,4,3,2,1,5,4,3,2,1,...}; -10<=n<=9
n=[-10:9];
x=[5,4,3,2,1];
xtilde=x' * ones(1,4);
xtilde=(xtilde(:))';
subplot(2,2,4);stem(n,xtilde);title('例 2.1d 的序列图')
ylabel('xtilde(n)');axis([-10,9,-1,6]);text(10,-1,'n')
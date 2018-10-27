% 第五章: 例5.11: 循环移位图解
%
subplot(1,1,1)
% a) 画x((n+4))11的图
n = 0:10; x = 10*(0.8) .^ n;
n1 = -11:21; x1 = [zeros(1,11), x, zeros(1,11)];
subplot(2,2,1); stem(n1,x1); title('初始序列 x(n)')
axis([-6,17,-1,11]);text(18,-1,'n')
x2 = [x, x, x];
subplot(2,2,3); stem(n1,x2); title('周期延伸')
axis([-6,17,-1,11]);text(18,-1,'n')
x3 = [x2(4+1:33), x(1:4)];
subplot(2,2,2); stem(n1,x3); title('周期移位')
axis([-6,17,-1,11]);text(18,-1,'n')
x4 = x3 .* [zeros(1,11), ones(1,11), zeros(1,11)];
subplot(2,2,4); stem(n1,x4); title('循环移位')
axis([-6,17,-1,11]);text(18,-1,'n')
pause;
%print -deps2 me0511a.eps
%
% b) 画x((n-3))15的图
n = 0:10; x = [10*(0.8) .^ n zeros(1,4)];
n1 = -15:29; x1 = [zeros(1,15), x, zeros(1,15)];
subplot(2,2,1); stem(n1,x1); title('初始序列 x(n)')
axis([-9,25,-1,11]);text(27,-1,'n')
x2 = [x, x, x];
subplot(2,2,3); stem(n1,x2); title('周期延伸')
axis([-9,25,-1,11]);text(27,-1,'n')
x3 = [x2(43:45),x2(1:42)];
subplot(2,2,2); stem(n1,x3); title('周期移位')
axis([-9,25,-1,11]);text(27,-1,'n')
x4 = x3 .* [zeros(1,15), ones(1,15), zeros(1,15)];
subplot(2,2,4); stem(n1,x4); title('循环移位')
axis([-9,25,-1,11]);text(27,-1,'n')
pause;
%print -deps2 me0511b.eps
%

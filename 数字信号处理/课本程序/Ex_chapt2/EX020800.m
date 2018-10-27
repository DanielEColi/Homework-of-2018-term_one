% 例 2.8
%
% x(n)=[3,11,7,0,-1,4,2]; nx = [-3:3]
% y(n)=x(n-2)+w(n)
% ryx = cross(y,x)
%
% 噪声序列1
x = [3, 11, 7, 0, -1, 4, 2]; nx=[-3:3];   % 给定信号x(n)
[y,ny] = sigshift(x,nx,2);              % 得到 x(n-2)
w = randn(1,length(y)); nw = ny;        % 产生 w(n)
[y,ny] = sigadd(y,ny,w,nw);             % 得到 y(n) = x(n-2) + w(n)
[x,nx] = sigfold(x,nx);                 % 得到 x(-n)
[rxy,nrxy] = conv_m(y,ny,x,nx);         % 互相关
subplot(1,1,1)
subplot(2,1,1);stem(nrxy,rxy)
axis([-4,8,-50,250]);a=axis;text(a(2)+0.3,a(3),'迟延量')
ylabel('rxy');title('噪声序列1的互相关')
gtext('极大值')
%
% 噪声序列2
x = [3, 11, 7, 0, -1, 4, 2]; nx=[-3:3];   %给定 x(n)
[y,ny] = sigshift(x,nx,2);              % 得到 x(n-2)
w = randn(1,length(y)); nw = ny;        % 产生 w(n)
[y,ny] = sigadd(y,ny,w,nw);             % 得到 y(n) = x(n-2) + w(n)
[x,nx] = sigfold(x,nx);                 % 得到 x(-n)
[rxy,nrxy] = conv_m(y,ny,x,nx);         % 互相关
subplot(2,1,2);stem(nrxy,rxy)
axis([-4,8,-50,250]);a=axis;text(a(2)+.3,a(3),'迟延量')
ylabel('rxy');title('噪声序列2的互相关')
gtext('极大值')

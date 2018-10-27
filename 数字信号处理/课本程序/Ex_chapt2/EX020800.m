% �� 2.8
%
% x(n)=[3,11,7,0,-1,4,2]; nx = [-3:3]
% y(n)=x(n-2)+w(n)
% ryx = cross(y,x)
%
% ��������1
x = [3, 11, 7, 0, -1, 4, 2]; nx=[-3:3];   % �����ź�x(n)
[y,ny] = sigshift(x,nx,2);              % �õ� x(n-2)
w = randn(1,length(y)); nw = ny;        % ���� w(n)
[y,ny] = sigadd(y,ny,w,nw);             % �õ� y(n) = x(n-2) + w(n)
[x,nx] = sigfold(x,nx);                 % �õ� x(-n)
[rxy,nrxy] = conv_m(y,ny,x,nx);         % �����
subplot(1,1,1)
subplot(2,1,1);stem(nrxy,rxy)
axis([-4,8,-50,250]);a=axis;text(a(2)+0.3,a(3),'������')
ylabel('rxy');title('��������1�Ļ����')
gtext('����ֵ')
%
% ��������2
x = [3, 11, 7, 0, -1, 4, 2]; nx=[-3:3];   %���� x(n)
[y,ny] = sigshift(x,nx,2);              % �õ� x(n-2)
w = randn(1,length(y)); nw = ny;        % ���� w(n)
[y,ny] = sigadd(y,ny,w,nw);             % �õ� y(n) = x(n-2) + w(n)
[x,nx] = sigfold(x,nx);                 % �õ� x(-n)
[rxy,nrxy] = conv_m(y,ny,x,nx);         % �����
subplot(2,1,2);stem(nrxy,rxy)
axis([-4,8,-50,250]);a=axis;text(a(2)+.3,a(3),'������')
ylabel('rxy');title('��������2�Ļ����')
gtext('����ֵ')

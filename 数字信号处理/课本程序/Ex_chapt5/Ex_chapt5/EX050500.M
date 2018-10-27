% 第五章: 例 5.5: 频域采样:
%
% x(n)=(0.7)^n * u(n)
% X(z)=z/(z-0.7); |z|>0.7
subplot(1,1,1)
%
N = 5;
k = 0:1:N-1;
wk = 2*pi*k/N;
zk = exp(j*wk);
Xk = (zk)./(zk-0.7);
xn = real(idfs(Xk,N));
xtilde = xn'* ones(1,8); xtilde = (xtilde(:))';
subplot(2,2,1); stem(0:39,xtilde);axis([0,40,-0.1,1.5])
ylabel('xtilde(n)'); title('N=5');text(44,-0.1,'n')
%
N = 10;
k = 0:1:N-1;
wk = 2*pi*k/N;
zk = exp(j*wk);
Xk = (zk)./(zk-0.7);
xn = real(idfs(Xk,N));
xtilde = xn'* ones(1,4); xtilde = (xtilde(:))';
subplot(2,2,2); stem(0:39,xtilde);axis([0,40,-0.1,1.5])
ylabel('xtilde(n)'); title('N=10');text(44,-0.1,'n')
%
N = 20;
k = 0:1:N-1;
wk = 2*pi*k/N;
zk = exp(j*wk);
Xk = (zk)./(zk-0.7);
xn = real(idfs(Xk,N));
xtilde = xn'* ones(1,2); xtilde = (xtilde(:))';
subplot(2,2,3); stem(0:39,xtilde);axis([0,40,-0.1,1.5])
ylabel('xtilde(n)'); title('N=20');text(44,-0.1,'n')
%
N = 40;
k = 0:1:N-1;
wk = 2*pi*k/N;
zk = exp(j*wk);
Xk = (zk)./(zk-0.7);
xn = real(idfs(Xk,N));
subplot(2,2,4); stem(0:39,xn);axis([0,40,-0.1,1.5])
ylabel('xtilde(n)'); title('N=40');text(44,-0.1,'n')

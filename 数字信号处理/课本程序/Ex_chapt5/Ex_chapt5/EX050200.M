% 第五章: 例 5.2: 
%
L = 5; N = 20;
x = [ones(1,L), zeros(1,N-L)];
xn = x' * ones(1,3);%xn=[x',x',x']
xn = (xn(:))';%xn=[x,x,x]
n = -N:1:2*N-1;
stem(n,xn); xlabel('n'); ylabel('xtilde(n)')
title('xtilde(n)的三个周期')
axis([-N,2*N-1,-0.5,1.5])
%print -deps2 fg0502.eps
%
figure

%  (b)1部分
L = 5; N = 20;
xn = [ones(1,L), zeros(1,N-L)];
Xk = dfs(xn,N);
magXk = abs([Xk(N/2+1:N) Xk(1:N/2+1)]);
k = [-N/2:N/2];
subplot(2,2,1); stem(k,magXk); axis([-N/2,N/2,-0.5,5.5])
ylabel('Xtilde(k)');axis([-10,10,-0.5,5.5]);text(12,-0.5,'k')
title('SQ.波的DFS: L=5, N=20')
%  (b)2部分
L = 5; N = 40;
xn = [ones(1,L), zeros(1,N-L)];
Xk = dfs(xn,N);
magXk = abs([Xk(N/2+1:N) Xk(1:N/2+1)]);
k = [-N/2:N/2];
subplot(2,2,2); stem(k,magXk); axis([-N/2,N/2,-0.5,5.5])
ylabel('Xtilde(k)');text(24,-0.5,'k')
title('SQ. 波的DFS: L=5, N=40')
% (b)3部分
L = 5; N = 60;
xn = [ones(1,L), zeros(1,N-L)];
Xk = dfs(xn,N);
magXk = abs([Xk(N/2+1:N) Xk(1:N/2+1)]);
k = [-N/2:N/2];
subplot(2,2,3); stem(k,magXk); axis([-N/2,N/2,-0.5,5.5])
ylabel('Xtilde(k)');text(35,-0.5,'k')
title('SQ.波的DFS: L=5, N=60')
%  (b)4部分
L = 7; N = 60;
xn = [ones(1,L), zeros(1,N-L)];
Xk = dfs(xn,N);
magXk = abs([Xk(N/2+1:N) Xk(1:N/2+1)]);
k = [-N/2:N/2];
subplot(2,2,4); stem(k,magXk); axis([-N/2,N/2,-0.5,7.5])
ylabel('Xtilde(k)');text(35,-0.5,'k')
title(' SQ.波的DFS: L=7, N=60')
%print -deps2 fg0502b.eps
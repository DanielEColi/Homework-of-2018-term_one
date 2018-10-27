% �ڶ���: �� 02.04: ��ż�ϳ�
%
% x(n) = u(n)-u(n-10);
n = [0:10];
x = stepseq(0,0,10)-stepseq(10,0,10);
[xe,xo,m] = evenodd(x,n);
subplot(1,1,1)
subplot(2,2,1); stem(n,x); title('��������')
a=axis;text(a(2)+1,a(3),'n'); ylabel('x(n)'); axis([-10,10,0,1.2])
subplot(2,2,2); stem(m,xe); title('ż��')
a=axis;text(a(2)+1,a(3),'n'); ylabel('xe(n)'); axis([-10,10,0,1.2])
subplot(2,2,4); stem(m,xo); title('�沿')
a=axis;text(a(2)+1,a(3),'n'); ylabel('xe(n)'); axis([-10,10,-0.6,0.6])

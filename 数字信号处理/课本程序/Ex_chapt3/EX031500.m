% ������: �� 3.15:
%
subplot(1,1,1)
b = 1; a = [1,-0.8];
n=[0:100];x = cos(0.05*pi*n);
y = filter(b,a,x);
subplot(2,1,1); stem(n,x);
a=axis;text(a(2)+5,a(3),'n'); ylabel('x(n)'); title('��������')
subplot(2,1,2); stem(n,y);
a=axis;text(a(2)+5,a(3),'n'); ylabel('y(n)'); title('�������')

close all
n = 0:5
x = n+1;
subplot(2,1,1);
plot(n,x);
subplot(2,1,2);
[y,m] = sigfold(x,n);
plot(m,y);
figure
subplot(2,1,1);
plot(n,x);
subplot(2,1,2);
[y,m] = sigfold(x,n);
plot(m,y);


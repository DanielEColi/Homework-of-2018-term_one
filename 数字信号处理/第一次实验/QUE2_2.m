clc; clear all; close all;
n = 1:200;
x = cos(0.2*pi*n)+0.5*cos(0.6*pi*n);
[x_shift,n_shift] = sigshift(x,n,50);
y = x_shift;
m = n_shift;
[y,m] = sigadd(x, n, 0.1*x_shift, n_shift);
subplot(2,2,1);
plot(n,x);
title('original signal');
xlabel('n');
ylabel('x(n)');
subplot(2,2,2);
plot(m,y);
title('compound signal');
xlabel('n');
ylabel('y(n)');

[y_fold, m_fold] = sigfold(y, m);
[ryy,mryy] = conv_m(y,m,y_fold,m_fold);
subplot(2,2,3);
plot(mryy, ryy);
title('self_correlation of y(n)');
xlabel('l');
ylabel('ryy(n)')

% [x_shift_fold, n_shift_fold] = sigfold(x_shift, n_shift);
% [ryx, nyx] = conv_m(y,m,x_shift_fold,n_shift_fold)
% subplot(2,2,4);
% plot(nyx, ryx);

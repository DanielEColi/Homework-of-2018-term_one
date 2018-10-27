clc; clear all; close all;
n = -5:50;
x = stepseq(0, -5, 50) - stepseq(10, -5, 50);
h = 0.9.^n .* stepseq(0, -5, 50);
%绘制x(n)的图像
subplot(3, 1, 1);
stem(n, x);
title('x(n)');
xlabel('n');
ylabel('x');
%绘制h(n)的图像
subplot(3, 1, 2);
stem(n, h);
title('h(n)');
xlabel('n');
ylabel('h');
%绘制
% [y,ny] = conv_m(x,n,h,n);
b = [1];
a = [1, -0.9];
yy = filter(b, a, x);

subplot(3, 1, 3);
% stem(ny,y);
stem(n,yy);
title('y(n)');
xlabel('n');
ylabel('y');
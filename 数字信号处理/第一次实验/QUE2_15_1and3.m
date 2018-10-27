clc; clear all; close all;
a = [1, -0.5, 0.25];
b = [1, 2, 1];
n1 = 0:100;
x1 = impseq(0, 0, 100);
y1 = filter(b, a, x1);
subplot(2,1,1);
stem(n1, y1);
title('');

n2 = 0:200;
step = stepseq(0, 0, 200);
x2 = (5 + 3 * cos(0.2*pi*n2) + 4*sin(0.6*pi*n2)) .* step;
y2 = filter(b,a,x2);
subplot(2,1,2);
stem(n2, y2)
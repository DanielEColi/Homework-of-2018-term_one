clc; clear all; close all;
nx = -2:2;
x = [1, 1, 0, 1, 1];
nh = -3:0;
h = [1, -2, -3, 4];
[y, ny] = conv_m(x, nx, h, nh);
stem(ny, y);
title('2.11-2');
xlabel('n');
ylabel('y(n)')
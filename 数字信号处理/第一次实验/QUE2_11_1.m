clc; clear all; close all;
nx = -3:3;
x = [2, -4, 5, 3, -1, -2, 6];
nh = -2:2;
h = [1, -1, 1, -1, 1];
[y, ny] = conv_m(x, nx, h, nh);
stem(ny, y);
title('2.11-1');
xlabel('n');
ylabel('y(n)')

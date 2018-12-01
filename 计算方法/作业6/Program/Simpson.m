clc; clear; close all;

a = 1;
b = 4;
x = [a,(a+b)/2,b];
y = sqrt(1-exp(-x))./x;

S = (b-a)/6*(y(1)+4*y(2)+y(3))
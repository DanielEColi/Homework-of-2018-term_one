clc; clear; close all;

a = 1;
b = 4;
x = [a,b];
y = sqrt(1-exp(-x))./x;

T = (b-a)/2*(y(1)+y(2))
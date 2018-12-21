clc;clear;close all;

N = 20;
x = 0;

for i = 1:1:N
    tmp_x = x;
    x = x-(x^3-x^2-x-1)/(3*x^2-2*x-1)
    if abs(x - tmp_x) < 1e-5
        break;
    end
end
i
clc;clear;close all;

N = 7;
x = 1.5;

for i = 1:1:N
    tmp_x = x;
    x = x-(x^3+2*x^2+10*x-20)/(3*x^2+4*x+10)
%     if abs(x - tmp_x) < 1e-5
%         break;
%     end
end
i
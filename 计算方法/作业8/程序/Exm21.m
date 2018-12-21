clc; clear; close all;

N = 20;
x0 = 0.5;
x1 = 0.6;

for i = 1:1:N
    x = x1 - (x1*exp(x1)-1)/(x1*exp(x1)-x0*exp(x0))*(x1-x0)
    x0 = x1;
    x1 = x;
    if abs(x1-x0) < 1e-5
        break;
    end
end
i
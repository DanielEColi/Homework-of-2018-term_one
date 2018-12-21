clc; clear; close all;

N = 25;

x1 = 0;
x2 = 0;
x3 = 0;

for i=1:1:N
    tmp_x1 = x1;
    tmp_x2 = x2;
    tmp_x3 = x3;
    x1 = 1/5*(-12-2*tmp_x2-tmp_x3)
    x2 = 1/4*(20+tmp_x1-2*tmp_x3)
    x3 = 1/10*(3-2*tmp_x1+3*tmp_x2)
    if abs(x1 - tmp_x1) < 1e-5
        if abs(x2 - tmp_x2) < 1e-5
            if abs(x3 - tmp_x3) < 1e-5
                break;
            end
        end
    end
end
i
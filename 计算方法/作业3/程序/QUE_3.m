clc; close all; clear;

x = [-1 0 1];
y = [3 1 3];

n = length(x);

search_x = 0.5;
result = 0.0;
for ii = 1 : n
    p = 1.0;

    for jj = 1 : n
        if jj ~= ii
            p = p*(search_x-x(jj))/(x(ii)-x(jj));
        end
    end
    result = p*y(ii) + result;
end


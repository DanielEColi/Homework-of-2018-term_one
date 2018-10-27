function [xn] = idft(Xk,N)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
n = [0:1:N-1];
k = [0:1:N-1];
WN = exp(-j*2*pi/N);
nk = n' * k;
WNnk = WN .^ (-nk);
xn = (Xk * WNnk) / N;

end


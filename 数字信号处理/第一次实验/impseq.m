function [x, n] = impseq(n0,n1,n2)
%Generates x(n) = delta(n - n0); n1 <= n <= n2
%-----------------------------------------------
%[x,n] = impseq(n0,n1,n2)
%产生一个单位样本序列
n = [n1:n2];
x = [(n - n0) == 0];
end

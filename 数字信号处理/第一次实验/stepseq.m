function [x,n] = stepseq(n0,n1,n2)
%Generates x(n) = u(n - n0); n1 <= n <= n2
%-----------------------------------------
%[x,n] = stepseq(n0,n1,n2)
%产生一个单位阶跃序列
n = [n1:n2];
x = [(n - n0) >= 0]
end


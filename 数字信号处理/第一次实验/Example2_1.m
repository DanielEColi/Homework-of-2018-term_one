clc; clear; close all;
%a题
n1 = [-5:5];
a1 = 2*impseq(-2,-5,5);
a2 = impseq(4,-5,5);
x1 = a1 - a2;
subplot(2,2,1);
stem(n1,x1);
title('Sequence in Problem 2.1a')
xlabel('n');ylabel('x(n)');
%b题
n2 = [0:20];
x2 = n2 .* (stepseq(0,0,20) - stepseq(10,0,20)) + 10*exp(-0.3*(n2 - 10)).*(stepseq(10,0,20) - stepseq(20,0,20));
subplot(2,2,2);
stem(n2,x2);
title('Sequence in Problem 2.1b')
xlabel('n');ylabel('x(n)');
%c题
n3 = [0:50];
w = randn(1,51);
x3 = cos(0.04*pi*n3) + 0.2*w;
subplot(2,2,3);
stem(n3,x3);
title('Sequence in Problem 2.1c')
xlabel('n');ylabel('x(n)');
%d题
n4 = [-10:9];
x4 = [5,4,3,2,1];
xtilde = x4' * ones(1, 4);
xtilde = (xtilde(:))';
subplot(2,2,4);
stem(n4,xtilde);
title('Sequence in Problem 2.1d')
xlabel('n');ylabel('xtilde(n)');
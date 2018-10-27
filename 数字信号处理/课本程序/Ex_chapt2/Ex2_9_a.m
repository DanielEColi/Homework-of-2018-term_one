% MatlabµÚ¶şÕÂÀı2.9; 
%
clear;close all;
a=[1,-1,0.9];b=1;
% Part a)
%x=impseq(0,-20,120);
n=[-20:120];
%h=filter
h=impz(b,a,n);
subplot(2,1,1);stem(n,h)
%axis([-20,120,-1.1,1.1])
title('Âö³åÏìÓ¦');text(125,-1.1,'n');ylabel('h(n)')
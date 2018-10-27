%---------------------------------------------------------------------------------------
%  exa020103.m,  for  example 2.1.3 and fig 2.1.3
% 说明窗函数为无限宽时，STFT无时域的定位功能；
%  注：在该程序中，用到了子程序 amagauss.m, fmlin.m 及tfstft.m, 
%      还要用到显示程序 tfrqview及其他程序，
%      所有这些程序请读者在如下的网站上下载:
%                      http://crttsn.univ-nantes.fr/~auger/tftb.html
%      因为该网站上的时频分析软件并没有列入MATLAB的工具箱，涉及到知识产权问题，
%      因此不能将其列入国内公开出版物上，但读者可以自由下载。
%----------------------------------------------------------------------------------------
clear;

sig=amgauss(128,70,15).*fmlin(128); 
h=ones(127,1);
tfrstft(sig,1:128,128,h);



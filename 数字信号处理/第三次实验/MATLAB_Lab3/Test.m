clc; close all; clear;

f1=100;%信号频率Hz
f2=150;%信号频率Hz
f3=200;%信号频率Hz

fs=1000;%采样频率Hz
N=20;%采样点数
t=(0:N-1)/fs;%采样时间s
x1=sin(2*pi*f1*t);%信号采样值
x2=sin(2*pi*f2*t);%信号采样值
x3=sin(2*pi*f3*t);%信号采样值

x=x1+x2+x3;
plot(t,x,'.') 
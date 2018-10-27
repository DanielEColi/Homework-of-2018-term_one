%b=[1];a=zeros(1,51);a(1)=1;a(51)=0.1;
clear all;
clc;
close all;

n=1:200;
x=cos(0.2*pi*n)+0.5*cos(0.6*pi*n);
% [x2,m] =sigshift(x,n,50);
m=n+50;
figure(1)
 subplot(2,1,1); plot(n,x);
 subplot(212); plot(m,x)
 
 [y,ny]=sigadd(x,n,x,m);
 [fy,nfy]=sigfold(y,ny);
 [Ryy,L]=conv_m(y,ny,fy,nfy);%y的自相关
 
 figure(2)
 plot(L,Ryy);
 figure(3)
 plot(ny,y);
Y=[y,y,y,y];
for r=1:500
    Rxy(r)=x*Y(r:r+199)'/135;
end
nr=0:499;
figure(4)
plot(nr,Rxy)


%{
[Ryy,L]=xcorr(y)
plot(L,Ryy)
x=cos(0.2*pi*n)+0.5*cos(0.6*pi*n);
figure
[Rxx,xl]=xcorr(x);
plot(xl,Rxx);
z=Ryy-(1+0.01)*Rxx;
figure
plot(L,z);
%}
%{
[z,nz]=sigfold(y2,n);
[Ryy,ly]=conv_m(y,n,z,nz);
plot(ly,Ryy)
%}





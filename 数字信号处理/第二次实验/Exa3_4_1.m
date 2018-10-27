clc; clear all; close all;

N = 200;
n = 0 : N - 1;
x = ones(1 , N);
k = 0 : 500;
w = (pi / 500) * k;
X = x * exp(-j * pi / 500) .^ (n' * k);

 magX = abs(X); 
 angX = angle(X);
 realX = real(X);
 imagX = imag(X);
 
 subplot(2, 2, 1);
 plot(k / 500, magX);
 grid
 xlabel('frequencu in pi units');
 title('magnitude Part');
 
 subplot(2, 2, 3);
 plot(k / 500, angX / pi);
 grid
 xlabel('frequencu in pi units');
 title('Angle Part');
 
 subplot(2, 2, 2);
 plot(k / 500, realX);
 grid
 xlabel('frequency in pi units');
 title('Real Part');
 
 subplot(2, 2, 4);
 plot(k / 500, imagX);
 grid
 xlabel('frequency in pi units');
 title('Imaginary Part')
 
clc; clear; close all;

wc = 0.5*pi;
a = 20;
N = 2*a+1;

for n = 1 : N
    if (n - a) == 0
        h(n) = wc / pi;
    else
        h(n) = sin(wc*(n - a)) / (pi*(n - a));
    end
end
n = 1:N;
k = 0:500;
w = (pi/500)* k;
H = h*exp(-j*n'*w);

magH = abs(H); 
angH = angle(H);
realH = real(H);
imagH = imag(H);
figure('NumberTitle','off','Name', 'H(e^jw) figrue')
subplot(221);
plot(k/500, magH);
grid;
xlabel('frequencu in pi units');
title('magnitude Part');
subplot(223)
plot(k/500, angH);
grid;
xlabel('frequencu in pi units');
title('Angle Part');
subplot(222)
plot(k/500, realH);
grid;
xlabel('frequencu in pi units');
title('Real Part');
subplot(224)
plot(k/500, imagH);
grid;
xlabel('frequencu in pi units');
title('Imaginary Part');


Hd = (w <= wc).*exp(-j*a*w);

magHd = abs(Hd); 
angHd = angle(Hd);
realHd = real(Hd);
imagHd = imag(Hd);
figure('NumberTitle','off','Name', 'Hd(e^jw) figrue')
subplot(221);
plot(k/500, magHd);
grid;
xlabel('frequencu in pi units');
title('magnitude Part');
subplot(223)
plot(k/500, angHd);
grid;
xlabel('frequencu in pi units');
title('Angle Part');
subplot(222)
plot(k/500, realHd);
grid;
xlabel('frequencu in pi units');
title('Real Part');
subplot(224)
plot(k/500, imagHd);
grid;
xlabel('frequencu in pi units');
title('Imaginary Part');
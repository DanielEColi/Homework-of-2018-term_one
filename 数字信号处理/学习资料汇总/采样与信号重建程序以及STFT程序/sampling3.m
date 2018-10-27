% ²Î¿¼³ÌÐò
clear all
clc
Fs = 800;%sampling frequency 800;400;200
Ts = 1/Fs; 
nTs = 0:Ts:0.01;
x = sin(2*pi*100*nTs);%samples
% 
Dt = 0.00005;
t = 0:Dt:0.01;
xa = x * sinc(Fs*(ones(length(nTs),1)*t-nTs'*ones(1,length(t))));
% 
error = max(abs(xa - sin(2*pi*100*t)))
% 
plot(t,xa,'b');
xlabel('t second'); ylabel('xa(t)')
title('sampling and reconstruction'); hold on
stem(nTs,x,'g'); 
plot(t,sin(2*pi*100*t),'r');
legend({'reconstructed xa(t)','Samples','sin(2*pi*100*t)'},'Location','NorthEast');
hold off

clc; clear; close all

x = 0:0.1:0.5;

y2 = 1./(x-1+2*exp(-x))

y = zeros(1, length(x));
y(1) = 1;

for cnt = 2:1:length(x)
    y(cnt) = y(cnt-1)+0.1*(y(cnt-1)-x(cnt-1)*y(cnt-1)*y(cnt-1));
end
y

kk = abs(y - y2)

y3 = zeros(1, length(x));
y3(1) = 1;
for cnt2 = 2:1:length(x)
    y3(cnt2) = y3(cnt2-1)+0.1*(y3(cnt2-1)-x(cnt2-1)*y3(cnt2-1)*y3(cnt2-1))
    x(cnt2)
    y3(cnt2) = y3(cnt2-1)+(0.1/2)*((y3(cnt2-1)-x(cnt2-1)*y3(cnt2-1)*y3(cnt2-1))+(y3(cnt2)-x(cnt2)*y3(cnt2)*y3(cnt2)));
end
y3
gg = abs(y3-y2)
n=[0:50];
x=(0.8).^n.*stepseq(0,0,50);
h=(-0.9).^n.*stepseq(0,0,50);
y=conv(x,h)
%stem(n,y)
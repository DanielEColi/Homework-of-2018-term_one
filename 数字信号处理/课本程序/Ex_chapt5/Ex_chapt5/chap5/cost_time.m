L=11;
fft_time=zeros(1,11);
for n=1:1:L
    x=rand(1,2.^n);
    t=clock;
    fft(x);
    fft_time(n)=etime(clock,t);
end
dft_time=zeros(1,11);
for n=1:1:L
    x=rand(1,2.^n);
    t=clock;
    dfs(x,2.^n);
    dft_time(n)=etime(clock,t);
end
n=1:L;
plot(n,fft_time,'g');
hold on;
plot(n,dft_time,'*');

    

clear;

wc=0.6*pi;
k=0:500;
w=(pi/500).*k;

% 改变窗函数的长度，观察Gibbs现象
%
M=10;                                           % for M=10
N=2*M+1;                         
for n=1:N
   if (n-M)==0;
      h(n)=wc/pi;
   else
      h(n)=sin(wc*(n-M))/(pi*(n-M));
      end 
end
n=1:N;
stem(n,h)
H1=h*exp(-j*n'*w);
figure
subplot(221)
plot(w/pi,abs(H1));grid on;
%
M=30;                                           % for M=30
N=2*M+1;                         
for n=1:N
   if (n-M)==0;
      h(n)=wc/pi;
   else
      h(n)=sin(wc*(n-M))/(pi*(n-M));
      end 
end
n=1:N;
H2=h*exp(-j*n'*w);
subplot(222)
plot(w/pi,abs(H2));grid on;
%
%
M=50;                                           %for M=50
N=2*M+1;
for n=1:N
   if (n-M)==0;
      h(n)=wc/pi;
   else
      h(n)=sin(wc*(n-M))/(pi*(n-M));
      end 
end
n=1:N;
H3=h*exp(-j*n'*w);
subplot(223)
plot(w/pi,abs(H3));grid on;
%
M=100;                                          % for M=100
N=2*M+1;
for n=1:N
   if (n-M)==0;
      h(n)=wc/pi;
   else
      h(n)=sin(wc*(n-M))/(pi*(n-M));
      end 
end
n=1:N;
H4=h*exp(-j*n'*w);
subplot(224)
plot(w/pi,abs(H4));grid on;



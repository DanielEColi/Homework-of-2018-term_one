function h=ideal_lp(wc,M);
  tao = (M-1)/2;                  
for n=1:M
   if (n-1-tao)==0;
      h(n)=wc/pi;
   else
      h(n)=sin(wc*(n-1-tao))/(pi*(n-1-tao));
      end 
end
  


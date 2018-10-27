function x_new=exa110201_sub(h0,x_old,N,M);
%--------------------------------------------------------------------------
%  exa110201_sub.m,  for fig11.2.1 and fig 11.2.2
%  由 exa110201 调用。 用于计算（11.2.3）式。
%--------------------------------------------------------------------------

x_new=zeros(2,200000);
for i=1:N*2
    for j=1:M
        if((2*i/100-j+1)*100<=0)
        else
            x_new(1,i)=x_new(1,i)+x_old(1,floor((2*i/100-j+1)*100))*h0(j);
        end
    end
    x_new(1,i)=x_new(1,i)*sqrt(2);
    x_new(2,i)=x_old(2,i);
end


clc
%产生11个信号，11个信号进行加运算
n=-10:10;
x=zeros(11,21);%每行存放一个信号，信号长度是21点
for k=-5:5;
    x(k+6,:)=exp(-abs(k))*impseq(-2*k,-10,10);
end
    y=sum(x,1);
    



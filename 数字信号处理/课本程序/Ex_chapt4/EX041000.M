% 第四章: 例 4.10:
%  检查留数函数 rf2pfez and pfe2rfz
%
b = [1,0.4*sqrt(2)]; a=[1,-0.8*sqrt(2),0.64];
[R,p,C] = residuez(b,a)
Mp=abs(p')   % 极点的模
Ap=angle(p')/pi   % 极点相角以 pi为单位 
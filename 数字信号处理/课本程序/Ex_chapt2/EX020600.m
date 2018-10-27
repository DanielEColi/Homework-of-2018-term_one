% Example 2.6
%
% x(n)=[3,11,7,0,-1,4,2]; nx = [-3:3]
% h(n)=[2,3,0,-5,2,1]; nh = [-1:4]
% y(n)=conv(x,h)
% input x(n)
x = [3,11,7,0,-1,4,2]; nx = [-3:3];
% 脉冲响应 h(n)
h = [2,3,0,-5,2,1]; nh = [-1:4];
subplot(1,1,1)
% plot x(k) and h(k)
subplot(2,2,1); stem(nx-0.05,x); axis([-5,5,-6,12]);
hold on; stem(nh+0.05,h,':')
title('x(k) 和 h(k)');a=axis;text(a(2)+.5,a(3),'k');
text(-1.5,11,'实线: x  虚线: h'); hold off
% plot x(k) and h(-k)
subplot(2,2,2); stem(nx-0.05,x); axis([-5,5,-6,12]);
hold on; stem(-fliplr(nh)+0.05,fliplr(h),':')
title('x(k) 和 h(-k)');a=axis;text(a(2)+.5,a(3),'k')
text(-0.5,-1,'n=0')
text(-1.5,11,'实线: x  虚线: h'); hold off
% 画出 x(k) 和 h(-1-k)
subplot(2,2,3); stem(nx-0.05,x); axis([-5,5,-6,12]);
hold on; stem(-fliplr(nh)+0.05-1,fliplr(h),':')
title('x(k) 和 h(-1-k)');a=axis;text(a(2)+.5,a(3),'k');
text(-1.5,-1,'n=-1')
text(-1.5,11,'实线: x  虚线: h'); hold off
% 画出 x(k) 和 h(2-k)
subplot(2,2,4); stem(nx-0.05,x); axis([-5,5,-6,12]);
hold on; stem(-fliplr(nh)+0.05+2,fliplr(h),':')
title('x(k) 和 h(2-k)');a=axis;text(a(2)+.5,a(3),'k');
text(2-0.5,-1,'n=2')
text(-1.5,11,'实线: x  虚线: h'); hold off
%print -deps2 ex020600.eps
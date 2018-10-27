% 第五章: 例5.23 高速卷积
% b)运行a)后画出存储数据的图
load times.txt -ascii;
conv_time=times(1,:);
hsconv_time=times(2,:);
n = 1:150; subplot(1,1,1); %set(gca,'LineWidth',10);
plot(n(25:150),conv_time(25:150),n(25:150),hsconv_time(25:150))
axis([0,180,0,0.4]);
set(gca,'XTickMode','manual','XTick',[25;50;75;100;125;150]);
set(gca,'YTickMode','manual','YTick',[0.05:0.05:0.35]); %grid
text(150,0.17,'高速')
text(150,0.155,'卷积')
text(150,0.34,'卷积')
xlabel('序列长度N'); ylabel('时间（单位：秒）');
title('卷积时间的比较');
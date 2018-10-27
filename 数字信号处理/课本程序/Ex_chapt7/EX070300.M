% 第七章: 例7.3  振幅响应和幅度响应
%
h = [1,1,1];
w = [0:500]*pi/500;
H = freqz(h,1,w);
magH = abs(H); phaH = angle(H);
ampH = ones(1,501)+2*cos(w); angH = -w;
subplot(1,1,1)
subplot(2,2,1); plot(w/pi,magH); title('幅度响应');
xlabel( ''); ylabel('|H|'); grid
axis([0 1 -1.5 3.5]);
set(gca,'XTickMode','manual','XTick',[0;0.6667;1])
set(gca,'XTickLabelMode','manual','XTickLabels',[' 0 ';'2/3';' 1 '])
set(gca,'YTickMode','manual','YTick',[0])
subplot(2,2,3); plot(w/pi,phaH/pi); title('分段线性相位响应');
xlabel( '以pi为单位的频率'); ylabel('角度（单位：pi）'); grid
axis([0 1 -1 1])
set(gca,'XTickMode','manual','XTick',[0;0.6667;1])
set(gca,'XTickLabelMode','manual','XTickLabels',[' 0 ';'2/3';' 1 '])
set(gca,'YTickMode','manual','YTick',[-0.6667;0;0.3333])
set(gca,'YTickLabelMode','manual','YTickLabels',['-2/3';'   0';' 2/3'])
subplot(2,2,2); plot(w/pi,ampH); title('振幅响应');
xlabel( '');  ylabel('Hr'); grid
axis([0 1 -1.5 3.5])
set(gca,'XTickMode','manual','XTick',[0;0.6667;1])
set(gca,'XTickLabelMode','manual','XTickLabels',[' 0 ';'2/3';' 1 '])
set(gca,'YTickMode','manual','YTick',[0])
subplot(2,2,4); plot(w/pi,angH/pi); title('线性相位响应');
xlabel( '以pi为单位的频率'); ylabel('角度（单位：pi）'); grid
axis([0 1 -1 1])
set(gca,'XTickMode','manual','XTick',[0;0.6667;1])
set(gca,'XTickLabelMode','manual','XTickLabels',[' 0 ';'2/3';' 1 '])
set(gca,'YTickMode','manual','YTick',[-0.6667;0])
set(gca,'YTickLabelMode','manual','YTickLabels',['-2/3';'   0'])

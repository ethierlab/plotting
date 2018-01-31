function plotShadedSD(timeframe,Data, SD)

numpts = length(timeframe);
xIdx  = [1:numpts numpts:-1:1];
xarea = timeframe(xIdx);
% xarea = xIdx;

figure;
plotCE(timeframe,Data);
hold on;
lines = flipud(get(gca,'Children'));
for i = 1:size(Data,2)
    ytop = Data(:,i) + SD(:,i);
    ybot = Data(:,i) - SD(:,i);
    yarea = [ytop; ybot(end:-1:1)];
    patch(xarea,yarea,lines(i).Color,'LineStyle','none','FaceAlpha',0.3);
%     area(xarea,yarea,'Facecolor',lines(i).Color,'LineStyle','none','FaceAlpha',0.3);
end

% flip order of lines
%set(gca,'children',flipud(get(gca,'children')));



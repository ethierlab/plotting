function fh = plotShadedSD(varargin)
% plotShadedSD(timeframe,Data,SD,[colors_cellarray]) or plotShadedSD(fh,timeframe,Data,SD,[colors_cellarray])
col_str = {};

if ishandle(varargin{1})
    fh = varargin{1};
    timeframe = varargin{2};
    Data = varargin{3};
    SD = varargin{4};
    if nargin>4
        col_str = varargin{5};
    end
else
    timeframe = varargin{1};
    Data = varargin{2};
    SD = varargin{3};
    if nargin>3
        col_str = varargin{4};
    end
    fh = figure;
end

numpts = length(timeframe);
xIdx   = [1:numpts numpts:-1:1];
xarea  = timeframe(xIdx);
% xarea = xIdx;
ax     = gca(fh);


hold on;

if isempty(col_str)
    plot(ax,timeframe,Data);
else
    for i = 1:size(Data,2)
        plot(ax,timeframe,Data(:,i),col_str{i});
    end
end
pretty_fig;

lines = flipud(get(ax,'Children'));
for i = 1:size(Data,2)
    
    ytop = Data(:,i) + SD(:,i);
    ybot = Data(:,i) - SD(:,i);
    yarea = [ytop; ybot(end:-1:1)];
    patch(xarea,yarea,lines(i).Color,'LineStyle','none','FaceAlpha',0.3);
    %     area(xarea,yarea,'Facecolor',lines(i).Color,'LineStyle','none','FaceAlpha',0.3);
end

% flip order of lines
%set(gca,'children',flipud(get(gca,'children')));



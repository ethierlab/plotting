function h = plotCE(varargin)
% Calls to plot.m with different default linewidth,tickmarks,boxes
% properties, etc. to make plots prettier and standardized for Ethier lab
% 

h = plot(varargin{:});

% set ticks outside, no box and heavier lineweigth
set(gca,'Box','Off',...
        'FontName','Arial','FontSize',12,'FontWeight','Bold',...
        'TickDir','Out','LineWidth',1.5);

% change line colors to the jet colormap
lines     = get(gca,'Children');
lines_col = jet(numel(lines));
for i = 1:numel(lines)
    set(lines(i),'Color',lines_col(i,:),...
                'LineWidth',1.5,...
                'MarkerEdgeColor',lines_col(i,:),...
                'MarkerFaceColor',lines_col(i,:) ...
                );
end
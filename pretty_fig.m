function pretty_fig(varargin)

if nargin
    current_axes = varargin{1};
else
    current_axes = gca;
end

set(current_axes,'Box','Off',...
        'FontName','Arial','FontSize',12,'FontWeight','Bold',...
        'TickDir','Out','LineWidth',1.5);

% change line colors to the jet colormap
lines     = get(current_axes,'Children');
for i = 1:numel(lines)
    set(lines(i),'LineWidth',1.5);
 
end

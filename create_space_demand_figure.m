function create_space_demand_figure(ZData1, YData1, XData1, CData1, CData2, CData3, CData4, CData5, CData6, CData7, CData8)
%CREATEFIGURE(ZDATA1, YDATA1, XDATA1, CDATA1, CDATA2, CDATA3, CDATA4, CDATA5, CDATA6, CDATA7, CDATA8)
%  ZDATA1:  surface zdata
%  YDATA1:  surface ydata
%  XDATA1:  surface xdata
%  CDATA1:  surface cdata
%  CDATA2:  surface cdata
%  CDATA3:  surface cdata
%  CDATA4:  surface cdata
%  CDATA5:  surface cdata
%  CDATA6:  surface cdata
%  CDATA7:  surface cdata
%  CDATA8:  surface cdata

%  由 MATLAB 于 23-Jan-2018 11:00:41 自动生成

% 创建 figure
figure1 = figure('Color',[1 1 1]);

% 创建 axes
axes1 = axes('Parent',figure1,...
    'Position',[0.13 0.501130442385031 0.156648936170213 0.341162790697675],...
    'CLim',[-2.77555756156289e-17 22.9893102264606]);
%% 取消注释以下行以保留轴的 X 极限
% xlim(axes1,[31.234555 31.489726]);
%% 取消注释以下行以保留轴的 Y 极限
% ylim(axes1,[121.128984 121.374178]);
box(axes1,'on');
hold(axes1,'all');

% 创建 surface
surface('Parent',axes1,'ZData',ZData1,'YData',YData1,'XData',XData1,...
    'FaceColor','interp',...
    'EdgeColor','none',...
    'CData',CData1);

% 创建 contour
contour(XData1,YData1,CData1,'LineStyle',':','LineColor',[0 0 0],...
    'LevelList',[-0.725948049678113 -0.279075141319153 0.167797767039806 0.614670675398766 1.06154358375773],...
    'Parent',axes1);

% 创建 title
title('16:30');

% 创建 axes
axes2 = axes('Parent',figure1,...
    'Position',[0.336117021276596 0.501130442385031 0.156648936170213 0.341162790697675],...
    'CLim',[-2.77555756156289e-17 22.9893102264606]);
%% 取消注释以下行以保留轴的 X 极限
% xlim(axes2,[31.234555 31.489726]);
%% 取消注释以下行以保留轴的 Y 极限
% ylim(axes2,[121.128984 121.374178]);
box(axes2,'on');
hold(axes2,'all');

% 创建 surface
surface('Parent',axes2,'ZData',ZData1,'YData',YData1,'XData',XData1,...
    'FaceColor','interp',...
    'EdgeColor','none',...
    'CData',CData2);

% 创建 contour
contour(XData1,YData1,CData2,'LineStyle',':','LineColor',[0 0 0],...
    'LevelList',[-5.2942128292471 -2.03540280060268 1.22340722804174 4.48221725668616 7.74102728533058],...
    'Parent',axes2);

% 创建 title
title('17:00');

% 创建 axes
axes3 = axes('Parent',figure1,...
    'Position',[0.542234042553192 0.501130442385031 0.156648936170213 0.341162790697675],...
    'CLim',[-2.77555756156289e-17 22.9893102264606]);
%% 取消注释以下行以保留轴的 X 极限
% xlim(axes3,[31.234555 31.489726]);
%% 取消注释以下行以保留轴的 Y 极限
% ylim(axes3,[121.128984 121.374178]);
box(axes3,'on');
hold(axes3,'all');

% 创建 surface
surface('Parent',axes3,'ZData',ZData1,'YData',YData1,'XData',XData1,...
    'FaceColor','interp',...
    'EdgeColor','none',...
    'CData',CData3);

% 创建 contour
contour(XData1,YData1,CData3,'LineStyle',':','LineColor',[0 0 0],...
    'LevelList',[-9.82538424823273 -3.7649573746462 2.29546949894034 8.35589637252687 14.4163232461134],...
    'Parent',axes3);

% 创建 title
title('17:30');

% 创建 axes
axes4 = axes('Parent',figure1,...
    'Position',[0.748351063829787 0.501130442385031 0.156648936170213 0.341162790697675],...
    'CLim',[-2.77555756156289e-17 22.9893102264606]);
%% 取消注释以下行以保留轴的 X 极限
% xlim(axes4,[31.234555 31.489726]);
%% 取消注释以下行以保留轴的 Y 极限
% ylim(axes4,[121.128984 121.374178]);
box(axes4,'on');
hold(axes4,'all');

% 创建 surface
surface('Parent',axes4,'ZData',ZData1,'YData',YData1,'XData',XData1,...
    'FaceColor','interp',...
    'EdgeColor','none',...
    'CData',CData4);

% 创建 contour
contour(XData1,YData1,CData4,'LineStyle',':','LineColor',[0 0 0],...
    'LevelList',[-11.2406123695248 -4.2873180640314 2.66597624146204 9.61927054695549 16.5725648524489],...
    'Parent',axes4);

% 创建 title
title('18:00');

% 创建 axes
axes5 = axes('Parent',figure1,...
    'Position',[0.13 0.105206980928773 0.156648936170213 0.341162790697674],...
    'CLim',[-2.77555756156289e-17 22.9893102264606]);
%% 取消注释以下行以保留轴的 X 极限
% xlim(axes5,[31.234555 31.489726]);
%% 取消注释以下行以保留轴的 Y 极限
% ylim(axes5,[121.128984 121.374178]);
box(axes5,'on');
hold(axes5,'all');

% 创建 surface
surface('Parent',axes5,'ZData',ZData1,'YData',YData1,'XData',XData1,...
    'FaceColor','interp',...
    'EdgeColor','none',...
    'CData',CData5);

% 创建 contour
contour(XData1,YData1,CData5,'LineStyle',':','LineColor',[0 0 0],...
    'LevelList',[-10.7299095350228 -4.07122980869071 2.58744991764139 9.24612964397349 15.9048093703056],...
    'Parent',axes5);

% 创建 title
title('18:30');

% 创建 axes
axes6 = axes('Parent',figure1,...
    'Position',[0.336117021276596 0.105206980928773 0.156648936170213 0.341162790697674],...
    'CLim',[-2.77555756156289e-17 22.9893102264606]);
%% 取消注释以下行以保留轴的 X 极限
% xlim(axes6,[31.234555 31.489726]);
%% 取消注释以下行以保留轴的 Y 极限
% ylim(axes6,[121.128984 121.374178]);
box(axes6,'on');
hold(axes6,'all');

% 创建 surface
surface('Parent',axes6,'ZData',ZData1,'YData',YData1,'XData',XData1,...
    'FaceColor','interp',...
    'EdgeColor','none',...
    'CData',CData6);

% 创建 contour
contour(XData1,YData1,CData6,'LineStyle',':','LineColor',[0 0 0],...
    'LevelList',[-8.66627019793473 -3.15562159438158 2.35502700917156 7.8656756127247 13.3763242162778],...
    'Parent',axes6);

% 创建 title
title('19:00');

% 创建 axes
axes7 = axes('Parent',figure1,...
    'Position',[0.542234042553192 0.105206980928773 0.156648936170213 0.341162790697674],...
    'CLim',[-2.77555756156289e-17 22.9893102264606]);
%% 取消注释以下行以保留轴的 X 极限
% xlim(axes7,[31.234555 31.489726]);
%% 取消注释以下行以保留轴的 Y 极限
% ylim(axes7,[121.128984 121.374178]);
box(axes7,'on');
hold(axes7,'all');

% 创建 surface
surface('Parent',axes7,'ZData',ZData1,'YData',YData1,'XData',XData1,...
    'FaceColor','interp',...
    'EdgeColor','none',...
    'CData',CData7);

% 创建 contour
contour(XData1,YData1,CData7,'LineStyle',':','LineColor',[0 0 0],...
    'LevelList',[-5.63878532108863 -1.79210784607674 2.05456962893514 5.90124710394702 9.74792457895891],...
    'Parent',axes7);

% 创建 title
title('19:30');

% 创建 axes
axes8 = axes('Parent',figure1,...
    'Position',[0.748351063829787 0.105206980928773 0.156648936170213 0.341162790697674],...
    'CLim',[-2.77555756156289e-17 22.9893102264606]);
%% 取消注释以下行以保留轴的 X 极限
% xlim(axes8,[31.234555 31.489726]);
%% 取消注释以下行以保留轴的 Y 极限
% ylim(axes8,[121.128984 121.374178]);
box(axes8,'on');
hold(axes8,'all');

% 创建 surface
surface('Parent',axes8,'ZData',ZData1,'YData',YData1,'XData',XData1,...
    'FaceColor','interp',...
    'EdgeColor','none',...
    'CData',);

% 创建 contour
contour(XData1,YData1,CData8,'LineStyle',':','LineColor',[0 0 0],...
    'LevelList',[-2.78861776820799 -0.684677844866576 1.41926207847484 3.52320200181625 5.62714192515766],...
    'Parent',axes8);

% 创建 title
title('20:00');

% 创建 colorbar
colorbar('peer',axes8,[0.25 0.9 0.515 0.025]);


colorbar('Location','North','Position',[0.25,0.9,0.515,0.025]);
hold on;
[X,Y,Z] = griddata(x,y,z1(:,1),linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');
pcolor(X,Y,Z);
caxis([zmin,zmax]);
shading interp
hold on
n = 5;
C = contour(X, Y, Z, n, 'k:');
color = {'r*','g*','m*','k*','y*','b*'};
for i = 1:size(neibour_swap_stations,1)
    neibour_swap_station = neibour_swap_stations{i};
    plot(x(neibour_swap_station),y(neibour_swap_station),color{i});
end

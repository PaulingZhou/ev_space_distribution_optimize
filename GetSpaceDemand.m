clear;
load('duration.mat');
load('time_swap_dist.mat');
[building_relation, resident_relation, shopping_relation] = get_all_relation(duration_building2chargestation,duration_resident2chargestation,duration_shopping2chargestation);
[building_space_demand, resident_space_demand, shopping_space_demand] = get_all_space_demand(building_relation, resident_relation, shopping_relation);
day_space_demand = 0.6*building_space_demand + 0.3*shopping_space_demand+ 0.1*resident_space_demand;
night_space_demand = 0.2*building_space_demand + 0.3*shopping_space_demand+ 0.5*resident_space_demand;
weekend_space_demand = 0.1*building_space_demand + 0.4*shopping_space_demand+ 0.5*resident_space_demand;
x = position_chargingstation(:,2);
y =  position_chargingstation(:,1);
z1(:,1) = day_space_demand*10;
z1(:,2) = 1:1:size(day_space_demand,1);
sort_z = sortrows(z1,-1);
neibour_swap_stations = cell(89,1);
for i = 1:size(sort_z,1)
    if(sort_z(i,1) < 30)
        break;
    else
        index = sort_z(i,2);
        building_demand_points = find(building_relation(:,index));
        resident_demand_points = find(resident_relation(:,index));
        shopping_demand_points = find(shopping_relation(:,index));
        neibour_swap_stations{i} = find(sum(building_relation(building_demand_points,:),1)+sum(resident_relation(resident_demand_points,:),1)+sum(shopping_relation(shopping_demand_points,:),1));
    end
end
neibour_swap_stations(cellfun(@isempty,neibour_swap_stations))=[];
for i = 1:size(neibour_swap_stations,1)
    for j = 1:i-1
        if intersect(neibour_swap_stations{i},neibour_swap_stations{j})
            neibour_swap_stations{j} = unique([neibour_swap_stations{j}, neibour_swap_stations{i}]);
            neibour_swap_stations{i} = [];
            break;
        end
    end
end
neibour_swap_stations(cellfun(@isempty,neibour_swap_stations))=[];

figure();
hold on;
color = {'r.','g.','b.','m.','k.','y.'};
for i = 1:size(neibour_swap_stations,1)
    swap_clusters = neibour_swap_stations{i};
%     optimize_swap_demand(swap_clusters,z1(swap_clusters,1));
    z1(swap_clusters)
    plot(x(swap_clusters),y(swap_clusters),color{i});
end
hold off;

% [X,Y,Z] = griddata(x,y,z1,linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');
% pcolor(X,Y,Z);
% shading interp
% zmax = max(max(Z));
% zmin = min(min(Z));
% caxis([zmin,zmax]);
% hold on;
% n = 5;
% C = contour(X, Y, Z, n, 'k:');
% clabel(C);


% figure,surf(X,Y,Z);
% hold on;
% z2 = night_space_demand;
% [X,Y,Z] = griddata(x,y,z2,linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');
% figure,surf(X,Y,Z);
% hold on;
% z3 = weekend_space_demand;
% [X,Y,Z] = griddata(x,y,z3,linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');
% figure,surf(X,Y,Z);
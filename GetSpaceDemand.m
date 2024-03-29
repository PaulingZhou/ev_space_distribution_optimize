clc;
clear;
load('relation.mat');
load('time_swap_dist.mat');
load('space_ratio.mat');
load('neibour_swap_stations.mat');
load('position.mat');
subsidy = zeros(89,1);
[building_space_demand, resident_space_demand, shopping_space_demand] = get_all_space_demand(building_relation, resident_relation, shopping_relation,subsidy);
space_time_demand_ratio = space_ratio * [resident_space_demand';building_space_demand';shopping_space_demand'];
space_time_demand = space_time_demand_ratio.*repmat(swap_time_dist_update,1,size(space_time_demand_ratio,2));

swap_server_continue = zeros(size(space_time_demand));    
swap_server_line = zeros(size(space_time_demand,1),size(space_time_demand,2),1);    
server_ability = 4;
for t = 1:879;
    for j = 1:size(space_time_demand,2)
        for k = t:1430
            serve_start = min(space_time_demand(t,j),server_ability-swap_server_continue(k,j));
            swap_server_line(t,j,k-t+1) = serve_start;
            swap_server_continue(k:k+9,j) = swap_server_continue(k:k+9,j)+serve_start;
            space_time_demand(t,j) = space_time_demand(t,j) - serve_start;
            if space_time_demand(t,j) == 0
                break;
            end
        end
    end
end
swap_line_count = zeros(1440,size(swap_server_line,2)); %swap_line_count(i,k) i时刻k车站的排队车辆数
for i = 1:size(swap_server_line,1)
        for k = 1:size(swap_server_line,3)
            if i+k-1<=1440
                swap_line_count(i:i+k-1,:) = bsxfun(@plus,swap_line_count(i:i+k-1,:),swap_server_line(i,:,k));
            end
        end
end
x = position_chargingstation(:,2);
y =  position_chargingstation(:,1);
zmax = max(max(swap_line_count));
zmin = min(min(swap_line_count));
for i = 1:8
    subplot(2,4,i);
    title('a');
    [X,Y,Z] = griddata(x,y,swap_line_count(840+30*i,:),linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');
    pcolor(X,Y,Z);
    caxis([zmin,zmax]);
    shading interp
    hold on
    n = 5;
    C = contour(X, Y, Z, n, 'k:');
end
colorbar('Location','North','Position',[0.25,0.95,0.515,0.025]);
set(gcf,'Color','w');
hold on;

z1(:,1) = swap_line_count(960,:);
z1(:,2) = 1:1:size(swap_line_count,2);
sort_z = sortrows(z1,-1);
neibour_swap_stations = cell(89,1);
for i = 1:size(sort_z,1)
    if(sort_z(i,1) < 1)
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

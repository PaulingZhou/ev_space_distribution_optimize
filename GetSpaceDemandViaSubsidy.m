clc;
clear;
load('relation.mat');
load('time_swap_dist.mat');
load('space_ratio.mat');
load('neibour_swap_stations.mat');
load('position.mat');
load('subsidy_1.mat');
load('subsidy_3.mat');
load('subsidy_2.mat');
subsidy = zeros(89,144);
% subsidy(neibour_swap_stations{1},88:110)=subsidy_1';
% subsidy(neibour_swap_stations{2},88:110)=subsidy_2';
% subsidy(neibour_swap_stations{3},88:110)=subsidy_3';
swap_server_continue = zeros(1440,89);    
swap_server_line = zeros(1440,89,1);   
line_cost = 0;
for i = 1:144
    [building_space_demand, resident_space_demand, shopping_space_demand] = get_all_space_demand(building_relation, resident_relation, shopping_relation,subsidy(:,i));
    space_time_demand_ratio = space_ratio * [resident_space_demand';building_space_demand';shopping_space_demand'];
    space_time_demand = space_time_demand_ratio.*repmat(swap_time_dist_update,1,size(space_time_demand_ratio,2)); 
    server_ability = 4;
    for t = i*10-9:i*10
        for j = 1:size(space_time_demand,2)
            for k = t:1430
                serve_start = min(space_time_demand(t,j),server_ability-swap_server_continue(k,j));
                swap_server_line(t,j,k-t+1) = serve_start;
                swap_server_continue(k:k+9,j) = swap_server_continue(k:k+9,j)+serve_start;
                space_time_demand(t,j) = space_time_demand(t,j) - serve_start;
                line_cost = line_cost + serve_start*0.0045*(k-t)^2;
                if space_time_demand(t,j) == 0
                    break;
                end
            end
        end        
    end
end
size_time = size(swap_server_line,3);
figure(1);
plot(reshape(sum(sum(swap_server_line(:,:,2:size_time))),size_time-1,1),'r');
hold on;
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
zmax = 30;
zmin = 0;
figure();
for i = 1:8
    subplot(2,4,i);
    title('a');
    [X,Y,Z] = griddata(x,y,swap_line_count(840+30*i,:),linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');
    pcolor(X,Y,Z);
    caxis([zmin,zmax]);
    shading interp
    hold on
    n = 6;
    C = contour(X, Y, Z, n, 'k:');
end
colorbar('Location','North','Position',[0.25,0.95,0.515,0.025]);
set(gcf,'Color','w');
hold on;
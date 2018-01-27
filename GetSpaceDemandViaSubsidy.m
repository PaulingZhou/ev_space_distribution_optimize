clc;
clear;
load('duration.mat');
load('time_swap_dist.mat');
load('space_ratio.mat');
load('neibour_swap_stations.mat');
load('subsidy_cluster{1}.mat');
neibour_swap_station = neibour_swap_stations{1};
subsidy_all = zeros(89,144);
% subsidy(neibour_swap_stations{1},85:110) = subsidy_cluster1';
total_cost = zeros(144,1);
for time = 1:144
    subsidy = subsidy_all(neibour_swap_stations{1},time);
    [building_relation, resident_relation, shopping_relation] = get_all_relation(duration_building2chargestation,duration_resident2chargestation,duration_shopping2chargestation);
    [building_space_demand, resident_space_demand, shopping_space_demand] = get_all_space_demand(building_relation(:,neibour_swap_station), resident_relation(:,neibour_swap_station), shopping_relation(:,neibour_swap_station),subsidy);
    space_time_demand = space_ratio * [resident_space_demand';building_space_demand';shopping_space_demand'];
    for i = 1:size(space_time_demand,1)
        space_time_demand(i,:) = space_time_demand(i,:)*swap_time_dist_update(i);
    end
    subsidy_cost = sum(space_time_demand(time*10-9:time*10,:))*subsidy;
    server_ability = 4;
    line_cost = 0;
    for t = time*10-9:time*10;
        for j = 1:size(neibour_swap_station,2)
            for k = t:1430
                index = neibour_swap_station(j);
                serve_start = min(space_time_demand(t,j),server_ability-swap_server_continue(k,index));
                swap_server_line(t,index,k-t+1) = serve_start;
                swap_server_continue(k:k+9,index) = swap_server_continue(k:k+9,index)+serve_start;
                space_time_demand(t,j) = space_time_demand(t,j) - serve_start;
                line_cost = line_cost + serve_start*0.0045*(k-t)^2;
                if space_time_demand(t,j) == 0
                    break;
                end
            end
        end
    end
end
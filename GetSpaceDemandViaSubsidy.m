clc;
clear;
load('duration.mat');
load('time_swap_dist.mat');
load('space_ratio.mat');
load('neibour_swap_stations.mat');
load('swap_info.mat');
[building_relation, resident_relation, shopping_relation] = get_all_relation(duration_building2chargestation,duration_resident2chargestation,duration_shopping2chargestation);
subsidy = zeros(89,1);
[building_space_demand, resident_space_demand, shopping_space_demand] = get_all_space_demand(building_relation, resident_relation, shopping_relation,subsidy);
space_time_demand_update = space_ratio * [resident_space_demand';building_space_demand';shopping_space_demand'];
for i = 1:size(space_time_demand_update,1)
    space_time_demand_update(i,:) = space_time_demand_update(i,:)*swap_time_dist_update(i);
end
swap_server_continue_update = zeros(size(space_time_demand_update));
swap_server_line_update = zeros(size(space_time_demand_update,1),size(space_time_demand_update,2),100);
server_ability = 4;
for t = 1:1440;
    for j = 1:size(space_time_demand_update,2)
        for k = t:1430
            serve_start = min(space_time_demand_update(t,j),server_ability-swap_server_continue_update(k,j));
            swap_server_line_update(t,j,k-t+1) = serve_start;
            swap_server_continue_update(k:k+9,j) = swap_server_continue_update(k:k+9,j)+serve_start;
            space_time_demand_update(t,j) = space_time_demand_update(t,j) - serve_start;
            if space_time_demand_update(t,j) == 0
                break;
            end
        end
    end
end
space_time_demand_origin = space_time_demand_update;
swap_server_line_origin = swap_server_line_update;
swap_server_continue_origin = swap_server_continue_update;
% space_time_demand_update((850:1100),neibour_swap_stations{1}) = space_time_demand(neibour_swap_stations{1},(850:1100));
swap_server_line_update((850:1100),neibour_swap_stations{1},1:100) = swap_server_line((850:1100),neibour_swap_stations{1},1:100);
swap_server_continue_update((850:1100),neibour_swap_stations{1}) = swap_server_continue_update((850:1100),neibour_swap_stations{1});
swap_server_line_sum_origin = reshape(sum(sum(swap_server_line_origin(:,:,1:100))),100,1);
swap_server_line_sum_update = reshape(sum(sum(swap_server_line_update(:,:,1:100))),100,1);
plot(swap_server_line_sum_update);
function [ total_cost ] = optimize_space_demand( subsidy )
% OPTIMIZE_SWAP_DEMAND cmaes算法优化空间分布的函数入口
% 排队成本为线性 cost = 0.09*line_time
% swap_server_continue(i,j) i时刻j换电站进行换电服务的车辆数
% swap_server_line(i,j,k) i时刻j换电站前往换电站时需要排k分钟队的车辆数
% swap_line_count(i,j) i时刻j换电站正在排队的车辆数
load('initial_args.mat');
load('duration.mat');
load('time_swap_dist.mat');
load('space_ratio.mat');
load('swap_info.mat');
[building_relation, resident_relation, shopping_relation] = get_all_relation(duration_building2chargestation,duration_resident2chargestation,duration_shopping2chargestation);
[building_space_demand, resident_space_demand, shopping_space_demand] = get_all_space_demand(building_relation(:,neibour_swap_station), resident_relation(:,neibour_swap_station), shopping_relation(:,neibour_swap_station),subsidy);
space_time_demand = space_ratio * [resident_space_demand';building_space_demand';shopping_space_demand'];
for i = 1:size(space_time_demand,1)
    space_time_demand(i,:) = space_time_demand(i,:)*swap_time_dist_update(i);
end
subsidy_cost = sum(space_time_demand(time:time+9,:))*subsidy;
% swap_server_continue = zeros(size(space_time_demand));    %某时刻正在进行换电服务的车辆
% swap_server_line = zeros(size(space_time_demand,1),size(space_time_demand,2),240);    %%某时刻排队等待换电服务的车辆
server_ability = 4;
line_cost = 0;
for t = time:time+9;
    for j = 1:size(neibour_swap_station,2)
        for k = t:1430
            index = neibour_swap_station(j);
            serve_start = min(space_time_demand(t,j),server_ability-swap_server_continue(k,index));
            swap_server_line(t,index,k-t+1) = serve_start;
            if swap_server_line(t,index,k-t+1) < 0
                1
            end
            swap_server_continue(k:k+9,index) = swap_server_continue(k:k+9,index)+serve_start;
            if swap_server_continue(k:k+9,index) > server_ability
                1
            end
            space_time_demand(t,j) = space_time_demand(t,j) - serve_start;
            line_cost = line_cost + serve_start*0.0045*(k-t)^2;
            if space_time_demand(t,j) == 0
                break;
            end
        end
    end
end
total_cost = subsidy_cost+line_cost;
% plot(reshape(sum(sum(swap_server_line(time:time+9,:,:))),240,1));
% save('swap_info','swap_server_continue','swap_server_line','swap_line_count');
end
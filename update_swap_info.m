function [ ] = update_swap_info( subsidy )
%UPDATE_SWAP_INFO 通过最优解更新swap_server_continue和swap_server_line
%   此处显示详细说明
% 排队成本为线性 cost = 0.09*line_time
% swap_server_continue(i,j) i时刻j换电站进行换电服务的车辆数
% swap_server_line(i,j,k) i时刻j换电站前往换电站时需要排k分钟队的车辆数
% swap_line_count(i,j) i时刻j换电站正在排队的车辆数
load('initial_args.mat');
load('relation.mat');
load('time_swap_dist.mat');
load('space_ratio.mat');
load('swap_info.mat');
% t3 = clock;
subsidy_all_stations = zeros(89,1);
subsidy_all_stations(neibour_swap_station) = subsidy;
[building_space_demand, resident_space_demand, shopping_space_demand] = get_all_space_demand(building_relation, resident_relation, shopping_relation,subsidy_all_stations);
space_time_demand_ratio = space_ratio(time:time+9,:) * [resident_space_demand';building_space_demand';shopping_space_demand'];
space_time_demand = space_time_demand_ratio.*repmat(swap_time_dist_update(time:time+9),1,size(space_time_demand_ratio,2));
subsidy_cost = sum(space_time_demand)*subsidy_all_stations;
server_ability = 4;
line_cost = 0;
% t1 = clock;
for t = time:time+9;
    for j = 1:size(neibour_swap_station,2)
        for k = t:1440
            index = neibour_swap_station(j);
            serve_start = min(space_time_demand(t-time+1,index),server_ability-swap_server_continue(k,index));
            swap_server_line(t,index,k-t+1) = serve_start;
            swap_server_continue(k:k+9,index) = swap_server_continue(k:k+9,index)+serve_start;
            space_time_demand(t-time+1,index) = space_time_demand(t-time+1,index) - serve_start;
            line_cost = line_cost + serve_start*0.0045*(k-t)^2;
            if space_time_demand(t-time+1,index) == 0
                break;
            end
        end
    end
end
% t2 = clock;
total_cost = subsidy_cost+line_cost;
% plot(reshape(sum(sum(swap_server_line(time:time+9,neibour_swap_station,:))),60,1));
% save('swap_info','swap_server_continue','swap_server_line','swap_line_count');
save('swap_info','swap_server_continue','swap_server_line');
end


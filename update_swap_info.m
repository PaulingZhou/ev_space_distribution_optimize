function [ ] = update_swap_info( subsidy )
%UPDATE_SWAP_INFO ͨ�����Ž����swap_server_continue��swap_server_line
%   �˴���ʾ��ϸ˵��
% �Ŷӳɱ�Ϊ���� cost = 0.09*line_time
% swap_server_continue(i,j) iʱ��j����վ���л������ĳ�����
% swap_server_line(i,j,k) iʱ��j����վǰ������վʱ��Ҫ��k���Ӷӵĳ�����
% swap_line_count(i,j) iʱ��j����վ�����Ŷӵĳ�����
load('initial_args.mat');
load('duration.mat');
load('time_swap_dist.mat');
load('space_ratio.mat');
load('swap_info.mat');
% if sum(subsidy)
%     1
% end
subsidy = zeros(5,1);
[building_relation, resident_relation, shopping_relation] = get_all_relation(duration_building2chargestation,duration_resident2chargestation,duration_shopping2chargestation);
[building_space_demand, resident_space_demand, shopping_space_demand] = get_all_space_demand(building_relation(:,neibour_swap_station), resident_relation(:,neibour_swap_station), shopping_relation(:,neibour_swap_station),subsidy);
space_time_demand = space_ratio * [resident_space_demand';building_space_demand';shopping_space_demand'];
for i = 1:size(space_time_demand,1)
    space_time_demand(i,:) = space_time_demand(i,:)*swap_time_dist_update(i);
end
subsidy_cost = sum(space_time_demand(time:time+9,:))*subsidy;
% swap_server_continue = zeros(size(space_time_demand));    %ĳʱ�����ڽ��л������ĳ���
% swap_server_line = zeros(size(space_time_demand,1),size(space_time_demand,2),240);    %%ĳʱ���Ŷӵȴ��������ĳ���
server_ability = 4;
line_cost = 0;
for t = time:time+9;
    for j = 1:size(neibour_swap_station,2)
        for k = t:1430
            index = neibour_swap_station(j);
            serve_start = min(space_time_demand(t,j),server_ability-swap_server_continue(k,index));
            swap_server_line(t,index,k-t+1) = serve_start;
            swap_server_continue(k:k+9,index) = swap_server_continue(k:k+9,index)+serve_start;
            space_time_demand(t,j) = space_time_demand(t,j) - serve_start;
            line_cost = line_cost + serve_start*0.0045*(k-t+1)^2;
            if space_time_demand(t,j) == 0
                break;
            end
        end
    end
end
total_cost = subsidy_cost+line_cost;
save('swap_info','swap_server_continue','swap_server_line');
end


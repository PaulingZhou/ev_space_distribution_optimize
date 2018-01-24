function [ space_demand_summary ] = get_space_demand( space_demand, demand_ratio )
%get_space_demand 空间分布
%   duration vector[n*89] 每一行表示特定点至89个充电站的行车时间
for i = 1:size(space_demand,1)
    space_demand(i,:) = space_demand(i,:).*demand_ratio';
    if sum(space_demand(i,:))
        space_demand(i,:) = space_demand(i,:)/sum(space_demand(i,:));
    end
end
space_demand_summary = sum(space_demand)';
space_demand_summary = space_demand_summary/sum(space_demand_summary);
end


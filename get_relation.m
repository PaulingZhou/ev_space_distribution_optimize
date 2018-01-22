function [ relation ] = get_relation( duration )
%GET_RELATION 获得每个需求点所能联系的换电站
%   duration 每个换电站到每个需求点的行车距离
demand_size = size(duration,1);
relation = cell(demand_size,1);
for i = 1:demand_size
    duration_demand_point = duration(i,:);
    relation{i} = find(duration_demand_point<=600);
end

end


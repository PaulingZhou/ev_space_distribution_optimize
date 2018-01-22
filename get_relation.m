function [ relation ] = get_relation( duration )
%GET_RELATION ���ÿ�������������ϵ�Ļ���վ
%   duration ÿ������վ��ÿ���������г�����
demand_size = size(duration,1);
relation = cell(demand_size,1);
for i = 1:demand_size
    duration_demand_point = duration(i,:);
    relation{i} = find(duration_demand_point<=600);
end

end


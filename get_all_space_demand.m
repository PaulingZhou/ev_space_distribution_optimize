function [ building_space_demand, resident_space_demand, shopping_space_demand ] = get_all_space_demand( building_relation, resident_relation, shopping_relation )
%GET_ALL_SPACE_DEMAND ���ס����������������ҵ���Ի���վ������ģ��
building_space_demand = get_space_demand(building_relation);
resident_space_demand = get_space_demand(resident_relation);
shopping_space_demand = get_space_demand(shopping_relation);

end


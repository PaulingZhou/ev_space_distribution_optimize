function [building_relation, resident_relation, shopping_relation] = get_all_relation( duration_building2chargestation,duration_resident2chargestation,duration_shopping2chargestation )
%GET_ALL_RELATION ���ס����������������ҵ���Ի���վ��������Ӧ��ϵ����ÿ����������ǰ����Щ����վ����
building_relation = double(duration_building2chargestation<=300);
resident_relation = double(duration_resident2chargestation<=300);
shopping_relation = double(duration_shopping2chargestation<=300);
end


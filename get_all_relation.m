function [building_relation, resident_relation, shopping_relation] = get_all_relation( duration_building2chargestation,duration_resident2chargestation,duration_shopping2chargestation )
%GET_ALL_RELATION 获得住宿区，工作区和商业区对换电站的需求响应关系，即每个需求点可以前往哪些换电站换电
building_relation = double(duration_building2chargestation<=300);
resident_relation = double(duration_resident2chargestation<=300);
shopping_relation = double(duration_shopping2chargestation<=300);
end


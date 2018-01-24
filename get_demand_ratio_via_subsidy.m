function [ demand_ratio ] = get_demand_ratio_via_subsidy( subsidy )
%GET_DEMAND_RATIO_VIA_PRICE 通过补贴价格获得换电需求的比例关系
price_average = 1.8-mean(subsidy);
x = (1.8-subsidy)/price_average;
demand_ratio = (0.931945*(1.000000-x).^0.450242+1.000000).*(x<1)...
                +1*(x==1)...
                +(-0.949984*(x-1.000000).^0.553679+1.000000).*(x>1);
demand_ratio = demand_ratio.*(demand_ratio>0)+eps;
end
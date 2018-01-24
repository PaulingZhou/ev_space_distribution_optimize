function [ line_time_dist ] = get_line_time_dist( space_time_demand,swap_server_line,swap_server_start )
%GET_LINE_TIME_DIST 获得电动汽车排队时长的分布
%TODO 无法计算 下次再做
line_length = zeros(180,1);
for i = 11:size(space_time_demand,1)
    total_residue = space_time_demand(i,:)+swap_server_line(i-1,:);
    k = 1;
    while 1
        for j = 1:size(total_residue,2)
            total_residue(j) = total_residue(j)-swap_server_start(i-11+k,j);
            if total_residue(j) < 0
                line_length(k) = line_length(k)+total_residue(j)+swap_server_start(i-11+k,j);
                k=1;
            break;
            end
            if total_residue(j) < space_time_demand(i,j)
                if total_residue(j)+swap_server_start(i-11+k,j) >= space_time_demand(i,j)
                    line_length(k) = line_length(k)+space_time_demand(i,j)-total_residue(j);
                else
                    line_length(k) = line_length(k)+swap_server_start(i-11+k,j);
                end
            end
        end 
        k = k+1;
    end
end

end


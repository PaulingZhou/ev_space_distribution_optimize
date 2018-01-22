%获得一天内住宿区，工作区，商业区的人口比例
space_ratio = zeros(1440,3);
%住宿区
space_ratio(1:240,1) = 0.8;
space_ratio(241:480,1) = 0.8:-0.002917:0.1;
space_ratio(481:840,1) = 0.1;
space_ratio(841:1080,1)=0.1:0.000834:0.3;
space_ratio(1081:1260,1) = 0.3:0.00278:0.8;
space_ratio(1261:1440,1) = 0.8;
%工作区
space_ratio(1:240,2) = 0.2;
space_ratio(241:480,2) = 0.2:0.002084:0.7;
space_ratio(481:840,2) = 0.7;
space_ratio(841:1080,2)=0.7:-0.002084:0.2;
space_ratio(1081:1260,2) = 0.2;
space_ratio(1261:1440,2) = 0.2;
%商业区
space_ratio(1:240,3) = 0;
space_ratio(241:480,3) = 0:0.0004167:0.1;
space_ratio(481:840,3) = 0.1;
space_ratio(841:1080,3)=0.1:0.001667:0.5;
space_ratio(1081:1260,3) = 0.5:-0.002778:0;
space_ratio(1261:1440,3) = 0;
plot(space_ratio)
grid on;

UNIT_AREA = 6.71/10000; 
NORM_F = 3300;

cshear1_alldata = importdata('cshear1.txt');
cshear1_data = cshear1_alldata.data;
cshear1_ele = [];

for i=1:4:size(cshear1_data)
    cshear1_ele = [cshear1_ele; sum(cshear1_data(i:i+3))];
end
sum(cshear1_ele, 1)
fric_f = sum(cshear1_ele, 1) * size(cshear1_ele, 1) * UNIT_AREA;
fric_factor = fric_f / NORM_F;


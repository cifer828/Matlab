clear;
% NORM_F = 3300;
alldata = importdata('cpress-0109-3.6.txt');
data = alldata.data(:,3);
node_data = data([1:4:size(data, 1)],:);
mat_data = reshape(node_data, 6, 8);
x = 1:8;
y = 1:6;
[X, Y] = meshgrid(x,y);
mesh(x,y,mat_data);
figure
surf(x,y,mat_data);
area
% fric_f = sum(cshear1_data);
% fric_factor = fric_f / NORM_F / 4
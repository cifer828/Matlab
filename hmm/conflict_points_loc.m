% ³åÍ»µã·Ö²¼ heatmap
data_name = '1111_4_2_clean_tracked_30.mat';
load(data_name);
tform = maketform('projective',[299 754; 936 849; 1248 615; 882 194], [136 168; 282 419; 462 454;567 169]);
part_name = regexp(data_name, '_clean', 'split');
part_name = part_name{1, 1};
pic_name = ['D:\data\', part_name, '\',  part_name, '_bg.jpg'];
I = imread(pic_name);
udata = [0 1920];  vdata = [0 1080];
[B,xdata,ydata] = imtransform(I, tform, 'bicubic', ...
                              'udata', udata,...
                              'vdata', vdata,...
                              'size', size(I),...
                              'fill', 128);
% load('sorted_data.mat');
load('conflicts.mat');
imshow(B,'XData',xdata,'YData',ydata);
hold on

% draw_one_traj(sorted_data(25, :), tform);
% draw_one_traj(sorted_data(21, :), tform);
% [X,Y]=meshgrid(-3:1:75,4:1:45);
axis on;
Z = zeros(79,60);
conflicts2 = [round(conflicts(:,1:2)/10), conflicts(:,3)];
% for i=1:size(conflicts2, 1)
%     Z(conflicts2(i,2)-4, conflicts2(i,1)+4) = Z(conflicts2(i,2)-4, conflicts2(i,1)+4) + sqrt(1/conflicts2(i,3));
% end
for i=1:size(Z, 1)
    for j=1:size(Z, 2)
        Z(i,j) = kernel_density([i-4,j-4], conflicts2);
    end
end
imagesc([-30,750],[-30,560],Z', 'AlphaData', 0.5);
scatter(conflicts(:,1), conflicts(:,2), 20, 'r', 'filled');
colorbar
function [data,tform] = disp_routes(filename)
load(filename);
% data_cell = data_cell([5 112 286], :);
part_name = regexp(filename, '_clean', 'split');
part_name = part_name{1, 1};
pic_name = ['D:\data\', part_name, '\',  part_name, '_bg.jpg'];
% pic_name =['D:\data\0438\', part_name, '_bg.jpg']; % 0438
I = imread(pic_name);
% veh_fg =rgb2gray(imread( ['data\', part_name, '_veh.jpg']));
% bike_fg = rgb2gray(imread(['data\', part_name, '_bik.jpg']));
% ped_fg = rgb2gray(imread(['data\', part_name, '_ped.jpg']));

% 透视变换
udata = [0 1920];  vdata = [0 1080];
% tform = maketform('projective',[817 1009; 928 1012; 957 162; 918 162], [0 0; 75 0; 75 -1800;0 -1800]);  % ZX
% tform = maketform('projective',[299 754; 936 849; 1248 615; 882 194], [136 168; 282 419; 462 454;567 169]);
tform = maketform('projective',[936 1015; 1391 1021; 1123 166; 1005 167], [0 0; 280 0; 280 2550;0 2550]);  % 1221
[B,xdata,ydata] = imtransform(I, tform, 'bicubic', ...
                              'udata', udata,...
                              'vdata', vdata,...
                              'size', size(I),...
                              'fill', 128);
% imshow(B,'XData',xdata,'YData',ydata);
imshow(I);
hold on
% axis on
% data_cell(1:20,:) = [];

% 平滑、速度、分类
if size(data_cell,2) > 0
    data_cell{1,7} = 0;
    for idx = 1:size(data_cell, 1)
%         data_cell(idx, :) = add_prop(data_cell(idx, :), tform, veh_fg, bike_fg, ped_fg);
%         data_cell(idx, :) = add_prop(data_cell(idx, :), tform, 0, 0, 0);    % ZX
        data_cell(idx, :) = add_prop(data_cell(idx, :), tform, 0, 0, 0);    % 0438
    end
    save(filename,'data_cell');
end

for i = 1: size(data_cell, 1)
    if size(data_cell{i, 1}, 1) < 24
        continue
    end
%     imshow(I);
%     imshow(B,'XData',xdata,'YData',ydata);
%     hold on
%     subplot(2,3,i)
    draw_one_traj(data_cell(i, :), tform);
%     plot(data_cell{i, 2}(1:end-1), smooth(data_cell{i, 6}, 60, 'lowess'), 'color', 'b');
%     pause;
%     hold off
%     for j = i + 1: length(data_cell)
%         if data_cell{i, 4} < 100 && data_cell{j, 4} < 100
%             continue
%         end
%         flag = hasconflict(data_cell(i, :), data_cell(j, :), 100, color);
%         if flag == -1
%             break
%         elseif flag == 1
%             draw_one_traj(data_cell(i, :), tform, color);
%             draw_one_traj(data_cell(j, :), tform, color);
%             pause;
%         end
%     end
% vel(1,:) = [];
end

% ZX ramp
% plot(data_cell{5, 2}(1:end-1), smooth(data_cell{5, 6}, 30, 'lowess'), 'color', 'b');

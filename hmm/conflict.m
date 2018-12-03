% ³åÍ»Ö÷³ÌÐò
function conflicts= conflict(data_name)
load(data_name);
num = size(data_cell, 1);

% ¹ì¼£µ×Í¼
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

% °´ÆðÊ¼Ö¡ÅÅÐò
init_time = zeros(num, 1);
for i = 1: num
    init_time(i, 1) = data_cell{i, 2}(1);
end
[~, I] = sort(init_time);
sorted_data = data_cell(I, :);
save('sorted_data', 'sorted_data');
conflicts = [];
for i= 1: num
    for j = i + 1: size(data_cell, 1)
        [flag,conflict_point,ttc] = hasconflict2(sorted_data(i,:), sorted_data(j,:));
        if flag == 1
            conflicts = [conflicts; conflict_point ttc];
            fprintf('obj1-%d\tobj2-%d\n', i, j);
            hold off
            subplot(1,2,2)
            imshow(B,'XData',xdata,'YData',ydata);
            hold on
            plot(conflicts(1), conflicts(2), 'yo');
            draw_one_traj(sorted_data(i, :), tform);
            draw_one_traj(sorted_data(j, :), tform);
            pause;
        elseif flag == -1
            break
        end
    end
end


% hasconflict2(sorted_data(1,:), sorted_data(12,:));
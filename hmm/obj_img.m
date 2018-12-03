function obj_img(filename)
load(filename);
part_name = regexp(filename, '_clean', 'split');
part_name = part_name{1, 1};
for i=1:size(data_cell, 1)
    if i== 100
        continue
    end
    num = data_cell{i, 3};
    img_name = ['D:\data\', part_name, '\img\', num2str(num), '.jpg'];
    I = imread(img_name);
    imshow(I);
    text(1,1,num2str(i));
    text(100,1,num2str(data_cell{i, 7}));
    pause;
end
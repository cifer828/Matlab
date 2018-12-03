% 生成随机测试集，距离小于test_radius标签为0
range = 10;
test_radius = 5;
RAND_POINTS = 100;
test_trainSet = [];
centerList=[];

% 生成中心点
r_list = [0,64,128,192,255];
g_list = [0,64,128,192,255];
b_list = [0,64,128,192,255];
for r=r_list
    for g=g_list
        for b=b_list
            centerList = [centerList;r,g,b];
        end
    end
end

% 围绕中心点生成随机点
for i=1:size(centerList,1)
    center = centerList(i,:);
    oneDistrict = [];
    for j=1:RAND_POINTS
        r = randi(range) + center(1) - range / 2;
        g = randi(range) + center(2) - range / 2;
        b = randi(range) + center(3) - range / 2;
        flag = 1;
        if r < 0 || g < 0 || b < 0
            continue
        elseif pdist([[r,g,b]; center]) < test_radius
            flag = 0;
        end
        oneDistrict = [oneDistrict; j, flag,  r, g, b, pdist([[r,g,b]; center]), center];
    end
    test_trainSet = [test_trainSet; oneDistrict];
end

save('test_train_set','test_trainSet')


function output = data

output = [];
column = {'vmax'; 'vmin'; 'va'; 'sigmamax'; 'sigmastd'};
radius = [15 35 60 135 270];
friction = [0.8 0.5 0.3 0.2];
direction = [1 -1];

for idx=0:1
    % 跳过无用表
    if idx == 1 || idx == 4 || idx== 10
        continue
    end
    % 读取excel数据，保存至mat
%     Untitled = xlsread('C:\Users\82109\Desktop\驾驶行为参数化与建模\转弯-大驾模\数据处理最终-山区.xlsx', num2str(i));
%     save(num2str(i), 'Untitled');
    
    % 读取mat数据
%     load(['C:\Users\82109\Desktop\zhu\', num2str(i), '.mat']);
    all_data = open(['C:\Users\82109\Desktop\zhu\', num2str(idx), '.mat']);
    all_data = all_data.Untitled;
   
    for idx_c = 1: length(column)
        for idx_r = 1: length(radius)
            for idx_f = 1: length(friction)
                for idx_d = 1: length(direction)
                    [value, station] = mountain(all_data, radius(idx_r), friction(idx_f), direction(idx_d), column{idx_c});
                    output = [output; value];
                    fprintf('radius = %d, friction = %f, direction = %d, %s = %f \n', radius(idx_r), friction(idx_f), direction(idx_d), column{idx_c}, value)
                end
            end
        end
    end
end
output = reshape(output, length(radius) * length(friction) * length(direction), length(column));



load('wcs\0438_main_clean_tracked.mat');
% load('wcs\0438_ramp_clean_tracked.mat');
num = size(data_cell, 1);
init_time = zeros(num, 1);
for i = 1: num
    init_time(i, 1) = data_cell{i, 2}(1);
end
[~, I] = sort(init_time);
sorted_data = data_cell(I, :);
% 去除异常速度，3倍标准差
for i=1:num
    speed = sorted_data{i, 6};
    time = sorted_data{i, 2};
    mean_s = mean(speed);
    std_s = std(speed);
    remain_idx = find(speed<(mean_s+std_s*3) & speed>(mean_s-std_s*3));
    start_cut = size(time, 1) / 6;
    sorted_data{i,6}=smooth(speed(remain_idx), 30, 'lowess');
    sorted_data{i,6} = sorted_data{i,6}(start_cut:end);
    sorted_data{i,2}=time(remain_idx);
    sorted_data{i,2} = sorted_data{i,2}(start_cut:end);
    hdwys = [];
    for j = 1:size(time, 1) % 每帧
        min_hdwy = inf;
        frame = time(j);
        for k = 1: num    % 其他车
            frame_other = sorted_data{k,2};
            if frame < frame_other(1) 
                break
            elseif frame > frame_other(end) || k==i
                continue
            end
            idx_diff = (frame - frame_other(1)) / 2 + 1;
            pos1 = sorted_data{i,5}(k, :);
            pos2 = sorted_data{k,5}(idx_diff, :);
            if pos2(2) < pos1(2)    % 其他车位于目标车前,y坐标更小
                hdwy = sum((pos1 - pos2) .^ 2, 2) .^ 0.5 / speed(k);
                min_hdwy = min([hdwy min_hdwy]);
            end
        end
        if min_hdwy > 20
            min_hdwy = inf;
        end
        hdwys = [hdwys;min_hdwy];
    end
    hdwys = hdwys(remain_idx);
    hdwys = hdwys(start_cut:end);
    sorted_data{i, 8} = hdwys;
    subplot(2,1,1)
    plot(sorted_data{i,2}, sorted_data{i,8});
    ylabel('车头时距(s)');
    subplot(2,1,2)
    plot(sorted_data{i,2}, sorted_data{i,6});
    ylabel('车速(m/s)')
    xlabel('帧')
    pause;
end
% save('wcs/ramp', 'sorted_data');
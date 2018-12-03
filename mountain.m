function [value, station] = mountain(all_data, radius, friction, direction, column)

station = 0;
if any(all_data(:,3)==radius * direction & all_data(:,14) == friction)
    switch column
        case 'vmax'
            sift_data = all_data((all_data(:,3) == radius * direction) & (all_data(:,14) == friction), [1 7]);
            [value, idx] = max(sift_data(:,2));
            station = sift_data(idx, 1);
        case 'vmin'
            sift_data = all_data((all_data(:,3) == radius * direction) & (all_data(:,14) == friction), [1 7]);
            [value, idx] = min(sift_data(:,2));
            station = sift_data(idx, 1);
        case 'va'
            sift_data = all_data((all_data(:,3) == radius * direction) & (all_data(:,14) == friction), [1 7]);
            value = mean(sift_data(:,2));
        case 'sigmamax'
            sift_data = all_data((all_data(:,3) == radius * direction) & (all_data(:,14) == friction), [1 4]);
            [value, idx] = max(sift_data(:,2));
            value = value + 1.5;
            station = sift_data(idx, 1);
        case 'sigmastd'
            sift_data = all_data((all_data(:,3) == radius * direction) & (all_data(:,14) == friction), [1 4]);
            value = std(sift_data(:,2));
    end
else
    value = 0;
end


 
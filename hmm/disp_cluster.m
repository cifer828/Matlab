function disp_cluster(filename)
train_all_hmms(filename);
cluster_result = cluster(filename);
load('cluster_result.mat')
filename2 = strrep(filename, 'direction_data', 'clean_tracked');
load(filename2);
colors = ['b', 'g', 'r', 'c', 'm', 'y'];
for i = 1: length(data_cell)
    x = data_cell{i}(1,:);
    y = data_cell{i}(2,:);
    plot(x, y, colors(cluster_result(i)))
    hold on;
end
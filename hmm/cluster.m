function cluster_result  = cluster(filename)

load(filename)
load('all_hmms.mat');
total_hmms = length(all_hmms);
cluster_result = zeros(total_hmms, 1);
idx = 1;
ki = 50;
max_iter_num = 5;  % 聚类数不变时最大循环次数
n_min = 3; % 聚类包含最小轨迹数
shuffle = randperm(total_hmms);
hmms = all_hmms(shuffle(1:ki), :);
while idx < max_iter_num
    fprintf('*************cluster numbers： %d *************\n', size(hmms, 1))
    for i = 1: length(data_cell)
        cluster_result(i) = max_prob_hmm(data_cell{i, 1}, hmms);
    end
    new_hmms = {};
    for j = 1: length(hmms)
        if length(find(cluster_result == j)) < n_min
            continue
        else
            train_set = data_cell(cluster_result == j);
            [LL, prior, transmat, mu, Sigma, mixmat] =  gaussian_hmm(train_set, 3, 2);
            new_hmms(end + 1, :) = {prior, transmat, mu, Sigma, mixmat};
        end
    end
    if size(hmms, 1) == size(new_hmms ,1)
        idx = idx + 1;
    end
    hmms = new_hmms;
end
save('cluster_result.mat', 'cluster_result')
save('hmms.mat', 'hmms')
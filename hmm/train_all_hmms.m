function a = train_all_hmms(filename)
load(filename);
train_num = size(data_cell, 1);
all_hmms = {};
for i = 1:train_num
    data = data_cell(i);
    fprintf('*************Track No. %d **********\n', i)
    [LL, prior1, transmat1, mu1, Sigma1, mixmat1] =  gaussian_hmm(data, 2, 1);
    all_hmms(i, 1: 5) = {prior1, transmat1, mu1, Sigma1, mixmat1};
end
save('all_hmms','all_hmms')
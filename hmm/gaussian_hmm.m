function [LL, prior1, transmat1, mu1, Sigma1, mixmat1] = gaussian_hmm(train_set, Q, M)

O = size(train_set{1}, 1);  % Î¬¶È 
train_num = length(train_set);

data = [];
for train_len = 1: train_num
    data = [data(:, 1 : end), train_set{train_len}];
end

prior0 = normalise(rand(Q, 1));
transmat0 = mk_stochastic(rand(Q, Q));

cov_type = 'full';
[mu0, Sigma0] = mixgauss_init(Q * M, data, cov_type);
mu0 = reshape(mu0, [O Q M]);
Sigma0 = reshape(Sigma0, [O O Q M]);
mixmat0 = mk_stochastic(rand(Q, M));

[LL, prior1, transmat1, mu1, Sigma1, mixmat1] =  mhmm_em(train_set(1:train_num), prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', 100);
loglik = mhmm_logprob(data, prior1, transmat1, mu1, Sigma1, mixmat1)

end
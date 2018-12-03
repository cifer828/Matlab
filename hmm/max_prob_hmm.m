function best_hmm = max_prob_hmm(seq, hmms)

loglik = zeros(1, size(hmms, 1));
for idx = 1:size(hmms, 1)
    p = hmms(idx, :);
    loglik(idx) = mhmm_logprob(seq, p{1}, p{2}, p{3}, p{4}, p{5});
    % p(1:5) -- prior, transmat, mu, Sigma, mixmat
end
[~, best_hmm] = min(loglik);
end

function regression(type)

load('insomnia_time.mat');
X = insomnia_time{type}(:,1:5); y=insomnia_time{type}(:,6);

[X,~, ~] = featureNormalize(X);  % normalization

m=size(X,1);
X = [ones(m,1) X];

alpha = 0.01;
num_iters = 500;

% Init Theta and Run Gradient Descent 
theta = zeros(6, 1);

J_history = zeros(num_iters, 1);
for iter = 1:num_iters
    theta = theta - alpha/m*X'*(X*theta-y);
    J_history(iter) =  1/(2*m) * sum(((X*theta)-y).^2);
end

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

theta
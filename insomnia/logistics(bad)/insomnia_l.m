%% 初始化
clear ; close all; clc

%% 读取数据
% 1-5列包含性别，年龄，肤色，舌象，不适，第6列为是否失眠，1失眠，0正常
load('insomnia.mat');
X = insomnia_data{3}(:, 1:5); y = insomnia_data{3}(:, 6); % 1型人群


%% cost and gradient
% 设置截距为1
[m, n] = size(X);
X = [ones(m, 1) X];

% 初始化theta
initial_theta = zeros(n + 1, 1);

%计算cost和gradient
[cost, grad] = costFunction(initial_theta, X, y);


%% fminunc
% 设置fminunc参数
options = optimset('GradObj', 'on', 'MaxIter', 400);

[theta, cost] = fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

% 显示
fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);

%% 准确度评估
p = round(sigmoid(X*theta));
fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('\nProgram paused. Press enter to continue.\n');


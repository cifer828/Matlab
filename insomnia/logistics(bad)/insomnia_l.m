%% ��ʼ��
clear ; close all; clc

%% ��ȡ����
% 1-5�а����Ա����䣬��ɫ�����󣬲��ʣ���6��Ϊ�Ƿ�ʧ�ߣ�1ʧ�ߣ�0����
load('insomnia.mat');
X = insomnia_data{3}(:, 1:5); y = insomnia_data{3}(:, 6); % 1����Ⱥ


%% cost and gradient
% ���ýؾ�Ϊ1
[m, n] = size(X);
X = [ones(m, 1) X];

% ��ʼ��theta
initial_theta = zeros(n + 1, 1);

%����cost��gradient
[cost, grad] = costFunction(initial_theta, X, y);


%% fminunc
% ����fminunc����
options = optimset('GradObj', 'on', 'MaxIter', 400);

[theta, cost] = fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

% ��ʾ
fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);

%% ׼ȷ������
p = round(sigmoid(X*theta));
fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('\nProgram paused. Press enter to continue.\n');


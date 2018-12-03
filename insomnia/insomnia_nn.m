function insomnia_nn(type,file)
%% 初始化
close all; clc
input_layer_size  = 5;   % 输入层5
hidden_layer_size = 5;   % 中间层5
num_labels = 1;          % 输出层1

%% 读取数据
% 1-5列包含性别，年龄，肤色，舌象，不适，第6列为是否失眠，1失眠，0正常
if file == 1
    load('insomnia.mat');
    data=insomnia_data;
elseif file==2
    load('insomnia_time.mat');
    data=insomnia_time;
end
X = data{type}(:, 1:5); y = data{type}(:, 6); % 1型人群

%% 随机选取初始theta
fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% 展开parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];


% 检验gradient
fprintf('\nChecking Backpropagation... \n');
checkNNGradients(3);


%% 训练
fprintf('\nTraining Neural Network... \n')

% 调整maxiter and lambda以获得更高准确度
options = optimset('MaxIter', 1000);
lambda = 0;

% 简化cost
costFunction_nn = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);
% fmincg
[nn_params, cost] = fmincg(costFunction_nn, initial_nn_params, options);

% 获取 Theta1 和 Theta2
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

%% 结果和评价
Theta1
Theta2
cost(end)
m = size(X, 1);
h1 = sigmoid([ones(m, 1) X] * Theta1');
h2 = sigmoid([ones(m, 1) h1] * Theta2');
p = round(h2);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(p == y)) * 100);



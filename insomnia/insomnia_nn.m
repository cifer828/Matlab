function insomnia_nn(type,file)
%% ��ʼ��
close all; clc
input_layer_size  = 5;   % �����5
hidden_layer_size = 5;   % �м��5
num_labels = 1;          % �����1

%% ��ȡ����
% 1-5�а����Ա����䣬��ɫ�����󣬲��ʣ���6��Ϊ�Ƿ�ʧ�ߣ�1ʧ�ߣ�0����
if file == 1
    load('insomnia.mat');
    data=insomnia_data;
elseif file==2
    load('insomnia_time.mat');
    data=insomnia_time;
end
X = data{type}(:, 1:5); y = data{type}(:, 6); % 1����Ⱥ

%% ���ѡȡ��ʼtheta
fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% չ��parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];


% ����gradient
fprintf('\nChecking Backpropagation... \n');
checkNNGradients(3);


%% ѵ��
fprintf('\nTraining Neural Network... \n')

% ����maxiter and lambda�Ի�ø���׼ȷ��
options = optimset('MaxIter', 1000);
lambda = 0;

% ��cost
costFunction_nn = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);
% fmincg
[nn_params, cost] = fmincg(costFunction_nn, initial_nn_params, options);

% ��ȡ Theta1 �� Theta2
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

%% ���������
Theta1
Theta2
cost(end)
m = size(X, 1);
h1 = sigmoid([ones(m, 1) X] * Theta1');
h2 = sigmoid([ones(m, 1) h1] * Theta2');
p = round(h2);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(p == y)) * 100);



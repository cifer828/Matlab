function [radius,samples,error] = svmForOne(center, innerEdge, outerEdge, train_set, INTERVAL)
% svmѵ��һ�������ʶ�뾶
xdata = train_set(:,3:5);
group = train_set(:,2);
model = svmtrain(xdata,group,'kernel_function','rbf', 'rbf_sigma', 1);  % ѵ��������
predict_set = zeros((outerEdge/INTERVAL)^3, 4);
range = outerEdge - innerEdge;
i = 1;
% ���������
for r = generateEdge(center(1), outerEdge, INTERVAL);
    for g=generateEdge(center(2), outerEdge, INTERVAL)
        for b=generateEdge(center(3), outerEdge, INTERVAL)
            if abs(r-center(1)) < innerEdge && abs(g-center(2)) < innerEdge && abs(b-center(3))  < innerEdge
                continue
            end
            predict_set(i,:) = [r, g, b, pdist([[r,g,b]; center])];
            i = i+1;
        end
    end
end

 predict_set = predict_set(predict_set(:,4) ~= 0,:);
 
% ����������
group_new = svmclassify(model,xdata);
error = sum(group_new == group) / size(group, 1);    % ѵ����׼ȷ��
samples = size(group ,1);
fprintf('Train Accuracy for center [%6.1f %6.1f %6.1f] using %4d samples: %f\n', round(center,1), samples, error);
predict_label = svmclassify(model,predict_set(:,1:3));  
% predict_result = [predict_set, predict_label];
% true_set = predict_result(predict_label == 1,:);

% �����Ч����뾶
loc = sum(mod(center,255) ==0);
% loc = 3  �ǵ�
%       2  ���ϵ�
%       1  ���ϵ�
%       0  �ڲ���
volume = INTERVAL ^ 3 * size(find(predict_label == 0), 1);
volume = volume + 8 * innerEdge ^ 3 / 2 ^ loc;
radius = (3 * volume * 2 ^ loc / 4 / pi) ^ (1/3);   
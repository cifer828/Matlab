function zichu_fun()
load('zichu.mat');
% plot3(zichu(:,1), zichu(:,2), zichu(:,3), 'Color', 'r', 'LineWidth', 1);
hold on;
x = 1:1:100;
y = 1:1:50;
[X, Y] = meshgrid(x,y);    % ͨ��meshgird���þ�������
z_ = exp(-4.0404 + 0.03936 * Y - 0.02514 * X) ;
Z =  z_ ./ (1 + z_);
surf(X,Y,Z)
scatter3(zichu(:,1), zichu(:,2), zichu(:,3),'r', 'filled');
grid on;
xlabel('���о��루m��')
ylabel('���о��루m��')
zlabel('����·������')



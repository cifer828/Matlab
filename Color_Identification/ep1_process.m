%% 训练所有样本
% name = {'GY', 'ZCY','ZQC', 'ALL','GY2','ZCY2','ALL2'};
% for i=1:size(name,2)
%     fprintf('*********Training %s********* \n', name{i})
%     main(name{i})
% end

% %% 中心偏移量
% filter = radius(radius(:,4)<14, :);
% test_set = filter;
% dist_c = zeros(size(test_set,1),1);
% for i=1:size(test_set,1)
%     dist_c(i) = pdist([test_set(i,1:3); [128 128 128]]);
% end
% figure
% scatter(dist_c, test_set(:,4))
% [k, b] = polyfit(dist_c, test_set(:,4), 1);
% hold on;
% x = [1, 255];
% y = k(1) * x + k(2);
% plot(x ,y)
% set(gca,'fontSize',15);
% xlabel('中心偏移量','fontsize', 25);      
% ylabel('辨识半径','fontsize', 25);    

%% 样本点示例
% load('trainSetCell_ALL.mat')
% p128 = pointCell{1,60};
% p_true = p128(p128(:,2)==0,:);
% p_false = p128(p128(:,2)==1,:);
% scatter3(p_true(:,3),p_true(:,4),p_true(:,5),'ro');
% 
% hold on
% scatter3(p_false(:,3),p_false(:,4),p_false(:,5),'ko');
% legend('无区别点','有区别点');

% %% 立方体示例
% m=5;n=5;h=5;
% %定义数据的规模 
% Hx=1;Hy=1;Hz=1;
% H=(h-1)*m*n;
% CN=m*n*h;
% N=m*n;
% [x,y,z]=meshgrid(0:Hx:(n-1)*Hx,0:Hy:(m-1)*Hy,0:Hz:(h-1)*Hz);
% Cube=reshape(1:N*h,m,n,h);
% MN=2*m*n-m-n;
% X=zeros(CN,1);Y=X;Z=X;
% for i=1:m
%     for j=1:n
%         for k=1:h
%             X(Cube(i,j,k))=x(i,j,k);
%             Y(Cube(i,j,k))=y(i,j,k);
%             Z(Cube(i,j,k))=z(i,j,k);
%         end
%     end
% end
% linkN=0;
% Img=sqrt(-1);
% AA=zeros(H+h*MN,1);
%  for k=1:h-1
%     for j=1:n
%     for i=1:m
%         linkN=linkN+1;
%         AA(linkN)=Cube(i,j,k)+Img*Cube(i,j,k+1);
%     end
%     end
%  end
% for k=1:h
% for j=1:n-1
%     for i=1:m
%         linkN=linkN+1;
%         AA(linkN)=Cube(i,j,k)+Img*Cube(i,j+1,k);
%     end
% end
% for j=1:n
%     for i=1:m-1
%         linkN=linkN+1;
%         AA(linkN)=Cube(i,j,k)+Img*Cube(i+1,j,k);
%     end
% end
% end
% figure;
% plot3(X,Y,Z,'r.')
% %--plot bond-----
% axis equal
% P1=real(AA);P2=imag(AA);
% line([X(P1)';X(P2)'],[Y(P1)';Y(P2)'],[Z(P1)';Z(P2)'],'color','k')
% axis off

%% 分布
figure
filter = radius(radius(:,4)<14, :);
% hist(radius(:,4),14)
histfit(filter(:,4), 14)
title('辨识半径分布','fontsize', 30); 
set(gca,'fontSize',15);
xlabel('辨识半径','fontsize', 25);      
ylabel('数量','fontsize', 25);    
zlabel('radius','fontsize', 25);      
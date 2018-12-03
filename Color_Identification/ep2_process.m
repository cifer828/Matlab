%% read data
maindir = 'C:\Users\zhqch\Documents\code\MATLAB\Color_Identification\Exp2Data';
subdir  = dir(maindir);
trainSetEp2 = [];
dirs = 0;
for i = 3 : length( subdir )
    subdirpath = fullfile( maindir, subdir( i ).name );
    output = load(subdirpath);
    output = output.output_;
    final_num = output(end,1);
    final_choice = output(output(:,1)==final_num,:);
    trainSetEp2 = [trainSetEp2; final_choice];
end
trainSetEp2 = trainSetEp2(trainSetEp2(:,2)~=0,:);
save('trainSetEp2.mat','trainSetEp2')


%% 散点
best_paras = zeros(size(trainSetEp2,1), 3);
for i=1:size(trainSetEp2,1)
    choice = trainSetEp2(i,2);
    best_paras(i,:) = trainSetEp2(i, choice * 3: choice * 3 + 2)
end
scatter(best_paras(:,1), best_paras(:,2))
set(gca,'fontSize',15);
xlabel('R参数','fontsize', 25);      
ylabel('G参数','fontsize', 25);    

%% 去除异常点
row1 = best_paras(:,1) < 0;
row2 = best_paras(:,2) < 0;
row3 = best_paras(:,3) < 0;
row = row1 + row2 + row3;
filter2 = best_paras(row==0,:);

scatter(filter2 (:,1), filter2 (:,2))
set(gca,'fontSize',15);
xlabel('R参数','fontsize', 25);      
ylabel('G参数','fontsize', 25);    

%% 最短距离
d = mean(squareform(pdist(filter2)));
[~,i] = min(d);
center = filter2(i,:);
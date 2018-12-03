%% 年龄统计
alldata = xlsread('失眠人群数据.xlsx');
agedata = alldata(2:end,3); % 获取年龄
minage=min(agedata);maxage=max(agedata);
numage = zeros(1,7);
for i=1:7
    numage(i)=sum(agedata>10*i&agedata<=10*(i+1));
end
pie(numage);
legend('10-20','20-30','30-40','40-50','50-60','60-70','70-80',0);
colormap([
    1,0,0 
    0.5,0,0
    1,0,1
    0,1,0 
    0,1,1
    0,0,1
    1,0.5,0.5
])

%% 失眠类型
[data,textdata,alldata]=xlsread('失眠人群数据.xlsx','E2:E221');
textdata(cellfun(@isempty,textdata))=[];
data(isnan(data))=[];
data(:,2)=1;
for i=1:n
    if strcmp(textdata(i),'空')
        continue
    end
    add = regexp(textdata(i), ',', 'split');
    add = add{1};
    for j = 1:size(add,2)
        data = [data; str2num(add{j}),1/size(add,2)];
    end
end
reason = zeros(1,5);
for i=1:5
    [row,col]=find(data(:,1)==i);
    reason(i)=sum(data(row,2));
end
xlswrite('失眠人群数据.xlsx', reason, 'C236:G236'); 

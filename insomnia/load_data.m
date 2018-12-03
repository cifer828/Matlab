function m=load_data(filename, range, type)
[~, ~, data] = xlsread(filename,range); 
if type == 1
    alldata = [data(:,1:2), data(:,8:10)]; % 获取性别，年龄，肤色，舌象，不适
elseif type == 2
    alldata = [data(:,1:6)]; % 获取性别，年龄，失眠原因，失眠类型，失眠时长, 失眠时段
    % 提取失眠时段的起点
    ly = length(alldata(:,6));
    for i=1:ly
        str = regexp(alldata{i,6}, '^[0-9]*','match') ;
        if isempty(str)
            alldata(i,6) = {'空'};
        else
            alldata(i,6) = {str2num(str{1})};
        end
    end
end
alldata(find(strcmp(alldata,'男')),1)={1}; alldata(find(strcmp(alldata,'女')),1)={0};
[nrow,~] = find(strcmp(alldata,'空')); % 删除某项内容为‘空’的样本
alldata(nrow,:) = []; 
[row_x,col_x]=size(alldata);
del_row = [];
% save('alldata.mat','alldata')
% 将一个样本的多种选择拓展为多个样本
i=1;
while i<=row_x
    for j = 1:col_x
        if ischar(alldata{i,j}) 
            if alldata{i,j}==44  %判定字符串‘44‘和’，’会出现不明原因的错误
                continue
            end
            del_row = [del_row i];
            if isempty(strfind(alldata{i,j},',')) % 跳过没有','的条目
                continue
            end
            add_patient = regexp(alldata(i,j), ',', 'split');  % 按‘，’分割
            add_patient = add_patient{1};
            for k=1:size(add_patient,2)
                if ~isnan(str2double(add_patient{1,k})) % 排除非数字内容
                    % 在样本集尾部添加新生成的样本
                    row_x = row_x + 1;
                    alldata(row_x,1:col_x)=alldata(i,1:col_x);
                    alldata(row_x,j)={str2double(add_patient(k))};
                end
            end
            break
        end
    end
    i=i+1;
end
alldata(del_row,:)=[];
m=cell2mat(alldata);
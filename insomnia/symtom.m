function symtom(flag)
if flag == 1
    filename = '失眠人群数据.xlsx';
    r = 'A1:L221';
    wline = 265;
else
    filename = '正常人群数据.xlsx';
    r = 'A1:L163';
    wline = 267;
end
    [~,~,alldata]=xlsread(filename,r);
    alldata = [alldata(:,1), alldata(:,12)];
    idx = {[],[],[],[]};

for i=1:size(alldata,1)
    for j = 1:4
        if ~isempty(regexp(alldata{i,1},num2str(j),'match'))
            idx{j} = [idx{j},i];
        end
    end
end

data = {[], [], [], []};
for i=1:4
    temp = alldata(idx{i},2);
    for j = 1:length(temp)
        if isnumeric(temp{j})
            data{i} = [data{i};temp{j},1];
        else
            add = regexp(temp{j},',','split');
            del = [];
            for k = 1:length(add)
                if isempty(regexp(add{k},'[0-9]','match'))
                    del = [del,k];
                end
            end
            add(del) = [];
            %             add
            if ~isempty(add)
                for h = 1:length(add)
                    data{i} = [data{i};str2num(add{h}),1/length(add)];
                end
            end
        end
    end
end

for i = 1:4
    result = [];
    for j = 1:21
        [row, ~] = find(data{i}(:,1)==j);
        result(j) = sum(data{i}(row,2));
    end
    xlswrite( '失眠人群数据.xlsx',result,['C',num2str(wline),':W',num2str(wline)]);
    wline = wline + 4;
end


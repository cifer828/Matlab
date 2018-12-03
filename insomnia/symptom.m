function symptom()
flag = 1;
if flag == 1
    file = '失眠人群数据.xlsx';
    r = 'L1:L221';
else
    file = '正常人群数据.xlsx';
    r = 'L1:L163';
end
[data,textdata,~]=xlsread(file,r);

alldata = {};
if flag == 1
    alldata{1,1} = [data(2:103);data(211:219)];
    alldata(1,2) = textdata(2:103) + data(211:219);
    alldata(2,1) = [data(104:138) ;data(211:214); data(220:221)];
    alldata(2,2) = textdata(104:138) + textdata(211:214) + textdata(220:221);
    alldata(3,1) = [data(139:169);data(215)];
    alldata(3,2) = textdata(139:169) + textdata(215);
    alldata(4,1) = [data(170:210) ; data(216:221)];
    alldata(4,2) = textdata(170:210) + textdata(216:221);
    writeline = 265;
    
else
    alldata(1,1) = [data(2:97) ; data(145:159)];
    alldata(1,2) = textdata(2:97) + data(145:159);
    alldata(2,1) = [data(98:105) ; data(145:146) ; data(160:162)];
    alldata(2,2) = textdata(98:105) + textdata(145:146) + textdata(160:162);
    alldata(3,1) = [data(106:128) ; data(147:155) ; data(163)];
    alldata(3,2) = textdata(106:128) + textdata(147:155) + textdata(163);
    alldata(4,1) = [data(129:144) ; data(156:163)];
    alldata(4,2) = textdata(129:144) + textdata(156:163);
    writeline = 267;
end

for i = 1:4
    ndata = alldata(i,1)
    tdata = alldata(i,2)
    tdata(cellfun(@isempty,tdata))=[]; % 删除cell中的空行
    ndata(isnan(datap))=[];  % 删除矩阵中的nan
    ndata(:,2)=1;
    n = size(tdata,1);
    for i=1:n
        if strcmp(tdata(i),'空')
            continue  % 跳过相应内容为‘空’的样本
        end
        add = regexp(tdata(i), ',', 'split');
        add = add{1};
        for j = 1:size(add,2)
            if isempty(regexp(add{j}, '[0-9]*', 'match'))
                continue
            end
            %         textdata(i)
            ndata = [ndata; str2num(add{j}),1/size(add,2)];
        end
    end
    num = zeros(1,21);
    for i=1:21
        [row,~]=find(ndata(:,1)==i);
        num(i)=sum(ndata(row,2));
    end
    num
    xlswrite('失眠人群数据.xlsx', num, ['C',num2str(writeline),':W',num2str(writeline)]);
    writeline = writeline + 4;
end

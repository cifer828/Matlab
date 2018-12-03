function typeorreason()
flag = input('type: ');
if flag == 1 % 原因
    rrange = 'E2:E221';
    wrange = 'C237:G237';
    max = 5;
elseif flag == 2 % 类型
    rrange = 'G2:G221';
    wrange = 'C242:G242';
    max = 5;
elseif flag == 3 % 失眠人肤色
    rrange = 'J2:J221';
    wrange = 'C248:H248';
    max = 6;
elseif flag == 4 % 失眠人舌象
    rrange = 'K2:K221';
    wrange = 'C257:I257';
    max = 7;
elseif flag == 5 % 正常人肤色
    rrange = 'J2:J163';
    wrange = 'C251:H251';
    max = 6;
elseif flag == 6 % 正常人舌象
    rrange = 'K2:K163';
    wrange = 'C260:I260';
    max = 7;
elseif flag == 7 % 失眠人不适1
    rrange = 'L2:L103';
    wrange = 'C265:W265';
    max = 21;
elseif flag == 8 % 正常人不适1
    rrange = 'L2:L97';
    wrange = 'C267:W267';
    max = 21;
elseif flag == 9 % 失眠人不适2
    rrange = 'L104:L138';
    wrange = 'C269:W269';
    max = 21;
elseif flag == 10 % 正常人不适2
    rrange = 'L98:L105';
    wrange = 'C271:W271';
    max = 21;
elseif flag == 11 % 失眠人不适3
    rrange = 'L139:L169';
    wrange = 'C273:W273';
    max = 21;
elseif flag == 12 % 正常人不适3
    rrange = 'L106:L128';
    wrange = 'C267:W267';
    max = 21;
elseif flag == 13 % 失眠人不适4
    rrange = 'L170:L210';
    wrange = 'C267:W267';
    max = 21;
elseif flag == 14 % 正常人不适4
    rrange = 'L129:L144';
    wrange = 'C267:W267';
    max = 21;
else
    printf('wrong index/n原因 1，类型2，肤色3，舌象4')
end
filename = '失眠人群数据.xlsx';
if flag == 5 || flag == 6 || flag == 8
    filename = '正常人群数据.xlsx';
end
[data,textdata,alldata]=xlsread(filename,rrange);
textdata(cellfun(@isempty,textdata))=[]; % 删除cell中的空行
data(isnan(data))=[];  % 删除矩阵中的nan
data(:,2)=1;
n = size(textdata,1);
for i=1:n
    if strcmp(textdata(i),'空')
        continue  % 跳过相应内容为‘空’的样本
    end
    add = regexp(textdata(i), ',', 'split');
    add = add{1}
    for j = 1:size(add,2)
        if isempty(regexp(add{j}, '[0-9]*', 'match'))
            continue
        end
        %         textdata(i)
        data = [data; str2num(add{j}),1/size(add,2)];
    end
end
num = zeros(1,max);
for i=1:max
    if flag == 1 || flag ==2 || flag == 7 || flag ==8
        [row,~]=find(data(:,1)==i);
        num(i)=sum(data(row,2));
    else
        num(i)=sum(data(:,1)==i);
    end
end
num
xlswrite('失眠人群数据.xlsx', num, wrange);

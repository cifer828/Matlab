function typeorreason()
flag = input('type: ');
if flag == 1 % ԭ��
    rrange = 'E2:E221';
    wrange = 'C237:G237';
    max = 5;
elseif flag == 2 % ����
    rrange = 'G2:G221';
    wrange = 'C242:G242';
    max = 5;
elseif flag == 3 % ʧ���˷�ɫ
    rrange = 'J2:J221';
    wrange = 'C248:H248';
    max = 6;
elseif flag == 4 % ʧ��������
    rrange = 'K2:K221';
    wrange = 'C257:I257';
    max = 7;
elseif flag == 5 % �����˷�ɫ
    rrange = 'J2:J163';
    wrange = 'C251:H251';
    max = 6;
elseif flag == 6 % ����������
    rrange = 'K2:K163';
    wrange = 'C260:I260';
    max = 7;
elseif flag == 7 % ʧ���˲���1
    rrange = 'L2:L103';
    wrange = 'C265:W265';
    max = 21;
elseif flag == 8 % �����˲���1
    rrange = 'L2:L97';
    wrange = 'C267:W267';
    max = 21;
elseif flag == 9 % ʧ���˲���2
    rrange = 'L104:L138';
    wrange = 'C269:W269';
    max = 21;
elseif flag == 10 % �����˲���2
    rrange = 'L98:L105';
    wrange = 'C271:W271';
    max = 21;
elseif flag == 11 % ʧ���˲���3
    rrange = 'L139:L169';
    wrange = 'C273:W273';
    max = 21;
elseif flag == 12 % �����˲���3
    rrange = 'L106:L128';
    wrange = 'C267:W267';
    max = 21;
elseif flag == 13 % ʧ���˲���4
    rrange = 'L170:L210';
    wrange = 'C267:W267';
    max = 21;
elseif flag == 14 % �����˲���4
    rrange = 'L129:L144';
    wrange = 'C267:W267';
    max = 21;
else
    printf('wrong index/nԭ�� 1������2����ɫ3������4')
end
filename = 'ʧ����Ⱥ����.xlsx';
if flag == 5 || flag == 6 || flag == 8
    filename = '������Ⱥ����.xlsx';
end
[data,textdata,alldata]=xlsread(filename,rrange);
textdata(cellfun(@isempty,textdata))=[]; % ɾ��cell�еĿ���
data(isnan(data))=[];  % ɾ�������е�nan
data(:,2)=1;
n = size(textdata,1);
for i=1:n
    if strcmp(textdata(i),'��')
        continue  % ������Ӧ����Ϊ���ա�������
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
xlswrite('ʧ����Ⱥ����.xlsx', num, wrange);

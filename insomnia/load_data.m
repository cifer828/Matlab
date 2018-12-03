function m=load_data(filename, range, type)
[~, ~, data] = xlsread(filename,range); 
if type == 1
    alldata = [data(:,1:2), data(:,8:10)]; % ��ȡ�Ա����䣬��ɫ�����󣬲���
elseif type == 2
    alldata = [data(:,1:6)]; % ��ȡ�Ա����䣬ʧ��ԭ��ʧ�����ͣ�ʧ��ʱ��, ʧ��ʱ��
    % ��ȡʧ��ʱ�ε����
    ly = length(alldata(:,6));
    for i=1:ly
        str = regexp(alldata{i,6}, '^[0-9]*','match') ;
        if isempty(str)
            alldata(i,6) = {'��'};
        else
            alldata(i,6) = {str2num(str{1})};
        end
    end
end
alldata(find(strcmp(alldata,'��')),1)={1}; alldata(find(strcmp(alldata,'Ů')),1)={0};
[nrow,~] = find(strcmp(alldata,'��')); % ɾ��ĳ������Ϊ���ա�������
alldata(nrow,:) = []; 
[row_x,col_x]=size(alldata);
del_row = [];
% save('alldata.mat','alldata')
% ��һ�������Ķ���ѡ����չΪ�������
i=1;
while i<=row_x
    for j = 1:col_x
        if ischar(alldata{i,j}) 
            if alldata{i,j}==44  %�ж��ַ�����44���͡���������ֲ���ԭ��Ĵ���
                continue
            end
            del_row = [del_row i];
            if isempty(strfind(alldata{i,j},',')) % ����û��','����Ŀ
                continue
            end
            add_patient = regexp(alldata(i,j), ',', 'split');  % ���������ָ�
            add_patient = add_patient{1};
            for k=1:size(add_patient,2)
                if ~isnan(str2double(add_patient{1,k})) % �ų�����������
                    % ��������β����������ɵ�����
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
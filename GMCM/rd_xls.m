[num,txt,raw]=xlsread('C:\Users\zhqch\Desktop\E\2017���й��о�����ѧ��ģ����E��-���°�\zuobiao.xls');
node_num = size(num, 1);
%�����м�ڵ���������
mat_distance = zeros(node_num, node_num);   
for idx1 = 1:node_num
    for idx2 = 1:node_num
        if idx1 ~= idx2
            mat_distance(idx1, idx2) = pdist([num(idx1, :); num(idx2, :)]);
        end
    end
end

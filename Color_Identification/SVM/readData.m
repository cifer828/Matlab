function readData(dirName)

% ��ȡ����
maindir = ['C:\Users\zhqch\Documents\code\MATLAB\Color_Identification\Exp1Data\' dirName];
subdir  = dir(maindir);
trainSet = [];
dirs = 0;
for i = 3 : length( subdir )
    subdirpath = fullfile( maindir, subdir( i ).name );
    mat = dir( subdirpath ); 
    for j = 3 : length(mat)
        matpath = fullfile( maindir, subdir( i ).name, mat(j).name);
        output = load(matpath);
        dirs = dirs + 1;
        trainSet = [trainSet; output.output];
    end
end

% �������ĵ����
centers = trainSet(1,7:9);
pointCell = cell(1);
for i=1:size(trainSet, 1)
    centerExisted = 0;
    for j=1:size(centers, 1)
        if trainSet(i,7:9) == centers(j,:)
            pointCell{j} = [pointCell{j}; trainSet(i,:)];
            centerExisted = 1;
            break;
        end
    end
    if centerExisted == 0
        centers = [centers; trainSet(i,7:9)];
        pointCell{j + 1} = trainSet(i,:);
    end
end
save(['trainSetCell_',dirName,'.mat'],'pointCell');
save(['centers_', dirName, '.mat'],'centers');
fprintf('�ɹ���ȡ%d������\n��%d�����ĵ�\n', size(trainSet,1), size(centers, 1));
end 
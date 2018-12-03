function main(dirName)
% svmÖðÒ»ÑµÁ·±æÊ¶°ë¾¶
load(['trainSetCell_', dirName, '.mat']);
radius = [];
for i=1:size(pointCell, 2)
    oneBlockSet = pointCell{1,i};
    center = oneBlockSet(1, 7:9);
    INTERVAL = 0.5;
    innerEdge = 0;
    outerEdge = 15;
    [r, sam, err] = svmForOne(center, innerEdge, outerEdge, oneBlockSet, INTERVAL);
    radius = [radius; center, r, sam, err];  
end
save(['radius_', dirName, '.mat'],'radius')





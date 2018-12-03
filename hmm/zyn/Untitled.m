% for i=1:size(data_cell, 1)
%     if size(data_cell{i,1},1) > size(data_cell{i,2},1)
%         data_cell{i,1} = data_cell{i, 1}(1:end-1,:);
%     end
% end
for i=1:size(data_cell, 1)
    plot(data_cell{i,2}(1:end-1), data_cell{i, 6});
    pause;
end
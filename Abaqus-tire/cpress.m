clear;
alldata = importdata('cpress-sr-0313.txt');
data = alldata.data(:,end);
node_data = data([1:4:size(data, 1)],:);
ele_data = reshape(node_data, 6, 8);

function data_cell = data_clean(filename)
fid = fopen(['data/'  filename]);
data_cell = {};
idx = 0;

while 1
    idx = idx + 1;
    line = fgetl(fid);
    if ~ischar(line) || idx > 100000
        break
    end
    prop = regexp(line, ' +', 'split');
    
    % frame
    frameline = fgetl(fid);
    frameline = regexp(frameline, ' +', 'split');
    frame_data = zeros(size(frameline, 2) - 1, 1);
    for i = 1: size(frameline, 2) - 1
        frame_data(i, :) = str2double(frameline(1, i));
    end
    % pos
    posline = fgetl(fid);
    posline = regexp(posline, ' +', 'split');
    vec_num = (size(posline, 2) - 1) / 2;
    one_seq_data = zeros(vec_num, 2);
    for i = 1: vec_num
        one_seq_data(i,:) = [str2double(posline(1, i * 2 - 1)) str2double(posline(1, i * 2))];
    end
    
    data_cell{idx, 1} = one_seq_data;
    data_cell{idx, 2} = frame_data;
    data_cell{idx, 3} = str2double(prop{1,1});
    data_cell{idx, 4} = str2double(prop{1,2});
    
end
fclose(fid);
save( [filename(1:end - 3) 'mat'],'data_cell');
end
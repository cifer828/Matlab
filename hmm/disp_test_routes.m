function disp_test_routes
filename = 'test_clean_tracked_30.mat';
load(filename);
part_name = regexp(filename, '_clean', 'split');
part_name = part_name{1, 1};
pic_name = ['D:\data\', part_name, '\',  part_name, '_bg.jpg'];
I = imread(pic_name);
cali1 = [300 687;932 861;1257 386;631 251];
cali2 = [443 722;1078 834;1355 324;720 258];
cali3 = [264 791;970 897;1258 339;571 277];
tform = {maketform('projective',cali1, cali2), maketform('projective',cali2, cali2), maketform('projective',cali3, cali2)};
% tformreal = maketform('projective',[1051 175;1125 105;1353 222;1287	291], [0 0; 0 60; 125 60;125 0]);
tformreal = maketform('projective',[309 702;1078 836;1356 327;605 246], [105 112;283 417;582 353;372 21]);
udata = [0 1920];  vdata = [0 1080];
[B,xdata,ydata] = imtransform(I, tformreal, 'bicubic', ...
                              'udata', udata,...
                              'vdata', vdata,...
                              'size', size(I),...
                              'fill', 128);
imshow(B,'XData',xdata,'YData',ydata);
% imshow(I);
hold on;
gps_data = csvread('data/12.29.csv');
% gps_data = load('gps1.mat');
% gps_data = csvread('C:\Users\zhqch\Desktop\gps1.csv');
% gps_data = gps_data(3314:4314,:);
left = 3369:3377;
straight = 3677:3685;
right = 4195:4207;
real_range = {left, straight, right};
hold on;
% plot(gps_data(3314:4314,3), gps_data(3314:4314,2), 'color', 'black')
% maketform('projective',[4462 28010;4610 28360;6312 28728;6804 28353]

% gps轨迹透视变换
tform_gps = {maketform('projective',[4461.9 28010;4894.5 29001;5521.7 29196;6804.3 28353], round(tformfwd(tformreal, [586 926;713 608;645 452;446 390]))),...
    maketform('projective',[4752.7 27090;4894.5 29001;5521.7 29196;5053.3 31139], round(tformfwd(tformreal, [562 916;842 551;706 335;1261 177]))),...
    maketform('projective',[6117.1 27372;5220.8 27892;4590.6 28003;4007.3 27308], round(tformfwd(tformreal, [327 547;519 621;559 690;491 898])))
    };

gps_traj = {round(tformfwd(tform_gps{1}, [gps_data(left, 4) gps_data(left, 5)])),...
    round(tformfwd(tform_gps{1}, [gps_data(straight, 4) gps_data(straight, 5)])),...
    round(tformfwd(tform_gps{3}, [gps_data(right, 4) gps_data(right, 5)])),...
    };


% plot(gps_data(straight,3), gps_data(straight,2), 'color', 'g');
% plot(gps_data(right,3), gps_data(right,2), 'color', 'b');

% flag = 0;
% if size(data_cell, 2)<7
%     flag = 1;
% end
% 
for i=1:3
%     % 轨迹平滑
    time = data_cell{i, 2};
%     if flag
%         data_cell{i, 1} = round(tformfwd(tform{i}, data_cell{i, 1}));
%         xx = smooth(data_cell{i, 1}(:, 1), 20, 'lowess');
%         yy = smooth(data_cell{i, 1}(:, 2), 20, 'lowess');
%         data_cell{i, 5} = [xx yy];
%         % 速度
%         real_traj = round(tformfwd(tformreal, data_cell{i, 5}));
%         rtraj =  real_traj;
%         rtraj2 =  real_traj;
%         rtraj2(1,:) = [];
%         vel = ((rtraj2(:,1) - rtraj(1:end - 1,1)).^ 2 + (rtraj2(:, 2) - rtraj(1:end -1, 2)).^ 2) .^ 0.5 ./ (time(2:end) - time(1:end-1)) * 2.3;
%         data_cell{i, 6} = smooth(vel, 20, 'lowess');
%         % 类型
%         data_cell{i, 7} = 1;
%     end
%     % 绘图
    subplot(3,1,i);
    hold on
    plot(time(2:end) - time(2), data_cell{i, 6});
    plot([1:length(real_range{i})] * 21 - 21, gps_data(real_range{i},6)'/3.6);
    axis([ -inf inf 0 10]);
    ylabel('{速度/m·s^-^1}');
    % 速度误差
    mean(data_cell{i, 6});
    mean(gps_data(real_range{i},6)'/3.6);
    num = ceil((0:length(real_range{i}) - 1) * 10.5);
    num(1) = 1;
    system_vel = data_cell{i, 6};
    diff = (system_vel(num) - gps_data(real_range{i},6)/3.6) ./ (gps_data(real_range{i},6) / 3.6);
    1 - mean(abs(diff))
    % gps轨迹与视频轨迹
%     gps_t =  gps_traj{i};
%     xx = smooth(gps_t(:,1), 5, 'lowess');
%     yy = smooth(gps_t(:,2), 5, 'lowess');
%     if i == 2
%         plot(gps_t(1:7, 1) + 50, gps_t(1:7, 2) + 50, 'color', 'b', 'Marker', '*','LineWidth', 2);
%     else
%         plot(xx, yy, 'color', 'b','Marker', '*', 'LineWidth', 2);
%     end
%     draw_one_traj(data_cell(i,:), tformreal);
end
xlabel('帧数');
% save(filename, 'data_cell');

% 时空轨迹
% for i=1:3
%     figure(i+1);
%     time = data_cell{i, 2};
%     c = data_cell{i, 1};
%     plot3(c(:,1), c(:, 2), time, 'LineWidth', 2)
%     grid on;
% end
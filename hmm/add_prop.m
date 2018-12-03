% 轨迹过滤
function data = add_prop(data, tform, veh_fg, bike_fg, ped_fg)
% 轨迹平滑
xx = smooth(data{1}(:, 1), 30, 'lowess');
yy = smooth(data{1}(:, 2), 30, 'lowess');
% data{5} = [xx yy];

% 真实轨迹
real_traj = round(tformfwd(tform, [xx yy]));
real_traj = [smooth(real_traj(:, 1), 30, 'lowess') smooth(real_traj(:, 2), 30, 'lowess')];
data{5} = real_traj;

% 速度
time = data{2};
rtraj =  real_traj;
rtraj2 =  real_traj;
rtraj2(1,:) = [];
vel = ((rtraj2(:,1) - rtraj(1:end - 1,1)).^ 2 + (rtraj2(:, 2) - rtraj(1:end -1, 2)).^ 2) .^ 0.5 ./ (time(2:end) - time(1:end-1)) * 0.25;
data{6} = vel;
% 分类
traj = int32(data{1});
% type = 1;
idx = size(ped_fg, 1) * (traj(:,1) - 1) + traj(:,2);
ratio = sum(ped_fg(idx) > 128) / size(traj, 1);
if ratio > 0.9
    type = 3;
elseif veh_fg(traj(1,2), traj(1,1)) > 128 && veh_fg(traj(end,2), traj(end,1)) > 128
    type = 1;
elseif bike_fg(traj(1,2), traj(1,1)) > 128 || bike_fg(traj(end,2), traj(end,1)) > 128
    type = 2;
elseif mean(vel, 1) < 3 && ratio > 0.5
    type = 3;
elseif data{4} > 500
    type = 1;
else
    type = 2;
end
data{7} = type;
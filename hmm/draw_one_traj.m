function draw_one_traj(data, tform)
    xx = smooth(data{1}(:, 1), 30, 'lowess');
    yy = smooth(data{1}(:, 2), 30, 'lowess');    
    traj = [xx yy];
%     hold on;
    
%     % ø®∂˚¬¸¬À≤®
%     kalman_track = [];
%     kalmanFilter = configureKalmanFilter('ConstantAcceleration', [traj(1, 1), traj(1, 2), 5], [20 20 20] , [20 20 20], 100);
%     kalman_track(1,:) = [traj(1, 1), traj(1, 2), 0];
%     for j = 2 : size(traj, 1)
%         vel = sum((traj(j, :) - traj(j - 1, :)) .^ 2);
%         predict(kalmanFilter);
%         kalman_track = [kalman_track; correct(kalmanFilter, [traj(j, :) vel])];
%     end
%     for k = 1: 10
%         pred = predict(kalmanFilter);
%         kalman_track = [kalman_track; correct(kalmanFilter, pred)];
%     end
%     plot(kalman_track(end - 10: end, 1), kalman_track(end - 10: end, 2), 'Color', 'g');
%     hold on
    
    % ’Ê µπÏº£
    real_traj = round(tformfwd(tform, traj));
    real_traj = [smooth(real_traj(:, 1), 10, 'lowess') smooth(real_traj(:, 2), 10, 'lowess')];
%     real_traj = [smooth(real_traj(:, 1), 20, 'lowess') smooth(real_traj(:, 2), 20, 'lowess')];
    color = 'rgb';
%     traj = traj + rand(size(traj)) * 10;
%     plot(traj(:, 1), traj(:, 2), 'Color', color(data{7}), 'LineWidth', 1); 
    plot(real_traj(1, 1), real_traj(1, 2), '*');
    plot(real_traj(:, 1), real_traj(:, 2), 'Color', color(data{7}), 'LineWidth', 1); % Õ∏ ”±‰ªª∫Û

%     pause;
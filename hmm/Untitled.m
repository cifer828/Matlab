for j=1:size(data_cell, 1)
    traj = data_cell{j, 5};
    vel = data_cell{j, 6};
    kalmanFilter = configureKalmanFilter('ConstantAcceleration', [traj(1,:) 5], [25 25 25] , [25 25 25], 10);
    kalman_track = [traj(1,:) 5];
    for i=2:size(traj,1)
        predict(kalmanFilter); 
        kalman_track = [kalman_track; correct(kalmanFilter, [traj(i,:) vel(j)])];
    end
    ex_traj = [];
    for k=1:50
        ex_traj = [ex_traj; predict(kalmanFilter)];
    end
    figure(1)
    hold on
    plot(kalman_track(:,1),kalman_track(:,2), 'b')
    plot(ex_traj(:,1), ex_traj(:,2), 'b')
    plot(traj(:,1), traj(:,2), 'r');
    pause
    clf
end

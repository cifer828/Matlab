function flag = hasconflict(data1, data2, threshold, color)
i = 2;
j = 2;
flag = 0;
if data1{2}(1) >= data2{2}(end) || data2{2}(1) >= data1{2}(end)
    flag = -1;
end

kalman_track1 = [data1{1}(1,:) 0];
kalman_track2 = [data2{1}(1,:) 0];
kalmanFilter1 = configureKalmanFilter('ConstantAcceleration', [data1{1}(1,:) 5], [25 25 25] , [25 25 25], 10);
kalmanFilter2 = configureKalmanFilter('ConstantAcceleration', [data2{1}(1,:) 5], [25 25 25] , [25 25 25], 10);

current_dist = 0;
while(flag ~= 1)
    if i > size(data1{1}, 1) || j > size(data2{1}, 1) 
        break
    end
    if data1{2}(i) > data2{2}(j)
        predict(kalmanFilter2); 
        vel2 = sum((data2{1}(j, :) - data2{1}(j - 1, :)) .^ 2);
        kalman_track2 = [kalman_track2; correct(kalmanFilter2, [data2{1}(j,:) vel2])];
        j = j + 1;
    elseif data1{2}(i) < data2{2}(j)
        predict(kalmanFilter1);
        vel1 = sum((data1{1}(i, :) - data1{1}(i - 1, :)) .^ 2);
        kalman_track1 = [kalman_track1; correct(kalmanFilter1, [data1{1}(i,:) vel1])];
        i = i + 1;
    else
        dist = sum((data1{1}(i, :) - data2{1}(j, :)) .^ 2) .^ 0.5;
        if flag == 0 && dist < threshold
            flag = 2;
            current_dist = dist;
        elseif dist < current_dist
            current_dist = dist;
        elseif flag == 2
            flag = 1;
            break;
        end
        vel2 = sum((data2{1}(j, :) - data2{1}(j - 1, :)) .^ 2);
        vel1 = sum((data1{1}(i, :) - data1{1}(i - 1, :)) .^ 2);
        predict(kalmanFilter1);
        predict(kalmanFilter2);
        kalman_track1 = [kalman_track1; correct(kalmanFilter1, [data1{1}(i,:) vel1])];
        kalman_track2 = [kalman_track2; correct(kalmanFilter2, [data2{1}(j,:) vel2])];
        i = i + 1;
        j = j + 1;
    end
end

% if flag == 2
%     flag = 1
% end
if flag == 1
    ex_track1 = [];
    ex_track2 = [];
    for i = 1:50
        p1 = predict(kalmanFilter1);
        p2 = predict(kalmanFilter2);
        ex_track1 = [ex_track1; p1];
        ex_track2 = [ex_track2; p2];
%         new_dist = sum((p1(1,1:2) - p2(1,1:2)) .^ 2) .^ 0.5;
%         if new_dist < current_dist
%             current_dist
%             current_dist = new_dist;
%         else
%             break
%         end
    end
    if current_dist > threshold * 0.8
        flag = 0;
    else
        hold off
        plot(ex_track1(:,1), ex_track1(:,2), 'r+'); 
        hold on 
        plot(ex_track2(:,1), ex_track2(:,2), 'g+');
    end
end

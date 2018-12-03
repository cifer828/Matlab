function sudujiasudu(filename)
load(filename)
veh_v = [];
bike_v = [];
ped_v = [];
for i=1:size(data_cell, 1)
    v = mean(data_cell{i, 6}, 1);
    if data_cell{i, 7}==1
        veh_v = [veh_v v];
    elseif data_cell{i, 7}==2
        bike_v = [bike_v v];
    elseif data_cell{i, 7}==3
        ped_v = [ped_v v];
    end
end
ped_v = ped_v(ped_v < 3);
subplot(3,1,1);
[n1, xout1] = hist(veh_v, 20);
bar(xout1,n1/length(veh_v));
ylabel('机动车');
axis([ -inf inf 0 0.2])
subplot(3,1,2);
[n2, xout2] = hist(bike_v, 20);
bar(xout2,n2/length(bike_v));
axis([-inf inf 0 0.2])
ylabel('非机动车');
subplot(3,1,3);
[n3, xout3] = hist(ped_v, 20);
bar(xout3,n3/length(ped_v));
xlabel('{速度/m·s^-^1}');
axis([ -inf inf 0 0.2])
ylabel('行人');

% bike = a(a(:,1) < 200 & a(:,2) > 5, :);
% ped = a(a(:,2) < 5, :);
% veh = a(a(:,1) > 200,:);
% % x = veh(veh(:,2) < 80, 2);
% x = bike(prd(:,2) < 80, 2);
% % x = ped(ped(:,2) < 80, 2);
% 
% [n, xout] = hist(x, 15);
% bar(xout,n/length(x));
% t = data_cell{5};
% plot(t(:,1), t(:,2));
% time = data_cell{2};
% vel =  smooth(data_cell{6}, 20, 'lowess');
% % vel = data_cell{6};
% accel = (vel(2:end) - vel(1:end-1))/2*29;
% subplot(2,1,1);
% plot(time(2:end), vel);
% xlabel('帧数');
% ylabel('{速度/m·s^-^1}');
% set(gca,'YTick',0:2:10);
% subplot(2,1,2);
% plot(time(3:end), accel);
% xlabel('帧数');
% ylabel('{加速度/m·s^-^2}');
% set(gca,'YTick',[0:0.4:2]);

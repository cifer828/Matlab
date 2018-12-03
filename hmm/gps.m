function gps
gps_data = csvread('data/12.29.csv');
% gps_data = load('gps1.mat');
% gps_data = csvread('C:\Users\zhqch\Desktop\gps1.csv');
% gps_data = gps_data(3314:4314,:);
left = 3369:3377;
straight = 3679:3687;
right = 4196:4207;
% plot(gps_data(3314:4314,3), gps_data(3314:4314,2), 'color', 'black')
figure(1)
hold on;
plot(gps_data(left,3), gps_data(left,2), 'color', 'r');
plot(gps_data(straight,3), gps_data(straight,2), 'color', 'g');
plot(gps_data(right,3), gps_data(right,2), 'color', 'b');
figure(2)
hold on;
plot(1:length(left), gps_data(left,4)', 'color', 'r');
plot(1:length(straight), gps_data(straight,4)', 'color', 'g');
plot(1:length(right), gps_data(right,4)', 'color', 'b');
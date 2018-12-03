% �ж����켣�Ƿ���ڳ�ͻ
function [flag,conflict_point, min_ttc] = hasconflict2(obj1, obj2)
% ��ȡ��Ŀ��Ĺ켣��ʱ�䡢�ٶ�
% obj1 ʱ�俿ǰ
traj1 = obj1{5};
time1 = obj1{2};
speed1 = obj1{6};
traj2 = obj2{5};
time2 = obj2{2};
speed2 = obj2{6};
idx1 = 1;idx2 = 1;
ttc1 = [];
ttc2 = [];
pts = []; % ��������
conflict_end = 0; % ʱ�佻���յ�
conflict_point = [inf inf]; % ���TTC��Ӧ�ĳ�ͻ��
flag = 0;% 0-ʱ���н��������޳�ͻ 1-�г�ͻ -1-ʱ���޽���
min_ttc = inf; 
while(idx1<length(time1) && idx2<length(time2))
    if time1(end) <= time2(1)
        flag = -1;
        break
    end
    if time1(idx1) > time2(idx2)
        idx2 = idx2 + 1;
    elseif time1(idx1) < time2(idx2)
        idx1 = idx1 + 1;
    else
        % ��ǰ״̬����
        conflict_end = time1(idx1);
        pt = solve_point(traj1(idx1,:), traj1(idx1 + 1,:), traj2(idx2,:), traj2(idx2 + 1,:));
        pts = [pts;pt];
        if sum((traj1(idx1,:) - traj2(idx2,:)) .^ 2) < sum((traj1(idx1 + 1,:) - traj2(idx2 + 1,:)) .^ 2)
            ttc1=[ttc1 inf];
            ttc2=[ttc2 inf];
        else
            ttc1 = [ttc1 sum((traj1(idx1,:) - pt) .^ 2) ^ 0.5 / speed1(idx1)];
            ttc2 = [ttc2 sum((traj2(idx2,:) - pt) .^ 2) ^ 0.5 / speed2(idx2)];
        end
        idx1 = idx1 + 1;
        idx2 = idx2 + 1;
    end
end
if isempty(ttc1)
    flag = -1;
end
% ��ʾ�������й���ʱ�䡢ttc�ӽ�����Сttc����ײΣ��
if  flag == 0 && (min(ttc1) < 10.5 || min(ttc2) <= 10.5) && abs(min(ttc1 - ttc2)) < 5 && max(ttc1) < 1000 && max(ttc2) < 1000
    conflict_frame = [conflict_end - 2 * length(ttc1) + 2: 2 : conflict_end]; 
    ttc = ttc1;
    if mean(ttc1) > mean(ttc2)
        ttc = ttc2;
    end
    [min_ttc,I] = min(ttc);
    conflict_point = pts(I,:);
    subplot(1,2,1)
    plot(conflict_frame(ttc<10), ttc(ttc<10));
%     hold on
%     plot(conflict_frame, ttc2);
    legend('ttc');
    flag = 1;
    fprintf('min-ttc:%6.4f\n',min(ttc));
end
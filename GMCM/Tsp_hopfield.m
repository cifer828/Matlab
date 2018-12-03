%% ����Hopfield��������Ż��������������Ż�����
% 
%% ��ջ�������������ȫ�ֱ���
clear all
clc
global A D
 
%% �������λ��
% load city_location
citys=[1304 2312;
     3639 1315;
     4177 2244;
     3712 1399;
     3488 1535;
     3326 1556;
     3238 1229;
     4196 1004;
     4312 790;4386 570;
     3007 1970;2562 1756;2788 1491;2381 1676;1332 695;3715 1678;
     3918 2179;4061 2370;3780 2212;3676 2578;4029 2838;4263 2931;3429 1908;3507 2367;
     3394 2643;3439 3201;2935 3240;3140 3550;2545 2357;2778 2826;2370 2975];
 scale_factor = 5000.0;
 citys = citys/scale_factor;
%% �����໥���м����
%  citys = city_location;
distance = dist(citys,citys');
 
%% ��ʼ������
N = size(citys,1);
A = 200;
D = 100;
U0 = 0.1;
step = 0.0001;
delta = 2 * rand(N,N) - 1;
U = U0 * log(N-1) + delta;
V = (1 + tansig(U/U0))/2;
iter_num = 10000;
E = zeros(1,iter_num);
 
%% Ѱ�ŵ���[5]
for k = 1:iter_num  
    % ��̬���̼���
    dU = diff_u(V,distance);
    % ������Ԫ״̬����
    U = U + dU*step;
    % �����Ԫ״̬����
    V = (1 + tansig(U/U0))/2;
    % ������������
    e = energy(V,distance);
    E(k) = e;  
end
 
 %% �ж�·����Ч��[5]
[rows,cols] = size(V);
V1 = zeros(rows,cols);
[V_max,V_ind] = max(V);
for j = 1:cols
    V1(V_ind(j),j) = 1;
end
C = sum(V1,1);
R = sum(V1,2);
flag = isequal(C,ones(1,N)) & isequal(R',ones(1,N));
%% �����ʾ
if flag == 1
   % �����ʼ·������
   sort_rand = randperm(N);
   citys_rand = citys(sort_rand,:);
   Length_init = dist(citys_rand(1,:),citys_rand(end,:)');
   for i = 2:size(citys_rand,1)
       Length_init = Length_init+dist(citys_rand(i-1,:),citys_rand(i,:)');
   end
   % ���Ƴ�ʼ·��
   figure(1)
   plot([citys_rand(:,1);citys_rand(1,1)],[citys_rand(:,2);citys_rand(1,2)],'o-')
   for i = 1:length(citys)
       text(citys(i,1),citys(i,2),['   ' num2str(i)])
   end
   text(citys_rand(1,1),citys_rand(1,2), ['       ���' ])
   text(citys_rand(end,1),citys_rand(end,2), ['       �յ�' ])
   title(['�Ż�ǰ·��(���ȣ�' num2str(scale_factor*Length_init) ')'])
   axis([0 1 0 1])
   grid on
   xlabel('����λ�ú�����')
   ylabel('����λ��������')
   % ��������·������
   [V1_max,V1_ind] = max(V1);
   citys_end = citys(V1_ind,:);
   Length_end = dist(citys_end(1,:),citys_end(end,:)');
   for i = 2:size(citys_end,1)
       Length_end = Length_end+dist(citys_end(i-1,:),citys_end(i,:)');
   end
   disp('����·������'); V1
   % ��������·��
   figure(2)
   plot([citys_end(:,1);citys_end(1,1)],...
       [citys_end(:,2);citys_end(1,2)],'o-')
   for i = 1:length(citys)
       text(citys(i,1),citys(i,2),['  ' num2str(i)])
   end
   text(citys_end(1,1),citys_end(1,2),['       ���' ])
   text(citys_end(end,1),citys_end(end,2),['       �յ�' ])
   title(['�Ż���·��(���ȣ�' num2str(scale_factor*Length_end) ')'])
   axis([0 1 0 1])
   grid on
   xlabel('����λ�ú�����')
   ylabel('����λ��������')
   % �������������仯����[5]
   figure(3)
   plot(1:iter_num,E);
   ylim([0 2000])
   title(['���������仯����(����������' num2str(E(end)) ')']);
   xlabel('��������');
   ylabel('��������');
else
   disp('Ѱ��·����Ч');
end

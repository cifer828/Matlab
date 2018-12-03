%% 初始化
clear ; close all; clc
%% 从excel读取数据,并处理多选内容
%  失眠--1型：2-103&211-220  2型：104-138&211-215&221
%        3型：139-169&216    4型：170-210&221
filep = '失眠人群数据.xlsx';
insomnia_time = {};
insomnia_time{1} = [load_data(filep,'C2:L103',2);load_data(filep,'C211:L220',2)];
insomnia_time{2} = [load_data(filep,'C104:L138',2);load_data(filep,'C211:L214',2);load_data(filep,'C221:L221',2)];
insomnia_time{3} = [load_data(filep,'C139:L169',2);load_data(filep,'C216:L216',2)];
insomnia_time{4} = [load_data(filep,'C170:L210',2);load_data(filep,'C217:L221',2)];

save('insomnia_time.mat','insomnia_time')
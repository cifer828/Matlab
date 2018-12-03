%% 初始化
clear ; close all; clc
%% 从excel读取数据,并处理多选内容
%  失眠--1型：2-103&211-220  2型：104-138&211-215&221
%        3型：139-169&216    4型：170-210&221
filep = '失眠人群数据.xlsx';
pdata = {};
pdata{1} = [load_data(filep,'C2:L103',1);load_data(filep,'C211:L220',1)];
pdata{2} = [load_data(filep,'C104:L138',1);load_data(filep,'C211:L214',1);load_data(filep,'C221:L221',1)];
pdata{3} = [load_data(filep,'C139:L169',1);load_data(filep,'C216:L216',1)];
pdata{4} = [load_data(filep,'C170:L210',1);load_data(filep,'C217:L221',1)];

%  正常--1型：2-97&145-159          2型：98-105&145-156&160-162
%        3型：106-128&148-155&163   4型：129-144&156-163
filen = '正常人群数据.xlsx';
ndata = {};
ndata{1} = [load_data(filen,'C2:L97',1);load_data(filen,'C145:L159',1)];
ndata{2} = [load_data(filen,'C98:L105',1);load_data(filen,'C145:L156',1);load_data(filen,'C160:L162',1)];
ndata{3} = [load_data(filen,'C106:L128',1);load_data(filen,'C148:L155',1);load_data(filen,'C163:L163',1)];
ndata{4} = [load_data(filen,'C129:L144',1);load_data(filen,'C156:L163',1)];

% 失眠样本输出为1,正常样本输出为0
insomnia_data = {} ;
for i=1:4
    pdata{i}(:,6)=1;
    ndata{i}(:,6)=0;
    insomnia_data{i} = [pdata{i};ndata{i}];
end

save('insomnia.mat','insomnia_data')
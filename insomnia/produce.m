%% ��ʼ��
clear ; close all; clc
%% ��excel��ȡ����,�������ѡ����
%  ʧ��--1�ͣ�2-103&211-220  2�ͣ�104-138&211-215&221
%        3�ͣ�139-169&216    4�ͣ�170-210&221
filep = 'ʧ����Ⱥ����.xlsx';
pdata = {};
pdata{1} = [load_data(filep,'C2:L103',1);load_data(filep,'C211:L220',1)];
pdata{2} = [load_data(filep,'C104:L138',1);load_data(filep,'C211:L214',1);load_data(filep,'C221:L221',1)];
pdata{3} = [load_data(filep,'C139:L169',1);load_data(filep,'C216:L216',1)];
pdata{4} = [load_data(filep,'C170:L210',1);load_data(filep,'C217:L221',1)];

%  ����--1�ͣ�2-97&145-159          2�ͣ�98-105&145-156&160-162
%        3�ͣ�106-128&148-155&163   4�ͣ�129-144&156-163
filen = '������Ⱥ����.xlsx';
ndata = {};
ndata{1} = [load_data(filen,'C2:L97',1);load_data(filen,'C145:L159',1)];
ndata{2} = [load_data(filen,'C98:L105',1);load_data(filen,'C145:L156',1);load_data(filen,'C160:L162',1)];
ndata{3} = [load_data(filen,'C106:L128',1);load_data(filen,'C148:L155',1);load_data(filen,'C163:L163',1)];
ndata{4} = [load_data(filen,'C129:L144',1);load_data(filen,'C156:L163',1)];

% ʧ���������Ϊ1,�����������Ϊ0
insomnia_data = {} ;
for i=1:4
    pdata{i}(:,6)=1;
    ndata{i}(:,6)=0;
    insomnia_data{i} = [pdata{i};ndata{i}];
end

save('insomnia.mat','insomnia_data')
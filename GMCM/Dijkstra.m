clc,clear all;
% 读取连接矩阵
a=zeros(6);
a(1,2)=50;a(1,4)=40;a(1,5)=25;a(1,6)=10;               
a(2,3)=15;a(2,4)=20;a(2,6)=25;
a(3,4)=10;a(3,5)=20;
a(4,5)=10;a(4,6)=25;
a(5,6)=55;
a=a+a';
a(find(a==0))=inf; % 将a=0的数全部替换无穷大
for base_point = 1:size(a, 1)
    calculated(1:length(a))=0;
    calculated(base_point)=1;  % 当一个点已经求出到原点的最短距离时，其下标i对应的calculated(i)赋1
    idx_S=base_point; % 存放存入S集合的顺序
    idx_S_before=ones(1,length(a)); % 存放始点到第i点最短通路中第i顶点前一顶点的序号
    tonglu(1:length(a))=inf; 
    tonglu(base_point)=0;  % 存放由始点到第i点最短通路的值
    temp=base_point;  % temp表示目标城市,算源点到其它点的最短路
    while sum(calculated)<length(a)  % 看是否所有的点都标记为P标号
        tb=find(calculated==0); % 找到标号为0的所有点,即找到还没有存入S的点
        tonglu(tb)=min(tonglu(tb),tonglu(temp)+a(temp,tb));% 计算标号为0的点的最短路，或者是从原点直接到这个点，又或者是原点经过r1,间接到达这个点
        tmpb=find(tonglu(tb)==min(tonglu(tb)));  % 求d[tb]序列最小值的下标
        temp=tb(tmpb(1));% 可能有多条路径同时到达最小值，取其中一个，temp也从原点变为下一个点
        calculated(temp)=1;% 找到最小路径的表对应的pb(i)=1
        idx_S=[idx_S,temp];  % 存放存入S集合的顺序
        temp2=find(tonglu(idx_S)==tonglu(temp)-a(temp,idx_S));
        idx_S_before(temp)=idx_S(temp2(1)); % 记录标号索引
    end
end
tonglu, idx_S, idx_S_before
clc,clear all;
% ��ȡ���Ӿ���
a=zeros(6);
a(1,2)=50;a(1,4)=40;a(1,5)=25;a(1,6)=10;               
a(2,3)=15;a(2,4)=20;a(2,6)=25;
a(3,4)=10;a(3,5)=20;
a(4,5)=10;a(4,6)=25;
a(5,6)=55;
a=a+a';
a(find(a==0))=inf; % ��a=0����ȫ���滻�����
for base_point = 1:size(a, 1)
    calculated(1:length(a))=0;
    calculated(base_point)=1;  % ��һ�����Ѿ������ԭ�����̾���ʱ�����±�i��Ӧ��calculated(i)��1
    idx_S=base_point; % ��Ŵ���S���ϵ�˳��
    idx_S_before=ones(1,length(a)); % ���ʼ�㵽��i�����ͨ·�е�i����ǰһ��������
    tonglu(1:length(a))=inf; 
    tonglu(base_point)=0;  % �����ʼ�㵽��i�����ͨ·��ֵ
    temp=base_point;  % temp��ʾĿ�����,��Դ�㵽����������·
    while sum(calculated)<length(a)  % ���Ƿ����еĵ㶼���ΪP���
        tb=find(calculated==0); % �ҵ����Ϊ0�����е�,���ҵ���û�д���S�ĵ�
        tonglu(tb)=min(tonglu(tb),tonglu(temp)+a(temp,tb));% ������Ϊ0�ĵ�����·�������Ǵ�ԭ��ֱ�ӵ�����㣬�ֻ�����ԭ�㾭��r1,��ӵ��������
        tmpb=find(tonglu(tb)==min(tonglu(tb)));  % ��d[tb]������Сֵ���±�
        temp=tb(tmpb(1));% �����ж���·��ͬʱ������Сֵ��ȡ����һ����tempҲ��ԭ���Ϊ��һ����
        calculated(temp)=1;% �ҵ���С·���ı��Ӧ��pb(i)=1
        idx_S=[idx_S,temp];  % ��Ŵ���S���ϵ�˳��
        temp2=find(tonglu(idx_S)==tonglu(temp)-a(temp,idx_S));
        idx_S_before(temp)=idx_S(temp2(1)); % ��¼�������
    end
end
tonglu, idx_S, idx_S_before
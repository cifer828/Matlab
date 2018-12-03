%��ʼ��
R=15;                         %��������Э����
Q=25;                         %��������Э����
 A=randn(1,10)               %����10�������
 v=sqrt(15)*randn(1,10)      %�����������������
 save('pinghua.mat','A','v')
load('pinghua.mat')


% �������Ӿ��ȷֲ����漴����
% % A=-sqrt(75)+(2*sqrt(75))*rand(1,10)
% % v=-sqrt(45)+(2*sqrt(45))*rand(1,10)
% % save('junyunfenbu.mat','A','v')
% load('junyunfenbu')


%kalman�˲����̣�XΪkalman�˲������p_Ϊһ��Ԥ��Э���pΪ�˲�Э����
for k=1:10
    %��ʼʱ�̵�Э����
    p(1)=100; 
    x(k+1)=A(k);
    v(k+1)=v(k);
    p_(k+1)=p(k)+Q; 
    %kalman�˲����棬��faiΪ��λ�󣬹�һ��Ԥ��ֵ�ͳ�ʼֵ��ȣ���x(k+1|k)=x(k��
    K(k+1)=p_(k+1)*inv(p_(k+1)+R);      
    y(k+1)=x(k+1)+v(k+1);
    X(k+1)=x(k)+K(k+1)*(y(k+1)-x(k));    
    p(k+1)=(1-K(k+1))*p_(k+1);
end
 
%�̶��ڼ�ƽ�����̣�X1Ϊ�̶��ڼ�ƽ�������p1Ϊ�̶��ڼ�ƽ��Э����
N=length(p);
for k=N-1:-1:1               
    X1(N)=X(N);
    p1(N)=p(N);
    F(k)=p(k)*inv(p_(k+1));
    p1(k)=p(k)-F(k)*(p_(k+1)-p1(k+1))*(F(k))';
    X1(k)=X(k)+F(k)*(X1(k+1)-x(k));
end
 
%�̶���ƽ�����̣�XpΪ�̶���ƽ�������PpΪ�̶���ƽ��Э����
for k=1:N-1
    Xp(1)=X(1);
    Pp(1)=100;
    B(1)=1;
    B(k+1)=B(k)*F(k);
    Xp(k+1)=Xp(k)+B(k+1)*(X(k+1)-x(k));
    Pp(k+1)=Pp(k)+B(k+1)*(p(k+1)-p_(k+1))*(B(k+1))';
end
 
k=1:N;
%����������˲�ֵ��ƽ��ֵ������ͬһͼ����
figure(1)
h1=plot(k,x,'r-.',k,X,'b--',k,X1,'g-');
set(h1,'LineWidth',2)
grid on
% legend('�����������','��kalman�˲����ֵ','ƽ��ֵ')
title('kalman�˲���ƽ��ֵ')
print -dmeta xandX
 
%һ��Ԥ��Э���kalman�˲�Э����̶��ڼ�ƽ��Э����
figure(2)
h2=plot(k,p_,'-.r*',k,p,'b--',k,p1,'g');
set(h2,'LineWidth',2)
grid on
% legend('һ��Ԥ��Э����','kalman�˲�Э����','�̶��ڼ�ƽ��Э����')
title('kalman�˲����̶��ڼ�ƽ��Э����')
print -dmeta pandp1
 
% kalman�˲����漰�̶��ڼ�ƽ������
figure(3)
subplot(2,1,1)
h3=plot(k,K);
set(h3,'LineWidth',2)
grid on
title('kalman�˲�����')
subplot(2,1,2)
h4=plot(1:N-1,F);
set(h4,'LineWidth',2)
title('�̶��ڼ�ƽ������')
grid on
print -dmeta KandF
  
%�̶���ƽ��Э����
figure(4)
h5=plot(1:N,Pp);
set(h5,'LineWidth',2)
grid on
title('�Թ̶���k=1���ƽ��Э����')
print -dmeta pointP
 
%�̶���ƽ������
figure(5)
h6=plot(1:N,B);
set(h6,'LineWidth',2)
grid on
title('�̶���ƽ������')
print -dmeta pointB
 
%�̶���ƽ��״ֵ̬
figure(6)
h7=plot(1:N,Xp);
title('�̶���ƽ��״ֵ̬')
set(h7,'LineWidth',2)
grid on
print -dmeta pointXp

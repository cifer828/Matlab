%初始化
R=15;                         %测量噪声协方差
Q=25;                         %过程噪声协方差
 A=randn(1,10)               %产生10个随机数
 v=sqrt(15)*randn(1,10)      %产生测量噪声随机数
 save('pinghua.mat','A','v')
load('pinghua.mat')


% 产生服从均匀分布的随即序列
% % A=-sqrt(75)+(2*sqrt(75))*rand(1,10)
% % v=-sqrt(45)+(2*sqrt(45))*rand(1,10)
% % save('junyunfenbu.mat','A','v')
% load('junyunfenbu')


%kalman滤波过程，X为kalman滤波结果，p_为一步预测协方差，p为滤波协方差
for k=1:10
    %初始时刻的协方差
    p(1)=100; 
    x(k+1)=A(k);
    v(k+1)=v(k);
    p_(k+1)=p(k)+Q; 
    %kalman滤波增益，因fai为单位阵，故一步预测值和初始值相等，即x(k+1|k)=x(k）
    K(k+1)=p_(k+1)*inv(p_(k+1)+R);      
    y(k+1)=x(k+1)+v(k+1);
    X(k+1)=x(k)+K(k+1)*(y(k+1)-x(k));    
    p(k+1)=(1-K(k+1))*p_(k+1);
end
 
%固定期间平滑过程，X1为固定期间平滑结果，p1为固定期间平滑协方差
N=length(p);
for k=N-1:-1:1               
    X1(N)=X(N);
    p1(N)=p(N);
    F(k)=p(k)*inv(p_(k+1));
    p1(k)=p(k)-F(k)*(p_(k+1)-p1(k+1))*(F(k))';
    X1(k)=X(k)+F(k)*(X1(k+1)-x(k));
end
 
%固定点平滑过程，Xp为固定点平滑结果，Pp为固定点平滑协方差
for k=1:N-1
    Xp(1)=X(1);
    Pp(1)=100;
    B(1)=1;
    B(k+1)=B(k)*F(k);
    Xp(k+1)=Xp(k)+B(k+1)*(X(k+1)-x(k));
    Pp(k+1)=Pp(k)+B(k+1)*(p(k+1)-p_(k+1))*(B(k+1))';
end
 
k=1:N;
%将随机数，滤波值和平滑值绘制在同一图像中
figure(1)
h1=plot(k,x,'r-.',k,X,'b--',k,X1,'g-');
set(h1,'LineWidth',2)
grid on
% legend('产生的随机数','经kalman滤波后的值','平滑值')
title('kalman滤波及平滑值')
print -dmeta xandX
 
%一步预测协方差，kalman滤波协方差，固定期间平滑协方差
figure(2)
h2=plot(k,p_,'-.r*',k,p,'b--',k,p1,'g');
set(h2,'LineWidth',2)
grid on
% legend('一步预测协方差','kalman滤波协方差','固定期间平滑协方差')
title('kalman滤波及固定期间平滑协方差')
print -dmeta pandp1
 
% kalman滤波增益及固定期间平滑增益
figure(3)
subplot(2,1,1)
h3=plot(k,K);
set(h3,'LineWidth',2)
grid on
title('kalman滤波增益')
subplot(2,1,2)
h4=plot(1:N-1,F);
set(h4,'LineWidth',2)
title('固定期间平滑增益')
grid on
print -dmeta KandF
  
%固定点平滑协方差
figure(4)
h5=plot(1:N,Pp);
set(h5,'LineWidth',2)
grid on
title('对固定点k=1点的平滑协方差')
print -dmeta pointP
 
%固定点平滑增益
figure(5)
h6=plot(1:N,B);
set(h6,'LineWidth',2)
grid on
title('固定点平滑增益')
print -dmeta pointB
 
%固定点平滑状态值
figure(6)
h7=plot(1:N,Xp);
title('固定点平滑状态值')
set(h7,'LineWidth',2)
grid on
print -dmeta pointXp

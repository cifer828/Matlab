%求两条直线的交点,两条直线为
% L1: A1(m1,n1),B1(m2,n2)所确定的直线 A1*x+B1*y+C1=0;
% L2: A2(m3,n3),B2(m4,n4)所确定的直线 A2*x+B2*y+C2=0;
% Pt，交点坐标
function Pt=solve_point(p1,p2,p3,p4)
m1=p1(1);n1=p1(2);m2=p2(1);n2=p2(2);m3=p3(1);n3=p3(2);m4=p4(1);n4=p4(2);
A1=n2-n1; B1=m1-m2; C1=m2*n1-m1*n2;
A2=n4-n3; B2=m3-m4; C2=m4*n3-m3*n4;
A=[A1,B1;A2,B2];B=[-C1;-C2];
Pt=(A\B)';

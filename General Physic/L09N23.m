clc; 
%cau 1.3%
clc;
format short;
syms x m
disp ('cau 1.3')
for M = 1.3: 0.1:4.9
    fprintf('===========================\n M= %8.1f \n', M)
    u = [1.0 1.5 2.0 2.5 3 3.2 3.5 4.3 5]
    y = [M 5.7 4 3.5 4 4 5 4.5 4]
g = x;
h = x.^2;
A = zeros (2);B = zeros (2,1);
for i=1:9
    A(1,1)=A(1,1)+subs(g.^2,u(i));
    A(2,2)=A(2,2)+subs(h.^2,u(i));
    A(1,2)=A(1,2)+subs(g.*h,u(i));
    B(1,1)=B(1,1)+y(i)*subs(g,u(i));
    B(2,1)=B(2,1)+y(i)*subs(h,u(i));
end
A(2,1)=A(1,2);
C = inv(A)*B;
A=C(1),B=C(2)
end
pause
%cau 2.6%
clc;
format short;
syms t v m
disp ('cau 2.6')
for M = 1.3: 0.1:4.9
    fprintf('===========================\n M= %8.1f \n', M)
    t=[1 1.2 1.4 1.6 1.8 2 2.2]
    v=[5*M 7*M 9*M 10*M 13*M 15*M 18*M] 
    s =0.2/3*(v(1)+4*v(2)+2*v(3)+4*v(4)+2*v(5)+4*v(6)+v(7))
    
    fprintf('khi quang duong xe di chuyen dc la: %8.4f\n ',200*M)
    fprintf(' thi a = %8.4f\n',(200*M)/(0.2/3)-(v(1)+4*v(2)+2*v(3)+2*v(5)+4*v(6)+v(7)))/4)
     
end
pause
%cau 3.3%
clc;
format short;
syms x m
disp ('cau 3.3')
for M = 1.3: 0.1:4.9
    fprintf('===========================\n M= %8.1f \n', M)
u = [1.0 1.5 2.0 2.5 3 3.2 3.5 4.3 5]
y = [M 5.7 4 3.5 4 4 5 4.5 4]
g = sin (x);
h = -log(x);
A = zeros (2);B = zeros (2,1);
for i=1:9
    A(1,1)=A(1,1)+subs(g.^2,u(i));
    A(2,2)=A(2,2)+subs(h.^2,u(i));
    A(1,2)=A(1,2)+subs(g.*h,u(i));
    B(1,1)=B(1,1)+y(i)*subs(g,u(i));
    B(2,1)=B(2,1)+y(i)*subs(h,u(i));
end
A(2,1)=A(1,2);
C = inv(A)*B;
A=C(1),B=C(2)
end

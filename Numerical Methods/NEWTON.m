clc ;
clear;
close all;
%input t~x  A~y(x)
t = [0	2	4	6	8	10	];
A = [5	7	40	86	90	87	];
%so phan tu N3
n = length(t);
figure('name','Mau','color','white');
plot(t,A,'.r','markersize',20);
xx=linspace(t(1),t(n));
pp=spline(t,A);
yy=ppval(pp,xx);
hold on
plot(t,A);
%so nut n
x=t;
y=A;
F= zeros(n,n);
F(:,1) = y;
	for j=2:n
	    for i=1:n-j+1
	        F(i,j) = (F(i+1,j-1) - F(i,j-1))/(x(i+j-1)-x(i));
	    end
    end 
   F
xt= 1;
xi = input('Gia tri can noi suy la:');
yi=F(1,1);
for j=1:n-1
    xt= xt*(xi-x(j));
    yi= yi+ F(1,j+1)*xt;
end
yi
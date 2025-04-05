clc ;
clear;
close all;
%input t~x  A~y(x)
t = [0	2	4	6	8	10	12	14	16	18	20	22	24	26	28	30	32	34	36	38	40	42	44	46	48	50	52	54	56	58	60];
A = [5	7	40	86	90	87	80	5	10	7	5	50	90	5	8	5	40	85	10	5	15	10	15	7	30	28	28	13	32	20	10];
%so phan tu N
N = length(t);
figure('name','Mau','color','white');
plot(t,A,'.r','markersize',20);
xx=linspace(t(1),t(N));
pp=spline(t,A);
yy=ppval(pp,xx);
xlabel('Thoi gian(s)');
ylabel('CPU usage(%)');
hold on
plot(t,A);
%so nut n
n= N-1;
x=zeros(1,N);
a=zeros(1,N);
%-> a
x=t;
a=A;
h=zeros(1,n);
%tim h
for i= 1:n
    h(i)=x(i+1)- x(i);
end
%ma tran b
matrixB = zeros(1,n);
for i = 1:n-1
    matrixB(i+1)= 3*((a(i+2)- a(i+1))/h(i+1)-(a(i+1)- a(i))/h(i)); 
end
%ma tran a
xl=zeros(1,N);
xl(1)=1;
xz=zeros(1,N);
xu=zeros(1,N);
for i=1:n-1
    xl(i+1)= 2*(x(i+2)-x(i))-h(i)*xu(i);
    xu(i+1)= h(i+1)/xl(i+1);
    xz(i+1)=(matrixB(i+1)-h(i)*xz(i))/xl(i+1);
end
xl(N)=1;
xz(N)=0;

b=zeros(1,N);
c=zeros(1,N);
d=zeros(1,N);
% -> c b d
for i= 0:n-1
    j=n-1-i;
    c(j+1)=xz(j+1)-xu(j+1)*c(j+2);
    b(j+1)=(a(j+2)-a(j+1))/h(j+1) - h(j+1)*(c(j+2)+2*c(j+1))/3;
    d(j+1)=(c(j+2)-c(j+1))/(3*h(j+1));
end
figure('name','Spline3','color','white');
plot(t,A,'.r','markersize',20);
xx=linspace(t(1),t(N));
pp=spline(t,A);
yy=ppval(pp,xx);
xlabel('Thoi gian(s)');
ylabel('CPU usage(%)');
hold on
plot(xx,yy,'-', 'DisplayName','A(t) theo ham noi suy','color', [0.4940 0.1840 0.5560]);

figure('name','SO SANH','color','white');
plot(t,A,'.r','markersize',20);
hold on
plot(t,A);
xx=linspace(t(1),t(N));
pp=spline(t,A);
yy=ppval(pp,xx);
xlabel('Thoi gian(s)');
ylabel('CPU usage(%)');
hold on
plot(xx,yy,'-', 'DisplayName','A(t) theo ham noi suy','color', [0.4940 0.1840 0.5560]);




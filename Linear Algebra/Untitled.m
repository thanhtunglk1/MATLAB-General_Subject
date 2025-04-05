clc;clear;
coverIM = imread('C:\Users\PC\Pictures\Nitro\acer-nitro-stock-3840x2160-14304.png');
x=length(coverIM);
disp('Nhap so lan nen'); nen = input('nen= ');
%figure('name','anh ban dau','color','white');
%imshow(coverIM);
coverIM = rgb2gray(coverIM);
k= log(x)/log(2);
k= ceil(k);
n= 2^k;
XO = imresize(im2double(coverIM),[n n]);
figure('name','anh ban dau','color','white');
imshow(XO);
m= n;
A = zeros(n,n);
Q = eye(n);
while (nen > 0)
 At=A;
 m = m/2;
 nen=nen-1;
 for i =1:m
 At(i,2*i-1) = 1/2; 
 At(i,2*i) = 1/2;
 At(i+m,2*i-1) = 1/2;
 At(i+m,2*i)= -1/2;
 end
 for i = m*2+1:n
 At(i,i) = 1;
 end
 for i =1:2*m
 At(:,i) = At(:,i)/norm(At(:,i));
 end
 Q=At*Q;
end
z= Q*XO*Q';
figure('name','anh nen','color','white');
imshow(z);
imwrite(z,'C:\Users\PC\Pictures\Nitro\output.png');

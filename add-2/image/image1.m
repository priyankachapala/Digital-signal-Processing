close all
clear all
clc
%%

f=imread('girl.png');
% x1=im2double(f);
imshow(f);
%x = imread('girl.png');

for j=1:3
x = f(:,:,j);

[r,c] = size(x);
X = abs(fftshift(fft2(x)));
F = log(X+1); 
%F = mat2gray(X);

sig=20;
sum=0;
%h = ones(M+1,M+1)./((M+1)^2);
for i=1:5
    for j=1:5
        h(i,j)=exp(-(i*i+j*j)/(2*sig*sig))/(2*pi*sig*sig);
        sum=sum+h(i,j);
    end
end
    h=h/sum;

hlpf = h;
H1 = fft2(hlpf);
H =1-H1;

hhpf = ifft2(H);
xlpf = filter2(hlpf,x);
%xlpf =  mat2gray(xlpf);
xhpf = filter2(hhpf,x);
%xhpf =  mat2gray(xhpf);

% figure,imshow(xlpf)
% figure,imshow(xhpf)

[r1,c1] = size(xlpf);
[r2,c2] = size(xhpf);
xlpfd = xlpf([1:2:r1],[1:2:c1]);
xhpfd = xhpf([1:2:r2],[1:2:c2]);
% figure,imshow(xhpfd)
% figure,imshow(xlpfd)

%% ************************************ %%

[r1,c1] = size(xlpfd);
[r2,c2] = size(xhpfd);


xlpfdu=zeros(2*r1,2*c1);
for i=1:2:2*r1
    for j=1:2:2*c1
    xlpfdu(i,j)=xlpfd((i+1)/2,(j+1)/2);
    end
end

xhpfdu=zeros(2*r2,2*c2);
for i=2:2:2*r2
    for j=2:2:2*c2
    xhpfdu(i,j)=xhpfd((i)/2,(j)/2);
    end
end

% figure,imshow(xhpfdu)
% figure,imshow(xlpfdu)

x1 = filter2(xlpfdu,hlpf);
% x1 =  mat2gray(x1);
x2 = filter2(xhpfdu,hhpf);

 y =x1+x2;
 output(:,:,j)=y;
end

figure
imshow(output);
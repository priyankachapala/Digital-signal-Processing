close all
clear all
clc
%%


%[x,fs] = audioread('sample.wav');
x = imread('lena.png');
% x = imread('2.jpg');
x = x(:,:,1);
imshow(x)
[r,c] = size(x);
X = abs(fftshift(fft2(x)));
F = log(X+1); 
F = mat2gray(X);
% figure,imshow(F)
% 
% fc = 200;
% fs = 1000;
% wc = 2*pi*fc/fs;
% M = 6;
% 
% for i = 0:M
%     for j = 0:M
%      if (i==M/2 && j==M/2)
%          h(i+1,j+1) = wc/pi;
%      else
%          h(i+1,j+1) = sin(wc*sqrt((i-M/2)^2+(j-M/2)^2))/(pi*sqrt((i-M/2)^2+(j-M/2)^2));
%      end
%     end
% end
% 
% 
% X = zeros(M+1,M+1);
% for i=0:M
%     for j=0:M
%         w(i+1,j+1) = 0.5+0.5*cos(2*pi*sqrt((i-M/2)^2+(j-M/2)^2)/M);
%     
%     end
% end
%h = h.*w;
M = 6;
h = ones(M+1,M+1)./((M+1)^2);
% for i=0:M
%     for j=0:M
%         w(i+1,j+1) = 0.5+0.5*cos(2*pi*sqrt((i-M/2)^2+(j-M/2)^2)/M);
%     
%     end
% end
hlpf = h;
H1 = fft2(hlpf);
H =1-H1;

hhpf = ifft2(H);
xlpf = filter2(double(hlpf),double(x));
xlpf =  mat2gray(xlpf);
xhpf = filter2(double(hhpf),double(x));
xhpf =  mat2gray(xhpf);

figure,imshow(xlpf)
figure,imshow(xhpf)

[r1,c1] = size(xlpf);
[r2,c2] = size(xhpf);
xlpfd = xlpf([1:2:r1],[1:2:c1]);
xhpfd = xhpf([1:2:r2],[1:2:c2]);
figure,imshow(xhpfd)
figure,imshow(xlpfd)

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

figure,imshow(xhpfdu)
figure,imshow(xlpfdu)

x1 = conv2(xlpfdu,hlpf);
x1 =  mat2gray(x1);
x2 = conv2(xhpfdu,hhpf);

% y =x1+x2;
figure,imshow(x1)
figure,imshow(x2)
% x1 = filter2(hlpf,xlpfdu);
% x1 =  mat2gray(x1);
% x2 = filter2(hhpf,xhpfdu);
% x2 =  mat2gray(x2);
% y =x1+x2;

figure,imshow(y)
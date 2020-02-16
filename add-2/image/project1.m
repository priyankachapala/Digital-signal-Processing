clc 
clear all;
close all;

f=imread('girl.png');
g=im2double(f);
% imshow(f);
%img=rgb2gray(img);
for j=1:3
 img(:,:)=g(:,:,j);
 initial= img(1,:);
for i = 2:size(img,1)
    initial = [initial img(i,:)];
end

 order = 10; 
 n = 0:order;
 h = sin(0.25*pi.*(n-(order/2)))./(pi.*(n-(order/2)));
% h = 0.5.*sin(0.5*pi.*(n-(order/2)))./(0.5*pi.*(n-(order/2)));
 h((order/2)+1) = 0.5;
 hhpf = -h;
 hhpf((order/2)+1) = 1 + hhpf((order/2)+1);

initial_lpf = conv(initial,h);
initial_hpf = conv(initial,hhpf);

initial_lpf(1:(order/2)) = '';
initial_lpf(length(initial)+1:length(initial)+(order/2)) = '';
initial_hpf(1:(order/2)) = '';
initial_hpf(length(initial)+1:length(initial)+(order/2)) = '';

dlpf = 2.*initial_lpf(1:2:length(initial_lpf));
dhpf = 2.*initial_hpf(1:2:length(initial_hpf));

ulpf = zeros(1,2*length(dlpf));
uhpf = zeros(1,2*length(dlpf));

for i=1:length(dlpf);
    ulpf((2*i)-1)=dlpf(i);
    uhpf((2*i)-1)=dhpf(i);
end
sy_lpf = conv(ulpf,h); 
sy_hpf = conv(uhpf,hhpf);
sy_lpf(1:(order/2)) = '';
sy_lpf(length(initial)+1:length(initial)+(order/2)) = '';
sy_hpf(1:(order/2)) = '';
sy_hpf(length(initial)+1:length(initial)+(order/2)) = '';



final = sy_lpf+sy_hpf;
r=size(img,1);
c=size(img,2);
imgr = zeros(size(img));
% for j=1:3
for i = 1:size(img,1)
    imgr(i,:) = final((i-1)*size(img,2)+1:i*size(img,2));
%     imgr(i,:,2) = combined((i-1)*size(img,2)+r*c+1:r*c+i*size(img,2));
%     imgr(i,:,3) = combined((i-1)*size(img,2)+2*r*c+1:2*r*c+i*size(img,2));
%     
end
  imgc(:,:,j)=imgr(:,:);
end
% end
figure, imshow(g);
figure, imshow(imgc);
title('Reconstructed image');
% filterbank_19sept.m
% Displaying filterbank_19sept.m.
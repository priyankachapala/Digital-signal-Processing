% order = 100; 
%  n = 0:order;
%  h = sin(0.5*pi.*(n-(order/2)))./(pi.*(n-(order/2)));
% % h = 0.5.*sin(0.5*pi.*(n-(order/2)))./(0.5*pi.*(n-(order/2)));
%  h((order/2)+1) = 0.5;
%  h2=ftrans2(h);
%  
 
 %% 
 clc 
clear all;
close all;

f=imread('peppers.png');
g=im2double(f);
% imshow(f);
%img=rgb2gray(img);
for j=1:3
 img(:,:)=g(:,:,j);
 [r,c]=size(img);
 order = 50; 
 n = 0:order;
 h = sin(0.5*pi.*(n-(order/2)))./(pi.*(n-(order/2)));
% h = 0.5.*sin(0.5*pi.*(n-(order/2)))./(0.5*pi.*(n-(order/2)));
 h((order/2)+1) = 0.5;
  h2=ftrans2(h);
 hhpf = -h;
 hhpf((order/2)+1) = 1 + hhpf((order/2)+1);
 hhpf2=ftrans2(hhpf);

initial_lpf = filter2(h2,img);
initial_hpf = filter2(hhpf2,img);

% initial_lpf(1:(order/2)) = '';
% initial_lpf(length(initial)+1:length(initial)+(order/2)) = '';
% initial_hpf(1:(order/2)) = '';
% initial_hpf(length(initial)+1:length(initial)+(order/2)) = '';

dlpf = 2.*initial_lpf(1:2:r,1:2:c);
dhpf = 2.*initial_hpf(1:2:r,1:2:c);

ulpf = zeros(r,c);
uhpf = zeros(r,c);

for i = 1:r/2
    for j = 1:c/2
        ulpf(2*i,2*j) = dlpf(i,j);
        ulpf(2*i-1,2*j-1) = dlpf(i,j);
        uhpf(2*i,2*j) = dhpf(i,j);
        uhpf(2*i-1,2*j-1) = dhpf(i,j);
    end
end

sy_lpf = filter2(h2,ulpf); 
sy_hpf =filter2(hhpf2,uhpf);
% sy_lpf(1:(order/2)) = '';
% sy_lpf(length(initial)+1:length(initial)+(order/2)) = '';
% sy_hpf(1:(order/2)) = '';
% sy_hpf(length(initial)+1:length(initial)+(order/2)) = '';



final1 = sy_lpf+sy_hpf;


imgc(:,:,j)=final1;

end

figure, imshow(g);
figure, imshow(imgc);
title('Reconstructed image');

 
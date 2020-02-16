close all;
clear all;
fs = 8000;
ws = 1600*2*pi/fs;
wp = 1400*2*pi/fs;
wc = 0.5*(wp+ws);
h = zeros(21,21);
for i = 1:21
    for j= 1:21
        h(i,j) = (wc/pi).*sin(wc.*(sqrt(((i-11)^2)+((j-11)^2))))./(wc.*(sqrt(((i-11)^2)+((j-11)^2))));
    end
end
h(11,11) = wc/pi;
hhpf = -h;
hhpf(11,11) = hhpf(11,11)+ 1;
%surf(h);
ai = imread('lena.png');
a = rgb2gray(ai);
alpf = conv2(double(a)/255,h);
ahpf = conv2(double(a)/255,hhpf);
figure,subplot(311),imshow(a), title('original Image');
subplot(312),imshow(alpf), title('Image after 1st LPF');
subplot(313),imshow(ahpf), title('Image after 1st HPF');
%%
blpf = 2*alpf(1:2:size(alpf,1),1:2:size(alpf,2));
bhpf = 2*ahpf(1:2:size(ahpf,1),1:2:size(ahpf,2));
figure,
subplot(211),imshow(blpf), title('after downsampling');
subplot(212),imshow(bhpf), title('after downsampling');
%%
clpf = zeros(nearest(2*size(blpf,1)),nearest(2*size(blpf,2)));
chpf = zeros(nearest(2*size(blpf,1)),nearest(2*size(blpf,2)));
%%
for i=1:size(blpf,1)
    for j = 1:size(blpf,2)
        clpf(2*i-1,2*j-1) = blpf(i,j);
        chpf(2*i-1,2*j-1) = bhpf(i,j);
    end
end
figure,
subplot(211),imshow(clpf), title('after upsampling');
subplot(212),imshow(chpf), title('after upsampling');
%%
dlpf = conv2(clpf,h);
dhpf = conv2(chpf,hhpf);
figure,
subplot(211),imshow(dlpf), title('After 2nd LPF');
subplot(212),imshow(dhpf), title('After 2nd HPF');
%%
figure, imshow(dlpf+dhpf), title('reconstructed');
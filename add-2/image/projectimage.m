close all, clear all;
fs = 8000;
ws = 1700*2*pi/fs;
wp = 1500*2*pi/fs;
wc = 0.5*(wp+ws);
n = [0:100];
h = (wc/pi)*sin(wc*(n-50))/(wc*(n-50));
h(51) = wc/pi;
figure, stem(h),title('Impulse Response LPF(a)');
xlabel('n'),ylabel('h[n]');

hpf = -h;
hpf(51) = 1 + hpf(51);
figure, stem(hpf),title('Impulse Response HPF(a)');
xlabel('n'),ylabel('hpf[n]');

a = imread('lena.png');
a=rgb2gray(a);
a=im2double(a);
%a(2, :) = [];
figure;
imshow(a);
title('Original');
b=[];

for i=1:1:186
    b=a(i,:);
    lpf_op1(i,:) = conv(b,h);
    hpf_op1(i,:)= conv(b,hpf);
end
figure(11);
imshow(lpf_op1);
title('LPF(a)');
figure(12);
imshow(hpf_op1);
title('HPF(a)');
for i=1:1:186
    lpf_op2(i,:) = downsample(lpf_op1(i,:),2);
    hpf_op2(i,:) = downsample(hpf_op1(i,:),2);
end
figure(13);
imshow(lpf_op2);
title('Downsample LPF(a)');
figure(14);
imshow(hpf_op2);
title('Downsample HPF(a)');
for i=1:1:186
    lpf_op3(i,:) = upsample(lpf_op2(i,:),2);
    hpf_op3(i,:) = upsample(hpf_op2(i,:),2);
end
figure(15);
imshow(lpf_op3);
title('Upsample LPF(a)');
figure(16);
imshow(hpf_op3);
title('Upsample HPF(a)');
for i=1:1:186
    b=a(i,:);
    dlpf(i,:) = conv(lpf_op3(i,:),h);
    dhpf(i,:) = conv(hpf_op3(i,:),hpf);
end
figure(17);
imshow(dlpf);
title('Synthesis LPF(a)');
figure(18);
imshow(dhpf);
title('Synthesis HPF(a)');
combined = dlpf+dhpf;
figure;
imshow(combined);
title('Reconstructed');
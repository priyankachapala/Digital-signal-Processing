a=imread('lena.png');
figure;
imshow(a);
ared=a(:,:,1);
agreen=a(:,:,2);
ablue=a(:,:,3);
agrayscale=rgb2gray(a);
x=agrayscale;
% figure;
% stem(abs(fft(x)));
% title('input');
% xlabel('n');
% ylabel('x[n]');
fs = 5000;
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
h2 = -h;
h2(11,11) = h2(11,11)+ 1;
ylpf = conv2(double(a)/255,h);
yhpf = conv2(double(a)/255,h2);
f1=downsample(ylpf,2);  %downsampled by 2
f2=upsample(f1,2);      %upsampled by 2


% figure;
% stem(abs(fft(y1)));


f3=downsample(yhpf,2);   %downsampled by 2  
f4=upsample(f3,2);     %upsampled by 2
y3=conv2(f4,hw1);   %HPF out

res=y1+y3;  
% figure;
% stem(abs(fft(res)));
% title('Recovered signal');
% xlabel('n');
% ylabel('y[n]');
% sound(res,Fs);
figure
imshow(res);

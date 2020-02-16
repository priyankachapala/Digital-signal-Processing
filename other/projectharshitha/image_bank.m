close all;
a = imread('check.jpg');
a = rgb2gray(a);
a = im2double(a);
%%
[r,c] = size(a);
t = ones(r/4,c/4);
o = zeros(r/4,c/4);
m1 = [o o o o; o t t o;o t t o; o o o o];
m2 = [o t t o; o o o o; o o o o; o t t o];
m3 = [o o o o;t o o t;t o o t; o o o o];
m4 = [t o o t; o o o o; o o o o; t o o t];

imshow(a), title('original image');
figure, imshow(m1), title('mask 1');
figure, imshow(m2), title('mask 2');
figure, imshow(m3), title('mask 3');
figure, imshow(m4), title('mask 4');
%% filtering
a1 = ifft2(fft2(a).*m4);
a2 = ifft2(fft2(a).*m3);
a3 = ifft2(fft2(a).*m2);
a4 = ifft2(fft2(a).*m1);
figure, imshow(a1), title('mask 1');
figure, imshow(a2), title('mask 2');
figure, imshow(a3), title('mask 3');
figure, imshow(a4), title('mask 4');
%% downsampling
a1d = 4.*a1(1:2:r,1:2:c);
a2d = 4.*a2(1:2:r,1:2:c);
a3d = 4.*a3(1:2:r,1:2:c);
a4d = 4.*a4(1:2:r,1:2:c);
figure, imshow(a1d), title('channel 1');
figure, imshow(a2d), title('channel 2');
figure, imshow(a3d), title('chennel 3');
figure, imshow(a4d), title('chennel 4');
%% upsampling
a1u = zeros(r,c);
a2u = zeros(r,c);
a3u = zeros(r,c);
a4u = zeros(r,c);
for i = 1:r/2
    for j = 1:c/2
        a1u(2*i,2*j) = a1d(i,j);
        a2u(2*i,2*j) = a2d(i,j);
        a3u(2*i,2*j) = a3d(i,j);
        a4u(2*i,2*j) = a4d(i,j);
    end
end
figure, imshow(a1u), title('channel 1');
figure, imshow(a2u), title('channel 2');
figure, imshow(a3u), title('chennel 3');
figure, imshow(a4u), title('chennel 4');
%% filtering
a1r = ifft2(fft2(a1u).*m4);
a2r = ifft2(fft2(a2u).*m3);
a3r = ifft2(fft2(a3u).*m2);
a4r = ifft2(fft2(a4u).*m1);
figure, imshow(a1r), title('mask 1');
figure, imshow(a2r), title('mask 2');
figure, imshow(a3r), title('mask 3');
figure, imshow(a4r), title('mask 4');
%% combining
res = a1r+a2r+a3r+a4r;
figure, imshow(res), title('reconstructed');
a=imread('lena.png');
agrayscale=rgb2gray(a);
figure;
% imshow(a);
% ared=a(:,:,1);
% agreen=a(:,:,2);
% ablue=a(:,:,3);
% recovereda=cat(3,ared,agreen,ablue);
% figure;
% imshow(recovereda);

imhist(agrayscale);
b=[1,2,3,4,5];
b(1:3)='';
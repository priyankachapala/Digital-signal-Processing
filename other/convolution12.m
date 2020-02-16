clc;
clear all;
close all;
x=[1 2 3 4];
h=[5 6 7 8];
display('convolution using function');
display(convolution(x,h));
subplot(2,1,1),stem(convolution(x,h)),
title('using fn'),
xlabel('n'),
ylabel('y[n]');
display('convolution using inbuilt function');
display(conv(x,h));
subplot(2,1,2),stem(conv(x,h)),
title('using inbuilt fn'),
xlabel('n'),
ylabel('y[n]');
%% 
n = -15:15;
step = (n>=0);
h = [1 2 3 4];
y=convolution(step,h);
figure;
stem((-15:18),y),
ylim([0,12])
%% 
x=(1:51);
h=[4 3 2 1];
L =3;
l =length(x);
m=length(h);
res = zeros(1,l+m-1);
for i=1:l/L
    xtemp = x((i-1)*L+1:i*L);
    ytemp = convolution(xtemp,h);
    res((i-1)*L+1:i*L+m-1)=res((i-1)*L+1:i*L+m-1)+ytemp;
end
subplot(2,1,1),stem(res),
title('overload'),xlabel('n'),ylabel('x[n]');
subplot(2,1,2),stem(conv(x,h)),
title('inbuilt'),xlabel('n'),ylabel('x[n]');
%% 
x=(1:41);
h=[4 3 2 1];
L=3;
l=length(x);
m=length(h);
x1=[zeros(1,m-1),x];
res1=zeros(1,l+m-1);
for i=1:l/L
    
    xtemp=x1((i-1)*L+1:i*L+m-1);
    ytemp=convolution(xtemp,h);
    res1((i-1)*L+1:i*L+m-1)=res1((i-1)*L+1:i*L+m-1)+ytemp(m:m+l-1);
    if i==l/L
        res1((i)*L+1:i*L+m-1)=res1((i)*L+1:i*L+m-1)+ytemp(l+m:2*m+l-2);
    end
end
 subplot(2,1,1),stem(res1),
title('overload'),xlabel('n'),ylabel('x[n]');
subplot(2,1,2),stem(conv(x,h)),
title('inbuilt'),xlabel('n'),ylabel('x[n]');
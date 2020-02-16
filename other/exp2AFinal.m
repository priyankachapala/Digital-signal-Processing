clc
clear all
close all
x=[1 1 1 1];
h=[1 2 3 4 ];
lx=length(x);
lh=length(h);
X=[x,zeros(1,lh)];
H=[h,zeros(1,lx)];
y=zeros(1,lx+lh-1);
for i=1:1:lx+lh-1; y(i)=0;
    for j=1:1:i
        y(i)=y(i)+X(j)*H(i-j+1);
        
    end
end
y
stem(y);xlabel('samples(n)');ylabel('amp');title('convolution between x[n]=[1111] and h[n]=[1234]')


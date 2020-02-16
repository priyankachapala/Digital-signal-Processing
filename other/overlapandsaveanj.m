%Overlap and save
clc;
clear var;
x=(1:49);
h=[4 3 2 1];
N=10;
m=length(h);
l=N-(m-1);
y=zeros(1,length(h)+length(x)-1);
pre=zeros(1,m-1);
for i=1:(length(x))/l
xb=[pre,x((i-1)*l+1:l*i)];
yb=conv(xb,h);
y((i-1)*l+1:l*i)=yb(m:m+l-1);
pre=xb(l+m-1-(m-1)+1:l+m-1);
end
n=length(xb)+length(h)-1;
y(length(x)+1:length(x)+m-1)=yb(n-(m-1)+1:n);
w=conv(x,h);
figure;
subplot(211), stem(y)
title('Block convolution-overlap save method')
xlabel('n');
ylabel('x(n)');
subplot(212), stem(w)
title('convolution using inbuilt function')
xlabel('n');
ylabel('x(n)');


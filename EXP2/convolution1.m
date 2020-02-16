function [y]=convolution1(x,h)
l=length(x);
m=length(h);
x=[x zeros(1,m-1)];
h=[h zeros(1,l-1)];
y=zeros(l+m-1);
for i=1:l+m-1
    for j=1:m
        if(i-j+1>0)
            y(i)=y(i)+h(j)*x(i-j+1);
        else
        end
    end
end


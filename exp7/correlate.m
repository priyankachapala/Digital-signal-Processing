function res = correlate(x,y)
l = length(x);
m = length(y);
y = y(m:-1:1);
x = [x,zeros(1,m-1)];
res = zeros(1,l+m-1);
for i = 1:m-1
    for j = 1:i
        res(i) = res(i) + y(j)*x(i-j+1);
    end
end
for i= m:l+m-1
    for j = 1:m
        res(i) = res(i) + y(j)*x(i-j+1);
    end
end
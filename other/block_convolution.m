close all
x = nearest(rand(1,24)*10);
h = [1,2,-1,1];
L = 8;
M = 4;
res = zeros(1,length(x)+M-1);
for i = 1: length(x)/L
    xtemp = x(((i-1)*L+1):i*L);
    ytemp = convolution(xtemp,h);
    res(((i-1)*L+1):(i*L)+M-1) = res(((i-1)*L+1):(i*L)+M-1) + ytemp;
end
subplot(211), stem(res)
title('result: overlap and add')
subplot(212), stem(conv(x,h))
title('result using inbuilt linear convolution')
fprintf('result')
disp(res);
fprintf('\n\nverifying')
disp(res-conv(x,h))
%%
%overlap and save
x1 = [zeros(1,M-1),x];
res1 = zeros(1,length(x)+M-1)
for i = 1:length(x)/L
    i
    xtemp = x1((i-1)*L+1: i*L+M-1);
    ytemp = convolution(xtemp,h);
    res1(((i-1)*L+1):i*L) = res1((i-1)*L+1:i*L) + ytemp(M:M+L-1)
    if i == length(x)/L
        res1(i*L+1:i*L+M-1) = res1(i*L+1:i*L+M-1)+ ytemp(L+M:2*M+L-2)
    end
end
figure,subplot(211)
stem(res1)
title('result: overlap and save')
subplot(212),stem(conv(x,h))
title('without block convolution')




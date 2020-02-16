%% overlap and add method

x=(1:51);
h=[4 3 2 1];
L=3;
y=0;
M=length(h);
res = zeros(1,length(x)+M-1);
for v = 1: length(x)/L
    xtemp = x(((v-1)*L+1):v*L);
    ytemp = convolution(xtemp,h);
    res(((v-1)*L+1):(v*L)+M-1) = res(((v-1)*L+1):(v*L)+M-1) + ytemp;
end
subplot(211), stem(res)
title('Block convolution-overlap add method')
xlabel('n');
ylabel('x(n)');
subplot(212), stem(conv(x,h))
title('convolution using inbuilt function')
xlabel('n');
ylabel('x(n)');
fprintf('result')
disp(res);
%% overlap and save


    
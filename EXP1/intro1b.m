close all
clear all

x=rand(1,100);

y=4*x-2;
figure

stem(y);
title('uniformly distributed');
ylabel('uniform between -2 and 2');

%% 1 b-b
x=randn(1,75);
y=sqrt(3/var(x)).*x;
figure

stem(y);
title('1 b-b');
ylabel('gaussian with variance 3');


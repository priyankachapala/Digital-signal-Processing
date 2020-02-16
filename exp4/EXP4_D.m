close all;
clear all;
nu=[0 1];
d=[3 -4 0 1];
[x n]=impz(nu,d,10);
figure
subplot(211);
stem((0:9),x);
title('First 10 samples of inv(X(z))');
xlabel('n');
ylabel('x[n]'); 

%residuez
[r,p,k]=residuez(nu,d);
l=length(r);
for n=0:9
    for v=1:l
        x(n+1)=x(n+1)+r(v)*power(p(v),n);
    end
end
subplot(212);
stem((0:9),x);
title('First 10 samples of closed form expression of x[n]');
xlabel('n');
ylabel('x[n]');



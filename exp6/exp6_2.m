close all
clear all
clc

F = 8000; 
fp = 1000; 
fs = 2000;
T = 1;

dp = -0.5; 
ds = -30;

wp = 2*pi*fp/F;
ws = 2*pi*fs/F;

op = wp/T; 
os = ws/T;

ap = 1/(10^(dp/10));
as = 1/(10^(ds/10));

eps = ap-1;
asqr = as;

N = ceil(abs(acosh(sqrt((asqr-1)/eps))/acosh(op/os)));

for q = 1: N
    alpha(q) = (2*q-1)*pi/(2*N);
    beta(q) = (1/N)*asinh(1/sqrt(eps));
    c(q) = 1i*cos(alpha(q)-(1i*beta(q)));
end

k1 = ((-1)^N)*prod(c)*sqrt(1/(1+eps));
z = [];

[b,a] = zp2tf(z,c,k1);
[r1,p1,k] = residue(b,a);

for q = 1: N
    p(q) = exp(T*p1(q));
end

for n = 1:100
    for q = 1: N
        s(q) = r1(q)*(p(q)^n);
    end
    y(n) = sum(s);
end
freqz(y);
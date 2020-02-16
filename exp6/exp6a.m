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

op = wp/T; os = ws/T;
ap = 1/(10^(dp/10));
as = 1/(10^(ds/10));    

N = ceil(0.5*(log10(ap-1)-log10(as-1))/(log10(op)-log10(os)));                                                                                                                                          
oc=op/((ap-1)^(1/(2*N)));

for q = 1: N
    c(q) = oc*exp(1i*(pi*((2*q)-1+N))/(2*N));
end

k = ((-1)^N)*prod(c);
z = [];
[b,a] = zp2tf(z,c,k);
[r,p1,k] = residue(b,a);

for q = 1: N
    p(q) = exp(T*p1(q));
end

for n = 1:100
    for q = 1: N
        s(q) = r(q)*(p(q)^n);
    end
    y(n) = sum(s); 
end

freqz(y);
fvtool(y);
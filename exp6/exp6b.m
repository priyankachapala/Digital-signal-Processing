close all
clear all
clc

F = 8000; 
fp = 1000; 
fs = 2000;
T = 1/F;

dp = -0.5;
ds = -30;
wp = 2*pi*fp/F;
ws = 2*pi*fs/F;
ap = 1/(10^(dp/10));
as = 1/(10^(ds/10));
op = (2/T)*tan(wp/2); 
os = (2/T)*tan(ws/2);

N = ceil(0.5*(log10(ap-1)-log10(as-1))/(log10(op)-log10(os)));
oc=os/((as-1)^(1/(2*N)));
for q = 1: N	
    c(q) = oc*exp(1i*(pi*((2*q)-1+N))/(2*N));
end

k = ((-1)^N)*prod(c);
z = [];
[b,a] = zp2tf(z,c,k);
sys = tf(b,a);
[zd,pd,kd] = bilinear(z,c',k,F);
[bd,ad] = zp2tf(zd,pd,kd);
[rd,ps,kd] = residuez(bd,ad);

for n = 1:100
    for q = 1: N
        s(q) = rd(q)*(ps(q)^n);
    end
    y(n) = sum(s);
end

freqz(y);    
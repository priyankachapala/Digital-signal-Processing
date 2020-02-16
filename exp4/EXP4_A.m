clear all
close all
n=[2 5 9 5 3];
d=[5 45 2 1 1];
[z,p,k]=tf2zp(n,d);
disp('Zeros are at');disp(z);
disp('poles are at');disp(p);
disp('Gain factor is');disp(k);
zplane(n,d);
[sos,g]=tf2sos(n,d);
disp('second order sos form');disp(real(sos));



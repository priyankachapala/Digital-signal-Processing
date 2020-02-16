close all;
clear all;
z=[0.3;2.5; -0.2+j*0.4;-0.2-j*0.4];
p=[0.5;-0.75;0.6+j*0.7;0.6-j*0.7];
k=3.9;
[n,d]=zp2tf(z,p,k);
disp('numerator coefficients');disp(n);
disp('denominator coefficients');disp(d);

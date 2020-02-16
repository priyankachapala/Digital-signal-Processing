close all
clear
clc

%LOW PASS
 
wp_low=0.6*pi;
ws_low=0.8*pi;
M_low=(12*pi)/(ws_low-wp_low);
N_low=M_low+1;
w_low=blackman(N_low);
wc_low=(wp_low+ws_low)/2;
n0=M_low/2;
for n=1:N_low
h_ideallow(n)=sin(wc_low*(n-n0))/(pi*(n-n0));
end
h_ideallow(M_low/2)=(wc_low/pi);
h_designed_low=h_ideallow.*w_low';
 
 
%HIGH PASS
 
wp_high=0.4*pi;
ws_high=0.15*pi;
M_high=(12*pi)/(wp_high-ws_high);
N_high=M_high+1;
w_high=blackman(N_high);
wc_high=(wp_high+ws_high)/2;
n0=M_high/2;
for n=1:N_high
h_idealhigh(n)=-sin(wc_high*(n-n0))/(pi*(n-n0));
end
h_idealhigh(M_high/2)=1-(wc_high/pi);
h_designed_high=h_idealhigh.*w_high';
 
% BAND PASS
 
h_bpf=conv(h_designed_low,h_designed_high);
fvtool(h_bpf);

close all, clear all;
fs = 8000;
ws = 1150*2*pi/fs;
wp = 1000*2*pi/fs;
wc = 0.5*(wp+ws);
tb=(ws-wp)/2; %transition bandwidth
N=(8*pi)/tb;
N=ceil(N);
h=zeros(1,N);
for n=1:N
    h(n)=sin(wc*(n-ceil(N/2)))/(pi*(n-ceil(N/2))); %impulse response of LPF
end
h(ceil(N/2))=wc/pi;

n=1:N;
for i=1:N
    w(i)=0.54-0.46*cos(2*pi.*i/(N-1)); %Hamming window
end
hw=(h.*w); %windowing
figure
stem(hw);
xlabel('n');
ylabel('h[n]');
title('Impulse response of low pass filter after windowing');

fvtool(hw);




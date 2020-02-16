close all, clear all;
fs = 8000;
ws = 1100*2*pi/fs;
wp = 1000*2*pi/fs;
wc = 0.5*(wp+ws);
tb=(ws-wp)/2;
N=(8*pi)/tb;
N=ceil(N);
h=zeros(1,N);
for n=1:N
    h(n)=sin(wc*(n-ceil(N/2)))/(pi*(n-ceil(N/2)));
end
h(ceil(N/2))=wc/pi;

n=1:N;
for ii=1:N
    w(ii)=0.54-0.46*cos(2*pi.*ii/(N-1));
end
hw=(h.*w);
freqz(hw);



fpass=1000;
fstop=1500;
fs=8000;
d1=0.9;
d2=50;
w=(fpass+fstop)*2*pi/(2*fs);
tb=((fstop-fpass)*2*pi)/fs;
N=(8*pi)/tb;
h=zeros(1,N);
for n=1:N
    h(n)=sin(w*(n-ceil(N/2)))/(pi*(n-ceil(N/2)));
end
h(ceil(N/2))=w/pi;
figure
stem(h);
xlabel('n');
ylabel('h[n]');
title('low pass filter impulse response without windowing');
fvtool(h);
hold on
title('LPF without windowing');
n=1:N;
for ii=1:N
    w(ii)=0.54-0.46*(1-cos((2*pi*ii)/(N-1)));
end
hw=(h.*w);
figure
stem(hw);
xlabel('n');
ylabel('h[n]');
title('Impulse Response of LPF after windowing');
fvtool(hw);
hold on
title('LPF after windowing');
close all, clear all;
fs = 8000;
ws = 1500*2*pi/fs;
wp = 1000*2*pi/fs;
wc = 0.5*(wp+ws);
n = [0:1024];
h = (wc/pi).*sin(wc.*(n-512))./(wc.*(n-512));
h(513) = wc/pi;
w = 0.54-0.46*cos(2*pi.*n/1024);%hamming window
h = h.*w;
figure, stem(h),title('Impulse Response');
xlabel('n'),ylabel('h[n]');
f = fs/1000;
f = f.*[-500:500];
figure, subplot(211), plot(f,20.*log10(abs(fftshift(fft(h,1001)))));
title('Magnitude response');
xlabel('f'),ylabel('|H(jw)|');
subplot(212), plot(f,unwrap(angle(fftshift(fft(h,1001)))));
title('Phase response');
xlabel('f'),ylabel('Phase(H(jw))');
%fvtool(h)
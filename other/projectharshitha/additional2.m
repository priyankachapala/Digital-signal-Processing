close all, clear all;
fs = 8000;
ws = 2100*2*pi/fs;
wp = 1900*2*pi/fs;
wc = 0.5*(wp+ws);
n = [0:240];
h = (wc/pi).*sin(wc.*(n-120))./(wc.*(n-120));
h(121) = wc/pi;
w = blackman(241)';
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
%%
hhpf = -h;
hhpf(121) = 1 + hhpf(121);
figure, subplot(211), plot(f,20.*log10(abs(fftshift(fft(hhpf,1001)))));
title('Magnitude response');
xlabel('f'),ylabel('|H(jw)|');
subplot(212), plot(f,unwrap(angle(fftshift(fft(hhpf,1001)))));
title('Phase response');
xlabel('f'),ylabel('Phase(H(jw))');
%%
a = audioread('audio.wav')';
alpf = conv(a,h);
ahpf = conv(a,hhpf);
figure, plot(alpf(1:8000));
figure, plot(ahpf(1:8000));
figure, subplot(311), plot(abs(fftshift(fft(a))));
subplot(312), plot(abs(fftshift(fft(alpf))));
subplot(313), plot(abs(fftshift(fft(ahpf))));
%% downsampling
blpf = 2.*alpf(1:2:length(alpf));
bhpf = 2.*ahpf(1:2:length(ahpf));
figure, subplot(211),plot(fftshift(abs(fft(blpf))));
subplot(212),plot(fftshift(abs(fft(bhpf))));
%% upsampling
clpf = zeros(1,2*length(blpf));
chpf = zeros(1,2*length(blpf));
for i=1:length(blpf);
    clpf((2*i)-1)=blpf(i);
    chpf((2*i)-1)=bhpf(i);
end
figure,subplot(211), plot(abs(fftshift(fft(clpf))));
subplot(212), plot(abs(fftshift(fft(chpf))));
%% synthesis
dlpf = conv(clpf,h);
dhpf = conv(chpf,hhpf);
figure, subplot(211),plot(abs(fftshift(fft(dlpf))));
 subplot(212),plot(abs(fftshift(fft(dhpf))));
%%
combined = dlpf+dhpf;
combined(1:480) = '';
figure,subplot(211), plot(abs(fftshift(fft(combined))));
title('reconstructed');
subplot(212), plot(abs(fftshift(fft(a))));
title('original');
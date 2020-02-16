clc;
clear all;
close all;
fpass=1000;%pass band frequency
fstop=1100;%stop band frequency
fs=8000;%sampling frequency
d1=0.9;
d2=50;
w = (fpass+fstop)*2*pi/(2*fs); %cutoff frequency 
tb=((fstop-fpass)*2*pi)/fs;%transition bandwidth
 N=(8*pi)/tb;%order of filter from main lobe width of window
% N=300;
h=zeros(1,N) ;
 
for n = 1:N 
    h(n) = sin(w*(n - ceil(N/2)))/(pi*(n - ceil(N/2))); %impulse response of ideal low pass filter(delayed)
end



h(ceil(N/2)) = w/pi;
figure
stem(h);
xlabel('n');
ylabel('h(n)');
title('Low pass filter impulse response without windowing');


 
n=1:N;
for ii=1:N
w(ii)=0.54-0.46*(cos((2*pi*ii)/(N)));%Hamming window
%  w(ii)=0.42-0.5*cos((2*pi*ii)/N)+0.08*cos((4*pi*ii)/N);
end
hw = (h.*w); %windowing the impulse response
figure
stem(hw);
xlabel('n');
ylabel('h[n]');
title('Impulse response of low pass filter after windowing');

hfft=fft(hw,1024);
x=-0.5:1/(length(hfft)-1):0.5;
figure,
% subplot(211),
plot(2*x,(abs(fftshift(fft(hw,1024)))));
xlabel('Normalised Frequency');
ylabel('Magnitude');
title('Ideal LPF');
grid on;

figure
% subplot(212),
plot(2*x,20*log10(abs(fftshift(fft(hw,1024)))));
xlabel('Normalised Frequency');
ylabel('Magnitude (dB)');
title('Ideal LPF');
grid on;








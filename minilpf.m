clc;
clear all;
close all;
fpass=1350;%pass band frequency
fstop=1400;%stop band frequency
fs=8000;%sampling frequency
w = (fpass+fstop)*2*pi/(2*fs); %cutoff frequency
tb= ((fstop-fpass)*2*pi)/(2*fs);
d1 = 10^(-6/20);
d2 = 10^(-80/20);
N= 8*pi/tb;
N= ceil(N);
h=zeros(1,N) ;
for n = 1:N 
    if(n == N/2)
        
h((N/2)) = w/pi;
    else
    h(n) = (w/pi)*sin(w*(n - (N/2)))/(w*(n -(N/2))); %impulse response of ideal low pass filter(delayed)
    end
end

for ii=1:N
w(ii)=0.54-0.46*(cos((2*pi*ii)/(N-1)));%Hamming window
end
hw = (h.*w); %windowing the impulse response
figure, stem(h),title('Impulse Response');
xlabel('n'),ylabel('h[n]');

figure, subplot(211), plot(20.*log10(abs(fft(h))));
title('Magnitude response');
xlabel('f'),ylabel('|H(jw)|');
subplot(212), plot(unwrap(angle(fft(h))));
title('Phase response');
xlabel('f'),ylabel('Phase(H(jw))');
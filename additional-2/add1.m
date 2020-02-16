x=[-2 -2 -2 0 1 1 2 3 3 -2 -2 -3 -3];
subplot(311),stem((1:1:length(x)),x);
title('original sequence');
xlabel('n'),ylabel('x[n]');

x1 = x(1:3:length(x));
subplot(312),stem(x1);
title('down-sampled sequence');
xlabel('n'),ylabel('x[3n]');
x2 = x(1);
for i=2:length(x)
    x2 = [x2, 0 x(i)];
end
subplot(313),stem((1:1:length(x2)),x2);
title('up-sampled sequence');
xlabel('n'),ylabel('x[n/2]');

% 
% f = fftshift(fft(x));
% f1 = fftshift(fft(x1));
% f2 = fftshift(fft(x2);
figure
freqz(x);
title('fourier transform of original sequence');
figure
freqz(x1);
title('fourier transform of down-sampled sequence');
figure
freqz(x2);
title('fourier transform of up-sampled sequence');
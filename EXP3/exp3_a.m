close all;
clear all;
x=[1 2 3 7 8];
N=length(x);
X=dft(x,N);

figure;
subplot(221),
stem((0:N-1),x);
xlabel('n');
ylabel('x[n]');
title('Input sequence in time domain');

subplot(222), 
stem((0:N-1),abs(X));
xlabel('k');
ylabel('|X[k]|');
title('Magnitude Response in frequency domain');
 
subplot(224),
stem((0:N-1),angle(X));
xlabel('k');
ylabel('Phase');
title('Phase response in frequency domain');

x1=idft(X,N);
subplot(223),
stem((0:N-1),x1);
xlabel('n');
ylabel('x1[n]');
title('Recovered Input sequence in time domain');





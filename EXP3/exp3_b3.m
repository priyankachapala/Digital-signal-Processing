close all;
clear all;

%unit impulse

x=[zeros(1,10),1,zeros(1,10)];
x_zeropadded=[zeros(1,20),1,zeros(1,20)];

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

x0=idft(X,N);
subplot(223),
stem((0:N-1),x0);
xlabel('n');
ylabel('x1[n]');
title('Recovered Input sequence in time domain');


N1=length(x_zeropadded);
X1=dft(x_zeropadded,N1);

figure;
subplot(221),
stem((0:N1-1),x_zeropadded);
xlabel('n');
ylabel('x[n]');
title('Zer padded Input sequence in time domain');

subplot(222), 
stem((0:N1-1),abs(X1));
xlabel('k');
ylabel('|X[k]|');
title('Magnitude Response in frequency domain');
 
subplot(224),
stem((0:N1-1),angle(X1));
xlabel('k');
ylabel('Phase');
title('Phase response in frequency domain');

x1=idft(X1,N1);
subplot(223),
stem((0:N1-1),x1);
xlabel('n');
ylabel('x1[n]');
title('Recovered Input sequence in time domain from zero padded input');





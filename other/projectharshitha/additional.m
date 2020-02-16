close all
clear all

f = [2;3;5;7];
x = sum(sin(2*pi.*f*[0:0.02:2]));
subplot(311),stem(x);
title('original sequence');
xlabel('n'),ylabel('x[n]');
x1 = x(1:3:length(x));
subplot(312),stem(x1);
title('down-sampled sequence');
xlabel('n'),ylabel('x[3n]');
x2 = x(1);
for i=2:length(x)
    x2 = [x2, 0 0 x(i)];
end
subplot(313),stem(x2);
title('up-sampled sequence');
xlabel('n'),ylabel('x[n/3]');

f = fftshift(fft(x));
f1 = fftshift(fft(x1));
f2 = fftshift(fft(x2));

figure
subplot(231),plot(abs(f));
title('magnitude spectrum');
xlabel('-k mod 100'),ylabel('X[k]');
subplot(234),plot(angle(f));
title('phase spectrum');
xlabel('-k mod 100'),ylabel('phase(X[k])');

subplot(232),plot(abs(f1));
title('magnitude spectrum');
xlabel('-k mod 100'),ylabel('X_{1}[k]');
subplot(235),plot(angle(f1));
title('phase spectrum');
xlabel('-k mod 100'),ylabel('phase(X_{1}[k])');

subplot(233),plot(abs(f2));
title('magnitude spectrum');
xlabel('-k mod 100'),ylabel('X_{2}[k]');
subplot(236),plot(angle(f2));
title('phase spectrum');
xlabel('-k mod 100'),ylabel('phase(X_{2}[k])');


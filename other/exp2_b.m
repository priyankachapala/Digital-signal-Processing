h = [1,2,3,4];
n = -30:30
step = n>=0;
res = convolution(step,h);
figure,subplot(211),stem(n,step),
ylabel('u[n]')
subplot(212),stem([-30:33],res)
title('step response')
ylabel('u[n]*h[n]')
ylim([0,12])
%%
rect = step - n>=10
res = convolution(rect,h);
figure,subplot(211),stem(rect)
ylabel('x[n]')
subplot(212),stem(res)
title('response to rectangular pulse')
ylabel('x[n]*h[n]')
%%
ex = 0.8.*exp(-1.2*[0:50]);
res = convolution(ex,h);
figure,subplot(211),stem(ex)
ylabel('x[n]')
subplot(212),stem(res)
title('response to exponential signal')
ylabel('x[n]*h[n]')
ylim([0,6])
%%
s = sin(2*pi.*n/7);
res = convolution(s,h)
figure,subplot(211),stem(s)
ylabel('x[n]')
subplot(212),stem(res)
title('response to sinusoidal signal')
ylabel('x[n]*h[n]')
ylim([-7,7])
%%step response
n=-15:15;
step=(n>=0);
h=[1 2 3 4];
StepResponse=convolution(step,h);
figure,subplot(211),stem(n,step),
ylabel('u[n]'),xlabel('n');
subplot(212),stem((-15:18),StepResponse)
title('step response')
ylabel('u[n]*h[n]'),xlabel('n');
ylim([0,12]);
%% rectangular
n=-15:15;
rect=(n>=-5 & n<=5);
h=[1 2 3 4];
res=convolution(rect,h);
figure,subplot(211),stem(n,rect),
ylabel('x[n]'),xlabel('n');
subplot(212),stem((-15:18),res)
title('response to rectangular signal')
ylabel('x[n]*h[n]'),xlabel('n');
%% exponential
n=-15:15;
exp=(1.5).^n;
h=[1 2 3 4];
res=convolution(exp,h);
figure,subplot(211),stem(n,exp),
ylabel('x[n]'),xlabel('n');
subplot(212),stem((-15:18),res)
title('response to exponential signal')
ylabel('x[n]*h[n]'),xlabel('n');
%% sinusoidal
n=-20:20
sine=sin(100*n);
h=[1 2 3 4];
res=convolution(sine,h);
figure,subplot(211),stem(n,sine),
ylabel('x[n]'),xlabel('n');
subplot(212),stem(res)
title('response to sinusoidal signal')
ylabel('x[n]*h[n]'),xlabel('n');



% Illustration of the Sampling Process 
% in the Time-Domain
F = 13; %frequency=13 Hz
tmax=4/13; %display four cycles
t = 0:0.0001:tmax;%Th=0.0001
xa = cos(2*pi*F*t);
figure
plot(t,xa);
xlabel('Time');ylabel('Amplitude');
title('Continuous-time signal x(t)');
axis([0 tmax -1.2 1.2])

T=1/(8*13);
nmax=tmax/T;n = 0:nmax;
xs = cos(2*pi*F*n*T);
subplot(511)
stem(n,xs);
xlabel('Time index n');ylabel('Amplitude');
title('Discrete-time signal x[n] with fs=13*8');
axis([0 nmax -1.2 1.2])

T=1/(6*13);
nmax=tmax/T;n = 0:nmax;
xs = cos(2*pi*F*n*T);
subplot(512)
stem(n,xs);
xlabel('Time index n');ylabel('Amplitude');
title('Discrete-time signal x[n] with fs=13*6');
axis([0 nmax -1.2 1.2])

T=1/(4*13);
nmax=tmax/T;n = 0:nmax;
xs = cos(2*pi*F*n*T);
subplot(513)
stem(n,xs);
xlabel('Time index n');ylabel('Amplitude');
title('Discrete-time signal x[n] with fs=13*4');
axis([0 nmax -1.2 1.2])

T=2/(7*13);
nmax=tmax/T;n = 0:nmax;
xs = cos(2*pi*F*n*T);
subplot(514)
stem(n,xs);
xlabel('Time index n');ylabel('Amplitude');
title('Discrete-time signal x[n] with fs=(13*7)/2');
axis([0 nmax -1.2 1.2])

T=1/(3*13);
nmax=tmax/T;n = 0:nmax;
xs = cos(2*pi*F*n*T);
subplot(515)
stem(n,xs);
xlabel('Time index n');ylabel('Amplitude');
title('Discrete-time signal x[n] with fs=13*3');
axis([0 nmax -1.2 1.2])

T=2/(5*13);
nmax=tmax/T;n = 0:nmax;
xs = cos(2*pi*F*n*T);
subplot(611)
stem(n,xs);
xlabel('Time index n');ylabel('Amplitude');
title('Discrete-time signal x[n] with fs=(13*5)/2');
axis([0 nmax -1.2 1.2])

T=4/(9*13);
nmax=tmax/T;n = 0:nmax;
xs = cos(2*pi*F*n*T);
subplot(612)
stem(n,xs);
xlabel('Time index n');ylabel('Amplitude');
title('Discrete-time signal x[n] with fs=(13*9)/4');
axis([0 nmax -1.2 1.2])

T=1/(2*13);
nmax=tmax/T;n = 0:nmax;
xs = cos(2*pi*F*n*T);
subplot(613)
stem(n,xs);
xlabel('Time index n');ylabel('Amplitude');
title('Discrete-time signal x[n] with fs=13*2');
axis([0 nmax -1.2 1.2])

T=2/(3*13);
nmax=tmax/T;n = 0:nmax;
xs = cos(2*pi*F*n*T);
subplot(614)
stem(n,xs);
xlabel('Time index n');ylabel('Amplitude');
title('Discrete-time signal x[n] with fs=(13*3)/2');
axis([0 nmax -1.2 1.2])

T=4/(5*13);
nmax=tmax/T;n = 0:nmax;
xs = cos(2*pi*F*n*T);
subplot(615)
stem(n,xs);
xlabel('Time index n');ylabel('Amplitude');
title('Discrete-time signal x[n] with fs=(13*5)/4');
axis([0 nmax -1.2 1.2])

T=1/13;
nmax=tmax/T;n = 0:nmax;
xs = cos(2*pi*F*n*T);
subplot(616)
stem(n,xs);
xlabel('Time index n');ylabel('Amplitude');
title('Discrete-time signal x[n] with fs=13');
axis([0 nmax -1.2 1.2])


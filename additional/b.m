
Th=.001;
tmax=1;
t=0:Th:tmax;
g1=cos(6*pi*t);
g2=cos(26*pi*t);
plot(t,[g1;g2]);hold on;
T=.1; %sampling period
nmax=tmax/T; n=0:nmax;
gn=cos(.6*pi*n);
stem(n*T,gn,'r')%time axis denormalised by using n*T so that the 
%samples can be superimposed
xlabel('t')
ylabel('g1,g2')
figure
gn=cos(.6*pi*n);
stem(n*T,gn,'r')%time axis denormalised by using n*T so that the 
%samples can be superimposed
title('sampled signal')
xlabel('n*T')
ylabel('amplitude')
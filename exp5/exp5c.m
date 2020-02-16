clear all
clc
f1pass=0.4*pi;
f1stop=0.15*pi;
f2pass=0.6*pi;
f2stop=0.8*pi;
d1=1;
d2=60;
w=f2pass-f1pass;
tb=min((f1pass-f1stop), (f2stop-f2pass));
N=12*pi/tb;
M=ceil(N/2);
h=zeros(1,N);
for n=1:N
    h(n)=(sin(f2pass*(n-M))/(pi*(n-M)))-(sin(f1pass*(n-M))/(pi*(n-M)));
end
h(M)=w/pi;
figure
stem(h);
xlabel('n');
ylabel('h(n)');
title('BPF Impulse response without windowing');
% fvtool(h);
xlabel('n');
ylabel('h(n)');
title('BPF without windowing');
 
for n=1:N
    w1(n)=0.42-(0.5*cos((2*pi*n)/N-1))+(0.08*cos((4*pi*n)/N-1));
end
hw=(h.*w1);
figure
stem(hw);
xlabel('n');
ylabel('h(n)');
title('Impulse response after windowing');
fvtool(hw);

title('BPF after windowing');


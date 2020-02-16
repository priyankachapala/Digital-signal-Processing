clear all
clc
t=[0:1:8200];
fun=sin(2*pi*100*t/8200)+sin(2*pi*200*t/8200)+sin(2*pi*500*t/8200)+sin(2*pi*2000*t/8200)+sin(2*pi*4000*t/8200);
[hlpf]=lpf();
[hhpf]=hpf();
[hbpf]=bpf();
y1=conv(hlpf,fun);
y2=conv(hhpf,fun);
y3=conv(hbpf,fun);

figure
stem(abs(fft(fun)));
title('DFT of the composite signal');
figure
stem(abs(fft(y1)));
title('DFT of the composite signal passed through LPF'); 
figure
stem(abs(fft(y2)));
title('DFT of the composite signal passed through HPF'); 
figure
stem(abs(fft(y3)));
title('DFT of the composite signal passed through BPF'); 

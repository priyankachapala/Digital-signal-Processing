clear all 
close all

x=input('enter input sequence\n');
h=input('enter impulse response sequence\n');
display('convolution using our convolution function');
display(convolution1(x,h));
display('convolution using in-built conv function');
display(conv(x,h));
subplot(2,1,1),stem(convolution1(x,h));
title('convolution using our convolution function');
xlabel('n');
ylabel('y[n]');
subplot(2,1,2),stem(conv(x,h));
title('convolution using in-built conv function');
xlabel('n');
ylabel('y[n]');
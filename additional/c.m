a=[1 -1.143 .4128 ]; b=[.0675 .149 .675]; 
y=filter(b,a,.2*ones(1,50));
figure
stem(0:49,y)
title('first 50 values of the output ');
%%
a=[1 -0.8];
b=[1];
n=-10:10
x=(n==0);
y=(n>=0);
y1=filter(b,a,x);
figure
subplot(2,1,1)
stem(y1)
title('impulse response for a=0.8')
xlabel('n');
ylabel('y');
y2=filter(b,a,y)
subplot(2,1,2)
stem(y2)
title('step response for a=0.8')
xlabel('n');
ylabel('y');

% 
a=[1 0.8];
b=[1];
n=-10:10
x=(n==0);
y=(n>=0);
y1=filter(b,a,x);
figure
subplot(2,1,1)
stem(y1)
title('impulse response for a=-0.8')
xlabel('n');
ylabel('y');
y2=filter(b,a,y)
subplot(2,1,2)
stem(y2)
xlabel('n');
ylabel('y');
title('step response for a=-0.8')

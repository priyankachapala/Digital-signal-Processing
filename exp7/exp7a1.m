X=[1 1 2 3 4];
Y=[2 2 3];
b=correlate(X,Y);
figure;
subplot(2,2,3)
 stem(xcorr(X,Y));
 title('correlation using inbuilt function')
  xlabel('discrete k');
  ylabel('Rxy(k)');
  subplot(2,2,4)
  stem(b);
    title('correlation without inbuilt function')
  xlabel('discrete k');
  ylabel('Rxy(k)');
  subplot(2,2,1)
  stem(X);
   title('x[n]')
  xlabel('discrete n');
  ylabel('x[n]');
  subplot(2,2,2)
  stem(Y);
   title('y[n]')
  xlabel('discrete n');
  ylabel('y[n]');
  
  
  
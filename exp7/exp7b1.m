X=[1 1 2 3 4];
Y=[1 1 2 3 4];
b=correlate(X,Y);
figure;
subplot(2,2,3)
 stem(xcorr(X,Y));
 title('Auto correlation using inbuilt function')
  xlabel('discrete k');
  ylabel('Rxx(k)');
  subplot(2,2,4)
  stem(b);
    title('Auto correlation without inbuilt function')
  xlabel('discrete k');
  ylabel('Rxx(k)');
  subplot(2,2,1)
  stem(X);
   title('x[n]')
  xlabel('discrete n');
  ylabel('x[n]');
  subplot(2,2,2)
  stem(X);
   title('x[n]')
  xlabel('discrete n');
  ylabel('x[n]');
  
  
  
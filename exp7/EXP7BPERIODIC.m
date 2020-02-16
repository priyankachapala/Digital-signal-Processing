f=[-10:0.1:10];
X=sin(2*pi*f/5);

b=correlate(X,X);
figure;
subplot(2,2,3)
 stem(xcorr(X,X));
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
  
  
  
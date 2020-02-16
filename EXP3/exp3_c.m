%Circular convolution using convolution theorem
x=[1 2 3 4 ]; 
lx=length(x); 
h=[1 1 1]; 
lh=length(h); 
 
X=dft(x,lx); 
H=dft(h,lh); 
if(lx<lh) 
X=[X zeros(1,lh-lx)]; 
else if(lx>lh) 
H=[H zeros(1,lx-lh)]; 
end 
end
T=X.*H;
lT=length(T);
T1=idft(T,lT); 
n=0:length(T1)-1; 
figure;
stem(n,T1); 
title('Circular Convolution'); 
ylabel('y(n)'); 
xlabel('n'); 
 
%Linear convolution using convolution theorem
x=[1 2 3 4]; 
lx=length(x); 
h=[1 1 1];  
lh=length(h); 
x1=[x zeros(1,lh-1)]; 
h1=[h zeros(1,lx-1)]; 
X=dft(x1,lx+lh-1);
H=dft(h1,lx+lh-1); 
Y=X.*H; 
y=idft(Y,lx+lh-1); 
n=0:length(y)-1; 
stem(n,y); 
title('Linear Convolution'); 
ylabel('y(n)'); 
xlabel('n');
 


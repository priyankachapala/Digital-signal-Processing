clear all;
close all;
%% 1 a-3
n=-10:1:10;
 ramp=(n>=0).*n;
figure
stem(n,ramp);
title('1 a-3');
xlabel('n');
ylabel('unit ramp');
ylim([0,11]);
%% 1 a-4
x =[1 2 3 4];
n=1:12;
for m=5:1:12
 x(m)=x(m-4);  
end
figure
stem(n,x);
title('1 a-4');
xlabel('n');
ylabel('x[n]');
ylim([0,6]);

%% 1 a-5
figure
for n=-15:15
   x=0;
   if n>=0
       x=20*power(0.9,n);
   end
       stem(n,x);
       hold on;
end
title('1 a-5');
xlabel('n');
ylabel('x[n]');
%% %% 1 a-6
figure
for n=-15:15
   x=0;
   if n>=0
       x=0.2*((1.2)^n);
   end
       stem(n,x);
       hold on;
end
title('1 a-6');
xlabel('n');
ylabel('x[n]');
%% %% 1 a-7
figure
for n=-15:15
   x=0;
   if n>=0
       x=((-0.8)^n);
   end
       stem(n,x);
       hold on;
end
title('1 a-7');
xlabel('n');
ylabel('x[n]');
%% 1 a-8
figure
for n=-15:15
   x=0;
   if n>=0
       x=(-4)*((0.8)^n);
   end
       stem(n,x);
       hold on;
end
title('1 a-8');
xlabel('n');
ylabel('x[n]');
%% 1 a-9
n=-15:15;

real_x=exp(-n/12).*cos(pi*n/6);
imag_x=exp(-n/12).*sin(pi*n/6);
figure
subplot(1,2,1);
title('1 a-9');
xlabel('n');
ylabel('real part of x[n]');
stem(n,real_x);
subplot(1,2,2);
title('1 a-9');
xlabel('n');
ylabel('imag part of x[n]');
stem(n,imag_x);
%% 1 a-10
n=-20:20;
figure
x1=cos(0.2*pi*n);
x2=cos(1.8*pi*n);
x3=cos(2.2*pi*n);
subplot(3,1,1);
title('1 a-10');
xlabel('n');
ylabel('x1[n]');
stem(n,x1);
subplot(3,1,2);
xlabel('n');
ylabel('x2[n]');
stem(n,x2);
subplot(3,1,3);
xlabel('n');
ylabel('x3[n]');
stem(n,x3);
%% 1 a-11
n=-20:20;
x4=cos(4*pi*n/17);
x5=3*cos(1.3*pi*n)-4*sin(0.5*pi*n+(0.5*pi));
x6=5*cos(1.5*pi*n+(0.75*pi))+4*cos(0.6*pi*n)-sin(0.5*pi*n);
figure
subplot(3,1,1);
title('1 a-11');
xlabel('n');
ylabel('x4[n]');
stem(n,x4);
subplot(3,1,2);
xlabel('n');
ylabel('x5[n]');
stem(n,x5);
subplot(3,1,3)
stem(n,x6);
xlabel('n');
ylabel('x6[n]');
%% 1 a-12
figure
n = 0:50;
x= 2.*n.*((0.9).^n);
stem(n,x);
xlabel('n');
ylabel('x[n]');
title('1 a-12');
%% 

figure
n = 0:50;
x= (0.95.^n).*sin(0.1*pi.*n);
stem(n,x);
xlabel('n');
ylabel('x[n]');
title('1 a-13');







   


    
    
        

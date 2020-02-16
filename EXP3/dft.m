function res=dft(x,N)
res=zeros(1,N);

for k=1:N
    for n=1:N
        res(k) = res(k)+(x(n)*exp((-2*j*pi*(k-1)*(n-1))/N));
    end
end
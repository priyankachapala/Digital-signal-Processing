function res=idft(X,N)
res=zeros(1,N);

for n=1:N
    for k=1:N
        res(n) = res(n)+(1/N)*(X(k))*exp((2*j*pi*(k-1)*(n-1))/N);
    end
end
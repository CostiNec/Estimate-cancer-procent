function[x]=CMMP(A,b);

m = size(A,1);
n = size(A,2);
[R,U,beta]=TORT(A);
for k=1:n
    sum=0;
    for i=k:m
        sum = sum + U(i,k)*b(i);
    end
    tau = sum/beta(k);
    for i=k:m
        b(i)=b(i)-tau*U(i,k);
    end
end
x=UTRIS(R(1:n,:),b(1:n));

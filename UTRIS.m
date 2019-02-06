function [ x ] = UTRIS (U,b)

x = b;

n = length(b);

for i = n:-1:1
    for j = i+1:n
        x(i) = x(i) - U(i,j)*x(j);
    end
    x(i)=x(i)/U(i,i);
end
end
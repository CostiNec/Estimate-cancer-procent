function [R, U, beta] = TORT(A)

    p = min(size(A, 1) - 1, size(A, 2));
    for k = 1: p
        sum = 0;
        for i = k: size(A, 1)
            sum = sum + A(i, k) * A(i, k);
        end
        sigma = sign(A(k, k)) * sqrt(sum);
        if sigma == 0
            beta(k) = 0;
        else
            U(k, k) = A(k, k) + sigma;
            for i = k + 1: size(A, 1)
                U(i, k) = A(i, k);
            end
            beta(k) = sigma * U(k, k);
            R(k, k) = (-1) * sigma;
            for j = k + 1: size(A, 2)
                sum = 0;
                for i = k: size(A, 1) 
                    sum = sum + U(i, k) * A(i, j);
                end
                tau = sum / beta(k);
                for i = k: size(A, 1)
                    A(i, j) = A(i, j) - tau * U(i, k);
                end
            end
        end
    end
end
function [Q, R] = classicalGramSchmidt(A)
    [m, n] = size(A)
    for i = n+1:m
        A(:, i) = zeros(m, 1)
        A(i, i) = 1
    end
    for j = 1:m
        y = A(:, j)
        for i = 1:j-1
            R(i, j) = Q(:, i)' * A(:, j)
            y = y - R(i, j) * Q(:, i)
        end
        R(j, j) = norm(y)
        Q(:, j) = y / R(j, j)
    end
    R = R(:, 1:n)
endfunction



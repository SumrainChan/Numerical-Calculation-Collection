function [H_set, Q, R] = Householder(A)
    [m, n] = size(A)
    for i = 1:n
        x = A(i:m, i)
        h = getReflection(x)
        if i > 1
            H_tmp = zeros(m)
            for j = 1:i-1
                H_tmp(j, j) = 1
            end
            H_tmp(i:m, i:m) = h
        else
            H_tmp = h
        end
        H_set(:, :, i) = H_tmp
        A = H_tmp * A
    end
    R = A
    Q = eye(m)
    for i = 1:n
        Q = Q * H_set(:, :, i)
    end
endfunction

function [H] = getReflection(x)
    w = zeros(length(x), 1)
    w(1, 1) = norm(x)
    v = w - x
    H = eye(length(x), length(x)) - 2 * (v * v') / (v' * v)
endfunction

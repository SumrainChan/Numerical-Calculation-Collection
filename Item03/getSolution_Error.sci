function [x, x_error] = getSolution_Error(A, b)
    [H_set, Q, R] = Householder(A)
    [m, n] = size(A)
    Rmao = R(1:n, 1:n)
    dmao = Q' * b
    dmao = dmao(1:n)
    x = inv(Rmao) * dmao
    list_error = b - A * x
    sum_error = 0
    for i = 1:length(list_error)
        sum_error = sum_error + list_error(i)^2
    end
    x_error = sqrt(sum_error)
endfunction

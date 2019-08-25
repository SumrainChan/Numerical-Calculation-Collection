A = gmatrix
n = 500
for i=1:n
    colsum = sum(gmatrix(:, i))
    if colsum <> 0
        A(:, i) = gmatrix(:, i) / colsum
        end
end

x0 = zeros(n, 1)
x0(1) = 1
a = 0.85
x = x0
for i=1:100
    y = A * x
    b = 1 - a * sum(y)
    x = a * y + b / n * ones(n, 1)
end
v = x


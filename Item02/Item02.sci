function [F] = getNewtonF(x, y, n)
    F = zeros(n, n)
    for j=1:n
        F(j, j) = y(j)
    end
    for i=2:n
        for j=1:n+1-i
            F(j, j+i-1) = (F(j+1, j+i-1) - F(j, j+i-2)) / (x(j+i-1) - x(j))
        end
    end
endfunction

function [result] = getNewtony(F, x, n, rx)
    result = F(1, 1)
    for i=2:n
        tmp = 1
        for j=1:i-1
            tmp = tmp * (rx - x(j))
        end
        result = result + F(1, i) * tmp
    end
endfunction

function [x] = getx_evenlyspace(n)
    x = linspace(-1, 1, n)
endfunction

function [x] = getx_chebyshev(n)
    odd = [1:2:2*n-1]
    for i=1:n
        x(i) = cos(odd(i) * %pi / (2 * n))
    end
endfunction

function [y] = gety(x)
    y = zeros(1, length(x))
    for i=1:length(x)
        y(i) = exp(-2 * x(i))
    end
endfunction



// 计算误差
N = 40
x_es = getx_evenlyspace(N)
x_cbs = getx_chebyshev(N)
y_es_real = gety(x_es)
y_cbs_real = gety(x_cbs)
F_es = getNewtonF(x_es, y_es_real, N)
F_cbs = getNewtonF(x_cbs, y_cbs_real, N)
cnt = 1
for i=-1:0.05:1
    y_es_et(cnt) = getNewtony(F_es, x_es, N, i)
    y_cbs_et(cnt) = getNewtony(F_cbs, x_cbs, N, i)
    y_real_et(cnt) = gety(i)
    cnt = cnt + 1
end
y_es_error = abs(y_real_et - y_es_et)
y_cbs_error = abs(y_real_et - y_cbs_et)

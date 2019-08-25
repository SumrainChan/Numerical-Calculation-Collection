m = read_csv('GoogleMatrix2.txt')
gmatrix = zeros(500, 500)
for i=1:500
    for j=1:500
        gmatrix(i, j) = str2code(m(i, j))
    end
end


A = [4, 2, 3, 0;
     -2, 3, -1, 1;
     1, 3, -4, 2;
     1, 0, 1, -1;
     3, 1, 3, -2]
Q = [[]]
R = [[]]
H_set = [[[]]]
//[Q, R] = classicalGramSchmidt(A)
//[H_set, Q, R] = Householder(A)
b = [10; 0; 2; 0; 5]
[x, norm2error] = getSolution_Error(A, b)

% LU decomposition of a square matrix using Doolittle's method
%
% WHO   DATE            WHAT
% DAA   Aug 24, 2009    First algorithm
%
% DAA - Diego Andres Alvarez Marin - diegoandresalvarez@gmx.net

%A = fix(10*rand(6,6));

A = [ ...
   1   1   5   8   1   3
   3   2   0   6   3   4
   0   7   7   6   2   4
   2   4   1   7   9   4
   3   8   8   1   7   3
   8   2   2   5   1   0 ];

disp('The LU decomposition provided by MATLAB is');
[LL,UU] = lu(A);
LL
UU
disp('Note that it outputs different matrices.');


tic
n = size(A,1); % find number of rows of A

%U = zeros(n,n); L is
%L = zeros(n,n);
%for j=1:n
%   L(j,j) = 1;
%   U(1,j) = A(1,j);
%end

U = zeros(n,n); U(1,:) = A(1,:);
L = eye(n,n);

for j = 1:n     % column counter
   for i = 2:j    % row counter -> when i<=j
      U(i,j) = A(i,j) - L(i,1:i-1)*U(1:i-1,j);
   end
   for i = j+1:n  % row counter -> when i>j
      L(i,j) = (A(i,j) - L(i,1:j-1)*U(1:j-1,j))/U(j,j);
   end
end
toc

% show results
disp('The lower triangular matrix L is')
L
disp('The upper triangular matrix U is')
U

disp('The inverse of A by MATLAB is')
inv(A)

disp('The inverse of A by our LU is')
inv(U)*inv(L)

disp('The determinant of A by MATLAB is')
det(A)

disp('The determinant of A by our LU is')
prod(diag(U))

disp('Given');
%b = fix(10*rand(6,3));
b = [ ...
   6   3   1
   4   3   6
   1   9   3
   6   7   6
   5   4   5
   7   5   0 ];

% **** 2. FORWARD SUBSTITUTION STEP **** (Ly=b)
y = zeros(size(b)); % reserve memory for y
y(1,:) = b(1,:)./L(1,1);
 
for i = 2:n
   y(i,:) = (b(i,:) - L(i,1:i-1)*y(1:i-1,:))/L(i,i);
end;

% **** 3. BACKSUBSTITUTION STEP **** (Ux=y)
x = zeros(size(b)); % reserve memory for x
x(n,:) = y(n,:)./U(n,n);

for i = n-1:-1:1
   x(i,:) = (y(i,:) - U(i,i+1:n)*x(i+1:n,:))/U(i,i);
end;

disp('The solution to the linear system by MATLAB is');
x = A\b

disp('The solution to the linear system using our LU is');
yy = L\b;
xx = U\yy

disp('Error =');
abs(x - xx)


% TAREA:
% 1. Implementar partial pivoting (NO HACER)
% 2. Guardar L y U en A (NO HACER)
% 3. Modificar el algoritmo e implementar la descomposición de Cholesky 
% (SI HACER). Hacer el algoritmo de modo que informe si la matriz A no es 
% definida positiva.

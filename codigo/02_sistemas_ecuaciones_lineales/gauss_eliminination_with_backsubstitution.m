% Gaussian elimination with backsubstitution
%
% WHO   DATE            WHAT
% DAA   Aug 24, 2009    First algorithm
%
% DAA - Diego Andrés Alvarez Marín - diegoandresalvarez@gmx.net

%A = fix(10*rand(6,6));
%b = fix(10*rand(6,3));

%% SETTING UP MATRICES
A = [ ...
   1   1   5   8   1   3
   3   2   0   6   3   4
   0   7   7   6   2   4
   2   4   1   7   9   4
   3   8   8   1   7   3
   8   2   2   5   1   0 ];

b = [ ...
   6   3   1
   4   3   6
   1   9   3
   6   7   6
   5   4   5
   7   5   0 ];

% This is the "exact" solution to the system
exact_solution = A\b

tic
%% **** 1. GAUSSIAN ELIMINATION STEP ****
n = size(A,1); % find number of rows of A

% matrix normalization
for i = 1:n
   maximo = max(abs(A(i,:)));
   b(i,:) = b(i,:)./maximo;
   A(i,:) = A(i,:)./maximo;
end;

% loop for all rows
for i = 1:n
   % Find pivot: We will do partial pivoting
   [maximo, idxmax] = max(abs(A(i:n,i)));
   idxmax = idxmax + i - 1; % adjust position of maximum

   % swap actual row and row containing the pivot element
   [A(i,i:n), A(idxmax,i:n)] = deal(A(idxmax,i:n), A(i,i:n));
   [b(i,:),   b(idxmax,:)]   = deal(b(idxmax,:),   b(i,:));

   % Normalize the i-th row by A(i,i)
   b(i,:)     = b(i,:)/A(i,i);
   A(i,i+1:n) = A(i,i+1:n)/A(i,i);
   % We set A(i,i) = 1 manually to avoid rounding errors
   A(i,i) = 1;

   % Normalize the other rows: row_j = row_j - A(j,i)*row_i
   row_i = A(i,i+1:n);
   for j = i+1:n
      b(j,:)     = b(j,:)     - b(i,:)*A(j,i);
      A(j,i+1:n) = A(j,i+1:n) - row_i*A(j,i);
   end;
   % We set A(j>i,i) = 0 manually to avoid rounding errors
   A(i+1:n,i) = 0;
end;

%% **** 2. BACKSUBSTITUTION STEP ****
x = zeros(size(b)); % reserve memory for x
x(n,:) = b(n,:)./A(n,n);

for i = n-1:-1:1
   x(i,:) = (b(i,:) - A(i,i+1:n)*x(i+1:n,:))/A(i,i);
end;
toc

%% SHOW RESULTS
disp('This is the solution to the system calculated by means of Gauss elimination with backsubstitution');
x

%% TAREA:
% 1. Modifique el programa para que detecte que la matriz es singular. En 
% ese caso retorne el rango de la matriz.
% 2. Deduzca y reimplemente el algoritmo de eliminación gaussiana, para 
% que al final retorne una matriz triangular inferior que se resuelve 
% utilizando sustituciones hacia adelante (NO HACER)
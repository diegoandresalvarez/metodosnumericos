%% Metodo iterativo de Jacobi para la solucion de sistemas lineales
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          20.02.16        Metodos numericos
---------------------------------------------------------------------------
* La matriz A no tiene ceros en su diagonal
* La matriz A es diagonal dominante
* La matriz A esta bien condicionada
* La matriz A tiene solucion unica
---------------------------------------------------------------------------
Referencias:
1. Yang et al. (2005) - Applied numerical methods using MATLAB
---------------------------------------------------------------------------
%}
clear; clc; close all;

%% ejemplos
%{
% ejemplo 1: falla
S = [ 10 -7 0 7
      -3  2 6 4
       5 -1 5 6 ];
%}
%{
% ejemplo 2: falla
S = [ 2  1 -1 2 5
      4  5 -3 6 9
     -2  5 -2 6 4
      4 11 -4 8 2 ];   % matriz aumentada del sistema
%}
%{
% ejemplo 3: nofalla
S = [ 10 -1  2  0   6
      -1 11 -1  3  25 
       2 -1 10 -1 -11
       0  3 -1  8  15 ];
%}
%{
% ejemplo 4: nofalla
S = [ 2 1 11
      5 7 13 ];
%}
%{
% ejemplo 5: nofalla
S = [ 4 -1 -1  3
     -2  6  1  9
     -1  1  7 -6 ];
%}
%{
% ejemplo 6: nofalla
S = [ 5 -2  3 -1
     -3  9  1  2
      2 -1 -7  3 ];
%}
% ejemplo 7: falla
S = [ 1 1 5 8 1 3 6
      3 2 0 6 3 4 4
      0 7 7 6 2 4 1
      2 4 1 7 9 4 6 
      3 8 8 1 7 3 5
      8 2 2 5 1 0 7 ];   % matriz aumentada del sistema
%}

%% procedimiento
maxite = 100;            % numero maximo de iteraciones
tol    = 1e-5;           % tolerancia
errrel = 1;              % inicio el error relativo
A      = S(:,1:end-1);   % matriz de coeficientes del sistema
b      = S(:,end);       % vector de respuestas del sistema
n      = length(b);
x      = zeros(n,maxite);

% reviso numero de condicion de A para ver si el metodo podra converger
kappa  = cond(A);
lim    = 8;        % limite supuesto
if kappa > 1+lim
   fprintf('\nk(A) = %g >> 1 - Muy probablemente el metodo de Jacobi fallara en converger\n\n',kappa);
else
   fprintf('\nk(A) = %g ~ 1 - Muy probablemente el metodo de Jacobi convergera\n\n',kappa);
end

% procedimiento
k = 2;
while (errrel > tol)
   msg = fprintf('*Iteration %g', k-1);
   for i = 1:n
      suma = 0;
      for j = 1:n
         if j ~= i
            suma = suma + A(i,j)*x(j,k-1);
         end
      end
      x(i,k) = (b(i) - suma)/A(i,i);
   end
   errrel = norm(x(:,k)-x(:,k-1))/norm(x(:,k));
   k      = k+1;
   fprintf(repmat('\b',1,msg));
end

% muestro solucion en pantalla
disp('La solucion del sistema usando \ MATLAB es:');  disp((A\b)');
disp('La solucion usando Jacobi es:'); disp(x(:,k-1)');

%%END
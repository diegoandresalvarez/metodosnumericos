%% Descomposicion LU para la solucion de sistemas lineales
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          20.02.16        Metodos numericos
---------------------------------------------------------------------------
Descomposicion LU: 
* descomposicion PA = LU
* sustitucion hacia adelante y hacia atras
---------------------------------------------------------------------------
Referencias:
1. Yang et al. (2005) - Applied numerical methods using MATLAB
---------------------------------------------------------------------------
%}
clear; clc; close all;

%% ejemplos
%{
% ejemplo 1: nosingular
S = [ 10 -7 0 7
      -3  2 6 4
       5 -1 5 6 ];
%}
%
% ejemplo 2: nosingular
S = [ 2  1 -1 2 5
      4  5 -3 6 9
     -2  5 -2 6 4
      4 11 -4 8 2 ];   % matriz aumentada del sistema
%}

%% procedimiento
A  = S(:,1:end-1);   % matriz de coeficientes del sistema
b  = S(:,end);       % vector de respuestas del sistema

disp('Descomposicion LU usando comando MATLAB es:');
[LL,UU,PP] = lu(A); 
disp('L='); disp(LL); 
disp('U='); disp(UU);
disp('P='); disp(PP);
% isAlways(PP*A== LL*UU)

%% procedimiento
m  = size(A,1);    % filas de la matriz A
P  = eye(m);       % matriz de permutacion inicial
AP = [A P];        % matriz A junto con matriz de permutacion inicial.
n  = size(AP,2);   % columnas de AP
for k = 1:m-1
   % pivoteo parcial
   [maximo, idx] = max(abs(AP(k:m,k)));   % busco elemento pivote
   idx           = idx + k-1;             % ajusto la posicion del pivote
   [AP(k,:), AP(idx,:)] = deal(AP(idx,:), AP(k,:)); % intercambio

   % descomposicion LU
   for i = k+1:m
      AP(i,k)     = AP(i,k)/AP(k,k);                     % Eq.(2.4.8.2)
      AP(i,k+1:m) = AP(i,k+1:m) - AP(i,k)*AP(k,k+1:m);   % Eq.(2.4.9)
   end
end

% extraigo las matrices 
P = AP(:,m+1:end);                % matriz de permutacion final
U = AP(:,1:m).*triu(ones(m),0);   % triangular superior
L = AP(:,1:m).*tril(ones(m),0);   % triangular inferior
for i = 1:m
  L(i,i) = 1;   % L es triangular unitaria (Doolittle)
end

% muestro descomposicion en pantalla
disp('L*U = P*A'); 
disp('L = '); disp(L); 
disp('U = '); disp(U); 
disp('P = '); disp(P); 
% disp(P*L*U - A);

%% sustitucion hacia adelante (Ly = ~b)
y     = zeros(m,1);   % reservo memoria para y
b_til = P*b;
y(1)  = b_til(1)/L(1,1);
for i = 2:m
   y(i,:) = (b_til(i) - L(i,1:i-1)*y(1:i-1,:))/L(i,i);
end
% o tambien ---> y = L\b_til;

%% sustitucion hacia atras (Ux = y)
x    = zeros(m,1);   % reservo memoria para x
x(m) = y(m)/U(m,m);
for i = m-1:-1:1
   x(i,:) = (y(i) - U(i,i+1:m)*x(i+1:m,:))/U(i,i);
end
% o tambien ---> x = U\y; 

% muestro solucion en pantalla
disp('La solucion del sistema usando \ MATLAB es:');  disp((A\b)');
disp('La solucion usando LU es:'); disp(x');

%%END
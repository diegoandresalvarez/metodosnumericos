%% Metodo de Gauss para la solucion de sistemas lineales
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          10.02.16        Metodos numericos
---------------------------------------------------------------------------
Eliminacion Gaussiana: Uso operaciones elementales para obtener la forma 
escalonada del sistema. Tiene los siguientes pasos:
* eliminacion hacia adelante
* sustitucion hacia atras
---------------------------------------------------------------------------
Referencias:
1. Yang et al. (2005) - Applied numerical methods using MATLAB
---------------------------------------------------------------------------
%}
clear; clc; close all;

%% datos iniciales
%{
% ejemplo 0: redundancia
S = [ 1  0  1 1
      1  1  1 3
      1 -1  1 1 ];
%}
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
%{
% ejemplo 3: inconsistencia
S = [ 1  2  3   3 -4  -4
      3  6 -2 -13  3 -18
     -2 -4  4  14 -2  28
      4  8 -2 -16  3 -24
      5 10  1 -13  2 -16 ];   % matriz aumentada del sistema
%}
%{
% ejemplo 4: nosingular
S = [ 1 1 5 8 1 3 6
      3 2 0 6 3 4 4
      0 7 7 6 2 4 1
      2 4 1 7 9 4 6 
      3 8 8 1 7 3 5
      8 2 2 5 1 0 7 ];   % matriz aumentada del sistema
%}
A  = S(:,1:end-1);   % matriz de coeficientes del sistema
b  = S(:,end);       % vector de respuestas del sistema
[m,n] = size(S);     % dimension del sistema 
disp('Forma aumentada del sistema:');   disp(S);
disp('Solucion del sistema en MATLAB:');   disp((A\b)');

%% 1. eliminacion hacia adelante
c = eye(m);   % almaceno los multiplicadores
for j = 2:m 
   k = j-1;
   
   % pivoteo
   [maximo, idx] = max(abs(S(k:m,k)));
   idx           = idx + k-1;   % ajusto la posicion del maximo
   [S(k,:), S(idx,:)] = deal(S(idx,:), S(k,:));
   
   % eliminacion de Gauss
   for i = j:m
      if S(k,k)~=0   % chequeo para que no ocurra NaN en el multiplicador
         c(i,k) = (S(i,k)/S(k,k));
      else
         p = 0;
         while S(k,k+p)==0
            p = p+1;
            c(i,k) = (S(i,k+p)/S(k,k+p));
         end
      end
      S(i,:) = S(i,:) - S(k,:)*c(i,k);   % Ec. (2.2.5) Ref. 1
   end
end
disp('Forma escalonada:');   disp(S);

%% 2. sustitucion hacia atras
A  = S(:,1:end-1);   % matriz de coeficientes del sistema despues de reduccion
b  = S(:,end);       % vector de respuestas del sistema despues de reduccion
if A(m,m)==0 && b(m)==0
   disp('Redundancia: No hay solucion unica');
elseif A(m,m)==0 && b(m)~=0
   disp('Inconsistencia: No hay solucion exacta');
else
   x    = zeros(m,1);
   x(m) = b(m)/A(m,m);
   for i = m-1:-1:1
      x(i) = (b(i) - A(i,i+1:m)*x(i+1:m))/A(i,i);   % Ec. (2.2.7) Ref. 1
   end
   disp('Solucion gauss.m:');   disp(x');
end

%%END
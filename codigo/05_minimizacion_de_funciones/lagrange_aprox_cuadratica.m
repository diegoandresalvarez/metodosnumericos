%% polinomio de Lagrange de orden 2 simbolico
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          27.03.16        Metodos numericos
---------------------------------------------------------------------------
Para minimizacion por aproximacion cuadratica
---------------------------------------------------------------------------
Referencias:
1. Yang et al. (2005) - Applied numerical methods using MATLAB
---------------------------------------------------------------------------
%}
clear; clc; close all;

%% defino variables simbolicas
syms x;
N = 3;            % numero de puntos 
xx = cell(1,N);   % almaceno los x
ff = cell(1,N);   % almaceno los f
for j = 1:N
   xx{j} = sym(sprintf('x_%d',j-1));
   ff{j} = sym(sprintf('f_%d',j-1));
end

%% procedimiento
l = 0; 
for i = 1:N
   mult = 1;
   for k = 1:N
      if k ~= i
         mult = mult*(x-xx{k})/(xx{i}-xx{k});   % calculo base
      end
   end
   l = l + (ff{i}*mult);   % calculo el polinomio de Lagrange
end
pretty(simplify(l));

%% hallo derivada y raiz
lp = diff(l);

% hallo el minimo
xp = solve(lp==0);   % copiar y pegar en codigo de aproximacion cuadratica
pretty(factor(xp));

%%END
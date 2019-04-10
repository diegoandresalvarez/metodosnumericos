%% deduccion de las formulas de Newton-Cotes
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          12.04.16        Metodos numericos
---------------------------------------------------------------------------
Referencias:
1. Yang et al. (2005) - Applied numerical methods using MATLAB
---------------------------------------------------------------------------
%}
clear; clc; close all;

%% defino variables simbolicas
syms h x x0;
N  = 4;            % grado de la formula de Newton-Cotes 
xx = cell(1,N);    % almaceno los x
ff = cell(1,N);    % almaceno los f
for j = 1:N
   xx{j} = sym(sprintf('x0 + %d*h',j-1));
   ff{j} = sym(sprintf('f_%d',j-1));
end

%% genero el polinomio de Lagrange
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

%% integro el polinomio para obtener la expresion
a = xx{1};                 % limite inferior de integracion
b = xx{end};               % limite superior de integracion
f_int = int(l,x,a,b);      % integro polinomio
pretty(simplify(f_int));   % muestro la formula en pantalla

%%END
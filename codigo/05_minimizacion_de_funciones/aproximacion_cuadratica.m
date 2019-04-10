%% minimizacion de funciones por el metodo de aproximacion cuadratica
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          27.03.16        Metodos numericos
---------------------------------------------------------------------------
Funcion unimodal en un intervalo de solucion conocido
---------------------------------------------------------------------------
Referencias:
1. Yang et al. (2005) - Applied numerical methods using MATLAB
---------------------------------------------------------------------------
%}
clear; clc; close all;

%% datos
%
% ejemplo 1
f = @(x) ((x.^2 - 4).^2)/8 - 1;   % funcion objetivo
a = 0;                            % valor minimo del intervalo
b = 3;                            % valor maximo del intervalo
%
%{
% ejemplo 2
f = @(x) (x - 5).^2 - x;   % funcion objetivo
a = 0;                        % valor minimo del intervalo
b = 7;                        % valor maximo del intervalo
%}
x     = a:0.05:b;
maxit = 300;                      % numero maximo de iteraciones
tol   = 1e-6;                     % tolerancia

%% Procedimiento
% puntos iniciales
xx = [a (a + b)/2 b];
ff = f(xx);
%
x_1 = 0;
x_3 = 1;
k   = 0;
while abs(x_3 - x_1) >= tol
   x_0 = xx(1); x_1 = xx(2); x_2 = xx(3);
   f_0 = ff(1); f_1 = ff(2); f_2 = ff(3);
   
   % evaluo la raiz de la derivada del polinomio de lagrange de grado 2
   % con 'lagrange_aprox_cuadratica.m' se calcula x_3
   x_3 = (f_0*x_1^2 - f_1*x_0^2 - f_0*x_2^2 + f_2*x_0^2 + f_1*x_2^2 - f_2*x_1^2)/...
         (2*f_0*x_1 - 2*f_1*x_0 - 2*f_0*x_2 + 2*f_2*x_0 + 2*f_1*x_2 - 2*f_2*x_1);
   f_3 = f(x_3);
   
   % condicionales
   if (x_0 < x_3) && (x_3 < x_1)
      if f_3 < f_1, 
         xx = [x_0 x_3 x_1]; 
         ff = [f_0 f_3 f_1];
      else
         xx = [x_3 x_1 x_2]; 
         ff = [f_3 f_1 f_2];
      end
   elseif (x_1 < x_3) && (x_3 < x_2)
      if f_3 <= f_1
         xx = [x_1 x_3 x_2]; 
         ff = [f_1 f_3 f_2];
      else
         xx = [x_0 x_1 x_3];
         ff = [f_0 f_1 f_3];
      end
   end  
   xp = x_3;  % minimo
   
   % otra iteracion
   k  = k+1;
   if k == maxit
      error('Se cumplio el numero maximo de iteraciones');
   end
end
fprintf('%g iteraciones... El minimo de la funcion es %g\n\n',k,xp);

%% grafico
figure;
plot(x,f(x),'r-',xp,f(xp),'bo');
grid minor; 
set(gca,'FontSize',15);

%%END
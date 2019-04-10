%% minimizacion de funciones por el metodo de la busqueda aurea
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
a = 0;    % valor minimo del intervalo
b = 3;    % valor maximo del intervalo
%
%{
% ejemplo 2
f = @(x) (x - 5).^2 -x;   % funcion objetivo
a = 4;    % valor minimo del intervalo
b = 8;    % valor maximo del intervalo
%}
x     = a:0.05:b;
phi   = (sqrt(5)-1)/2;       % defino el numero de oro
maxit = 300;                 % numero maximo de iteraciones
tol   = 1e-8;                % tolerancia

%% Procedimiento
fc = 0;
fd = 1;
k  = 0;
while abs(fc-fd) >= tol
   % calculo puntos iniciales
   h  = b-a;
   c  = a + (1-phi)*h;
   d  = a + phi*h;
   fc = f(c);
   fd = f(d);
   
   % condicionales
   if fc < fd
      b = d;
   else
      a = c;
   end
   
   % otra iteracion
   k  = k+1;
   if k == maxit
      error('Se cumplio el numero maximo de iteraciones');
   end
end
xp = (c+d)/2;   % minimo
fprintf('%g iteraciones... El minimo de la funcion es %g\n\n',k,xp);

%% grafico
figure;
plot(x,f(x),'r-', xp,f(xp),'bo');
grid minor; 
set(gca,'FontSize',15);

%%END
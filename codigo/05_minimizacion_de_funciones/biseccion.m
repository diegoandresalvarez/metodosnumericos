%% Raices de ecuaciones: Metodo de biseccion
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          10.03.16        Metodos numericos
---------------------------------------------------------------------------
Se puede utilizar para determinar raices de una funcion de la forma f(x),
dividiendo el intervalo a la mitad y seleccionando el subintervalo que
contiene a la raiz
---------------------------------------------------------------------------
Referencias:
1. Yang et al. (2005) - Applied numerical methods using MATLAB
---------------------------------------------------------------------------
%}
clear; clc; close all;

%% datos
%{
% ejemplo 1
f   = @(x) tan(pi*x)-x;    % funcion objetivo
a   = 1.6;              % limite inferior del intervalo
b   = 2.4;              % limite superior del intervalo
x   = a:0.01:b;         % defino intervalo de busqueda
y   = f(x);
%}
%
% ejemplo 2
f   = @(x) x.^2 - 5*x + 3;   % funcion objetivo
a   = -5;                    % limite inferior del intervalo
b   = 5;                     % limite superior del intervalo
x   = a:0.01:b;              % defino intervalo de busqueda
y   = f(x);
%}
%{
% grafico la funcion para halla un 'buen' [a,b]
figure;
plot(x,y,'linewidth',2); grid minor;
ab = ginput(2);   % intervalo 'corregido'
a  = ab(1,1);
b  = ab(2,1);
%}

% criterios de convergencia
tol     = eps*b;       % tolerancia
maxiter = 500;         % maximo numero de iteraciones

%% solucion con fzero (cuidado con ejemplo 1)
x0 = a;
[xp_fzero,fval] = fzero(f,x0);
fprintf('\nEl valor de la raiz con fzero: %g\n',xp_fzero);

%% procedimiento
fa = f(a);               % primer f(a)
xx = zeros(maxiter,1);   % espacio en memoria para los puntos de la iter
for k = 1:maxiter
   xx(k) = (a+b)/2;   % hallo punto medio del intervalo
   fm    = f(xx(k));  % hallo el valor de la funcion en el punto medio
   if fa*fm > 0
      a  = xx(k);
      fa = fm; 
   else
      b = xx(k);
   end
   err = abs((b-a)/2); 
   if abs(fm) <= tol || err <= tol 
      break;   % cancele el ciclo for cuando se cumpla tolerancia
   end
   if k == maxiter   % error si se alcanza el maxiter
      error('Se cumplio el numero maximo de iteraciones');
   end
end
xp = xx(k);
fprintf('\nEl valor de la raiz es: %g, en %g iteraciones\n\n',xp,k);

%% grafico
figure;
plot(x,f(x),'b-'); grid on;  hold on;
plot(xx(1:k),f(xx(1:k)),'k*');
plot(xx(k),f(xx(k)),'r*');
legend('f(x)','Puntos de la iteracion','Punto fijo','Location','Best');
set(gca,'FontSize',15);

%End
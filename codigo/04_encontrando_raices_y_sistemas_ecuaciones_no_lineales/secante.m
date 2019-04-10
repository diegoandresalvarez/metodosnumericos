%% Raices de ecuaciones: Metodo de la secante
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          10.03.16        Metodos numericos
---------------------------------------------------------------------------
Referencias:
1. Yang et al. (2005) - Applied numerical methods using MATLAB
---------------------------------------------------------------------------
%}
clear; clc; close all;

%% datos
%{
% ejemplo 1
f   = @(x) tan(pi*x)-x;     % funcion objetivo
a   = 1.6;                  % limite inferior del intervalo
b   = 2.4;                  % limite superior del intervalo
%}
%
% ejemplo 2
f   = @(x) x.^2 - 5*x + 3;   % funcion objetivo (en simbolico)
a   = -2;                    % limite inferior del intervalo
b   = 2;                     % limite superior del intervalo
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
xx      = a:0.01:b;    % defino intervalo de busqueda
tol     = 1e-8;        % tolerancia
maxiter = 300;         % maximo numero de iteraciones

%% solucion con fzero
x0 = a;
[xp_fzero,fval] = fzero(f,x0);
fprintf('\nEl valor de la raiz con fzero: %g\n',xp_fzero);

%% procedimiento
x    = zeros(maxiter,1);
k    = 2;   % contador de la iteracion
x(k) = 1;   % valor inicial
while abs(x(k) - x(k-1)) > tol
   
   % formula
   fp     = (f(x(k))-f(x(k-1)))/(x(k)-x(k-1));   % diferencia finita
   x(k+1) = x(k) - f(x(k))/fp;
   
   % otra iteracion
   k = k+1;
   if k == maxiter   % error si se alcanza el maxiter
      error('Se cumplio el numero maximo de iteraciones');
   end
end
xp = x(k);
fprintf('\nEl valor de la raiz es: %g, en %g iteraciones\n\n',xp,k);

%% grafico
figure;
plot(xx,f(xx),'b-'); grid on;  hold on;
plot(x(1:k),f(x(1:k)),'k.');
plot(x(k),f(x(k)),'ro');
legend('f(x)','Puntos de la iteracion','Raiz','Location','Best');
set(gca,'FontSize',15);

%%END
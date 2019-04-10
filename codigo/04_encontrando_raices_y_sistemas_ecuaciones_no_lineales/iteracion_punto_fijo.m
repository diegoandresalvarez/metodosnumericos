%% Raices de ecuaciones: Metodo de iteracion hacia el punto fijo
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          10.03.16        Metodos numericos
---------------------------------------------------------------------------
Se puede utilizar para determinar raices de una funcion de la forma f(x), 
siempre y cuando se cumplan los criterios de convergencia.
---------------------------------------------------------------------------
Referencias:
1. Yang et al. (2005) - Applied numerical methods using MATLAB
---------------------------------------------------------------------------
%}
clear; clc; close all;

%% datos
%{
% ejemplo 1
f   = @(x) x.^2 -2;    % funcion objetivo
a   = 1;               % limite inferior del intervalo
b   = 2;               % limite superior del intervalo
x   = a:0.01:b;        % defino intervalo de busqueda

% funcion escogida para la iteracion
g  = @(x) 2./x;                  % no cumple convergencia
% g  = @(x) -0.5*((x-1).^2 - 3);   % si cumple convergencia
% g  = @(x) 0.5*(x + 2./x);        % si cumple convergencia
%}
%
% ejemplo 2
f   = @(x) x.^2 - 5*x + 3;   % funcion objetivo
a   = 0;                     % limite inferior del intervalo
b   = 5;                     % limite superior del intervalo
x   = a:0.01:b;              % defino intervalo de busqueda

% funcion escogida para la iteracion
g  = @(x) sqrt(5*x - 3);       % si cumple convergencia
%}

% criterios de convergencia
tol     = 1e-6;        % tolerancia
maxiter = 100;         % maximo numero de iteraciones

%% procedimiento
x0    = 1;                  % punto inicial
xx    = zeros(maxiter,1);   % espacio en memoria para los puntos de la iter
xx(1) = x0;                 % el primero sera el punto inicial
for k = 2:maxiter
   xx(k) = g(xx(k-1));   % Eq. (4.1.3)
   err   = abs(xx(k) - xx(k-1)); 
   if err <= tol
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
subplot(1,2,1);
plot(x,g(x)); grid on;  hold on;
plot(x,x,'k-');
plot(xx(1:k),g(xx(1:k)),'k*');
legend('g(x)','x=y','Location','Best');
set(gca,'FontSize',15);
%
subplot(1,2,2);
plot(x,f(x),'b-'); grid on;  hold on;
plot(xx(1:k),f(xx(1:k)),'k*');
plot(xx(k),f(xx(k)),'r*');
legend('f(x)','Puntos de la iteracion','Punto fijo','Location','Best');
set(gca,'FontSize',15);

%%END
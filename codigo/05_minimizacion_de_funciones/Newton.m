%% minimizacion de funciones por el metodo de Newton
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          19.04.16        Metodos numericos
---------------------------------------------------------------------------
Aplicable a función objetivo multivariada
---------------------------------------------------------------------------
Referencias:
1. Yang et al. (2005) - Applied numerical methods using MATLAB
---------------------------------------------------------------------------
%}
clear; clc; close all;

%% datos
%{
% ejemplo 1
f  = @(x) x(1).^2 + x(2).^2 - x(1).*x(2) - 4*x(1) - x(2);   % funcion objetivo
x0 = [0 0]';
%}
%
% ejemplo 2 (Rosembrock)
f  = @(x) 100*(x(2)-x(1).^2).^2 + (1-x(1)).^2;   % funcion objetivo
x0 = [0 2]';
%}

%% procedimiento
maxit = 100;     % maximo numero de iteraciones
tol   = 1e-6;    % tolerancia
delta = 1e-3;    % infinitesimal para el gradiente

n    = length(x0);
x    = zeros(n,maxit);
fx   = zeros(maxit,1);
grad = zeros(n,1);
Hess = zeros(n);
e    = eye(n);

% asigno valor inicial
x(:,1) = x0;

for k = 1:maxit-1
   % 1. Calculo de la matriz Hessiana y del gradiente numericamente (dif central)
   for i = 1:n      
      for j = 1:n
         Hess(i,j) = ( f(x(:,k) + delta*e(:,i) + delta*e(:,j)) - f(x(:,k) + delta*e(:,i)) ...
                      - f(x(:,k) + delta*e(:,j)) + f(x(:,k)) )/(delta^2);
      end
      grad(i) = (f(x(:,k) + delta*e(:,i)) - f(x(:,k) - delta*e(:,i)))/(2*delta);
   end
   
   % 2. Calculo punto siguiente
   x(:,k+1) = x(:,k) - Hess\grad;
   
   % control
   if norm(x(:,k+1)-x(:,k)) < tol
      break;
   end
end
xp  = x(:,k+1);
fxp = f(xp);
fprintf('\n%g iteraciones... El minimo de la funcion es (%g,%g)\n',k,xp(1),xp(2));

%% grafico
%{
% ejemplo 1
xx = 0:0.1:6;
yy = 0:0.1:4;
ff = @(x1,x2) x1.^2 + x2.^2 - x1.*x2 - 4*x1 - x2;           % funcion objetivo
%}
%
% ejemplo 2
xx = -2:0.1:2;
yy = -1:0.1:3;
ff = @(x1,x2) 100*(x2-x1.^2).^2 + (1-x1).^2;     % funcion objetivo
%}
[X,Y] = meshgrid(xx,yy);
figure;
pcolor(X,Y,ff(X,Y)); shading interp; colorbar; hold on;
contour(X,Y,ff(X,Y),15,'k');
plot(x(1,1:k+1),x(2,1:k+1),'r.-');
plot(xp(1),xp(2),'ro');

%%END
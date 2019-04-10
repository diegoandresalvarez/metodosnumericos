%% minimizacion de funciones por el metodo de Nelder-Mead
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          05.04.16        Metodos numericos
---------------------------------------------------------------------------
Aplicable a función objetivo multivariada
---------------------------------------------------------------------------
Referencias:
1. https://en.wikipedia.org/wiki/Nelder%E2%80%93Mead_method
2. Yang et al. (2005) - Applied numerical methods using MATLAB
---------------------------------------------------------------------------
%}
clear; clc; close all;

%% datos
%{
% ejemplo 1
f  = @(x1,x2) x1.^2 + x2.^2 - x1.*x2 - 4*x1 - x2;           % funcion objetivo
f2 = @(x) x(1).^2 + x(2).^2 - x(1).*x(2) - 4*x(1) - x(2);   % funcion objetivo
xx = 1:0.1:5;
yy = 0:0.1:4;

% puntos iniciales (vertices triangulo)
abc  = [ 1    1
         1.75 1.2
         1.5  0.5 ];
%}
%
% ejemplo 2 (Rosembrock)
f  = @(x1,x2) 100*(x2-x1.^2).^2 + (1-x1).^2;     % funcion objetivo
f2 = @(x) 100*(x(2)-x(1).^2).^2 + (1-x(1)).^2;   % funcion objetivo
xx = -2:0.1:2;
yy = -1:0.1:3;

% puntos iniciales (vertices triangulo)
abc  = [ -1.5 -1
         -2   -0.5
         -1    0 ];
%}
%{
% ejemplo 3 (Himmelblau)
f  = @(x1,x2) (x1.^2 + x2 - 11).^2 + (x1 + x2.^2 - 7).^2;       % funcion objetivo
f2 = @(x) (x(1).^2 + x(2) - 11).^2 + (x(1) + x(2).^2 - 7).^2;   % funcion objetivo
xx = -4:0.1:4;
yy = -4:0.1:4;

% puntos iniciales (vertices triangulo)
abc  = [ 0    0
        -1   -1
        -0.5  0 ];
%}

% para chequear convergencia
maxit = 100;                      % numero maximo de iteraciones
tol   = 1e-5;                     % tolerancia

%% Procedimiento
[X,Y] = meshgrid(xx,yy);
fabc  = f(abc(:,1),abc(:,2));   % evaluo la funcion en el simplex inicial

% grafico inicial
figure;
pcolor(X,Y,f(X,Y)); shading interp; colorbar; hold on;

k = 0;                 % inicio iteracion
b = 1; a = 0; c = 2;   % valores cualquiera solo para que inicie el while
while norm(b - a) + norm(c - b) >= tol
   
   % organizo los valores de f de menor a mayor y asigno los puntos
   [fabc,idx] = sort(fabc);
   a   = abc(idx(1),:);   fa  = fabc(idx(1));
   b   = abc(idx(2),:);   fb  = fabc(idx(2));
   c   = abc(idx(3),:);   fc  = fabc(idx(3));
   plot_triangle(f,abc,1);
   
   % calculo el centroide de ab
   m   = (a + b)/2;
   
   % calculo el punto de reflexion
   r   = m + 1*(m-c);   % aqui alpha = 1
   fr  = f2(r);
   if fa <= fr && fr < fb
      c  = r;
      fc = fr;
   end
   if fr < fa
      % calculo el punto de expansion
      e  = m + 2*(r-m);   % aqui gamma = 2
      fe = f2(e);
      if fe < fr
         c  = e;
         fc = fe;
      else
         c  = r;
         fc = fr;
      end
   elseif fr >= fb
      % calculo el punto de contraccion
      s  = m + 0.5*(c - m);   % aqui rho = 0.5
      fs = f2(s);
      if fs < fc,
         c  = s;
         fc = fs;
      else
         % calculo el punto de reduccion
         b  = a + 0.5*(b - a);   % Aqui sigma = 0.5
         c  = a + 0.5*(c - a);
         fb = f2(b);
         fc = f2(c);
      end
   end
   abc  = [a;b;c];
   fabc = f(abc(:,1),abc(:,2));
   
   % minimo
   xp  = a;
   fxp = fa;
   
   % otra iteracion
   k  = k+1;
   if k == maxit
      error('Se cumplio el numero maximo de iteraciones');
   end
end
plot(xp(1),xp(2),'r*');
fprintf('\n%g iteraciones... El minimo de la funcion es (%g,%g)\n',k,xp(1),xp(2));

%% solucion con fminsearch MATLAB
x0      = [0;0];              % punto inicial
[xa,fa] = fminsearch(f2,x0);
figure;
surf(X,Y,f(X,Y)); hold on;
plot3(xa(1),xa(2),fa,'r*'); axis tight; grid minor;
set(gca,'FontSize',15);
fprintf('\nMinimo usando fminsearch ---> (%g,%g)\n',xa(1),xa(2));

%%END
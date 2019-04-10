%% Interpolacion usando polinomios de Newton
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          27.02.16        Metodos numericos
---------------------------------------------------------------------------
Interpolacion polinomica en la forma de Newton
---------------------------------------------------------------------------
Referencias:
1. Yang et al. (2005) - Applied numerical methods using MATLAB
---------------------------------------------------------------------------
%}
clear; clc; close all;

%% datos
%{
% ejemplo 1
ptos = [ -2 -6
         -1  0
          1  0
          2  6
          4  60 ];
%}
%
% ejemplo 2
ptos = [ 0  0
         1  0.8415
         2  0.9093
         3  0.1411
         4 -0.7568
         5 -0.9589
         6 -0.2794 ];
%}
%{
% ejemplo 3
ptos = [ 1  0.1
         2  0.1
         3  0.1
         4  0
         5  0.4
         6  0
         7  0.3
         8  0.2
         9  0
         10 0.1 
         11 0
         12 0.3
         13 0.4 
         14 0.8
         15 0.8  ];
%}
x  = ptos(:,1);
y  = ptos(:,2);
m  = 50;          % numero de puntos que quiero interpolar

%% procedimiento
xx = linspace(min(x),max(x),m);   % defino los puntos donde se va a interpolar
N  = length(x);

% 1. calculo las diferencias divididas para hallar los coeficientes
D      = zeros(N,N);
D(:,1) = y;
for j = 1:N   % columnas
   for i = 1:N-j  % filas
      D(i,j+1) = (D(i+1,j) - D(i,j))/(x(i+j) - x(i));
   end
end
a = D(1,:);   % coeficientes del polinomio de Newton

% 2. calculo el polinomio de Newton
n = zeros(1,m);                  % inicio el polinomio de Newton
for i = 1:N
   mult = ones(1,m);
   for k = 1:i-1
      mult = mult.*(xx-x(k));   % calculo multiplicatoria
   end
   n = n + (a(i)*mult);   % calculo el polinomio de Newton
end

%% grafico
figure;
plot(x,y,'ro'); hold on; grid minor;
plot(xx,n,'b.-');
title(sprintf('Polinomio de Newton grado %g',N),'FontSize',16);
xlabel('x','FontSize',16); ylabel('y','FontSize',16);
legend('Datos','Polinomio de Newton','Location','Best');
set(gca,'FontSize',15);

%%END
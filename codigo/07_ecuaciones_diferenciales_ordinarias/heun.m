%% solucion de ecuaciones diferenciales ordinarias: metodo de Heun
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          24.04.16        Metodos numericos
---------------------------------------------------------------------------
Referencias:
1. Yang et al. (2005) - Applied numerical methods using MATLAB
---------------------------------------------------------------------------
%}
clear; clc; close all;

%% ejemplo
%{
% ejemplo 1
% dy(t)/dt = y(t)
f    = @(t,y) -y;
y0   = 1;                    % condicion inicial
tf   = 5;                    % tiempo final
y_ex = @(t) y0*exp(-t);      % solucion exacta
%}
%
% ejemplo 2
% dy(t)/dt + a*y(t) = r
a    = 1;                    % parametro 1
r    = 1;                    % parametro 2
f    = @(t,y) r - a*y;
y0   = 0;                    % condicion inicial
tf   = 4;                    % tiempo final
y_ex = @(t) (y0 - r/a)*exp(-a*t) + r/a;   % solucion exacta
%}

%% procedimiento
h  = 0.5;           % longitud de paso
t  = 0:h:tf;        % vector de tiempo
n  = length(t)-1;   % numero de puntos
y  = zeros(n,1);    % vector de solucion
%
y(1) = y0;          % aplico condicion inicial
for k = 1:n
   y(k+1) = y(k) + (h/2)*(f(t(k),y(k))+f(t(k+1),y(k)+h*f(t(k),y(k))));   % regla del trapecio
end

%% grafico
t_ex = 0:0.05:tf;
y_ex = y_ex(t_ex);
figure;
plot(t_ex,y_ex,'b-','LineWidth',2); hold on;
plot(t,y,'r--o','LineWidth',1); grid minor;
xlabel('t'); ylabel('y(t)');
legend('Exacta',sprintf('Heun (h=%g)',h),'Location','Best');
set(gca,'FontSize',15);

%%END
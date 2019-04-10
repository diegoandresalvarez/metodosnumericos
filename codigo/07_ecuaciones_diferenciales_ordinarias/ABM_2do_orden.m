%% metodo de Adams-Bashforth-Moulton de 2do orden
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
% y_ex = @(t) y0*exp(-t);      % solucion exacta
f    = @(t,y) -y;
y0   = 1;                    % condicion inicial
tf   = 5;                    % tiempo final
%}
%
% ejemplo 2
% dy(t)/dt + a*y(t) = r
% y_ex = @(t) (y0 - r/a)*exp(-a*t) + r/a;   % solucion exacta
a    = 1;                    % parametro 1
r    = 1;                    % parametro 2
f    = @(t,y) r - a*y;
y0   = 0;                    % condicion inicial
tf   = 4;                    % tiempo final
%}
%{
% ejemplo 3
f  = @(t,y) exp(4.*t) - 4*y;           % ODE
y0 = 2;                                % Initial condition
tf = 1.5;                              % tiempo final
%}

%% solucion con MATLAB
[t_ex,y_ex] = ode113(f,[0 tf],y0);   % non-stiff differential equations

%% procedimiento
h   = 0.1;            % longitud de paso
t   = 0:h:tf;         % vector de tiempo
n   = length(t);      % numero de puntos
yAB = zeros(n,1);     % vector de solucion Adams-Bashforth
yAM = zeros(n,1);     % vector de solucion Adams-Moulton

yAM(1) = y0;                           % aplico condicion inicial
yAM(2) = yAM(1) + h*f(t(1),yAM(1));    % segunda condicion usando Euler
for k = 1:n-2
   
   % Predictor: Adams-Bashforth
   yAB(k+2) = yAM(k+1) + (h/2)*(3*f(t(k+1),yAM(k+1)) - f(t(k),yAM(k)));
   
   % Corrector: Adams-Moulton
   yAM(k+2) = yAM(k+1) + (h/2)*(f(t(k+1),yAM(k+1)) + f(t(k+2),yAB(k+2))); 
   
   % longitud de paso variable
   kappa = abs(yAB(k+2)-yAM(k+2))/6;
   if kappa >= 0.5
      h = h/2;
   elseif kappa < 1e-6
      h = 2*h;
   end
end

%% grafico
% t_ex = 0:0.05:tf;
% y_ex = y_ex(t_ex);
figure;
plot(t_ex,y_ex,'b-','LineWidth',2); hold on;
plot(t,yAM,'r--o','LineWidth',1); grid minor;
xlabel('t'); ylabel('y(t)');
legend('Exacta',sprintf('ABM-2 (h=%g)',h),'Location','Best');
set(gca,'FontSize',15);

%%END
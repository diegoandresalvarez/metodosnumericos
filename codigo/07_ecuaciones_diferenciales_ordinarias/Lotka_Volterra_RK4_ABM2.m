%% solucion de ode de segundo grado (vector ode): metodo de Runge-Kutta
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

%% datos
% parametros positivos que describen la interaccion entre las 2 especies
alpha = 2/3;
beta  = 4/3;
gamma = 1;
delta = 1;

% defino ecuacion diferencial de Lotka-Volterra (espacio de estados)
tf = 20;                   % tiempo final
x0 = [1 1]';               % condiciones iniciales (numero de presa y predador)
f  = @(t,x) [ alpha*x(1) - beta*x(1)*x(2);
              delta*x(1)*x(2) - gamma*x(2) ];

%% procedimiento
h  = 0.1;           % longitud de paso
t  = 0:h:tf;        % vector de tiempo
n  = length(t)-1;   % numero de puntos

% RK
x1     = zeros(2,n);    % vector de solucion RK
x1(:,1) = x0;           % aplico condicion inicial
% ABM
x2      = zeros(2,n);                    % vector de solucion ABM
x2(:,1) = x0;                            % aplico condicion inicial
x2(:,2) = x2(:,1) + h*f(t(1),x2(:,1));   % segunda condicion usando Euler
%
tic;
for k = 1:n
   x1(:,k+1) = Runge_Kutta(f,t(k),x1(:,k),h,4);
   if k ~= n 
      x2(:,k+2) = Adams_Bashforth_Moulton(f,t(k:k+2),x2(:,k:k+1),h,2);
   end
end
toc;

%% grafico
% RK
figure;
subplot(211); plot(x1(1,:),x1(2,:),'k-','LineWidth',2); grid minor;
title('RK'); xlabel('Presa'); ylabel('Predador'); set(gca,'FontSize',12); 
subplot(212); plot(t,x1(1,:),'b-','LineWidth',2); hold on; 
plot(t,x1(2,:),'r-','LineWidth',2); grid minor;
xlabel('t'); ylabel('Poblacion'); legend('Prey','Predator');
set(gca,'FontSize',12); 

% ABM
figure;
subplot(211); plot(x2(1,:),x2(2,:),'k-','LineWidth',2); grid minor;
title('ABM'); xlabel('Presa'); ylabel('Predador'); set(gca,'FontSize',12); 
subplot(212); plot(t,x2(1,:),'b-','LineWidth',2); hold on; 
plot(t,x2(2,:),'r-','LineWidth',2); grid minor;
xlabel('t'); ylabel('Poblacion'); legend('Prey','Predator');
set(gca,'FontSize',12); 

%%END
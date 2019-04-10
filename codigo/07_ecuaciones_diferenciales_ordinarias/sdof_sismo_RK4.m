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

%% ejemplo

% aceleracion sismica de entrada
g     = 9.816;                      % aceleracion de la gravedad [m/s2]
data  = dlmread('tohoku_NS.txt');   % sismo de "Tohoku" o de "El centro"
t     = data(:,1);                  % [s]
acc   = data(:,2)*g;                % [m/s2]
n     = length(t)-1;                % numero de datos
h     = t(2)-t(1);                  % instante de tiempo (paso del RK4)

% grafico acelerograma
figure; 
plot(t,acc,'b-'); grid minor; xlim([0 max(t)]); ylabel('xddg(t) [m/s2]');

% parametros de la estructura
omega = 3.85;   % frecuencia natural de vibracion [rad/s]
xi    = 0.02;   % coeficiente de amortiguamiento critico [adim]

% defino ecuacion diferencial de movimiento (espacio de estados)
x0    = [0 0]';    % condiciones iniciales (parto del reposo)
xdd_g = @(tt) interp1(t,acc,tt,'linear');   % funcion para interpolar el sismo
f     = @(t,x) [  x(2);
                 -xdd_g(t) - 2*xi*omega*x(2) - omega^2*x(1)];

%% procedimiento
tic;
x      = zeros(2,n);    % vector de solucion
x(:,1) = x0;            % aplico condicion inicial
for k = 1:n
   k1       = f(t(k), x(:,k));
   k2       = f(t(k) + h/2, x(:,k) + h/2*k1);
   k3       = f(t(k) + h/2, x(:,k) + h/2*k2);
   k4       = f(t(k) + h, x(:,k) + h*k3);
   x(:,k+1) = x(:,k) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
end
xdd = -acc' - 2*xi*omega*x(1,:) - omega^2*x(2,:);   % aceleracion de la estructura
x   = [x; xdd];   % agrego la aceleracion al vector de solucion
toc;

%% grafico
figure;
subplot(311); plot(t,x(1,:),'r-','LineWidth',1); 
grid minor; ylabel('x(t) [m]'); set(gca,'FontSize',12); xlim([0 max(t)]);
subplot(312); plot(t,x(2,:),'k-','LineWidth',1); 
grid minor; ylabel('v(t) [m/s]'); set(gca,'FontSize',12); xlim([0 max(t)]);
subplot(313); plot(t,x(3,:),'b-','LineWidth',1); 
grid minor; ylabel('a(t) [m/s2]'); set(gca,'FontSize',12); xlim([0 max(t)]);
xlabel('t');

%%END
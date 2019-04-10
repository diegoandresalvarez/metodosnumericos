%% solucion del problema del pendulo doble
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          24.04.16        Metodos numericos
---------------------------------------------------------------------------
Referencias:
1. http://www.myphysicslab.com/dbl_pendulum.html
---------------------------------------------------------------------------
%}
clear; clc; close all;

%% datos
% parametros positivos que describen la interaccion entre las 2 especies
g  = 9.816;
m1 = 2;
m2 = 1;
l1 = 1;
l2 = 2;

% defino ecuacion diferencial del pendulo doble (espacio de estados)
tf = 30;                  % tiempo final
x0 = [pi/2 0 pi 0]';      % condiciones iniciales 
% x(1) = theta_1
% x(2) = theta_1'
% x(3) = theta_2
% x(4) = theta_2'
f  = @(t,x) [ x(2);
             (-g*(2*m1+m2)*sin(x(1)) - m2*g*sin(x(1)-2*x(3)) - 2*sin(x(1)-x(3))*m2*...
             (x(4)^2*l2 + x(2)^2*l1*cos(x(1)-x(3))))/(l1*(2*m1 + m2 - m2*cos(2*x(1)-2*x(3))));
              x(4);
             (2*sin(x(1)-x(3))*(x(2)^2*l1*(m1+m2) + g*(m1+m2)*cos(x(1)) + x(4)^2*l2*m2*cos(x(1)-x(3))))/...
             (l2*(2*m1 + m2 - m2*cos(2*x(1)-2*x(3)))) ];

%% procedimiento
h  = 0.05;          % longitud de paso
t  = 0:h:tf;        % vector de tiempo
n  = length(t)-1;   % numero de puntos

% RK
x1      = zeros(4,n);    % vector de solucion RK
x1(:,1) = x0;            % aplico condicion inicial
% ABM
x2      = zeros(4,n);                    % vector de solucion ABM
x2(:,1) = x0;                            % aplico condicion inicial
x2(:,2) = x2(:,1) + h*f(t(1),x2(:,1));   % segunda condicion usando Euler
tic;
for k = 1:n
   x1(:,k+1) = Runge_Kutta(f,t(k),x1(:,k),h,4);
   if k ~= n 
      x2(:,k+2) = Adams_Bashforth_Moulton(f,t(k:k+2),x2(:,k:k+1),h,2);
   end
end
toc;

%% solucion MATLAB
sol = ode45(f, [0 tf], x0);
xx  = deval(sol,t);

%% graficos
figure;
subplot(211);
plot(t,xx(1,:),'b-'); hold on; 
plot(t,x1(1,:),'r-'); plot(t,x2(1,:),'k-'); grid minor;
xlabel('t'); ylabel('\theta_1'); legend('ode45','myRK4','myABM2','Location','NW');
subplot(212);
plot(t,xx(3,:),'b-'); hold on; 
plot(t,x1(3,:),'r-'); plot(t,x2(3,:),'k-'); grid minor;
xlabel('t'); ylabel('\theta_2'); legend('ode45','myRK4','myABM2','Location','NW');

%% video
theta_1  = xx(1,:);
theta_1p = xx(2,:);
theta_2  = xx(3,:);
theta_2p = xx(4,:);

% preparo el archivo de video
v = VideoWriter('doble_pendulo.avi');
open(v);

figure;
h = plot(0,0,'MarkerSize',30,'Marker','.','LineWidth',2); 
axis([-(l1+l2) (l1+l2) -(l1+l2) (l1+l2)]); axis equal;
set(gca,'nextplot','replacechildren');
for i = 1:n
   xnod = [ 0  l1*sin(theta_1(i))  l1*sin(theta_1(i))+l2*sin(theta_2(i)) ];
   ynod = [ 0 -l1*cos(theta_1(i)) -l1*cos(theta_1(i))-l2*cos(theta_2(i)) ];
   set(h,'XData',xnod,'YData',ynod);  drawnow;
   frame = getframe;
   writeVideo(v,frame);
end
close(v);

%%END
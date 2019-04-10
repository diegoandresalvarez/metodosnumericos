%% Calculo el coseno de un angulo usando expansion en series
clear; clc; close all;

%% datos iniciales
theta = pi;      % angulo objetivo
tol   = 1e-10;   % tolerancia

%% calculo la formula
k       = 0;   % la expansion empieza en k=0
res     = 0;   % empiezo a acumular el valor de la serie entonces arranco en 0
res_old = 1;   % pongo 1 solo para que entre en el ciclo
while abs(res-res_old)>=tol
   res_old = res;
   res     = res + pot(-1,k)*pot(theta,2*k)/fact(2*k,'normal');
   k       = k+1;
   fprintf('Error absoluto = %g \n',abs(res-res_old));
end
fprintf('\nEl valor del coseno es: %g, en %g iteraciones\n',res,k);

%%END
%% integracion por cuadraturas de Gauss
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          12.04.16        Metodos numericos
---------------------------------------------------------------------------
Referencias:
1. Yang et al. (2005) - Applied numerical methods using MATLAB
---------------------------------------------------------------------------
%}
clear; clc; close all;
format long g;

%% ejemplos
%{
f = @(x) (log(1./x)).^4;       
a = 3;
b = 4;
%}
%{
f = @(x) (sin(x)).^5;       
a = 0; 
b = pi/2;                
%}
%
f = @(x) 4./(1+x.^2); 
a = 0;
b = 1;
%}

%% solucion MATLAB
int_ex = integral(f,a,b);   

%% procedimiento
N   = 10;          % numero de puntos de cuadratura a considerar
err = zeros(N,1);   
I   = zeros(N,1); 
S   = (b-a)/2;     % parametro de escala
T   = (a+b)/2;     % parametro de salto
for m = 1:N
    [xi,w] = gauss_quad(m,'legen');  % uso -Legendre
    I(m)   = S*sum(w.*f(S*xi + T));
    err(m) = abs(I(m) - int_ex);
end
fprintf('Integral MATLAB \t\t= %1.13f \n',int_ex);
fprintf('Integral cuadratura de Gauss \t= %1.13f con %g puntos\n',I(m),m);

%% grafico
figure;
semilogy(err,'ro-','LineWidth',2); grid minor;
xlabel('Numero de puntos en la cuadratura');
ylabel('Error');

%%END
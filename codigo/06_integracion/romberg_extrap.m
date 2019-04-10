%% integracion de Romberg
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          12.04.16        Metodos numericos
---------------------------------------------------------------------------
Extrapolación de Richardson reiterada en la regla del trapecio. 
---------------------------------------------------------------------------
Referencias:
1. Yang et al. (2005) - Applied numerical methods using MATLAB
---------------------------------------------------------------------------
%}
clear; clc; close all;

%% ejemplos
%{
% ejemplo 1
f = @(x) sqrt(1 + x.^3);
a = 1;
b = 4;
%}
%{
% ejemplo 2
f = @(x) x.^3+cos(x); 
a = 0;
b = 1;
%}
%
% ejemplo 3
f = @(x) 4./(1+x.^2); 
a = 0;
b = 1;
%}
%{
% ejemplo 4
f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;
a = 0;
b = 0.8;
%}

%% solucion MATLAB
int_ex_f = integral(f,a,b);

%% procedimiento
tol   = 1e-6;
maxit = 50;
h     = b-a; 
N     = 1;

I(1,1) = h/2*(f(a)+ f(b));   % trapecio inicial (simple)

for k = 1:maxit
   
   % 1. calculo regla del trapecio (compuesta)
   x = linspace(a,b,2^k+1);
   y = f(x);
   I(k+1,1) = trapz(x,y);
   
   % 2. extrapolacion de Richardson
   for n = 2:k+1
      I(k+1,n) = ((2^n)*I(k+1,n-1) - I(k,n-1))/((2^n) - 1);
   end
   
   % 3. calculo error
   err = abs( (I(k+1,k+1) - I(k,k))/I(k,k) );   % relativo
   if err < tol
      break; 
   end
end
int_r_f = I(k+1,k+1);

%% muestro resultados
fprintf('Integral MATLAB \t = %1.14f\n',int_ex_f);
fprintf('Integral por Romberg \t = %1.14f en %g iteraciones\n',int_r_f,k+1);
xx = a:0.05:b;
figure;
plot(xx,f(xx),'r-','LineWidth',2); grid minor;
legend('f(x)');
set(gca,'FontSize',18);

%%END
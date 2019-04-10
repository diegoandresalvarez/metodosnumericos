% Newton-Raphson method for root finding
%
% WHO   DATE            WHAT
% DAA   Apr 5, 2010    First algorithm
%
% DAA - Diego Andrés Alvarez Marín - diegoandresalvarez@gmx.net

f      = @(x) x^2 - 2;
fprima = @(x) 2*x;

x = 1;  % initial value of x
k = 0;  % iteration counter
while true
   xprev = x;
   x = x - f(x)/fprima(x);
   k = k + 1;
   if abs(x - xprev) < eps*abs(x)
      break
   end
end
format long
x
sqrt(2)
k

% TAREAS:
% 1. Alerte si f(x)  = 0
% 2. Alerte si f'(x) = 0
% 3. Incluya un límite superior en el número de iteraciones para evitar
% oscilaciones, convergencia lenta y soluciones divergentes
% 4. Implementar el método de la secante
% 5. Intente encontrar la raíz de la función
%  f(x) = sign(x-2)*sqrt(abs(x-2))
% sabiendo que esta existe entre 0 y 4. Hágalo con el método de la
% bisección, la secante y con Newton-Raphson. ¿Qué deduce?
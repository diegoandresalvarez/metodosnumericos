% Polynomial interpolation
%
% WHO   DATE            WHAT
% DAA   Mar 1, 2010    First algorithm
%
% DAA - Diego Andrés Alvarez Marín - diegoandresalvarez@gmx.net

% Input the data points
n = 10; %number of data points
x = zeros(n,1);
y = zeros(n,1);
figure
title(sprintf('Click with the mouse %d times. The polynomial will pass through those points',n))
axis([-5 5 -5 5]);
hold on;
for i = 1:n
   [x(i),y(i)] = ginput(1);
   plot(x(i), y(i), 'r*');
end;

% Polynomial curve fitting
% Calculate the coefficients in the approximating polynomial of degree n-1
p = polyfit(x,y,n-1);

% Evaluate the polynomial at the data points
f = polyval(p,x);

% A table showing the data, fit, and error
 table = [x y f y-f]

% Extrapolating is not good!
xx = (-10: 0.1: 10)';
ff = polyval(p,xx);
plot(xx,ff,'b-')
axis([-10  10  -5  5]);

% Finally notice that using
pp = (vander(x)\y)';
% we can calculate vector p easily, indeed:
p-pp

% TAREA:
% En vez de usar la función polyfit, implemente de nuevo utilizando la
% fórmula de Lagrange
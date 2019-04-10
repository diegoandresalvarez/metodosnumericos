% Interpolation of parametric curves
%
% WHO   DATE            WHAT
% DAA   Mar 11, 2010    First algorithm
%
% DAA - Diego Andrés Alvarez Marín - diegoandresalvarez@gmx.net
 
% Input the data points
n = 15; %number of data points
x = zeros(n,1);
y = zeros(n,1);
figure
title(sprintf('Put your hand on the screen and try to delineate it using %d points',n))
axis([-5 5 -5 5]);
hold on;
for i = 1:n
   [x(i),y(i)] = ginput(1);
   plot(x(i), y(i), 'r*');
end;
 
t = (1:n)';
ti = linspace(1,n,101);
xi = interp1(t,x,ti,'spline');
yi = interp1(t,y,ti,'spline');

plot(xi,yi,'k-','LineWidth',2);
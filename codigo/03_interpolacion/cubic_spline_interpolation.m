% Cubic spline interpolation
%
% WHO   DATE            WHAT
% DAA   Sep 2, 2009    First algorithm
%
% DAA - Diego Andrés Alvarez Marín - diegoandresalvarez@gmx.net

% This is the function we want to interpolate
myfunction = @(x) cos(x/2);

% We define the pivot points
x = 0:2:10;
f = myfunction(x);

% number of pivot points
n = length(x);

% Reserve memory for A and b
A = sparse(n-1,n-1);
b = zeros(n-1,1);

% Assemble system of equations
% copy and paste the expressions inside the loop replacing i by 2
A(1,[1 2]) = [2*(x(3)-x(1))  x(3)-x(2)];
b(1)   = 6*(f(3)-f(2))/(x(3)-x(2)) - 6*(f(2)-f(1))/(x(2)-x(1));
for i = 3:n-1
   A(i-1,[i-2 i-1 i]) = [(x(i)-x(i-1))   2*(x(i+1)-x(i-1))   (x(i+1)-x(i))];
   b(i-1)             = 6*(f(i+1)-f(i))/(x(i+1)-x(i)) - 6*(f(i)-f(i-1))/(x(i)-x(i-1));
end
% copy and paste the expressions inside the loop replacing i by n-1
A(n-1,[n-2 n-1]) = [x(n-1)-x(n-2)   2*(x(n)-x(n-2))];
b(n-1)           = 6*(f(n)-f(n-1))/(x(n)-x(n-1)) - 6*(f(n-1)-f(n-2))/(x(n-1)-x(n-2));

% Solve the system of equations and add the conditions f''(x0) = 0 and f''(xn) = 0
fpp = [0; A\b; 0]; %[0 f''(2) f''(3) ... f''(n-1) 0]

% We will interpolate the on the interval
xx = 0:0.2:10;
ff = zeros(size(xx));

% For all the points...
for j = 1:length(xx)
   % Retrieve the interval of the point xx(i)
   for i = 2:n
      if (x(i-1) <= xx(j)) && (xx(j) <= x(i))
         % Evaluate the interpolation
         ff(j) = fpp(i-1)*(x(i) - xx(j))^3/(6*(x(i)-x(i-1))) + ...
            fpp(i)*(xx(j) - x(i-1))^3/(6*(x(i)-x(i-1))) + ...
            (f(i-1)/(x(i)-x(i-1)) - fpp(i-1)*(x(i)-x(i-1))/6)*(x(i)-xx(j)) + ...
            (f(i)/(x(i)-x(i-1))   - fpp(i)*(x(i)-x(i-1))/6)*(xx(j)-x(i-1));
         break;
      end;
   end
end;

% Do the plots
figure;
plot(0:0.1:10,myfunction(0:0.1:10),'LineWidth',4); hold on;
plot(x,f,'ko',xx,ff,'gx-','MarkerSize',10,'LineWidth',2);
legend('function','pivot points','interpolation','Location','Best');

% TAREA: escribir una función para hacer interpolación con segmentos de
% parábola, tal que haya continuidad en las primeras derivadas de los puntos nodo

function [x,c,P] = gausslegendre_quad(m)
% Integration using a Gauss-Legendre quadrature:
%
% Run the following example:
%{
m = 10;

[x,c,P] = gausslegendre_quad(m);

xx = linspace(-1,1,100);
yy = zeros(m,100);
for i = 1:m+1
   yy(i,:) = polyval(P(i,1:i),xx);
end;

figure
plot(xx,yy);
hold on;
legend(num2str((1:m)'));
plot(x,zeros(size(x)),'ro');
grid on

a = 0; b = 0.8;
f = @(x) 0.2 + 25*x - 200*x.^2 +675*x.^3 - 900*x.^4 + 400*x.^5;
((b-a)/2)*sum(c.*f((b+a)/2 + (b-a)*x/2)) - 3076/1875

a = 0; b = pi/2;
f = @(x) sin(x);
((b-a)/2)*sum(c.*f((b+a)/2 + (b-a)*x/2)) - 1
%}

% WHO   DATE            WHAT
% DAA   Mar 11, 2010    First algorithm
%
% DAA - Diego Andrés Alvarez Marín - diegoandresalvarez@gmx.net

% Gaussian quadrature Xs and Cs

P = zeros(m+1,m+1);
P([1,2],1) = 1;
for n = 1:m-1
  P(n+2,1:n+2) = ((2*n+1)*[P(n+1,1:n+1) 0] - n*[0 0 P(n,1:n)])/(n+1);
end
x = sort(roots(P(m+1,1:m+1)));

A = zeros(m,m);
b = zeros(m,1);
for i=1:m
  A(i,:) = x.^(i-1)';
  b(i) = (1-(-1)^i)/i;
end
c = A\b;

return;
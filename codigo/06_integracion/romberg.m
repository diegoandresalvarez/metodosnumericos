function integral = romberg(f, a, b, tol)
% Romberg integration:
%
% Usage:
%                     integral = romberg(f,a,b)
%
% where:
% f   - function handle containing function
% a,b - limits of integration
% tol - absolute tolerance of integration error
%
% Example:
%
% f = @(x) x.^3+cos(x); % RESPUESTA ES (4*sin(1)+1)/4 = 1.091470984807897
% a = 0;
% b = 1;
% tol   = 1e-10;
% integral = romberg(f, a, b, tol)
%

% WHO   DATE            WHAT
% DAA   Mar 11, 2010    First algorithm
%
% DAA - Diego Andrés Alvarez Marín - diegoandresalvarez@gmx.net
 
if nargin == 0
    help romberg
    return;
end;

I = zeros(15,15);
 
I(1,1) = trapecio(f,a,b,1);
i = 0;
while true
   i = i+1;
   I(i+1,1) = trapecio(f,a,b,2^i);
   for k = 2:i+1
      j = 2+i-k;
      I(j,k) = ((4^(k-1))*I(j+1,k-1) - I(j,k-1))/((4^(k-1)) - 1);
   end;
   err = abs((I(1,i+1) - I(1,i))/I(1,i));
   if (err < tol)
      break;
   end;
end;
 
integral = I(1,i+1);
return;

function I = trapecio(f,a,b,n)
x = linspace(a,b,n+1);
y = f(x);
I = trapz(x,y);
return

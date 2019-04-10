% Root finding using the bisection method
%
% WHO   DATE            WHAT
% DAA   Apr 5, 2010     First algorithm
%
% DAA - Diego Andrés Alvarez Marín - diegoandresalvarez@gmx.net

f = @(x) sin(x);
a = 1;
b = 4;

k = 0;
while abs(b-a) > eps*abs(b)
   x = (a + b)/2;
   if sign(f(x)) == sign(f(b))
      b = x;
   else
      a = x;
   end
   k = k + 1;
end

format long
fprintf('Number of iterations k = %d\n', k);
[ a b ]

% The HEX display corresponds to the internal representation of the value
% and is not the same as the hexadecimal notation in the C programming
% language

format hex
% See that the bounds differ just in one bit:
[ a b ]

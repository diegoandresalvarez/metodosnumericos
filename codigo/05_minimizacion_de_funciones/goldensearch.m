function minimo = goldensearch(f)
% Golden Section Method
% Minimización de línea basado en el método de la búsqueda áurea
% We can improve a lot this code. It works only if the function as indeed a minimum
%
% Reference:
% [Bazaraa et. al.; 1993], [Jang, et. al.; 1997] y [Press, et. al.; 1992]
%
% Example
% minimum = goldensearch(@(x) cos(x));

h = 1e-6; % initial step
maxit = 50; % maximum number of iterations

% Initial bracketing
% NOTE: we will use x(1) in case we go uphill
i = 2;
x(2) = 0;  fx(2) = f(x(2));
x(3) = h;  fx(3) = f(x(3));

if fx(2) < fx(3) % go uphill
   k = 0;
   while fx(2) < fx(3) % maybe initial h was too large
      k = k+1;
      h = h/2;
      x(3) = h;     fx(3) = f(x(3));
      if k > maxit
         break;
      end;
   end;
   if h > 1e-12 % minimum was between 0 and initial h
      minimo = h;
      return;
   else % go uphill
      h = -h;
      x(1) = x(3);          fx(1) = fx(3);
      x(3) = x(2) + h;      fx(3) = f(x(3));
   end;
end;


while fx(i) >= fx(i+1)
   i = i+1;                h = 2*h;
   x(i+1) = x(i) + h;       fx(i+1) = f(x(i+1));
   if i > maxit
      % Probably minimum is too far from here
      break;
   end;
end

% Using x(i-1), x(i) y x(i+1) perform golden search
a(1) = min(x(i-1),x(i+1));
b(1) = max(x(i-1),x(i+1));
 
alfa = 0.61803398874989; %=(sqrt(5)-1)/2

% a < izq < der < b
k = 1;
izq(1) = a(1) + (1-alfa)*(b(1)-a(1)); fizq(1) = f(izq(1));
der(1) = a(1) +    alfa *(b(1)-a(1)); fder(1) = f(der(1));

l = 3e-8*abs(a(1)+b(1))/2; % length of final interval
% According to "Numerical Recipes", the interval that contains
% the optimum should be
%                (1-e)*x < x < (1+e)*x
% here e = sqrt(eps = 1e-15) = approx 3e-8
%      x is a number close to the minimum

while (b(k) - a(k)) > l 
%   l = 3e-8*abs(a(k)+b(k))/2;
   if fizq(k) > fder(k)
      a(k+1) = izq(k);         b(k+1) = b(k);
      izq(k+1) = der(k);       der(k+1) = a(k+1) + alfa*(b(k+1)-a(k+1));
      fizq(k+1) = fder(k);     fder(k+1) = f(der(k+1));
   else % if fizq(k) < fder(k)
      a(k+1) = a(k);           b(k+1) = der(k);
      der(k+1) = izq(k);       izq(k+1) = a(k+1) + (1-alfa)*(b(k+1)-a(k+1));
      fizq(k+1) = f(izq(k+1)); fder(k+1) = fizq(k);
   end;
   k = k+1;
end;

minimo = (a(k)+b(k))/2;

%  figure;
%  plot(x(2:end),fx(2:end),'o', ...
%       izq,fizq,'o', ...
%       der,fder,'o', ...
%       minimo,f(minimo),'*');

return; %bye bye
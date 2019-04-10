function [x, fx, grad] = steepest(f,x0)
% Steepest descent minimization
%
% The steepest descent method has problems trying to minimize
% Rosenbrock's function
% [x, fx, grad] = steepest(@(x) rosenbrock(x), [-2 -1]);
% plot(x(:,1),x(:,2))
% grad % A check to confirm that we have not reached yet the minimum
%
% [x, fx, grad] = steepest(@(x) peaks2(x), [-1 1]);


maxit = 100;    % maximum number of iterations
tol   = 1e-2;    % tolerance for gradient
delta = 0.001;   % for calculating the gradient

n  = length(x0);
x  = zeros(maxit,n);
fx = zeros(maxit,1);

x(1,:) = x0(:)';
fx(1)  = f(x(1,:));

grad = zeros(1,n); %reserve memory for grad
for j = 1:(maxit-1)
   % Compute gradient using finite differences
   for i = 1:n
      xdelta = x(j,:);
      xdelta(i) = xdelta(i) + delta;
      grad(i) = (f(xdelta) - fx(j))/delta;
   end;

   % Compute optimal step eta*
   eta = goldensearch(@(eta) f(x(j,:) - eta*grad));
   x(j+1,:) = x(j,:) - eta*grad;
   fx(j+1)  = f(x(j+1,:));

%    [j+1 x(j+1,:) fx(j+1,:) norm(grad)]
   
   if norm(grad) < tol
      break;
   end;
end;

x  =  x(1:j+1,:);
fx = fx(1:j+1);

return;
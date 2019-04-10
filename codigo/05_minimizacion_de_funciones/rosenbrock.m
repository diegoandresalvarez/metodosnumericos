function f = rosenbrock(x)
f = 100*(x(:,2)-x(:,1).^2).^2 + (1-x(:,1)).^2 ;
return;
 
% Si quiere ver la función, remueva los comentarios:
%  x = -2:0.1:2;
%  y = -1:0.1:2;
%  [xx,yy] = meshgrid(x,y);
%  ros = rosenbrock([xx(:),yy(:)]);
%  ros = reshape(ros,size(xx));
%  mesh(xx,yy,ros)
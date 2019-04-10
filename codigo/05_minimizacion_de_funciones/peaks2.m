function z = peaks2(input)
x = input(:,1); y = input(:,2);
z =  3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) ...
   - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ...
      - 1/3*exp(-(x+1).^2 - y.^2);
return;

% Si quiere ver la función, remueva los comentarios
%  x = -2:0.1:2;
%  y = -1:0.1:2;
%  [xx,yy] = meshgrid(x,y);
%  z  = peaks2([xx(:),yy(:)]);
%  zz = reshape(z,size(xx));
%  mesh(xx,yy,zz)
%  xlabel('x')
%  ylabel('y')
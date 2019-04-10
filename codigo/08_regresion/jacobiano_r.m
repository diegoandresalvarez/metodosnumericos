function [J,JT] = jacobiano_r(x,theta)
m = length(x);     % numero de datos de entrenamiento
n = length(theta); % numero de parametros ajustables = 2
JT = zeros(n,m);

for p = 1:m
    JT(:,p) = -gradientef_theta(x(p),theta);
end;

J = JT';
return;


function gf = gradientef_theta(x,theta)
gf = [...
    x.^2*sech(theta(2)*x.^3 + theta(1)*x.^2)^2 + 5*theta(1).^4;
    x.^3*sech(theta(2)*x.^3 + theta(1)*x.^2)^2;
]; 
return;
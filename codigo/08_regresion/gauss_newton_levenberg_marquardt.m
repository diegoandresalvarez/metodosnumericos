clear
clc
close all
f = @(x,theta) tanh(theta(1)*x.^2 + theta(2).*x.^3) + theta(1).^5;

% Calcule con MAXIMA las derivadas
%(%i1) y : tanh(t1*x^2 + t2*x^3) + t1^5;
%(%o1) tanh(t2*x^3+t1*x^2)+t1^5
%(%i2) diff(y, t1);
%(%o2) x^2*sech(t2*x^3+t1*x^2)^2+5*t1^4
%(%i3) diff(y, t2);
%(%o3) x^3*sech(t2*x^3+t1*x^2)^2

E = @(t,x,theta) sum((t-f(x,theta)).^2);

thetaOK = [0.4; -2];

x = (-2:0.1:2)';
t = f(x,thetaOK) + 0.1*randn(size(x));

xx = (-2:0.1:2)';
tt = f(x,thetaOK);

theta1 = 0:0.1:0.7;
theta2 = -3:0.1:-1;
[ttheta1,ttheta2] = meshgrid(theta1,theta2);
err = zeros(length(theta2),length(theta1));
for i=1:length(theta1)
   for j=1:length(theta2)
      err(j,i) = E(t,x,[theta1(i);theta2(j)]);
   end
end

figure;
contour(ttheta1,ttheta2,err,200,'k');
hold on;
surf(ttheta1,ttheta2,err);
shading interp
alpha(0.3)
plot(thetaOK(1),thetaOK(2),'r+');
xlabel('t1')
ylabel('t2')
view(3)

figure;
plot(xx,tt,'b-',x,t,'r+');
hold on

theta_now = unifrnd(-5,5,2,1);

it = 0;
while true
    it = it+1;
    r = t - f(x,theta_now);
    [J,JT] = jacobiano_r(x,theta_now);
    JTJ = JT*J;
    
    % lambda = 1.1*max(0,-min(eig(JTJ))); es equivalente a:
    vppeq = min(eig(JTJ));
    if vppeq >= 0
      lambda = 0;
    else
      lambda = -1.1*vppeq;
    end;

    H = JTJ + lambda*eye(2,2); % Calculo la matriz Hessiana
    g = JT*r;                % Calculo el gradiente
    
    dtheta = H\g;
    etaa = goldensearch(@(etaa) E(t,x,[theta_now(1);theta_now(2)] + etaa*dtheta));
    theta_next = theta_now + etaa*dtheta;

   fprintf('it = %d, eta = %g, normagrad = %g, ERROR = %g\n', it, etaa, norm(dtheta), E(t,x,[theta_next(1);theta_next(2)]));

    if norm(dtheta) < 0.001
      disp('EL ALGORITMO HA CONVERGIDO')
      theta = theta_next
      thetaOK
      ttest = f(x,theta);
      figure(2)
      plot(xx,ttest,'g-');
      legend('original','puntos','estimada');
      
      figure(1)
      plot(theta(1),theta(2),'b*');
      break;
    end;
    theta_now = theta_next;

   if it > 60
      error('El algoritmo no convergio');
      break;
   end;
    
end;
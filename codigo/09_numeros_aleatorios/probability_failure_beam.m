% Monte Carlo method for estimating the probability of failure of a beam
%
% WHO   DATE            WHAT
% DAA   Apr 5, 2010    First algorithm
%
% DAA - Diego Andrés Alvarez Marín - diegoandresalvarez@gmx.net

L = 10; % m
I = 0.1*0.3^3/12; % m^4

% Performance function
g = @(P,E) L/360 - P.*L^3./(48*E*I);

% Número de simulaciones de Monte Carlo
N = 1000000;

% P ~ norm(media = 27 kN, std = 10 kN);
P = normrnd(27,10,N,1);

% E ~ logn(media = 210e6 kPa, std = 21e6 kPa);
m = 210e6;  % media de E
v = 21e6^2; % varianza de E
mu    = log((m^2)/sqrt(v+m^2));
sigma = sqrt(log(v/(m^2)+1));
E = lognrnd(mu,sigma,N,1);

figure
plot(P,E,'r.');
[PP,EE] = meshgrid(linspace(0, 80, 50), linspace(1e8, 3.5e8, 100));
hold on;
contour(PP,EE,g(PP,EE),[0 0],'LineWidth',5);
xlabel('P - carga')
ylabel('E - modulo de Young')

% And the probabilty of failure is:
Pf = mean(g(P,E) <= 0)

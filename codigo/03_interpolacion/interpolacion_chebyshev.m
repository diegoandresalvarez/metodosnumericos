%% Interpolacion usando polinomios de Chebyshev
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          27.02.16        Metodos numericos
---------------------------------------------------------------------------
Interpolacion polinomica en la forma de Chebyshev
---------------------------------------------------------------------------
Referencias:
1. Yang et al. (2005) - Applied numerical methods using MATLAB
---------------------------------------------------------------------------
%}
clear; clc; close all;

%% datos
f  = @(x) 1./(1+8*x.^2);         % funcion de Runge a interpolar
N  = 4;                          % grado del polinomio de Newton

% defino nodos de Chebyshev
k     = 0:N;                           % vector con numero de puntos
theta = ((2*N+1 - 2*k)/(2*N + 2))*pi;  % angulos para hallar los nodos
xp    = cos(theta);                    % nodos de Chebyshev en [-1,1]
a     = -1;                            % limite inferior del intervalo
b     = 1;                             % limite superior del intervalo
xx    = (b-a)/2*xp + (a+b)/2;          % nodos de Chebyshev en [a,b]
ptos  = [ xx; f(xx) ]';                % puntos muestrales para hacer interpolacion
%
x  = ptos(:,1);
y  = ptos(:,2);
m  = 100;          % numero de puntos que quiero interpolar

%% procedimiento
% calculo polinomios de Chebyshev usando formula recursiva
P    = cell(N+1,1);
P{1} = 1;       % T_0 = 1
P{2} = [1 0];   % T_1 = x      
for n = 2:N
   P{n+1} = 2*[P{n} 0] - [0 0 P{n-1}];
end

% calculo coeficientes d (forma 1)
d    = zeros(N+1,1);
d(1) = y'*ones(N+1,1)/(N+1);   % primer d0
for i = 2:N+1
   d(i) = (2/(N+1))*(y'*polyval(P{i},xp)');
end
%{
% calculo coeficientes d (forma 2)
a = cos(theta'*(0:N));   % Chebyshev Vandermonde matrix
d = a\y;
%}

% calculo la aproximacion
c  = zeros(1,m);
xx = linspace(min(x),max(x),m);   % defino los puntos donde se va a interpolar
for i = 1:N+1
   xp = (2/(b-a))*(xx-((a+b)/2));   % transformo x a x'
   c  = c + d(i)*polyval(P{i},xp);
end

%% grafico
figure;
plot(xx,f(xx),'b-'); hold on; grid minor; axis equal tight;
plot(x,y,'bo'); 
plot(xx,c,'r--');
title(sprintf('Polinomio de Chebyshev grado %g',N),'FontSize',16);
xlabel('x','FontSize',16); ylabel('y','FontSize',16);
legend('Funcion de Runge','Nodos Chebyshev','Polinomio de Chebyshev','Location','Best');
set(gca,'FontSize',15);

%%END
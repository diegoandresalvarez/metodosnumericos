%% integracion por reglas de Newton-Cotes
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          12.04.16        Metodos numericos
---------------------------------------------------------------------------
Referencias:
1. Yang et al. (2005) - Applied numerical methods using MATLAB
---------------------------------------------------------------------------
%}
clear; clc; close all;

%% ejemplos

% ejemplo 1
f = @(x) sqrt(1 + x.^3);
a = 1;
b = 4;

%% solucion MATLAB

% simbolico
syms xx; 
int_ex_f1 = double(int(sqrt(1 + xx^3),xx,a,b));

% numerico
int_ex_f2 = integral(f,a,b);   % si su version no tiene 'integrate' use 'quad'

%% uso reglas de integracion
% regla del punto medio
n = 8;
[int_rs_f,int_rc_f] = midpoint_rule(f,a,b,n);

% regla del trapecio
n = 8;
[int_ts_f,int_tc_f] = trapezoidal_rule(f,a,b,n);

% regla de Simpson
n = 8;
[int_ss_f, int_sc_f] = simpson_rule(f,a,b,n);

%% muestro resultados
% simples
fprintf('Integral por Rectangulo simple = %g\n',int_rs_f);
fprintf('Integral por Trapecio simple = %g\n',int_ts_f);
fprintf('Integral por Simpson simple = %g\n\n',int_ss_f);

% compuestos
fprintf('Integral por Rectangulo compuesto = %g\n',int_rc_f);
fprintf('Integral por Trapecio compuesto = %g\n',int_tc_f);
fprintf('Integral por Simpson compuesto = %g\n\n',int_sc_f);

fprintf('Integral Exacta = %g\n\n',int_ex_f2);

%%END
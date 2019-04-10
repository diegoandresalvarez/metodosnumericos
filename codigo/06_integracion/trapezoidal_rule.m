function [int_ts_f,int_tc_f] = trapezoidal_rule(f,a,b,n)
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          12.04.16        Metodos numericos
---------------------------------------------------------------------------
%}

%% trapecio simple
h   = b-a;
f_0 = f(a);
f_1 = f(b);

int_ts_f = (h*(f_0 + f_1))/2; 

%% Trapecio compuesto
h     = (b-a)/n;
x     = a:h:b;
int_s = 0;
for k = 2:n
   int_s = int_s + 2*f(x(k));
end
int_tc_f = (h/2)*(f(a) + f(b) + int_s);

return;
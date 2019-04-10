function [int_rs_f,int_rc_f] = midpoint_rule(f,a,b,n)
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          12.04.16        Metodos numericos
---------------------------------------------------------------------------
%}

%% rectangulo simple
h   = b-a;
f_0 = f((a+b)/2);

int_rs_f = h*f_0; 

%% rectangulo compuesto
h     = (b-a)/n;
x     = a:h:b;
int_s = 0;
for k = 1:n+1
   int_s = int_s + f(x(k));
end
int_rc_f = h*int_s;

return;
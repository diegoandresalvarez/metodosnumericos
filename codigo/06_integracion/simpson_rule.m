function [int_ss_f,int_sc_f] = simpson_rule(f,a,b,n)
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          12.04.16        Metodos numericos
---------------------------------------------------------------------------
%}

%% Simpson simple
h   = b-a;
f_0 = f(a);
f_1 = f((a+b/2));
f_2 = f(b);

int_ss_f = (h*(f_0 + 4*f_1 + f_2))/3; 

%% Simpson compuesto
h     = (b-a)/n;
int_s = 0;
for k = 0:((n/2)-1)
   x     = a + (2*k+1)*h;
   int_s = int_s + 4*f(x);
end
for k = 1:((n/2)-1)
   x     = a + (2*k)*h;
   int_s = int_s + 2*f(x);
end

int_sc_f = (h/3)*(f(a) + f(b) + int_s);

return;
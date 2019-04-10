function x_kh = Runge_Kutta(diff_eq,t_k,x_k,h,metodo)
%{
Metodos de Runge-Kutta de varios ordenes (explicito)
--------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          26.04.16        Metodos numericos
--------------------------------------------------------------------------
%}

%%
switch metodo;
   case 1 % Heun
      k1   = diff_eq(t_k, x_k);
      k2   = diff_eq(t_k + h, x_k + h*k1);
      x_kh = x_k + (h/2)*(k1 + k2);
   case 2 % Ralston
      k1   = diff_eq(t_k, x_k);
      k2   = diff_eq(t_k + 2*h/3, x_k + (2*h/3)*k1);
      x_kh = x_k + (h/4)*(k1 + 3*k2);
   case 3 % RK3
      k1   = diff_eq(t_k, x_k);
      k2   = diff_eq(t_k + h/2, x_k + h/2*k1);
      k3   = diff_eq(t_k + h, x_k - h*k1 + 2*h*k2);
      x_kh = x_k + (h/6)*(k1 + 4*k2 + k3);
   case 4 % RK 4
      k1   = diff_eq(t_k, x_k);
      k2   = diff_eq(t_k + h/2, x_k + h/2*k1);
      k3   = diff_eq(t_k + h/2, x_k + h/2*k2);
      k4   = diff_eq(t_k + h, x_k + h*k3);
      x_kh = x_k + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
   case 5 % RK 3/8
      k1   = diff_eq(t_k, x_k);
      k2   = diff_eq(t_k + h/3, x_k + h/3*k1);
      k3   = diff_eq(t_k + 2*h/3, x_k - h/3*k1 + h*k2);
      k4   = diff_eq(t_k + h, x_k + h*k1 - h*k2 + h*k3);
      x_kh = x_k + (h/8)*(k1 + 3*k2 + 3*k3 + k4);
end

return;
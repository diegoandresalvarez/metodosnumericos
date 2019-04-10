function x_next = Adams_Bashforth_Moulton(diff_eq,t,x,h,metodo)
%{
Metodos de Adams-Bashforth-Moulton de varios ordenes 
--------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          26.04.16        Metodos numericos
--------------------------------------------------------------------------
%}

%%
switch metodo;
   case 1;   % ABM 2 (requiere 1 punto)
      t_k = t(1);    t_kh = t(2);
      x_k = x(:,1);
      % Predictor-Corrector
      x_tilde = x_k + h*(diff_eq(t_k,x_k));
      x_next  = x_k + h*(diff_eq(t_kh,x_tilde));
   case 2;   % ABM 2 (requiere 2 puntos)
      t_k = t(1);    t_kh = t(2);    t_k2h = t(3);
      x_k = x(:,1);  x_kh = x(:,2);
      % Predictor-Corrector 
      x_tilde = x_kh + (h/2)*(3*diff_eq(t_kh,x_kh) - diff_eq(t_k,x_k));
      x_next  = x_kh + (h/2)*(diff_eq(t_kh,x_kh) + diff_eq(t_k2h,x_tilde));      
   case 3;   % ABM 3 (requiere 3 puntos)
      t_k = t(1);    t_kh = t(2);    t_k2h = t(3);  t_k3h = t(4);
      x_k = x(:,1);  x_kh = x(:,2);  x_k2h = x(:,3);
      % Predictor-Corrector 
      x_tilde = x_k2h + (h/12)*(23*diff_eq(t_k2h,x_k2h) - 16*diff_eq(t_kh,x_kh) + 5*diff_eq(t_k,x_k));
      x_next  = x_k2h + (h/12)*(5*diff_eq(t_k3h,x_tilde) + 8*diff_eq(t_k2h,x_k2h) - diff_eq(t_kh,x_kh)); 
end

return;
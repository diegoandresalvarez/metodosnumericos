function f = fact(n,metodo)
%{
Ejemplo:
tic; fact(15,'recursive'); toc;
tic; fact(15,'normal'); toc;
%}

switch metodo
   case 'recursion'   % OPC 1: creo funcion recursiva
      if (n == 0 || n==1)
         f  = 1;
      else
         f = n*fact(n-1,metodo);
      end
      
   case 'normal'      % OPC 2: creo funcion normal
      f = 1;
      for k = 1:n
         f = k*f;
      end
end

return;
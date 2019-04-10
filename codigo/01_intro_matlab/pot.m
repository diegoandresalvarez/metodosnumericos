function p = pot(x,n)
%{
Ejemplo:
tic; pot(5,3); toc;
%}
p = 1;
for i = 1:n
   p = x*p;
end

return;
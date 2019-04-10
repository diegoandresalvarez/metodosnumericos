function plot_triangle(f,abc,d)
%{
---------------------------------------------------------------------------
Creado por:                    Fecha:          Asignatura:
Felipe Uribe Castillo          05.04.16        Metodos numericos
---------------------------------------------------------------------------
d = 1: graficar triangulo en el plano (pcolor)
d = 2: graficar triangulo en el espacio (surf)
---------------------------------------------------------------------------
%}

if d == 1;
   plot(abc(:,1),abc(:,2),'g.');
   patch(abc(:,1),abc(:,2),'g','EdgeColor','green','FaceColor','none','LineWidth',2);
else   
   % corregir (o modificar para usar un fill3)
   [Xtri,Ytri] = meshgrid(abc(:,1),abc(:,2));
   plot3(abc(:,1),abc(:,2),f(abc(:,1),abc(:,2)),'ro');
   patch(Xtri,Ytri,f(Xtri,Ytri),'r');
end

return;
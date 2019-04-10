=**<span style="font-size: 13px; line-height: 1.5;"><span style="font-size: 1.3em; line-height: 1.5;">Comandos útiles en MATLAB:</span></span>**= 

<span style="font-size: 13.858px;">* SOLUCIÓN DE SISTEMAS DE ECUACIONES</span>
<span style="line-height: 1.5;">linsolve</span>
inv
\ y
chol (recuerde que R = chol(A) y L = chol(A,'lower'): aquí U-> upper triangular, L->lower triangular, por lo tanto: R'*R=A y L*L'=A)
'
*
lu

====* MATRICES RALAS (SPARSE)==== 
sparse (ver ayuda)
full
spy
cgs
speye
spones
nnz
spdiags
find
nonzeros
spfun

<span style="font-size: 13.858px;">* POLINOMIO DE LAGRANGE</span>
polyfit
polyval
polyder

<span style="font-size: 13.858px;">* INTERPOLACIÓN</span>
vander -> crea la matriz de Vandermonde
spline
pchip
meshgrid
interp1 (nearest, linear, spline, pchip/cubic, v5cubic)
interp1q (faster version of linear 1D interpolation)
interp2 (nearest, linear, spline, cubic, *nearest, *linear, *spline, *cubic)
interp3
ndgrid
interpn

<span style="font-size: 13.858px;">* INTERPOLACIÓN DE DATOS DISPERSOS</span>
convhull (dibuja la envoltura convexa - convex hull)
griddata
griddata3
griddatan
trisurf
trimesh

<span style="font-size: 13.858px;">* INTEGRACIÓN</span>
trapz
quad

<span style="font-size: 13.858px;">* ECUACIONES DIFERENCIALES ORDINARIAS</span>
ode21 (solución menos precisa, pero menos costosa computacionalmente hablando)
ode45 (utilizar "por defecto")
ode113 (solución más precisa, pero más costosa computacionalmente hablando)
ode15s (stiff ODE, precisión media)
ode23s (stiff ODE, precisión baja)
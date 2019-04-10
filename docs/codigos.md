# Códigos de programación

A continuación encontrará códigos de programación realizados en MATLAB, MAXIMA y PYTHON 3.

![Image](http://imgs.xkcd.com/comics/ballmer_peak.png)
Fuente: <http://xkcd.com/323/>

![Image](http://www.jeffpalm.com/fox/fox.jpg)
Fuente: no fuí capaz de encontrarla. Esta caricatura es de FOXTROT (http://www.foxtrot.com/). Finalmente observe que falta un `\n` al final del `printf()`.


## Nota para bajar los programas
* Click derecho en 'Raw'
* Damos Click derecho sobre el código > Guardar como...
* Escogemos el directorio en el que lo vamos a guardar.


## 01 - Introducción a MATLAB
* Calcula el coseno de un angulo dado usando expansión en [serie de Maclaurin](http://mathworld.wolfram.com/MaclaurinSeries.html). Se debe garantizar una tolerancia de 1e-10: [calculo_coseno.m](intro_matlab/calculo_coseno.m)
* Se requiere hacer una función para calcular la potencia: [pot.m](intro_matlab/pot.m)
* Se requiere hacer una función para calcular el factorial: [fact.m](intro_matlab/fact.m)


## 02 - Solución de sistemas de ecuaciones lineales
* Eliminación de Gauss (versión Felipe): [gauss.m]
* Eliminación de Gauss (version Diego): [gauss_eliminination_with_backsubstitution.m]
* Eliminación de Gauss-Jordan: [gauss_jordan.m]
* Descomposición LU - Doolittle(versión Diego): [lu_doolittle.m]
* Descomposición LU - Doolittle (versión Felipe): [lu_decomp.m]
* Método iterativo de Jacobi: [jacobi_iter.m]


## 03 - Interpolación
* Interpolación polinomial (matriz de Vandermonde): [polynomial_interpolation.m]
* Interpolación usando polinomios de Lagrange: [interpolacion_lagrange.m]
* Interpolación usando polinomios de Newton: [interpolacion_newton.m]
* Interpolación usando polinomios de Chebyshev: [interpolacion_chebyshev.m]
* Interpolación por splines cúbicos: [cubic_spline_interpolation.m]
* Comparación de algoritmos de interpolación (1D) implementados dentro de MATLAB: [comparing_interpolation_algorithms.m]
* Comparación de algoritmos de interpolación (2D) implementados dentro de MATLAB: [comparing_2D_interpolation_algorithms.m]
* Interpolation of scattered data: [interpolation_scattered_data.m]
* Interpolation of parametric curves: [interpolation_parametric_curves.m]


## 04 - Raíces de ecuaciones
* Método de iteración hacia el punto fijo: [iteracion_punto_fijo.m]
* Método de bisección (versión Diego): [root_finding_bisection_method.m]
* Método de bisección (versión Felipe): [biseccion.m]
* Método de Newton(-Raphson) (versión Diego): [newton_raphson_root_finding.m]
* Método de Newton(-Raphson) (versión Felipe): [Newton.m]
* Método de la secante: [secante.m]


## 05 - Minimización de funciones
* Función de Rosembrock: [rosenbrock.m]
* Función `Peaks2`: [peaks2.m]
* Minimización por el método de búsqueda áurea (Versión Diego): [goldensearch.m]
* Minimización por el método de búsqueda áurea (Versión Felipe): [busqueda_aurea.m]
* Minimización por el método de aproximación cuadrática: [aproximacion_cuadratica.m], ver [lagrange_aprox_cuadratica.m] para el calculo simbólico de la raíz de la derivada el polinomio de Lagrange.
* Minimización por el método de Nelder-Mead ('downhill simplex'): [nelder_mead.m], requiere [plot_triangle.m] para graficar los triángulos en cada iteración.
* Minimización por el método de descenso más empinado (versión Diego): [steepest.m]
* Minimización por el método de descenso más empinado (versión Felipe): [descenso_mas_empinado.m] (requiere la función [goldensearch.m])
* Minimización por el método de Newton: [Newton.m]


## 06 - Integración de funciones
* Código en MAXIMA para calcular las fórmulas de Newton-Cotes: [newton_cotes_MAXIMA.max]
* Código en MATLAB para calcular las fórmulas de Newton-Cotes: [formulas_Newton_Cotes.m]
* Ejemplo Newton-Cotes (Rectángulo, Trapecio, Simpson): [ejm_Newton_Cotes.m] requiere las funciones: [midpoint_rule.m], [trapezoidal_rule.m]  y [simpson_rule.m]
* Integración de Romberg (versión Diego): [romberg.m]
* Integración de Romberg (versión Felipe): [romberg_extrap.m]
* Código en MAXIMA para calcular los coeficientes de la cuadratura Gaussiana:[coef_gauss_quadrature.max]
* Integración usando cuadratura de Gauss-Legendre: [gausslegendre_quad.m]
* Integración de por cuadraturas de Gauss (-Hermite, -Legendre, -Chebyshev, -Laguerre, -Jacobi): [ejm_gauss_quad.m] requiere la función: [gauss_quad.m]


## 07 - Ecuaciones diferenciales ordinarias
* Solución de ecuaciones diferenciales ordinarias de primer orden usando el método de Euler: [euler.m]
* Solución de ecuaciones diferenciales ordinarias de primer orden usando el método de Heun: [heun.m]
* Solución de ecuaciones diferenciales ordinarias de primer orden usando el método de Runge-Kutta (RK4): [runge_kutta_ejemplos.m]
* Solución de ecuaciones diferenciales ordinarias de primer orden usando el método de Adams-Bashforth-Moulton (ABM2 predictor-corrector): [ABM_2do_orden.m]
* Datos de aceleración (Componente Norte-Sur) de los sismos:
  * Tōhoku (11/03/2011) tomados de la estación "Tsukidate - MYG004" (http://www.strongmotioncenter.org/) [tohoku_NS.txt]
    * ![Image](tohoku_NS.jpg) 
    * Frecuencia de muestreo: 100Hz
    * Profundidad: 24 km 
    * Magnitud: 9.0
  * El Centro (18/05/1940) tomados de http://www.vibrationdata.com/elcentro.htm [elcentro_NS.txt]
    * ![Image](elcentro_NS.jpg)
    * Frecuencia de muestreo: 50 Hz
    * Profundidad: 16 km
    * Magnitud: 6.9
  * En ambos archivos la columna 1 es el tiempo [s] y la columna 2 es la aceleración [g]

* Solución de la ecuación de movimiento (sistema de un grado de libertad -- SDOF) usando como señales de entrada los acelerogramas anteriores y resolviendo el sistema de ecuaciones diferenciales por el método de Runge-Kutta (RK4): [sdof_sismo_RK4.m]

* Solución de sistema de ecuaciones diferenciales: Ecuaciones de [Lotka-Volterra (modelo predador-presa)](https://en.wikipedia.org/wiki/Lotka%E2%80%93Volterra_equations) [Lotka_Volterra_RK4_ABM2.m] requiere las funciones [runge_kutta.m] [Adams_Bashforth_Moulton.m]
* Solución de sistema de ecuaciones diferenciales: Ecuación de movimiento (péndulo doble) [double_pendulum_RK4_ABM2.m] requiere las funciones [runge_kutta.m] y [Adams_Bashforth_Moulton.m]
  * Nota: Mis funciones de RK y ABM están dando diferente al ode45 de MATLAB cuando los parámetros vuelven la respuesta muy caótica.
  * ![pendulo_doble.gif](pendulo_doble.gif)


## 08 - Regresión
* Regresión no lineal con Gauss-Newton (Levenberg-Marquardt): [gauss_newton_levenberg_marquardt.m] - requiere la siguiente función para calcular el Jacobiano: [jacobiano_r.m]


## 09 - Probabilidad de falla
* Calculating the probability of failure of a beam: [probability_failure_beam.m]
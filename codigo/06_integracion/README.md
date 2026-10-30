# Códigos de integración numérica

## Integración con Newton-Cotes: deducción de fórmulas

* [simpson_1_3.py](simpson_1_3.py) deduce simbólicamente (SymPy) la regla de Simpson 1/3 integrando el polinomio interpolante de 3 puntos.
* [simpson_3_8.py](simpson_3_8.py) deduce simbólicamente (SymPy) la regla de Simpson 3/8 integrando el polinomio interpolante de 4 puntos.
* [newton_cotes_MAXIMA.max](newton_cotes_MAXIMA.max) deduce con Maxima las fórmulas de Newton-Cotes (p. ej. Simpson 3/8) a partir del polinomio de Lagrange.
* [formulas_Newton_Cotes.m](formulas_Newton_Cotes.m) deduce las fórmulas de Newton-Cotes en MATLAB/Octave.
* [newton_cotes_weights_error.py](newton_cotes_weights_error.py) muestra los pesos y el término de error de Newton-Cotes para 1 a 6 intervalos usando SciPy.

## Integración con Newton-Cotes: aplicación

* [newton_cotes_example.py](newton_cotes_example.py) integra sin(x) en [0, π] con las reglas de Newton-Cotes de SciPy.
* [ejm_Newton_Cotes.m](ejm_Newton_Cotes.m) ejemplo en MATLAB/Octave de integración con reglas de Newton-Cotes.
* [midpoint_rule.m](midpoint_rule.m) función que implementa la regla del punto medio (rectángulo) simple y compuesta.
* [trapezoidal_rule.py](trapezoidal_rule.py) integra un polinomio con la regla del trapecio compuesta para n = 1, 2, 4, 8 y 10000 subintervalos.
* [trapezoidal_rule.m](trapezoidal_rule.m) función que implementa la regla del trapecio simple y compuesta.
* [simpson_rule.m](simpson_rule.m) función que implementa la regla de Simpson simple y compuesta.

## Integración de Romberg

* [romberg_integration.py](romberg_integration.py) integra un polinomio con la integración de Romberg (`scipy.integrate.romb`).
* [romberg.m](romberg.m) función que implementa la integración de Romberg hasta alcanzar una tolerancia.
* [romberg_extrap.m](romberg_extrap.m) ejemplo de integración de Romberg mediante extrapolación de Richardson reiterada.

## Cuadraturas de Gauss

* [GL_n_2.py](GL_n_2.py) plantea y resuelve con SymPy el sistema de ecuaciones de pesos y raíces de Gauss-Legendre con n = 2.
* [GL_n_3.py](GL_n_3.py) plantea y resuelve con SymPy el sistema de ecuaciones de pesos y raíces de Gauss-Legendre con n = 3.
* [coef_gauss_quadrature.max](coef_gauss_quadrature.max) calcula con Maxima los coeficientes y puntos de la cuadratura de Gauss de 2 puntos.
* [example_GL_quad.py](example_GL_quad.py) integra sin(x) en [0, π] con cuadratura de Gauss-Legendre de 3 puntos.
* [gausslegendre_quad.m](gausslegendre_quad.m) función que calcula nodos y pesos de la cuadratura de Gauss-Legendre.
* [gauss_quad.m](gauss_quad.m) función que calcula nodos y pesos de cuadraturas de Gauss para varios polinomios ortogonales.
* [ejm_gauss_quad.m](ejm_gauss_quad.m) ejemplo en MATLAB/Octave de integración por cuadraturas de Gauss.

## Integrales impropias

* [improper_int.py](improper_int.py) calcula una integral impropia (densidad normal con límite infinito) con cuadratura de Gauss-Legendre y la compara con la solución exacta.

## Integración con SciPy y comparación de métodos

* [Integration_with_SciPy_(quad).ipynb](<Integration_with_SciPy_(quad).ipynb>) notebook que muestra el uso de la familia de funciones `quad` de SciPy (argumentos extra, funciones oscilatorias, etc.).
* [Comparison_of_integration_methods.ipynb](Comparison_of_integration_methods.ipynb) notebook que compara distintos métodos de integración numérica frente a la solución exacta.

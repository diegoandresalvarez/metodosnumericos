# Minimización de funciones

## Minimización univariada

* [busqueda_aurea.m](busqueda_aurea.m) minimiza una función con el método de la búsqueda áurea.
* [goldensearch.m](goldensearch.m) función que implementa la búsqueda de la sección áurea.
* [aproximacion_cuadratica.m](aproximacion_cuadratica.m) minimiza una función con el método de aproximación cuadratica.
* [lagrange_aprox_cuadratica.m](lagrange_aprox_cuadratica.m) deduce simbólicamente el polinomio de Lagrange de orden 2 para la aproximación cuadrática.
* [biseccion.m](biseccion.m) método de bisección (de la sección de raíces de ecuaciones).
* [univariate_optimization.ipynb](univariate_optimization.ipynb) notebook de optimización univariada con SciPy (`minimize_scalar`, método de Brent).

## Minimización multivariada

* [descenso_mas_empinado.m](descenso_mas_empinado.m) minimiza con el método del descenso más empinado.
* [steepest.m](steepest.m) función de descenso más empinado (steepest descent).
* [Newton.m](Newton.m) minimiza con el método de Newton.
* [nelder_mead.m](nelder_mead.m) minimiza con el método simplex de Nelder-Mead.
* [plot_triangle.m](plot_triangle.m) función auxiliar que grafica el triángulo (simplex) de Nelder-Mead.
* [gradient_descent_newton_LM.ipynb](gradient_descent_newton_LM.ipynb) notebook de optimización multivariada con descenso del gradiente, Newton y Levenberg-Marquardt.
* [unconstrained_optimization_python.ipynb](unconstrained_optimization_python.ipynb) notebook que prueba los métodos locales de optimización sin restricciones de SciPy.
* [Taylor_2D.py](Taylor_2D.py) calcula y grafica la aproximación de Taylor de segundo orden de una función de dos variables.

## Funciones de prueba

* [rosenbrock.m](rosenbrock.m) función de Rosenbrock.
* [peaks2.m](peaks2.m) versión vectorizada de la función `peaks`.

## Optimización estructural

* [structural_optimization/truss_con_scipy.py](structural_optimization/truss_con_scipy.py) optimiza una armadura (truss) con `scipy.optimize`.
* [structural_optimization/truss_from_pytorchbridge.py](structural_optimization/truss_from_pytorchbridge.py) optimiza una armadura con PyTorch (versión tomada de pytorchbridge).
* [structural_optimization/truss_con_pytorch_error_version_Diego.py](structural_optimization/truss_con_pytorch_error_version_Diego.py) versión con PyTorch de la armadura (con errores).

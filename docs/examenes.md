# Temas para los exámenes

![YOU THINK THIS IS FUNNY?](https://imgs.xkcd.com/comics/substitute.png "YOU THINK THIS IS FUNNY?")

Fuente: <https://xkcd.com/135/>

## Examen 1
* Video tutoriales de Python (estudie al menos uno de los siguientes videos):
    - [Video 1 por HolaMundo](https://www.youtube.com/watch?v=tQZy0U8s9LY)
    - [Video 2 por MoureDev](https://www.youtube.com/watch?v=Kp4Mvapo5kc)
    - [Video 3 por Midudev](https://www.youtube.com/watch?v=TkN2i-_4N4g)
* [Cuestionario](cuestionario_ex_1.md). Puede usar las siguientes diapositivas como material de estudio:
    - [Diapositivas 01 - Introducción a Python](https://github.com/diegoandresalvarez/programaciondecomputadores/blob/master/diapositivas/python3/01_-_Introduccion_a_Python.pdf)
    - [Diapositivas 02 - Tipos de datos escalares en Python](https://github.com/diegoandresalvarez/programaciondecomputadores/blob/master/diapositivas/python3/02_-_Tipos_de_datos_escalares_en_Python.pdf)
    - [Diapositivas 02 - Tipos de datos en lenguaje C](https://github.com/diegoandresalvarez/programaciondecomputadores/blob/master/diapositivas/C/02_-_Tipos_de_datos.pdf)
* Jupyter Notebook. Puede usar el siguiente material como material de estudio:
    - [Tutorial de Jupyter por Diego](https://github.com/diegoandresalvarez/programaciondecomputadores/blob/master/codigo/python3/jupyter/tutorial_jupyter.ipynb)
    - Algún tutorial de Jupyter en YouTube de al menos media hora de duración (por ejemplo, [este](https://www.youtube.com/watch?v=HW29067qVWk) o [este](https://www.youtube.com/watch?v=DKiI6NfSIe8).
* NumPy (conceptos básicos). Puede usar el siguiente material como material de estudio:
    - [Tutorial de NumPy por Diego](https://github.com/diegoandresalvarez/programaciondecomputadores/blob/master/codigo/python3/jupyter/tutorial_numpy.ipynb)
    - [SciPy: NumPy and SciPy for Scientific Computing](https://scipy-lectures.org/intro/numpy/index.html)
    - Algún tutorial de NumPy en YouTube de al menos dos horas de duración (por ejemplo, [este](https://www.youtube.com/watch?v=ZB7BZMhfPgk&pp=ygUPZW50aG91Z2h0IG51bXB5) o [este](https://www.youtube.com/watch?v=bveHFn0G4Zg).

## Examen 2
* [Cuestionario](cuestionario_ex_2.md)
* Cuadernos de Jupyter:
    - [Gaussian elimination with backsubstitution](https://github.com/diegoandresalvarez/metodosnumericos/blob/master/codigo/02_sistemas_ecuaciones_lineales/gauss_elimination_with_backsubstitution.ipynb)
    - [Gaussian-Jordan elimination with partial pivoting](https://github.com/diegoandresalvarez/metodosnumericos/blob/master/codigo/02_sistemas_ecuaciones_lineales/gauss_jordan_elimination.ipynb)
    - [Cholesky decomposition](https://github.com/diegoandresalvarez/metodosnumericos/blob/master/codigo/02_sistemas_ecuaciones_lineales/cholesky_decomposition.ipynb)
    - [LU decomposition](../codigo/02_sistemas_ecuaciones_lineales/lu_decomposition_advantages.ipynb)
* Programas de Python:
    - [02_cholesky_SPD_matrix.py](../codigo/02_sistemas_ecuaciones_lineales/02_cholesky_SPD_matrix.py)
    - [02_condition_number.py](../codigo/02_sistemas_ecuaciones_lineales/02_condition_number.py) 
    - [02_iterative_refinement.py](../codigo/02_sistemas_ecuaciones_lineales/02_iterative_refinement.py)

* Diapositivas:
    - [Solución del sistema K*a - f = q en elementos finitos](https://github.com/diegoandresalvarez/elementosfinitos/blob/master/diapositivas/01_Repaso_Calculo_Matricial.pdf)
    - [Estado del arte en solucionadores de sistemas de ecuaciones Ax=b para el método de elementos finitos: directos vs. iterativos](https://github.com/diegoandresalvarez/metodosnumericos/blob/master/codigo/02_sistemas_ecuaciones_lineales/solvers_Ax_b.pdf)

<!---
*** http://en.wikipedia.org/wiki/Reduced_row_echelon_form
*** http://es.wikipedia.org/wiki/Forma_de_filas_en_escalon (ver además comando rref de MATLAB)
*** http://en.wikipedia.org/wiki/Row_echelon_form
*** http://en.wikipedia.org/wiki/Conjugate_gradient_method
** Comandos de MATLAB: \, linsolve, lu, chol, rref, rank, inv, eye, sparse, full, spy
--->

<!---
## Examen 3
* Capítulo 18 Interpolación (páginas 496--534) del libro [Chapra & Canale (2020). Numerical Methods for Engineers (8ed). McGraw-Hill](https://mrce.in/ebooks/Numerical%20Methods%20for%20Engineers%208th%20Ed.pdf). Se exceptúa la sección 18.1 (Newton interpolating polynomials).
* Capítulo 3 Interpolación (sección 3.5) del libro [Richard L. Burden, J. Douglas Faires, Annette M. Burden (2011). Numerical analysis. 9 ed.](https://faculty.ksu.edu.sa/sites/default/files/numerical_analysis_9th.pdf)
* [Interpolation](http://en.wikipedia.org/wiki/Interpolation)
* [Nearest-neighbor interpolation](http://en.wikipedia.org/wiki/Nearest-neighbor_interpolation)
* [Linear interpolation](http://en.wikipedia.org/wiki/Linear_interpolation)
* [Lagrange interpolating polynomial](http://en.wikipedia.org/wiki/Lagrange_form)
* Hermite interpolating polynomial
* [Polynomial interpolation](http://en.wikipedia.org/wiki/Polynomial_interpolation)
* [Spline interpolation](http://en.wikipedia.org/wiki/Spline_interpolation)
* Cubic splines
* Hermite cubic splines
* [Multivariate interpolation](http://en.wikipedia.org/wiki/Multivariate_interpolation)
* [Feature scaling](https://en.wikipedia.org/wiki/Feature_scaling)
* [Cuestionario](cuestionario_ex_3.md)
* Cuadernos de Jupyter:
    - [Polynomials with NumPy (using the Poly1D class)](../codigo/03_interpolacion/Poly1D_numpy.ipynb)
    - [Interpolation using Vandermonde matrices](../codigo/03_interpolacion/interpolation_vandermonde.ipynb)
    - [Lagrange interpolating polynomial](../codigo/03_interpolacion/Lagrange_interpolation.ipynb)
    - [Hermite interpolating polynomial](../codigo/03_interpolacion/Hermite_interpolation.ipynb)
    - [Interpolation in 1D with SciPy](../codigo/03_interpolacion/interpolation_1D.ipynb)
    - [Cubic spline interpolation](../codigo/03_interpolacion/cubic_spline_interpolation.ipynb)
    - [Multivariate interpolation on structured grids](../codigo/03_interpolacion/multivariate_structured_grid_interpolation.ipynb)
    - [Multivariate interpolation on scattered data](../codigo/03_interpolacion/multivariate_scattered_data_interpolation.ipynb)        
    - [TO IMPLEMENT: Interpolation with MS EXCEL](***)        

## Examen 4
* Capítulos 13 y 14 Optimización (páginas 350--394) del libro [Chapra & Canale (2020). Numerical Methods for Engineers (8ed). McGraw-Hill](https://mrce.in/ebooks/Numerical%20Methods%20for%20Engineers%208th%20Ed.pdf). 
* Capítulo 6 "Derivarive-based optimization" del libro [Jyh-Shing Roger Jang, Chuen-Tsai Sun, Eiji Mizutani (1997). Neuro-Fuzzy and Soft Computing. Prentice Hall](http://www.soukalfi.edu.sk/01_NeuroFuzzyApproach.pdf)
* [Cuestionario](cuestionario_ex_4.md)
* Cuadernos de Jupyter:
- [Univariate optimization with SciPy](../codigo/05_minimizacion_de_funciones/univariate_optimization.ipynb)
- [Gradient descent, Newton's method and Levenberg-Marquardt algorithms](../codigo/05_minimizacion_de_funciones/gradient_descent_newton_LM.ipynb)
- [Multivariate unconstrained optimization with Python using methods for local optimization](../codigo/05_minimizacion_de_funciones/unconstrained_optimization_python.ipynb)

--->
<!--- 
## Examen 1
* Métodos para la solución de sistemas lineales (Estudiar notas de clase y complementar con Capítulo 2 del libro de Yang et al. (2009) - Applied numerical methods using MATLAB).
* Métodos de interpolación (Estudiar notas de clase y complementar con Capítulo 3 del libro de Yang et al. (2009) - Applied numerical methods using MATLAB).
* Podrán llevar **hojita** de fórmulas debidamente marcada, la cual iré revisando al inicio mientras ustedes arrancan con el examen. Únicamente pueden poner fórmulas puntuales (como por ejemplo la de interpolación de Lagrange), no debe estar escrito ningún tipo de desarrollo, demostración, explicación ó concepto.
* **NOTA: la pregunta del examen será: escriba todo lo que sabe con respecto al tema _XXX_.**

## Examen 2
* Métodos para hallar raíces de ecuaciones no lineales (Estudiar notas de clase y complementar con Capítulo 4 del libro de Yang et al. (2009) - Applied numerical methods using MATLAB).
* Métodos para minimización de funciones (Estudiar notas de clase y complementar con Capítulo 7 del libro de Yang et al. (2009) - Applied numerical methods using MATLAB).
* Estudiar comandos y programas vistos en clase.
* Podrán llevar **hojita** de fórmulas debidamente marcada, la cual iré revisando al inicio del examen. Únicamente pueden poner fórmulas puntuales ó pseudocódigos de los métodos más elaborados, no debe estar escrito ningún tipo de desarrollo, demostración, explicación ó concepto.

## Examen 3
* Métodos para evaluar derivadas e integrales numéricamente (Estudiar notas de clase y complementar con Capítulo 5 del libro de Yang et al. (2009) - Applied numerical methods using MATLAB).
* Métodos para la solución de ecuaciones diferenciales (Estudiar notas de clase y complementar con Capítulo 6 del libro de Yang et al. (2009) - Applied numerical methods using MATLAB).
* Estudiar comandos y programas vistos en clase.
* Podrán llevar **hojita** de fórmulas debidamente marcada, la cual iré revisando al inicio del examen. Únicamente pueden poner fórmulas puntuales ó pseudocódigos de los métodos más elaborados, no debe estar escrito ningún tipo de desarrollo, demostración, explicación ó concepto.
* Ver el siguiente link para unos buenos ejemplos de la cuadratura Gaussiana:</span>
https://en.wikiversity.org/wiki/Numerical_Analysis/Gaussian_Quadrature
--->
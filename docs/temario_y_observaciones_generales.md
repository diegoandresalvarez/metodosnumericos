# Observaciones generales y temario del curso

![Caricatura](../imagenes/programmer_vs_nonprogrammer.jpg)

## Citas para preguntas
Únicamente solicitándolas previamente, ya sea por correo electrónico o antes/después de la clase.

## Criterio de evaluación
* En los exámenes siempre se preguntará: teoría, demostraciones y ejercicios numéricos.
  - Examen 1: 20%
  - Examen 2: 20%
  - Examen 3: 20%
  - Examen 4: 20%
* Talleres de programación + sustentación: 20%  (incluye por ejemplo, talleres de programación en MATLAB, etc.)

## Objetivos
- Introducir la técnica básica del cálculo numérico y explicar su objetivo fundamental: encontrar soluciones aproximadas a problemas complejos utilizando procedimientos matemáticos que se pueden programar fácilmente con un computador.
- Hacer énfasis en la programación de computadores como una herramienta para obtener soluciones numéricas de problemas cuya solución analítica es extremadamente compleja.

## Metodología
El curso se desarrollará teniendo en cuenta diferentes aspectos pedagógicos como son:
- Clases presenciales: el profesor explica los conceptos relevantes en el salón de clase.
- Realización de talleres prácticos de programación que faciliten, refuercen y aplique los conocimientos adquiridos en la parte teórica cada vez que el tema lo amerite.
- Presentación y sustentación de proyectos por parte de los estudiantes.
- Trabajo dirigido fuera de clase, ya sea individual o por grupo, por parte de los estudiantes con el propósito de afianzar los conceptos aprendidos.

## Lenguaje de programación a enseñar
Se enseñará Python 3 ya que a diferencia de otros lenguajes de programación como C o C++ este es un lenguaje con una sintaxis simple y mucho más fácil de aprender. Adicionalmente existe en internet mucho material educativo gratis y de excelente calidad sobre el tema.

## Contenido
* [[software|APRENDIZAJE MATLAB (1 semana)]]

* **SOLUCION DE ECUACIONES ALGEBRAICAS LINEALES** (2 semanas)
** [[http://www.mpi-hd.mpg.de/astrophysik/HEA/internal/Numerical_Recipes/f2-0.pdf|2.0 Introduction]]
** [[http://www.mpi-hd.mpg.de/astrophysik/HEA/internal/Numerical_Recipes/f2-1.pdf|2.1 Gauss-Jordan Elimination]]
*** http://mathworld.wolfram.com/Gauss-JordanElimination.html
*** http://es.wikipedia.org/wiki/Eliminaci%C3%B3n_de_Gauss-Jordan
*** http://en.wikipedia.org/wiki/Gaussian_elimination
*** http://en.wikipedia.org/wiki/Reduced_row_echelon_form
** [[http://www.fizyka.umk.pl/nrbook/c2-2.pdf|2.2 Gaussian Elimination with Backsubstitution]]
*** http://mathworld.wolfram.com/GaussianElimination.html
*** http://en.wikipedia.org/wiki/Gaussian_elimination
*** http://es.wikipedia.org/wiki/Forma_de_filas_en_escalon (ver además comando rref de MATLAB)
*** http://en.wikipedia.org/wiki/Row_echelon_form
** [[http://www.mpi-hd.mpg.de/astrophysik/HEA/internal/Numerical_Recipes/f2-3.pdf|2.3 LU Decomposition and Its Applications]]
** [[http://www.mpi-hd.mpg.de/astrophysik/HEA/internal/Numerical_Recipes/f2-5.pdf|2.5 Iterative Improvement of a Solution to Linear Equations]]
** [[http://www.mpi-hd.mpg.de/astrophysik/HEA/internal/Numerical_Recipes/f2-7.pdf|2.7 Sparse Linear Systems]]
*** http://en.wikipedia.org/wiki/Sparse_matrix
*** http://en.wikipedia.org/wiki/Conjugate_gradient_method
** [[http://www.mpi-hd.mpg.de/astrophysik/HEA/internal/Numerical_Recipes/f2-9.pdf|2.9 Cholesky Decomposition]]
*** http://en.wikipedia.org/wiki/Cholesky_decomposition
** Comandos de MATLAB: \, linsolve, lu, chol, rref, rank, inv, eye, sparse, full, spy

* **INTERPOLACION** (2 semanas)
** [[http://en.wikipedia.org/wiki/Interpolation|Introducción]]
** [[http://en.wikipedia.org/wiki/Nearest-neighbor_interpolation|Interpolación por los vecinos más cercanos]]
** [[http://en.wikipedia.org/wiki/Linear_interpolation|Interpolación lineal]]
** [[http://en.wikipedia.org/wiki/Lagrange_form|Interpolación con la fórmula de Lagrange]]
** [[http://en.wikipedia.org/wiki/Polynomial_interpolation|Interpolación polinomial (cuadrática y cúbica)]]
** [[http://en.wikipedia.org/wiki/Spline_interpolation|Interpolación con splines]]
** [[http://en.wikipedia.org/wiki/Multivariate_interpolation|Interpolación en varias dimensiones]]

<span style="color: #ff0000;">EXAMEN</span>

* **MINIMIZACION Y MAXIMIZACION DE FUNCIONES** (2 semanas)
** Chapter 10: Minimization or Maximization of Functions
** 10.0 Introduction
** 10.1 Initially Bracketing a Minimum
** 10.2 Golden Section Search in One Dimension
** 10.3 Parabolic Interpolation and Brent's Method in One Dimension
** 10.4 One-Dimensional Search with First Derivatives
** 10.6 Line Methods in Multidimensions

* **RAICES DE ECUACIONES Y SISTEMAS DE ECUACIONES NO LINEALES** (2 semanas)
** 9.0 Introduction
** 9.1 Bracketing and Bisection
** 9.4 Newton-Raphson Method Using Derivative
** 9.6 Newton-Raphson Method for Nonlinear Systems of Equations

<span style="color: #ff0000;">EXAMEN</span>

* **<span style="line-height: 1.5;">INTEGRACION DE FUNCIONES</span>**<span style="line-height: 1.5;"> (2 semanas)</span>
* [[http://en.wikipedia.org/wiki/Numerical_integration|Introducción]]
* [[http://en.wikipedia.org/wiki/Newton%E2%80%93Cotes_formulas|Métodos de Newton-Cotes]]
** [[http://en.wikipedia.org/wiki/Rectangle_method|Método de los rectángulos]]
** [[http://en.wikipedia.org/wiki/Trapezium_rule|Método de los trapecios]]
** [[http://en.wikipedia.org/wiki/Simpson%27s_rule|Método de Simpson 1/8 y 3/8]]
** [[http://en.wikipedia.org/wiki/Boole%27s_rule|Fórmula de Boole]]
* [[http://en.wikipedia.org/wiki/Richardson_extrapolation|Extrapolaciones de Richardson]]
* [[http://en.wikipedia.org/wiki/Romberg_integration|Integración de Romberg]]
* [[http://en.wikipedia.org/wiki/Gaussian_quadrature|Integración con cuadraturas de Gauss-Legendre]]

* **SOLUCION DE ECUACIONES DIFERENCIALES ORDINARIAS** (1 semanas)
** Introduction
** Método de Euler y método de Euler mejorado
** Métodos de Runge-Kutta
** Métodos predictor-corrector: Adams-Bashford-Moulton
** Stiff ordinary differential equations

<span style="color: #ff0000;">EXAMEN</span>

* **NUMEROS ALEATORIOS** (2 semanas)
** Introducción
*** http://en.wikipedia.org/wiki/Random_number_generator
*** http://en.wikipedia.org/wiki/A_Million_Random_Digits_with_100,000_Normal_Deviates
*** http://en.wikipedia.org/wiki/Pseudorandom_number_generator
** Generación de números aleatorios uniformemente distribuidos entre 0 y 1
*** http://en.wikipedia.org/wiki/Linear_congruential_generator
*** http://en.wikipedia.org/wiki/Park-Miller_RNG
*** http://en.wikipedia.org/wiki/Mersenne_twister
*** http://en.wikipedia.org/wiki/Blum_Blum_Shub
*** [[http://wwwasdoc.web.cern.ch/wwwasdoc/shortwrupsdir/v115/top.html|RANLUX algorithm]]
** Generación de números aleatorios provenientes de otras distribuciones
*** http://en.wikipedia.org/wiki/Inverse_transform_sampling
*** http://en.wikipedia.org/wiki/Rejection_sampling
*** http://en.wikipedia.org/wiki/Box-Muller_transform
*** http://en.wikipedia.org/wiki/Ziggurat_algorithm
** Simple Monte Carlo Integration (entiendan como aproximar el número pi usando simulaciones de Monte Carlo)
*** http://en.wikipedia.org/wiki/Monte_Carlo_method
*** http://en.wikipedia.org/wiki/Monte_Carlo_integration
*** http://en.wikipedia.org/wiki/Quasi-Monte_Carlo_method
*** http://en.wikipedia.org/wiki/Applications_of_randomness

## Bibliografía
* [C. Moler (2004) - Numerical computing with MATLAB]] (Libro gratis)](http://www.mathworks.com/moler/chapters.html)
* W. Y. Yang, W. Cao, T.-S. Chung & J. Morris (2005) - Applied numerical methods using MATLAB. John Wiley & Sons. (dos ejemplares en biblioteca ID. 519.4 A652a)
* S. C. Chapra (2011) - Applied Numerical Methods with MATLAB for Engineers and Scientists. 3ra Edición. McGraw-Hill.
* W. Press, S. Teukolsky, W. Vetterling & B. Flannery (1992) - Numerical Recipes in C. 2da edición. Cambridge University Press: Cambridge, UK. Ver comentarios en WIKIPEDIA: http://en.wikipedia.org/wiki/Numerical_Recipes


## Observaciones que se quieren dejar por escrito:
### Asistencia al curso
La puerta se cerrará 10 minutos después de haber iniciado la clase (de acuerdo con el reloj del computador del salón).

### Falta a los exámenes
Siempre que usted falte a un examen, debe haber algún documento que lo exonere de dicha inasistencia. Cuando usted por algún motivo de fuerza mayor no pueda asistir al examen, usted debe avisarle al profesor con anterioridad ya sea personalmente o por correo. En esos casos en lo posible, debe demostrarlo. Por ejemplo: si le tocó viajar a su pueblo esa semana porque algo sucedió un evento familiar de trascendencia, entonces una forma de certificar que usted viajó son los tiquetes de ida y vuelta a su pueblo. Sin una excusa o una notificación previa no se repetirán los exámenes y usted tendrá como nota un cero.

### Fraude en los exámenes o trabajos
Estos se penalizarán así:
* Nota cero en el trabajo/examen en cuestión
* Carta a la Dirección del Departamento de Ingeniería Civil reportando el suceso 
* Se pierden adicionalmente todos los privilegios que se tienen de una calificación con notas mayores a 5.0 en todas las notas obtenidas en el semestre actual y futuros.

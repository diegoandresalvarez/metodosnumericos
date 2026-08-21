# Observaciones generales y temario del curso

![Caricatura](https://imgs.xkcd.com/comics/differentiation_and_integration.png)

Source: https://xkcd.com/2117/

This is the reason why making numerical quadrature (like the trapezoidal rule or Simpson's rule) is essential for real-world applications.

## Citas para preguntas
Únicamente solicitándolas previamente, ya sea por correo electrónico o inmediatamente después de la clase.

## Exámenes, talleres y fechas
El curso se evaluará mediante exámenes y talleres de programación (sustentados).

### Exámenes:
Ver tema de los exámenes en el archivo [examenes.md](examenes.md). Los exámenes se realizarán en las fechas que se indican a continuación:
* **Examen 1:** Porcentaje: 20%. Miércoles 16 de septiebmre de 2026.
* **Examen 2:** Porcentaje: 20%. Miércoles 14 de octubre de 2026.
* **Examen 3:** Porcentaje: 20%. Miércoles 11 de noviembre de 2026.
* **Examen 4:** Porcentaje: 20%. Viernes 11 de diciembre de 2026. 

### Talleres de programación + sustentación
Porcentaje: 20%

<!---
En los exámenes siempre se preguntará: teoría, demostraciones, ejercicios numéricos y ejercicios de programación. <code style="color: #ff0000;">Se permite para los exámenes traer una hoja tamaño carta en la cual ustedes pueden escribir (POR UN SOLO LADO) todas las fórmulas y comandos de MATLAB/MAXIMA/PYTHON que deseen. En la hoja no se pueden ni escribir programas, ni textos explicativos, ni se pueden escribir demostraciones. Dicha hoja debe ser de elaboración personal (no se pueden traer las hojas hechas por compañeros de este o semestres pasados) y debe hacerse a mano (se prohíbe explícitamente traer fotocopias/impresiones/reducciones).</code>
--->

## Descripción de la asignatura métodos numéricos
<!---
PRESENTACIÓN EN 2000 CARACTERES (PARA EL SIA):

En este curso de pregrado se abordarán los métodos numéricos y se aplicarán específicamente en el ámbito de la ingeniería civil. Los métodos numéricos permiten analizar sistemas estructurales complejos, modelar comportamientos de materiales, simular condiciones de carga y predecir respuestas ante fenómenos naturales como sismos o vientos en aquellos casos que no existe una fórmula matemática explícita para el cálculo. El contenido programático es extenso y abarca desde la resolución de ecuaciones lineales, esenciales para el análisis estructural, hasta simulaciones de Monte Carlo que evalúan la confiabilidad estructural. Esta asignatura establece el puente entre la teoría matemática y las aplicaciones prácticas que el profesional enfrentará en su vida laboral.

Se espera que al final del curso, el estudiante esté en capacidad de:
* Introducir la técnica básica del cálculo numérico y explicar su objetivo fundamental: encontrar soluciones aproximadas a problemas complejos utilizando procedimientos matemáticos que se pueden programar fácilmente con un computador.
* Hacer énfasis en la programación de computadores como una herramienta para obtener soluciones numéricas de problemas cuya solución analítica es extremadamente compleja.

Además, el estudiante fortalecerá:
* Pensamiento algorítmico y rigor en el manejo del error numérico.
* Habilidad para programar en Python soluciones de álgebra lineal (Gauss, LU, Cholesky), interpolación, optimización (Newton-Raphson, Levenberg-Marquardt), integración (Simpson, Gauss-Legendre), ecuaciones diferenciales (Runge-Kutta) y simulación estocástica (Monte Carlo).
* Actitud crítica frente a la confiabilidad de un resultado, esencial para decisiones que impactan la seguridad pública.
* Aporta al perfil profesional la capacidad de modelar, optimizar recursos y comunicar decisiones basadas en evidencia computacional.

Metodología: clases presenciales, talleres prácticos de código, proyectos aplicados y trabajo dirigido.
--->

Los métodos numéricos constituyen una herramienta fundamental en la formación integral del ingeniero civil, proporcionando técnicas matemáticas precisas para resolver problemas complejos que carecen de soluciones analíticas exactas. Esta asignatura establece el puente entre la teoría matemática y las aplicaciones prácticas que el profesional enfrentará en su vida laboral.

En ingeniería civil, donde se diseñan y calculan estructuras que garantizan la seguridad de las personas, la precisión es vital. Los métodos numéricos permiten analizar sistemas estructurales complejos, modelar comportamientos de materiales, simular condiciones de carga y predecir respuestas ante fenómenos naturales como sismos o vientos.

El contenido programático abarca desde la resolución de ecuaciones lineales (esenciales para el análisis estructural) hasta simulaciones de Monte Carlo que evalúan la confiabilidad estructural. La integración con PYTHON potencia estas técnicas, permitiendo resolver eficientemente problemas de gran envergadura.

En un mundo donde la ingeniería civil avanza hacia diseños optimizados y sostenibles, dominar estos métodos computacionales no es opcional, sino una competencia esencial para enfrentar los desafíos profesionales que aparecerán en la práctica.

Se espera que al final del curso, el estudiante esté en capacidad de:
- Introducir la técnica básica del cálculo numérico y explicar su objetivo fundamental: encontrar soluciones aproximadas a problemas complejos utilizando procedimientos matemáticos que se pueden programar fácilmente con un computador.
- Hacer énfasis en la programación de computadores como una herramienta para obtener soluciones numéricas de problemas cuya solución analítica es extremadamente compleja.

## Metodología
El curso se desarrollará teniendo en cuenta diferentes aspectos pedagógicos como son:
- Clases presenciales: el profesor explica los conceptos relevantes en el salón de clase.
- Realización de talleres prácticos de programación que faciliten, refuercen y aplique los conocimientos adquiridos en la parte teórica cada vez que el tema lo amerite.
- Presentación y sustentación de proyectos por parte de los estudiantes.
- Trabajo dirigido fuera de clase, ya sea individual o por grupo, por parte de los estudiantes con el propósito de afianzar los conceptos aprendidos.

## Lenguaje de programación a usar
Se empleará Python ya que a diferencia de otros lenguajes de programación como MATLAB, este es un software libre con una sintaxis simple y fácil de aprender. Adicionalmente existe en internet mucho material educativo gratis y de excelente calidad sobre el tema.

## Contenido
### 0. REPASO DE PYTHON
* Cuadernos de Jupyter
* Librerías:
  * NumPy
  * Matplotlib
  * Introducción a pandas

### 1. SOLUCION DE ECUACIONES ALGEBRAICAS LINEALES (2 semanas)
* Introducción
* Eliminación Gauss-Jordan
* Eliminación Gausiana con sustitución
* Descomposición de Cholesky
* Descomposición LU
* Mejoramiento iterativo a la solución de ecuaciones lineales
* Matrices ralas
* Programación con PYTHON y contextualización a la ingeniería civil

### 2. INTERPOLACION (2 semanas)
* Introducción
* Interpolación por los vecinos más cercanos
* Interpolación lineal
* Interpolación con la fórmula de Lagrange
* Interpolación polinomial (cuadrática y cúbica)
* Interpolación con splines
* Interpolación en varias dimensiones
* Programación con PYTHON y contextualización a la ingeniería civil

### 3. MINIMIZACION Y MAXIMIZACION DE FUNCIONES. REGRESIÓN LINEAL Y NO LINEAL (4 semanas)
* Introducción
* Minimización unidimensional
  * Acotacion de funciones
  * Método de la interpolación parabólica
  * Método de la búsqueda aurea
  * Método de Newton-Raphson
* Minimización en varias dimensiones
  * 1.Método del descenso más empinado
  * 2.Método de Newton-Raphson
  * 3 Método de Levenberg-Marquardt
* Regresion lineal y no lineal
* Programación con PYTHON y contextualización a la ingeniería civil

### 4. RAICES DE ECUACIONES Y SISTEMAS DE ECUACIONES NO LINEALES (2 semanas)
* Introducción
* Método de la acotacion y de la bisección
* Método de Newton-Raphson
* Método de Newton-Raphson para la solucion de sistemas de ecuaciones no lineales
* Programación con PYTHON y contextualización a la ingeniería civil
<!---
** 9.0 Introduction
** 9.1 Bracketing and Bisection
** 9.4 Newton-Raphson Method Using Derivative
** 9.6 Newton-Raphson Method for Nonlinear Systems of Equations
--->

### 5. INTEGRACION DE FUNCIONES (2 semanas)
* Introducción
* Métodos de Newton-Cotes
  * Método de los rectángulos 
  * Método de los trapecios
  * Método de Simpson 1/8 y 3/8
  * Fórmula de Boole
* Extrapolaciones de Richardson
* Integración de Romberg
* Integración con cuadraturas de Gauss-Legendre
* Programación con PYTHON y contextualización a la ingeniería civil
<!---
* [[http://en.wikipedia.org/wiki/Numerical_integration|Introducción]]
* [[http://en.wikipedia.org/wiki/Newton%E2%80%93Cotes_formulas|Métodos de Newton-Cotes]]
** [[http://en.wikipedia.org/wiki/Rectangle_method|Método de los rectángulos]]
** [[http://en.wikipedia.org/wiki/Trapezium_rule|Método de los trapecios]]
** [[http://en.wikipedia.org/wiki/Simpson%27s_rule|Método de Simpson 1/8 y 3/8]]
** [[http://en.wikipedia.org/wiki/Boole%27s_rule|Fórmula de Boole]]
* [[http://en.wikipedia.org/wiki/Richardson_extrapolation|Extrapolaciones de Richardson]]
* [[http://en.wikipedia.org/wiki/Romberg_integration|Integración de Romberg]]
* [[http://en.wikipedia.org/wiki/Gaussian_quadrature|Integración con cuadraturas de Gauss-Legendre]]
--->

### 6. SOLUCION DE ECUACIONES DIFERENCIALES ORDINARIAS (1 semanas)
* Introduction
* Método de las diferencias finitas
* Método de Euler y método de Euler mejorado
* Métodos de Runge-Kutta
* Métodos predictor-corrector: Adams-Bashford-Moulton
* Stiff ordinary differential equations
* Programación con PYTHON y contextualización a la ingeniería civil

### 7. NUMEROS ALEATORIOS (3 semanas)
* Introducción
* Generacion de números pseudo aleatorios uniformemente distribuídos
  * Método del generador congruencial lineal (método de Park y Miller)
  * Método de Mersenne Twister
  * Método Blum-Blum-Shub
  * Método Ranlux
* Generacion de números pseudoaleatorios provenientes de otras distribuciones
  * Método de la transformada inversa
  * Método de la aceptación-rechazo
  * Método ziggurat y transformacion de Box-Muller
* Integracion simple de Monte Carlo
* Introducció a la confiabilidad estructural y cálculo de probabilidad de falla de sistemas estructurales
* Programación con PYTHON y contextualización a la ingeniería civil
<!---
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
--->

## Otras observaciones que se quieren dejar por escrito

### Falta a los exámenes
Siempre que usted falte a un examen, debe haber algún documento que lo exonere de dicha inasistencia. Cuando usted por algún motivo de fuerza mayor no pueda asistir al examen, usted debe avisarle al profesor con anterioridad ya sea personalmente o por correo. En esos casos en lo posible, debe demostrarlo. Por ejemplo: si le tocó viajar a su pueblo esa semana porque algo sucedió un evento familiar de trascendencia, entonces una forma de certificar que usted viajó son los tiquetes de ida y vuelta a su pueblo. Sin una excusa o una notificación previa no se repetirán los exámenes y usted tendrá como nota un cero.

### Dispositivos electrónicos durante los exámenes
Durante los exámenes, los celulares, teléfonos, gafas inteligentes, y en general cualquier dispositivo electrónico debe permanecer apagado y guardado en el morral. Si el estudiante porta alguno de estos dispositivos electrónicos en sus manos, bolsillos o en cualquier lugar diferente del morral, independientemente de si está apagado o encendido, esto resultará en la anulación del examen. Esta medida se aplica como parte de las normas contra el fraude académico, ante la proliferación del fraude con la tecnología.

### Fraude en los exámenes o trabajos
El fraude es una conducta intolerable, que se penalizará así:
* Nota cero en el trabajo/examen en cuestión.
* Carta al Consejo de Facultad reportando el suceso.
<!---
* Se pierden adicionalmente todos los privilegios que se tienen de una calificación con notas mayores a 5.0 en todas las notas obtenidas en el semestre y cualquier bonificación adicional de notas que el profesor decida otorgar al grupo.
--->

### "Minuciosamente" en los exámenes
En todos los exámenes se debe relacionar con palabras las fórmulas y motivar físicamente el por qué de un procedimiento o fórmula (es decir, se debe escribir la explicación suponiendo que usted está escribiendo un libro). Si no se hace esto, se le rebajará en ese punto en particular el 50% de la nota.

# Taller de programación 1: (20% de la nota final)

![Caricatura](http://imgs.xkcd.com/comics/ballmer_peak.png)

Fuente: <http://xkcd.com/323/>

Las reglas del taller son las siguientes:
* El taller se debe realizar grupos de máximo dos personas.
* Usar siempre números decimales en sus respuestas, no fracciones.
* Por cada __hora__ de retraso en la entrega del trabajo se les descontará 0.1 unidades de la nota final.
* Los programas deberán estar bien comentados, bien identados y demás recomendaciones vistas en clase (se rebajará si el código no cumple con esto).
* Enviar un archivo comprimido a mi correo que contenga los programas y el documento en word **convertido a .pdf** (ó LaTeX si quiere subir 0.30) con las respuestas al taller. OJO: Sólo revisaré documentos que estén en .pdf (no .doc ni .jpg escaneados), asi que favor convertir.


**<span style="color: #000000; font-size: 250%;">Tareas y Asignaciones</span>**

**<span style="font-size: 32.5px;">Taller III:</span>**
* **Versión 2 [[file:taller_III_v2.pdf]] [[file:taller_III_v2.tex]]**
* **Versión 1 [[file:taller_III_v1.pdf]] [[file:taller_III_v1.tex]]**

**<span style="font-size: 32.5px;">Taller II:</span>**
* <span style="font-size: 32.5px;">[[file:taller_II.pdf]] [[file:taller_II.tex]]</span>


**<span style="font-size: 250%;">Taller I:</span>**
* **Versión 1 [[file:taller_I_01.pdf]] [[file:taller_I_01.tex]]**
* **Versión 2 [[file:taller_I_02.pdf]] [[file:taller_I_02.tex]]**
* **Versión 3 [[file:taller_I_03.pdf]] [[file:taller_I_03.tex]]**

<span style="font-size: 250%; line-height: 1.5;">------------</span>
<span style="font-size: 1.3em; line-height: 1.5;">**GAUSS-JORDAN**</span>
# <span style="text-decoration: line-through;">Modifique el programa para que haga full pivoting</span>
# Modifique el programa para que detecte que la matriz es singular. <span style="text-decoration: line-through;">En ese caso retorne el rango de la matriz.</span>
# <span style="text-decoration: line-through;">Modifique el programa para que Ainv se guarde directamente en la matriz A</span>

==GAUSS ELIMINATION WITH BACKSUBSTITUTION== 
# <span style="text-decoration: line-through;">Modifique el programa para que haga full pivoting</span>
# Modifique el programa para que detecte que la matriz es singular. <span style="text-decoration: line-through;">En ese caso retorne el rango de la matriz.</span>
# <span style="text-decoration: line-through;">Deduzca y reimplemente el algoritmo de eliminación gaussiana, para que al final retorne una matriz triangular inferior que se resuelve utilizando sustituciones hacia adelante</span>

==LU DECOMPOSITION OF A SQUARE MATRIX USING DOOLITTLE'S METHOD== 
# <span style="text-decoration: line-through;">Implementar partial pivoting</span>
# <span style="text-decoration: line-through;">Guardar L y U en A</span>
# Modificar el algoritmo e implementar la descomposición de Cholesky. Hacer el algoritmo de modo que informe si la matriz A no es definida positiva.

==INTERPOLACION== 
Implementar los siguientes algoritmos de interpolación:
* Interpolación usando los vecinos más cercanos
* Interpolación lineal
* Interpolación utilizando polinomios de Lagrange
* Interpolación utilizando segmentos de parábola, garantizando continuidad de primer orden
Demostrar gráficamente que el algoritmo está interpolando efectivamente.

==INTERPOLACION== 
Verifique el [[http://en.wikipedia.org/wiki/Runge's_phenomenon|fenómeno de Runge]] sobre la función:
[[math]]
f(x) = \frac{1}{1+25x^2}
[[math]]
Para tal fin, estime los primeros 10 polinomios de Lagrange, utilizando como puntos nodo para la interpolación:
* puntos equidistantes en el intervalo [-1, 1].
* [[http://en.wikipedia.org/wiki/Chebyshev_nodes|nodos de Chebyshev]] en el intervalo [-1, 1].
¿Qué concluye?

Utilice las funciones "legend" y "hold on" de MATLAB para facilitar la representación de los polinomios

<span style="font-size: 1.3em; line-height: 1.5;">**INTERPOLACION**</span>
Suponga que los siguientes datos miden la temperatura de un lago con respecto a la profundidad del mismo.

|| T - Temperatura (gC) || 22.8 || 22.8 || 22.8 || 20.6 || 13.9 || 11.7 || 11.1 || 11.1 ||
|| z - Profundidad (m) || 0 || 2.3 || 4.9 || 9.1 || 13.7 || 18.3 || 22.9 || 27.2 ||

Encuentre la profundidad de la termoclina (http://es.wikipedia.org/wiki/Termoclina). Esta se encuentra en el punto de inflexión de la curva profundidad-temperatura, es decir en el punto para el cual
[[math]]
\frac{d^2 T}{dz^2}= 0
[[math]]
(RESPUESTA: la profundidad es 11.35 m).

<span style="font-size: 1.3em; line-height: 1.5;">**INTERPOLACION**</span>
El esfuerzo cortante en kPa de nueve especímenes de suelo que fueron tomados a varias profundidades en un estrato de arcilla son:
|| z - Profundidad (m) || 1.9 || 3.1 || 4.2 || 5.1 || 5.8 || 6.9 || 8.1 || 9.3 || 10.0 ||
|| C - esfuerzo cortante(kPa) || 14.4 || 28.7 || 19.2 || 43.1 || 33.5 || 52.7 || 71.8 || 62.2 || 76.6 ||
Estime el esfuerzo cortante a una profundidad de 4.0 metros.


==INTERPOLACION BIDIMENSIONAL== 
Para los siguientes puntos, opcionalmente, utilice el programa adjunto: [[file:leergraficointerp.zip]]

Suponga que usted está diseñando unas tuberías enterradas utilizando la teoría de Marston. En un libro se encontró un gráfico:
[[image:cv_tuberia.png]]
Tomado de http://www.uniteca.com.ve/pdf/Manual_Alcantarillado.pdf (página 26)

sobre el coeficiente de cargas vivas que puede soportar la tubería. Resulta que usted hizo un programa para automatizar la tarea, pero en cierto punto usted necesita mirar el gráfico para calcular el valor de Cs. Cree una función que automatice dicho procedimiento.


En otro libro usted encontró el gráfico mostrado.
[[image:cv_tuberia2.png]]
Tomado de: http://www.inti.gov.ar/cirsoc/pdf/publicom/13-Seccion_12_2004.pdf

cree una función que automatice el procedimiento de leer el coeficiente Cdt a partir del ángulo de fricción del suelo y de la relación de la sobrecarga del suelo y el ancho.

Felipe Uribe dice que se deben convertir los graficos de .png a punto .gif para que el programita funcione.

==INTEGRACION DE FUNCIONES== 
Utilizando la regla de los trapecios, calcule la integral
[[math]]
\int_0^{\pi/2}\cos(x)\mathrm{d}x = 1
[[math]]
para tal fin varíe la cantidad de intervalos (n) utilizados.
Calcule el error_de_integración(n) = 1 - trapecios(n)
Grafique n vs error_de_integración(n), utilizando una escala logarítmica en las ordenadas (comando semilogy de MATLAB)

==INTEGRACION DE FUNCIONES== 
Calcule la integral (con n = 20 puntos: x0, x1, x2, ..., xn)
[[math]]
\int_{-\pi/2}^1 \exp(x)\cos(x) + x^2 \mathrm{d}x
[[math]]
respuesta:
MAXIMA -> (%i4) integrate(exp(x)*cos(x) + x^2, x, -%pi/2, 1);
[[math]]
\frac{\exp(1)\sin(1)}{2}+\frac{\exp(1)\cos(1)}{2}+\frac{\exp\left(-\frac{\pi}{2}\right)}{2}+\frac{{\pi}^{3}}{24}+\frac{1}{3}
[[math]]
utilizando:
* Método de los trapecios
* Métodos de Simpson 1/3 y 3/8


==INTEGRACION== 
Calcule
[[math]]
\\
\int_1^2 \left(2x + \frac{3}{x}\right)^2 dx\\
\int_1^20 \frac{20x}{6+x} cos(x^2) dx
[[math]]

a). utilizando los métodos de Newton-Cotes con dos puntos (trapecios), tres puntos (Simpson 1/3), ... diez puntos
b). integre con el método de los trapecios hasta que la curva de la precisión tenga un mínimo debido a que los errores por redondeo empiezan a dominar (programe la variable que contiene la sumatoria como de tipo "single" en MATLAB).
c). utilizando la integración de Romberg, y una precisión del 99.9999%.
d). utilizando cuadraturas de Gauss-Legendre de orden 2, 3, 4, ..., 10.
Cual método requirió menos evaluaciones del integrando?

==INTEGRACION== 
El perfil de un río se midió:

|| x - distancia (m) || 0 || 1.5 || 3.4 || 5.9 || 7.8 || 10.4 || 11.9 || 13.7 || 16 ||
|| H - profundidad (m) || 0 || 19.2 || 2 || 2 || 2.4 || 2.6 || 2.25 || 1.12 || 0 ||

El área transversal del río se puede calcular como la integral
[[math]]
Area = \int_0^{16} H(x) dx
[[math]]
Estime con una precisión del 99% el área transversal del río (que opina usted de este requerimiento?)
Utilice las funciones de integración ya programada en MATLAB para calcular este problema.


==INTEGRACION== 
Sobre un rascacielos el viento ejerce una fuerza distribuída que se ha medido como
|| h - altura (m) || 0 || 30 || 60 || 90 || 120 || 150 || 180 || 210 || 240 ||
|| F - fuerza (N/m) || 0 || 340 || 1200 || 1600 || 2700 || 3100 || 3200 || 3500 || 3800 ||
calcule la fuerza resultante de dicha carga distribuída y su punto de acción.
Utilice las funciones de integración ya programada en MATLAB para calcular este problema.


==INTEGRACION== 
Dada la FDP Normal
[[math]]
f_X(x) = \frac{1}{\sigma \sqrt{2\pi}} \exp\left(-\frac{(x-\mu)^2}{2\sigma^2}\right),
[[math]]
calcule la probabilidad que una variable aleatoria X con media 5 y desviación estandar 8 se encuentre entre 4 y 15 con una precisión del 99.999999%
Utilice las funciones de integración ya programada en MATLAB para calcular este problema.


==RAICES DE ECUACIONES== 
A partir de la ecuación de [[http://en.wikipedia.org/wiki/Colebrook_equation|Coolebrook-White]] ,
[[math]]
\frac{1}{\sqrt{f}} = -2.0 \log_{10} \left(\frac{\frac{\epsilon}{d}}{3.7} + {\frac{2.51}{Re \sqrt{f}}} \right) \quad \to \quad \text{para flujo turbulento}
[[math]]
grafique el [[http://en.wikipedia.org/wiki/Moody_diagram|diagrama de Moody]] :
[[image:Moody_diagram.jpg width="800"]]
empleando para ello
* El método de la bisección
* El método de Newton-Raphson
* La función fzero de MATLAB


==GENERACION DE NUMEROS ALEATORIOS== 
* Implementar el [[http://en.wikipedia.org/wiki/Ziggurat_algorithm|algoritmo ziggurat]] para generar números aleatorios con distribución normal con media 0 y desviación estándar 1.


==<span style="color: #008000;">TRABAJO ESCRITO</span>== 
Cree la página de WIKIPEDIA en español (o mejore significativamente la página de WIKIPEDIA) de alguno de los siguientes temas (tamaño mínimo por persona: 15000 bytes):
* Generadores de números aleatorios y pseudoaleatorios
* Interpolación en varias dimensiones
* Interpolación con splines
* Integración con cuadraturas de Gauss sobre regiones triangulares
* Metodo Ziggurat para la generación de números aleatorios
* Descomposición de Cholesky y Descomposición LU

Por favor cree una cuenta en WIKIPEDIA antes de empezar a crear el artículo, en caso que no cuente con una.

Si necesita ayuda con el código para las fórmula utilice las páginas:
# http://dante.ctan.org/get/info/lshort/spanish/lshort.pdf (CAPITULO 3)
# http://wwwlb.aub.edu.lb/~acc/Resources/Computing/TeXaide.htm (Este es un programa en el que usted escribe la fórmula en un programa similar al editor de ecuaciones de MS Word y obtiene el código en LaTeX)
# http://www.sitmo.com/latex/
# [[http://www.codecogs.com/components/eqneditor/editor.php]]

Algunas páginas creadas por estudiantes de semestres anteriores:
* [[http://es.wikipedia.org/wiki/Extrapolaci%C3%B3n_de_Richardson|Extrapolación de Richardson]]
* [[http://es.wikipedia.org/wiki/F%C3%B3rmulas_de_Newton%E2%80%93Cotes|Fórmulas de Newton–Cotes]]

=SOLUCION DE ECUACIONES DIFERENCIALES ORDINARIAS= 
Estudiar la teoría del péndulo doble:
* http://en.wikipedia.org/wiki/Double_pendulum
* http://www.myphysicslab.com/dbl_pendulum.html

Y hacer en MATLAB un programa para generar animaciones como:
[[image:http://upload.wikimedia.org/wikipedia/commons/4/45/Double-compound-pendulum.gif]]
dados los ángulos de inclinación iniciales del péndulo.

Integre las ecuaciones diferenciales resultantes con
* Método de [[http://en.wikipedia.org/wiki/Linear_multistep_method|Adams-Moulton]] utilizando como algoritmo de iniciación el método de Runge-Kutta. Utilice aquí Adams-Bashford/Adams-Moulton como una pareja [[http://en.wikipedia.org/wiki/Predictor-corrector_method|predictor-corrector]].
* El comando ode45 de MATLAB

Demuestre gráficamente que el péndulo es un sistema caótico.



==OPTIMIZATION DE FUNCIONES== 
Encuentre el mínimo de la función
[[math]]
f(x) = \frac{1}{2x+1}+x
[[math]]
que se encuentra entre x=0 y x=2 utilizando
* Método de la bisección
* Método de la búsqueda aurea
* Método de la minimización cuadrática
* Método de Newton
* Método de la secante

Minimice
* la [[http://en.wikipedia.org/wiki/Rosenbrock_function|función de Rosenbrock]] en dos dimensiones
* la [[http://en.wikipedia.org/wiki/Himmelblau%27s_function|función de Himmelblau]]
* la [[http://en.wikipedia.org/wiki/Rastrigin_function|función de Rastrigin]]
utilizando:
* Minimización con el método de la búsqueda aleatoria
* Minimización utilizando el método del descenso más empinado
* Minimización utilizando el método de Newton
* Minimización utilizando particle swarm optimization

Grafique todos los puntos que evaluó
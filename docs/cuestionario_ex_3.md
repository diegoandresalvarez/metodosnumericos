# Cuestionario para el examen 3 de métodos numéricos aplicados a la ingeniería civil

NOTA: Este cuestionario es un resumen de los temas que se abordarán en el examen 3. Algunas de las preguntas formuladas en este cuestionario no se estudiaron en clase, por lo que se recomienda investigar y estudiar por cuenta propia dichos temas.

Libros recomendados:
* Chapra, S. C. & Canale, R. P. (2021). Numerical Methods for Engineers (8th ed.). McGraw-Hill.
* Burden, R. L., Faires, J. D., & Burden, A. M. (2011). *[Numerical analysis](https://faculty.ksu.edu.sa/sites/default/files/numerical_analysis_9th.pdf)* (9th ed.). Cengage Learning.
* Burden, R. L., Faires, J. D., & Burden, A. M. (2016). *[Numerical analysis](http://ir.harambeeuniversity.edu.et/handle/123456789/1576)* (10th ed.). Cengage Learning.



## Continuidad de funciones

1. Describa la clasificación de funciones según su continuidad: $C^0$, $C^1$, $C^2$, $C^k$, $C^\infty$, etc.
1. ¿Por qué es importante la continuidad de las derivadas en la interpolación para aplicaciones de ingeniería?
1. Dé ejemplos de funciones que aseguren continuidad $C^0$, $C^1$, y $C^2$, etc.



## Polinomios

4. ¿En qué consiste el método de Horner para evaluar polinomios? ¿Por qué es eficiente?



## Polinomios con Python

Estudie cuidadosamente los siguientes códigos de Python:

5. [Poly1D_numpy](../codigo/03_interpolacion/Poly1D_numpy.ipynb) (vale por 10 preguntas del examen)



## Interpolación

15. Como se define matemáticamente la interpolación?
1. ¿Cuáles son las propiedades deseables de un método de interpolación?
1. ¿Cuáles son los criterios principales para elegir un método de interpolación sobre otro?



## Interpolación univariada

18. ¿Cuáles son las ventajas y desventajas de la interpolación univariada?
1. ¿Cuáles son los criterios principales para elegir un método de interpolación univariada sobre otro?



## Métodos de interpolación univariada

Con respecto a los siguientes métodos de interpolación univariada, explique: (a) ventajas, (b) desventajas, (c) criterios de selección, (d) clase de continuidad, (e) implementación en Python (API o uso), y (f) derivación matemática (si se abordó en clase):

20. Interpolación de vecinos más cercanos
1. Interpolación lineal
1. Interpolación polinomial
1. Interpolación con splines cúbicos
1. Interpolación con splines cúbicos de Hermite 
1. Interpolación con PCHIP
1. Interpolación de Akima
1. Interpolación de Makima



## Interpolación polinomial

28. ¿En qué casos se justifica calcular los coeficientes de un polinomio interpolante de grado $n$?
1. ¿Qué es el fenómeno de Runge? ¿Por qué es importante en la interpolación polinomial?
1. ¿Qué son los nodos de Chebyshev? ¿Por qué son importantes en la interpolación polinomial?
1. Compare el uso de nodos equiespaciados vs nodos de Chebyshev en la interpolación polinomial.
1. ¿Por qué se usan los nodos de Chebyshev en la interpolación polinomial de alto grado?
1. ¿Qué es la interpolación de Lagrange? ¿Cómo se implementa en Python?
1. ¿Qué es la interpolación de Hermite? ¿Cómo se implementa en Python?



## Interpolación polinomial con Python

Estudie cuidadosamente los siguientes códigos de Python:

35. [1D_polynomial_interpolation.ipynb](../codigo/03_interpolacion/1D_polynomial_interpolation.ipynb) (vale por 10 preguntas del examen)


## Interpolación con splines cúbicos

45. Deduzca rigurosamente su formulación matemática. (vale por 6 preguntas del examen)

---

51. Describa y explique matemáticamente las condiciones de frontera: natural (`natural`), empotrada (`clamped`), sin nudo (`not-a-knot`) y periodica (`periodic`). (vale por 6 preguntas del examen)

---

57. Como se emplean los splines cúbicos para interpolar curvas cerradas? (vale por 3 preguntas del examen)



## Implementación de splines cúbicos con Python

Estudie cuidadosamente los siguientes códigos de Python:

60. [cubic_spline_interpolation.ipynb](../codigo/03_interpolacion/cubic_spline_interpolation.ipynb) (vale por 10 preguntas del examen)

---

70. La última pregunta es la 70.

<!---
## Interpolación multivariada
POR FORMULAR
--->

<!---
**Interpolation Methods:**
  * Polynomial interpolation:
     * Solving a linear system with Vandermonde matrices
    * Krogh’s method (1970)
    * Barycentric interpolation (Berrut & Trefethen, 2004)
---
* Multivariate interpolation on structured grids:
  * Nearest neighbors
  * Linear interpolation (bilinear, trilinear)
  * Bicubic interpolation
  * Bicubic splines
* Multivariate interpolation on scattered data:
  * Nearest neighbors
  * Linear interpolation
  * RBFs
---
### 9. Additional concepts
* What is Occam's razor about? How do you apply it in the context of optimization?
* Homework: Describe the properties of Vandermonde matrices.
* Explain Voronoi tessellations. What are their main properties?
* Explain Delaunay's triangulations. What are their main properties?
* Explain Occam's razor. How is it used for selecting an interpolation algorithm?
* Explain feature scaling. Motivation, methods, advantages, etc.
--->
## Integración numérica
1. Explique la relación entre integración y diferenciación. ¿Cómo se puede interpretar la integral como la solución de un problema de valor inicial?
<!---
1. Explique el teorema del valor medio para integrales.
--->

## Integración numérica con la regla del punto medio y el método de los trapecios
2. Deduzca la regla del trapecio simple integrando la recta que une $(a,f(a))$ y $(b,f(b))$, $y=(x-a)\frac{f(b)-f(a)}{b-a}+f(a)$. Muestre todos los pasos hasta llegar a $\frac12(b-a)[f(a)+f(b)]$.
1. Demuestre que la regla del punto medio, $2h\,f_1$ con $h=(b-a)/2$, es exacta para polinomios de grado 1.
1. Aplique el trapecio simple a cada subintervalo $[x_{k-1},x_k]$ de una partición no uniforme y obtenga $\sum_k \frac{f(x_{k-1})+f(x_k)}{2}\Delta x_k$. Muestre cómo se simplifica, para $\Delta x$ constante, a $\Delta x\left[\frac{f(x_0)+f(x_N)}{2}+\sum_{k=1}^{N-1}f(x_k)\right]$.
1. Sea $f(x)=0.2+25x-200x^2+675x^3-900x^4+400x^5$ en $[0,0.8]$. Evalúe $f(0)$, $f(0.4)$ y $f(0.8)$ y calcule el trapecio compuesto con $n=2$. Verifique el valor 1.0688 y calcule el error relativo respecto a la integral exacta $3076/1875\approx1.64053333$.
1. En la tabla del trapecio para ese polinomio, los errores relativos son 89.47 %, 34.85 %, 9.49 % y 2.42 % para $n=1,2,4,8$. Calcule los cocientes entre errores consecutivos y explique por qué tienden a 4.
1. Interprete el error local del trapecio $E_t=-\frac{1}{12}f''(\xi)(b-a)^3$. ¿Cuándo es exacto el método? ¿Qué ocurre cuando $f$ tiene curvatura?
1. Sume los errores locales $-(\Delta x)^3 f''(\xi_k)/12$ de los $n$ subintervalos de igual longitud $\Delta x=(b-a)/n$. Demuestre la cota $|E|\le \frac{(b-a)^3}{12n^2}\max|f''(x)|$.
1. Con el teorema del valor medio para integrales, $\int_a^b f''(x)\,dx=f'(b)-f'(a)=(b-a)f''(\xi)$. Demuestre que $\frac{h^2}{12}(f'(b)-f'(a))=\frac{h^2(b-a)}{12}f''(\xi)$ y, con $h=(b-a)/n$, llegue al mismo orden $O(1/n^2)$.
1. A partir de Euler-Maclaurin, explique por qué si $f'(a)=f'(b)$ el término dominante del error pasa de $O(h^2)$ a $O(h^4)$. Dé dos tipos de funciones donde esto ocurre.
1. Explique por qué el trapecio compuesto sobre un número entero de periodos con malla uniforme logra convergencia exponencial para funciones analíticas periódicas, y por qué Simpson no gana esa misma ventaja.
1. Para un pico estrecho (p. ej., una gaussiana con colas casi nulas en los límites) el trapecio puede ser sorprendentemente preciso. Justifique con las derivadas en los extremos. Según las diapositivas, ¿cuántas veces más puntos requiere Simpson 1/3 para igual precisión?
1. Determine el número mínimo de subintervalos para aproximar $\int_1^3 dx/x$ con trapecio compuesto y error menor que $10^{-4}$. Use $\max|f''|=2$ en $[1,3]$.
1. Para $\int_0^\pi \sin x\,dx$ con trapecio compuesto y error absoluto menor que $10^{-5}$, demuestre que $n>\sqrt{\pi^3/0.00012}\approx508.3$ y concluya $n=509$.
1. En el código de Python `integral = dx*(y[0]/2 + np.sum(y[1:n]) + y[n]/2)`, explique el papel de cada término, justifique que coincide con `np.trapezoid(y, x)` y diga qué cambia si los $x$ no son equiespaciados.
1. Aplique el punto medio con 4 subintervalos a $\int_0^2 x^3\,dx$ (figura de Riemann medio). Compare con el valor exacto 4 y verifique que el error observado cumple la cota $M_2(b-a)^3/(24n^2)$.

## Integración numérica con los métodos de Simpson 1/3, Simpson 3/8 y Boole

17. Demuestre que la regla de Simpson 1/3 es $\int_a^b f\,dx\approx\frac h3[f(a)+4f(a+h)+f(b)]$ con $h=(b-a)/2$, integrando la parábola que interpola $(a,f(a))$, $(a+h,f(a+h))$, $(b,f(b))$. Relacione el resultado con la forma $\frac{b-a}{6}\left[f(a)+4f\!\left(\frac{a+b}{2}\right)+f(b)\right]$.
1. Demuestre que Simpson 1/3 es exacta para cubos tomando $f(x)=x^3$ en $[-h,h]$ (nodos $-h,0,h$) y explique, con un argumento de simetría, por qué el coeficiente del término de tercer orden se anula en la integración del polinomio interpolante.
1. Sabiendo que el error de Simpson 1/3 es $-\frac{1}{90}h^5f^{(4)}(\xi)$, demuestre que equivale a $-\frac{(b-a)^5}{2880}f^{(4)}(\xi)$ cuando $h=(b-a)/2$.
1. Calcule Simpson 1/3 simple para $\int_0^\pi\sin x\,dx$ con $h=\pi/2$ y calcule el error relativo.
1. Deduzca los pesos de la regla de Simpson 3/8, $\frac{3h}{8}[f_0+3f_1+3f_2+f_3]$, integrando el cúbico interpolante en cuatro puntos equiespaciados.
1. Demuestre que el error de Simpson 3/8, $-\frac{3}{80}h^5f^{(4)}(\xi)$, equivale a $-\frac{(b-a)^5}{6480}f^{(4)}(\xi)$ con $h=(b-a)/3$.
1. Compare los coeficientes de error $1/2880$ (Simpson 1/3) y $1/6480$ (Simpson 3/8) en términos de $(b-a)^5$. ¿Es correcto afirmar que 3/8 es "aproximadamente dos veces más precisa"? ¿Cuántas evaluaciones usa cada una y cuándo se prefiere 3/8?
1. A partir de Simpson 1/3 aplicada a $n/2$ paneles de longitud $2h$, demuestre la regla compuesta $\frac h3\left[f(x_0)+4\sum f(x_{2i-1})+2\sum f(x_{2i})+f(x_n)\right]$ e indique el patrón de pesos 1, 4, 2, 4, …, 2, 4, 1.
1. Sumando los errores $-\frac1{90}h^5f^{(4)}(\xi_i)$ de los $n/2$ paneles, demuestre que el error de Simpson compuesto es $-\frac1{180}h^4(b-a)f^{(4)}(\xi)$ y que está acotado por $\frac1{180}h^4(b-a)\max|f^{(4)}|$.
1. Determine el número de intervalos necesario para aproximar $\int_0^\pi\sin x\,dx$ con Simpson 1/3 compuesto y error menor que $10^{-5}$. Muestre que $n>(\pi^5/0.0018)^{1/4}\approx20.3$ y que se elige $n=22$. Compare con $n=509$ del trapecio.
1. ¿Por qué Simpson 1/3 compuesto exige $n$ par y 3/8 compuesto exige $n$ múltiplo de 3? Explique cómo combinar ambas reglas para $n=5$ segmentos manteniendo exactitud cúbica en todo el intervalo.
1. Escriba la regla de Simpson 3/8 compuesta con el patrón de pesos 1, 3, 3, 2, 3, 3, 2, …, 3, 3, 1 y desarrolle la expresión para $n=6$.
1. Con $f(x)=0.2+25x-200x^2+675x^3-900x^4+400x^5$ en $[0,0.8]$ y $n=4$ ($h=0.2$), evalúe $f$ en los cinco nodos y aplique Simpson 1/3 compuesto. Verifique que obtiene 1.623467 y relaciónelo con la extrapolación de Richardson de los trapecios 1.0688 y 1.4848.
1. Simpson compuesto para datos irregulares tiene el término $\frac{h_{2i}+h_{2i+1}}{6}\left[\left(2-\frac{h_{2i+1}}{h_{2i}}\right)f_{2i}+\frac{(h_{2i}+h_{2i+1})^2}{h_{2i}h_{2i+1}}f_{2i+1}+\left(2-\frac{h_{2i}}{h_{2i+1}}\right)f_{2i+2}\right]$. Demuestre que, si todos los $h$ son iguales a $h$, se reduce a $\frac h3(f_{2i}+4f_{2i+1}+f_{2i+2})$.
1. Con $N$ impar de subintervalos, se añade $\alpha f_N+\beta f_{N-1}-\eta f_{N-2}$, con $\alpha=\frac{2h_{N-1}^2+3h_{N-1}h_{N-2}}{6(h_{N-2}+h_{N-1})}$, $\beta=\frac{h_{N-1}^2+3h_{N-1}h_{N-2}}{6h_{N-2}}$ y $\eta=\frac{h_{N-1}^3}{6h_{N-2}(h_{N-2}+h_{N-1})}$. Verifique que para pasos iguales $h$ dan $\alpha=5h/12$, $\beta=2h/3$ y $\eta=h/12$.
1. Escriba la regla de Boole, su error $-\frac{8}{945}h^7f^{(6)}(\xi)$ y su grado de exactitud. ¿Por qué las fórmulas "par de segmentos–impar de puntos" (1/3, Boole) son las de preferencia sobre las de $n$ impar?


## Integración numérica con el método de Newton-Cotes

33. Distinga entre fórmulas de Newton-Cotes cerradas y abiertas. Indique, para cada una, la expresión de los nodos $x_i$ y del paso $h$ en función de $a$, $b$ y $n$. Deduzca la fórmula de integración que usa $n$ puntos de integración abierta/cerrada.
1. Sea $L(x)=\sum_i \ell_i(x) f(x_i)$ el polinomio interpolante de Lagrange de los datos $(x_i,f(x_i))$. Demuestre que, al aproximar $\int_a^b f\,dx \approx \int_a^b L\,dx$, se obtiene $\sum w_i f(x_i)$ con $w_i=\int_a^b \ell_i(x)\,dx$, y concluya que los pesos dependen solo de los nodos y no de la función $f$.
1. ¿Por qué las fórmulas abiertas son útiles para integrales con una singularidad en un extremo? ¿Qué problema aparece al componerlas en varios paneles (hueco de $2h$ entre muestras de paneles adyacentes)?
1. Describa el fenómeno de Runge en el contexto de Newton-Cotes de grado alto.
1. Usando el término de error de la interpolación polinómica de grado $n$, demuestre que una fórmula de Newton-Cotes con $n+1$ puntos integra exactamente cualquier polinomio de grado menor o igual que $n$.
1. Explique por qué las fórmulas con número par de segmentos ($n$ par), como Simpson 1/3 y Boole, integran exactamente polinomios de un grado más que el número de segmentos, a diferencia de las de $n$ impar. ¿Qué se concluye sobre cuáles son las de preferencia?
1. Complete la tabla de grado de exactitud: trapecio, Simpson 1/3, Simpson 3/8 y Boole. Verifique que Simpson 1/3 integra exactamente $x^3$ en $[0,2]$.
1. Partiendo de tres puntos equiespaciados $x_1$, $x_2=x_1+h$, $x_3=x_1+2h$, construya el polinomio de Lagrange cuadrático, intégrelo entre $x_1$ y $x_3$ y demuestre que el resultado es $\frac{h}{3}(y_1+4y_2+y_3)$.
1. Con los pesos de la regla de Boole, $\frac{2h}{45}(7f_0+32f_1+12f_2+32f_3+7f_4)$, con $h=1$ y nodos $0,1,2,3,4$, demuestre que integra exactamente $x^5$ en $[0,4]$ (valor $4096/6$) pero no $x^6$


## Extrapolaciones de Richardson y el método de integración de Romberg

42. A partir de las ecuaciones $Q=Q(h_1)+A h_1^{p_0}+O(h_1^{p_1})$ y $Q=Q(h_2)+A h_2^{p_0}+O(h_2^{p_1})$, deduzca que en la extrapolación de Richardson $Q=\frac{h_2^{p_0}Q(h_1)-h_1^{p_0}Q(h_2)}{h_2^{p_0}-h_1^{p_0}}+\text{término de error}$.
1. A partir de las ecuaciones $Q=Q(h_1)+A h_1^{p_0}+O(h_1^{p_1})$ y $Q=Q(h_2)+A h_2^{p_0}+O(h_2^{p_1})$, demuestre que el término de error de la extrapolación de Richardson es $O\!\left[\frac{h_2^{p_0}h_1^{p_1}-h_1^{p_0}h_2^{p_1}}{h_2^{p_0}-h_1^{p_0}}\right]$.
1. Con $h_1=h$, $h_2=h/2$, $p_0=2$, $p_1=4$, demuestre que $Q_4=\frac{4Q_2(h/2)-Q_2(h)}{3}$ y que el coeficiente del error dominante es $-h^4/4$.
1. Con $h_1=h/2$, $h_2=h/4$, $p_0=4$, $p_1=6$, demuestre que $Q_6=\frac{16Q_4(h/4)-Q_4(h/2)}{15}$ y que el coeficiente del error dominante es $-h^6/1280$.
1. Demuestre la fórmula general $Q_{2j+2}=Q_{2j}(h/2^j)+\frac{Q_{2j}(h/2^j)-Q_{2j}(h/2^{j-1})}{4^j-1}$, tomando $h_1=h/2^{j-1}$, $h_2=h/2^j$, $p_0=2j$.
1. Al integrar xxx mediante la regla de los trapecios con $n$ intervalos, se obtiene: $T(1) = ***$, $T(2) = ***$, $T(4) = ***$ y $T(8) = ***$. Utilice estos valores y el método de Romberg y las extrapolaciones de Richardson para obtener un mejor estimador de la integral. Calcule el error relativo y el error absoluto de dicha aproximación. Haga todos los cálculos con 6 decimales.
1. Con Euler-Maclaurin, explique por qué en la integración de Romberg solo se eliminan potencias pares de $h$ (2, 4, 6, 8, …) y por qué cada columna de la tabla sube el orden de dos en dos.
1. Justifique desde la matemática porqué con $n=8$ (9 evaluaciones), el método de Romberg es exacto para un polinomio de grado 5: los términos de Euler-Maclaurin eliminados incluyen las derivadas $f'$, $f'''$, $f^{(5)}$ y el siguiente involucra $f^{(7)}=0$.
1. En la gráfica del número de intervalos cde los errores absolutos de los diferentes métodos de integración, para $n$ intervalos (escala log), ¿qué pendientes asintóticas se observan para punto medio y trapecio, Simpson 1/3 y 3/8, Boole y Newton-Cotes de 6 puntos? Relacione con el orden global $O(h^2)$, $O(h^4)$, $O(h^6)$ y $O(h^8)$.
1. En esa misma gráfica los errores se estancan alrededor de $10^{-16}$. Explique el papel del error de redondeo, el épsilon de máquina y por qué para $n$ grande no se puede alcanzar el resultado exacto analítico.

<!---
## Integración con Gauss-Legendre
1. Explique la idea de la cuadratura gaussiana: ¿qué se elige de forma óptima (nodos y pesos) y qué ventaja ofrece frente a Newton-Cotes con puntos equiespaciados? ¿Para qué tipo de integrandos es adecuada?
1. ¿Por qué una cuadratura de $n$ puntos puede integrar exactamente polinomios hasta grado $2n-1$ ($n$ nodos + $n$ pesos = $2n$ parámetros, frente a los $2n$ coeficientes de un polinomio de grado $2n-1$)?
1. Para $n=2$ en $[-1,1]$, plantee el sistema $c_1+c_2=2$, $c_1x_1+c_2x_2=0$, $c_1x_1^2+c_2x_2^2=2/3$, $c_1x_1^3+c_2x_2^3=0$ y demuestre que la solución única (salvo permutación) es $c_1=c_2=1$, $x_1=-\sqrt3/3$, $x_2=\sqrt3/3$.
1. Use la recursión de Bonnet, $P_0=1$, $P_1=\xi$, $P_n=\frac{(2n-1)\xi P_{n-1}-(n-1)P_{n-2}}{n}$, para obtener $P_2$ y $P_3$. Calcule sus raíces y compruebe que coinciden con los nodos de $n=2$ y $n=3$.
1. Con la fórmula de los pesos $w_i=\frac{2}{(1-\xi_i^2)\,[P_n'(\xi_i)]^2}$, verifique que para $n=2$ se obtiene $w_1=w_2=1$.
1. Deduzca el cambio de variable $x=\frac{(b-a)\xi+(a+b)}{2}$ y demuestre que $\int_a^b f(x)\,dx=\frac{b-a}{2}\int_{-1}^{1}f\!\left(\frac{(b-a)\xi+a+b}{2}\right)d\xi\approx\frac{b-a}{2}\sum w_if\!\left(\frac{(b-a)\xi_i+a+b}{2}\right)$.
1. Aplique la cuadratura de Gauss-Legendre con $n=3$ a $\int_0^\pi\sin x\,dx$. Calcule el error relativo.
1. En la gráfica del error de Gauss-Legendre para el polinomio de grado 5 en $[0,0.8]$, el error es cero a partir de $n=3$. Explique por qué $n=2$ no basta y $n=3$ sí, usando el grado de exactitud $2n-1$.
--->

# Cuestionario para el examen 2 de métodos numéricos aplicados a la ingeniería civil

NOTA: Este cuestionario es un resumen de los temas que se abordarán en el examen 2. Algunas de las preguntas formuladas en este cuestionario no se estudiaron en clase, por lo que se recomienda investigar y estudiar por cuenta propia dichos temas.

Libro recomendado: Chapra, S. C. & Canale, R. P. (2021). Numerical Methods for Engineers (8th ed.). McGraw-Hill.


## Sistemas de ecuaciones lineales

1. ¿Qué es un sistema de ecuaciones lineales? ¿Cómo puede representarse mediante una matriz? ¿Qué tipos de matriz $\boldsymbol{A}$ se pueden tener en el sistema de ecuaciones $\boldsymbol{Ax}=\boldsymbol{b}$?

1. ¿Qué consideraciones deben tenerse en cuenta al resolver un sistema de ecuaciones lineales sobre determinado, sub determinado?

1. ¿Desde el punto de vista geométrico, como se interpretan las soluciones de un sistema de ecuaciones lineales?

1. ¿Qué significa que un sistema de ecuaciones lineales tenga una solución única?

1. ¿Qué significa que un sistema de ecuaciones lineales tenga infinitas soluciones?

1. ¿Qué significa que un sistema de ecuaciones lineales sea inconsistente/no tenga solución?

1. ¿Cuál es el paquete matemático que subyace a la solución de un sistema de ecuaciones lineales en MATLAB y PYTHON? ¿Qué puede decir sobre este software?

1. ¿Qué se puede afirmar sobre la solución de un sistema lineal de ecuaciones para tamaños del orden las decenas, centenas y miles/millones, su relación con la complejidad computacional, los números flotantes usados para su solución (float32, float64, etc) y los métodos numéricos más apropiados para resolverlos?

1. ¿Qué problemas numéricos pueden aparecer al calcular determinantes de matrices extremadamente grandes?

1. ¿Por qué resolver un sistema lineal mediante la matriz inversa puede ser computacionalmente costoso?

1. ¿Qué características de una matriz pueden facilitar la solución de un sistema lineal?


## Regla de Cramer y determinantes

1. Explique la regla de Cramer. ¿Qué condición debe cumplirse para que un sistema tenga una solución única según la regla de Cramer? ¿Por qué la regla de Cramer se vuelve computacionalmente ineficiente a medida que aumenta el número de ecuaciones?

1. ¿Cómo se calcula el determinante de una matriz? 


## Sistemas de ecuaciones bien condicionados, mal condicionados y singulares

1. ¿Qué es un sistema lineal de ecuaciones bien condicionado, mal condicionado y uno singular? En qué se diferencian?

1. ¿Cómo se relaciona el determinante de una matriz con la existencia de una solución única?

1. ¿Qué significa que una matriz sea singular? ¿Cómo puede determinarse si una matriz cuadrada es invertible?

1. ¿Cuál es la diferencia entre una matriz singular y una matriz no singular?

1. ¿Qué problemas pueden surgir al trabajar con sistemas lineales mal condicionados?


## Eliminación de Gauss

1. ¿En qué consiste el método de eliminación de Gauss?

1. ¿Cuál es el objetivo principal de la eliminación de Gauss al resolver un sistema lineal?

1. ¿Cuáles son las principales etapas del método de eliminación de Gauss?

1. ¿Qué es una matriz aumentada y cómo se utiliza en la eliminación de Gauss?

1. ¿Cuáles son las operaciones elementales que pueden realizarse sobre las filas de una matriz? ¿Por qué las operaciones elementales de fila no cambian el conjunto de soluciones de un sistema?

1. ¿Qué significa transformar una matriz a una forma triangular superior?

1. ¿Qué es el pivote en la eliminación de Gauss? ¿Qué papel desempeñan?

1. ¿Qué ocurre si aparece un pivote igual a cero durante la eliminación hacia adelante? ¿Cómo puede resolverse el problema de un pivote igual a cero? Justifique su respuesta matemáticamente.

1. ¿Por qué la división por un número muy pequeño puede aumentar el error?

1. ¿Por qué es importante elegir cuidadosamente los pivotes durante la eliminación?

1. ¿Qué es el pivoteo parcial y por qué se utiliza durante la eliminación de Gauss? ¿Cómo se selecciona el pivote en el pivoteo parcial? ¿Qué ventajas ofrece el pivoteo parcial respecto a no utilizar pivoteo? ¿Cómo ayuda el pivoteo parcial a reducir los errores numéricos?

1. ¿Qué es el pivoteo completo? ¿Cuál es la diferencia entre el pivoteo parcial y el pivoteo completo? ¿Qué operaciones adicionales son necesarias cuando se utiliza pivoteo completo? ¿Por qué el pivoteo completo no se emplea en la práctica?

1. ¿Qué es la sustitución hacia atrás? ¿Cómo se utiliza la sustitución hacia atrás?

1. ¿Cómo se calcula el determinante de una matrix $\boldsymbol{A}$ usando la eliminación gausiana?

1. ¿Cuál es el costo computacional aproximado de la eliminación de Gauss para un sistema de $n$ ecuaciones? ¿De la sustitución hacia atrás?


## Eliminación de Gauss-Jordan

1. ¿En qué consiste el método de eliminación de Gauss-Jordan?

1. ¿Cuál es la principal diferencia entre la eliminación de Gauss y la eliminación de Gauss-Jordan?

1. ¿Qué forma de matriz se obtiene al aplicar completamente el método de Gauss-Jordan?

1. ¿Cómo puede utilizarse Gauss-Jordan para obtener la solución de un sistema lineal?

1. ¿Cómo puede utilizarse Gauss-Jordan para calcular la matriz inversa?

1. ¿Qué relación existe entre la forma escalonada reducida y la solución de un sistema?

1. ¿Cuáles son las ventajas de Gauss-Jordan frente a la eliminación de Gauss?

1. ¿Cuáles son las desventajas de Gauss-Jordan frente a la eliminación de Gauss?

1. ¿Por qué Gauss-Jordan generalmente requiere más operaciones que la eliminación de Gauss?

1. ¿Cómo se compara el costo computacional de Gauss y Gauss-Jordan?

1. ¿Cómo afecta el número de ecuaciones y variables al costo computacional de estos métodos?

1. Se le dará un sistema linear de 4 ecuaciones con 4 incógnitas y se solicitará resolverlo usando uno de los siguientes métodos:
   - Eliminación gaussiana (resolver el sistema de ecuaciones)
   - Gauss-Jordan (para encontrar la inversa de la matriz A).


## Matrices de permutación

1. ¿Qué es una matriz de permutación? ¿Qué propiedades tiene? ¿Qué pasa cuando se premultiplica/postmultiplica con una matriz de permutación?

1. ¿Cuál es el determinante de una matriz de permutación? ¿Por qué?


## Descomposición LU

1. ¿Qué es la descomposición LU $\boldsymbol{A}=\boldsymbol{LU}$ de una matriz? ¿Cómo son las matrices $\boldsymbol{L}$ y $\boldsymbol{U}$? 

1. Describa la descomposición LU de Doolittle.

1. Describa la descomposición LU de Crout.

1. Describa el proceso de la sustitución hacia atrás.

1. Describa el proceso de la sustitución hacia adelante.

1. ¿Cómo puede utilizarse la descomposición LU para resolver un sistema $\boldsymbol{Ax}=\boldsymbol{b}$?

1. ¿Por qué la descomposición LU puede ser más eficiente cuando se necesita resolver varios sistemas con la misma matriz $\boldsymbol{A}$?

1. ¿Cómo se relaciona la descomposición LU con la eliminación de Gauss?

1. ¿Cómo se resuelve el sistema $\boldsymbol{Ly}=\boldsymbol{b}$ después de obtener una descomposición LU?

1. ¿Cómo se resuelve el sistema $\boldsymbol{Ux}=\boldsymbol{y}$?

1. ¿Qué problemas pueden surgir al intentar calcular una descomposición LU sin pivoteo?

1. ¿Cómo puede incorporarse el pivoteo en una descomposición LU?

1. ¿Qué significa una descomposición de la forma $\boldsymbol{A}=\boldsymbol{PLU}$?

1. ¿Cuál es el papel de la matriz de permutación $\boldsymbol{P}$ en una descomposición LU con pivoteo?

1. ¿Qué ventajas computacionales ofrece LU cuando se tienen múltiples vectores $\boldsymbol{b}$ para la misma matriz $\boldsymbol{A}$?

1. ¿Cómo se compara el costo de factorizar una matriz con el costo de resolver sistemas triangulares?

1. ¿Cómo puede usarse la descomposición LU para calcular la inversa de una matriz?

1. ¿Cómo se calcula el determinante de A usando la descomposición LU?

1. ¿En qué tipos de problemas puede ser especialmente útil la descomposición LU?

1. ¿Cuál es el costo computacional aproximado de la descomposición LU para un sistema de $n$ ecuaciones? ¿De la sustitución hacia atrás y hacia adelante?


## Descomposición de Cholesky

1. ¿Qué es la descomposición de Cholesky $\boldsymbol{A}=\boldsymbol{LL}^T$? ¿A qué tipo de matrices se aplica? ¿Cuándo es especialmente útil la descomposición de Cholesky?

1. ¿Qué pasos implica resolver un sistema de ecuaciones usando la descomposición de Cholesky?
    
1. ¿Qué caracteriza a una matriz definida positiva (son tres condiciones equivalentes)?

1. ¿Cómo puede utilizarse la descomposición de Cholesky para resolver un sistema lineal de ecuaciones $\boldsymbol{Ax}=\boldsymbol{b}$?

1. ¿Cómo se calcula el determinante de $\boldsymbol{A}$ usando la descomposición de Cholesky? 

1. ¿Qué ventajas tiene Cholesky frente a una descomposición LU general?

1. ¿Por qué matemáticamente falla la descomposición de Cholesky cuando se le intenta aplicar Cholesky a una matriz que no es definida positiva?

1. ¿Cuál es el costo computacional aproximado de la descomposición de Cholesky para un sistema de $n$ ecuaciones? ¿De la sustitución hacia atrás y hacia adelante?


## Gauss-Seidel y Métodos Iterativos

1. ¿En qué consiste el método iterativo de Gauss-Seidel? ¿El de Jacobi? ¿Cuáles son sus diferencias?

1. ¿Cuál es la diferencia entre un método directo y un método iterativo para resolver sistemas lineales?

1. ¿Cómo se actualizan las variables durante una iteración del método de Gauss-Seidel?

1. ¿Qué condiciones pueden favorecer la convergencia del método de Gauss-Seidel?

1. ¿Cuáles son las ventajas y desventajas de utilizar métodos iterativos como Gauss-Seidel para resolver sistemas grandes y dispersos?


## Matrices bandeadas
1. ¿Qué es una matriz bandeada? ¿Qué ventajas tiene su uso?

1. ¿Qué es ancho de banda y cómo se calcula? ¿Qué mide el ancho de banda de una matriz?

1. ¿Qué es el algoritmo reversed Cuthill-McKee y cómo se relaciona con las matrices con banda?

1. ¿Qué ventajas de almacenamiento y tiempo computacional pueden obtenerse utilizando algoritmos especializados para matrices bandeadas?

## Normas
1. ¿Qué es un espacio vectorial?

1. ¿Qué es una norma de un vector en un espacio vectorial?

1. Describa al menos cuatro normas para vectores en $\mathbb{R}^n$.¿Qué es una norma de Minkowski?

1. ¿Qué es una norma matricial inducida por una norma vectorial?

1. Interprete físicamente o geométricamente la expresión $\|\boldsymbol{A}\|=\max_{\hat{\boldsymbol{v}} \in \mathbb{R}^n}
\|\boldsymbol{A}\hat{\boldsymbol{v}}\|$. ¿Qué interpretación tiene esta desigualdad en términos del efecto de una matriz sobre la longitud de un vector?

1. Deduzca la desigualdad $\|\boldsymbol{Ax}\| \leq \|\boldsymbol{A}\| \|\boldsymbol{x}\|$ para una norma matricial inducida por una norma vectorial.

1. ¿Qué es la norma espectral de una matriz? ¿Cómo se calcula?

1. Describa al menos cuatro normas para matrices en $\mathbb{R}^{n \times n}$.

1. Defina la norma de Frobenius de una matriz. Explique por qué la norma de Frobenius puede interpretarse como una norma Euclidiana aplicada a todos los elementos de la matriz.

1. Para un vector o matriz dada calcule su norma $\|\boldsymbol{x}\|_1$, $\|\boldsymbol{x}\|_2$ y $\|\boldsymbol{x}\|_\infty$.


## Números de condición y sistemas mal condicionados

1. ¿Qué es el número de condición de una matriz y cómo se calcula? ¿Qué significa un número de condición grande o pequeño?

1. ¿Qué problemas pueden surgir al trabajar con sistemas lineales mal condicionados?

1. ¿Por qué el determinante no es una buena medida del mal condicionamiento de una matriz?

1. Deduzca e interprete la desigualdad $\frac{\|\delta \boldsymbol{x}\|}{\|\boldsymbol{x}\|} \leq \kappa(\boldsymbol{A}) \frac{\|\delta \boldsymbol{b}\|}{\|\boldsymbol{b}\|}$. ¿Qué representa cada término en la desigualdad y cómo se relaciona con el número de condición de una matriz.

1. ¿Cómo un pequeño cambio en el vector del lado derecho afecta la solución de un sistema lineal desde el punto de vista del número de condición de una matriz?

1. ¿Qué es una matriz de Hilbert y por qué es un ejemplo clásico de una matriz mal condicionada? 

1. ¿Qué significa que una matriz tenga un número de condición cercano a 1?

1. ¿Qué significa que una matriz tenga un número de condición muy grande?

1. Explique la diferencia entre una matriz bien condicionada y una matriz mal condicionada.

1. Si una matriz tiene $\kappa(\boldsymbol{A})=10^5$, ¿qué indica este resultado acerca de la sensibilidad de la solución de $\boldsymbol{Ax} = \boldsymbol{b}$ frente a perturbaciones en los datos?

1. Explique la relación entre el número de condición y los errores relativos de los datos y de la solución.


## Refinamiento iterativo de la solución

1. Al resolver numéricamente un sistema lineal de ecuaciones $\boldsymbol{Ax} = \boldsymbol{b}$, se obtiene una solución aproximada $\boldsymbol{x} + \delta\boldsymbol{x}$. Explique paso a paso cómo funciona el procedimiento de refinamiento iterativo: cómo se calcula el residuo, cómo se obtiene una aproximación del error y cómo se utiliza esta aproximación para mejorar la solución.


## Costo computacional

1. Qué es un FLOP?

1. Cuál es el costo computacional de:
    - Eliminación hacia adelante en la eliminación de Gauss con pivoteo parcial.
    - Eliminación hacia adelante en la eliminación de Gauss con pivoteo completo.
    - Gauss-Jordan con pivoteo parcial.
    - Gauss-Jordan con pivoteo completo.
    - Cálculo de la inversa de una matriz con Gauss-Jordan.
    - Sustitución hacia atrás.
    - Descomposición LU.
    - Descomposición de Cholesky.


## Matrices ralas o dispersas (sparse matrices)
1. ¿Qué es una matriz rala o dispersa? ¿Cuáles son las ventajas de su uso? ¿Qué tipo de técnicas existen para su solución?

1. ¿Por qué es ineficiente utilizar métodos generales de álgebra lineal para resolver sistemas con matrices dispersas?


1. Con respecto a los sistemas de ecuaciones $\boldsymbol{Ax}=\boldsymbol{b}$ con matrices $\boldsymbol{A}$ ralas:
    - ¿En qué consisten los métodos directos? ¿Cuándo se usan? ¿Cuáles son sus ventajas?
    - ¿En qué consisten los métodos iterativos? ¿Cuándo se usan? ¿Cuáles son sus ventajas?

1. ¿Por qué las matrices dispersas aparecen con frecuencia en el método de elementos finitos?


## Aplicación a la ingeniería civil - método de los elementos finitos
1. Explica el concepto de una matriz banda. Como se puede modificar la eliminación gausiana para que funcione eficientemente en este tipo de matrices.
   
1. ¿Qué es una matriz rala? 
    - ¿Cuáles son las ventajas de su uso?
    - ¿Qué tipo de técnicas existen para su solución?

1. Con respecto a los sistemas de ecuaciones Ax=b con matrices A ralas:
    - ¿En qué consisten los métodos directos? ¿Cuándo se usan? ¿Cuáles son sus ventajas?
    - ¿En qué consisten los métodos iterativos? ¿Cuándo se usan? ¿Cuáles son sus ventajas?

1. Con respecto a los solucionadores directos e iterativos del sistema lineal de ecuaciones Ax=b explique:
    - Principios
    - Ventajas
    - Desventajas
    - Factores clave para la selección del solucionador

1. Con respecto a los solucionadores directos explique los principios de los métodos
    - Skyline
    - Multifrontal
    - Pardiso
    - MUMPS
    
1. Con respecto a los solucionadores iterativos explique los principios de los métodos
    - Conjugated gradient
    - GMRES
    - Parámetros que se deben ajustar. Criterios para la selección de esos parámetros.

1. ¿En qué consiste el algoritmo reversed Cuthill-McKee?

1. ¿Qué son las matrices precondicionadoras?

1. Con respecto a los solucionadores directos e iterativos del sistema lineal de ecuaciones $\boldsymbol{Ax}=\boldsymbol{b}$ explique:
    - Principios
    - Ventajas
    - Desventajas
    - Factores clave para la selección del solucionador


## Python
1. Explique como funcionan las siguientes funciones:
    - `scipy.linalg.solve()`. ¿Para que sirve su parámetro `assume_a`?
    - `scipy.linalg.inv()`.
    - `scipy.linalg.det()`.
    - `scipy.linalg.lu_factor()`.
    - `scipy.linalg.lu_solve()`.
    - `scipy.linalg.cho_factor()`.
    - `scipy.linalg.cho_solve()`.
    - `scipy.linalg.norm()`. ¿Qué significa el parámetro `ord`?
    - `scipy.linalg.cond()`. ¿Qué significa el parámetro `p`?

1. Haga un ejemplo de cómo usar `scipy.linalg.solve()` para resolver un sistema de ecuaciones lineales. Incluya la definición de la matriz $\boldsymbol{A}$ y el vector $\boldsymbol{b}$, y muestre cómo se obtiene la solución $\boldsymbol{x}$.

1. Haga un ejemplo de cómo usar `scipy.linalg.inv()` para calcular la inversa de una matriz. Incluya la definición de la matriz $\boldsymbol{A}$ y muestre cómo se obtiene la inversa $\boldsymbol{A}^{-1}$.

1. Haga un ejemplo de cómo usar `scipy.linalg.det()` para calcular el determinante de una matriz. Incluya la definición de la matriz $\boldsymbol{A}$ y muestre cómo se obtiene el determinante $\det(\boldsymbol{A})$.

1. Haga un ejemplo de cómo usar `scipy.linalg.lu_factor()` y `scipy.linalg.lu_solve()` para resolver un sistema de ecuaciones lineales. Incluya la definición de la matriz $\boldsymbol{A}$ y el vector $\boldsymbol{b}$, y muestre cómo se obtiene la solución $\boldsymbol{x}$.

1. Haga un ejemplo de cómo usar `scipy.linalg.cho_factor()` y `scipy.linalg.cho_solve()` para resolver un sistema de ecuaciones lineales. Incluya la definición de la matriz $\boldsymbol{A}$ y el vector $\boldsymbol{b}$, y muestre cómo se obtiene la solución $\boldsymbol{x}$.

1. Haga un ejemplo de cómo usar `scipy.linalg.norm()` para calcular la norma de un vector y de una matriz. Incluya la definición del vector $\boldsymbol{x}$ y la matriz $\boldsymbol{A}$, y muestre cómo se obtiene la norma $\|\boldsymbol{x}\|$ y $\|\boldsymbol{A}\|$.

1. Haga un ejemplo de cómo usar `scipy.linalg.cond()` para calcular el número de condición de una matriz. Incluya la definición de la matriz $\boldsymbol{A}$, y muestre cómo se obtiene el número de condición $\kappa(\boldsymbol{A})$.

1. Como se implementa el refinamiento iterativo de la solución de un sistema lineal en Python. Incluya un ejemplo con una matriz $\boldsymbol{A}$ y un vector $\boldsymbol{b}$, y muestre cómo se mejora la solución aproximada $\boldsymbol{x}$ mediante el refinamiento iterativo.
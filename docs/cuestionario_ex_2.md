# Cuestionario para el examen 2 de métodos numéricos aplicados a la ingeniería civil

NOTA: Este cuestionario es un resumen de los temas que se abordarán en el examen 1. Algunas de las preguntas formuladas en este cuestionario no se estudiaron en clase, por lo que se recomienda investigar y estudiar por cuenta propia dichos temas.

## Sistemas Lineales y su Estructura

1. ¿Qué es un sistema de ecuaciones algebraicas lineales y cómo puede representarse mediante una matriz? ¿Qué tipos de matrix $\boldsymbol{A$ se pueden tener en el sistema de ecuaciones $\boldsymbol{Ax}=\boldsymbol{b}$?

1. ¿Qué consideraciones deben tenerse en cuenta al resolver un sistema de ecuaciones lineales sobre determinado, sub determinado?

1. ¿Qué significa que un sistema de ecuaciones lineales tenga una solución única?

1. ¿Qué significa que un sistema de ecuaciones lineales tenga infinitas soluciones?

1. ¿Qué significa que un sistema de ecuaciones lineales sea inconsistente?

1. ¿Cómo se relaciona el determinante de una matriz con la existencia de una solución única?

1. ¿Qué significa que una matriz sea singular?

1. ¿Cómo puede determinarse si una matriz cuadrada es invertible?

1. ¿Cuál es la relación entre la matriz inversa y la solución de un sistema lineal?

1. ¿Por qué resolver un sistema lineal mediante la matriz inversa puede ser computacionalmente costoso?

1. ¿Qué características de una matriz pueden facilitar la solución de un sistema lineal?

1. ¿Qué problemas pueden surgir al trabajar con sistemas lineales mal condicionados?


## Regla de Cramer y Sistemas Singulares

1. ¿En qué consiste la regla de Cramer para resolver sistemas de ecuaciones lineales?

1. ¿Qué condiciones deben cumplirse para poder utilizar la regla de Cramer?

1. ¿Por qué la regla de Cramer no suele ser el método preferido para sistemas grandes?

1. ¿Cuál es la diferencia entre una matriz singular y una matriz no singular?

1. ¿Qué problemas numéricos pueden aparecer al calcular determinantes de matrices grandes?


## Eliminación de Gauss

1. ¿En qué consiste el método de eliminación de Gauss?

1. ¿Cuál es el objetivo principal de la eliminación de Gauss al resolver un sistema lineal?

1. ¿Qué es una matriz aumentada y cómo se utiliza en la eliminación de Gauss?

1. ¿Cuáles son las operaciones elementales que pueden realizarse sobre las filas de una matriz?

1. ¿Por qué las operaciones elementales de fila no cambian el conjunto de soluciones de un sistema?

1. ¿Qué significa transformar una matriz a una forma triangular superior?

1. ¿Qué papel desempeñan los pivotes durante la eliminación de Gauss?

1. ¿Cómo se utiliza la sustitución hacia atrás después de la eliminación de Gauss?

1. ¿Qué ocurre si aparece un pivote igual a cero durante la eliminación?

1. ¿Cómo puede resolverse el problema de un pivote igual a cero?

1. ¿Qué es la sustitución hacia atrás y cómo se aplica?

1. ¿Cuáles son las principales etapas del método de eliminación de Gauss?

1. ¿Cuál es el costo computacional aproximado de la eliminación de Gauss para un sistema de $n$ ecuaciones?

1. ¿Por qué es importante elegir cuidadosamente los pivotes durante la eliminación?

1. ¿Qué es el pivoteo parcial y por qué se utiliza durante la eliminación de Gauss?

1. ¿Cómo se selecciona el pivote en el pivoteo parcial?

1. ¿Qué ventajas ofrece el pivoteo parcial respecto a no utilizar pivoteo?

1. ¿Cómo ayuda el pivoteo parcial a reducir los errores numéricos?

1. ¿Qué es el pivoteo completo?

1. ¿Cuál es la diferencia entre el pivoteo parcial y el pivoteo completo?

1. ¿Qué operaciones adicionales son necesarias cuando se utiliza pivoteo completo?


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

## Descomposición LU

1. ¿Qué es la descomposición LU de una matriz? ¿Como son las matrices $\boldsymbol{L}$ y $\boldsymbol{U}$?

1. Describe la descomposición de Doolittle.

1. Describe la descomposición de Crout.

1. ¿Cómo puede utilizarse la descomposición LU para resolver un sistema $\boldsymbol{Ax}=\boldsymbol{b}$?

1. ¿Por qué la descomposición LU puede ser más eficiente cuando se necesita resolver varios sistemas con la misma matriz $\boldsymbol{A}$?

1. ¿Cómo se relaciona la descomposición LU con la eliminación de Gauss?

1. ¿Cómo se resuelve el sistema $\boldsymbol{Ly}=\boldsymbol{b}$ después de obtener una descomposición LU?

1. ¿Cómo se resuelve el sistema $\boldsymbol{Ux}=\boldsymbol{y}$?

1. ¿Qué significa que una matriz tenga una descomposición $\boldsymbol{A}=\boldsymbol{LU}$?

1. ¿Qué problemas pueden surgir al intentar calcular una descomposición LU sin pivoteo?

1. ¿Cómo puede incorporarse el pivoteo en una descomposición LU?

1. ¿Qué significa una descomposición de la forma $\boldsymbol{A}=\boldsymbol{PLU}$?

1. ¿Cuál es el papel de la matriz de permutación $\boldsymbol{P}$ en una descomposición LU con pivoteo?

1. ¿Qué ventajas computacionales ofrece LU cuando se tienen múltiples vectores $\boldsymbol{b}$ para la misma matriz $\boldsymbol{A}$?

1. ¿Cómo se compara el costo de factorizar una matriz con el costo de resolver sistemas triangulares?

1. ¿En qué tipos de problemas puede ser especialmente útil la descomposición LU?


## Descomposición de Cholesky

1. ¿Qué es la descomposición de Cholesky?

1. ¿Cuándo es especialmente útil la descomposición de Cholesky?

1. ¿Qué pasos implica resolver un sistema de ecuaciones usando la descomposición de Cholesky?
    
1. ¿Qué caracteriza a una matriz definida positiva (son tres condiciones equivalentes)?

1. ¿Cómo puede utilizarse la descomposición de Cholesky para resolver un sistema $\boldsymbol{Ax}=\boldsymbol{b}$?

1. ¿Cómo se calcula el determinante de A usando la descomposición de Cholesky? 

1. ¿Para qué tipo de matrices puede utilizarse la descomposición de Cholesky?

1. ¿Qué ventajas tiene Cholesky frente a una descomposición LU general?

1. ¿Por qué Cholesky puede ser computacionalmente más eficiente que LU para matrices que cumplen sus condiciones?

1. ¿Por qué falla la descomposicion de Cholesky cuando se le intenta aplicar Cholesky a una matriz que no es definida positiva?


## H. Gauss-Seidel y Métodos Iterativos

1. ¿En qué consiste el método iterativo de Gauss-Seidel?

1. ¿Cuál es la diferencia entre un método directo y un método iterativo para resolver sistemas lineales?

1. ¿Cómo se actualizan las variables durante una iteración del método de Gauss-Seidel?

1. ¿Qué diferencia existe entre el método de Gauss-Seidel y el método de Jacobi?

1. ¿Qué condiciones pueden favorecer la convergencia del método de Gauss-Seidel?

1. ¿Cuáles son las ventajas y desventajas de utilizar métodos iterativos como Gauss-Seidel para resolver sistemas grandes y dispersos?

## Otras preguntas

* Preguntas varias de programación de computadores (de python, de numpy y de scipy). Estudiar los códigos con juicio.

* Describa qué es un sistema lineal de ecuaciones bien condicionado, mal condicionado y uno singular. En qué se diferencian?
   
* Explique la regla de Cramer. ¿Qué condición debe cumplirse para que un sistema tenga una solución única según la regla de Cramer? ¿Por qué la regla de Cramer se vuelve computacionalmente ineficiente a medida que aumenta el número de ecuaciones?
   
* Describa el proceso de eliminación hacia adelante en la eliminación gaussiana. 
    - ¿Qué tipo de operaciones de fila están permitidas en la eliminación gaussiana?
    - ¿Cómo se calcula el determinante de A usando la eliminación gausiana?
    - ¿Qué es el pivote en la eliminación gaussiana?
    - ¿Cómo se selecciona el pivote en el pivoteo parcial? 
    - ¿Por qué la división por un número muy pequeño puede aumentar el error?
    - ¿Qué sucede si el elemento pivote en la eliminación hacia adelante se vuelve cero? Justifique su respuesta matemáticamente.
    - ESTA NO >>> ¿Qué sucede si el elemento pivote en la eliminación hacia adelante se vuelve cero?
    - ESTA NO >>> ¿Por qué el pivoteo completo no se emplea en la práctica?
    
* ¿Qué tan grandes pueden ser los errores de solución para sistemas mal condicionados?    

* Describa el proceso de la sustitución hacia atrás.

* Describa el proceso de la sustitución hacia adelante.

* ¿Qué es un vector? ¿Qué es un espacio vectorial? ¿Qué es una norma? ¿Qué es una norma matricial? Describa al menos cuatro normas matriciales.

* ¿Por qué el determinante no es una buena medida del mal condicionamiento de una matriz?

* Explique qué es el número de condición de una matriz
    - Definición
    - ¿Qué mide el número de condición de una matriz?
    - ¿Cómo un pequeño cambio en el vector del lado derecho afecta la solución de un sistema lineal desde el punto de vista del número de condición de una matriz?
    - Explique la desigualdad $\frac{\|\delta \boldsymbol{x}\|}{\|\boldsymbol{x}\|} \leq \kappa(\boldsymbol{A}) \frac{\|\delta \boldsymbol{b}\|}{\|\boldsymbol{b}\|}$.
   
* Explique qué es la eliminación de Gauss-Jordan
    - ¿En qué se diferencia la eliminación de Gauss-Jordan de la eliminación gaussiana?
    - ¿Es necesaria la sustitución hacia atrás en la eliminación de Gauss-Jordan?
    - ¿Cuáles son las operaciones de fila permitidas en la eliminación de Gauss-Jordan?
    
* Explica el concepto de una matriz banda. Como se puede modificar la eliminación gausiana para que funcione eficientemente en este tipo de matrices.
   
* ¿Qué es una matriz rala? 
    - ¿Cuáles son las ventajas de su uso?
    - ¿Qué tipo de técnicas existen para su solución?

* Con respecto a los sistemas de ecuaciones Ax=b con matrices A ralas:
    - ¿En qué consisten los métodos directos? ¿Cuándo se usan? ¿Cuáles son sus ventajas?
    - ¿En qué consisten los métodos iterativos? ¿Cuándo se usan? ¿Cuáles son sus ventajas?

* Con respecto a los solucionadores directos e iterativos del sistema lineal de ecuaciones Ax=b explique:
    - Principios
    - Ventajas
    - Desventajas
    - Factores clave para la selección del solucionador

* Con respecto a los solucionadores directos explique los principios de los métodos
    - Skyline
    - Multifrontal
    - Pardiso
    - MUMPS
    
* Con respecto a los solucionadores iterativos explique los principios de los métodos
    - Conjugated gradient
    - GMRES
    - Parámetros que se deben ajustar. Criterios para la selección de esos parámetros.

* ¿En qué consiste el algoritmo reversed Cuthill-McKee?

* ¿Qué son las matrices precondicionadoras?

* Describa las propiedades de la matriz de rigidez K para un sistema estructural. ¿Cuáles son las propiedades de la matriz Kdd?
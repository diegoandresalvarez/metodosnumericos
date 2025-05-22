# Cuestionario para el examen 2 de métodos numéricos aplicados a la ingeniería civil

* Se le dará un sistema linear de 4 ecuaciones con 4 incógnitas y se solicitará resolverlo usando uno de los siguientes métodos:
  - Eliminación gaussiana (resolver el sistema de ecuaciones)
  - Gauss-Jordan (para encontrar la inversa de la matriz A).

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
    
* Describa la descomposición LU
    - ¿Qué tipos de matrices son  $L$  y  $U$  en la descomposición LU?
    - Describe la descomposición de Doolittle.
    - Describe la descomposición de Crout.
    - ¿Cuándo es especialmente útil la descomposición LU?
    - ¿Qué pasos implica resolver un sistema de ecuaciones usando la descomposición LU?
    
* Describa la descomposición de Cholesky
    - ¿Cuándo es especialmente útil la descomposición de Cholesky?
    - ¿Qué pasos implica resolver un sistema de ecuaciones usando la descomposición de Cholesky?
    - ¿Qué caracteriza a una matriz definida positiva?
    - Describe los pasos para resolver  $Ax = b$  usando la descomposición de Cholesky.
    - ¿Cómo se calcula el determinante de A usando la descomposición de Cholesky? 

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
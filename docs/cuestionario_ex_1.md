# Cuestionario para el examen 1 de métodos numéricos aplicados a la ingeniería civil

NOTA: Este cuestionario es un resumen de los temas que se abordarán en el examen 1. Algunas de las preguntas formuladas en este cuestionario no se estudiaron en clase, por lo que se recomienda investigar y estudiar por cuenta propia dichos temas.

## Métodos de Solución y Clasificación de Errores en Ingeniería

1. Compare entre sí los métodos analíticos, gráficos y numéricos para la solución de problemas en ingeniería. ¿Cuáles son las ventajas y desventajas de cada uno?

1. Clasifique y compare entre sí los tipos de errores en ingeniería: computacionales (representación, redondeo y truncamiento) frente a errores humanos y del sistema (error de modelo, blunders/equivocaciones e incertidumbre de datos). ¿Cómo afectan estos errores a los cálculos numéricos en ingeniería?

## Cifras Significativas

3. Explique qué son las cifras significativas y cómo se relacionan con la precisión de los cálculos numéricos. ¿Cómo se determina el número de cifras significativas en un resultado?

1. ¿Cuál es la relación entre las cifras significativas y el error de redondeo?

## Cuantificación del Error

5. Explique la diferencia entre error absoluto y error relativo en cálculos numéricos. ¿Cuándo es más apropiado utilizar cada uno?

1. Explique que es el "error aproximado relativo $\epsilon_a$"; relacione este error con el criterio de tolerancia $\epsilon_{tol} = 0.5 \times 10^{2-n}$% para garantizar $n$ cifras significativas exactas.

## Representación de los Números Enteros

7. Explique qué es un número entero y cómo se representa en la memoria de una computadora. 

1. [NO ENTRA EN EL EXAMEN] ¿Qué es el complemento a dos y cómo se utiliza para representar números enteros negativos?

1. Explique la diferencia entre los tipos de datos enteros: `int8`, `int16`, `int32`, `int64` y `uint8`, `uint16`, `uint32`, `uint64`. ¿Cómo afecta el tamaño del tipo de dato al rango de los números representables?

1. Explique los criterios de selección para el uso de `int8`, `int16`, `int32` y `int64` en computación científica. ¿Cuándo es apropiado utilizar cada uno de estos tipos de datos y cuáles son sus limitaciones?

1. Explique qué información proporciona `sys.int_info` o `numpy.iinfo` en Python, especialmente los valores de `bits`, `min` y `max`.

1. ¿Qué es el "overflow" y "underflow" en números enteros? ¿Cómo puede detectar estas situaciones en un algoritmo numérico? 

1. Explique qué es, en lenguaje C, un `char`, `int`, `float`, `double` con sus modificaciones `signed`, `unsigned`, `short`, `long`, `long long`. Averigüe cuáles son sus equivalentes en NumPy.

1. ¿Cuáles son los límites superior e inferior para un `signed int` y un `unsigned int` de 16 y 32 bits? Deduzca dichos valores.

## Representación y Precisión de Números Flotantes

15. Explique qué es un número de punto flotante y cómo se representa en la memoria de una computadora. ¿Qué es el estándar IEEE 754 y cómo define la representación de números flotantes?

1. ¿Qué es el `Inf` y el `NaN` en la representación de números flotantes? ¿Para que sirven y cuáles son sus propiedades?

1. ¿Qué pasa si divido un número entre 0 en Python y en MATLAB?

1. ¿En qué casos al asignar un número flotante a una variable, el número se convierte en un 0, en un infinito o menos infinito?

1. Explique la diferencia entre los tipos de datos de punto flotante: `float16`, `float32`, `float64` y `longdouble`. ¿Cómo afecta el tamaño del tipo de dato a la precisión y al rango de los números representables?

1. Explique los criterios de selección para el uso de `float16`, `float32` y `float64` en computación científica. ¿Cuándo es apropiado utilizar cada uno de estos tipos de datos y cuáles son sus limitaciones?

1. Explique qué información proporciona `sys.float_info` o `numpy.finfo` en Python.

1. ¿Qué son las cifras significativas y cómo se relacionan con la precisión de los cálculos numéricos? ¿Cómo se determina el número de cifras significativas en un resultado? Explíquelo en el contexto de los tipos de datos de punto flotante: `float16`, `float32`, `float64`, `longdouble`.

1. ¿Qué es el "épsilon de la máquina" (`sys.float_info.epsilon`, `np.finfo().eps`, `FLT_EPSILON` o `DBL_EPSILON` en un sistema estándar IEEE 754) y cómo se relaciona con la precisión numérica? ¿Qué valor tiene? ¿Cuál es la implicación de este valor para los cálculos numéricos?

1. Explique el concepto de "overflow" y "underflow" en números de punto flotante. ¿Cómo puede detectar estas situaciones en un algoritmo numérico?

1. Explique porqué se dice que los números flotantes hacen una cuantización del espacio de los números reales y cómo esto afecta a los cálculos numéricos. Como varía dicho espaciado con la magnitud del número número ($\Delta x \le \epsilon_{machine} |x|$). 

1. Explique la naturaleza y para qué sirven las funciones de Python `np.nextafter(x1, x2)` y `np.spacing(x)`.

1. Explique como aparece el error de redondeo en las sumas de números flotantes y cómo se puede minimizar dicho error. 

1. Explique cómo aparece el error de redondeo en la resta de números flotantes y cómo se puede minimizar dicho error.

1. Explique cómo aparece el error de redondeo en la multiplicación de números flotantes y cómo se puede minimizar dicho error.

1. Explique cómo aparece el error de redondeo en la división de números flotantes y cómo se puede minimizar dicho error.

1. ¿Cómo se debe verificar la igualdad de dos números flotantes y por qué?

1. Explique por qué la expresión `(1.0/3.0)*3.0 == 1.0` puede evaluar a falso en un programa de computadora y cómo afecta esto a los algoritmos numéricos.

1. ¿Por qué la expresión `0.2 == 0.3 - 0.1` evalúa a `False` en Python o en cualquier otro lenguaje de programación como C o MATLAB? Explique la razón subyacente.

1. ¿Por qué no es recomendable comparar números flotantes utilizando el operador `==`? Proponga una alternativa más adecuada.

1. Explique todo lo que sabe sobre las funciones `math.isclose()` y `np.isclose()` de Python. Como varía dicho comportamiento con los parámetros `rel_tol` y `abs_tol`.

## Alternativas a los Números Flotantes

36. Diga todo lo que sabe sobre el módulo `decimal` de Python. ¿Qué ventajas ofrece el módulo `decimal` sobre los números flotantes estándar para cálculos financieros?

1. Diga cómo puedo hacer cálculos con números fraccionarios en Python. ¿Por qué los objetos `Fraction` son más lentos que los flotantes? ¿En qué situaciones es preferible utilizarlos a pesar de esta desventaja?

## Estabilidad Numérica y Estrategias de Cálculo

38. Si realiza una suma de 1000 números pequeños flotantes, ¿qué estrategia recomendaría para minimizar los errores de redondeo acumulados?

1. Estudie el problema del odómetro de [https://jvns.ca/blog/2023/01/13/examples-of-floating-point-problems/](https://jvns.ca/blog/2023/01/13/examples-of-floating-point-problems/) y explique por qué ocurre el error de redondeo en este caso. ¿Cómo se puede evitar este error?

1. Estudie el ejemplo del cálculo "malo" de varianza (Var(X) = E[X²] − E[X]²) de [https://jvns.ca/blog/2023/01/13/examples-of-floating-point-problems/](https://jvns.ca/blog/2023/01/13/examples-of-floating-point-problems/) como caso de cancelación catastrófica en la resta.

1. ¿Por qué sumar los términos de una serie infinita en orden ascendente (del término más pequeño al más grande) puede reducir el error de redondeo acumulado, comparado con sumarlos en el orden natural (descendente)?

1. ¿Cómo puedo evitar la pérdida de precisión al sumar dos números flotantes?

1. ¿Por qué es importante utilizar funciones como `math.hypot()` en vez de implementar directamente la fórmula de la distancia euclidiana? Explique desde la perspectiva de la estabilidad numérica.

1. ¿Cómo podría determinar si un algoritmo iterativo ha convergido cuando trabaja con números flotantes?

1. ¿Cómo implementaría una solución numéricamente estable para problemas que involucran diferencias entre números grandes de magnitud similar?

1. Si está implementando un algoritmo de integración numérica que requiere sumar una gran cantidad de términos pequeños, ¿qué precauciones debe tomar para minimizar errores de redondeo?

## Técnicas de Redondeo y Aproximación

47. ¿Cuál es la diferencia entre los estándares de redondeo "round half to even" y "round half away from zero"? ¿Cuál utiliza Python por defecto y por qué? ¿Cuál es la ventaja del uno sobre el otro?

1. Explique el funcionamiento de las diferentes funciones de redondeo en Python: `floor()`, `ceil()`, `trunc()`, `int()`, `round()`.

1. Explique el comportamiento del comando `round()` en Python y en MATLAB.

## Aspectos Prácticos y Experimentación

50. ¿Cómo puedo medir el tiempo de ejecución de un pedazo de código en Python?

1. ¿Qué es el "epoch"?

## Series de Taylor y Error de Truncamiento

52. Explique el concepto de residuo de Lagrange $R_n(h)$ y la notación $O(h^{n+1})$.

1. Explica cómo se aplica el Primer y Segundo Teorema del Valor Medio para Integrales en la deducción del residuo.

1. Explique la deducción formal del error de truncamiento $O(h)$ en la diferencia finita hacia adelante para la primera derivada.
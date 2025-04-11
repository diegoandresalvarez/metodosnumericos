# Cuestionario para el examen 1 de métodos numéricos aplicados a la ingeniería civil

## Representación y Precisión de Números Flotantes

1. ¿Por qué la expresión `0.2 == 0.3 - 0.1` evalúa a `False` en Python o en cualquier otro lenguaje de programación como C o MATLAB? Explique la razón subyacente.

2. Explique el concepto de "error de redondeo o error de representación" y cómo afecta a los cálculos numéricos en computación científica.

3. ¿Por qué no es recomendable comparar números flotantes utilizando el operador `==`? Proponga una alternativa más adecuada.

4. ¿Qué es el "épsilon de la máquina" (`sys.float_info.epsilon` o DBL_EPSILON en un sistema estándar IEEE 754) y cómo se relaciona con la precisión numérica? ¿Qué valor tiene? ¿Cuál es la implicación de este valor para los cálculos numéricos?

5. Explique qué información proporciona `sys.float_info` en Python, especialmente los valores de `epsilon`, `dig`, `max` y `min`.

6. ¿Cómo se debe verificar la igualdad de dos números flotantes y por qué?

7. Explique todo lo que sabe sobre un número flotante y su representación. ¿Cómo se representa en la memoria un número flotante de 32 bits? (tarea)

8. Explique todo lo que sabe sobre un número flotante y su representación. ¿Cómo se representa en la memoria un número flotante de 64 bits?

9. Explique por qué la expresión `(1.0/3.0)*3.0 == 1.0` puede evaluar a falso en un programa de computadora y cómo afecta esto a los algoritmos numéricos.

10. ¿En qué casos al asignar un número flotante a una variable, el número se convierte en un 0, en un infinito o menos infinito?

11. Explique todo lo que sabe sobre la función `math.isclose()` de Python.

## Errores en Cálculos Numéricos

1. ¿Qué es el "error de truncamiento" en métodos numéricos y cómo difiere del "error de redondeo/representación"? ¿Cómo afectan estos a los cálculos numéricos en computación científica?

2. Explique la diferencia entre error absoluto y error relativo en cálculos numéricos. ¿Cuándo es más apropiado utilizar cada uno?

3. Explique el concepto de "overflow" y "underflow" en números de punto flotante. ¿Cómo puede detectar estas situaciones en un algoritmo numérico?

4. ¿Qué estrategias conoce para prevenir el desbordamiento (overflow) o subdesbordamiento (underflow) al evaluar expresiones numéricas enteras?

5. ¿Qué es el NaN (not-a-number) y qué propiedades tiene?

6. ¿Qué pasa si divido un número entre 0 en Python y en MATLAB?

## Técnicas de Redondeo y Aproximación

1. ¿Cuál es la diferencia entre los estándares de redondeo "round half to even" y "round half away from zero"? ¿Cuál utiliza Python por defecto y por qué? ¿Cuál es la ventaja del uno sobre el otro?

2. Explique el funcionamiento de las diferentes funciones de redondeo en Python: `floor()`, `ceil()`, `trunc()`, `int()`, `round()`.

3. Explique el comportamiento del comando `round()` en Python y en MATLAB.

## Estabilidad Numérica y Estrategias de Cálculo

1. Si realiza una suma de 1000 números pequeños flotantes, ¿qué estrategia recomendaría para minimizar los errores de redondeo acumulados?

2. ¿Cómo puedo evitar la pérdida de precisión al sumar dos números flotantes?

3. ¿Por qué es importante utilizar funciones como `math.hypot()` en vez de implementar directamente la fórmula de la distancia euclidiana? Explique desde la perspectiva de la estabilidad numérica.

4. ¿Cómo podría determinar si un algoritmo iterativo ha convergido cuando trabaja con números flotantes?

5. ¿Cómo implementaría una solución numéricamente estable para problemas que involucran diferencias entre números grandes de magnitud similar?

6. Si está implementando un algoritmo de integración numérica que requiere sumar una gran cantidad de términos pequeños, ¿qué precauciones debe tomar para minimizar errores de redondeo?

## Alternativas a los Números Flotantes

1. Diga todo lo que sabe sobre el módulo `decimal` de Python. ¿Qué ventajas ofrece el módulo `decimal` sobre los números flotantes estándar para cálculos financieros?

2. Diga cómo puedo hacer cálculos con números fraccionarios en Python. ¿Por qué los objetos `Fraction` son más lentos que los flotantes? ¿En qué situaciones es preferible utilizarlos a pesar de esta desventaja?

## Números Enteros y Representación

1. Explique todo lo que sabe sobre un número entero y su representación.

2. Explique todo lo que sabe sobre un número flotante y su representación.

3. Explique qué es, en lenguaje C, un `char`, `int`, `float`, `double` con sus modificaciones `signed`, `unsigned`, `short`, `long`, `long long`. Averigüe cuáles son sus equivalentes en NumPy.

4. ¿Cuáles son los límites superior e inferior para un `signed int` y un `unsigned int` de 16 y 32 bits? Deduzca dichos valores.

## Aspectos Prácticos y Experimentación

1. ¿Cómo afecta la arquitectura de su computadora (32 vs 64 bits) a la precisión y el rango de los cálculos numéricos?

2. ¿Cómo puedo medir el tiempo de ejecución de un pedazo de código en Python?

3. ¿Qué es el "epoch"?

# Aproximación y errores de redondeo

## Representación de punto flotante

* [01_floats.py](01_floats.py) muestra las propiedades (bits, precisión, rango) de float16, float32 y float64.
* [01_odometer.c](01_odometer.c) en C, muestra cómo se acumula el error al sumar repetidamente 0.01 en un `float`.
* [01_large_sum.py](01_large_sum.py) compara el error al sumar un millón de números en float32 y float64.

## Cálculo de la exponencial con series de Taylor

* [01_calc_exp.py](01_calc_exp.py) calcula exp(x) con la serie de Taylor, con opción de sumar en orden inverso.
* [01_calc_exp_ver2.py](01_calc_exp_ver2.py) variante de la anterior con un máximo de iteraciones.
* [01_calc_exp_m10.py](01_calc_exp_m10.py) calcula exp(-x) con máxima precisión usando el recíproco de exp(x).
* [01_error_iterative.py](01_error_iterative.py) evalúa la serie de Taylor de exp(x) con n términos para estudiar el error.

## Cancelación numérica

* [01_calc_variance.py](01_calc_variance.py) compara la fórmula inestable Var(X) = E[X²] − E[X]² con un cálculo estable de la varianza.

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

1. ¿En qué consiste el método de Horner para evaluar polinomios? ¿Por qué es eficiente?



## Polinomios con Python

Estudie cuidadosamente los siguientes códigos de Python:

1. [Poly1D_numpy](../codigo/03_interpolacion/Poly1D_numpy.ipynb) (vale por 10 preguntas del examen)



## Interpolación

1. Como se define matemáticamente la interpolación?
1. ¿Cuáles son las propiedades deseables de un método de interpolación?
1. ¿Cuáles son los criterios principales para elegir un método de interpolación sobre otro?



## Interpolación univariada

1. ¿Cuáles son las ventajas y desventajas de la interpolación univariada?
1. ¿Cuáles son los criterios principales para elegir un método de interpolación univariada sobre otro?



## Métodos de interpolación univariada

Con respecto a los siguientes métodos de interpolación univariada, explique: (a) ventajas, (b) desventajas, (c) criterios de selección, (d) clase de continuidad, (e) implementación en Python (API o uso), y (f) derivación matemática (si se abordó en clase):

1. Interpolación de vecinos más cercanos
1. Interpolación lineal
1. Interpolación polinomial
1. Interpolación con splines cúbicos
1. Interpolación con splines cúbicos de Hermite 
1. Interpolación con PCHIP
1. Interpolación de Akima
1. Interpolación de Makima



## Interpolación polinomial

1. ¿En qué casos se justifica calcular los coeficientes de un polinomio interpolante de grado $n$?
1. ¿Qué es el fenómeno de Runge? ¿Por qué es importante en la interpolación polinomial?
1. ¿Qué son los nodos de Chebyshev? ¿Por qué son importantes en la interpolación polinomial?
1. ¿Qué es la interpolación de Lagrange? ¿Cómo se implementa en Python?
1. ¿Qué es la interpolación de Hermite? ¿Cómo se implementa en Python?



## Interpolación polinomial con Python

Estudie cuidadosamente los siguientes códigos de Python:
1. [1D_polynomial_interpolation.ipynb](../codigo/03_interpolacion/1D_polynomial_interpolation.ipynb) (vale por 10 preguntas del examen)



## Interpolación con splines cúbicos

1. Deduzca rigurosamente su formulación matemática. 
1. Describa y explique matemáticamente las condiciones de frontera: natural (`natural`), empotrada (`clamped`), sin nudo (`not-a-knot`) y periodica (`periodic`). (vale por 10 preguntas del examen)
1. Como se emplean los splines cúbicos para interpolar curvas cerradas? (vale por 3 preguntas del examen)


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

### 7. Runge's phenomenon

* Describe Runge’s phenomenon and its implications for polynomial interpolation.
* Homework: Compare the use of equally spaced nodes vs Chebyshev nodes.
* Homework: Why are Chebyshev nodes preferred in high-degree polynomial interpolation?

---

### 9. Additional concepts
* What is Occam's razor about? How do you apply it in the context of optimization?
* Homework: Describe the properties of Vandermonde matrices.
* Explain Voronoi tessellations. What are their main properties?
* Explain Delaunay's triangulations. What are their main properties?
* Explain Occam's razor. How is it used for selecting an interpolation algorithm?
* Explain feature scaling. Motivation, methods, advantages, etc.

--->
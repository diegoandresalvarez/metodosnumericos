# Cuestionario para el examen 4 de métodos numéricos aplicados a la ingeniería civil

NOTA: Este cuestionario es un resumen de los temas que se abordarán en el examen 4. Algunas de las preguntas formuladas en este cuestionario no se estudiaron en clase, por lo que se recomienda investigar y estudiar por cuenta propia dichos temas.

Libros recomendados:
* Chapra, S. C. & Canale, R. P. (2021). Numerical Methods for Engineers (8th ed.). McGraw-Hill.
* Burden, R. L., Faires, J. D., & Burden, A. M. (2011). *[Numerical analysis](https://faculty.ksu.edu.sa/sites/default/files/numerical_analysis_9th.pdf)* (9th ed.). Cengage Learning.
* Burden, R. L., Faires, J. D., & Burden, A. M. (2016). *[Numerical analysis](http://ir.harambeeuniversity.edu.et/handle/123456789/1576)* (10th ed.). Cengage Learning.


## Integración con Gauss-Legendre
1. Explique la idea de la cuadratura gaussiana: ¿qué se elige de forma óptima (nodos y pesos) y qué ventaja ofrece frente a Newton-Cotes con puntos equiespaciados? ¿Para qué tipo de integrandos es adecuada?
1. ¿Por qué una cuadratura de $n$ puntos puede integrar exactamente polinomios hasta grado $2n-1$ ($n$ nodos + $n$ pesos = $2n$ parámetros, frente a los $2n$ coeficientes de un polinomio de grado $2n-1$)?
1. Para $n=2$ en $[-1,1]$, plantee el sistema $c_1+c_2=2$, $c_1x_1+c_2x_2=0$, $c_1x_1^2+c_2x_2^2=2/3$, $c_1x_1^3+c_2x_2^3=0$ y demuestre que la solución única (salvo permutación) es $c_1=c_2=1$, $x_1=-\sqrt3/3$, $x_2=\sqrt3/3$.
1. Use la recursión de Bonnet, $P_0=1$, $P_1=\xi$, $P_n=\frac{(2n-1)\xi P_{n-1}-(n-1)P_{n-2}}{n}$, para obtener $P_2$ y $P_3$. Calcule sus raíces y compruebe que coinciden con los nodos de $n=2$ y $n=3$.
1. Con la fórmula de los pesos $w_i=\frac{2}{(1-\xi_i^2)\,[P_n'(\xi_i)]^2}$, verifique que para $n=2$ se obtiene $w_1=w_2=1$.
1. Deduzca el cambio de variable $x=\frac{(b-a)\xi+(a+b)}{2}$ y demuestre que $\int_a^b f(x)\,dx=\frac{b-a}{2}\int_{-1}^{1}f\!\left(\frac{(b-a)\xi+a+b}{2}\right)d\xi\approx\frac{b-a}{2}\sum w_if\!\left(\frac{(b-a)\xi_i+a+b}{2}\right)$.
1. Aplique la cuadratura de Gauss-Legendre con $n=3$ a $\int_0^\pi\sin x\,dx$. Calcule el error relativo.
1. Compare las formas en Python para obtener nodos y pesos: `sympy.integrals.quadrature.gauss_legendre`, `numpy.polynomial.legendre.leggauss` y `scipy.special.roots_legendre`.
1. Explique el uso de la función de Python `scipy.integrate.fixed_quad`.


## Integrales impropias
1. Para integrar numéricamente integrales impropias se deben realizar cambios de variables para transformar la integral a una propia. Explique al menos tres cambios de variable que permitan hacer esta conversión. Indique las condiciones para los cuales dichos cambios de variables son válidos.

## Quadpack
Indique como se usan las siguientes funciones de Python. Ilustre su uso con ejemplos pequeños:
1. `scipy.integrate.quad`
1. `scipy.integrate.dblquad`
1. `scipy.integrate.tplquad`
1. `scipy.integrate.nquad`

## Preguntas varias
Para cada integrando proponga el método más adecuado y justifique: 
1. Una función periódica sobre un periodo completo.
1. Una gaussiana estrecha.
1. Una integral con singularidad en un extremo.
1. Datos tabulados con espaciado desigual.
1. Un polinomio de grado 9.

<!---
### 1. Programming questions

You will be asked several questions related to computer programming, including topics in **Python**, **NumPy**, and **SciPy**. Carefully review and understand all codes discussed during the course.

---

### 2. Mathematical optimization basics

* Describe the goal of mathematical optimization. Identify the different components of optimization: objective function, inequality and equality constraints, design variables, bounds, feasible region ($\mathcal{D}$), etc.
* Explain how a maximization problem can be transformed into a minimization problem. Provide the mathematical expression for this transformation.
* What is the mathematical definition of a local and a global minimum?
* What is a convex optimization problem? What characteristic of convex problems simplifies the search for an optimum? What is the implication for non-convex problems?
* What is the gradient? What is the Hessian matrix? How can its definiteness at a critical point (where the gradient is zero) be used to classify that point as a local minimum, maximum, or saddle point? Define the conditions for optimality in terms of the gradient and the Hessian matrix.
* Explain univariate and multivariate Taylor's series expansion. What is the associated formula? 

---

### 3. Univariate optimization

* What is the problem statement for univariate optimization? What are the assumptions on the problem?
* Why is it important to perform bracketing before carrying out unidimensional optimization? Provide two conditions that define a bracketed minimum.
* How to set the tolerance for univariate optimization methods?
* What are the main criteria for choosing one optimization method over another?

---

### 4. Multivariate optimization

* Explain a the forms of a quadratic equation $f(\boldsymbol{x}) = \frac{1}{2}\boldsymbol{x}^T\boldsymbol{A}\boldsymbol{x} + \boldsymbol{b}^T\boldsymbol{x} + c$ based on the characteristics of matrix $\boldsymbol{A}$
* What two components must be determined at each iteration of a gradient descent method? 
* What is the step size $\eta$ in a gradient descent method?
* Describe the primary drawback of the steepest descent method when optimizing functions with narrow, elongated valleys.
* Define line minimization or line search.
* Show that in the context of line search $\phi'(\eta) = \boldsymbol{g}_{k+1} \cdot \boldsymbol{d}_k$.
* Show that the general condition for feasible descent directions $f(\boldsymbol{x}_{k+1}) < f(\boldsymbol{x}_k)$ holds when, in the context of line search, $\phi'(0) = \boldsymbol{g}_k \cdot \boldsymbol{d}_k < 0$.
* What is a deflected gradient method?
* Discuss the different rates of convergence in optimization: linear convergence, superlinear convergence, quadratic convergence.
* Discuss the different stopping criteria for gradient descent methods.
* Show that in the context of steepest descent with line search $\phi'(\eta^*) = \boldsymbol{g}_{k+1} \cdot \boldsymbol{g}_k = 0$. How can we interpret this result from a geometrical point of view?

---

### 5. Optimization methods

For each of the following optimization techniques, explain:

* Advantages
* Disadvantages
* Main features
* Selection criteria
* Python implementation (API or usage)
* Mathematical derivation (if covered in class)

**Optimization methods:**

* Univariate optimization:
  * Golden section search
  * Parabolic interpolation
  * Newton's method
  * Brent's method
  * Line search
  
* Multivariate unconstrained optimization:
  * Gradient descent
  * Steepest descent
  * Newton's method (with and without adaptive step length)
  * Marquardt's method (what is the role of the damping parameter $\lambda_k$?)
  * Trust-region methods
  * Quasi-Newton methods
  * Conjugated gradient

  * Line search:
    * Exact vs. inexact line search methods
    * Inexact line search methods:
      * Goldstein test
      * Wolfe conditions
      * Armujo's rule

--->
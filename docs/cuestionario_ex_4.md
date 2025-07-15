# Cuestionario para el examen 4 de métodos numéricos aplicados a la ingeniería civil

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

* Univariate interpolation:
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
# Cuestionario para el examen 3 de métodos numéricos aplicados a la ingeniería civil

### 1. Programming questions

You will be asked several questions related to computer programming, including topics in **Python**, **NumPy**, and **SciPy**. Carefully review and understand all codes discussed during the course.

---

### 2. Function continuity classification

* Describe the classification of functions according to their continuity: $C^0$, $C^1$, $C^2$, $C^k$, $C^\infty$, etc.
* Why is continuity of derivatives important in interpolation for engineering applications?
* Give examples of methods that ensure $C^0$, $C^1$, and $C^2$, etc, continuity.

---

### 3. Interpolation basics

* Define interpolation.
* What are the desirable properties of an interpolation method?

---

### 4. Interpolation method selection

What are the main criteria for choosing one interpolation method over another?

---

### 5. Interpolation methods

For each of the following interpolation techniques, explain:

* Advantages
* Disadvantages
* Selection criteria
* Continuity class
* Python implementation (API or usage)
* Mathematical derivation (if covered in class)

**Interpolation Methods:**

* Univariate interpolation:
  * Nearest neighbors
  * Linear interpolation
  * Polynomial interpolation:
    * Lagrange polynomials
    * Hermite polynomials
    * Solving a linear system with Vandermonde matrices
    * Krogh’s method (1970)
    * Barycentric interpolation (Berrut & Trefethen, 2004)
  * Piecewise interpolation with splines:
    * Quadratic, cubic, and quintic splines
    * Cubic Hermite splines
  * PCHIP (Piecewise Cubic Hermite Interpolating Polynomial)
  * Akima interpolation
  * Makima interpolation

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

### 6. Challenges of polynomial interpolation

Explain the difficulties and limitations associated with polynomial interpolation.

---

### 7. Runge's phenomenon

* Describe Runge’s phenomenon and its implications for polynomial interpolation.
* Homework: Compare the use of equally spaced nodes vs Chebyshev nodes.
* Homework: Why are Chebyshev nodes preferred in high-degree polynomial interpolation?

---

### 8. Cubic splines

* Derive the formulation of cubic spline interpolation.
* In which contexts are cubic splines typically used?
* Homework: Explain and derive the formulation for the following boundary conditions:
  * Natural
  * Clamped
  * Not-a-knot
  * Periodic

* How can periodic splines be used to interpolate closed curves?

---

### 9. Additional concepts
* Homework: Describe the properties of Vandermonde matrices.
* Explain Horner’s method for efficient polynomial evaluation. Why is this method computationally efficient?
* Explain Voronoi tessellations. What are their main properties?
* Explain Delaunay's triangulations. What are their main properties?

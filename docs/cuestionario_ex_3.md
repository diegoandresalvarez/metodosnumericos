# Cuestionario para el examen 3 de métodos numéricos aplicados a la ingeniería civil

### 1. Programming Questions

You will be asked several questions related to computer programming, including topics in **Python**, **NumPy**, and **SciPy**. Carefully review and understand all codes discussed during the course.

---

### 2. Function Continuity Classification

* Describe the classification of functions according to their continuity: $C^0$, $C^1$, $C^2$, etc.
* Why is continuity of derivatives important in interpolation for engineering applications?
* Give examples of methods that ensure $C^0$, $C^1$, and $C^2$ continuity.

---

### 3. Interpolation Basics

* Define interpolation.
* What are the desirable properties of an interpolation method?

---

### 4. Interpolation Method Selection

What are the main criteria for choosing one interpolation method over another?

---

### 5. Interpolation Methods

For each of the following interpolation techniques, explain:

* Advantages
* Disadvantages
* Selection criteria
* Continuity class
* Python implementation (API or usage)
* Mathematical derivation (if covered in class)

**Interpolation Methods:**

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

---

### 6. Vandermonde Matrices

Describe the properties of Vandermonde matrices.

---

### 7. Challenges of Polynomial Interpolation

Explain the difficulties and limitations associated with polynomial interpolation.

---

### 8. Runge's Phenomenon

* Describe Runge’s phenomenon and its implications for polynomial interpolation.
* Homework: Compare the use of equally spaced nodes vs Chebyshev nodes.
* Homework: Why are Chebyshev nodes preferred in high-degree polynomial interpolation?

---

### 9. Horner’s Method

* Explain Horner’s method for efficient polynomial evaluation.
* Why is this method computationally efficient?

---

### 10. Cubic Splines

* Derive the formulation of cubic spline interpolation.
* In which contexts are cubic splines typically used?
* Explain and derive the formulation for the following boundary conditions:
  * Natural
  * Clamped
  * Not-a-knot
  * Periodic

* How can periodic splines be used to interpolate closed curves?
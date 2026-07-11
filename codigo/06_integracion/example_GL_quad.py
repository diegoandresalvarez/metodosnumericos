# Example: Gauss-Legendre quadratures
# Integrate f(x) = sin(x) from 0 to pi using Gauss-Legendre quadrature with n=3 points

import numpy as np
from scipy.integrate import fixed_quad
import matplotlib.pyplot as plt

f = lambda x: np.sin(x)
a = 0
b = np.pi
exact_integral = 2

n = 3     # number of points for Gauss-Legendre quadrature

ff = lambda xi : f((b-a)/2*xi + (b+a)/2) * (b-a)/2
integral1, _ = fixed_quad(f,   a, b, n=n)
integral2, _ = fixed_quad(ff, -1, 1, n=n)
integral3    = ff(-np.sqrt(3/5))*5/9 + ff(0)*8/9 + ff(+np.sqrt(3/5))*5/9

error = 100*abs((integral1 - exact_integral)/exact_integral)

print(f"Exact integral = {exact_integral}")
print(f"Integral 1     = {integral1}")
print(f"Integral 2     = {integral2}")
print(f"Integral 3     = {integral3}")
print(f"Relative error = {error}%")

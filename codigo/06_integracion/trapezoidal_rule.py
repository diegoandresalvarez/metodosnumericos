# Example: trapezoidal rule
# Integrate f(x) = 0.2 + 25x - 200x^2 + 675x^3 - 900x^4 + 400x^5 from 
# x = 0 to x = 0.8 using the trapezoidal rule with n = 1, 2, 4, 8, and 10000 subintervals.

import numpy as np
import matplotlib.pyplot as plt

f = lambda x: 0.2 + 25*x - 200*x**2 + 675*x**3 - 900*x**4 + 400*x**5
a = 0
b = 0.8
exact_integral = 3076/1875

print(f"Exact integral: {exact_integral:.8f}")
print("n       Integral     trapezoid()  error (%)")
for n in [1, 2, 4, 8, 10000]:
    dx = (b - a)/n
    x = np.linspace(a, b, n + 1)
    y = f(x)
    integral = dx*(y[0]/2 + np.sum(y[1:n]) + y[n]/2)
    trapz = np.trapezoid(y, x)
    rel_error = 100*abs(integral - exact_integral)/exact_integral
    print(f"{n:5d}   "
          f"{integral:10.8f}   "
          f"{trapz:10.8f}   "
          f"{rel_error:11.8f}")

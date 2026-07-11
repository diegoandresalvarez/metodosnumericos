# Example: Romberg integration 
# Integrate f(x) = 0.2 + 25x - 200x^2 + 675x^3 - 900x^4 + 400x^5 from x = 0 to x = 0.8

import numpy as np
from scipy.integrate import romb
import matplotlib.pyplot as plt

f = lambda x: 0.2 + 25*x - 200*x**2 + 675*x**3 - 900*x**4 + 400*x**5
a = 0
b = 0.8
n = 8
exact_integral = 3076/1875

x = np.linspace(a, b, n+1)
y = f(x)
integral = romb(y, dx=(b-a)/n)
error = 100*abs((integral - exact_integral)/exact_integral)

print(f"Exact integral = {exact_integral}")
print(f"Integral       = {integral}")
print(f"Relative error = {error}%\n")

# Print the Richardson Extrapolation Table
integral = romb(y, dx=(b-a)/n, show=True)

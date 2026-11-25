import numpy as np

# \int_0^2 t^2 d(t^3) = \int_0^2 3t^4 dx
#                     = [3/5 t^5]_0^2
#                     = 19.2

t = np.linspace(0, 2, 101)
f = t**2
g = t**3
trapz_result = np.trapezoid(y=f, x=g)

print(f"Exact:       19.2")
print(f"Trapezoidal: {trapz_result:.6f}")


import numpy as np

# Area circle of radius 1

t = np.linspace(0, 2*np.pi, 1001)
x = np.cos(t)
y = np.sin(t)
I = np.trapezoid(x, y)   # np.trapezoid(y=x, x=y)

print(f"Exact:       {np.pi:.6f}")
print(f"Trapezoidal: {I:.6f}")


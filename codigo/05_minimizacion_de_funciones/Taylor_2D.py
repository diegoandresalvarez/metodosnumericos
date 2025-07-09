import numpy as np
import matplotlib.pyplot as plt
from sympy import symbols, Matrix, hessian, lambdify, simplify

# Define the symbols and the function
x, y = symbols('x y')
f = -((x**2 + y - 11)**2 + (x + y**2 - 7)**2)
g = Matrix([f]).jacobian([x,y])
H = hessian(f, [x,y])

# Point of expansion
x0, y0 = -.8, .2

# Evaluate at (x0, y0)
f0 = f.subs({x: x0, y: y0})
g0 = g.subs({x: x0, y: y0}).T
H0 = H.subs({x: x0, y: y0})

# Define the Taylor series expression
dx = Matrix([[x - x0], [y - y0]])
taylor_expr = simplify(f0 + (g0.T@dx)[0] + (dx.T@H0@dx/2)[0, 0])

# Convert symbolic expressions to numpy functions
f_func = lambdify((x, y), f,           modules='numpy')
t_func = lambdify((x, y), taylor_expr, modules='numpy')

# Generate meshgrid for plotting
X = np.linspace(-5, 5, 100)
Y = np.linspace(-5, 5, 100)
X, Y = np.meshgrid(X, Y)
Z  = f_func(X, Y)
Zt = t_func(X, Y)

# Plot the original function
fig = plt.figure(figsize=(12, 5))

# Original function + Taylor approximation
ax1 = fig.add_subplot(1, 1, 1, projection='3d')
ax1.plot_surface(X, Y, Zt,  cmap='viridis', alpha=0.8)
ax1.plot_surface(X, Y, Z,   cmap='plasma', color='k', alpha=0.5, linewidth=1)
    
ax1.set_xlabel('x')
ax1.set_ylabel('y')
ax1.set_zlabel('f(x, y)')

plt.tight_layout()
plt.show()

# Demonstration of Simpson's 3/8 rule

from sympy.polys.polyfuncs import interpolate
from sympy import symbols, integrate, factor, pprint

x, x1, y1, y2, y3, y4, h = symbols('x, x_1, y_1, y_2, y_3, y_4, h')

x2 = x1 + h
x3 = x1 + 2*h
x4 = x1 + 3*h

# Provide data as a list of (x, y) tuples
data = [(x1, y1), (x2, y2), (x3, y3), (x4, y4)]

# Generate the Lagrange polynomial
L = interpolate(data, x)

# Calculate the integral of the Lagrange polynomial over the interval [x1, x4]
integral = factor(integrate(L, (x, x1, x4)))
print('Integral = ')
pprint(integral)

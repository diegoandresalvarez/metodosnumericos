import numpy as np
from scipy.integrate import fixed_quad
from scipy.special import ndtr  # Exact standard normal CDF for verification

# Define the standard normal PDF and the limits of integration
f = lambda x: np.exp(-0.5*x**2)/np.sqrt(2*np.pi)  # Standard normal PDF
a = -np.inf
b = -2.0
c = +1.0

# Transform the integral over the infinite interval [a, b] to a finite interval [0, 1]
new_f = lambda t : f(1/t) * (1.0/(t**2))  # Transformed integrand
new_a = 1/b
new_b = 1/a

# Integration using fixed_quad for int(f, x, a, b) 
int1, _ = fixed_quad(new_f, new_a, new_b, n=20)

# Integration using fixed_quad for int(f, x, b, c)
int2, _ = fixed_quad(f, b, c, n=20)

# The result of the integration
cdf_value = int1 + int2  

# Verification using SciPy's ndtr function
print(f"SciPy fixed_quad integration: {cdf_value}")
print(f"Exact SciPy verification:     {ndtr(c)}")


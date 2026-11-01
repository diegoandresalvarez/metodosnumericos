# Example: trapezoidal rule
# Integrate f(x) using the trapezoidal rule with n = 1, 2, 4, 8, 16  and 10000 subintervals.

import numpy as np
import matplotlib.pyplot as plt

f  = np.poly1d([ 400, -900, 675, -200, 25, 0.2])
F  = np.polyint(f)
#a  = 0
#b  = 0.8
# In the trapezoidal rule, doubling the number of subintervals improves the accuracy by a factor of 4 when f'(a) != f'(b)

# Now we will integrate a function with f'(a) = f'(b)
# When  f'(a) = f'(b), doubling the number of subintervals improves the accuracy of the trapezoidal rule by a factor of 16
df = np.polyder(f)
roots = np.sort(df.roots)
roots = roots.real[np.isclose(roots.imag, 0)]
a = roots[0]
b = roots[-1]
print(f"df(a) = {df(a):.8f}, df(b) = {df(b):.8f}")

# Let's integrate a peaked function with vanishing tails
from scipy.stats import norm
f = norm.pdf
F = norm.cdf
a = -5
b = 5

# Let's compute the exact integral of f(x) from a to b
exact_integral = float(F(b) - F(a))
print(f"Exact integral: {exact_integral:.8f}")

# Now we will apply the trapezoidal rule
print("n        Integral      trapezoid()  abs_error     rel_error(%)")
for n in [1, 2, 4, 8, 16, 32, 64, 10000]:
    dx = (b - a)/n
    x = np.linspace(a, b, n + 1)
    y = f(x)
    integral = dx*(y[0]/2 + np.sum(y[1:n]) + y[n]/2)
    trapz = np.trapezoid(y, x)
    abs_error = abs(integral - exact_integral)
    rel_error = 100*abs(integral - exact_integral)/exact_integral
    print(f"{n:5d}   "
          f"{integral: 10.8f}   "
          f"{trapz: 10.8f}   "
          f"{abs_error:10.8f}   "
          f"{rel_error:12.8f}")

# Now we will plot the function and the integration interval
x = np.linspace(a - 0.3*(b - a), b + 0.3*(b - a), 500)
y = f(x)
plt.plot(x, y, label="f(x)")
plt.fill_between(x, y, 0, where=(x >= a) & (x <= b), interpolate=True,
                 alpha=0.2, label="Integration interval")
plt.axvline(a, color="black", linestyle="-.", label=f"a = {a}")
plt.axvline(b, color="black", linestyle="--", label=f"b = {b}")
plt.xlabel("x")
plt.ylabel("f(x)")
plt.title("Function and integration interval")
plt.grid()
plt.legend()
plt.tight_layout()
plt.show()

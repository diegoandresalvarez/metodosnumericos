# Compute the integral of sin(x) in [0, pi]

from scipy.integrate import newton_cotes
import numpy as np

f = lambda x : np.sin(x)
a = 0
b = np.pi
exact = 2

print('N   Int (approx) Error')
for N in [2, 4, 6, 8, 10, 15, 20, 30]:
    x = np.linspace(a, b, N + 1)
    w, _ = newton_cotes(N)
    h = (b - a)/N
    approx = h*np.sum(w*f(x))
    error = abs(approx - exact)
    print(f'{N:2d}  {approx:10.9f}  {error:.5e}')

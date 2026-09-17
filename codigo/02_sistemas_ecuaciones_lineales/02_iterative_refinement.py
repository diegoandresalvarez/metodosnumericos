import numpy as np
from scipy.linalg import lu_factor, lu_solve, hilbert

# Let's use a Hilbert matrix, which is known to be ill-conditioned
n = 10
A = hilbert(n)
x_true = np.ones(n)
b = A@x_true

# LU decomposition of A
lu, piv = lu_factor(A)

# Solve Ax = b using the LU decomposition
x_dx = lu_solve((lu, piv), b)

# Compute residual in higher precision to avoid loss of significance
r = A.astype(np.longdouble)@x_dx.astype(np.longdouble) - b.astype(np.longdouble)

# Solve for the correction term dx_star
dx_star = lu_solve((lu, piv), r)
x = x_dx - dx_star

print(f"Initial solve error: {np.linalg.norm(x_dx - x_true):.6e}")
print(f"Refined solve error: {np.linalg.norm(x    - x_true):.6e}")

import numpy as np
from numpy import linalg as LA

A = np.array([[1, 0, -1], [0, 1, 0], [1, 0, 1]])

# 1. Default Condition Number (2-Norm / L2)
# By default, LA.cond uses the 2-norm (spectral norm).
LA.cond(A)   # = LA.cond(a, 2)

# 2. Negative 2-Norm
# Ratio of the smallest singular value of 'a' to the largest singular value.
LA.cond(A, -2)  # = 1/LA.cond(a)

# 3. Frobenius Norm Condition Number
# Uses the Frobenius norm (square root of the sum of the absolute squares of elements).
LA.cond(A, 'fro')

# 4. Infinity Norm (Max Row Sum)
# Calculates condition number using the maximum absolute row sum norm.
LA.cond(A, np.inf)

# 5. Negative Infinity Norm (Min Row Sum)
# Calculates condition number using the minimum absolute row sum norm.
LA.cond(A, -np.inf)

# 6. 1-Norm (Max Column Sum)
# Calculates condition number using the maximum absolute column sum norm.
LA.cond(A, 1)

# 7. Negative 1-Norm (Min Column Sum)
# Calculates condition number using the minimum absolute column sum norm.
LA.cond(A, -1)



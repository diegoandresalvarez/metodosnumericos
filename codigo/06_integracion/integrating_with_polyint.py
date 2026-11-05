import numpy as np

# Coefficients in descending order: 15x^2 + 8x + 10
coeffs = [15, 8, 10]

# Integrate once
p_int = np.polyint(coeffs)

print(p_int)
# Output: [ 5.  4. 10.  0.] -> Represents: 5x^3 + 4x^2 + 10x + 0

# Evaluate at upper bound (3) and subtract lower bound (1)
area = np.polyval(p_int, 3) - np.polyval(p_int, 1)

print(area)
# Output: 182.0

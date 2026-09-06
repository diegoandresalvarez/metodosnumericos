import numpy as np

n = 1_000_000

# Initialize variables
x1 = np.tile(np.float32(1.0),  n)
x2 = np.tile(np.float32(1e-6), n)
x3 = np.tile(np.float64(1e-6), n)

# Print the results
print(f"{x1.sum():.15}")
print(f"{x2.sum():.15}")
print(f"{x3.sum():.15}")

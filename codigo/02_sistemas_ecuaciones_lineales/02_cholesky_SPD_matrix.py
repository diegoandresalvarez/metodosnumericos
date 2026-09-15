import numpy as np
from scipy import linalg

def is_positive_definite(matrix):
    """
    Returns the Cholesky factor if the matrix is positive definite.
    """
    # Ensure the matrix is symmetric/Hermitian first
    if not np.allclose(matrix, matrix.conj().T):
        raise linalg.LinAlgError("matrix is not symmetric/Hermitian")
        
    return linalg.cholesky(matrix, lower=True)

# 1. A positive definite matrix
pos_def_matrix = np.array([[4, 1, 1],
                           [1, 3, 0],
                           [1, 0, 2]])

# 2. A non-positive definite matrix
non_pos_def_matrix = np.array([[1, 2, 0],
                               [2, 1, 0],
                               [0, 0, 1]])

for number, matrix in enumerate((pos_def_matrix, non_pos_def_matrix), start=1):
    try:
        cholesky_factor = is_positive_definite(matrix)
        print(f"Matrix {number} is positive definite.")
        print("Cholesky factor L:\n", cholesky_factor)
    except linalg.LinAlgError as error:
        print(f"Matrix {number} is not positive definite: {error}")

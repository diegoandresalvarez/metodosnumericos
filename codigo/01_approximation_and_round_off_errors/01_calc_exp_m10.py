import numpy as np

def exp_taylor_reciprocal(x, n_terms=50):
    """
    Computes exp(-x) with max precision
    """
    exp_x = old_term = 1.0
    
    # Generate each term: (x^n) / n! = (previous_term * x) / n
    for n in range(1, n_terms + 1):
        term      = old_term*x/n
        old_term  = term
        exp_x    += term
    
    # Return the reciprocal to get exp(-x) safely
    return 1/exp_x

# Compute e^(-10)
result   = exp_taylor_reciprocal(10.0)
true_val = np.exp(-10.0)

print(f"Taylor e^(-10): {result:.17e}")
print(f"NumPy  e^(-10): {true_val:.17e}")
print(f"Absolute error: {abs(result - true_val):.17e}")
print(f"Relative error: {100 * abs(result - true_val)/true_val:.10e}%")

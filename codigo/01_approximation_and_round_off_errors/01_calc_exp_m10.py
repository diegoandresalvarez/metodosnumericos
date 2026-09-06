import numpy as np

def exp_taylor_reciprocal(x, max_terms=60):
    """
    Computes exp(-x) with max precision
    """
    terms = np.zeros(max_terms, dtype=np.float64)
    terms[0] = 1.0
    
    # Generate each term: (x^n) / n! = (previous_term * x) / n
    for n in range(1, max_terms):
        terms[n] = terms[n-1]*x/n
        
    # Sum up the positive terms to get exp(x)
    exp_x = np.sum(terms)
    
    # Return the reciprocal to get exp(-x) safely
    return 1.0 / exp_x

# Compute e^(-10)
result = exp_taylor_reciprocal(10.0)
true_val = np.exp(-10.0)

print(f"Taylor e^(-10): {result:.17e}")
print(f"NumPy  e^(-10): {true_val:.17e}")
print(f"Absolute error:  {abs(result - true_val):.17e}")
print(f"Relative error:  {100 * abs(result - true_val) / true_val:.10f}%")

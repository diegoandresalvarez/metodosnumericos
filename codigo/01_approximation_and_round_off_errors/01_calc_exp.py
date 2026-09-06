import numpy as np
from math import factorial

max_iterations = 99
reversed_sum   = False

def calculate_exponential(x, reversed_sum=False):
    """
    Calculate e^x using Taylor series expansion
    e^x = 1 + x + x²/2! + x³/3! + ...
    """
    term = np.ones(max_iterations, dtype=np.float32)

    for i in range(1, max_iterations):
        term[i] = (x**i)/factorial(i)

    if reversed_sum:
        term = term[::-1]

    exp = np.cumsum(term)

    return x, term, exp

def print_results(x, term, exp):
    # Print header
    print(f"{'i':>4} {'term':>20} {'sum':>20}")
    print("-" * 46)

    for i in *range(5), *range(max_iterations-5, max_iterations):
        print(f"{i:>4} {term[i]:>20.10g} {exp[i]:>20.10g}")

    # Add exact value for comparison
    exact_value = np.exp(x)
    print("-" * 46)
    print(f"Exact value = {exact_value:.10f}")
    print(f"Absolute error = {np.abs(exact_value-exp[-1]):.10f}")
    print(f"Relative error = {100*np.abs(exact_value-exp[-1])/exact_value:.10f}%")

# Calculate e^10
print("Evaluation of e^10:")
print_results(*calculate_exponential( 10, reversed_sum))

# Calculate e^-10
print("\nEvaluation of e^-10:")
print_results(*calculate_exponential(-10, reversed_sum))









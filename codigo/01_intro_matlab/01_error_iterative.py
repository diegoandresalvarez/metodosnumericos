from math import exp, factorial

def calculate_taylor_series_exp(n, x):
    approx = 0
    for i in range(n):
        approx += (x**i)/factorial(i)
    return approx

x = 0.5
true_value = exp(x)
max_terms = 10
approx = float('nan')
e_tol  = 0.5e-5  # n=5 digits

print(f"Actual value of exp({x}) = {true_value}")
print("|  n |  Approximation | Absolute Error | Relative Err 1 | Relative Err 2 |")
print("|----|----------------|----------------|----------------|----------------|")

for n in range(1, max_terms + 1):
    previous_approx = approx

    approx   = calculate_taylor_series_exp(n, x)
    abs_err  = abs(true_value - approx)
    rel_err1 = abs((true_value - approx)/true_value)
    rel_err2 = (approx - previous_approx)/approx

    print(f"| {n:2d} | {approx:.12f} | {abs_err:.12f} | {rel_err1:.12f} | {rel_err2:.12f} |")

    if abs(rel_err2) < e_tol:
        break


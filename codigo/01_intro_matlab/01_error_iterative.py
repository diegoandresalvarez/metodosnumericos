from math import exp, factorial

def calculate_taylor_series_exp(n, x):
    s = 0
    for i in range(n):
        s += (x**i)/factorial(i)
    return s

x = 0.5
true_value = exp(x)
max_terms = 10
current_approx = float('nan')
e_tol  = 0.5e-5  # n=5 digits

print(f"Actual value of exp({x}) = {true_value}")
print("|  n |  Approximation | Absolute Error | Relative Err 1 | Relative Err 2 |")
print("|----|----------------|----------------|----------------|----------------|")

for n in range(1, max_terms + 1):
    previous = current_approx

    current_approx   = calculate_taylor_series_exp(n, x)
    abs_err  = abs(true_value - current_approx)
    rel_err1 = abs((true_value - current_approx)/true_value)
    rel_err2 = (current_approx - previous)/current_approx

    print(f"| {n:2d} | {current_approx:.12f} | {abs_err:.12f} | {rel_err1:.12f} | {rel_err2:2.12e} |")

    if abs(rel_err2) < e_tol:
        break


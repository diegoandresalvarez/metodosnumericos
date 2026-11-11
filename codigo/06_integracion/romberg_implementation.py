import numpy as np

def romberg(f, a, b, eps=1e-5, max_iter=20):
    # eps: desired accuracy
    # max_iter: maximum number of iterations

    R = np.zeros((max_iter+1, max_iter+1))
    for i in range(max_iter+1):
        # First column is the standard trapezoidal rule
        x = np.linspace(a, b, 2**i + 1)
        R[i, 0] = np.trapezoid(f(x), x)

        # Richardson extrapolation for higher-order accuracy
        for j in range(1, i+1):
            R[i, j] = R[i, j-1] + (R[i, j-1] - R[i-1, j-1])/(4**j - 1)

        # Check for convergence
        if i > 0 and abs(R[i, i] - R[i-1, i-1]) < eps:
            break
    else:
        raise RuntimeError(f"Romberg method did not converge within {max_iter} iterations.")

    # Print the Romberg table
    print("Romberg Table:")
    for k in range(i+1):
        print(" ".join(f"{R[k, j]:11.8f}" for j in range(k+1)))

    # The best estimate is the bottom-right element
    return R[i, i]

# Integrate the function f(x) = 4/(1 + x^2) from 0 to 1, which should yield pi.
f = lambda x: 4/(1 + x**2)

# Compute and print the result.
print("Approximation =", romberg(f, 0.0, 1.0))
print("Exact value   =", np.pi)

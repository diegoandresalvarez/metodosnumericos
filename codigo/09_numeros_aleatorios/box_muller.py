import numpy as np
import matplotlib.pyplot as plt

# Create a reproducible random-number generator
rng = np.random.default_rng(42)

def box_muller(n):
    """
    Generate n independent standard normal random variables using the Box-Muller method.
    """
    n_pairs = (n+1)//2

    # Generate uniforms in [0, 1)
    U1, U2 = rng.random(n_pairs), rng.random(n_pairs)

    # Guard against log(0), although rng.random() rarely returns exactly 0
    U1 = np.clip(a=U1, a_min=np.finfo(float).tiny, a_max=None)

    R     = np.sqrt(-2.0*np.log(U1))
    Theta = 2.0*np.pi*U2

    Z = np.concatenate((R*np.cos(Theta), R*np.sin(Theta)))

    # Return exactly n values if n is odd
    return Z[:n]

# Number of Gaussian samples to generate
N = 1_000_000
Z = box_muller(N)

# Histogram of the generated standard normal samples
plt.figure()
plt.hist(Z, bins=100, density=True, edgecolor='black', alpha=0.75)

# Overlay the theoretical standard normal PDF
z_values = np.linspace(-5, 5, 501)
pdf_values = (1/np.sqrt(2*np.pi)) * np.exp(-0.5*z_values**2)
plt.plot(z_values, pdf_values, 'r-',
        linewidth=2,
        label='Standard normal PDF')

plt.title('Histogram of Box-Muller Standard Normal Samples')
plt.xlabel('Value')
plt.ylabel('Density')
plt.xlim([-5, 5])
plt.legend()
plt.grid()
plt.show()














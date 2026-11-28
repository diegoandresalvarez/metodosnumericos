import matplotlib.pyplot as plt
import numpy as np
import scipy.stats as stats

rng = np.random.default_rng(42)

lamda     = 1.5   # events per hour
n_samples = 50_000

realmin = np.finfo(np.float64).tiny # 2.2250738585072014e-308

# Sample from the exponential distribution using inverse transform sampling
# Keep U strictly positive because log(0) is undefined.(-inf)
u = rng.uniform(realmin, 1.0, n_samples)   # U ~(0,1)
samples_X = -np.log(u)/lamda

# alternative methods
#samples_X = stats.expon.ppf(u, scale=1/lamda)  # Percent point function (inverse of CDF)
#samples_X = stats.expon.rvs(scale=1/lamda, size=n_samples, random_state=rng)

# Evaluate the mean and variance of the samples and compare with theoretical values
print(f"Mean     = {np.mean(samples_X):.4f} (Theoretical = {     1/lamda:.4f})  -> hours/event")
print(f"Variance = {np.var( samples_X):.4f} (Theoretical = {1/(lamda**2):.4f})  -> hours^2/event^2")

max_x = np.max(samples_X)
x = np.linspace(0.0, max_x, 100)

# Exponential PDF: f_X(x) = lamda * exp(-lamda * x)
pdf = stats.expon.pdf(x, scale=1/lamda)

# Plot the histogram of the samples and the theoretical PDF
fig, ax = plt.subplots(figsize=(8, 5))
ax.hist(samples_X, bins=100, density=True, color="skyblue", label="Simulated samples")
ax.plot(x, pdf, lw=2,                      color="red",     label="Exponential PDF $f_X(x)$")
ax.set_xlabel("Interarrival time (hours)")
ax.set_ylabel("Density")
ax.set_title("Inverse transform: exponential")
ax.set_xlim(0.0, max_x)
ax.grid()
ax.legend()
plt.show()

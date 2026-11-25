"""Compare samples from SciPy distributions with their probability laws."""

import numpy as np
import matplotlib.pyplot as plt
from scipy import stats

seed = 42
rng = np.random.default_rng(seed)
num_samples = 100_000

fig, axes = plt.subplots(3, 3, figsize=(12, 10), constrained_layout=True)
axes = axes.ravel()

continuous = [
    ("Normal",             stats.norm(loc=0, scale=1)),
    ("Truncated Normal",   stats.truncnorm(a=-1, b=2, loc=0, scale=1)),
    ("Trapezoidal",        stats.trapezoid(c=0.25, d=0.75)),
    ("Triangular",         stats.triang(c=0.35)),
]
for ax, (name, distribution) in zip(axes[:4], continuous):
    samples = distribution.rvs(size=num_samples, random_state=rng)
    ax.hist(
        samples, 
        bins=50, 
        density=True, 
        label="Samples")
    x = np.linspace(samples.min(), samples.max(), 500)
    ax.plot(x, distribution.pdf(x), "r-", linewidth=2, label="PDF")
    ax.set_title(name)
    ax.set_xlabel("x")
    ax.set_ylabel("Density")
    ax.legend()

discrete = [
    ("Binomial",         stats.binom(n=20, p=0.4)),
    ("Poisson",          stats.poisson(mu=5)),
    ("Discrete Uniform", stats.randint(low=0, high=10)),
]
for ax, (name, distribution) in zip(axes[4:7], discrete):
    samples = distribution.rvs(size=num_samples, random_state=rng)
    x = np.arange(samples.min(), samples.max() + 1)
    sample_pmf = np.bincount(samples, minlength=x[-1] + 1)/num_samples
    sample_pmf = sample_pmf[x]
    ax.plot(x, distribution.pmf(x), "r.", markersize=10, label="PMF")
    ax.stem(x, sample_pmf, linefmt="C0-", markerfmt="C0_", basefmt=" ", label='Samples')
    ax.set_title(name)
    ax.set_xlabel("x")
    ax.set_ylabel("Probability")
    ax.legend()

ax = axes[7]
distribution = stats.multivariate_normal(mean=[0, 0], cov=[[1, 0.6], [0.6, 1]])
samples = distribution.rvs(size=num_samples, random_state=rng)
ax.hist2d(samples[:, 0], samples[:, 1], bins=80, density=True, cmap="Blues")
x = np.linspace(samples[:, 0].min(), samples[:, 0].max(), 150)
y = np.linspace(samples[:, 1].min(), samples[:, 1].max(), 150)
xx, yy = np.meshgrid(x, y)
pdf = distribution.pdf(np.dstack((xx, yy)))
contour_lines = ax.contour(xx, yy, pdf, colors="red", levels=9)
ax.set_title("Multivariate Normal")
ax.set_xlabel("x")
ax.set_ylabel("y")
ax.plot([], [], "b-", linewidth=2, label="Sample histogram")
ax.plot([], [], "r-", linewidth=2, label="PDF contours")
ax.legend()

ax = axes[8]
population = [10, 15, 20]
draws = 8
distribution = stats.multivariate_hypergeom(m=population, n=draws)
samples = distribution.rvs(size=num_samples, random_state=rng)
bins = np.arange(-0.5, draws + 1.5)
histogram = ax.hist2d(
    samples[:, 0], samples[:, 1], 
    bins=(bins, bins),
    density=True, 
    cmap="Blues",
)
counts = np.arange(draws + 1)
xx, yy = np.meshgrid(counts, counts)
pmf = distribution.pmf(np.stack((xx, yy, draws - xx - yy), axis=-1))
ax.contour(xx, yy, pmf, colors="red", levels=9)
fig.colorbar(histogram[3], ax=ax, label="Sample probability")
ax.set_title("Multivariate Hypergeometric")
ax.set_xlabel("Count from category 1")
ax.set_ylabel("Count from category 2")
ax.plot([], [], "b-", linewidth=2, label="Sample histogram")
ax.plot([], [], "r-", label="PMF contours")
ax.legend()

fig.suptitle(f"{num_samples:,} samples per distribution (seed={seed})")
plt.show()

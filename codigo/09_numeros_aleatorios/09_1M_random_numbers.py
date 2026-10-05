import matplotlib.pyplot as plt
import numpy as np

# 1. Initialize the modern NumPy random number generator
rng = np.random.default_rng()

# 2. Generate 1,000,000 random numbers uniformly distributed
#    between 0 and 1
data = rng.random(1_000_000)

# 3. Create the histogram plot
plt.figure(figsize=(8, 5))
plt.hist(data, bins=50, color="skyblue", edgecolor="black")

# 4. Add labels and a title to make it readable
plt.title("Uniform Distribution of 1,000,000 Random Numbers")
plt.xlabel("Value")
plt.ylabel("Frequency")
plt.grid(axis="y", linestyle="--", alpha=0.5)

# 5. Display the plot
plt.show()


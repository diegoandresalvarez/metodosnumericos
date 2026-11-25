import matplotlib.pyplot as plt

# Constants for the LCG
# Suggested values (Press et al., Numerical Recipes):
a  = 1664525
c  = 1013904223
m  = 2**32
X0 = 12345  # Initial seed value

def LCG_rand(count):
    for _ in range(count):
        if LCG_rand._first_value:
            LCG_rand._first_value = False
        else:
            LCG_rand._X = (a * LCG_rand._X + c) % m

        yield LCG_rand._X / m
# Static/persistent variables
LCG_rand._X = X0
LCG_rand._first_value = True

# Generate the sample in three consecutive chunks.
U1 = LCG_rand(3)
U2 = LCG_rand(3)
U3 = LCG_rand(999_994)
U = [*U1, *U2, *U3]


# Show the first eight values rounded to four decimal places.
print('First eight generated values:', [f'{value:.4f}' for value in U[:8]])

# Plot the distribution of generated values.
plt.figure()
hist, bins, _ = plt.hist(U, bins=50, density=True, edgecolor='black')
plt.title('Histogram of LCG Uniform Random Numbers')
plt.xlabel('Value')
plt.ylabel('Density')
plt.grid()
plt.show()


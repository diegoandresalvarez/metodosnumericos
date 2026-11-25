import matplotlib.pyplot as plt

# Constants for the LCG
# Suggested values (Press et al., Numerical Recipes):
a  = 1664525
c  = 1013904223
m  = 2**32
X0 = 12345  # Initial seed value

def LCG_rand(n):
    X = [ X0 ]
    for i in range(n):
        X_i1 = (a*X[i] + c) % m
        X.append(X_i1)

    U = [x/m for x in X]
    return U

U = LCG_rand(1_000_000) 

# Show the first eight values rounded to four decimal places.
print('First eight generated values:', [f'{value:.4f}' for value in U[:8]])

plt.figure()
hist, bins, _ = plt.hist(U, bins=50, density=True, edgecolor='black')
plt.title('Histogram of LCG Uniform Random Numbers')
plt.xlabel('Value')
plt.ylabel('Density')
plt.grid()
plt.show()


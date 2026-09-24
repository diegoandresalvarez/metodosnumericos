import sympy as sp

# 1. Define the symbolic entries for matrix A
a1, a2, a3, a4 = sp.symbols('a_1:5')
b1, b2, b3, b4 = sp.symbols('b_1:5')
c1, c2, c3, c4 = sp.symbols('c_1:5')
d1, d2, d3, d4 = sp.symbols('d_1:5')

# 2. Construct Matrix A
A = sp.Matrix([
    [a1, a2, a3, a4],
    [b1, b2, b3, b4],
    [c1, c2, c3, c4],
    [d1, d2, d3, d4]
])

# 3. Construct the Permutation Matrix P
P = sp.Matrix([
    [0, 0, 0, 1],
    [0, 1, 0, 0],
    [1, 0, 0, 0],
    [0, 0, 1, 0]
])

# 4. Perform the multiplication
PA = P*A
AP = A*P

# Display the result
print("Premultiplication by P -> PA:")
sp.pprint(PA)

print()
print("Premultiplication by P -> AP:")
sp.pprint(AP)

import sympy as sp

# 1. Define our symbols for n=2
# c1, c2 are the weights; x1, x2 are the roots
# x is the integration variable
# We add real=True to help SymPy avoid complex number branches during solving
c1, c2, x1, x2, x = sp.symbols('c1 c2 x1 x2 x', real=True)

print("Set of Equations for Gauss-Legendre Quadrature (n=2):")
print("-" * 60)

equations = []

# For n=2 points, the formula must be exact for polynomials up to degree 3
for k in range(4): 
    # Left-hand side: c1*x1^k + c2*x2^k
    lhs = c1*x1**k + c2*x2**k
    
    # Right-hand side: The symbolic integral from -1 to 1
    rhs = sp.Integral(x**k, (x, -1, 1))
    
    # Create the equation for display purposes
    display_eq = sp.Eq(lhs, rhs)
    
    print(f"For f(x) = x^{k}:")
    sp.pprint(display_eq) # pprint prints it in a readable math format
    print()
    
    # Create the evaluated equation for the solver
    # .doit() evaluates the integral
    evaluated_eq = sp.Eq(lhs, rhs.doit())
    equations.append(evaluated_eq)

print("-" * 60)
print("Solving the system of equations...\n")

# 2. Solve the system
solutions = sp.solve(equations, (c1, c2, x1, x2), dict=True)

# 3. Print the solutions
for i, sol in enumerate(solutions):
    print(f"Solution Set {i+1}:")
    for var, val in sol.items():
        print(f"  {var} = {val}")
    print()

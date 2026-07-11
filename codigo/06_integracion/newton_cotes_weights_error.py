from scipy.integrate import newton_cotes
from sympy import nsimplify

for i in range(1, 7):
    weights, error_term = newton_cotes(i)
    print("i =", i)
    print("error term =", nsimplify(error_term))
    print("weights    =", [nsimplify(w) for w in weights])
    print()

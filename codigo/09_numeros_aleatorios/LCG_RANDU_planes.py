import matplotlib.pyplot as plt

# RANDU parameters
a  = 65539
c  = 0
m  = 2**31
X0 = 1

def LCG_rand(n):
    X = [ X0 ]
    for i in range(n):
        X_i1 = (a*X[i] + c) % m
        X.append(X_i1)

    U = [x/m for x in X]
    return U

U = LCG_rand(10_000) 

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.scatter(U[:-2], U[1:-1], U[2:], s=1)
ax.set_title('RANDU: Three Consecutive Values')
ax.set_xlabel(r'$U_n$')
ax.set_ylabel(r'$U_{n+1}$')
ax.set_zlabel(r'$U_{n+2}$')
ax.set_xlim(0, 1)
ax.set_ylim(0, 1)
ax.set_zlim(0, 1)
ax.set_box_aspect((1, 1, 1))
plt.show()


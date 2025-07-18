import numpy as np
import scipy.optimize as opt
import imageio.v2 as imageio
from IPython import display
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
import pandas as pd 

class Truss:
    """Truss class for structural analysis and optimization."""
    def __init__(self, xnod : np.ndarray, LaG : np.ndarray) -> None:
        """Initializes the truss with nodes and bars."""
        self.nno   = xnod.shape[0] # number of nodes
        self.nbars =  LaG.shape[0] # number of bars
        assert xnod.shape[1] == 2  # nodes are a (nno x 2) array
        assert LaG.shape[1]  == 2  # bars are a (nbars x 2) array

        self.xnod = xnod           # node coordinates
        self.LaG = LaG             # list of bars as pairs of node indices
        self._validar_barras()

        # node_idx is the index of the node, fx and fy are the forces in x and 
        # y directions
        # list of point loads as (node_idx, fx, fy)
        self.carga_puntual = []       

        # x_set and y_set are booleans indicating if the node is constrained 
        # in that direction
        # list of supports as (node_idx, x_set, y_set)
        self.apoyo : list[tuple] = []

        self.ngdl   = 2*self.nno           # number of degrees of freedom
        self.faxial = None                 # axial forces in each bar
        self.f      = np.zeros(self.ngdl)  # force vector
        self.c      = []                   # list of known constrained dofs
        self.long   = np.zeros(self.nbars) # length of each bar
        self.nodo_no_opt = []              # nodes that are not to be optimized (anchors and loads)
    
    def _validar_barras(self) -> None:
        """Validates the bars to ensure they are correctly defined and unique."""

        conjunto_barras = set()
        for i, j in self.LaG:
            assert 0 <= i < self.nno, f"Node index {i} out of bounds!"
            assert 0 <= j < self.nno, f"Node index {j} out of bounds!"
            assert i != j,            f"Bar cannot connect node {i} to itself!"

            # use frozenset to ensure uniqueness regardless of order
            # e.g., (1,2) is the same as (2,1)
            barra = frozenset((i, j))
            assert barra not in conjunto_barras, f"Duplicate bar {(i,j)}!"
            conjunto_barras.add(barra)
    
    def agregar_carga_puntual(self, 
                              idx_nodo : int, 
                              fx       : float, 
                              fy       : float):
        """Adds a point load acting on the given node"""        
        assert 0 <= idx_nodo < self.nno
        assert isinstance(fx, (int, float)),     "Force in x must be a number"
        assert isinstance(fy, (int, float)),     "Force in y must be a number"
        assert idx_nodo not in self.nodo_no_opt, "Node already has a load or support"

        # append the load to the list of point loads
        self.carga_puntual.append((idx_nodo, fx, fy))

        # don't allow moving loads, because they'll just be moved to the anchors        
        self.nodo_no_opt.append(idx_nodo)

        # add the forces to the global force vector
        self.f[2*idx_nodo    ] += fx
        self.f[2*idx_nodo + 1] += fy

    def agregar_apoyo(self, 
                      idx_nodo : int,
                      x_set    : bool = True,
                      y_set    : bool = True):
        """Adds a support at the given node, optionally constraining it in 
        the x and/or y direction. x_set and y_set are booleans indicating if 
        the node is constrained in that direction    
        """
        assert x_set or y_set, "At least one direction must be constrained"
        assert 0 <= idx_nodo < self.nno, f"Node index {idx_nodo} out of bounds!" 

        self.apoyo.append((idx_nodo, x_set, y_set))

        # don't allow moving anchors, because they'll just be moved to the load
        self.nodo_no_opt.append(idx_nodo)

        # add the constraints to the global constraint vector
        if x_set: self.c.append(2*idx_nodo);
        if y_set: self.c.append(2*idx_nodo + 1)
    
    def dibujar(self, ax=None) -> None:
        """Draws the truss structure with its nodes, bars, loads, and supports.
        If ax is provided, it will use that axes to draw, otherwise it will 
        create a new figure and axes.
        """
        if ax is None:
            fig, ax = plt.subplots()
        plt.axis('equal')

        xs = self.xnod[:,0]
        ys = self.xnod[:,1]
        
        # draw bars
        if self.faxial is None: 
            # draw the bars without forces
            for i, j in self.LaG:
                plt.plot(xs[[i, j]], ys[[i, j]] , 'k-', zorder=-1)
        else:
            for (i, j), f in zip(self.LaG, self.faxial):
                color = 'b' if f > 0 else 'r'  # blue for compression, red for tension
                plt.plot(
                    xs[[i, j]], ys[[i, j]], 
                    f'{color}-' if abs(f) > 0.1 else f'k', # if force is zero, draw a dotted line           
                    linewidth=abs(f) + 0.1, # still render things of zero force, 
                    zorder=-1)

        # draw point loads
        for idx, fx, fy in self.carga_puntual:
            fx /= 10
            fy /= 10
            plt.arrow(xs[idx] - fx, ys[idx] - fy, # start point, substract tip
                fx, fy, 
                head_width = 0.2,
                width = 0.05,
                color='green',
                length_includes_head=True)
            
        # draw supports
        for idx, x_constrained, y_constrained in self.apoyo:
            constrained_size = 0.1
            unconstrained_size = 0.3
            width  = constrained_size if x_constrained else unconstrained_size
            height = constrained_size if y_constrained else unconstrained_size

            # draw a rectangle centered at the node
            center = (xs[idx] - width/2, ys[idx] - height/2)
            ax.add_patch(Rectangle(center, width, height, edgecolor="green", facecolor="green"))
        
        # draw nodes
        plt.scatter(xs, ys)

    def calcular_fuerzas_axiales(self):
        """Calculates the axial forces in each bar using the stiffness method."""

        E = 1.0       # Young's modulus, arbitrary for now
        A = 1.0       # cross-sectional area, arbitrary for now

        idx = np.zeros((self.nbars, 4), dtype=int)  # indices of the degrees of freedom for each bar
        k   = np.zeros(self.nbars)                  # stiffness for each bar
        Ke  = np.zeros((self.nbars, 4, 4))          # local stiffness matrix for each bar
        K   = np.zeros((self.ngdl, self.ngdl))      # stiffness matrix
        T   = np.zeros((self.nbars, 4, 4))          # transformation matrix for each bar

        # Loop through each bar to calculate the local stiffness matrix and
        # transformation matrix, and assemble the global stiffness matrix
        for e in range(self.nbars):
            n1l, n2l = self.LaG[e]    # local node indices for the bar
            x1, y1   = self.xnod[n1l] # coordinates of local node 1
            x2, y2   = self.xnod[n2l] # coordinates of local node 2

            # indices of the degrees of freedom for the bar
            idx[e] = np.array([2*n1l, 2*n1l+1, 2*n2l, 2*n2l+1])

            # calculate transformation matrix
            self.long[e] = np.hypot(x1 - x2, y1 - y2) # length of the bar
            cos_t = (x1 - x2)/self.long[e]            # cosine of the angle
            sin_t = (y1 - y2)/self.long[e]            # sine of the angle
            k[e] = A*E/self.long[e]                   # stiffness for each bar

            # transformation matrix for the bar
            T[e] = np.array([[ cos_t, sin_t,        0,     0],
                             [-sin_t, cos_t,        0,     0],
                             [     0,     0,    cos_t, sin_t],
                             [     0,     0,   -sin_t, cos_t]])

            # local stiffness matrix for the bar    
            Ke[e] = np.array([[ k[e],  0, -k[e],  0],
                              [    0,  0,     0,  0],
                              [-k[e],  0,  k[e],  0],
                              [    0,  0,     0,  0]])

            # assemble the local stiffness matrix Ke into the global stiffness matrix K             
            K[np.ix_(idx[e], idx[e])] += T[e].T@Ke[e]@T[e]

        c = np.array(self.c)                      # known constraints
        d = np.setdiff1d(np.arange(self.ngdl), c) # unknown degrees of freedom

        #%%
        # f = vector de fuerzas nodales equivalentes
        # q = vector de fuerzas nodales de equilibrio del elemento
        # a = desplazamientos

        #| qd |   | Kcc Kcd || ac |   | fd |    Recuerde que siempre qc=0
        #|    | = |         ||    | - |    |
        #| qc |   | Kdc Kdd || ad |   | fc |

        # %% extraigo las submatrices y especifico las cantidades conocidas
        # Kcc = K[np.ix_(c,c)];  Kcd = K[np.ix_(c,d)];  fd = self.f[c]
        # Kdc = K[np.ix_(d,c)];  
        Kdd = K[np.ix_(d,d)];  fc = self.f[d]

        # f = vector de fuerzas nodales equivalentes
        # q = vector de fuerzas nodales de equilibrio del elemento
        # a = desplazamientos
        ac = np.zeros_like(c, dtype=float) # desplazamientos conocidos en contorno

        # %% resuelvo el sistema de ecuaciones
        # ad = np.linalg.solve(Kdd, fc - Kdc@ac)  # desplazamientos desconocidos
        ad = np.linalg.solve(Kdd, fc)             # desplazamientos desconocidos        
        # qd = Kcc@ac + Kcd@ad - fd               # fuerzas nodales de equilibrio desconocidas

        # armo los vectores de desplazamientos (a) y fuerzas (q)
        a = np.zeros(self.ngdl); a[c] = ac; a[d] = ad # desplazamientos
        # q = np.zeros(self.ngdl); q[c] = qd      # fuerzas nodales equivalentes

        # calculate the axial forces in each bar       
        self.faxial = np.zeros(self.nbars)  # axial forces on each bar
        for e in range(self.nbars):
            ae_loc = T[e]@a[idx[e]]         # local displacements of the bar   
            self.faxial[e] = k[e]*(ae_loc[2] - ae_loc[0])

        return self.faxial

    def calcular_costo(self, xnod_a_opt):
        """Calculates the cost function for the optimization problem.
        The cost function is the total weight of the truss, which is the sum of
        the weights of all bars, where the weight is calculated as the product
        of the length of the bar and the absolute value of the axial force in it.
        """

        idx = self.obtener_nodos_a_optimizar()

        # update the node positions with the optimized values
        self.xnod[idx,:] = xnod_a_opt.reshape((len(idx), 2))

        # recalculate the axial forces in the bars
        self.calcular_fuerzas_axiales()

        # calculate the total weight of the truss
        # area = force/stress (we assume the same stress for all bars)
        # since we assume a unit stress, the area is equal to the force "faxial"
        peso = self.long*np.abs(self.faxial)

        # A fall-off factor of 3.0 is applied to bars in tension to reduce their
        # weight and prevent an optimization algorithm from getting stuck in a
        # local minimum where all bars are in tension.           
        fall_off = 3.0
        peso[self.faxial > 0] *= (self.long[self.faxial > 0] + fall_off) / fall_off

        # return the total weight
        return np.sum(peso)
    
    def obtener_nodos_a_optimizar(self):
        """Returns a list with the indices of the nodes that are to be optimized."""
        return np.setdiff1d(np.arange(self.nno), self.nodo_no_opt)
    
    def optimize(self, gif_path="output/animation.gif"):
        """Optimizes the truss and optionally saves a gif of the process"""

        frame_folder = 'output/frames/'

        niter = 0

        fig, ax = plt.subplots()
        self.dibujar(ax)
        weight = self.calcular_costo(self.xnod[self.obtener_nodos_a_optimizar(),:].flatten())
        plt.title(f"Iteration {niter:3d}, weight: {weight:.5f}")
        print(f"Iteration: {niter:3d}, current weight: {weight:.5f}")
        plt.savefig(f"{frame_folder}frame_{niter:03d}.png")       
        frames = [ imageio.imread(f"{frame_folder}frame_{niter:03d}.png") ]

        def callbackF(x):
            nonlocal niter
            niter += 1
            weight = self.calcular_costo(x)
            print(f"Iteration: {niter:3d}, current weight: {weight:.5f}")

            plt.cla()  #.clf? .gcf?
            self.dibujar(ax)
            plt.title(f"Iteration {niter:3d}, weight: {weight:.5f}")
            plt.savefig(f"{frame_folder}frame_{niter:03d}.png")
            frames.append(imageio.imread(f"{frame_folder}frame_{niter:03d}.png"))

        try:
            result = opt.minimize(
                fun =      lambda xaopt : self.calcular_costo(xaopt), 
                x0 =       self.xnod[self.obtener_nodos_a_optimizar(),:].flatten(), 
                method =   'CG',
                callback = callbackF,
                options =  {'maxiter':200}
            )

            # Calculate metrics
            success = result.success
            fun_val   = result.fun
            grad_norm = np.linalg.norm(result.jac) if hasattr(result, 'jac') and result.jac is not None else 'N/A'
            nfev      = result.nfev
            njev      = result.njev if hasattr(result, 'njev') else 'N/A'
            nhev      = result.nhev if hasattr(result, 'nhev') else 'N/A'
            nit       = result.nit

            results = {
                'Success':            success,
                'Message':            result.message,
                'Function Value':     float(fun_val),
                'Gradient Norm':      float(grad_norm),
                'Func Evals':         nfev,
                'Jac Evals':          njev,
                'Hess Evals':         nhev,
                'Iterations':         nit,
            }

        except Exception as e:
            print(f"    >>> Optimization failed: {e}")
            results = {
                'Success':        False,
                'Message':        str(e),
                'Function Value': None,
                'Gradient Norm':  None,
                'Func Evals':     None,
                'Jac Evals':      None,
                'Hess Evals':     None,
                'Iterations':     niter,
            }

        # Compile all frames into a GIF
        imageio.mimsave(gif_path, frames, format='GIF', fps=3, loop=0) # Adjust fps as needed        

        print("Node positions after optimization:")
        for i, nodo in enumerate(self.xnod):
            print(f"Node {i}: ({nodo[0]:.2f}, {nodo[1]:.2f})")

        for i, bar in enumerate(self.LaG):
            print(f"Bar {i:2d}: Axial Force: {self.faxial[i]: 8.2f}, Length: {self.long[i]: 8.2f}")   

        return results

# %% Truss 1
xnod = np.array([
    (0.0, 0.0),
    (0.0, 1.0), 
    (1.0, 0.0),
    (1.0, 1.0), 
    (2.0, 0.0),
    (2.0, 1.0), 
    (3.0, 0.0),
    (3.0, 1.0), 
    (4.0, 0.0),
    (4.0, 1.0), 
])
bars = np.array([
    (0,2), (2,4), (4,6), (6,8), (1,3), (3,5), (5,7), (7,9),
    (0,1), (2,3), (4,5), (6,7), (8,9), (0,3), (2,5), (5,6), 
    (7,8), (1,2), (3,4), (4,7), (6,9)
])
t1 = Truss(xnod, bars)
t1.agregar_carga_puntual(2, 0, -5)
t1.agregar_carga_puntual(4, 0, -5)
t1.agregar_carga_puntual(6, 0, -5)
t1.agregar_apoyo(0)
t1.agregar_apoyo(8, x_set=False)
t1.dibujar()
t1.calcular_fuerzas_axiales()
results = t1.optimize()
print(results)
plt.show()


# %% Truss 2
'''
xnod = np.array([
    (0.0, 0.0),
    (0.0, 1.0), 
    (1.0, 0.0),
    (1.0, 1.0), 
    (2.0, 0.0),
    (2.0, 1.0), 
    (3.0, 0.0),
    (3.0, 1.0), 
    (4.0, 0.0),
    (4.0, 1.0), 
])
bars = np.array([
    (0,2), (2,4), (4,6), (6,8), (1,3), (3,5), (5,7), (7,9),
    (0,1), (2,3), (4,5), (6,7), (8,9), (0,3), (2,5), (5,6), 
    (7,8), (1,2), (3,4), (4,7), (6,9)
])
t2 = Truss(xnod, bars)
t2.agregar_carga_puntual(5, 0, -10)
t2.agregar_apoyo(0)
t2.agregar_apoyo(8, x_set=False)
t2.dibujar()
t2.calcular_fuerzas_axiales()
results = t2.optimize()
print(results)
plt.show()
'''

## % # Truss 3
'''
xnod = np.array([
    (0.0, 0.0), # 0
    (0.0, 1.0), 
    (0.0, 2.0),
    (1.0, 0.0), # 3
    (1.0, 1.0), 
    (1.0, 2.0),
    (2.0, 0.0), # 6
    (2.0, 1.0), 
    (2.0, 2.0),
    (3.0, 0.0),
    (3.0, 1.0), 
    (3.0, 2.0),
    (4.0, 0.0),
    (4.0, 1.0), 
    (4.0, 2.0),
    (5.0, 0.0),
    (5.0, 1.0), 
    (5.0, 2.0),
    (6.0, 0.0),
    (6.0, 1.0), 
    (6.0, 2.0),
])
bars = np.array((
    # rows
    (0,3), (3,6), (6,9), (9,12), (12,15), (15,18),
    (1,4), (4,7), (7,10), (10,13), (13,16),(16,19),
    (2,5), (5,8), (8,11), (11,14), (14,17),(17,20),
    # cols
    (0,1), (1,2), (3,4), (4,5), (6,7), (7,8), (9,10),
    (10,11),(12,13),(13,14),(15,16),(16,17),(18,19),(19,20),
    # diags
    (0,4),(1,5),(3,7),(4,8),(6,10),(7,11),(9,13),(10,14),(12,16),(13,17),(15,19),(16,20),
    (1,3),(2,4),(4,6),(5,7), (7,9),(8,10),(10,12),(11,13), (13,15),(14,16),(16,18),(17,19),
))
t3 = Truss(xnod, bars)
t3.agregar_carga_puntual(20, 0, -10)
t3.agregar_apoyo(0)
t3.agregar_apoyo(2)
t3.dibujar()
t3.calcular_fuerzas_axiales()
results = t3.optimize()
print(results)
plt.show()
'''

# %% Truss 4
'''
# holding a side load
xnod = np.array([
    (0.0, 0.0),
    (0.0, 1.0), 
    (0.0, 2.0),
    (1.0, 0.0), 
    (1.0, 1.0),
    (1.0, 2.0),
    (2.0, 0.0),
    (2.0, 1.0),
    (2.0, 2.0),
]) - np.array([[0,.5]])
bars = np.array([
    (0,1), (1,2), (3,4), (4,5), (6,7), (7,8), (0,3), (1,4), (2,5), (3,6), 
    (4,7), (5,8), (0,4), (4,8), (2,4), (6,4), (1,3), (1,5), (5,7), (3,7),
])
t4 = Truss(xnod, bars)
t4.agregar_carga_puntual(7, 0, -5)
t4.agregar_apoyo(0)
t4.agregar_apoyo(2)
t4.dibujar()
t4.calcular_fuerzas_axiales()
results = t4.optimize()
print(results)
plt.show()

fuerzas = t4.calcular_fuerzas_axiales()
print(fuerzas)
'''
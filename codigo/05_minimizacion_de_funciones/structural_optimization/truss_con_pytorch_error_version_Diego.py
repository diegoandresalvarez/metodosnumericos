import numpy as np
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
import torch
import imageio.v2 as imageio
from IPython import display

def setdiff1d(t1,t2):
    combined = torch.cat((t1, t2))
    uniques, counts = combined.unique(return_counts=True)
    return uniques[counts == 1]

def ix_(a, b):
    """Returns the indices of a and b as a meshgrid"""
    return torch.meshgrid(a, b, indexing='ij')

class Truss:
    """Object that represents a truss, can calculate its forces and optimize the
    locations of its nodes"""

    def __init__(self, xnod : np.ndarray, LaG : np.ndarray) -> None:
        self.nno = xnod.shape[0]
        self.nef = LaG.shape[0]
        assert xnod.shape[1] == 2  # nodes are a (nno x 2) array
        assert LaG.shape[1]  == 2  #  bars are a (nef x 2) array

        # nodes are stored as list of tensors so that some can require gradients, but others not
        self.xnod = [ torch.tensor(nodo, requires_grad=True) for nodo in xnod ]

        self.LaG = LaG
        self._validar_barras()

        self.carga_puntual = []
        self.apoyo : list[tuple] = []

        self.ngdl   = 2*self.nno             # number of degrees of freedom
        self.faxial = None
        self.f      = torch.zeros(self.ngdl) # force vector
        self.c      = []                     # list of known constraints (anchors)
    
    def _validar_barras(self) -> None:
        """Asserts that all bars make sense and have no duplicates"""
        conjunto_barras = set()
        for i, j in self.LaG:
            assert 0 <= i < self.nno, f"index error: {i}"
            assert 0 <= j < self.nno, f"index error: {j}"
            barra = frozenset((i, j))
            assert barra not in conjunto_barras, f"Duplicate bar {(i,j)}!"
            conjunto_barras.add(barra)
    
    def agregar_carga_puntual(self, 
                              idx_nodo : int, 
                              fx       : float, 
                              fy       : float):
        """Adds a force acting on the given node"""
        assert 0 <= idx_nodo < self.nno
        self.carga_puntual.append((idx_nodo, fx, fy))

        # don't allow moving loads, because they'll just be moved to the anchors
        self.xnod[idx_nodo].requires_grad = False

        self.f[2*idx_nodo    ] += fx
        self.f[2*idx_nodo + 1] += fy

    def agregar_apoyo(self, 
                      idx_nodo : int,
                      x_set    : bool = True,
                      y_set    : bool = True):
        """Sets node at idx to be an anchor in possibly the x and y directions"""
        assert 0 <= idx_nodo < self.nno
        self.apoyo.append((idx_nodo, x_set, y_set))

        # don't allow moving anchors, because they'll just be moved to the load
        self.xnod[idx_nodo].requires_grad = False

        if x_set: self.c.append(2*idx_nodo)
        if y_set: self.c.append(2*idx_nodo + 1)
    
    def dibujar(self, ax=None) -> None:
        """Draws the graph and the forces on it:
        ax: allow passing in a matplotlib axes, to reuse it when drawing in a loop"""
        if ax is None:
            fig, ax = plt.subplots()
        plt.axis('equal')

        # get values out of tensor list - use detach() to avoid gradient issues
        xs = np.array([n[0].detach().numpy() for n in self.xnod])
        ys = np.array([n[1].detach().numpy() for n in self.xnod])
        
        # draw edges
        if self.faxial is None:
            for i, j in self.LaG:
                plt.plot(xs[[i, j]], ys[[i, j]] , 'k-', zorder=-1)
        else:
            for (i, j), f in zip(self.LaG, self.faxial):
                color = 'b' if f > 0 else 'r'  # blue for compression, red for tension
                plt.plot(
                    xs[[i, j]], ys[[i, j]], 
                    f'{color}-',
                    # still render things of zero force, 
                    linewidth=abs(f.detach().numpy()) + 0.1, # detach force values too
                    zorder=-1)

        # draw loads
        for idx, fx, fy in self.carga_puntual:
            fx /= 10
            fy /= 10
            plt.arrow(xs[idx] - fx, ys[idx] - fy, fx, fy,  # subtract force to put tip at node
                head_width = 0.2,
                width = 0.05,
                color='green',
                length_includes_head=True)
            
        # draw anchors
        for idx, x_constrained, y_constrained in self.apoyo:
            constrained_size = 0.1
            unconstrained_size = 0.3
            width  = constrained_size if x_constrained else unconstrained_size
            height = constrained_size if y_constrained else unconstrained_size

            center = (xs[idx] - width / 2, ys[idx] - height / 2)
            ax.add_patch(Rectangle(center, width, height, edgecolor="green", facecolor="green"))
        
        # draw nodes
        plt.scatter(xs, ys)

    def calcular_fuerzas_axiales(self):
        idx = torch.zeros((self.nef, 4), dtype=torch.int)  # indices of the degrees of freedom for each bar
        k   = torch.zeros(self.nef)                        # stiffness for each bar
        Ke  = torch.zeros((self.nef, 4, 4))                # local stiffness matrix for each bar
        K   = torch.zeros((self.ngdl, self.ngdl))          # stiffness matrix
        T   = torch.zeros((self.nef, 4, 4))                # transformation matrix for each bar

        for e in range(self.nef):
            n1l, n2l = self.LaG[e]
            x1, y1   = self.xnod[n1l]
            x2, y2   = self.xnod[n2l]

            idx[e] = torch.tensor([2*n1l, 2*n1l+1, 2*n2l, 2*n2l+1])

            # calculate transformation matrix
            L = torch.hypot(x1 - x2, y1 - y2)  # length of the bar
            cos_t = (x1 - x2)/L                # cosine of the angle
            sin_t = (y1 - y2)/L                # sine of the angle

            E = 1.0    # Young's modulus, arbitrary for now
            A = 1.0    # cross-sectional area, arbitrary for now

            k[e] = A*E/L

            T[e] = torch.tensor([[ cos_t, sin_t,        0,     0],
                                 [-sin_t, cos_t,        0,     0],
                                 [     0,     0,    cos_t, sin_t],
                                 [     0,     0,   -sin_t, cos_t]], dtype=torch.float)

            Ke[e] = torch.tensor([[ k[e],  0, -k[e],  0],
                                  [    0,  0,     0,  0],
                                  [-k[e],  0,  k[e],  0],
                                  [    0,  0,     0,  0]])

            # se ensambla la matriz de rigidez local Ke en la matriz de rigidez global K
            K[ix_(idx[e], idx[e])] += T[e].T@Ke[e]@T[e]

        c = torch.tensor(self.c)                   # known constraints
        d = setdiff1d(torch.arange(self.ngdl), c)  # unknown degrees of freedom

        #%%
        # f = vector de fuerzas nodales equivalentes
        # q = vector de fuerzas nodales de equilibrio del elemento
        # a = desplazamientos

        #| qd |   | Kcc Kcd || ac |   | fd |    Recuerde que siempre qc=0
        #|    | = |         ||    | - |    |
        #| qc |   | Kdc Kdd || ad |   | fc |

        # %% extraigo las submatrices y especifico las cantidades conocidas
        # Kcc = K[ix_(c,c)];  Kcd = K[ix_(c,d)];  fd = self.f[c]
        # Kdc = K[ix_(d,c)];  
        Kdd = K[ix_(d,d)];  fc = self.f[d]

        # f = vector de fuerzas nodales equivalentes
        # q = vector de fuerzas nodales de equilibrio del elemento
        # a = desplazamientos
        ac = torch.zeros_like(c, dtype=torch.float) # desplazamientos conocidos en contorno

        # %% resuelvo el sistema de ecuaciones
        # ad = torch.linalg.solve(Kdd, fc - Kdc@ac)  # desplazamientos desconocidos
        ad = torch.linalg.solve(Kdd, fc)  # desplazamientos desconocidos        
        # qd = Kcc@ac + Kcd@ad - fd                  # fuerzas nodales de equilibrio desconocidas

        # armo los vectores de desplazamientos (a) y fuerzas (q)
        a = torch.zeros(self.ngdl); a[c] = ac; a[d] = ad # desplazamientos
        # q = torch.zeros(self.ngdl); q[c] = qd            # fuerzas nodales equivalentes

        self.faxial = torch.zeros(self.nef)  # axial forces on each beam
        for e in range(self.nef): # para cada barra
            ae_loc = T[e]@a[idx[e]]  # desplazamientos locales
            self.faxial[e] = k[e]*(ae_loc[2] - ae_loc[0])

        return self.faxial

    def calcular_costo(self):
        """Calculates the cost of the truss from the lengths and forces.
        Tension weight = length * force / 1
        compression weight = length * force / (3 / (length + 3))
        """
        self.calcular_fuerzas_axiales()

        longitud = torch.zeros_like(self.faxial)
        for i, (n1l, n2l) in enumerate(self.LaG):
            longitud[i] = torch.linalg.norm(self.xnod[n1l] - self.xnod[n2l])

        peso = longitud*torch.abs(self.faxial)

        return torch.sum(peso)
    
    def obtener_nodos_a_optimizar(self):
        """Returns a list of all nodes that require a gradient"""
        return [n for n in self.xnod if n.requires_grad]
    
    def optimize(self, n_frames=200, render_live=True, save_gif=True, gif_path="output/animation.gif"):
        """Optimizes the truss and optionally saves a gif of the process"""
        frame_folder = 'output/frames/'

        # no momentum
        optimizer = torch.optim.Adam(params=self.obtener_nodos_a_optimizar(), lr=0.005, betas=(0.0, 0.0))

        if render_live or save_gif:
            fig, ax = plt.subplots()

        for i in range(n_frames):
            optimizer.zero_grad()            
            costo = self.calcular_costo()
            costo.backward()
            optimizer.step()            

            if render_live or save_gif:
                plt.cla()
                self.dibujar(ax)
                
                if save_gif:
                    plt.savefig(f"{frame_folder}frame_{i:03d}.png")
                if render_live:
                    display.display(plt.gcf())
                    display.clear_output(wait=True)

        if save_gif:
            if not render_live:
                plt.close()

            # Compile frames into a GIF
            frames = []
            for i in range(n_frames):
                frames.append(imageio.imread(f"{frame_folder}frame_{i:03d}.png"))
            imageio.mimsave(gif_path, frames, format='GIF', fps=30, loop=0) # Adjust fps as needed

# Bridge
node_tensors = np.array([
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
edges = np.array((
    (0,2), (2,4), (4,6), (6,8),
    (1,3), (3,5), (5,7), (7,9),
    (0,1), (2,3), (4,5), (6,7), (8,9),
    (0,3), (2,5), (5,6), (7,8),
    (1,2),(3,4),(4,7),(6,9)
))
t = Truss(node_tensors, edges)


t.agregar_carga_puntual(2, 0, -5)
t.agregar_carga_puntual(4, 0, -5)
t.agregar_carga_puntual(6, 0, -5)
t.agregar_apoyo(0)
t.agregar_apoyo(8,x_set=False)
t.dibujar() #; plt.show()
t.calcular_fuerzas_axiales()
t.dibujar() #; plt.show()

t.optimize(render_live=True,save_gif=True)

t.calcular_fuerzas_axiales()
t.dibujar(); plt.show()

print("Node positions after optimization:")
for i, nodo in enumerate(t.xnod):
    print(f"Node {i}: ({nodo[0].item():.2f}, {nodo[1].item():.2f})")

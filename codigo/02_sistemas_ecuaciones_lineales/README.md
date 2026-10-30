# Sistemas de ecuaciones lineales

## Eliminación de Gauss y Gauss-Jordan

* [gauss_elimination_with_backsubstitution.ipynb](gauss_elimination_with_backsubstitution.ipynb) notebook de eliminación de Gauss con sustitución hacia atrás y análisis del número de condición.
* [gauss_jordan_elimination.ipynb](gauss_jordan_elimination.ipynb) notebook de eliminación de Gauss-Jordan con pivoteo parcial.
* [MATLAB/gauss_elimination_with_backsubstitution.m](MATLAB/gauss_elimination_with_backsubstitution.m) eliminación de Gauss con sustitución hacia atrás en MATLAB.
* [MATLAB/gauss_jordan_elimination.m](MATLAB/gauss_jordan_elimination.m) Gauss-Jordan con pivoteo parcial en MATLAB.
* [MATLAB/gauss.m](MATLAB/gauss.m) método de Gauss para resolver sistemas lineales en MATLAB.

## Descomposición LU

* [lu_decomposition_advantages.ipynb](lu_decomposition_advantages.ipynb) notebook que muestra por qué la descomposición LU es el método preferido en álgebra lineal numérica.
* [lu_decomposition_THIS_IS_NOT_READY.ipynb](lu_decomposition_THIS_IS_NOT_READY.ipynb) notebook sobre descomposición LU (en construcción).
* [MATLAB/lu_decomp.m](MATLAB/lu_decomp.m) descomposición LU para resolver sistemas lineales en MATLAB.
* [MATLAB/lu_doolittle.m](MATLAB/lu_doolittle.m) descomposición LU de una matriz cuadrada con el método de Doolittle.
* [02_permutation_matrix.py](02_permutation_matrix.py) muestra simbólicamente (SymPy) el efecto de una matriz de permutación sobre una matriz.

## Descomposición de Cholesky

* [cholesky_decomposition.ipynb](cholesky_decomposition.ipynb) notebook sobre la descomposición de Cholesky de matrices simétricas definidas positivas.
* [02_cholesky_SPD_matrix.py](02_cholesky_SPD_matrix.py) verifica si una matriz es definida positiva intentando su factorización de Cholesky.

## Métodos iterativos

* [MATLAB/jacobi_iter.m](MATLAB/jacobi_iter.m) método iterativo de Jacobi para sistemas lineales.

## Condicionamiento y refinamiento

* [02_condition_number.py](02_condition_number.py) calcula el número de condición de una matriz con distintas normas.
* [02_iterative_refinement.py](02_iterative_refinement.py) aplica refinamiento iterativo a un sistema con una matriz de Hilbert mal condicionada.

## Documentos

* [solvers_Ax_b.pdf](solvers_Ax_b.pdf) resumen en PDF de los métodos para resolver Ax = b.

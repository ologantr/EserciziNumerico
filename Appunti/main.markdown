# Sistemi lineari

Dato un sistema di ***m*** equazioni lineari in **n** incognite:

$$
\left\{
\begin{array}{c c c c c c c c c}
    a_{11} \, x_{1} & + & a_{12} \, x_{2} & + & \ldots & + & a_{1n} \, x_{n} & = & b_{1}  \\
    a_{21} \, x_{1} & + & a_{22} \, x_{2} & + & \ldots & + & a_{2n} \, x_{n} & = & b_{2}  \\
    \vdots          &   & \vdots          &   & \vdots &   & \vdots          &   & \vdots \\
    a_{m1} \, x_{1} & + & a_{m2} \, x_{2} & + & \ldots & + & a_{mn} \, x_{n} & = & b_{m}
\end{array}
\right.
$$

Si definiscono:

$$
A =
\begin{pmatrix}
    a_{11} & a_{12} & \ldots & a_{1n} \\
    a_{21} & a_{22} & \ldots & a_{2n} \\
    \vdots & \vdots & \vdots & \vdots \\
    a_{m1} & a_{m2} & \ldots & a_{mn} \\
\end{pmatrix}
$$

$$
\boldsymbol{b} =
\begin{pmatrix}
    b_{1} \\
    b_{1} \\
    \vdots \\
    b_{m} \\
    \end{pmatrix}
\qquad
\boldsymbol{x} =
\begin{pmatrix}
    x_{1} \\
    x_{1} \\
    \vdots \\
    x_{n} \\
\end{pmatrix}
$$

$$
C = (A \, | \, \boldsymbol{b}) =
\left(
\begin{array}{c c c c | c}
    a_{11} & a_{12} & \ldots & a_{1n} & b_{1}  \\
    a_{21} & a_{22} & \ldots & a_{2n} & b_{2}  \\
    \vdots & \vdots & \vdots & \vdots & \vdots \\
    a_{m1} & a_{m2} & \ldots & a_{mn} & b_{m}  \\
\end{array}
\right)
$$

* I **coefficienti** sono $a_{11}, \ldots, a_{mn}$.
  $A$ è la **matrice dei coefficienti**.

* I **termini noti** sono $b_{1}, b_{2}, \ldots, b_{m}$.
  $\boldsymbol{b}$ è il **vettore dei termini noti**.

* Le incognite sono $x_{1}, x_{2}, \ldots, x_{n}$.
  $\boldsymbol{x}$ è il **vettore delle incognite**.

* La **soluzione** è una n-pla ordinata $x_{1}, x_{2}, \ldots, x_{n}$
  che soddisfa tutte le equazioni del sistema.

* Il sistema è **compatibile** se ammette almeno una soluzione,
  altrimenti è **incompatibile**.

* Il sistema è **omogeneo** se tutti i termini noti sono nulli.

* Il sistema è **normale** o **quadrato** se $m = n$ cioè se il
  numero di equazioni è uguale al numero di incognite.

* Il sistema è **sottodeterminato** se $m < n$ cioè se le equazioni
  sono meno delle incognite.

* Il sistema è **sovradimensionato** se $m > n$ cioè se le equazioni
  sono più delle incognite.

## Condizioni di esistenza e di unicità di soluzioni

* Condizione necessaria e sufficiente dell'esistenza di soluzioni:

  La matrice dei coefficienti $A$ e la matrice completa del sistema
  $C = (A \, | \, \boldsymbol{b})$ devono avere lo stesso rango.

* Condizione necessaria dell'unicità della soluzione:

  Il sistema deve essere normale.

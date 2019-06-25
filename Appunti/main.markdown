# Sistemi lineari

Dato un sistema di $m$ equazioni lineari in $n$ incognite:

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

Tale teorema assicura che un sistema omogeneo ammette sempre almeno
una soluzione. Infatti quando $\boldsymbol{b} = 0$ il rango della
matrice dei coefficienti $A$ è uguale a quello della matrice completa
$C$ ed esiste almeno la soluzione $\boldsymbol{x} = 0$.

* Condizione necessaria dell'unicità della soluzione:

  Il sistema deve essere normale.

In quanto:

* Dato un sistema che ammette una soluzione, essa è unica se e solo se
  il corrispondente sistema omogeneo $A \, \boldsymbol{x} = 0$ ammette
  solo la soluzione $\boldsymbol{x} = 0$.

* Ogni sistema omogeneo sottodimensionato $A \, \boldsymbol{x} = 0$ con
  un numero di equazioni inferiore al numero di incognite ammette
  soluzioni non nulle $\boldsymbol{x} \neq 0$.

* Data una matrice dei coefficienti $A$ $(m \times n)$, se il sistema
  $A \, \boldsymbol{x} = 0$ ammette una soliuzione per qualsiasi vettore
  dei termini noti $\boldsymbol{b}$ ne consegue che $m \leq n$.

## Sistemi normali

Data una matrice $A$ $(n \times n)$, le seguenti tre proposizioni
sono equivalenti:


* Il sistema omogeneo $A \, \boldsymbol{x} = 0$ ammette soltanto la soluzione
  nulla $\boldsymbol{x} = 0$.

* Per ogni vettore dei termini noti $\boldsymbol{b}$ il sistema
  $A \, \boldsymbol{x} = \boldsymbol{b}$ ammette una unica soluzione.

* $A$ non è singolare.

  Cioè $A$ è una matrice quadrata con rango massimo.

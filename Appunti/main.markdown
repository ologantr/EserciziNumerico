# Sistemi lineari

Dato un sistema di $m$ equazioni lineari in $n$ incognite:

$$
\left\{
\begin{array}{c c c c c c c c c}
    a_{11} \, x_{1} & + & a_{12} \, x_{2} & + & \ldots & + & a_{1n} \, x_{n} & = & b_{1}  \\
    a_{21} \, x_{1} & + & a_{22} \, x_{2} & + & \ldots & + & a_{2n} \, x_{n} & = & b_{2}  \\
    \vdots          &   & \vdots          &   & \vdots &   & \vdots          &   & \vdots \\
    a_{m1} \, x_{1} & + & a_{m2} \, x_{2} & + & \ldots & + & a_{mn} \, x_{n} & = & b_{m}  \\
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
    b_{2} \\
    \vdots \\
    b_{m} \\
    \end{pmatrix}
\qquad
\boldsymbol{x} =
\begin{pmatrix}
    x_{1} \\
    x_{2} \\
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

* Il sistema è **omogeneo** se tutti i termini noti sono nulli,
  quindi $\boldsymbol{b} = 0$.

* Il sistema è **normale** o **quadrato** se $m = n$ cioè se il
  numero di equazioni è uguale al numero di incognite.

* Il sistema è **sottodeterminato** se $m < n$ cioè se le equazioni
  sono meno delle incognite.

* Il sistema è **sovradimensionato** se $m > n$ cioè se le equazioni
  sono più delle incognite.

## Condizioni di esistenza e di unicità di soluzioni

* Condizione necessaria e sufficiente dell'esistenza di soluzioni:

  La matrice dei coefficienti $A$ e la matrice completa del sistema
  $C = (A \, | \, \boldsymbol{b})$ devono avere lo stesso rango.[^th_esistenza]

Tale teorema garantisce che un sistema omogeneo ammette sempre almeno
una soluzione. Infatti quando $\boldsymbol{b} = 0$ il rango della
matrice dei coefficienti $A$ è uguale a quello della matrice completa
$C$ ed esiste almeno la soluzione $\boldsymbol{x} = 0$.

* Condizione necessaria dell'unicità della soluzione:

  Il sistema deve essere normale.[^unicità]

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

[^th_esistenza]: Galligani, 2.2, Teorema 1 (p. 45)
[^unicità]: Galligani, 2.2 (p. 47)

## Sistemi normali

Data una matrice $A$ $(n \times n)$, le seguenti tre proposizioni
sono equivalenti:[^th_singolare_1]

* Il sistema omogeneo $A \, \boldsymbol{x} = 0$ ammette soltanto la soluzione
  nulla $\boldsymbol{x} = 0$.

* Per ogni vettore dei termini noti $\boldsymbol{b}$ il sistema
  $A \, \boldsymbol{x} = \boldsymbol{b}$ ammette una unica soluzione.

* $A$ non è singolare.

  Cioè $A$ è una matrice quadrata con rango massimo.

Data una matrice $A$ $(n \times n)$ allora il sistema omogeneo
$A \, \boldsymbol{x} = \boldsymbol{b} = 0$ ammette una soluzione non nulla,
$\boldsymbol{x} \neq 0$ se e solo se la matrice $A$ è singolare.[^th_singolare_2]

    ...

[^th_singolare_1]: Galligani, 2.2, Teorema 2 (p. 48)
[^th_singolare_2]: Galligani, 2.2, Teorema 3 (p. 48)

## Ben posizione

Nel 1923, J. Hadamard dette la seguente definizione di problema ben posto:

1. Esiste una soluzione del problema (esistenza).
2. La soluzione è unica (unicità).
3. La soluzione dipende con continuità dai dati (stabilità).

Viceversa, un problema si dice mal posto quando non verifica una di
queste condizioni.

La condizione di stabilità implica che piccole perturbazioni dei dati del
problema non provochino significative variazioni del risultato del problema.

Esempio
:   Qualunque studio sulla matrice di Hilbert che richieda la memorizzazione
    della matrice è un problema mal posto, in quanto si commette un errore sui
    dati iniziali.

:   Non si sta infatti operando sulla matrice di Hilbert $H_{n}$ bensì una
    matrice $G_{n}$ i cui elementi sono perturbati sull'ultima cifra decimale.

:   Infatti supponendo che il metodo risolutore adottato non provochi alcun
    errore di arrotondamento il risultato sarà relativo al dato $G_{n}$.

## Risoluzione di particolari sistemi lineari

Consideriamo sistemi di equazioni lineari normali e con matrice dei
coefficienti non singolare.

### Matrice dei coefficienti generica[^risoluzione_generica]

Dato un sistema lineare $A \, \boldsymbol{x} = \boldsymbol{b}$,
essendo $A$ non singolare, esso ammette un'unica soluzione
qualunque sia il vettore $\boldsymbol{b}$:

$$
\boldsymbol{x} = A^{-1} \, \boldsymbol{b}
$$

Pertanto se la matrice inversa $A^{-1}$ è nota la soluzione del sistema
si ottiene facilmente moltiplicando una matrice per un vettore.

Tuttavia, ad eccezione di alcuni casi particolari, è generalmente difficile
determinare la matrice $A^{-1}$.

### Matrice dei coefficienti diagonale[^risoluzione_diagonale]

In tal caso è immediato il calcolo di
$\boldsymbol{x} = A^{-1} \, \boldsymbol{b}$.

$$
A =
\begin{pmatrix}
    a_{11} & 0       & \ldots & 0      \\
    0      & a_{22}  & \ldots & 0      \\
    \ldots & \ldots  & \ldots & \ldots \\
    0      & 0       & \ldots & a_{nn} \\
\end{pmatrix}
\qquad
A^{-1} =
\begin{pmatrix}
    \dfrac{1}{a_{11}} & 0                  & \ldots & 0                 \\[2ex]
    0                 & \dfrac{1}{a_{22}}  & \ldots & 0                 \\[2ex]
    \ldots            & \ldots             & \ldots & \ldots            \\[2ex]
    0                 & 0                  & \ldots & \dfrac{1}{a_{nn}} \\[2ex]
\end{pmatrix}
$$

$$
\boldsymbol{x} =
\begin{pmatrix}
    x_{1}  \\[2ex]
    x_{2}  \\[2ex]
    \ldots \\[2ex]
    x_{n}  \\[2ex]
\end{pmatrix}
 =
\begin{pmatrix}
    \dfrac{1}{a_{11}} & 0                  & \ldots & 0                 \\[2ex]
    0                 & \dfrac{1}{a_{22}}  & \ldots & 0                 \\[2ex]
    \ldots            & \ldots             & \ldots & \ldots            \\[2ex]
    0                 & 0                  & \ldots & \dfrac{1}{a_{nn}} \\[2ex]
\end{pmatrix}
\begin{pmatrix}
    b_{1}  \\[2ex]
    b_{2}  \\[2ex]
    \ldots \\[2ex]
    b_{n}  \\[2ex]
\end{pmatrix}
 =
\begin{pmatrix}
    \dfrac{b_{1}}{a_{11}} \\[2ex]
    \dfrac{b_{2}}{a_{22}} \\[2ex]
    \ldots                \\[2ex]
    \dfrac{b_{n}}{a_{nn}} \\[2ex]
\end{pmatrix}
$$

Pseudocodice
:   Se si esprime la matrice $A$ come un vettore $\boldsymbol{a}$ formato
    dagli elementi diagonali della matrice allora:

:   $$
    \left| \,
    \begin{aligned}
        \text{per $i = 1, 2, \ldots n$} \\
        \qquad x_{i} \leftarrow a_{i} / b_{i}
    \end{aligned}
    \right.
    $$

:   ```python
       def solve_diag(as, bs):
           return [b / a
                  for a, b in zip(as, bs)]
    ```

### Matrice dei coefficienti triangolare inferiore[^risoluzione_triangolare]

Il sistema assume la seguente forma:

$$
\left\{
\begin{array}{c c c c c c c c c}
    a_{11} \, x_{1} &   &                 &   &        &   &                 & = & b_{1}  \\
    a_{21} \, x_{1} & + & a_{22} \, x_{2} &   &        &   &                 & = & b_{2}  \\
    \vdots          &   & \vdots          &   & \vdots &   &                 &   & \vdots \\
    a_{n1} \, x_{1} & + & a_{n2} \, x_{2} & + & \ldots & + & a_{nn} \, x_{n} & = & b_{n}  \\
\end{array}
\right.
$$

E si ricavano le seguenti formule ricorsive per la risoluzione:

$$
\left\{
\begin{array}{c c}
    x_{1} = & \dfrac{b_{1}}{a_{11}}          \\
    x_{k} = & \dfrac{b_{k} \,
                     - a_{k1} \, x_{1} \,
                     - a_{k2} \, x_{2} \,
                     - \ldots \,
                     - a_{k k-1} \, x_{k-1}}
                    {a_{kk}}                 \\
\end{array}
\right.
$$

Pseudocodice
:   Forward substitution. Complessità: $O \left( \dfrac{n^{2}}{2} \right)$.

:   $$
    \begin{aligned}
        &
        \left| \,
        \begin{aligned}
            & \text{per $i = 1, 2, \ldots n$} \\
            & \qquad \sum_{j=1}^{i} a_{ij} \, x_{ij} = b_{i}
        \end{aligned}
        \right.
        \quad \Longrightarrow \quad
        \left| \,
        \begin{aligned}
            & \text{per $i = 1 \ldots n$} \\
            & \qquad a_{ii} \, x_{i} + \sum_{j=1}^{i-1} a_{ij} \, x_{ij} = b_{i}
        \end{aligned}
        \right.
        \\[2.5ex]
        \Longrightarrow \quad &
        \left| \,
        \begin{aligned}
            & \text{per $i = 1 \ldots n$} \\
            & \qquad x_{i} = \dfrac{b_{i} - \sum_{j=1}^{i-1} a_{ij} \, x_{ij}}{a_{ii}}
        \end{aligned}
        \right.
    \end{aligned}
    $$

:    ```
     per i = 1 .. n
             x[i] <- b[i]
             per j = 1 .. i - 1
                     x[i] <- x[i] - a[i,j] * x[j]
             x[i] <- x[i] / a[i,j]
     ```

### Matrice dei coefficienti triangolare superiore[^risoluzione_triangolare]

Il sistema assume la seguente forma:

$$
\left\{
\begin{array}{c c c c c c c c c}
    a_{11} \, x_{1} & + & a_{12} \, x_{2} & + & \ldots & + & a_{1n} \, x_{n} & = & b_{1}  \\
                    & + & a_{22} \, x_{2} & + & \ldots & + & a_{2n} \, x_{n} & = & b_{2}  \\
                    &   &                 &   & \vdots &   & \vdots          &   & \vdots \\
                    &   &                 &   &        &   & a_{nn} \, x_{n} & = & b_{n}  \\
\end{array}
\right.
$$

E si ricavano le seguenti formule ricorsive per la risoluzione:

$$
\left\{
\begin{array}{c c}
    x_{n} = & \dfrac{b_{n}}{a_{nn}}          \\
    x_{k} = & \dfrac{b_{k} \,
                     - a_{k k+1} \, x_{k+1} \,
                     - a_{k k+2} \, x_{k+2} \,
                     - \, \ldots
                     - a_{kn} \, x_{n}}
                    {a_{kk}}                 \\
\end{array}
\right.
$$

Pseudocodice
:   Backward substitution. Complessità: $O \left( \dfrac{n^{2}}{2} \right)$.

:   $$
    \begin{aligned}
        &
        \left| \,
        \begin{aligned}
            & \text{per $i = 1, 2, \ldots n$} \\
            & \qquad \sum_{j=1}^{n} a_{ij} \, x_{ij} = b_{i}
        \end{aligned}
        \right.
        \quad \Longrightarrow \quad
        \left| \,
        \begin{aligned}
            & \text{per $i = 1 \ldots n$} \\
            & \qquad a_{ii} \, x_{i} + \sum_{j=1+1}^{n} a_{ij} \, x_{ij} = b_{i}
        \end{aligned}
        \right.
        \\[2.5ex]
        \Longrightarrow \quad &
        \left| \,
        \begin{aligned}
            & \text{per $i = 1 \ldots n$} \\
            & \qquad x_{i} = \dfrac{b_{i} - \sum_{j=1}^{i-1} a_{ij} \, x_{ij}}{a_{ii}}
        \end{aligned}
        \right.
    \end{aligned}
    $$

:   ```
    per i = n .. 1
            x[i] <- b[i]
            per j = i + 1 .. n
                    x[i] <- x[i] - a[i,j] * x[j]
            x[i] <- x[i] / a[i,j]
    ```

### Matrice dei coefficienti tridiagonale[^risoluzione_tridiagonale]

    ...

[^risoluzione_generica]: Galligani, 2.4 a) (p. 52)
[^risoluzione_diagonale]: Galligani, 2.4 b) (p. 53)
[^risoluzione_triangolare]: Galligani, 2.4 c) (p. 54)
[^risoluzione_tridiagonale]: Galligani, 2.4 d) (p. 57)

## Fattorizzazione

Una matrice quadrata $A$ di ordine $n$ si può fattorizzare nel prodotto
di una matrice $L$ $n \times n$ triangolare inferiore e una matrice $U$
$n \times n$ triangolare superiore.

Dato il sistema lineare $A \, \boldsymbol{x} = \boldsymbol{b}$, $A$ si
può fattorizzare nel prodotto $A = L \, U$.

Quindi:

$$
A \, \boldsymbol{x} = \boldsymbol{b}
\qquad
A = L \, U
\qquad
L \, U \, \boldsymbol{x} = \boldsymbol{b}
$$

$$
\left\{
\begin{array}{c c c}
    L \, \boldsymbol{y} & = & \boldsymbol{b} \\
    U \, \boldsymbol{x} & = & \boldsymbol{y} \\
\end{array}
\right.
\qquad
\left\{
\begin{array}{c c c}
    \boldsymbol{b} & = & L \, \boldsymbol{y} \\
    \boldsymbol{y} & = & U \, \boldsymbol{x} \\
\end{array}
\right.
$$

La matrice $A$ è fattorizzabile se e solo se i propri minori principali
di testa sono tutti diversi da zero.

Minore
:   Determinante di una sottomatrice quadrata.

Matrice principale
:   Una matrice $B$ è matrice principale di $A$ se gli elementi della
    diagonale principale di $B$ sono elementi della diagonale principale di $A$.

Matrice principale di testa
:   Una matrice principale $B$ di $A$ in cui gli elementi di $B$ hanno gli stessi
    indici degli elementi di $A$.

Esempio di matrice principale di testa
:   $$
    A =
    \left(
    \begin{array}{c c}
        \begin{array}{c | c |}
            a_{11} & a_{12} \\
            \hline
        \end{array}
        &
        \begin{array}{c}
            a_{13} \\
        \end{array}
        \\
        \begin{array}{c c |}
            a_{21} & a_{22} \\
            \hline
        \end{array}
        &
        \begin{array}{c}
            a_{23} \\
        \end{array}
        \\
        \begin{array}{c c}
            a_{31} & a_{32} \\
        \end{array}
        &
        \begin{array}{c}
            a_{33} \\
        \end{array}
    \end{array}
    \right)
    $$

:   $$
    B =
    \begin{pmatrix}
        a_{11}
    \end{pmatrix}
    \qquad
    C =
    \begin{pmatrix}
        a_{11} & a_{12} \\
        a_{21} & a_{22} \\
    \end{pmatrix}
    $$

: $B$ e $C$ sono matrici principali di testa di $A$.

Esempio sulla condizione di fattorizzazione
:   Data la matrice $A$ e la propria sottomatrice principale di testa $B$:

:   $$
    A =
    \begin{pmatrix}
        0  & 10 \\
        -1 & 2  \\
    \end{pmatrix}
    \qquad
    B =
    \begin{pmatrix}
        0
    \end{pmatrix}
    $$

: Si nota che $det(A) \neq 0$, tuttavia $det(B) = 0$. Quindi $A$ non è
  fattorizzabile.

### Matrici di permutazione

Si può trasformare una matrice $A$ moltiplicandola per una matrice
di permutazione $P$.

$$
A =
\begin{pmatrix}
    0  & 10 \\
    -1 & 2  \\
\end{pmatrix}
\qquad
P =
\begin{pmatrix}
    0 & 1 \\
    1 & 0 \\
\end{pmatrix}
$$

$$
B = P \, A =
\begin{pmatrix}
    0 & 1 \\
    1 & 0 \\
\end{pmatrix}
\begin{pmatrix}
    0  & 10 \\
    -1 & 2  \\
\end{pmatrix}
 =
\begin{pmatrix}
    -1 & 2  \\
    0  & 10 \\
\end{pmatrix}
$$

$B$ è una matrice permutata di $A$.

Se $A$ è una matrice singolare esiste sempre una matrice
permutata di $A$ fattorizzabile.

È fondamentale premoltiplicare la matrice $A$ per la matrice di
permutazione $P$:

$$
A\, \boldsymbol{x} = \boldsymbol{b}
\qquad
P \, A \, \boldsymbol{x} = P \, A
$$

$$
\begin{aligned}
\boldsymbol{x} & = (P \, A)^{-1}                             \\
               & = A^{-1} \, (P^{-1} \, P) \, \boldsymbol{b} \\
               & = A^{-1} \, I \, \boldsymbol{b}             \\
               & = A^{-1} \, \boldsymbol{b}                  \\
\end{aligned}
$$

## Metodo di eliminazione di Gauss

Permette di risolvere in modo efficiente qualunque sistema normale con
matrice dei coefficienti non singolare e non avente alcuna speciale struttura.

# Glossario

## Matrici notevoli

### Matrice triangolare

$$
A =
\begin{pmatrix}
    a_{11} & 0       & \ldots & 0      \\
    0      & a_{22}  & \ldots & 0      \\
    \ldots & \ldots  & \ldots & \ldots \\
    0      & 0       & \ldots & a_{nn} \\
\end{pmatrix}
\qquad
A^{-1} =
\begin{pmatrix}
    \dfrac{1}{a_{11}} & 0                  & \ldots & 0                 \\[2ex]
    0                 & \dfrac{1}{a_{22}}  & \ldots & 0                 \\[2ex]
    \ldots            & \ldots             & \ldots & \ldots            \\[2ex]
    0                 & 0                  & \ldots & \dfrac{1}{a_{nn}} \\[2ex]
\end{pmatrix}
$$

### Matrice di Hilbert

$$
h_{i j} = \frac{1}{i + j - 1},
\qquad
i = 1, 2, \ldots, n
\quad
j = 1, 2, \ldots, n
$$

$$
H_{5} =
\begin{pmatrix}
    1            & \dfrac{1}{2} & \dfrac{1}{3} & \dfrac{1}{4} & \dfrac{1}{5} \\[2ex]
    \dfrac{1}{2} & \dfrac{1}{3} & \dfrac{1}{4} & \dfrac{1}{5} & \dfrac{1}{6} \\[2ex]
    \dfrac{1}{3} & \dfrac{1}{4} & \dfrac{1}{5} & \dfrac{1}{6} & \dfrac{1}{7} \\[2ex]
    \dfrac{1}{4} & \dfrac{1}{5} & \dfrac{1}{6} & \dfrac{1}{7} & \dfrac{1}{8} \\[2ex]
    \dfrac{1}{5} & \dfrac{1}{6} & \dfrac{1}{7} & \dfrac{1}{8} & \dfrac{1}{9} \\[2ex]
\end{pmatrix}
$$

## Matrici

### Matrice invertibile

Una matrice quadrata è invertibile se possiede una matrice inversa
(l'elemento inverso per l'operazione di composizione).

Una matrice è invertibile se e solo se il suo determinante è invertibile.

### Matrice singolare

Una matrice singolare è una matrice quadrata con determinante uguale
a zero, oppure, analogamente, una matrice quadrata il cui rango non
è massimo.

In particolare, nessuna matrice singolare è invertibile.

### Inversione del prodotto di due matrici

$$
(A \, B)^{-1} = B^{-1} \, A^{-1}
$$

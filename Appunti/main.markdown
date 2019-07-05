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

## Norme di vettori e matrici

    ...

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

## Condizionamento

Prima di risolvere un sistema è opportuno studiare il condizionamento del
problema, cioè la stabilità del sistema, valutando la variazione della
soluzione ottenuta dovuta alla perturbazione dei dati.

Quando si rappresenta un numero in macchina bisogna considerare l'errore
dovuto alla rappresentazione stessa.

È dato il sistema $A \, \boldsymbol{x} = \boldsymbol{b}$ con
$A \in \mathbb{R}^{n \times n}$, $det(A) \neq 0$,
$\boldsymbol{x}, \boldsymbol{b} \in \mathbb{R}^{n}$.

Tale sistema in macchina è in realtà rappresentato come:

$$
(A + \delta A) (\boldsymbol{x} + \delta \boldsymbol{x})
= \boldsymbol{b} + \delta \boldsymbol{b}
$$

Per semplificare consideriamo una perturbazione applicata solo sui vettori
$\boldsymbol{x}$ e $\boldsymbol{b}$, quindi:

$$
\begin{aligned}
    A \, (\boldsymbol{x} + \delta \boldsymbol{x})
    & = \boldsymbol{b} + \delta \boldsymbol{b}                         \\
    A \, \boldsymbol{x} + A \, \delta \boldsymbol{x}
    & = \boldsymbol{b} + \delta \boldsymbol{b}                         \\
    A \, \delta \boldsymbol{x} & = \delta \boldsymbol{b}
    & \qquad \qquad \text{perché } A\, \boldsymbol{x} = \boldsymbol{b} \\
    A^{-1} \, A \, \delta \boldsymbol{x}
    & = A^{-1} \, \delta \boldsymbol{b}
    & \qquad \qquad \text{si moltiplica per } A^{-1}                   \\
    I \, \delta \boldsymbol{x}
    & = A^{-1} \, \delta \boldsymbol{b}                                \\
    \delta \boldsymbol{x} & = A^{-1} \delta \boldsymbol{b}
\end{aligned}
$$

Si è appena trovato un legame tra l'errore sulla soluzione e
l'errore sui dati. Infatti l'errore sul vettore $\boldsymbol{x}$
dipende dall'errore sul vettore $\boldsymbol{b}$.

Per semplicità si esprime il risultato appena ottenuto mediante
le rispettive norme:

$$
\left\lVert \delta \boldsymbol{x} \right\rVert
\, = \, \left\lVert A^{-1} \delta \boldsymbol{b} \right\rVert
$$

Poiché $A \in \mathbb{R}^{n \times n}$ e $\boldsymbol{x} \in \mathbb{R}^{n}$,
vale la norma indotta:

$$
\begin{aligned}
    \left\lVert A^{-1} \delta \boldsymbol{b} \right\rVert
    & \leq \left\lVert A^{-1} \right\rVert
         \left\lVert \delta \boldsymbol{b} \right\rVert    \\[1ex]
    \left\lVert \delta \boldsymbol{x} \right\rVert
    & \leq \left\lVert A^{-1} \right\rVert
         \left\lVert \delta \boldsymbol{b} \right\rVert    \\[1ex]
\end{aligned}
$$

E anche:

$$
\begin{aligned}
    \left\lVert \boldsymbol{b} \right\rVert
    & = \left\lVert A \, \boldsymbol{x} \right\rVert  \\[1ex]
    \left\lVert A \, \boldsymbol{x} \right\rVert
    & \leq \left\lVert A \right\rVert
           \left\lVert \boldsymbol{x} \right\rVert    \\[1ex]
    \left\lVert \boldsymbol{b} \right\rVert
    & \leq \left\lVert A \right\rVert
           \left\lVert \boldsymbol{x} \right\rVert    \\[1ex]
\end{aligned}
$$

Allora:

$$
\begin{aligned}
    \left\lVert \delta \boldsymbol{x} \right\rVert
    & \leq \left\lVert A^{-1} \right\rVert
    \left\lVert \delta \boldsymbol{b} \right\rVert                                                                                  \\[2ex]
    \dfrac{\left\lVert \delta \boldsymbol{x} \right\rVert}
          {\left\lVert A \right\rVert \left\lVert \boldsymbol{x} \right\rVert}
    & \leq \dfrac{\left\lVert A^{-1} \right\rVert \left\lVert \delta \boldsymbol{b} \right\rVert}
                 {\left\lVert \boldsymbol{b} \right\rVert}
    & \qquad \qquad \text{si rapporta a }
                    \left\lVert A \right\rVert \left\lVert \boldsymbol{x} \right\rVert \geq \left\lVert \boldsymbol{b} \right\rVert \\[2ex]
    \dfrac{\left\lVert \delta \boldsymbol{x} \right\rVert}
          {\left\lVert \boldsymbol{x} \right\rVert}
    & \leq \left\lVert A \right\rVert \left\lVert A^{-1} \right\rVert
    \dfrac{\left\lVert \delta \boldsymbol{b} \right\rVert}
          {\left\lVert \boldsymbol{b} \right\rVert}
    & \qquad \qquad \text{si moltiplicano entrambi i membri per } \left\lVert A \right\rVert                                        \\[2ex]
\end{aligned}
$$

Si definisce l'**errore relativo su $\boldsymbol{x}$** $\varepsilon_{x}$
e l'**errore relativo su $\boldsymbol{b}$** $\varepsilon_{b}$:

$$
\varepsilon_{x} =
\dfrac{\left\lVert \delta \boldsymbol{x} \right\rVert}
      {\left\lVert \boldsymbol{x} \right\rVert}
\qquad \qquad \qquad
\varepsilon_{b} =
\dfrac{\left\lVert \delta \boldsymbol{b} \right\rVert}
      {\left\lVert \boldsymbol{b} \right\rVert}
$$

E vale la relazione:

$$
\varepsilon_{x}
\, \leq \,
\left\lVert A \right\rVert \left\lVert A^{-1} \right\rVert
\, \varepsilon_{b}
$$

Si definisce l'**indice di condizionamento**:

$$
\mu(A) = cond(A) =
\left\lVert A \right\rVert \left\lVert A^{-1} \right\rVert
$$

L'indice di condizionamento è sempre maggiore o uguale a $1$.

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

Questi teoremi permettono di ottenere alcune proposizioni sulla matrice
inversa:[^th_inversa]

* Date due matrici quadrate di ordine $n$ $A$ e $B$ tali che $A \, B = I$,
  allora $B = A^{-1}$ e $B \, A = I$.

* Date due matrici quadrate di ordine $n$, la matrice $A \, B$ è non singolare
  se e solo se $A$ e $B$ sono non singolari.

* Data $T$ una matrice triangolare superiore $n \times n$, essa è non singolare
  se e solo se i propri elementi diagonali sono diversi da zero. La matrice
  $T^{-1}$ è la diagonale superiore.

[^th_singolare_1]: Galligani, 2.2, Teorema 2 (p. 48)
[^th_singolare_2]: Galligani, 2.2, Teorema 3 (p. 48)
[^th_inversa]: Galligani, 2.2, e) (p. 49)

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

### Metodo di eliminazione di Gauss

Data una matrice $A^{(1)}$ si individua una matrice di permutazione
$L^{(1)}$ che porta a zero gli elementi sottodiagonali appartenenti
alla prima colonna, trasformando $A^{(1)}$ in $A^{(2)}$.

$$
\begin{aligned}
    A^{(2)} = L^{(1)} \, A^{(1)}
    & =
    \begin{pmatrix}
        1       & 0 & 0 \\[2ex]
        -m_{21} & 1 & 0 \\[2ex]
        -m_{31} & 0 & 1 \\[2ex]
    \end{pmatrix}
    \begin{pmatrix}
        a_{11}^{(1)} & a_{12}^{(1)} & a_{13}^{(1)} & b_{1}^{(1)} \\[2ex]
        a_{21}^{(1)} & a_{22}^{(1)} & a_{23}^{(1)} & b_{2}^{(1)} \\[2ex]
        a_{31}^{(1)} & a_{32}^{(1)} & a_{23}^{(1)} & b_{2}^{(1)} \\[2ex]
    \end{pmatrix}
    \\
    & =
    \begin{pmatrix}
        a_{11}^{(1)}                          & a_{12}^{(1)}                          & a_{13}^{(1)}                          & b_{1}^{(1)}                         \\[2ex]
        a_{21}^{(1)} - m_{21} \, a_{11}^{(1)} & a_{22}^{(1)} - m_{21} \, a_{12}^{(1)} & a_{23}^{(1)} - m_{21} \, a_{13}^{(1)} & b_{2}^{(1)} - m_{21} \, b_{1}^{(1)} \\[2ex]
        a_{31}^{(1)} - m_{31} \, a_{11}^{(1)} & a_{32}^{(1)} - m_{31} \, a_{12}^{(1)} & a_{33}^{(1)} - m_{31} \, a_{13}^{(1)} & b_{3}^{(1)} - m_{31} \, b_{1}^{(1)} \\[2ex]
    \end{pmatrix}
    \\
    & =
    \begin{pmatrix}
        a_{11}^{(1)} & a_{12}^{(1)} & a_{13}^{(1)} & b_{1}^{(1)} \\[2ex]
        0            & a_{22}^{(2)} & a_{23}^{(2)} & b_{2}^{(2)} \\[2ex]
        0            & a_{32}^{(1)} & a_{33}^{(2)} & b_{3}^{(2)} \\[2ex]
    \end{pmatrix}
\end{aligned}
$$

Poiché si vuole che gli elementi sottodiagonali della prima colonna
siano zero ($a_{21}, a_{31}, \ldots ,a_{i1}$), si impone che:

$$
\begin{aligned}
    a_{21}^{(1)} - m_{21} \, a_{11}^{(1)} = 0 & \quad \Longrightarrow \quad m_{21} = \dfrac{a_{21}^{(1)}}{a_{11}^{(1)}} \\[2ex]
    a_{31}^{(1)} - m_{31} \, a_{11}^{(1)} = 0 & \quad \Longrightarrow \quad m_{31} = \dfrac{a_{31}^{(1)}}{a_{11}^{(1)}} \\[2ex]
\end{aligned}
$$

Più generalmente per la prima colonna:

$$
m_{i1} = \dfrac{a_{i1}^{(1)}}{a_{11}^{(1)}}
\qquad
i = 2, 3, \ldots, n
$$

Si può quindi definire una generica matrice di permutazione $L^{(k)}$ che
azzera gli elementi sottodiagonali di una generica colonna che prende il
nome di trasformazione elementare di Gauss:

$$
L^{(k)} =
\begin{pmatrix}
    1      & 0      & \ldots & 0          & \ldots & 0      \\
    0      & 1      & \ldots & 0          & \ldots & 0      \\
    \ldots & \ldots & \ldots & \ldots     & \ldots & \ldots \\
    0      & 0      & \ldots & 1          & \ldots & 0      \\
    0      & 0      & \ldots & -m_{k+1 k} & \ldots & 0      \\
    \ldots & \ldots & \ldots & \ldots     & \ldots & \ldots \\
    0      & 0      & \ldots & -m_{nk}    & \ldots & 1      \\
\end{pmatrix}
\qquad \qquad
\begin{aligned}
    m_{ik} = \dfrac{a_{ik}^{(k)}}{a_{kk}^{(k)}}
    \qquad
    i = k + 1, k + 2, \ldots, n
    \\[2ex]
    a_{ij}^{k+1}
    = \left\{
    \begin{aligned}
        & a_{ij}^{(k)}                       & \quad \text{se } i \leq k \\[2ex]
        & a_{ij}^{(k)} - m_{ik} a_{kj}^{(k)} & \quad \text{se } i > k    \\[2ex]
    \end{aligned}
    \right.
\end{aligned}
$$

Le iterazioni totali per costruire tutte le matrici di permutazione
$L^{(k)}$ sono $n-1$ in quanto l'ultima colonna non ha elementi
sottodiagonali.

$$
\begin{aligned}
    L & \, = \, L^{(n-1)} \, \ldots \, L^{(2)} \, L^{(1)} \\
    U & \, = \, A^{(n-1)} \\
      & \, = \, L \, A \, = \, L^{(n-1)} \, \ldots \, L^{(2)} \, L^{(1)} \, A
\end{aligned}
$$

L'algoritmo ha una complessità di $O\left(\dfrac{n^{3}}{3}\right)$.

### Metodo di eliminazione di Gauss con scambio delle righe

    ...

## Metodi iterativi

Dato un sistema lineare $A \, \boldsymbol{x} = \boldsymbol{b}$ dove $A$ è una
matrice non singolare, si esprime $A$ come differenza tra due matrici $M$ e $N$
dove $M$ è una matrice non singolare:

$$
\begin{aligned}
    A \, \boldsymbol{x} & = \boldsymbol{b}                       \\
    (M - N) \, \boldsymbol{x} & = \boldsymbol{b}                 \\
    M \, \boldsymbol{x} - N \, \boldsymbol{x} & = \boldsymbol{b} \\
    M \, \boldsymbol{x} & = N \, \boldsymbol{x} + \boldsymbol{b} \\
\end{aligned}
$$

quindi:

$$
\boldsymbol{x} = M^{-1} N \, \boldsymbol{x} + M^{-1} \, \boldsymbol{b}
$$

Si considera $M^{-1} \, N = P$ e $M^{-1} \, \boldsymbol{b} = \boldsymbol{q}$
e si ottiene quindi:

$$
\boldsymbol{x} = P \, \boldsymbol{x} + \boldsymbol{q}
$$

Dato un vettore iniziale $\boldsymbol{x}^{(0)}$, si considera la successione
$\boldsymbol{x}^{(1)}, \boldsymbol{x}^{(2)}, \ldots$ così definita:

$$
\boldsymbol{x}^{(k)} = P \, \boldsymbol{x}^{(k-1)} + \boldsymbol{q}
\qquad
\text{con } k = 1, 2, \ldots
$$

La successione di tutti gli elementi $\boldsymbol{x}^{(k)}$ si dice convergente
al vettore $\boldsymbol{x}^{*}$ e si indica:

$$
\boldsymbol{x}^{*} = \lim_{k \to \infty} \boldsymbol{x}^{(k)}
$$

se al tendere di $k$ a infinito le componenti di $\boldsymbol{x}^{(k)}$
convergono alle corrispondenti componenti di $\boldsymbol{x}^{(k)}$.
In tal caso:

$$
\boldsymbol{x}^{*} = P \, \boldsymbol{x}^{*} + \boldsymbol{q}
$$

e cioè $\boldsymbol{x}^{*}$ è la soluzione del sistema
$\boldsymbol{x}^{(k)} = P \, \boldsymbol{(k-1)} + \boldsymbol{q}$
e quindi anche del sistema $A \, \boldsymbol{x} = \boldsymbol{b}$.

Si individua quindi un metodo iterativo in cui a partire da un vettore
iniziale $\boldsymbol{x}^{(0)}$, la soluzione viene approssimata utilizzando
una successione $\boldsymbol{x}^{(k)}$ di vettori.

La matrice $P$ si dice **matrice di iterazione**.

Al variare del vettore iniziale $\boldsymbol{x}^{(0)}$ si ottengono diverse
successioni $\boldsymbol{x}^{(k)}$, alcune delle quali possono essere
convergenti e altre no.

Un metodo iterativo è **convergente** se qualunque sia il vattore iniziale la
successione converge.

Teorema della convergenza
:   Se esiste una norma matriciale indotta $\left\lVert \cdot \right\rVert$
    per cui $\left\lVert P \right\rVert$ < 1 allora il metodo iterativo è
    convergente.

:   Si dimostra. Dati:

:   $$
    \begin{aligned}
    \boldsymbol{x}^{(k)} = P \, \boldsymbol{x}^{(k-1)} + \boldsymbol{q} \\
    \boldsymbol{x}^{*} = P \, \boldsymbol{x}^{*} + \boldsymbol{q}
    \end{aligned}
    $$

:   Si sottrae $\boldsymbol{x}^{(k)}$ a $\boldsymbol{x}^{*}$:

:   $$
    \boldsymbol{x}^{*}- \boldsymbol{x}^{(k)} =
    P \, (\boldsymbol{x}^{*} - \boldsymbol{x}^{k-1})
    $$

:   Si indica con $\boldsymbol{e}^{(k)}$ il vettore errore alla $k$-esima iterazione:

:   $$
    \begin{aligned}
    \boldsymbol{e}^{(k)} & = \boldsymbol{x}^{*} - \boldsymbol{x}^{(k)} \\
    \boldsymbol{e}^{(k)} & = P \, \boldsymbol{e}^{(k-1)} = P^{2} \, \boldsymbol{e}^{(k-2)} = \ldots = P^{k} \, \boldsymbol{e}^{(0)} \\
    \end{aligned}
    $$

:   Passando alle norme si ha:

:   $$
    \left\lVert \boldsymbol{e}^{(k)} \right\rVert
    \, = \,
    \left\lVert P^{k} \, \boldsymbol{e}^{(0)} \right\rVert
    \, \leq \,
    \left\lVert P^{k} \right\rVert \left\lVert \boldsymbol{e}^{(0)} \right\rVert
    \, \leq \,
    \left\lVert P \right\rVert^{k} \left\lVert \boldsymbol{e}^{(0)} \right\rVert
    $$

:   Poiché $\left\lVert P \right\rVert < 1$ allora:

:   $$
    \begin{aligned}
        \lim_{k \to \infty} \left\lVert P \right\rVert^{k}                & = 0 \\
        \lim_{k \to \infty} \left\lVert \boldsymbol{e}^{(k)} \right\rVert & = 0 \\
    \end{aligned}
    $$

:   Quindi per la continuità della norma:

:   $$
    \begin{aligned}
    \lim_{k \to \infty} \boldsymbol{e}^{(k)} & = \boldsymbol{0}     \\
    \lim_{k \to \infty} \boldsymbol{x}^{(k)} & = \boldsymbol{x}^{*} \\
    \end{aligned}
    $$

È necessario fissare dei criteri di arresto per il procedimento iterativo.
Quelli usati più comunemente sono:

* $\left\lVert \boldsymbol{x}^{(k)} - \boldsymbol{x}^{(k-1)} \right\rVert \leq \varepsilon$

* $\dfrac{\left\lVert \boldsymbol{x}^{(k)} - \boldsymbol{x}^{(k-1)} \right\rVert}{\boldsymbol{x}^{(k)}} \leq \varepsilon$
  $\quad$ se $\boldsymbol{x}^{(k)} \neq \boldsymbol{0}$

Queste sono però soltanto delle condizioni di arresto e non garantiscono che
la soluzione sia approssimataq con la precisione $\varepsilon$. È necessario
comunque effettuare un controllo quando il numero di iterazioni diventa troppo
elevato.

Può accadere che un metodo iterativo convergente, a causa di errori di
arrotondamento, in pratica non converga. Ciò accade quando la matrice $A$
è malcondizionata

Può accadere che un metodo iterativo convergente, a causa di errori di
arrotondamento, in pratica non converga. Ciò accade quando la matrice $A$
è malcondizionata.

I metodi iterativi si distinguono per la particolare decomposizione della
matrice $A$.

Come visto precedentemente, si consideri $A = M - N$ e la propria ulteriore
decomposizione $A = D - B - C$, in cui:

$$
d_{ij} =
\left\{
\begin{aligned}
    & a_{ij} & \text{se } i = j    \\
    & 0      & \text{se } i \neq j \\
\end{aligned}
\right.
\qquad
b_{ij} =
\left\{
\begin{aligned}
    & -a_{ij} & \text{se } i > j    \\
    & 0       & \text{se } i \geq  j \\
\end{aligned}
\right.
\qquad
c_{ij} =
\left\{
\begin{aligned}
    & 0       & \text{se } i \geq j \\
    & -a_{ij} & \text{se } i < j    \\
\end{aligned}
\right.
$$

* Usando $M = D$ e $N = B + C$ si ottiene il **metodo di Jacobi**.

  La matrice di iterazione è $J = D^{-1} \, (B + C)$.

  Il vettore risultato è $\boldsymbol{x}^{(k)} = J \, \boldsymbol{x}^{(k-1)} + D^{-1} \, \boldsymbol{b}$.

  Il metodo di Jacobi è anche detto **metodo degli spostamenti simultanei**
  e ad ogni iterazione le componenti del vettore $\boldsymbol{x}^{k-1}$ sono
  sostituite simultaneamente dalle componenti di $\boldsymbol{x}^{(k)}$.

  Quindi durante il processo di calcolo è necessario avere in memoria allo
  stesso tempo entrambi i vettori $\boldsymbol{x}^{(k)}$ e $\boldsymbol{x}^{(k-1)}$.

* Usando $M = D - B$ e $N = C$ si ottiene il **metodo di Gauss-Seidel**.

  La matrice di iterazione è $G = (D - B)^{-1} \, C$.

  Il vettore risultato è $\boldsymbol{x}^{(k)} = G \, \boldsymbol{x}^{(k-1)} + (D - B)^{-1} \, \boldsymbol{b}$.

  Il metodo di Gauss-Seidel è anche detto **metodo degli spostamenti successivi**
  e ad ogni iterazione le componenti del vettore $\boldsymbol{x}^{(k)}$ sono
  calcolate utilizzando anche componenti già determinate dello stesso vettore.

  Quindi durante il processo di calcolo è necessario avere in memoria soltanto
  il vettore $\boldsymbol{x}^{(k)}$.

In un metodo iterativo il costo computazione è principalmente determinato dalle
moltiplicazioni della matrice $P$ per il vettore $\boldsymbol{x}^{(k-1)}$ che
generalmente richiedono ciascuna $n^{2}$ moltiplicazioni.

Tranne che per particolari matrici $A$ (per esempio se $A$ è sparsa) il costo
computazionale è generalmente superiore rispetto ai metodi diretti.

# Interpolazione e integrazione

L'approssimazione di una funzione consiste nel determinare una funzione $g(x)$
che meglio approssima una funzione $f(x)$.

È una funzione $f(x)$, sono noti i valori $y_{i} = f(x_{i})$ che assume in
$n + 1$ punti $x_{i}$ con $i = 0, 1, \ldots, n$ appartenenti a un intervallo
$[a,b]$. Tali punti sono chiamati **nodi** o **punti base dell'interpolazione**.

È fissato un insieme di $n + 1$ funzioni $\phi_{i}(x)$ con $j = 0, 1, \ldots, n$
definite su $[a,b]$ e linearmente indipendenti.

Si vuole determinare una funzione:

$$
g(x) = \sum_{j=0}^{n} a_{j} \phi_{j}(x)
$$

che assuma nei punti $x_{i}$ gli stessi valori di $y_{i}$. Quindi
$g(x_{i}) = y_{i}$ con $i = 0, 1, \ldots, n$.

È importante individuare la classe delle funzioni $\phi_{j}(x)$ (cioè scegliere
il modello dell'approssimazione) che deve tener conto delle specifiche proprietà
della funzione $f(x)$. Le principali classi di funzioni utilizzate sono le
funzioni razionali e le funzioni trigonometriche.

Si esamina la classe delle funzioni polinomiali in cui $\phi_{j}(x) = x^{j}$ e
si può dimostrare che $g(x)$ esiste ed è unica.

## Polinomio di interpolazione

Un polinomio di grado $n$ è una funzione nella forma:

$$
p(x) = a_{0} x^{n} + a_{1} x^{n-1} + \ldots + a_{n-1} x + a_{n}
$$

Affinché il polinomio sia di grado $n$ è necessario che $a_{0} \neq 0$.
I numeri $a_{i}$ sono detti coefficienti del polinomio.

Dati gli $n + 1$ punti $(x_{i}, y_{i})$ con $i = 0, 1, \ldots, n$ tali che
$x_{i} \neq x_{j}$ per $i \neq j$, allora esiste ed è unico il polinomio
$p(x)$ di grado $n$ al più tale che $p(x_{i}) = y_{i}$ con $i = 0, 1, \ldots, n$.

## Polinomio di Lagrange

    ...

## Errore nell'interpolazione

Dato il polinomio di interpolazione $p(x)$ della funzione $f(x)$ nei punti
$x_{0}, x_{1}, \ldots, x_{n}$ si definisce la funzione errore
dell'interpolazione di $f(x)$ con il polinomio $p(x)$:

$$
r(x) = f(x) - p(x)
$$

    ...
# Glossario

## Matrici notevoli

### Matrice identica

È una matrice quadrata i cui elementi $\delta_{ij}$ sono:

$$
\delta_{ij} =
\left\{
\begin{aligned}
\, 1 & \quad \text{se } i = j    \\
\, 0 & \quad \text{se } i \neq j
\end{aligned}
\right.
$$

La matrice identica gode delle seguenti proprietà:

* $A \, I = I \, A = A$ per ogni matrice $A$
* $I \, \boldsymbol{x} = \boldsymbol{x}$ per ogni vettore $\boldsymbol{x}$

### Matrice diagonale

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

### Matrice inversa

Data una matrice $A$ $n \times n$, se esiste una matrice $B$ $n \times n$
tale che $B \, A = A \, B = I$ allora A è **invertibile** o **non singolare**
e $B$ è detta **inversa** di $A$.

Una matrice è invertibile se e solo se il proprio determinante è invertibile.

### Matrice singolare

Una matrice singolare è una matrice quadrata con determinante uguale
a zero, oppure, analogamente, una matrice quadrata il cui rango non
è massimo.

In particolare, nessuna matrice singolare è invertibile.

### Minore

Determinante di una sottomatrice quadrata.

### Matrice principale

Una matrice $B$ è matrice principale di $A$ se gli elementi della
diagonale principale di $B$ sono elementi della diagonale principale di $A$.

### Matrice principale di testa
Una matrice principale $B$ di $A$ in cui gli elementi di $B$ hanno gli stessi
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

### Inversione del prodotto di due matrici

$$
(A \, B)^{-1} = B^{-1} \, A^{-1}
$$

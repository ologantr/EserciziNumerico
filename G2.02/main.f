*     Considerare vettori con un numero n di componenti da 2 a 15,
*     le cui componenti sono punti equidistanti dell'intervallo [-1,1].
*     Calcolare le tre norme vettoriali al crescere di n e farne il
*     confronto analizzando il grafico dei risultati.

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      PROGRAM MAIN

*     Numero di componenti
      PARAMETER (N = 5)

*     Minimo e massimo dell'intervallo dei valori
      PARAMETER (VAL_MIN = -1.0)
      PARAMETER (VAL_MAX = +1.0)

      REAL V(N)
      REAL STEP

      V(1) = VAL_MIN
      V(N) = VAL_MAX

      STEP = (VAL_MAX - VAL_MIN) / (N - 1)

      DO I = 2, N - 1
         V(I) = V(I - 1) + STEP
      ENDDO

      WRITE(*,*) V

      END

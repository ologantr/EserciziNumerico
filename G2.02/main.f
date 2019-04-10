*     Considerare vettori con un numero n di componenti da 2 a 15,
*     le cui componenti sono punti equidistanti dell'intervallo [-1,1].
*     Calcolare le tre norme vettoriali al crescere di n e farne il
*     confronto analizzando il grafico dei risultati.

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     Subroutine per calcolo del vettore
      SUBROUTINE VECCOMPUTE(V, N, VAL_MIN, VAL_MAX)
      REAL V(N)
      REAL STEP

      V(1) = VAL_MIN
      V(N) = VAL_MAX

      STEP = (VAL_MAX - VAL_MIN) / (N - 1)

      DO I = 2, N - 1
         V(I) = V(I - 1) + STEP
      ENDDO
      END

*     Subroutine per stampa vettore
      SUBROUTINE PRINTVEC(V, N)
      REAL V(N)
      WRITE(*,*) (V(I), I = 1, N)
      END

*     Massimo di un vettore in valore assoluto
      REAL FUNCTION RMAXABS(V, N)
      REAL V(N)

      RMAXABS = ABS(V(1))

      DO I = 2, N
         IF (ABS(V(I)) .GT. RMAXABS) THEN
            RMAXABS = ABS(V(I))
         ENDIF
      ENDDO

      END

*     Norma 1
      REAL FUNCTION RNORM1(V, N)
      REAL V(N)
      RNORM1 = 0

      DO I = 1, N
         RNORM1 = RNORM1 + ABS(V(I))
      ENDDO
      END

*     Norma 2
      REAL FUNCTION RNORM2(V, N)
      REAL V(N)
      RNORM2 = 0

      DO I = 1, N
         RNORM2 = RNORM2 + V(I) ** 2
      ENDDO
      RNORM2 = SQRT(RNORM2)
      END

*     Norma infinito
      REAL FUNCTION RNORMINF(V, N)
      REAL V(N)
      RNORMINF = RMAXABS(V, N)
      END

*     Scrive su file i dati relativi alle norme
      SUBROUTINE COMPUTENORMS(V, N, VAL_MIN, VAL_MAX)
      REAL V(N), NORM1, NORM2, NORMINF
      DO I = 2, N
         CALL VECCOMPUTE(V, I, VAL_MIN, VAL_MAX)
         NORM1 = RNORM1(V, I)
         NORM2 = RNORM2(V, I)
         NORMINF = RNORMINF(V, I)
         WRITE(1,*) I, NORM1
         WRITE(2,*) I, NORM2
         WRITE(3,*) I, NORMINF
      ENDDO
      END


      PROGRAM MAIN

*     Numero di componenti
      PARAMETER (N = 15)

*     Minimo e massimo dell'intervallo dei valori
      PARAMETER (VAL_MIN = -1.0)
      PARAMETER (VAL_MAX = +1.0)

*     Vettore delle componenti
      REAL V(N)

*     Chiamata alla funzione per calcolo delle norme
      CALL COMPUTENORMS(V, N, VAL_MIN, VAL_MAX)

      END

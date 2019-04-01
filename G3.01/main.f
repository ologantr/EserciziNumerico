*     Confrontare su alcune matrici, con ordine n > 7, il valore delle
*     quattro norme matriciali studiate. Usare la routine della libreria
*     IMSL per il calcolo del raggio spettrale. Se non si ha a disposizione
*     la subroutine per il calcolo del raggio spettrale, considerare solo la
*     norma di Frobenius.

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     Print the values of the components indexed from 1 to N
*     of the vector V.
      SUBROUTINE VECPRINT(V, N)
      REAL V(N)
      WRITE(*,*) (V(I), I = 1, N)
      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     Print the values of the components indexed from 1 to N
*     of the vector V.
      SUBROUTINE MATPRINT(A, N)
      REAL A(N, N)

      DO J = 1, N
         WRITE(*,*) (A(I, J), I = 1, N)
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE MATHILBERT(A, N)
      REAL A(N, N)

      DO I = 1, N
         DO J = 1, N
            A(I, J) = 1.0 / (I + J - 1)
         ENDDO
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     Sum of the abs of the items of the i-th row in matrix A.
      REAL FUNCTION RSUMROW(A, N, I)
      REAL A(N, N)

      RSUMROW = 0

      DO J = 1, N
         RSUMROW = RSUMROW + ABS(A(I, J))
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     Sum of the abs of the items of the j-th column in matrix A.
      REAL FUNCTION RSUMCOL(A, N, J)
      REAL A(N, N)

      RSUMCOL = 0

      DO I = 1, N
         RSUMCOL = RSUMCOL + ABS(A(I, J))
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     .   MAX     | V  |
*     .I=1,...,N  |  I |
      REAL FUNCTION RMAXABS(V, N)
      REAL V(N)

      RMAXABS = ABS(V(1))

      DO I = 2, N
         IF (ABS(V(I)) .GT. RMAXABS) THEN
            RMAXABS = ABS(V(I))
         ENDIF
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE SUMOFROWS(V, M, N)
      REAL V(N)
      REAL M(N, N)

      DO I = 1, N
         V(I) = RSUMROW(M, N, I)
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE SUMOFCOLS(V, M, N)
      REAL V(N)
      REAL M(N, N)

      DO I = 1, N
         V(I) = RSUMCOL(M, N, I)
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     Dato che non abbiamo la IMSL, ho scelto di implementare la
*     norma di Frobenius essendo una sovrastima della norma 2
      REAL FUNCTION FROBENIUSNORM(A, N)
      REAL A(N, N), S
      S = 0
      DO I = 1, N
         DO J = 1, N
            S = S + (ABS(A(I, J))) ** 2
         ENDDO
      ENDDO
      FROBENIUSNORM = SQRT(S)
      END


*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      PROGRAM MAIN

      PARAMETER (N = 7)

      REAL A(N, N)
      REAL SUMROWS(N)
      REAL SUMCOLS(N)
      REAL MAXINROWS, MAXINCOLS

      CALL MATHILBERT(A, N)

      WRITE(*,*) 'Matrice:'
      CALL MATPRINT(A, N)

      CALL SUMOFROWS(SUMROWS, A, N)

      WRITE(*,*) 'Somma degli elementi delle singole righe:'
      CALL VECPRINT(SUMROWS, N)

      CALL SUMOFCOLS(SUMCOLS, A, N)

      WRITE(*,*) 'Sum degli elementi delle singole colonne:'
      CALL VECPRINT(SUMCOLS, N)

      MAXINROWS = RMAXABS(SUMROWS, N)
      MAXINCOLS = RMAXABS(SUMCOLS, N)

      WRITE(*,*) 'Norma 1:', MAXINROWS
      WRITE(*,*) 'Norma inf:', MAXINCOLS

      END

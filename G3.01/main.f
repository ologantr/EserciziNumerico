*     Confrontare su alcune matrici, con ordine n > 7, il valore delle
*     quattro norme matriciali studiate. Usare la routine della libreria
*     IMSL per il calcolo del raggio spettrale. Se non si ha a disposizione
*     la subroutine per il calcolo del raggio spettrale, considerare solo la
*     norma di Frobenius.

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE MATPRINT(A, N)
      REAL A(N, N)

      DO J = 1, N
         WRITE(*,*) (A(I, J), I = 1, N)
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     Generate an Hilbert matrix of N components in the space referenced
*     by A.
      SUBROUTINE MATHILBERT(A, N)
      REAL A(N, N)

      DO I = 1, N
         DO J = 1, N
            A(I, J) = 1.0 / (I + J - 1)
         ENDDO
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      REAL FUNCTION NORM_1(A, N)
      REAL A(N, N)
      REAL TMP

      NORM_1 = 0

      DO J = 1, N
         TMP = 0

*        Sum each element in a column and store the result in TMP.
         DO I = 1, N
            TMP = TMP + A(I, J)
         ENDDO

*        NORM_1 is the greatest TMP we got.
         IF (TMP .GT. NORM_1) THEN
            NORM_1 = TMP
         ENDIF
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      REAL FUNCTION NORM_2(A, N)
      REAL A(N, N)

      NORM_2 = 0

      DO I = 1, N
         DO J = 1, N
            NORM_2 = NORM_2 + (ABS(A(I, J))) ** 2
         ENDDO
      ENDDO

      NORM_2 = SQRT(NORM_2)

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      REAL FUNCTION NORM_INF(A, N)
      REAL A(N, N)
      REAL TMP

      NORM_INF = 0

      DO J = 1, N
         TMP = 0

*        Sum each element in a row and store the result in TMP.
         DO I = 1, N
            TMP = TMP + A(I, J)
         ENDDO

*        NORM_INF is the greatest TMP we got.
         IF (TMP .GT. NORM_INF) THEN
            NORM_INF = TMP
         ENDIF
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      PROGRAM MAIN

      PARAMETER (N = 7)

      REAL A(N, N)
      REAL NORM_1, NORM_2, NORM_INF

      CALL MATHILBERT(A, N)

      WRITE(*,*) 'Matrice:'
      CALL MATPRINT(A, N)

      WRITE(*,*) 'Norma 1  :', NORM_1(A, N)
      WRITE(*,*) 'Norma 2  :', NORM_2(A, N)
      WRITE(*,*) 'Norma inf:', NORM_INF(A, N)

      END

*     Confrontare su alcune matrici, con ordine n > 7, il valore delle
*     quattro norme matriciali studiate. Usare la routine della libreria
*     IMSL per il calcolo del raggio spettrale. Se non si ha a disposizione
*     la subroutine per il calcolo del raggio spettrale, considerare solo la
*     norma di Frobenius.

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE MATPRINT(A, N)
      REAL A(N, N)

      DO I = 1, N
         WRITE(*,*) (A(I, J), J = 1, N)
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

*     Generate a Wilkinson matrix of N components in the space referenced
*     by A.
      SUBROUTINE MATWILKINSON(A, N)
      REAL A(N, N), S

*     Start value for the main diagonal of the matrix (A(1, 1))
      S = -(N-1)/2.0

      DO I = 1, N
         DO J = 1, N
            A(I, J) = 0
         ENDDO
      ENDDO

      DO I = 2, N
*        Upper diagonal
         A(I-1, I) = 1

*        Lower diagonal
         A(I, I-1) = 1

*        Element of the main diagonal starting from A(1, 1)
*        I - 2 is the offset for each element starting from S
*        Absolute value is needed so all values are positive
         A(I-1, I-1) = ABS(S + I - 2)
      ENDDO

*     To avoid an out-of-range assignment (A(N+1,N+1)), it is
*     better to stop the DO cycle one element earlier and manually
*     assign the A(N, N) element to -S (ABS(S))
      A(N, N) = -S

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     Generate a Toeplitz matrix of N components in the space referenced
*     by A
      SUBROUTINE MATTOEPLITZ(A, N)
      REAL A(N, N)

      DO I = 1, N
         DO J = N, I, -1
            A(I, J) = J - I + 1
         ENDDO
      ENDDO

      DO I = 2, N
         DO J = 1, I - 1
            A(I, J) = I - J + 1
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
            NORM_2 = NORM_2 + A(I, J) * A(I, J)
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

      REAL A(N, N), B(N, N), C(N, N)
      REAL NORM_1, NORM_2, NORM_INF

      CALL MATHILBERT(A, N)
      CALL MATWILKINSON(B, N)
      CALL MATTOEPLITZ(C, N)

      WRITE(*,*) 'Matrice di Hilbert:'
      CALL MATPRINT(A, N)

      WRITE(*,*) 'Matrice di Wilkinson:'
      CALL MATPRINT(B, N)

      WRITE(*,*) 'Matrice di Toeplitz:'
      CALL MATPRINT(C, N)

      WRITE(*,*) 'Matrice A (Hilbert):'
      WRITE(*,*) 'Norma 1  :', NORM_1(A, N)
      WRITE(*,*) 'Norma 2  :', NORM_2(A, N)
      WRITE(*,*) 'Norma inf:', NORM_INF(A, N)

      WRITE(*,*) 'Matrice B (Wilkinson):'
      WRITE(*,*) 'Norma 1  :', NORM_1(B, N)
      WRITE(*,*) 'Norma 2  :', NORM_2(B, N)
      WRITE(*,*) 'Norma inf:', NORM_INF(B, N)

      WRITE(*,*) 'Matrice C (Toeplitz):'
      WRITE(*,*) 'Norma 1  :', NORM_1(C, N)
      WRITE(*,*) 'Norma 2  :', NORM_2(C, N)
      WRITE(*,*) 'Norma inf:', NORM_INF(C, N)

      END

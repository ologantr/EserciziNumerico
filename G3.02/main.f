*     Fare il grafico dell'andamento delle norme matriciali di
*     alcune famiglie di matrici confrontabili, perché generate
*     dalla stessa regola di costruzione, al crescere dell'ordine
*     di n. Analizzare e commentare i risultati

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE MATPRINT(A, N)
      REAL A(N, N)

      DO I = 1, N
         WRITE(*,*) (A(I, J), J = 1, N)
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

      SUBROUTINE COMPUTENORMS(A, N)
      REAL A(N, N), NORM1, NORM2, NORMINF
      REAL NORM_1, NORM_2, NORM_INF

      DO I = 5, N
         CALL MATWILKINSON(A, I)
         NORM1 = NORM_1(A, I)
         NORM2 = NORM_2(A, I)
         NORMINF = NORM_INF(A, I)
         WRITE(1,*) I, NORM1
         WRITE(2,*) I, NORM2
         WRITE(3,*) I, NORMINF
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      PROGRAM MAIN

*     MAx order of the matrix
      PARAMETER (N = 15)

      REAL A(N, N)

      CALL COMPUTENORMS(A, N)
      END

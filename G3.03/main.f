*     Verificare le seguenti relazioni tra le norme matriciali studiate:
*     TODO: inserire le relazioni

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

*     Computes the maximum absolute value of the matrix
      REAL FUNCTION MATRIXMAXABS(A, N)
      REAL A(N, N), MAX_TEMP

      MAX_TEMP = A(1, 1)

      DO J = 1, N
         DO I = 1, N
            IF (ABS(A(I, J)) .GT. MAX_TEMP) THEN
               MAX_TEMP = A(I, J)
            ENDIF
         ENDDO
      ENDDO

      MATRIXMAXABS = MAX_TEMP
     
      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE CHECKTHESES(A, N)

      REAL A(N, N)
      REAL NORM1, NORM2, NORMINF
      REAL NORM_1, NORM_2, NORM_INF
      REAL TERM1, TERM2, TERM3
      REAL ORDER
      REAL MATRIXMAXABS

      ORDER = N

      NORM1 = NORM_1(A, N)
      NORM2 = NORM_2(A, N)
      NORMINF = NORM_INF(A, N)

*     TH 1
*
*     .  1                                     _
*     . ---  || A ||     <=   || A ||   <=   \/n || A ||
*     .   _         inf              2                  inf
*     . \/n
      TERM1 = (1.0/SQRT(ORDER)) * NORMINF
      TERM2 = NORM2
      TERM3 = SQRT(ORDER) * NORMINF
      WRITE(*,*) 'Th. 1:', TERM1, '<=', TERM2, '<=', TERM3

      IF (TERM1 .LE. TERM2 .AND. TERM2 .LE. TERM3) THEN
         WRITE(*,*) 'Verificato'
      ELSE
         WRITE(*,*) 'NON verificato'
      ENDIF

*     TH 2
*
*     .  1                                     _
*     . ---  || A ||     <=   || A ||   <=   \/n || A ||
*     .   _         1                2                  1
*     . \/n
      TERM1 = (1.0/SQRT(ORDER)) * NORM1
      TERM2 = NORM2
      TERM3 = SQRT(ORDER) * NORM1
      WRITE(*,*) 'Th. 2:', TERM1, '<=', TERM2, '<=', TERM3

      IF (TERM1 .LE. TERM2 .AND. TERM2 .LE. TERM3) THEN
         WRITE(*,*) 'Verificato'
      ELSE
         WRITE(*,*) 'NON verificato'
      ENDIF

*     TH 3
*
*     .
*     .  MAX | A(i, j) |    <=   || A ||   <=  n * MAX | A(i, j) |
*     .  i,j                            2          i,j
*     .
      TERM1 = MATRIXMAXABS(A, N)
      TERM2 = NORM2
      TERM3 = N * TERM1
      WRITE(*,*) 'Th. 3:', TERM1, '<=', TERM2, '<=', TERM3

      IF (TERM1 .LE. TERM2 .AND. TERM2 .LE. TERM3) THEN
         WRITE(*,*) 'Verificato'
      ELSE
         WRITE(*,*) 'NON verificato'
      ENDIF

*     TH 4
*
*     .                  _______________________
*     .  || A ||   <=  \/ || A ||  *  || A ||
*     .         2                1           inf
*     .
      TERM1 = NORM2
      TERM2 = SQRT(NORM1 * NORMINF)
      WRITE(*,*) 'Th. 4:', TERM1, '<=', TERM2

      IF (TERM1 .LE. TERM2) THEN
         WRITE(*,*) 'Verificato'
      ELSE
         WRITE(*,*) 'NON verificato'
      ENDIF

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      PROGRAM MAIN

      PARAMETER (N = 7)

      REAL A(N, N), B(N, N), C(N, N)

      WRITE(*,*) 'Genero matrici di ordine', N
      WRITE(*,*) ''

      CALL MATWILKINSON(A, N)
      CALL MATHILBERT(B, N)
      CALL MATTOEPLITZ(C, N)

      WRITE(*,*) 'Matrice di Wilkinson:'
      CALL CHECKTHESES(A, N)
      WRITE(*,*) ''

      WRITE(*,*) 'Matrice di Hilbert:'
      CALL CHECKTHESES(B, N)
      WRITE(*,*) ''

      WRITE(*,*) 'Matrice di Toeplitz:'
      CALL CHECKTHESES(C, N)
      WRITE(*,*) ''

      END

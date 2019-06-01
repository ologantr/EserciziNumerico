*     TODO: scrivere esercizio

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*     Build an identity matrix of order N
      SUBROUTINE IDENTITYMATRIX(A, N)
      REAL A(N, N)

      DO I = 1, N
         DO J = 1, N
            IF (I .EQ. J) THEN
               A(I, J) = 1
            ELSE
               A(I, J) = 0
            ENDIF
         ENDDO
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*     Copies B into A
      SUBROUTINE MATRIXCPY(A, B, N)
      REAL A(N, N), B(N, N)

      DO I = 1, N
         DO J = 1, N
            A(I, J) = B(I, J)
         ENDDO
      ENDDO

      END

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

      SUBROUTINE GAUSSJORDAN(A, ID, N)
*     A is the matrix, I is the matrix inverse
*     B is the known vector and N is the order of the matrix

      REAL A(N, N), ID(N, N), COPY(N, N)
      REAL MAX_VAL, TEMP, Q
      INTEGER L, NSCAMBI

      NSCAMBI = 0

      CALL MATRIXCPY(COPY, A, N)

      DO K = 1, N - 1
         MAX_VAL = A(K, K)
         L = K
         DO I = K, N
            TEMP = ABS(A(I, K))
            IF (MAX_VAL .LT. TEMP) THEN
               MAX_VAL = TEMP
               L = I
            ENDIF
         ENDDO
         IF (MAX_VAL .EQ. 0) THEN
            STOP
         ENDIF
         IF (K .NE. L) THEN
            DO J = 1, N
               NSCAMBI = NSCAMBI + 1
               TEMP = COPY(K, J)
               COPY(K, J) = COPY(L, J)
               COPY(L, J) = TEMP
               TEMP = ID(K, J)
               ID(K, J) = ID(L, J)
               ID(L, J) = TEMP
            ENDDO
         ENDIF
         DO I = K + 1, N
            Q = COPY(I, K) / COPY(K, K)
            DO J = K, N
               COPY(I, J) = (COPY(I, J)-(Q*COPY(K, J)))
            ENDDO
            DO J = 1, N
               ID(I, J) = (ID(I, J)-(Q*ID(K, J)))
            ENDDO
         ENDDO
      ENDDO
      IF (COPY(N, N) .EQ. 0) THEN
         STOP
      ENDIF
      DO K = N, 1, -1
         DO I = 1, K - 1
            Q = COPY(I, K) / COPY(K, K)
            DO J = 1, K
               COPY(I, J) = (COPY(I, J)-Q*COPY(K, J))
            ENDDO
            DO J = 1, N
               ID(I, J) = (ID(I, J) - Q*ID(K, J))
            ENDDO
         ENDDO
         DO J = 1, N
            ID(K, J) = (ID(K, J)/COPY(K, K))
         ENDDO
      ENDDO
      END

      PROGRAM MAIN
      PARAMETER (N = 5)
      REAL A(N, N), B(N, N)
      CALL MATWILKINSON(A, N)
      CALL IDENTITYMATRIX(B, N)
      CALL GAUSSJORDAN(A, B, N)
      CALL MATPRINT(B, N)
      END

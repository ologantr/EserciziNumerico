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

      SUBROUTINE MATPRINT(A, N)
      REAL A(N, N)

      DO I = 1, N
         WRITE(*,*) (A(I, J), J = 1, N)
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*     Computes the B vector so that the X vector is made up of ones.
      SUBROUTINE COMPUTEBVECTOR(A, B, N)

      REAL A(N, N), B(N), STEMP

      STEMP = 0

      DO I = 1, N
         DO J = 1, N
            STEMP = STEMP + A(I, J)
         ENDDO
         B(I) = STEMP
         STEMP = 0
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE TOZERO(A, B, N)

      REAL A(N, N), B(N), R, TEMP, PIVOT
      INTEGER Y, P_POS

*     A is the matrix of the linear system
*     B is the constant vector

      DO K = 1, N-1
         PIVOT = 0
         DO I = K, N
            IF (ABS(A(I, K)) .GT. PIVOT) THEN
               PIVOT = A(I, K)
               P_POS = I
            ENDIF
         ENDDO

*        This equality comparison can give errors, it may be better to see if
*        PIVOT is less or equal than epsilon (machine precision), but in this case
*        it is unnecessary
         IF (PIVOT .EQ. 0) THEN
            STOP
         ELSE
            IF (K .NE. P_POS) THEN
               DO Y = 1, N
*                 Swap row k with row p_pos
                  TEMP = A(K, Y)
                  A(K, Y) = A(P_POS, Y)
                  A(P_POS, Y) = TEMP
                  TEMP = B(K)
                  B(K) = B(P_POS)
                  B(P_POS) = TEMP
               ENDDO
            ENDIF

            DO I = K+1, N
               R = A(I, K)/A(K, K)
               DO J = K, N
                  A(I, J) = A(I, J) - R*A(K, J)
               ENDDO
               B(I) = B(I) - R*B(K)
            ENDDO
         ENDIF
      ENDDO

*     Same thing here for equality comparison
      IF (A(N, N) .EQ. 0) THEN
         STOP
      ENDIF

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE BACKSUB(A, B, N, X)

      REAL A(N, N), X(N), B(N)

      DO I = 1, N-1
         X(I) = 0
      ENDDO

      X(N) = B(N)/A(N, N)

      DO I = N-1, 1, -1
         X(I) = B(I)
         DO J = I + 1, N
            X(I) = X(I) - A(I, J)*X(J)
         ENDDO
         X(I) = X(I)/A(I, I)
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      REAL FUNCTION RNORM1(V, N)
      REAL V(N)

      RNORM1 = 0

      DO I = 1, N
         RNORM1 = RNORM1 + ABS(V(I))
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      REAL FUNCTION SOLERROR(X, N)
      REAL X(N), ERRX(N), SOL(N), NORMERRX, NORMSOL

      DO I = 1, N
         SOL(I) = 1
         ERRX(I) = SOL(I) - X(I)
      ENDDO

      NORMSOL = RNORM1(SOL, N)
      NORMERRX = RNORM1(ERRX, N)
      SOLERROR = NORMERRX/NORMSOL

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

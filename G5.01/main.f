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

      SUBROUTINE COMPUTEBVECTOR(A, N)

      REAL A(N, N), STEMP

      STEMP = 0

      DO I = 1, N
         DO J = 1, N
            STEMP = STEMP + A(I, J)
         ENDDO
         A(I, N+1) = STEMP
         STEMP = 0
      ENDDO

      END
     
*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE TOZERO(A, N)

      REAL A(N, N), R, TEMP, PIVOT
      INTEGER Y, P_POS

*     A is the complete matrix of the linear system

      DO K = 1, N-1
         PIVOT = 0.0
         DO I = K, N
            IF (ABS(A(I, K)) .GT. PIVOT) THEN
               PIVOT = A(I, K)
               P_POS = I
            ENDIF
         ENDDO

         IF (PIVOT .EQ. 0) THEN
            STOP
         ELSE
            IF (K .NE. P_POS) THEN
               DO Y = 1, N+1
*                 Swap row k with row
                  TEMP = A(K, Y)
                  A(K, Y) = A(P_POS, Y)
                  A(P_POS, Y) = TEMP
               ENDDO
            ENDIF
           
            DO I = K+1, N
               R = A(I, K)/A(K, K)
               DO J = K, N
                  A(I, J) = A(I, J) - R*A(K, J)
               ENDDO
               A(I, N+1) = A(I, N+1) - R*A(K, N+1)
            ENDDO
         ENDIF
      ENDDO

      IF (A(N, N) .EQ. 0) THEN
         STOP
      ENDIF

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

      SUBROUTINE BACKSUB(A, N, X)

      REAL A(N, N), X(N)

      DO I = 1, N-1
         X(I) = 0
      ENDDO

      X(N) = A(N, N+1)/A(N, N)

      DO I = N-1, 1, -1
         X(I) = A(I, N+1)
         DO J = I + 1, N
            X(I) = X(I) - A(I, J)*X(J)
         ENDDO
         X(I) = X(I)/A(I, I)
      ENDDO

      END

*     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
      
      PROGRAM MAIN
      PARAMETER (N = 7)
      REAL A(N, N+1), X(N)

      CALL MATTOEPLITZ(A, N)
      CALL COMPUTEBVECTOR(A, N)
      CALL TOZERO(A, N)
      CALL MATPRINT(A, N)

      CALL BACKSUB(A, N, X)

      WRITE(*,*) ''
      WRITE(*,*) (X(I), I = 1, N)

      END

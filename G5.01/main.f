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

      SUBROUTINE COMPUTEBVECTOR(A, N, B)

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

      REAL A(N, N), B(N), R, TEMP
      INTEGER Y

      DO I = 1, N-1
         IF (A(I,I) .EQ. 0) THEN
            DO J = I + 1, N
               IF (A(J, I) .NE. 0) THEN
*                 Swap row i with row j
                  DO Y = 1, N
                     TEMP = A(I, Y)
                     A(I, Y) = A(J, Y)
                     A(J, Y) = TEMP
                  ENDDO
               ELSE IF (J .EQ. N) THEN
                  WRITE(*,*) 'Matrix is singular'
                  STOP
               ENDIF
            ENDDO
         ELSE
            DO K = I + 1, N
               R = A(K, I)/A(I, I)
               DO J = 1, N
                  A(K, J) = A(K, J) - R*A(I, J)
               ENDDO
               B(K) = B(K) - R*B(I)
            ENDDO
         ENDIF
      ENDDO

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
      
      PROGRAM MAIN
      PARAMETER (N = 10)
      REAL A(N, N), B(N), X(N)

      CALL MATTOEPLITZ(A, N)
      CALL COMPUTEBVECTOR(A, N, B)
      WRITE(*,*) (B(I), I = 1, N)
      WRITE(*,*) ''
      CALL TOZERO(A, B, N)
      CALL MATPRINT(A, N)

      WRITE(*,*) ''
      WRITE(*,*) (B(I), I = 1, N)

      CALL BACKSUB(A, B, N, X)

      WRITE(*,*) ''
      WRITE(*,*) (X(I), I = 1, N)

      END

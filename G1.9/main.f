*     Date due matrici di ordine N calcolare la matrice somma

      SUBROUTINE MATRIXSUM(A, B, R, N)
      INTEGER N
      INTEGER A(N, N), B(N, N), R(N, N)
      DO I = 1, N
         DO J = 1, N
            R(I, J) = A(I, J) + B(I, J)
         ENDDO
      ENDDO
      END

      SUBROUTINE PRINTMATRIX(A, N)
      INTEGER A(N, N)
      DO I = 1, N
         WRITE(*,*) (A(I, J), J = 1, N)
      ENDDO
      END

      PROGRAM MAIN
      PARAMETER (N = 5)
      INTEGER A(N, N), B(N, N), R(N, N)
      WRITE(*,*) 'Insert the first matrix (5x5 max): '
      READ(*,*) ((A(I, J), J = 1, N), I = 1, N)
      WRITE(*,*) 'Insert the second matrix (5x5 max): '
      READ(*,*) ((B(I, J), J = 1, N), I = 1, N)
      CALL MATRIXSUM(A, B, R, N)
      WRITE(*,*) 'Sum Matrix: '
      CALL PRINTMATRIX(R, N)
      END

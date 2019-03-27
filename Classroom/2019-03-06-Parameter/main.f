      SUBROUTINE MAT_PRINT(A, M, N)
      REAL A(M, N)

      DO I = 1, M
         WRITE(*,*) (A(I, J), J=1, N)
      ENDDO

      END


      SUBROUTINE MAT_READ(A, M, N)
      REAL A(M, N)

      DO I = 1, M
         READ(*,*) (A(I, J), J=1, N)
      ENDDO

      END


      PROGRAM MAIN

      PARAMETER (MDIM = 3)

      REAL A(MDIM, MDIM)
      INTEGER N

      N = 2

      CALL MAT_READ(A, MDIM, N)
      CALL MAT_PRINT(A, MDIM, N)

      END

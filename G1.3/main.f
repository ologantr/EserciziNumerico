*     Scrivere i programmi per la sommatoria e produttoria di
*     n numeri reali e complessi.

      REAL FUNCTION RSUM(X, N)
      REAL X(N)
      RSUM = 0
      DO I = 1, N
         RSUM = RSUM + X(I)
      ENDDO
      END


      COMPLEX FUNCTION CSUM(X, N)
      COMPLEX X(N)
      CSUM = 0
      DO I = 1, N
         CSUM = CSUM + X(I)
      ENDDO
      END

      REAL FUNCTION RPROD(X, N)
      REAL X(N)
      RPROD = 1
      DO I = 1, N
         RPROD = RPROD * X(I)
      ENDDO
      END

      COMPLEX FUNCTION CPROD(X, N)
      COMPLEX X(N)
      CPROD = 1
      DO I = 1, N
         CPROD = CPROD * X(I)
      ENDDO
      END

      PROGRAM MAIN
      REAL X(100), S, RSUM, RPROD, PR
      COMPLEX Y(100), SC, CSUM, CPROD, CPR
      INTEGER N, M
      WRITE(*,*) ' Insert the number of components: '
      READ(*,*) N
      WRITE(*,*) 'Insert the components: '
      READ(*,*) (X(I), I = 1, N)
      S = RSUM(X, N)
      PR = RPROD(X, N)
      WRITE(*,*) S, PR
      WRITE(*,*) ' Insert the number of components: '
      READ(*,*) M
      WRITE(*,*) 'Insert the components: '
      READ(*,*) (Y(I), I = 1, M)
      SC = CSUM(Y, M)
      CPR = CPROD(Y, M)
      WRITE(*,*) SC, CPR
      END

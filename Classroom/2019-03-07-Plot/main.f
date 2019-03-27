      REAL FUNCTION F(X)
      F = X / ((X ** 2) + 1)
      END

      PROGRAM MAIN

      REAL A, B
      INTEGER N
      REAL X(0:1000), Y(0:1000)

      WRITE(*,*) 'Inserisci A'
      READ(*,*) A

      WRITE(*,*) 'Inserisci B'
      READ(*,*) B

      WRITE(*,*) 'Inserisci N'
      READ(*,*) N

      N = N - 1
      H = (B - A) / N

*     Compute first point
      X(0) = A
      Y(0) = F(X(0))

*     Compute all points between the first and the last
      DO I = 1, N - 1
         X(I) = X(I - 1) + H
         Y(I) = F(X(I))
      ENDDO

*     Compute last point
      X(N) = B
      Y(N) = F(X(N))

*     Print out computed points
      DO I = 0, N
         WRITE(1,*) X(I), Y(I)
      ENDDO

      END

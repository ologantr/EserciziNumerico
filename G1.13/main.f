      REAL FUNCTION F(X)
      F = 1/(25*(X*X) + 1)
      END

      REAL FUNCTION G(X)
      G = X/(1 + (X*X))
      END

      REAL FUNCTION J(X)
      J = ABS(X)
      END

      SUBROUTINE PLOTF(A, B, N, FN, X, Y)
      REAL H, X(0:N), Y(0:N)
      INTEGER N, I, FN
      H = (B - A) / N
      X(0) = A
      Y(0) = F(X(0))
      DO I = 1, N - 1
         X(I) = X(I - 1) + H
         Y(I) = F(X(I))
      ENDDO
      X(N) = B
      Y(N) = F(X(N))
      DO I = 0, N
         WRITE(FN,*) X(I), Y(I)
      ENDDO
      END

      SUBROUTINE PLOTG(A, B, N, FN, X, Y)
      REAL H, X(0:N), Y(0:N)
      INTEGER N, I, FN
      H = (B - A) / N
      X(0) = A
      Y(0) = G(X(0))
      DO I = 1, N - 1
         X(I) = X(I - 1) + H
         Y(I) = G(X(I))
      ENDDO
      X(N) = B
      Y(N) = G(X(N))
      DO I = 0, N
         WRITE(FN,*) X(I), Y(I)
      ENDDO
      END

      SUBROUTINE PLOTJ(A, B, N, FN, X, Y)
      REAL H, X(0:N), Y(0:N), J
      INTEGER N, I, FN
      H = (B - A) / N
      X(0) = A
      Y(0) = J(X(0))
      DO I = 1, N - 1
         X(I) = X(I - 1) + H
         Y(I) = J(X(I))
      ENDDO
      X(N) = B
      Y(N) = J(X(N))
      DO I = 0, N
         WRITE(FN,*) X(I), Y(I)
      ENDDO
      END

      PROGRAM MAIN
      REAL X(0:1000), Y(0:1000)
      OPEN(UNIT=10, FILE='fx.dat', ACTION='WRITE')
      OPEN(UNIT=11, FILE='gx1.dat', ACTION='WRITE')
      OPEN(UNIT=12, FILE='gx2.dat', ACTION='WRITE')
      OPEN(UNIT=13, FILE='hx1.dat', ACTION='WRITE')
      OPEN(UNIT=14, FILE='hx2.dat', ACTION='WRITE')
      CALL PLOTF(-1.0, 1.0, 1000, 10, X, Y)
      CALL PLOTG(-10.0, 10.0, 1000, 11, X, Y)
      CALL PLOTG(-1.0, 1.0, 1000, 12, X, Y)
      CALL PLOTJ(-3.0, 4.0, 1000, 13, X, Y)
      CALL PLOTJ(-2.0, 2.0, 1000, 14, X, Y)
      END
